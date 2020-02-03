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
		1) . ./creatTable.sh ; tablesMenu;;
		2) listTables ;;
		3) InsertTable;;
		4) DeleteFromTable ;;
        5) SelectTable ;;
        6) . ./main.sh ;;
		*) echo "Sorry unspecified option";;
	esac
    }

    tablesMenu


    function listTables {

    }

    function InsertTable {

    }

    function DeleteFromTable {

    }

    function SelectTable {

    }
