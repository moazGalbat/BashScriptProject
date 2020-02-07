function dropTable {

	read -ep "Enter the table name to drop:  " tableName
	if ( test -f ~/dbms/$1/$tableName )
    then
        rm ~/dbms/$1/$tableName ;
        rm ~/dbms/$1/.$tableName ;
	    echo "$tableName dropped successfully";
    else {
        echo "Table $tableName does not exist";
    }
    fi
    nap
}