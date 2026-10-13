# Ledg for Claude

Ledg is bookkeeping for Canadian solo businesses and small corporations, built to work with your AI agents. Your AI agent reads your books and prepares work in them, and you review and confirm that work in Stage, Ledg's review queue. Nothing an AI agent adds to Stage counts toward your statements, sales tax totals or accountant package until you confirm it in Ledg.

Ledg is operated by PPLETC WORKS INC., a British Columbia company.

This plugin connects Claude to your Ledg books and adds two everyday workflows for a Canadian owner: recording receipts, and a month-end review.

## What's inside

| Part | What it does |
| --- | --- |
| `.mcp.json` | The Ledg connector, a remote MCP server at `https://ledg.ca/api/mcp`. You sign in on Ledg's own page and approve the connection on Ledg's consent screen. This repository holds no keys, tokens or server code. |
| `skills/record-receipts` | Records receipts, invoices and bills you share: adds a receipt's detail to the transaction it belongs to, records a purchase you paid personally, or saves the receipt until its bank transaction arrives, then tells you what was recorded and what still needs you. |
| `skills/month-end-review` | Finds entries that still need a category and proposes categories for you to approve, checks GST/HST and PST collected for the period, and lists upcoming deadlines. |
| `openai/`, `scripts/build-openai-zip.sh` | The files for the ChatGPT and Codex version of this plugin, and the script that packages them into a ZIP. Claude does not load or run them. |

In Claude Code the skills run as `/ledg:record-receipts` and `/ledg:month-end-review`. In a Claude chat, type `/` to pick one. Claude also uses them on its own when your request matches.

## What the connector can do

Ledg's consent screen lists what the connection can read, add and change, and which of your businesses it works in, before you approve it. It works only in your businesses that are on Ledg's Solo plan.

**Read your books.** Your businesses and their settings, including what Ledg still needs to know; accounts and balances; categories; sales, expenses, and GST/HST and PST collected; transactions by date, amount or supplier; entries waiting in Stage; purchases with no PST recorded; closed periods; upcoming tax deadlines; your revenue goal; notes on entries; receipts you saved or uploaded, including the picture; the text of bank statement PDFs you added in Ledg; minute book documents for corporations; and, for a business that is not incorporated, the T2125 details you keep in Ledg with an estimate of income tax and CPP, and a T2125 preview built from confirmed entries. A preview is not a filed return.

Figures such as the T2125 preview and the income tax estimate are worked out from your books by fixed rules; they are not tax advice, and you or your accountant decide what to claim.

**Prepare work for you to confirm.** Your AI agent can:

- save a receipt, invoice or bill, which Ledg links to its bank or statement transaction now or when that transaction arrives
- record a purchase you paid personally, in cash or with a card or account that is not in Ledg
- add a receipt's detail, such as the supplier, tax and items, to a transaction already in your books or waiting in your bank list
- set categories, and the GST/HST or PST a receipt shows, on entries waiting in Stage
- record money between you and the business as personal
- for a corporation or partnership, link a payment that pays you back for purchases you paid personally
- add the lines of a bank or credit card statement, after Ledg checks them against the opening and closing balances printed on it
- take back out a statement it added by mistake: its lines leave Stage, and Ledg keeps them so they can be put back
- record that a statement prints a charge your bank no longer lists
- leave a note on an entry, including a confirmed one; a note never changes the entry

Entries it prepares wait in Stage. A saved receipt waits for its bank transaction and is linked to it when it arrives.

**Change your business settings.** Ledg's consent screen lists this permission on its own line. With it, your AI agent can change your business settings (province, year end, start or incorporation date, business number, GST/HST and PST registration and filing frequency, payroll and dividends), the T2125 details you keep in Ledg for a business that is not incorporated (such as the industry code, kilometres, home office, other income, the CRA instalment reminders you received, and an instalment marked paid once you say you paid it), and your revenue goal. These changes apply at once, as if you made them in Ledg. Each change to your settings or T2125 details is listed in your Activity, and your goal shows on your Overview.

**What it never does.** It never confirms an entry for you, and never changes or removes an entry you have confirmed. It never changes the date or total of a transaction that came from your bank or a statement. Before it takes back out a statement whose lines you worked on, you decide in your Inbox. It never moves money, and it does not file anything with the CRA or any other government.

## Requirements

- A Ledg account with a business on Ledg's Solo plan, which includes working with an AI agent. See [ledg.ca/pricing](https://ledg.ca/pricing).
- To add plugins from Claude's directory, a Claude Pro, Max, Team or Enterprise plan. On a Team or Enterprise plan, an Owner may need to add the Ledg connector for your organization first.
- Optional: Google Drive connected in Ledg, to keep receipt originals and to read minute book documents.

The plugin works in Claude on the web and in the desktop and mobile apps, in Cowork and in Claude Code.

