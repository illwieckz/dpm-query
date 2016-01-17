DPM query
=========


About
-----

This project provides a tool to set DPM profiles for your Radeon GPU and a Systemd service.
The service will be started before GDM (usefull if you need to change some values at computer startup because default settings are unsafe).

By default the `dpm-query` tool sets all DPM enabled cards to level `auto` and state `balanced` (system default but sometime unsafe), and the `dpm-set` service sets all DPM enabled cards to level `low` and state `battery`, which is both safe and energy saver. The service also allows members of group `video` to set DPM profiles.

The tool is installed in `/usr/bin` prefix and the service in `/lib/systemd/system/` directory.
You can edit `/etc/dpm-query/dpm.cfg` and `/etc/dpm-query/service.cfg` configuration files to change default DPM profiles or enable the user or the group you prefer.

This tool and this service were written to workaround a [Radeon driver bug](https://bugs.freedesktop.org/show_bug.cgi?id=91880) triggered by the default `auto` level, that's why the service does not use the default level to prevent GPU lockups. You can use the service for this purpose if you need it, or to set a DPM profile you want to have at startup just because you like it.

Use this tool and this service at your own risk.


How to
------

How to install/uninstall the `dpm-query` tool and service:

```sh
# clone the repository
git clone https://github.com/illwieckz/dpm-query.git

# walk in source tree
cd dpm-query

# install tool only
./configure
sudo make install

# install tool and service
./configure --enable-service
sudo make install

# uninstall
sudo make uninstall
```
How to use the `dpm-query` tool:

```sh
# set high level and performance state profile on all DPM enabled cards
dpm-query set all high performance

# check if you can set DPM profiles on selected DPM cards
dpm-query test 0,1,2

# set default on configured DPM enabled cards
dpm-query set default default default

# another way to do it
dpm-query set

# get current level and state profile for configured DPM enabled cards
dpm-query get

# read more help
dpm-query help
```

To allow `illwieckz` user only to set DPM profiles, modify the `/etc/dpm-query/service.cfg` file this way:

```
dpm_user='illwieckz'
dpm_group='root'
dpm_group_perm='no'
```

Then restart the service:

```sh
systemctl restart dpm-query.service
```

More
----

If you are a GNOME Shell user, you can try the [`radeon-dpm-control`](https://github.com/JuBan1/radeon-dpm-control) extension by Julian, which is based on `dpm-query`.


Warning
-------

No warranty is given, use this at your own risk.


Author
------

Thomas Debesse <dev@illwieckz.net>


Copyright
---------

These tool and service are distributed under the highly permissive and laconic [ISC License](COPYING.md).
