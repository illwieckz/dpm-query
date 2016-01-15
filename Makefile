all:

install: install_service

install_tool:
	cp src/dpm-query /usr/bin/dpm-query

install_service: install_tool
	cp src/dpm-set.service /lib/systemd/system/dpm-set.service
	systemctl enable dpm-set.service

uninstall: uninstall_service

uninstall_tool:
	rm /usr/bin/dpm-query

uninstall_service: uninstall_tool
	systemctl disable dpm-set.service
	rm /lib/systemd/system/dpm-set.service
