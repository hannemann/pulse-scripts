install:
	install pa-app-list $$HOME/bin
	install pa-app-sink $$HOME/bin
	install pa-app-volume $$HOME/bin
	install pa-card-profile $$HOME/bin

uninstall:
	rm $$HOME/bin/pa-app-list
	rm $$HOME/bin/pa-app-sink
	rm $$HOME/bin/pa-app-volume
	rm $$HOME/bin/pa-card-profile
