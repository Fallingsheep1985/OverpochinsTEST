disableSerialization;
///////////////////
//////Config//////
/////////////////

_rule1title = "Change Log #6 20-08-17"; //Text that will be the title of rule #1
_rule1text = "Added Day/Night Cycle - May Need Tweaking."; //Text that will go in rule # 1 Box, maximum of Approx 300 characters

_rule2title = "Change Log #7 25-08-17"; //Text that will be the title of rule #2
_rule2text = "Added New Air Traders, New Stuff At Trader And Price Changes."; //Text that will go in rule # 2 Box, maximum of Approx 300 characters

_rule3title = "Change Log #3 05-08-17"; //Text that will be the title of rule #3
_rule3text = "Bank At Plot Pole."; //Text that will go in rule # 3 Box, maximum of Approx 300 characters

_rule4title = "Change Log #4 06-08-17"; //Text that will be the title of rule #4
_rule4text = "Removed Heli AI From SecB To Improve Server Performance."; //Text that will go in rule # 4 Box, maximum of Approx 300 characters

_rule5title = "Change Log #5 08-08-17"; //Text that will be the title of rule #5
_rule5text = "Fixed Vote Day/Night - Stays As Voted."; //Text that will go in rule # 5 Box, maximum of Approx 300 characters

createDialog "rules";


////////////////////////////////
//DO NOT EDIT BELLOW THIS LINE//
////////////////////////////////


fnc_update_all_text = {
_finddialog = findDisplay 7778;
(_finddialog displayCtrl 1001) ctrlSetText format["%1",_rule1title];
(_finddialog displayCtrl 1100) ctrlSetText format["%1",_rule1text];
(_finddialog displayCtrl 1002) ctrlSetText format["%1",_rule2title];
(_finddialog displayCtrl 1101) ctrlSetText format["%1",_rule2text];
(_finddialog displayCtrl 1003) ctrlSetText format["%1",_rule3title];
(_finddialog displayCtrl 1102) ctrlSetText format["%1",_rule3text];
(_finddialog displayCtrl 1004) ctrlSetText format["%1",_rule4title];
(_finddialog displayCtrl 1103) ctrlSetText format["%1",_rule4text];
(_finddialog displayCtrl 1005) ctrlSetText format["%1",_rule5title];
(_finddialog displayCtrl 1104) ctrlSetText format["%1",_rule5text];
};

call fnc_update_all_text;




