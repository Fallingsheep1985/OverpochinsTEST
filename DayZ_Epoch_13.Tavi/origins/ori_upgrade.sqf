private ["_vehicle", "_part", "_hitpoint", "_nameType", "_cfg", "_tc", "_mt", "_mti", "_nameClass1", "_st", "_selection"];

if (DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_92") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;
s_player_repair_crtl = 1;

if ("PartGeneric" in magazines player) then {
	_vehicle = 	(_this select 3) select 0;
	_hitpoint = (_this select 3) select 1;
	_nameType = getText(configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "displayName");

	player playActionNow "Medic";
	[player,"repair",0,false,0] call dayz_zombieSpeak;
	player removeMagazine "PartGeneric";
	
	uiSleep 2;
	_cfg = configFile >> "CfgVehicles" >> typeOf _vehicle >> "AnimationSources";
	_tc = count _cfg;
	for "_mti" from 0 to _tc-1 do {
		_mt = (_cfg select _mti);
		_nameClass1 = configName(_mt);
		_st = configName(_mt);
		if (_st == _hitpoint) then { _selection = _st; };
	};
		
	PVDZ_veh_SF = [_vehicle,_selection,0];
	publicVariable "PVDZ_veh_SF";
	if (local _vehicle) then { PVDZ_veh_SF call object_setFixServer; };

	_vehicle setVelocity [0,0,1];
	cutText [format[(localize "str_epoch_player_166"),"Scrap metal",_nameType], "PLAIN DOWN"];
} else {
	cutText ["Missing 1 x Scrap metal", "PLAIN DOWN"];
};	

{dayz_myCursorTarget removeAction _x} count s_player_repairActions;
s_player_repairActions = [];
dayz_myCursorTarget = objNull;

s_player_repair_crtl = -1;
DZE_ActionInProgress = false;
