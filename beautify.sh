#!/bin/bash

#Run command : sudo npm install -g uglify-js to install uglify-js

echo -n "Please provide javascript url which you would like to beautify: "
read domain

echo -n "Please provide timeout[2]: "
read wgettimeout

echo -n "Please provide tries[2]: "
read maxretries

content=wget  -SO- --timeout=${wgettimeout:-2} --tries=${maxretries:-2} $domain 2>/dev/null >>jsfile.js

uglifyjs jsfile.js --beautify --output beautified.js

cat beautified.js	

echo -n "Please provide string you want to search in js file: "
read search_text

if [[ (-z $search_text) ]];then
	echo "You did not provide a string to search!"
	exit
fi

grep -i $search_text beautified.js > jsoutput.txt
