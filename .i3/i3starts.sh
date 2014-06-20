#!/bin/bash +x
exec xrdb -load ~/.Xresources &
exec compton && sleep 2 &
exec nitrogen --restore &
exec parcellite &
exec pnmixer &
exec dropboxd &
exec recollindex -n -w 60 -m &
exec dunst &
# exec conky &
