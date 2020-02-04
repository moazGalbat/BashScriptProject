#! /bin/bash

function deleteFromTable(){
    echo "Enter Table name you eant to delete from."
    read tableName
    if test -f ~/dbms/$dbname/$tableName
        then
            linesInFile=$(cat ~/dbms/$dbname/$tableName | wc -l )
            if test $linesInFile -gt 0
                then
                    echo "Total number of rows: $linesInFile."
                    echo "Enter line number you want to delete"
                    read lineNumber
                    sed -i "${lineNumber}d" ~/dbms/$dbname/$tableName
                else
                    echo "Table is empty"
                fi
        else
            echo "Table deos not exist."
    fi

}

# deleteFromTable
