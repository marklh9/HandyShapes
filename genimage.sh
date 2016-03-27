#!/bin/bash
declare -a NAMES
declare -a COLOR
declare -a DARKER_COLOR
NAMES=(BLACK BLUE RED GREEN PURPLE AQUA ORANGE)
#COLORS=('rgb(0,0,0)' 'rgb(79,129,189)' 'rgb(192,80,77)' 'rgb(155,187,89)' 'rgb(128,100,162)' 'rgb(75,172,98)' 'rgb(247,150,70)')
#DARK_COLORS=('rgb(0,0,0)' 'rgb(58,95,139)' 'rgb(142,59,56)' 'rgb(114,138,65)' 'rgb(94,73,119)' 'rgb(55,127,146)' 'rgb(182,110,51)')
COLOR[0]='rgb(0,0,0)'
COLOR[1]='rgb(79,129,189)'
COLOR[2]='rgb(192,80,77)'
COLOR[3]='rgb(155,187,89)'
COLOR[4]='rgb(128,100,162)'
COLOR[5]='rgb(75,172,98)'
COLOR[6]='rgb(247,150,70)'

DARKER_COLOR[0]='rgb(0,0,0)'
DARKER_COLOR[1]='rgb(58,95,139)'
DARKER_COLOR[2]='rgb(142,59,56)'
DARKER_COLOR[3]='rgb(114,138,65)'
DARKER_COLOR[4]='rgb(94,73,119)'
DARKER_COLOR[5]='rgb(55,127,146)'
DARKER_COLOR[6]='rgb(182,110,51)'

create_image()
{
    convert -size "$1" "xc:$2" -fill "$3" -stroke "$4" -strokewidth 2 -draw "$5" "$6"
}
RB="rectangle 1,1 23,23"
RS="rectangle 1,1 13,13"
mkdir -p icons16
mkdir -p icons26
for i in 0 1 2 3 4 5 6 ; do 
C=${COLOR[$i]}
DC=${DARKER_COLOR[$i]}
create_image 26x26 white white "$C" "$RB" "icons26/CBS_${NAMES[$i]}26.png"
create_image 16x16 white white "$C" "$RS" "icons16/CBS_${NAMES[$i]}16.png"
create_image 26x26 white "$C" "$DC" "$RB" "icons26/DBFS_${NAMES[$i]}26.png"
create_image 16x16 white "$C" "$DC" "$RS" "icons16/DBFS_${NAMES[$i]}16.png"
create_image 26x26 grey "$C" white "$RB" "icons26/WBFS_${NAMES[$i]}26.png"
create_image 16x16 grey "$C" white "$RS" "icons16/WBFS_${NAMES[$i]}16.png"
done
