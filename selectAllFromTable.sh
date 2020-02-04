#! /bin/bash

function selectAllFromTable(){
    echo "Enter table name to select from"
    read tableName
    metaTable="."
    if test -f ~/dbms/$dbname/$tableName
        then
            metaTable="$metaTable$tableName"
            cols=$(awk -F: '{print $1}' ~/dbms/$dbname/$metaTable)
            echo "======================="
            echo $cols
            awk -F: '{gsub(":"," "); print $0,NR}' ~/dbms/$dbname/$tableName
            printf "=======================\n"
        else 
            echo "Table does not exist"
    fi
}


# selectAllFromTable