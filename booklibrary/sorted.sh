#!/bin/bash
#thsi code allows us to search by category thus giving us sorted search

sortedSearchBook()
{
 #this work as search uou add the book's name that you want to search for and it searches for it 
echo "Please enter the book you want to search for : "
read -r input
#you can choose what do you want the search result be sorted by which category ex: newest it shows the books by the newest one 
echo "How do you like it to be sorted by (relevance, new, popular, rating, num_editions):"
read -r sort

output=$(curl -s "https://openlibrary.org/search.json?q=$input&sort=$sort")
echo "Here is what I found : "
echo "$output"  | jq .
}
sortedSearchBook