## Setup

1. **Add the plugin.** On claude.ai or in the Claude desktop app, open Customize, then Plugins, and find Ledg under Discover. A plugin you add there also reaches Claude Code at the next session start, and Claude Code can find it with `/plugin directory`. To try a copy of this repository in Claude Code, run `claude --plugin-dir ./ledg-plugin`.
2. **Connect your Ledg account.** On claude.ai, in the desktop app and in Cowork, open the plugin from Customize, then Plugins, select its Connectors tab, and add and connect Ledg. In Claude Code, run `/mcp`, choose `plugin:ledg:ledg`, and sign in. Your browser opens Ledg's sign-in page.
3. **Approve on Ledg's consent screen.** It lists what the connection can read, add and change, what it can never do, and which of your businesses it works in.
4. **Try it.** Ask "Which of my businesses can you see in Ledg?" In a chat, Ledg needs to be turned on under the + button, then Connectors.

To disconnect, open Settings in Ledg, then AI agents, and select Disconnect next to the app. It loses access to your books within the hour. You can also disconnect Ledg in Claude from the plugin's Connectors tab.

You can also add Ledg to Claude as a connector on its own, without the two skills, on any Claude plan; the Free plan allows one custom connector. The steps are at [ledg.ca/connect-ai/setup](https://ledg.ca/connect-ai/setup).

## Example prompts

- "Here are this week's receipts. Add them to Ledg."
- "I uploaded some receipts in Ledg. Can you read them and fill in the details?"
- "Run a month-end review for September."
- "How much GST/HST did I collect last quarter?"
- "Anything in Stage without a category? Suggest categories, and ask me before you set them."
- "Read the bank statement I added in Ledg and add its lines to Stage."
- "What tax deadlines are coming up in the next two months?"
- "Did I buy anything this year with no PST recorded?"

## Privacy Policy

- Privacy policy: [ledg.ca/privacy](https://ledg.ca/privacy), including the section on [AI assistants you connect](https://ledg.ca/privacy#connected-ai)
- Where your information is stored: [ledg.ca/privacy#hosting](https://ledg.ca/privacy#hosting)
- Security safeguards: [ledg.ca/privacy#safeguards](https://ledg.ca/privacy#safeguards)
- Who Ledg shares information with: [ledg.ca/privacy#disclose](https://ledg.ca/privacy#disclose)

**What Ledg receives.** Ledg receives the requests your AI agent sends: which tool, and the details passed with it. Those details can include a date range, the supplier, total and tax read from a receipt, the lines of a bank statement your AI agent read, a note it leaves on an entry, settings and T2125 details you ask it to change, such as your other income, and, when your AI agent passes on your answer to a question Ledg asked, your words as you gave them. Ledg answers each request from your books. The rest of your conversation, and what your AI agent does with Ledg's answers, stay with your AI agent's provider under your agreement with them.

**Receipt originals.** When Google Drive is connected in Ledg, Ledg's reply about a receipt can include a one-time link. You open it on the device that holds the photo and pick the file, and Ledg files it in your own Google Drive with that receipt. The link works once and expires within the hour. This plugin's skills pass the link on to you and never upload a file themselves. Ledg also accepts a receipt's file sent with a request by an AI agent that reads it from your own computer.

In short, as the privacy policy describes in full:

- **What Ledg collects.** Your account details, the books you keep in Ledg, and what your AI agent adds, with a note of which connection added it. For each request, Ledg also keeps a short record of which connection called which tool for which business, whether it worked and how long it took, but not the rest of what was sent or what came back.
- **How it is used and stored.** To run Ledg for you. Your books and account are kept in a database in Canada. Some service providers, including Ledg's application host, process data outside Canada, mainly in the United States. Ledg does not sell your information, does not use your books to train public machine-learning models, and does not share them with advertising networks.
- **Files.** Receipts and minute book documents you attach are stored in your own Google Drive. Bank statement PDFs you add are stored privately with your books. When your AI agent asks for one, Ledg pulls the text out on its own servers and gives it only to that AI agent.
- **Third parties.** Ledg's service providers, as the privacy policy describes, and an AI agent you connect yourself, for as long as you keep it connected. What Ledg returns to your AI agent goes to that AI agent's provider, Anthropic for Claude, whose own terms govern it.
- **Retention.** How long Ledg keeps your information, and what happens when you close your account, is set out at [ledg.ca/privacy#retention](https://ledg.ca/privacy#retention).
- **Contact.** Privacy questions go to [info@ledg.ca](mailto:info@ledg.ca).

## Support

Email [info@ledg.ca](mailto:info@ledg.ca), including to report a security issue, or use [ledg.ca/contact](https://ledg.ca/contact).

## License

MIT. See [LICENSE](LICENSE).
