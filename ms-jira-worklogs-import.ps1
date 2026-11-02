param(
    [Parameter(Mandatory = $true)]
    [string]$CsvPath
)

# À configurer
$JiraBaseUrl = "https://votre-domaine.atlassian.net"
$Email       = "vous@exemple.com"

# Le token est demandé à l'exécution et n'est pas enregistré dans le script.
$SecureToken = Read-Host "Token API Jira" -AsSecureString
$Token = [System.Net.NetworkCredential]::new("", $SecureToken).Password

# Authentification Basic : adresse e-mail + API token.
$AuthText = "${Email}:$Token"
$AuthBytes = [System.Text.Encoding]::UTF8.GetBytes($AuthText)
$AuthHeader = [Convert]::ToBase64String($AuthBytes)

$Headers = @{
    Authorization = "Basic $AuthHeader"
    Accept        = "application/json"
}

function Convert-DurationToSeconds([string]$Value) {
    # Formats acceptés : 90m, 1h, 1h 30m, 1d 2h.
    $text = $Value.Trim()
    $pattern = '(?i)(\d+)\s*([wdhm])'
    $matches = [regex]::Matches($text, $pattern)

    if ($matches.Count -eq 0) {
        throw "Durée non reconnue : '$Value'. Exemple attendu : 1h 30m."
    }

    # Vérifie qu'il ne reste aucun caractère autre que des espaces
    # après avoir retiré les éléments reconnus.
    $remaining = [regex]::Replace($text, $pattern, '').Trim()
    if ($remaining.Length -gt 0) {
        throw "Format de durée invalide : '$Value'. Exemple attendu : 1h 30m."
    }

    $seconds = 0
    foreach ($match in $matches) {
        $number = [int]$match.Groups[1].Value
        $unit = $match.Groups[2].Value.ToLowerInvariant()

        switch ($unit) {
            'w' { $seconds += $number * 5 * 8 * 3600 } # semaine Jira : 5 jours de 8 h
            'd' { $seconds += $number * 8 * 3600 }     # jour Jira : 8 h
            'h' { $seconds += $number * 3600 }
            'm' { $seconds += $number * 60 }
        }
    }

    if ($seconds -le 0) {
        throw "La durée doit être supérieure à zéro."
    }

    return $seconds
}

$Rows = Import-Csv -Path $CsvPath

foreach ($Row in $Rows) {
    try {
        if ([string]::IsNullOrWhiteSpace($Row.key) -or
            [string]::IsNullOrWhiteSpace($Row.startDate) -or
            [string]::IsNullOrWhiteSpace($Row.duration)) {
            throw "Une colonne obligatoire est vide : key, startDate ou duration."
        }

        $Seconds = Convert-DurationToSeconds $Row.duration

        # Convertit la date en ISO 8601 avec millisecondes et décalage horaire.
        $StartDate = [DateTimeOffset]::Parse(
            $Row.startDate,
            [Globalization.CultureInfo]::InvariantCulture
        )
        $Started = $StartDate.ToString(
            "yyyy-MM-dd'T'HH:mm:ss.fffzzz",
            [Globalization.CultureInfo]::InvariantCulture
        ) -replace '([+-]\d{2}):(\d{2})$', '$1$2'

        $Body = @{
            timeSpentSeconds = $Seconds
            started          = $Started
        }

        if (-not [string]::IsNullOrWhiteSpace($Row.comment)) {
            $Body.comment = @{
                type    = "doc"
                version = 1
                content = @(
                    @{
                        type    = "paragraph"
                        content = @(
                            @{
                                type = "text"
                                text = $Row.comment
                            }
                        )
                    }
                )
            }
        }

        $Json = $Body | ConvertTo-Json -Depth 10
        $IssueKey = [uri]::EscapeDataString($Row.key)
        $Url = "$JiraBaseUrl/rest/api/3/issue/$IssueKey/worklog?adjustEstimate=leave"

        Invoke-RestMethod `
            -Method Post `
            -Uri $Url `
            -Headers $Headers `
            -ContentType "application/json; charset=utf-8" `
            -Body $Json | Out-Null

        Write-Host "OK: $($Row.key) — $($Row.duration) — $($Row.startDate)"
    }
    catch {
        Write-Host "ERROR: '$($Row.key)' : $($_.Exception.Message)" -ForegroundColor Red
    }
}