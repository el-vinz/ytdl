#!/bin/bash

download_it () {

(
youtube-dl --no-playlist $1
) |
    zenity --progress \
            --title="téléchargement" \
            --text="téléchargement de $2 en cours" \
            --pulsate \
            --auto-close
            #on repere le fichier de sortie et on le met dans une variable

            fichier=$(ls -p)
}