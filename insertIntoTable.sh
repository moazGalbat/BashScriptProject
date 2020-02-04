#! /bin/bash

function insertIntoTable(){
    echo "Enter table name to insert into."
    read tableName
    metaTable="."
    row=""
    if test -f ~/dbms/$dbname/$tableName 
        then
            metaTable="$metaTable$tableName"
            cols=$(awk -F: '{print $1}' ~/dbms/$dbname/$metaTable)
            data=$(awk -F: '{print $2}' ~/dbms/$dbname/$metaTable)
            echo $cols
            numberOfColumns=$(cat ~/dbms/$dbname/$metaTable | wc -l)
            currentColumn=1
            echo "Enter your input for the columns respectivly"
            for type in $data
                do
                    case $type in 
                    int)
                        echo "Enter a number value"
                        read input 
                        while ! [[ $input =~ ^[0-9]+$ ]]
                            do
                                echo "please enter a number value"
                                read input
                            done
                        ;;
                    string)
                        echo "Enter a string"
                        read input 
                        while ! [[ $input =~ ^[a-Z]+$ ]]
                            do
                                echo "please enter a string value"
                                read input
                            done
                        ;;
                    *)
                        echo "-default case-"
                    ;;
                esac
                if test $currentColumn -eq $numberOfColumns
                    then
                    row="$row$input"
                else
                    row="$row$input:"   
                fi
                currentColumn=$(($currentColumn + 1))
            done
            # sed -i "a $row" ~/dbms/$dbname/$tableName
            echo -e $row >> ~/dbms/$dbname/$tableName
        else 
            echo "Table does not exist"
    fi
}


# insertIntoTable 