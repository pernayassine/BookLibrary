#!/bin/bash

# This code allows the user to choose a field to sort the search.

fieldSearch() {
 
 #this work as search uou add the book's name that you want to search for and it searches for it 
    echo "Please enter the book you want to search for: "
    read input
    output=$(curl -s "https://openlibrary.org/search.json?q=$input")
    fields=$(jq -r '.docs[0] | keys_unsorted[]' <<< "$output")
 #it then selects the fields from the search results and displays them  
    echo "These are the fields:"
    echo "$fields"
#you can chose which field you want to be shown the search result 
    echo "Please choose the field you want to display: "
    read uField

    jq -c ".docs[] | { \"$uField\": .[\"$uField\"] }" <<< "$output" | while read -r bookField; do
        echo "------------"
        echo "Field Information for '$uField':"
        echo "$bookField" | jq .
    done
}

fieldSearch

