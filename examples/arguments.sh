#!/bin/bash

function show_help {
	echo "Write here some messages about how to use the program"
	echo "and some help"
}


function parse_args {

	arguments=()

	while [ "$1" != "" ]; do 
		case "$1" in 
			-p | --plant ) 
				plant_name="$2" 
				shift
				;;
			-c | --country )
				country="$2"
				shift
				;;
			-h | --help )
				echo "showing help"
				show_help 
				exit
				;;
			* )    
				args+="$1"  #Capture unmatched parameters as positional arguments.
				echo "Unknown argument $1"
		esac
		shift
	done
}


parse_args "$@"

#You may want to check if the args exists. 

if [[ -z "$plant_name" ]] 
then
	echo "You need to provide plant name using the -p or --plant=flag"
fi

if [[ -z "$country" ]] 
then
	echo "You need to provide country name using the -c or --country= parameter"
fi




echo $plant_name
echo $country


