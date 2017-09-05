/*
	Hillbilly Mission by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
	Edited by Fuchs for EMS
*/
private ["_missName","_coords","_base","_base2","_base3","_crate"];

//Name of the Mission
_missName = "Hillbillies";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMinMarker;

[nil,nil,rTitleText,"Hillbillies have moved into the area", "PLAIN",10] call RE;

_base = createVehicle ["land_housev_1i4",[(_coords select 0) +2, (_coords select 1)+5,-0.3],[], 0, "CAN_COLLIDE"];
_base2 = createVehicle ["land_kbud",[(_coords select 0) - 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_base3 = createVehicle ["land_kbud",[(_coords select 0) - 7, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

//DZMSProtectObj prevents it from disappearing
[_base] call DZMSProtectObj;
[_base2] call DZMSProtectObj;
[_base3] call DZMSProtectObj;

//Add and fill the boxes
_crate = createVehicle ["USLaunchersBox",[(_coords select 0) + 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"weapons"] ExecVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[_coords,3,0,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;
[_coords,3,0,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;
[_coords,3,0,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;
[_coords,3,0,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp; 

//Let everyone know the mission is over
[nil,nil,rTitleText,"Survivors killed the Hillbillies! Loot them!", "PLAIN",6] call RE;
diag_log format["[DZMS]: Minor SM9 Hillbilly Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;