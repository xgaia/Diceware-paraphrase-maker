#! /bin/bash

function usage(){
	printf "Usage : dpm -n 7 -l wordlist\n\n"
	printf "\t-n      number of random word\n"
	printf "\t-l      path to the wordlist\n"
	printf "\t-h      diplay this help\n"
}

function dice(){
	tr -cd '1-6' < /dev/urandom | head -c 1;echo
}

function getWord(){
	grep $1 $2 | cut -f 2
}

while getopts "hl:n:" option; do
	case $option in
		h)
			usage
			exit
		;;

		l)
			wordlist=$OPTARG
		;;

		n)
			number=$OPTARG
		;;
	esac
done

echo "You ask for a $number word paraphrase"
echo "-------------------------------------"

for (( i = 0; i < $number; i++ )); do
	new=''
	code=''
	word=''
	for (( j = 0; j < 5; j++ )); do
		new=$(dice)
		code=$code$new
		printf "$new"
	done

	word=$(getWord $code $wordlist)
	printf " : $word\n"
	paraphrase="$paraphrase $word"
done

echo "-------------------------------------"
echo "$paraphrase"
echo "-------------------------------------"