#!/bin/env bash

function generate_lock_background() {
	local method="$1"
	local image_path="/tmp/lock_background.png"
	maim "$image_path"

	if [ "$method" = "blur" ]; then
		convert "$image_path" -resize 5% -resize 2000% "$image_path"
	elif [ "$method" = "pixelate" ]; then
		convert "$image_path" -scale 5% -scale 2000% "$image_path"
	fi

	echo "$image_path"
	exit 0
}

# method="blur"
method="pixelate"
i3lock --show-failed-attempts --image="$(generate_lock_background "$method")"
