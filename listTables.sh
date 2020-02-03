function listTables {
    ls ~/dbms/$1 ;
    nap
}

function nap(){
	read -p "Press [Enter] key to continue..." 
	}