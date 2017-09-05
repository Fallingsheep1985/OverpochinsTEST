/*
	CH47 Mission by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to New Mission Format by Vampire
	Edited by Fuchs for EMS
*/

private ["_missName","_coords","_vehicle","_crate"];

//Name of the Mission
_missName = "CH47 Mission";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"A CH47 with building supplies has landed! Secure the chopper and the building supplies ", "PLAIN",10] call RE;

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMajMarker;

//Create the vehicles
_vehicle = createVehicle ["CH_47F_EP1_DZE",[(_coords select 0) + 25, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
[_vehicle] call DZMSSetupVehicle;

//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 6.1718,(_coords select 1) + 0.6426,0],[], 0, "CAN_COLLIDE"];
[_crate,"Supply2"] ExecVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],6,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],6,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],4,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],4,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;

//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
[_vehicle] ExecVM DZMSSaveVeh;

//Let everyone know the mission is over
[nil,nil,rTitleText,"Good work you've secured the helicopter!", "PLAIN",6] call RE;
diag_log text format["[DZMS]: Major SM10 CH47 Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;
