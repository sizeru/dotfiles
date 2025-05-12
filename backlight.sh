#!/bin/bash

backlight_device=/sys/class/backlight/intel_backlight

action=$1

dvalue=$2

# echo "Backlight device: $backlight_device Bumping: $action By: $dvalue"

current_value=$(cat ${backlight_device}/brightness)

if [[ ${action} == "up" ]]
then 
	declare -i new_value=current_value+dvalue
else 
	if [[ ${action} = "down" ]] 
	then 
		declare -i new_value=current_value-dvalue
	else
		echo "Error: Proper usage is: backlight [up|down] [amount]"
		exit 1
	fi
fi

echo $new_value > ${backlight_device}/brightness
