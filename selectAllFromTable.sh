#! /bin/bash

function selectAllFromTable(){
    echo "Enter table name to select from"
    read tableName
    metaTable="."
    if test -f ~/dbms/$dbname/$tableName
        then
            metaTable="$metaTable$tableName"
            echo "======================="
            awk -F: 'BEGIN{ORS="";print"No.:"}{print $1":"}END{print "\n"}' ~/dbms/$dbname/$metaTable  > ./temp
            awk -F: '{print NR":"$0}' ~/dbms/$dbname/$tableName >> ./temp
            column ./temp -t -s ":"
            printf "=======================\n"
            rm ./temp
        else 
            echo "Table does not exist"
    fi
}


# selectAllFromTable