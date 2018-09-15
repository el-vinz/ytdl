#!/bin/bash


log="$HOME/logs/logytdl"

[ ! -d $log ] && mkdir $log

check_packages () {
#les packages youtube-dl avconv normalize-audio doivent être présents.
}

waitandsee () {
	sleep 1
	if [ -z $(find $path/$i -type d -empty) ]
	then
		echo "Echec du téléchargement"
		return 1
	fi 
}

repwork () {
	
	IFS=$'\t\n'

	path=$HOME/.tmpdownload
	[ ! -d "$path" ] && mkdir $path
	i=1
	while [ -d "$path/$i" ]
	do 
		let i=i+1

	done

	mkdir $path/$i
	
	wrk="$path/$i"
	
	rep_dest="$HOME/MUSIQUE"
}

insert_tags () {
		
	read -p "Collez le lien vers la vidéo :   "  link
	read -p "Titre ?     "  title
	read -p "Artiste ?   "  artist
	read -p "Genre ?     "  genre
	read -p "Label ?     " label
}

convertit() {
		cd $wrk
		
		youtube-dl --no-playlist $link 
						
		music_file=$(ls -p $wrk)
	
		echo $(ffmpeg -i $music_file -vn -ac 2 -ab 320k $artist.$titre.mp3)
		
		track=$artist.$titre.mp3

		id3v2 -a $artist $track
		id3v2 -t $title $track
		id3v2 -g $genre $track
		id3v2 -c $label $track
		
		# normalisation Mp3
		mp3gain -a -k $track

		mv $track $rep_dest && rm -r $wrk

}

logit () {

	echo "$link $track $(date)">>$log

}

repwork && insert_tags && convertit && logit
