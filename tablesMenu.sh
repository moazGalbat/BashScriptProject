. ./creatTable.sh
. ./listTables.sh
. ./insertIntoTable.sh
. ./deleteFromTable.sh
. ./selectAllFromTable.sh
. ./dropTable.sh

function tablesMenu {
    echo "===========Tables==========="
	echo "1 Create New Table";
	echo "2 List existing Tables";
	echo "3 Insert into Table";
	echo "4 Delete from Table";
	echo "5 Select From Table";
	echo "6 Drop a table";
	echo "7 Back To Main Menu";


    local opt;
	echo "Choose an option."
	read opt
	case $opt in
		1) creatTable $dbname ;;
		2) listTables $dbname ;;
		3) insertIntoTable $dbname ;;
		4) deleteFromTable $dbname ;;
        5) selectAllFromTable $dbname ;;
        6) dropTable $dbname ;;
        7) break && ./main.sh ;;
		*) echo "Sorry unspecified option";;
	esac
    }

while :
	do 
		tablesMenu 
done