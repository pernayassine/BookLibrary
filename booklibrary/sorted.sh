#!/bin/bash
#thsi code allows us to search by category thus giving us sorted search

sortedSearchBook()
{
echo "Please enter the book you want to search for : "
read -r input
echo "How do you like it to be sorted by (relevance, new, popular, rating, num_editions):"
read -r sort

output=$(curl -s "https://openlibrary.org/search.json?q=$input&sort=$sort")
echo "Here is what I found : "
echo "$output"
}
sortedSearchBook
