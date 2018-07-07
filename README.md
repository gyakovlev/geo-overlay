[![Build Status](https://travis-ci.org/gyakovlev/gentoo-overlay.svg?branch=master)](https://travis-ci.org/gyakovlev/gentoo-overlay)
# gyakovlev
This is my personal portage overlay for [Gentoo Linux](https://gentoo.org/)

Mirror available at [gitlab](https://gitlab.com/gyakovlev/gentoo-overlay)

I do my best to maintain ebuilds according to main repo standard.
Most packages end up in gentoo, but some may stay here forever.
WIP/Unstable packages should remain masked.

## Installation

- using [eselect-repository](https://packages.gentoo.org/packages/app-eselect/eselect-repository) (the easiest)
```sh
eselect repository enable gyakovlev
```

- using [layman](https://packages.gentoo.org/packages/app-portage/layman)
```sh
layman -a gyakovlev
```

- using wget
```sh
mkdir -p /etc/portage/repos.conf
wget  -O /etc/portage/repos.conf/gyakovlev.conf https://raw.githubusercontent.com/gyakovlev/gentoo-overlay/master/gyakovlev.conf
```

- using curl
```sh
curl -Lo /etc/portage/repos.conf/gyakovlev.conf --create-dirs https://raw.githubusercontent.com/gyakovlev/gentoo-overlay/master/gyakovlev.conf
```

## sync the repo

```sh
emaint sync -r gyakovlev
```

### Contents ([autogenerated](scripts/pre-commit))
[comment]: # (text below will be generated using pre-commit hook. this line is not visible when rendered.)
```Hack
.
├── dev-libs/
│   └── roc/
│       ├── files/
│       │   └── cmake-flags.patch
│       ├── Manifest
│       └── roc-1.8.0.ebuild
├── dev-python/
│   └── unicode-slugify/
│       ├── Manifest
│       ├── metadata.xml
│       └── unicode-slugify-0.1.3-r1.ebuild
├── dev-util/
│   ├── annobin/
│   │   ├── annobin-5.9.ebuild
│   │   ├── annobin-8.4.ebuild
│   │   ├── annobin-9999.ebuild
│   │   ├── Manifest
│   │   └── metadata.xml
│   └── shellcheck-bin/
│       ├── Manifest
│       ├── metadata.xml
│       └── shellcheck-bin-0.5.0.ebuild
├── eclass/
│   └── linux-mod.eclass
├── media-fonts/
│   └── plex/
│       ├── Manifest
│       ├── metadata.xml
│       └── plex-1.0.2.ebuild
├── media-sound/
│   └── rakarrack/
│       ├── Manifest
│       └── rakarrack-0.6.1.ebuild
├── metadata/
│   └── layout.conf
├── net-firewall/
│   ├── opensnitch/
│   │   ├── Manifest
│   │   ├── metadata.xml
│   │   └── opensnitch-20180420.ebuild
│   └── opensnitchd/
│       ├── files/
│       │   ├── opensnitchd.confd
│       │   └── opensnitchd.initd
│       ├── Manifest
│       ├── metadata.xml
│       └── opensnitchd-20180420.ebuild
├── net-news/
│   └── haxor-news/
│       ├── haxor-news-0.4.3.ebuild
│       ├── haxor-news-9999.ebuild
│       ├── Manifest
│       └── metadata.xml
├── profiles/
│   ├── package.mask
│   └── repo_name
├── scripts/
│   └── pre-commit*
├── sys-kernel/
│   └── it87/
│       ├── it87-1.1_pre20180613.ebuild
│       ├── it87-9999.ebuild
│       ├── Manifest
│       └── metadata.xml
├── x11-misc/
│   └── slstatus/
│       ├── Manifest
│       ├── metadata.xml
│       └── slstatus-9999.ebuild
├── x11-themes/
│   ├── arc-kde/
│   │   ├── arc-kde-20180614.ebuild
│   │   ├── Manifest
│   │   └── metadata.xml
│   └── papirus-icon-theme/
│       ├── Manifest
│       ├── metadata.xml
│       └── papirus-icon-theme-20180601.ebuild
├── gyakovlev.conf
└── README.md

29 directories, 51 files
```
