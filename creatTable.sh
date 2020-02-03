#!/usr/bin/bash

function creatTable {
    echo "Enter Table Name"
    read tableName
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
            echo "Enter type for column $columnName";
            columnTypeFunction
            metaData+="$columnName:$columnType\n"
        done 

        touch ~/dbms/$1/.$tableName;
        touch ~/dbms/$1/${tableName};
        echo "table created succfully"
        echo -e $metaData >> ~/dbms/$1/.$tableName
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
