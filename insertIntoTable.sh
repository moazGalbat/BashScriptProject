#! /bin/bash

function insertIntoTable(){
    read -p "Enter input " name
    read -p "Enter name," name
    sed -i "a $data" $table
}


insertIntoTable $1 $2