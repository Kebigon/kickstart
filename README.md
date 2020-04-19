# kickstart.kebigon.xyz: Fedora kickstart configuration

This repository contains scripts I use to build a custom Fedora kickstart file with settings and programs installed for my personal usages:
* Protect my privacy
* Learn Japanese
* File encryption and synchronization


# What's installed ?

## Hosts file

[StevenBlack's hosts file](https://github.com/StevenBlack/hosts) is installed on the system, and updated everyday at 20:00 via a cron job located at /etc/cron.d/hosts.

[Installation script](_includes/post.hosts.sh)
[Hosts cron job](config/hosts.cron)

## Firefox

The add-ons are installed using [firefox-extension-manager](https://github.com/NicolasBernaerts/ubuntu-scripts).

[Installation script](_includes/post.firefox.sh)

### Home profiles

This profile is using [ghacks' user.js](https://github.com/ghacksuserjs/ghacks-user.js). This file is saved at /etc/firefox/user.js, and updated everyday at 20:00 via a cron job located at /etc/cron.d/user.js.

The home profile have the below add-ons installed:

| Add-on                                                                                | License          |
| ------------------------------------------------------------------------------------- | ---------------- |
| [uBlock Origin](https://addons.mozilla.org/firefox/addon/ublock-origin)               | GPL-3.0-only     |
| [HTTPS Everywhere](https://addons.mozilla.org/firefox/addon/https-everywhere)         | GPL-2.0-or-later |
| [Privacy Badger](https://addons.mozilla.org/firefox/addon/privacy-badger17)           | GPL-3.0-only     |
| [Decentraleyes](https://addons.mozilla.org/firefox/addon/decentraleyes)               | MPL-2.0          |
| [Temporary Containers](https://addons.mozilla.org/firefox/addon/temporary-containers) | MIT              |
| [Rikaichamp](https://addons.mozilla.org/firefox/addon/rikaichamp)                     | MPL-2.0          |

[Hosts cron job](config/user.js.cron)

### Work profile

The work profile have the below add-ons installed:

| Add-on                                                                                | License          |
| ------------------------------------------------------------------------------------- | ---------------- |
| [uBlock Origin](https://addons.mozilla.org/firefox/addon/ublock-origin)               | GPL-3.0-only     |
| [HTTPS Everywhere](https://addons.mozilla.org/firefox/addon/https-everywhere)         | GPL-2.0-or-later |
| [Privacy Badger](https://addons.mozilla.org/firefox/addon/privacy-badger17)           | GPL-3.0-only     |
| [Decentraleyes](https://addons.mozilla.org/firefox/addon/decentraleyes)               | MPL-2.0          |
| [Rikaichamp](https://addons.mozilla.org/firefox/addon/rikaichamp)                     | MPL-2.0          |
| [React Developer Tools](https://addons.mozilla.org/firefox/addon/react-devtools)      | MIT              |

## Other programs

| Program                                  | License           | Installation script                                    |
| ---------------------------------------- | ----------------- | ------------------------------------------------------ |
| [Anki](https://apps.ankiweb.net)         | AGPL-3.0-or-later | [post.anki.sh](_includes/post.anki.sh)                 |
| [Eclipse](https://www.eclipse.org/)      | EPL-2.0           | [post.eclipse.sh](_includes/post.eclipse.sh)           |
| [FreeFileSync](https://freefilesync.org) | GPL-3.0-only      | [post.freefilesync.sh](_includes/post.freefilesync.sh) |
| [VeraCrypt](https://www.veracrypt.fr)    | Apache-2.0        | [post.veracrypt.sh](_includes/post.veracrypt.sh)       |
