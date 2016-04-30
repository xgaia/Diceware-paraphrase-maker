#! /bin/bash

function usage(){
	printf "Usage :\n"
	printf "\t-n      number of random word\n"
	printf "\t-l      path to the wordlist\n"
	printf "\t-h      diplay this help\n"
}

function dice(){
	tr -cd '1-6' < /dev/urandom | head -c 1;echo
}

function getWord(){
	grep $1 wordlist | cut -f 2
}

echo "You ask for a $1 word paraphrase"

for (( i = 0; i < $1; i++ )); do
	new=''
	code=''
	word=''
	for (( j = 0; j < 5; j++ )); do
		new=$(dice)
		code=$code$new
	done
	word=$(getWord $code)
	paraphrase="$paraphrase $word"
done

echo "your new paraphrase is $paraphrase"