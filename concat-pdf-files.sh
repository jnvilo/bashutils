#!/bin/bash

#A simple script to concatenate pdf files into one single file using gs
#Usage: ./concat-pdf-files.sh file1.pdf file2.pdf file3.pdf output.pdf

#Warning: There is a bug. The output filename must have no spaces in. EVEN IF IT IS ENCLOSED by ".
#It will always take the last word as the outputfile. 

function concat_pdf_files() {

	NUM_ARGS=$#
	echo $@	
	
	for i in $@; do :; done
	OUTFILENAME=$i

	#Make sure we do not overwrite any files that already exists 
    	if [ -f "$out" ]
    	then
        	echo "File: $OUTFILENAME already exists. Refusing to overwrite. Remove the file first if you want to use that filename as output file."
        	return 1
    	fi

    	cmd="gs -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -s${OUTFILENAME}=\"$out\"" 

    	for (( i = 1 ; i < $narg; i++ ))
    	do
        	cmd="$cmd \"${!i}\"" # add \"...\" to support filenames with spaces
    	done    
    
    echo $cmd
    eval $cmd 
#}

#catpdf "$@"


}

echo $@
concat_pdf_files $@
