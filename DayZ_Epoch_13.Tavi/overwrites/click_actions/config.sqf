//  DZE_CLICK_ACTIONS
//      This is where you register your right-click actions
//  FORMAT -- (no comma after last array entry)
//      [_classname,_text,_execute,_condition],
//  PARAMETERS
//  _classname  : the name of the class to click on 
//                  (example = "ItemBloodbag")
//  _text       : the text for the option that is displayed when right clicking on the item 
//                  (example = "Self Transfuse")
//  _execute    : compiled code to execute when the option is selected 
//                  (example = "execVM 'my\scripts\self_transfuse.sqf';")
//  _condition  : compiled code evaluated to determine whether or not the option is displayed
//                  (example = {true})
//  EXAMPLE -- see below for some simple examples
DZE_CLICK_ACTIONS = [

["Binocular_Vector","Look @ 400m","execVM 'overwrites\click_actions\scripts\400.sqf'","true"],
["Binocular_Vector","Look @ 600m","execVM 'overwrites\click_actions\scripts\600.sqf'","true"],
["Binocular_Vector","Look @ 1000m","execVM 'overwrites\click_actions\scripts\1000.sqf'","true"],
["Binocular_Vector","Look @ 1200m","execVM 'overwrites\click_actions\scripts\1200.sqf'","true"],
["Binocular_Vector","Look @ 1600m (default)","execVM 'overwrites\click_actions\scripts\1600.sqf'","true"],
["Binocular_Vector","Look @ 2000m","execVM 'overwrites\click_actions\scripts\2000.sqf'","true"],
["Binocular_Vector","Look @ 4000m","execVM 'overwrites\click_actions\scripts\4000.sqf'","true"],
["Binocular_Vector","Look @ 5000m","execVM 'overwrites\click_actions\scripts\5000.sqf'","true"],

["ItemGPS","Grass On","setTerrainGrid 25; systemChat('Warning: Grass WILL lower your FPS!');","true"],
["ItemGPS","Grass Off","setTerrainGrid 50; systemChat('Grass is now off!');","true"],

["Binocular","Look @ 600m","execVM 'overwrites\click_actions\scripts\600.sqf'","true"],
["Binocular","Look @ 800m","execVM 'overwrites\click_actions\scripts\800.sqf'","true"],
["Binocular","Look @ 1000m","execVM 'overwrites\click_actions\scripts\1000.sqf'","true"],
["Binocular","Look @ 1200m","execVM 'overwrites\click_actions\scripts\1200.sqf'","true"],
["Binocular","Look @ 1400m","execVM 'overwrites\click_actions\scripts\1400.sqf'","true"],
["Binocular","Look @ 1600m (default)","execVM 'overwrites\click_actions\scripts\1600.sqf'","true"],
["Binocular","Look @ 1800m","execVM 'overwrites\click_actions\scripts\1800.sqf'","true"],
["Binocular","Look @ 2000m","execVM 'overwrites\click_actions\scripts\2000.sqf'","true"],
["Binocular","Look @ 3000m","execVM 'overwrites\click_actions\scripts\3000.sqf'","true"],
["Binocular","Look @ 4000m","execVM 'overwrites\click_actions\scripts\4000.sqf'","true"],

["ItemGPS","Locate vehicle","execVM 'scripts\locate_vehicle.sqf'","true"],
["ItemGPS","Fast Travel Test","execVM 'scripts\fasttravel\opendialog.sqf'","true"],
["ItemGPS","Server Rules","execVM 'custom\menu\menu_init.sqf'","true"],

["ItemKnife","Harvest weed","execVM 'scripts\weed\hemp.sqf'","true"],
["ItemKiloHemp","Smoke weed","execVM 'scripts\weed\smokeshit.sqf'","true"]

];






/*

Binocular_Vector


DZE_CLICK_ACTIONS = [
    ["ItemGPS","Scan Nearby","if(isNil 'DZE_CLICK_ACTIONS_GPS_RANGE') then {DZE_CLICK_ACTIONS_GPS_RANGE = 1500;};DZE_CLICK_ACTIONS_ZOMBIE_COUNT = count ((position player) nearEntities ['zZombie_Base',DZE_CLICK_ACTIONS_GPS_RANGE]); DZE_CLICK_ACTIONS_MAN_COUNT = count ((position player) nearEntities ['CAManBase',DZE_CLICK_ACTIONS_GPS_RANGE]);cutText[format['Within %1 Meters: %2 AI/players, %3 zombies, %4 vehicles',DZE_CLICK_ACTIONS_GPS_RANGE,DZE_CLICK_ACTIONS_MAN_COUNT - DZE_CLICK_ACTIONS_ZOMBIE_COUNT,count ((position player) nearEntities ['zZombie_Base',DZE_CLICK_ACTIONS_GPS_RANGE]),count ((position player) nearEntities ['allVehicles',DZE_CLICK_ACTIONS_GPS_RANGE]) - DZE_CLICK_ACTIONS_MAN_COUNT],'PLAIN DOWN'];","true"],
    ["ItemGPS","Range Up"   ,"if(isNil 'DZE_CLICK_ACTIONS_GPS_RANGE') then {DZE_CLICK_ACTIONS_GPS_RANGE = 1500;};DZE_CLICK_ACTIONS_GPS_RANGE = (DZE_CLICK_ACTIONS_GPS_RANGE + 100) min 2500; cutText[format['GPS RANGE: %1',DZE_CLICK_ACTIONS_GPS_RANGE],'PLAIN DOWN'];","true"],
    ["ItemGPS","Range Down" ,"if(isNil 'DZE_CLICK_ACTIONS_GPS_RANGE') then {DZE_CLICK_ACTIONS_GPS_RANGE = 1500;};DZE_CLICK_ACTIONS_GPS_RANGE = (DZE_CLICK_ACTIONS_GPS_RANGE - 100) max 1000;  cutText[format['GPS RANGE: %1',DZE_CLICK_ACTIONS_GPS_RANGE],'PLAIN DOWN'];","true"],
    ["ItemGPS","Toggle Map Marker","execVM 'overwrites\click_actions\examples\marker.sqf';","true"],
    ["ItemMap","Toggle Map Marker","execVM 'overwrites\click_actions\examples\marker.sqf';","true"]
];

*/