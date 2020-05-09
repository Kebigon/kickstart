# kickstart.kebigon.xyz: Fedora kickstart configuration

This repository contains scripts I use to build a custom Fedora kickstart file with settings and programs installed for my personal usages:
* Protect my privacy
* Learn Japanese
* File encryption and synchronization


# What's installed ?

## Hosts file

[StevenBlack's hosts file] is installed on the system, and updated everyday at 20:00 via a cron job located at /etc/cron.d/hosts.

[Installation script](_includes/post.hosts.sh)
[Hosts cron job](config/hosts.cron)

## Firefox

The add-ons are installed using [firefox-extension-manager].

[Installation script](_includes/post.firefox.sh)

### Home profiles

This profile is using [ghacks' user.js]. This file is saved at /etc/firefox/user.js, and updated everyday at 20:00 via a cron job located at /etc/cron.d/user.js.

The home profile have the below add-ons installed:

| Add-on                  | License          |
| ----------------------- | ---------------- |
| [uBlock Origin]         | GPL-3.0-only     |
| [HTTPS Everywhere]      | GPL-2.0-or-later |
| [Privacy Badger]        | GPL-3.0-only     |
| [Decentraleyes]         | MPL-2.0          |
| [ClearURLs]             | LGPL-3.0-only    |
| [Temporary Containers]  | MIT              |
| [Rikaichamp]            | MPL-2.0          |

[Hosts cron job](config/user.js.cron)

### Work profile

The work profile have the below add-ons installed:

| Add-on                  | License          |
| ----------------------- | ---------------- |
| [uBlock Origin]         | GPL-3.0-only     |
| [HTTPS Everywhere]      | GPL-2.0-or-later |
| [Privacy Badger]        | GPL-3.0-only     |
| [Decentraleyes]         | MPL-2.0          |
| [ClearURLs]             | LGPL-3.0-only    |
| [Rikaichamp]            | MPL-2.0          |
| [React Developer Tools] | MIT              |

## Other programs

| Program        | License           | Installation script                                    |
| -------------- | ----------------- | ------------------------------------------------------ |
| [Anki]         | AGPL-3.0-or-later | [post.anki.sh](_includes/post.anki.sh)                 |
| [Eclipse]      | EPL-2.0           | [post.eclipse.sh](_includes/post.eclipse.sh)           |
| [FreeFileSync] | GPL-3.0-only      | [post.freefilesync.sh](_includes/post.freefilesync.sh) |
| [VeraCrypt]    | Apache-2.0        | [post.veracrypt.sh](_includes/post.veracrypt.sh)       |


# Checklist

| Check                                                                                                | 2020/05/01 (Fedora 32) |
| ---------------------------------------------------------------------------------------------------- | ---------------------- |
| /etc/hosts exists and contains [StevenBlack's hosts file]                                            | :o:                    |
| * /etc/cron.d/hosts exists, and the content is the same as [hosts.cron](config/hosts.cron)           | :o:                    |
| * At 20:00, /etc/hosts is replaced by the latest [StevenBlack's hosts file]                          | :o:                    |
| /etc/firefox/user.js exists and contains [ghacks' user.js]                                           | :o:                    |
| * /etc/cron.d/user.js exists and the content is the same as [user.js.cron](config/user.js.cron)      | :o:                    |
| * At 20:00, /etc/firefix/user.js is replaced by the latest [ghacks' user.js]                         | :o:                    |
| Anki is present in the applications menu, starts correctly, and has the following add-ons installed: | :o:                    |
| * Japanese Support                                                                                   | :o:                    |
| * MIA Retirement                                                                                     | :o:                    |
| * MorphMan for Anki 21                                                                               | :o:                    |
| * No Penalties or Boosting                                                                           | :o:                    |
| * PassFail (EN)                                                                                      | :o:                    |
| * ResetEZ                                                                                            | :o:                    |
| Eclipse is present in the applications menu, and starts correctly                                    | :o:                    |
| * Under `Help` > `About Eclipse IDE`, the line `Lombok [...] is installed` is present                | :o:                    |
| FileZilla is present in the applications menu, and starts correctly                                  | :o:                    |
| Firefox default profile exists and has the following add-ons installed:                              | :o:                    |
| * Decentraleyes                                                                                      | :o:                    |
| * HTTPS Everywhere                                                                                   | :o:                    |
| * Privacy Badger                                                                                     | :o:                    |
| * Rikaichamp                                                                                         | :o:                    |
| * Temporary Containers                                                                               | :o:                    |
| * uBlock Origin                                                                                      | :o:                    |
| Firefox work profile exists and has the following add-ons installed:                                 | :o:                    |
| * Decentraleyes                                                                                      | :o:                    |
| * HTTPS Everywhere                                                                                   | :o:                    |
| * Privacy Badger                                                                                     | :o:                    |
| * React Developer Tools                                                                              | :o:                    |
| * Rikaichamp                                                                                         | :o:                    |
| * uBlock Origin                                                                                      | :o:                    |
| FreeFileSync is present in the applications menu, and starts correctly                               | :o:                    |
| * FreeFileSync is able to synchronize with an external hard drive                                    | :o:                    |
| * FrreFileSync is able to synchronize with a folter mounted using sshfs                              | :o:                    |
| Jitsi is present in the applications menu, and starts correctly                                      | :o:                    |
| KeePassXC is present in the applications menu, and starts correctly                                  | :o:                    |
| Notepadqq is present in the applications menu, and starts correctly                                  | :o:                    |
| Tor Browser is present in the applications menu, and starts correctly                                | :o:                    |
| VeraCrypt is present in the applications menu, and starts correctly                                  | :o:                    |
| * VeraCrypt is able to open an exfat container                                                       | :o:                    |
| VSCodium is present in the applications menu, and starts correctly                                   | :o:                    |

[StevenBlack's hosts file]: https://github.com/StevenBlack/hosts
[ghacks' user.js]: https://github.com/ghacksuserjs/ghacks-user.js

[firefox-extension-manager]: https://github.com/NicolasBernaerts/ubuntu-scripts
[uBlock Origin]: https://addons.mozilla.org/firefox/addon/ublock-origin
[HTTPS Everywhere]: https://addons.mozilla.org/firefox/addon/https-everywhere
[Privacy Badger]: https://addons.mozilla.org/firefox/addon/privacy-badger17
[Decentraleyes]: https://addons.mozilla.org/firefox/addon/decentraleyes
[ClearURLs]: https://addons.mozilla.org/firefox/addon/clearurls
[Temporary Containers]: https://addons.mozilla.org/firefox/addon/temporary-containers
[Rikaichamp]: https://addons.mozilla.org/firefox/addon/rikaichamp
[React Developer Tools]: https://addons.mozilla.org/firefox/addon/react-devtools

[Anki]: https://apps.ankiweb.net
[Eclipse]: https://www.eclipse.org
[FreeFileSync]: https://freefilesync.org
[VeraCrypt]: https://www.veracrypt.fr
