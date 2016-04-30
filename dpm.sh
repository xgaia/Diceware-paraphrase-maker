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
	for (( i = 0; i < 5; i++ )); do
		new=$(dice)
		code=$code$new
	done
	grep $code $1 | cut -f 2
}


if [ $# -eq 0 ]
then
	gui=true
fi

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

if [[ gui == true ]]; then
	echo "hello"
fi

echo "You ask for a $number words paraphrase"
echo "-------------------------------------"

for (( i = 0; i < $number; i++ )); do
	new=''
	code=''
	word=$(getWord $wordlist)
	printf "$word\n"
	paraphrase="$paraphrase $word"
done

echo "-------------------------------------"
echo "$paraphrase"
echo "-------------------------------------"