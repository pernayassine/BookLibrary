#! /bin/bash

# this code allows us to search in open libarary for books

searchBook()
{
 #this work as search uou add the book's name that you want to search for and it searches for it 
echo "please enter the book you want to search for : "
read input
output=$(curl -s "https://openlibrary.org/search.json?q=$input")
#displays the results
echo "Here is what I found : "
echo "$output" | jq .
}
searchBook
