#! /bin/bash

function insertIntoTable(){
    data=$1
    table=$2
    sed -i "a $data" $table
}


insertIntoTable $1 $2