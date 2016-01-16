DPM query
=========

About
-----

This project provides a tool to set DPM profiles for your Radeon GPU and a Systemd service.
The service will be started before GDM (usefull if you need to change some values at computer startup because default settings are unsafe).

By default the `dpm-query` tool sets all DPM enabled cards to level `auto` and state `balanced` (system default but sometime unsafe), and the `dpm-set` service sets all DPM enabled cards to level `low` and state `battery`, which is both safe and energy saver.

The provided `Makefile` installs the tool in `/usr/bin` prefix and the service in `/lib/systemd/system/` directory.

This tool and this service were written to workaround a [Radeon driver bug](https://bugs.freedesktop.org/show_bug.cgi?id=91880) triggered by the default `auto` level, that's why the service does not use the default level to prevent GPU lockups. You can use the service for this purpose if you need it, or to set a DPM profile you want to have at startup just because you like it.

Use this tool and this service at your own risk.

How to
------

How to install/uninstall the `dpm-query` tool:

```sh
# clone the repository

git clone https://github.com/illwieckz/dpm-query.git

# walk in source tree

cd dpm-query

# install tool

make install

# uninstall tool

make uninstall
```

How to install/uninstall the `dpm-set` systemd service (optionnal):

```sh
# install service (optional, it automatically installs dpm-query)

make service

# uninstall service (optional, it automatically uninstalls dpm-query)

make unservice
```

How to use the `dpm-query` tool:

```sh
# set high level and performance state profile on all DPM enabled cards

dpm-query set all high performance

# set default on all DPM enabled cards

dpm-query set

# get current level and state profile for all DPM enabled cards

dpm-query get

# read more help

dpm-query help
```

Author
------

Thomas Debesse <dev@illwieckz.net>

Copyright
---------

This tool and service are distributed under the highly permissive and laconic [ISC License](COPYING.md).
