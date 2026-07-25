#!/bin/bash

import_vpn() {
    filepath="$1"
    filename=$(basename "$filepath")
    config_name="${filename%.*}"

    echo "Importing $filepath"
    sudo nmcli connection import type wireguard file "$filepath" &&
    sudo nmcli connection down "$config_name" &&
    sudo nmcli connection modify "$config_name" connection.autoconnect no
    echo "Imported $filepath, config name: $config_name"
}
