#!/bin/bash

# Requirement : jq
set -e
if [[ $# -ne 2 ]] ; then
    echo 'Usage: $0 api_url postID '
    exit 1
fi

api_url=$1
curl --silent  -H "Accept: application/json" -H "Content-Type: application/json" -X GET  $api_url   |  jq --argjson postid $2  --raw-output '.[] | select(."postId" == $postid) | ."id"'
