install:
	install -D pa-app-list $$HOME/bin/pa-app-list
	install -D pa-app-sink $$HOME/bin/pa-app-sink
	install -D pa-app-source $$HOME/bin/pa-app-source
	install -D pa-app-source-volume $$HOME/bin/pa-app-source-volume
	install -D pa-app-volume $$HOME/bin/pa-app-volume
	install -D pa-card-profile $$HOME/bin/pa-card-profile
	install -D pa-default-sink $$HOME/bin/pa-default-sink
	install -D pa-default-source $$HOME/bin/pa-default-source
	install -D pa-entities-list $$HOME/bin/pa-entities-list
	[ -f $$HOME/.config/pulse-scripts/entities ] || install -m 700 -D entities.example $$HOME/.config/pulse-scripts/entities
	install -m 644 -D pa-function-lib $$HOME/.local/share/pulse-scripts/pa-function-lib

uninstall:
	rm $$HOME/bin/pa-app-list
	rm $$HOME/bin/pa-app-sink
	rm $$HOME/bin/pa-app-volume
	rm $$HOME/bin/pa-app-source
	rm $$HOME/bin/pa-default-source
	rm $$HOME/bin/pa-default-sink
	rm $$HOME/bin/pa-app-source-volume
	rm $$HOME/bin/pa-card-profile
	rm $$HOME/bin/pa-entities-list
	rm -r $$HOME/.config/pulse-scripts/
	rm -r $$HOME/.local/share/pulse-scripts


list-sinks:
	pactl list sinks
