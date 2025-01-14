#!/usr/bin/env bash

iconpath="/usr/share/icons/Papirus-Dark/32x32/devices"
icon="${iconpath}/bluetooth.svg"

bluetoothctl power on
bluetoothctl agent on
bluetoothctl default-agent

function bt() {
  bluetoothctl trust ${1}
  bluetoothctl pair ${1}
  bluetoothctl connect ${1}
}

scan="Scan devices"
bt1="Haylou GT1 XR R"
bt2="Haylou GT1 XR L"
bt3="JBL GO 2"
bt4="KD-750"

devices="$scan\n$bt1\n$bt2\n$bt3\n$bt4"

chosen="$(echo -e "$devices" | wofi --lines 5 --sort-order=DEFAULT --dmenu -p "  Bluetooth")"
case $chosen in
    $scan)
      bluetoothctl scan on;;
    $bt1)
      bt "9C:19:C2:A6:F9:8C";; # Haylou GT1 XR R
    $bt2)
      bt "9C:19:C2:A6:FB:E1";; # Haylou GT1 XR L
    $bt3)
      bt "70:99:1C:51:45:9B";; # JBL GO 2
    $bt4)
      bt "F1:32:33:23:43:4C";; # KD-750
esac
exit 0;
