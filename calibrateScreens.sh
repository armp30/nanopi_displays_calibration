modeLine=$(cvt 1280 800 60 | grep Modeline)
res=$(echo $modeLine | cut -d '"' -f2 | cut -d "_" -f1)
mode=$(echo $modeLine | cut -d '"' -f3)
xrandr --newmode $res $mode
xrandr --addmode HDMI-1 $res
id=$(xinput | grep it7260_ts | grep -o 'id=[0-9]*' | cut -d = -f2)
xrandr --output HDMI-1 --mode $res  --right-of LVDS-1
xinput map-to-output $id LVDS-1
