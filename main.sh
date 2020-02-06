#! /bin/bash

function setEnv(){
	test -d ~/dbms || mkdir -p ~/dbms
}
function createDB(){
	local dbname;
	echo "Enter the database name" 
	read dbname
	test -d ~/dbms/$dbname && echo "DataBase already exists." || (mkdir ~/dbms/$dbname && printf "Database %s created Successfully.\n" $dbname)
	nap
}

function listDB(){
	local numofd;
	numofd=$( ls ~/dbms/ | wc -l );
	if test $numofd -eq 0
		then
			echo "There are no databases";
			nap
		else
			echo "Databases are:-"
			ls ~/dbms
			nap
	fi
}

function connectDB(){
	# local dbname;
	echo "Enter the database name to connect to" 
	read dbname
	test ! -d ~/dbms/$dbname && printf "Database %s does not exist.\n" $dbname && nap || . ./tablesMenu.sh $dbname;
}


function myloc(){
	pwd
	nap
}

function nap(){
	read -p "Press [Enter] key to continue..." 
	}

function dropDatabase {

	read -p "Enter the database name to drop:  " dbname
	if [ -d ~/dbms/$dbname ]
	then
	rm -r  ~/dbms/$dbname ;
	echo "Database $dbname dropped successfully";
	else
	echo "Database $dbname does not exist";
	fi
}


function readInput(){
	local opt;
	echo "Choose an option."
	read opt
	case $opt in
		1) createDB ;;
		2) listDB ;;
		3) connectDB;;
		4) dropDatabase ;;
		end) echo "bye"; exit;;
		*) echo "Sorry unspecified option"; nap;;
	esac
}



function showDBMenu(){
	echo "===========DBMS==========="
	echo "1 For creating a database.";
	echo "2 For listing databases.";
	echo "3 For connecting to a database.";
	echo "4 For dropping database";
	echo "end For exiting.";
}


setEnv

while :
do 
	showDBMenu
	readInput
done

