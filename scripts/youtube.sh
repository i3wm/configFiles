#!/bin/bash

printf "\n"

mkdir -p ~/.rtmp

read -p "Please enter the URL of the video: " url 

printf "\n\nNOTE:-\n"

printf "\n\t[fc = format code, ext = extension, res = resolution]\n"

printf "\n\t1. VIDEO FILES WITH AUDIO: The 'format code' with two digits number at the end of the list."

printf "\n\t2. AUDIO ONLY: Will be mentioned."

printf "\n\t3. VIDEO ONLY: The rest of the files.\n"

youtube-dl -F $url > ~/.rtmp/tmp

sed -i '/youtube/d' ~/.rtmp/tmp
sed -i '/info/d' ~/.rtmp/tmp
sed -i 's/format code/fc/g' ~/.rtmp/tmp
sed -i 's/extension/ext/g' ~/.rtmp/tmp
sed -i 's/resolution/res/g' ~/.rtmp/tmp
sed -i 's/audio only/audio_only/g' ~/.rtmp/tmp
sed -i 's/DASH video/video_only/g' ~/.rtmp/tmp

printf "\nThe available formats are:\n\n"
cat ~/.rtmp/tmp | awk '{print $1"\t"$2"\t"$3}'

rm -rf ~/.rtmp

printf "\n"
read -p "Please enter your choice of format code: " format

printf "\n\nWhere do you want to save the file?\n\t1. Desktop\n\t2. Documents\n\t3. Downloads\n\t4. Music\n\t5. Pictures\n\t6. Public\n\t7. Templates\n\t8. Videos\n\t9. Custom\n"

printf "\n"

read -p "Please enter your location choice: " loc

if [[ "$loc" == 1 ]] ; then
        cd $HOME/Desktop
elif [[ "$loc" == 2 ]] ; then
        cd $HOME/Documents
elif [[ "$loc" == 3 ]] ; then
        cd $HOME/Downloads
elif [[ "$loc" == 4 ]] ; then
        cd $HOME/Music
elif [[ "$loc" == 5 ]] ; then
        cd $HOME/Pictures
elif [[ "$loc" == 6 ]] ; then
        cd $HOME/Public
elif [[ "$loc" == 7 ]] ; then
        cd $HOME/Templates
elif [[ "$loc" == 8 ]] ; then
        cd $HOME/Videos
elif [[ "$loc" == 9 ]] ; then
        printf "\nIf you are entering a path with space, then preceed that path with a \. E.g.: /this/is/a\ custom\ path/. If the path entered is not detected then the file will be downloaded in the current directory."
        printf "\nNOTE:- Enter absolute paths only."
        printf "\n\n"
        read -p "Please enter your custom path: " custom
        cd "$custom"
fi

youtube-dl -f $format -o '%(title)s.%(ext)s' $url

exit 0
