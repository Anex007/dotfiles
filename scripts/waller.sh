#!/bin/bash

# This is a wallpaper changing script i wrote
# Install pywal and feh to work

# You can change the wallpaper directory and the transparency to your liking.

WALLPAPERS="/home/ezio/Pictures/Wallpapers/"
WALLPAPERS=($(find $WALLPAPERS -type f))
CACHE="/home/ezio/.cache/waller"
TERM_TRANSP=90

USAGE="./waller.sh [-n | -p]\n\t-n : next wallpaper\n\t-p : previous wallpaper\n"

function wall_next {
	index=$(get_index $1)
	next=$(($index + 1))
	if [[ $next -ge ${#WALLPAPERS[@]} ]]; then
		next=0
	fi
	set_wall ${WALLPAPERS[$next]}
}

function wall_prev {
	index=$(get_index $1)
	prev=$(($index - 1))
	if [[ $prev -lt 0 ]]; then
		prev=$((${#WALLPAPERS[@]} - 1))
	fi
	set_wall ${WALLPAPERS[$prev]}
}

function get_index {
	for i in "${!WALLPAPERS[@]}"; do
	   [[ "${WALLPAPERS[$i]}" = "$1" ]] && echo $i && break
	done
}

function set_wall {
	wall="$1"
	echo "wall is $wall"
	wal -i $wall -a $TERM_TRANSP
	echo $wall > $CACHE
}

if [[ $1 == "-n" ]]; then
	wall_next $(cat $CACHE)
elif [[ $1 == "-p" ]]; then
	wall_prev $(cat $CACHE)
else
	echo -e -n $USAGE
fi
