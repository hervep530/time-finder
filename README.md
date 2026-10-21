# 🕒 TimeFinder

A simple, standalone time-tracking tool to keep track of your work, your way.

## 🤔 Why TimeFinder?

TimeFinder is designed to make time tracking simple, fast, and flexible.

- 🔒 **Standalone and local** — No external dependencies, no network requests. Your data stays in your browser.
- 🛡️ **Privacy first** — No personal data is collected or sent anywhere. The only external identifiers you may use are Jira task IDs.
- ⚡ **Instant response** — No cloud requests, no waiting. Just start tracking and focus on your work.
- 💾 **Your data, your choice** — Data is stored in your browser's LocalStorage. You can import or export your complete data (settings + records), or export and import records only.
- 🧭 **Simple workflow** — Select your task, category, and subcategory if needed, click Start, and get back to work.
- ✏️ **Flexible time tracking** — Add or modify records manually whenever you need to correct or complete your tracking.
- 📋 **Jira-friendly reporting** — Quickly copy and paste your time records into Jira, keeping your reporting aligned with your company's workflow.
- 📝 **Your own record of activity** — Keep a personal record of your work, independently of the information required by your official reporting tools.
- 📊 **Personal analytics** — Get a simple overview of your activity based on your own categories and subcategories.

> ⚠️ **Important: Protect your data!**
>
> TimeFinder stores its data in your browser's LocalStorage. If your browser or your system automatically clears website data, your records may be lost.
>
> Export your data regularly, especially during your working day, if your browser is configured to clear its data automatically.
>
> If you cannot rely on persistent browser storage, using TimeFinder may become inconvenient.

## 🚀 Quick Start

Before getting started, you can choose your preferred language and theme from the top menu.

1. **Configure your settings.** Start by defining your categories and subcategories to match the way you want to track your activity.
2. **Set up your tasks.** You can enter Jira task IDs in Settings, or add them directly when starting a new record from the Tracking view.
3. **Start tracking!** Open the Tracking view, select a task, category, and subcategory, optionally add a description, and click Start.

That's it! Keep your workflow simple and focus on your work.

## ⏱️ Tracking View

The Tracking view is where you spend most of your time.

- **Minimum duration:** Only sessions lasting more than 2 minutes are kept.
- **Automatic session handling:** You can stop a session manually. Starting a new session automatically saves the previous one and starts the next.
- **Remembered selections:** The form keeps your last choices, so starting a new session usually requires very little interaction.
- **Automatic report comments:** Your category and subcategory are combined to create your report comment. If they describe your activity accurately enough, you don't need to add a separate description.
- **Data management:** You can import or export your records directly from this view. These operations concern records only, not your settings.

To back up everything, including your settings and records, use the import/export features in the Settings view.

## 📅 Agenda View

Get a weekly overview of your activity.

- Review your recorded sessions throughout the week.
- Add missing records or modify existing ones.

This view helps you keep your time records accurate and complete.

## 📋 Report View

Prepare your time records for your official reporting tool.

- Review the information needed for your activity report.
- Copy and paste descriptions to simplify your reporting workflow.
- Depending on the capabilities of your corporate tools, you may be able to automate part of the process by copying the report and formatting it as a CSV table.

The goal is to reduce repetitive work and make reporting less tedious.

## 📊 Analytics View

This is intentionally a simple analytics view. Its usefulness depends largely on how you configure your categories and subcategories.

It can help you:

- 🔍 Identify wasted time caused by inefficient workflows or processes.
- 💡 Support improvement proposals for your team or organization with a better understanding of your activity.
- 🎯 Identify your own weaknesses and areas for improvement.
- 📚 Choose relevant training opportunities and track your progress over time.

Your personal analytics are a tool for self-improvement, not a performance score.

Use them to understand your work, identify opportunities, and make better decisions.

## ⚙️ Settings View

Settings allow you to adapt TimeFinder to your own workflow.

Configure your categories and subcategories to make tracking more flexible, meaningful, and efficient.

You can also manage your task IDs and adjust your preferences.

**And don't forget to back up your data regularly!**

Use the import/export features to preserve your settings and records, especially if your browser may clear its stored data.

## 💾 Data & Privacy

TimeFinder is designed to work locally in your browser.

- Your records and settings are stored in LocalStorage.
- No external service is required for its normal operation.
- Your data remains under your control, but it is your responsibility to back it up.

Remember that clearing your browser's stored website data may permanently delete your TimeFinder records if you have not exported them.

## 📜 License

TimeFinder is distributed under the MIT License.

See the [LICENSE](LICENSE) file for details.
