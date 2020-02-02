#!/usr/bin/bash

function creatTable {
    echo "Enter Table Name"
    read tableName
    if ( test -f ~/dbms/$tableName )
    then
        echo "Table already Exists"
    else {
        metaData="";

        echo "Enter number of columns"
        read columnsNumber
        for ((i=0; i<$columnsNumber ; i++))
        do
            echo "Enter column name"
            read columnName
            echo "Enter type for column $columnName";
            columnTypeFunction
            metaData+="$columnName:$columnType\n"
        done 

        touch ~/dbms/.$tableName;
        touch ~/dbms/${tableName};
        echo "table created succfully"
        echo -e $metaData >> ~/dbms/.$tableName
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