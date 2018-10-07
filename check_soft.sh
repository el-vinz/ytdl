#!/bin/bash

softs=('vlc' 'ffmpeg' 'youtube-dl' 'id3v2' 'mp3gain' 'avconv' 'normalize-audio')

function_check () {
    if ! dpkg -s $1 2>/dev/null
                then
                read -p  "$1 is missing. Install it ? [Yy/Nn]" -n 1 answer
                case $answer in
                    [yYoO]*)
                        apt-get udapte -y
                        apt-get install $1 -y
                    ;;
                    *) echo-e "\n$1 est essentiel. Fin de script\n"
                    return 1
                    ;;
                    esac
    fi
}

for soft in ${softs[*]}
    do
    function_check $soft >>$HOME/.logs/loginstall
done
