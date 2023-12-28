#! /bin/bash

# this code allows us to search in open libarary for books

searchBook()
{
echo "please enter the book you want to search for : "
read input
output=$(curl -s "https://openlibrary.org/search.json?q=$input")
echo "Here is what I found : "
echo "$output" | jq .
}
searchBook
