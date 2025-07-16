# ha-socat-serialproxy Home Assistant Add-on

Dieses Add-on verbindet einen TCP-Serial-Port (z. B. von ser2net) mit einem virtuellen lokalen Gerät unter `/dev/ttyWMA0`.

## Beispielanwendung
- Raspberry Pi mit Warema USB-Stick + ser2net
- Home Assistant auf separatem Host, ohne USB-Gerät
- `/dev/ttyWMA0` wird in HA als echtes Gerät nutzbar

## Konfiguration
```yaml
remote_host: 192.168.20.20 
remote_port: 2004
device_name: /dev/ttyWMA0
