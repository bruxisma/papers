# Archived

This repository has been archived as I am no longer participating in the C++ standards committee

# Overview

This repository contains all papers and proposals for WG21 (The C++ Standards
Committee). The state of the repository has fallen by the wayside over the past
few years, so some links or files may be out of date or incorrect. Work is
being done to bring the state of everything up to date.

Papers are currently written in the [bikeshed] format, and are stored under the
`src/` directory. A Makefile is provided. Currently only [ripgrep] is required
as a dependency for building. Papers are currently automatically built via a
GitHub Action workflow.

# 🚧 TODO 🚧

🚧: Eventually, all papers (and their various revisions) will be deployed
to a [Netlify] site.

🚧 The current 'list' of proposals below is abysmal, and it will be revamped or
redesigned at some point in the near future to better work with the automation
steps used. Until that time, however, it will exist in its current state, but
will not be kept up to date.

🚧 It is currently painful to bring the github actions VM up to speed. A
docker/shell form might be used in the meantime.

# Current Proposals

|  Number |                    Title                    |          Standard         |                     Status                    |
|:-------:|:-------------------------------------------:|:-------------------------:|:---------------------------------------------:|
| [P0468] |           Intrusive Smart Pointer           |        C++23 (UGH)        |                  Sent to LEWG                 |
| [P1272] |          Byteswapping for fun&&nuf          |           C++20           |                  Sent to LWG                  |
| [P1273] |       86 The Absurd (From Exceptions)       |         Post C++23        |           Likely Dead Once Presented          |
| [P1274] |             A Bang For The Buck?            |           C++23           |               Not Yet Presented               |
| [P1275] |               Desert Sessions               |          C++23(?)         |              Pending SG16 Papers              |
| [P1276] |                  Void Main                  | Dependent on Modular Main |                 EWGI Feedback                 |
| [P1277] |             Subscripts on Parade            |           C++23           |             Superseded by [P2128]             |
| [P1278] |         offsetof for the Modern Era         |           C++23           |        Presented Without Author Present       |
| [P1279] |               std::breakpoint               |           C++23           |               Presented to SG20               |
| [P1280] |            Integer Width Literals           |           C++20           |                  Sent to LWG                  |
| [P1281] |             Feature Presentation            |            N/A            |              Withdrawn/Postponed              |
| [P1282] | Ceci N'est Pas Une Pipe: Workflow Operators |           C++23           |               Not Yet Presented               |
| [P1283] |              Sharing is Caring              |           C++23           |                 EWGI Feedback                 |
| [P1302] |       Implicit Module Partition Lookup      |           C++20           |                    Rejected                   |
| [P1303] |           Inline Module Partitions          |           C++23           | Rejected (Refocusing for Conditional Imports) |
| [P1304] |           Simplify Extern Template          |           C++23           |        Not Yet Presented (Bad Wording)        |
| [P1305] |       Deprecate the Addressof Operator      |           C++20           |                    Rejected                   |

[bikeshed]: https://github.com/tabatkins/bikeshed
[ripgrep]: https://github.com/burntsushi/ripgrep
[Netlify]: https://netlify.com
[P0468]: #
[P1272]: #
[P1273]: #
[P1274]: #
[P1275]: #
[P1276]: #
[P1277]: #
[P1278]: #
[P1279]: #
[P1280]: #
[P1281]: #
[P1282]: #
[P1283]: #
[P1302]: #
[P1303]: #
[P1304]: #
[P1305]: #

[P2128]: https://wg21.link/P2128
