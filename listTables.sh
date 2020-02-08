function listTables {
    numberOfTables=$(ls ~/dbms/$dbname/ | wc -l );
    if test $numberOfTables -eq 0
        then
            echo "There are no tables available"
        else 
            tables=$(ls ~/dbms/$dbname/)
            echo $tables
    fi
    nap
}

function nap(){
	read -p "Press [Enter] key to continue..." 
}