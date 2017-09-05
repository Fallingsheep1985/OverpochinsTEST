disableSerialization;
///////////////////
//////Config//////
/////////////////

_rule1title = "Change Log #11 03-09-17-17"; //Text that will be the title of rule #1
_rule1text = "Right Click GPS For Grass Options."; //Text that will go in rule # 1 Box, maximum of Approx 300 characters

_rule2title = "Change Log #7 25-08-17"; //Text that will be the title of rule #2
_rule2text = "Added New Air Traders, New Stuff Added To Traders And Price Changes."; //Text that will go in rule # 2 Box, maximum of Approx 300 characters

_rule3title = "Change Log #8 27-08-17"; //Text that will be the title of rule #3
_rule3text = "New Hero - Bandit Lv4 Lv5."; //Text that will go in rule # 3 Box, maximum of Approx 300 characters

_rule4title = "Change Log #9 02-09-17"; //Text that will be the title of rule #4
_rule4text = "Sector B Loot Upgrade."; //Text that will go in rule # 4 Box, maximum of Approx 300 characters

_rule5title = "Change Log #10 03-09-17"; //Text that will be the title of rule #5
_rule5text = "Spawn Within 500m Of Your PlotPole."; //Text that will go in rule # 5 Box, maximum of Approx 300 characters

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




