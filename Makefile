install:
	install -pD ./commands/* -t $$HOME/.local/bin/
	[ -f $$HOME/.config/pulse-scripts/entities ] || install -m 700 -D entities.example $$HOME/.config/pulse-scripts/entities
	install -m 644 -D ./lib/pa-function-lib $$HOME/.local/share/pulse-scripts/pa-function-lib
	$(MAKE) install-completions

uninstall:
	cd ./commands; for i in *; do rm $$HOME/.local/bin/$$i; done;
	rm -r $$HOME/.config/pulse-scripts/
	rm -r $$HOME/.local/share/pulse-scripts
	$(MAKE) uninstall-completions

install-completions:
	install -pD ./completions/* -t $$HOME/.local/share/bash-completion/completions

uninstall-completions:
	cd ./completions; for i in *; do rm $$HOME/.local/share/bash-completion/completions/$$i; done;
	rmdir -p --ignore-fail-on-non-empty $$HOME/.local/share/bash-completion/completions

list-sinks:
	pactl list sinks | grep -A 1 Name

list-sources:
	pactl list sources | grep -A 1 Name

list-cards:
	pactl list cards | grep Name

init-cards:
	@echo "Ignore lines starting with 'Invalid non-ASCII character:'"; echo ""; \
	pactl -f json list cards | jq -r '.[] | .properties."device.nick" + "=\"" + .name + "\""'

init-sinks:
	@echo "Ignore lines starting with 'Invalid non-ASCII character:'"; echo ""; \
	pactl -f json list sinks | jq -r '.[] | .properties."device.nick" + "=\"" + .name + "\""'

init-sources:
	@echo "Ignore lines starting with 'Invalid non-ASCII character:'"; echo ""; \
	pactl -f json list sources | jq -r '.[] | .properties."device.nick" + "=\"" + .name + "\""'