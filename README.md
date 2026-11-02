# 🕒 OwnTimeFinder - call me OTF

A simple, standalone time-tracking tool to keep track of your work, your way.

## 🤔 Why choose me?

I'm designed to make time tracking simple, fast, personalized, and flexible—all while remaining aligned with your company’s strategy.

### My Concept

- **Standalone and local** — No external dependencies, no network requests. Your data stays in your browser.
- **Privacy-first** — No personal data is collected or shared with third parties.
- **Data ownership** — Your data is stored in your browser’s *LocalStorage*. You can import or export your entire dataset (settings and records), or choose to export/import only your time entries.
- **Immediate responsiveness** — Everything is processed locally in your browser; there’s no waiting for cloud-based requests. Simply start tracking and focus on your work.
- **Streamlined workflow** — Select your task and category (with the option to add a sub-category), click "Start," and get on with your work.
- **Flexible tracking** — Manually add or edit entries whenever you need to correct or complete your records.
- **Jira compatibility** — Easily copy and paste your time logs into Jira. Or, when supported by your Jira environment, automate the process through CSV import or API integration.
- **Customized analytics** — Get a clear overview of your activity, organized according to your own categories and sub-categories.

---

### Mutual commitments between employees and the company

- **Compliance** — Create accurate time logs that align with your company’s requirements and reporting processes.
- **A human-centred, respectful approach** — Keep a record of your original time entries. This tool does not require you to conceal the actual time spent on your professional tasks.

---

> ⚠️ **Important: Protect your data!**
>
> OTF stores its data in your browser's LocalStorage. If your browser or your system automatically clears website data, your records may be lost.
>
> Export your data regularly, especially during your working day, if your browser is configured to clear its data automatically.
>
> If you cannot rely on persistent browser storage, using TimeFinder may become inconvenient.

---

## My documentation

### 🚀 Quick Start

Before getting started, you can choose your preferred language and theme from the top menu.

1. **Configure your settings.** Start by defining your categories and subcategories to match the way you want to track your activity.
2. **Set up your tasks.** You can enter Jira task IDs in Settings, or add them directly when starting a new record from the Tracking view.
3. **Start tracking!** Open the Tracking view, select a task, category, and subcategory, optionally add a description, and click Start.

That's it! Keep your workflow simple and focus on your work.

---

### ⏱️ Tracking View

The Tracking view is where you spend most of your time.

- **Minimum duration:** Only sessions lasting more than 2 minutes are kept.
- **Automatic session handling:** You can stop a session manually. Starting a new session automatically saves the previous one and starts the next.
- **Remembered selections:** The form keeps your last choices, so starting a new session usually requires very little interaction.
- **Automatic report comments:** Your category and subcategory are combined to create your report comment. If they describe your activity accurately enough, you don't need to add a separate description.
- **Data management:** You can import or export your records directly from this view. These operations concern records only, not your settings.

To back up everything, including your settings and records, use the import/export features in the Settings view.

---

### 📅 Agenda View

Get a weekly overview of your activity.

- Review your recorded sessions throughout the week.
- Add missing records or modify existing ones.

This view helps you keep your time records accurate and complete.

---

### 📋 Report View

Prepare your time records for your official reporting tool.

- Review the information needed for your activity report.
- Copy and paste descriptions to simplify your reporting workflow.
- Depending on the capabilities of your corporate tools, you may be able to automate part of the process by copying the report and formatting it as a CSV table.

The goal is to reduce repetitive work and make reporting less tedious.

---

### 📊 Analytics View

This is intentionally a simple analytics view. Its usefulness depends largely on how you configure your categories and subcategories.

It can help you:

- 🔍 Identify wasted time caused by inefficient workflows or processes.
- 💡 Support improvement proposals for your team or organization with a better understanding of your activity.
- 🎯 Identify your own weaknesses and areas for improvement.
- 📚 Choose relevant training opportunities and track your progress over time.

Your personal analytics are a tool for self-improvement, not a performance score.

Use them to understand your work, identify opportunities, and make better decisions.

---

### ⚙️ Settings View

Settings allow you to adapt TimeFinder to your own workflow.

Configure your categories and subcategories to make tracking more flexible, meaningful, and efficient.

You can also manage your task IDs and adjust your preferences.

**And don't forget to back up your data regularly!**

Use the import/export features to preserve your settings and records, especially if your browser may clear its stored data.

---


## 🤝 My friend
*Enjoy working with me, and let my friend take care of your Jira worklogs!*

For Jira users, the only annoying thing left after saving time every day is spending 20 minutes each week copying and pasting their reports into Tempo or Jira worklogs. A handy script lets you call the Jira API to import the CSV file generated in the Report view directly into Jira.
For windows user, use `ms-jira-worklogs-import`.

This script is deliberately simple. For each record in your export, the script will:
- call the Jira API cloud endpoint `$JiraBaseUrl/rest/api/3/issue/$IssueKey/worklog?adjustEstimate=leave`, where **`$IssueKey`** is the Jira issue key.
- return status OK or ERROR for each worklog.

For Windows users, follow this workflow :
> - Open a **Windows Shell console**
> - **Navigate to your import folder** (containing your CSV and PS1 files). Example : `cd $HOME\JiraImport\` 
> - **Launch import command**. Example `.\ms-jira-worklogs-import.ps1 -CsvPath .\worklogs.csv`
> - **Check the results** in the log and in Jira.

A Python version for macOS and Linux is planned.

---

## More about me

### 💾 Data & Privacy

Own Time Finder is designed to work locally in your browser.

- Your records and settings are stored in LocalStorage.
- No external service is required for its normal operation.
- Your data remains under your control, but it is your responsibility to back it up.

Remember that clearing your browser's stored website data may permanently delete your OTF records if you have not exported them.  

And if you want to check it before downloading it,... Let's go : [Own Time Finder Demo](https://hervep530.github.io/ownn-time-finder/)

---

### 📜 License

Own Time Finder is distributed under the MIT License.

See the [LICENSE](LICENSE) file for details.

---
