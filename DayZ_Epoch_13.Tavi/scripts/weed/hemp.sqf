/*
put together for DayZ Epoch
Credits to Shogun338 from Insurrection gaming
modified for separate "gather weed" script

private ["_gearmenu","_playerPos","_nearWeed","_weed","_objectID","_objectUID"];
_playerPos = getPosATL player;
_hempqty = {_x == "ItemKiloHemp"} count magazines player;
_nearWeed = count nearestObjects [_playerPos, ["fiberplant"], 4] > 0;
_weed = nearestObject [player, "fiberplant"];

if !(_nearWeed) exitWith {
	cutText [format["You need to be near the weed plants in order to gather."], "PLAIN DOWN"];
};
if (_hempqty >= 11) exitWith { 
    cutText [format["WARNING: %1, You have maximum amount of weed in your inventory! You could get arrested by the police ;)", name player], "PLAIN DOWN"];
};

	//disableSerialization;
	//_gearmenu = FindDisplay 106;
	//_gearmenu CloseDisplay 106;
	player playActionNow "Medic";
	r_interrupt = false;
	sleep 6;
	_objectID = _weed getVariable["ObjectID","0"];
	_objectUID = _weed getVariable["ObjectUID","0"];
	deleteVehicle _weed;
	[_objectID,_objectUID] call server_deleteObj;
	_weed setDamage 1;
	player addMagazine "ItemKiloHemp";
	sleep 2;
	cutText [format["You've Gathered Some Weed! Smoke that shit or sell it at Black market dealer!!"], "PLAIN DOWN"];
	
	
	*/
	
	
	/*
rewrited by juandayz for epoch 1.6
put together for DayZ Epoch
Credits to Shogun338 from Insurrection gaming
modified for separate "gather weed" script
*/

private ["_vehicle","_inVehicle","_countplayers","_gearmenu","_playerPos","_nearWeed","_weed","_objectID","_objectUID"];
_playerPos = getPosATL player;
_hempqty = {_x == "ItemKiloHemp"} count magazines player;
_nearWeed = count nearestObjects [_playerPos, ["fiberplant"], 4] > 0;
_weed = nearestObject [player, "fiberplant"];

if !(_nearWeed) exitWith {
 systemChat("You need to be near the weed plants in order to gather.");
};

if (player getVariable["combattimeout",0] >= diag_tickTime) exitWith {
dayz_actionInProgress = false; 
systemChat("Your in combat...");
};
_vehicle = vehicle player;
_inVehicle = (_vehicle != player);
_countplayers = count nearestObjects [player, ["CAManBase"], 7];
if (_inVehicle) exitWith {
 systemChat("you cannot harvest in a vehicle");
 };
if (_countplayers > 1) exitWith {

  systemChat("There is a player or object near you. Not possible to harvest.");
 };


	disableSerialization;
	_gearmenu = FindDisplay 106;
	_gearmenu CloseDisplay 106;
	player playActionNow "Medic";
	r_interrupt = false;
	sleep 6;
	//uncoment all comented lines if u have somekind of issue
	//_objectID = _weed getVariable["ObjectID","0"];
	//_objectUID = _weed getVariable["ObjectUID","0"];
	deleteVehicle _weed;
	//[_objectID,_objectUID] call server_deleteObj;
	//PVDZ_obj_Destroy = [_objectID,_objectUID,_weed];
    //publicVariableServer "PVDZ_obj_Destroy";
	player addMagazine "ItemKiloHemp";
	player addMagazine "ItemKiloHemp";
	player addMagazine "ItemKiloHemp";
	sleep 2;
	 systemChat("NICE LETS SMOKE OR SELL");