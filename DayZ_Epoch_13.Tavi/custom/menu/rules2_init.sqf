disableSerialization;
///////////////////
//////Config//////
/////////////////

_rule1title = "Rule #8 admin have also rules"; //Text that will be the title of rule #1
_rule1text = "Admins are active, but there only helping when really needed. not because of an arma error, etc."; //Text that will go in rule # 1 Box, maximum of maximum of Approx 300 characters

_rule2title = "Rule #7 Errors"; //Text that will be the title of rule #2
_rule2text = "Arma has a lot of errors because of all mods. do not use them to cheat!"; //Text that will go in rule # 2 Box, maximum of maximum of Approx 300 characters

_rule3title = "Rule #8 building"; //Text that will be the title of rule #3
_rule3text = "no building on roads, within 100m of runways or, within 1000m of a trader and 500m from military/high industrial areas.Plot pole must always be visible, do not hide it in a rock or item, etc. (you can hide it in a room with a door)"; //Text that will go in rule # 3 Box, maximum of maximum of Approx 300 characters

_rule4title = "Rule #9 combat log"; //Text that will be the title of rule #4
_rule4text = "No combat logging, you will be knocked out from infistar after relog."; //Text that will go in rule # 4 Box, maximum of maximum of Approx 300 characters

_rule5title = "Rule #10 safe zones"; //Text that will be the title of rule #5
_rule5text = "No running over people, stealing vehicles and or selling vehicles that are being sold in the safe zone traders. Vehicles left in the safe zone will be unlocked after restart!"; //Text that will go in rule # 5 Box, maximum of maximum of Approx 300 characters

nexts2cript = {((ctrlParent (_this select 0)) closeDisplay 7779); execvm 'custom\menu\rules3_init.sqf';}; //script that Next button will use 
previous2script = {((ctrlParent (_this select 0)) closeDisplay 7779); execvm 'custom\menu\rules_init.sqf';}; //script that previous button will use


createDialog "rules2";


////////////////////////////////
//DO NOT EDIT BELLOW THIS LINE//
////////////////////////////////


fnc_update_all_text = {
_finddialog = findDisplay 7779;
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




