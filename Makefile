all:

install:
	cp src/dpm-query /usr/bin/dpm-query

uninstall:
	rm /usr/bin/dpm-query

service: install
	cp src/dpm-set.service /lib/systemd/system/dpm-set.service
	systemctl enable dpm-set.service

unservice: uninstall
	systemctl disable dpm-set.service
	rm /lib/systemd/system/dpm-set.service
