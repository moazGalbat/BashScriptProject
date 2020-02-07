#!/usr/bin/bash

function creatTable {
    tableNameValidation
    if ( test -f ~/dbms/$1/$tableName )
    then
        echo "Table already Exists"
    else {
        metaData="";

        echo "Enter number of columns"
        read columnsNumber
        while ! [[ $columnsNumber =~ ^[0-9]+$ ]]
        do
            echo "please enter columns number as an Intger";
            read columnsNumber
        done

        for ((i=0; i<$columnsNumber ; i++))
        do
            echo "Enter column name"
            read columnName

            # validation on column name to avoid duplication
            val=$(echo -e $metaData | awk -F: '{print $1}' | grep -w $columnName)
            while [ $val ]
            do 
            read -p "the column $columnName you entered is duplicated please enter a another name:    " columnName;
            val=$(echo -e $metaData | awk -F: '{print $1}' | grep -w $columnName);
            done

            echo "Enter type for column $columnName";
            columnTypeFunction
            metaData+="$columnName:$columnType\n"
        done 

        touch ~/dbms/$1/.$tableName;
        touch ~/dbms/$1/${tableName};
        echo "table created succfully"
        echo -e $metaData | sed '$d'  >> ~/dbms/$1/.$tableName
    }
    fi
}

function columnTypeFunction {
    select choice in "int" "string"
    do
        case $choice in
        int)
            columnType="int";
            break;;
        string)
            columnType="string";
            break;;
        esac
    done
}

function tableNameValidation {
    echo "Enter Table Name"
    read tableName
    regex='^[]0-9a-zA-Z,!^`@{}=();/~_|[-]+$'
    if [[ $tableName =~ $regex ]]
    then
    return
    else
        echo "Please Enter a vaild Name";
        tableNameValidation;
    fi
}