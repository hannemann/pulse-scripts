install:
	install -D pa-app-list $$HOME/.local/bin/pa-app-list
	install -D pa-app-sink $$HOME/.local/bin/pa-app-sink
	install -D pa-app-source $$HOME/.local/bin/pa-app-source
	install -D pa-app-source-volume $$HOME/.local/bin/pa-app-source-volume
	install -D pa-app-volume $$HOME/.local/bin/pa-app-volume
	install -D pa-card-profile $$HOME/.local/bin/pa-card-profile
	install -D pa-default-sink $$HOME/.local/bin/pa-default-sink
	install -D pa-default-source $$HOME/.local/bin/pa-default-source
	install -D pa-entities-list $$HOME/.local/bin/pa-entities-list
	[ -f $$HOME/.config/pulse-scripts/entities ] || install -m 700 -D entities.example $$HOME/.config/pulse-scripts/entities
	install -m 644 -D pa-function-lib $$HOME/.local/share/pulse-scripts/pa-function-lib

uninstall:
	rm $$HOME/.local/bin/pa-app-list
	rm $$HOME/.local/bin/pa-app-sink
	rm $$HOME/.local/bin/pa-app-volume
	rm $$HOME/.local/bin/pa-app-source
	rm $$HOME/.local/bin/pa-default-source
	rm $$HOME/.local/bin/pa-default-sink
	rm $$HOME/.local/bin/pa-app-source-volume
	rm $$HOME/.local/bin/pa-card-profile
	rm $$HOME/.local/bin/pa-entities-list
	rm -r $$HOME/.config/pulse-scripts/
	rm -r $$HOME/.local/share/pulse-scripts


list-sinks:
	pactl list sinks | grep -A 1 Name

list-sources:
	pactl list sources | grep -A 1 Name

list-cards:
	pactl list cards | grep Name
