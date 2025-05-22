#!/bin/bash

# The string that contains all consonants, 20 letters long
consonants='bcdfghjklmnpqrstvwxz'

# The string that contains all vowels, 6 letters long
vowels='aeiouy'

# This function makes a random number between 0 and max (inclusive)
# Because max is low (e.g. 19), modulo bias is negligible — this is secure
make_random_number() {
	# Use /dev/urandom as a secure source of randomness
	# 'od' (octal dump) reads 4 bytes and outputs an unsigned 32-bit integer
	# '-An' removes the address field from the output
	# '-N4' means read 4 bytes (32 bits)
	# '-tu4' formats it as an unsigned decimal number (base 10)
	random_raw=$(od -An -N4 -tu4 < /dev/urandom)

	# Remove all whitespace using 'tr'
	random_clean=$(echo "$random_raw" | tr -d ' ')

	# Apply modulo (max + 1) to bring result into range [0, max]
	# This is safe for small max values (like < 256) because the bias is negligible
	result=$(awk -v max="$1" '{print $1 % (max + 1)}' <<< "$random_clean")

	echo "$result"
}

# This function makes a random consonant
make_random_consonant() {
	index=$(make_random_number $((${#consonants} - 1)))
	echo -n "${consonants:$index:1}"
}

# This function makes a random vowel
make_random_vowel() {
	index=$(make_random_number $((${#vowels} - 1)))
	echo -n "${vowels:$index:1}"
}

# This function makes a random word of set length.
# A word is a text string made of random syllables (consonant + vowel)
make_random_word() {
	word_length=$1
	result=''

	for ((i=0; i<word_length; i++)); do
		if (( i % 2 == 0 )); then
			result+=$(make_random_consonant) # If it's even, add random consonant
		else
			result+=$(make_random_vowel) # If it's odd, add random vowel
		fi
	done

	echo -n "$result"
}

# This function makes a random hexadecimal string (8 characters)
make_random_hex_string() {
	hex_string=''
	# Loop 8 times to generate 8 hex characters (1 character = 4 bits)
	for ((i=0; i<8; i++)); do
		# Get a random number between 0 and 15 (i.e. 0x0 to 0xF)
		n=$(make_random_number 15)

		# Convert to lowercase hex using printf (e.g., 15 → f)
		hex_digit=$(printf '%x' "$n")

		# Append to result
		hex_string+="$hex_digit"
	done

	echo "$hex_string"
}

# This function generates a password
generate_password() {
	word1=$(make_random_word 7) # First random word
	word2=$(make_random_word 7) # Second random word
	word3=$(make_random_word 7) # Third random word
	hex_string=$(make_random_hex_string | tr '[:lower:]' '[:upper:]') # Uppercase hex

	# Join all four segments with dashes
	echo "${word1}-${word2}-${word3}-${hex_string}"
}

# Output the generated password to stdout
generate_password
