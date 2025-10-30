# Function to show connected Bluetooth device info
function btinfo
    bluetoothctl devices | cut -f2 -d' ' | while read uuid
        bluetoothctl info $uuid
    end | grep -e "Device\|Connected\|Name"
end
