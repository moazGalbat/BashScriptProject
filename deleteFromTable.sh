#! /bin/bash

function deleteFromTable(){
    echo "Enter Table name you want to delete from."
    read -e tableName
    if test -f ~/dbms/$dbname/$tableName
        then
            linesInFile=$(cat ~/dbms/$dbname/$tableName | wc -l )
            if test $linesInFile -gt 0
                then
                    echo "Total number of rows: $linesInFile."
                    echo "Enter line number you want to delete"
                    read -e lineNumber

                    if test $lineNumber -gt $linesInFile 
                    then
                        echo "line is out of boundry"
                    else
                        sed -i "${lineNumber}d" ~/dbms/$dbname/$tableName
                        echo "line deleted successfuly"
                    fi

                else
                    echo "Table is empty"
                fi
        else
            echo "Table does not exist."
    fi

}

# deleteFromTable
