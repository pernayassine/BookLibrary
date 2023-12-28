#!/bin/bash

# This code allows the user to choose a field to sort the search.

fieldSearch() {
    echo "Please enter the book you want to search for: "
    read input
    output=$(curl -s "https://openlibrary.org/search.json?q=$input")
    fields=$(jq -r '.docs[0] | keys_unsorted[]' <<< "$output")
    
    echo "These are the fields:"
    echo "$fields"

    echo "Please choose the field you want to display: "
    read uField

    jq -c ".docs[] | { \"$uField\": .[\"$uField\"] }" <<< "$output" | while read -r bookField; do
        echo "------------"
        echo "Field Information for '$uField':"
        echo "$bookField" | jq .
    done
}

fieldSearch

