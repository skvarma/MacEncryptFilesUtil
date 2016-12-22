#!/bin/bash

#SAMPLE USAGE
#alias for encrypting and decrypting PW File
#alias en="./enc.sh -en ~/Documents file.xlsx encrypt_file"
#alias dy="./enc.sh -dy ~/Documents file.xlsx encrypt_file"

#Option to Encrypt or Decrypt
option=$1

#Folder of the File to Encrypt
folder_loc=$2

# File to Encrypt
file_name=$3
file_name_enc=$3.asc

#Key in Keychain Used for Encryption
key=$4

function get_acct() {
 security find-generic-password -a $key\
  |ruby -e 'print "true" if STDIN.gets =~ /^keychain/'
}

function get_pw () {
  security 2>&1 >/dev/null find-generic-password -ga $key\
  |ruby -e 'print $1 if STDIN.gets =~ /^password: "(.*)"$/'
}

#echo "$(get_acct)"
if [ "$(get_acct)" = "true" ]; then
	case $option in
	    -en)
	        
	        if [ -f $folder_loc/$file_name ]; then
	        	openssl enc -aes-256-cbc -salt -in $folder_loc/$file_name -k $(get_pw) -out $folder_loc/$file_name_enc
	        	rm $folder_loc/$file_name
	        	#echo 'encrypt complete'
	    	fi
	    ;;
	    -dy)
	        if [ -f $folder_loc/$file_name_enc ]; then
	        	openssl enc -d -aes-256-cbc -in $folder_loc/$file_name_enc -k $(get_pw) > $folder_loc/$file_name
	        	rm $folder_loc/$file_name_enc
	        	#echo 'decrypt complete'
	        fi
	    ;;
	esac
#else
#	echo "No Key found in keyChain"	
fi
	