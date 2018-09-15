#!/bin/bash

check_ffmpeg () {
        if ! dpkg -s ffmpeg 2>/dev/null
                then
                read -p  "ffmpeg est absent. Souhaitez-vous l installer ? [Yy/Nn]" -n 1 answer
                case $answer in
                    [yYoO]*)
                        apt-get udapte -y
                        apt-get install ffmpeg -y
                    ;;
                    *) echo "ffmpeg est essentiel. Fin de script"
                    return 1

                    ;;
                    esac
        fi
}
