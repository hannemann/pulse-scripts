# Pulse Scripts

Playing with PulseAudio to be able to control it with ease from cli.  

Goal: Control with RPI Pico Powered Macro Pad


## Installation
```bash
make install
```
Adjust entity variables to fit your environment
```bash
vi ~/.config/pulse-scripts/entities
```

Card names can be obtained by invoking
```
pactl list sink
```
