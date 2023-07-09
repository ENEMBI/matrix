#!/bin/bash

# Define the USERS array in JSON format
USERS='[
    { "email": "email1", "password": "password1" },
    { "email": "email2", "password": "password2" },
    { "email": "email3", "password": "password3" },
    { "email": "email4", "password": "password4" },
    { "email": "email5", "password": "password5" },
    { "email": "email6", "password": "password6" }
]'

# Number of objects in each array
WORKERS=2

# Convert the JSON array to an array of arrays
result=$(echo "$USERS" | jq -c --arg workers "$WORKERS" '[.[]] | group_by( . as $item | (range(0; length; $workers) | .[] | . as $i | $item[$i:$i+$workers]))')
# Print the result
echo "$result"
