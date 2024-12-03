install:
	install -pD ./commands/* -t $$HOME/.local/bin/
	install -m 644 -D ./lib/pa-function-lib $$HOME/.local/share/pulse-scripts/pa-function-lib
	$(MAKE) install-completions

uninstall:
	- cd ./commands; for i in *; do rm $$HOME/.local/bin/$$i; done;
	- rm -r $$HOME/.local/share/pulse-scripts
	$(MAKE) uninstall-completions

install-completions:
	install -pD ./completions/* -t $$HOME/.local/share/bash-completion/completions

uninstall-completions:
	- cd ./completions; for i in *; do rm $$HOME/.local/share/bash-completion/completions/$$i; done;
	rmdir -p --ignore-fail-on-non-empty $$HOME/.local/share/bash-completion/completions

install-wireplumber-config:
	install -pD config/wireplumber/wireplumber.conf.d/*.conf -t $$HOME/.config/wireplumber/wireplumber.conf.d
	$(MAKE) restart-wireplumber

uninstall-wireplumber-config:
	-rm $$HOME/.config/wireplumber/wireplumber.conf.d/*-pulse-scripts-*
	rmdir -p --ignore-fail-on-non-empty $$HOME/.config/wireplumber/wireplumber.conf.d/
	$(MAKE) restart-wireplumber

restart-wireplumber:
	systemctl --user restart wireplumber.service

list-sinks:
	pactl list sinks | grep -A 1 Name

list-sources:
	pactl list sources | grep -A 1 Name

list-cards:
	pactl list cards | grep Name

init-cards:
	@pactl -f json list cards 2> /dev/null | jq -r '.[] | .properties."device.nick" + "=\"" + .name + "\""'

init-sinks:
	@pactl -f json list sinks 2> /dev/null | jq -r '.[] | .properties."device.nick" + "=\"" + .name + "\""'

init-sources:
	@pactl -f json list sources 2> /dev/null | jq -r '.[] | .properties."device.nick" + "=\"" + .name + "\""'