function tablesMenu {
    echo "===========Tables==========="
	echo "1 Create New Table";
	echo "2 List existing Tables";
	echo "3 Insert into Table";
	echo "4 Delete from Table";
	echo "5 Select From Table";
	echo "6 Back To Main Menu";


    local opt;
	echo "Choose an option."
	read opt
	clear
	case $opt in
		1) creatTable $dbname ; tablesMenu;;
		2) listTables $dbname ; tablesMenu;;
		3) insertIntoTable $dbname; tablesMenu;;
		4) deleteFromTable $dbname ; tablesMenu;;
        5) selectAllFromTable $dbname ; tablesMenu;;
        6) main ;;
		*) echo "Sorry unspecified option";;
	esac
    }

    # function listTables {

    # }

    # function InsertTable {

    # }

    # function DeleteFromTable {

    # }

    # function SelectTable {

    # }
