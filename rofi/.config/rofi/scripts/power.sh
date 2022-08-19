#!/usr/bin/env bash

# This is a script for rofi's script mode.
# Usage: `rofi -modi "power:$power_script" -show power`, where `$power_script`
# corresponds to the path of this script.

set -e  # exit immediately if a command exits with a non-zero status

# all supported options
all=(shutdown reboot suspend hibernate logout lockscreen cancel)

# by default, ask for confirmation for actions that are irreversible
confirmations=(shutdown reboot logout)

declare -A texts
texts[shutdown]="shut down"
texts[reboot]="reboot"
texts[suspend]="suspend"
texts[hibernate]="hibernate"
texts[logout]="log out"
texts[lockscreen]="lock screen"
texts[cancel]="cancel"

declare -A icons
icons[shutdown]=""
icons[reboot]=""
icons[suspend]="鈴"
icons[hibernate]="⏾"
icons[logout]=""
icons[lockscreen]=""
icons[cancel]=""

declare -A messages
for entry in "${all[@]}"; do
    messages[$entry]="${icons[$entry]} ${texts[$entry]}"
done

declare -A confirmation_messages
for entry in "${confirmations[@]}"; do
    confirmation_messages[$entry]="${icons[$entry]} Yes, ${texts[$entry]}."
done
confirmation_messages[cancel]="${icons[cancel]} No, ${texts[cancel]}."

declare -A actions
actions[shutdown]="systemctl poweroff"
actions[reboot]="systemctl reboot"
actions[suspend]="systemctl suspend"
actions[hibernate]="systemctl hibernate"
actions[logout]="loginctl terminate-session ${XDG_SESSION_ID-}"
actions[lockscreen]="loginctl lock-session ${XDG_SESSION_ID-}"


if [[ -z "$1" ]]; then
    # show the initial options
    for entry in "${all[@]}"; do
        echo "${messages[$entry]}"
    done
else
    # process options
    case "$1" in
        "${messages[shutdown]}")
            echo "${confirmation_messages[shutdown]}"
            echo "${confirmation_messages[cancel]}"
            ;;
        "${confirmation_messages[shutdown]}")
            ${actions[shutdown]}
            ;;
        "${messages[reboot]}")
            echo "${confirmation_messages[reboot]}"
            echo "${confirmation_messages[cancel]}"
            ;;
        "${confirmation_messages[reboot]}")
            ${actions[reboot]}
            ;;
        "${messages[suspend]}")
            ${actions[suspend]}
            ;;
        "${messages[hibernate]}")
            ${actions[hibernate]}
            ;;
        "${messages[logout]}")
            echo "${confirmation_messages[logout]}"
            echo "${confirmation_messages[cancel]}"
            ;;
        "${confirmation_messages[logout]}")
            ${actions[logout]}
            ;;
        "${messages[lockscreen]}")
            ${actions[lockscreen]}
            ;;
    esac
fi
exit 0
