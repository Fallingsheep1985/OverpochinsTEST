private ["_date","_year","_month","_day","_hour","_minute","_date1","_key","_objectCount","_dir","_point","_i","_action","_dam","_selection","_wantExplosiveParts","_entity","_worldspace","_damage","_booleans","_rawData","_ObjectID","_class","_CharacterID","_inventory","_hitpoints","_fuel","_id","_objectArray","_script","_result","_outcome","_shutdown","_res"];
[] execVM "\z\addons\dayz_server\system\s_fps.sqf"; //server monitor FPS (writes each ~181s diag_fps+181s diag_fpsmin*)
#include "\z\addons\dayz_server\compile\server_toggle_debug.hpp"

waitUntil {!isNil "BIS_MPF_InitDone" && initialized};
if (!isNil "sm_done") exitWith {}; // prevent server_monitor be called twice (bug during login of the first player)
sm_done = false;

_legacyStreamingMethod = false; //use old object streaming method, more secure but will be slower and subject to the callExtension return size limitation.

dayz_serverIDMonitor = [];
_DZE_VehObjects = [];
dayz_versionNo = getText (configFile >> "CfgMods" >> "DayZ" >> "version");
dayz_hiveVersionNo = getNumber (configFile >> "CfgMods" >> "DayZ" >> "hiveVersion");
_hiveLoaded = false;
_serverVehicleCounter = [];
_tempMaint = DayZ_WoodenFence + DayZ_WoodenGates;
diag_log "HIVE: Starting";

//Set the Time
_key = "CHILD:307:";
_result = _key call server_hiveReadWrite;
_outcome = _result select 0;
if (_outcome == "PASS") then {
	_date = _result select 1;
	_year = _date select 0;
	_month = _date select 1;
	_day = _date select 2;
	_hour = _date select 3;
	_minute = _date select 4;

	if (dayz_ForcefullmoonNights) then {_date = [2012,8,2,_hour,_minute];};
	diag_log ["TIME SYNC: Local Time set to:", _date, "Fullmoon:",dayz_ForcefullmoonNights,"Date given by HiveExt.dll:",_result select 1];
	setDate _date;
	dayzSetDate = _date;
	publicVariable "dayzSetDate";
};

//Stream in objects
/* STREAM OBJECTS */
//Send the key
_timeStart = diag_tickTime;

for "_i" from 1 to 5 do {
	diag_log "HIVE: trying to get objects";
	_key = format["CHILD:302:%1:%2:",dayZ_instance, _legacyStreamingMethod];
	_result = _key call server_hiveReadWrite;  
	if (typeName _result == "STRING") then {
		_shutdown = format["CHILD:400:%1:",(profileNamespace getVariable "SUPERKEY")];
		_res = _shutdown call server_hiveReadWrite;
		diag_log ("HIVE: attempt to kill.. HiveExt response:"+str(_res));
	} else {
		diag_log ("HIVE: found "+str(_result select 1)+" objects" );
		_i = 99; // break
	};
};

if (typeName _result == "STRING") exitWith {
	diag_log "HIVE: Connection error. Server_monitor.sqf is exiting.";
};	

diag_log "HIVE: Request sent";
_myArray = [];
_val = 0;
_status = _result select 0; //Process result
_val = _result select 1;
if (_legacyStreamingMethod) then {
	if (_status == "ObjectStreamStart") then {
		profileNamespace setVariable ["SUPERKEY",(_result select 2)];
		_hiveLoaded = true;
		//Stream Objects
		diag_log ("HIVE: Commence Object Streaming...");
		for "_i" from 1 to _val do  {
			_result = _key call server_hiveReadWriteLarge;
			_status = _result select 0;
			_myArray set [count _myArray,_result];
		};
	};
} else {
	if (_val > 0) then {
		_fileName = _key call server_hiveReadWrite;
		_lastFN = profileNamespace getVariable["lastFN",""];
		profileNamespace setVariable["lastFN",_fileName];
		saveProfileNamespace;
		if (_status == "ObjectStreamStart") then {
			profileNamespace setVariable ["SUPERKEY",(_result select 2)];
			_hiveLoaded = true;
			_myArray = Call Compile PreProcessFile _fileName;
			_key = format["CHILD:302:%1:%2:",_lastFN, _legacyStreamingMethod];
			_result = _key call server_hiveReadWrite; //deletes previous object data dump
		};
	} else {
		if (_status == "ObjectStreamStart") then {
			profileNamespace setVariable ["SUPERKEY",(_result select 2)];
			_hiveLoaded = true;
		};
	};
};

diag_log ("HIVE: Streamed " + str(_val) + " objects");

// Don't spawn objects if no clients are online (createVehicle fails with Ref to nonnetwork object)
if ((playersNumber west + playersNumber civilian) == 0) exitWith {
	diag_log "All clients disconnected. Server_monitor.sqf is exiting.";
};

{
	private ["_object","_posATL"];
	//Parse Array
	_action = 		_x select 0; 
	_idKey = 		_x select 1;
	_type =			_x select 2;
	_ownerID = 		_x select 3;
	_worldspace = 	_x select 4;
	_inventory =	_x select 5;
	_hitPoints =	_x select 6;
	_fuel =			_x select 7;
	_damage = 		_x select 8;
	_storageMoney = _x select 9;

	//set object to be in maintenance mode
	_maintenanceMode = false;
	_maintenanceModeVars = [];
	
	_dir = 90;
	_pos = [0,0,0];
	_wsDone = false;
	_wsCount = count _worldspace;

	//Vector building
	_vector = [[0,0,0],[0,0,0]];
	_vecExists = false;
	_ownerPUID = "0";

	if (_wsCount >= 2) then {
		_dir = _worldspace select 0;
		_posATL = _worldspace select 1;
		if (count _posATL == 3) then {
			_pos = _posATL;
			_wsDone = true;					
		};
		if (_wsCount >= 3) then{
			_ws2TN = typename (_worldspace select 2);
			_ws3TN = typename (_worldspace select 3);
			if (_wsCount == 3) then{
					if (_ws2TN == "STRING") then{
						_ownerPUID = _worldspace select 2;
					} else {
						 if (_ws2TN == "ARRAY") then{
							_vector = _worldspace select 2;
							_vecExists = true;
						};                  
					};
			} else {
				if (_wsCount == 4) then{
					if (_ws3TN == "STRING") then{
						_ownerPUID = _worldspace select 3;
					} else {
						if (_ws2TN == "STRING") then{
							_ownerPUID = _worldspace select 2;
						};
					};
					if (_ws2TN == "ARRAY") then{
						_vector = _worldspace select 2;
						_vecExists = true;
					} else {
						if (_ws3TN == "ARRAY") then{
							_vector = _worldspace select 3;
							_vecExists = true;
						};
					};
				};
			};
		} else {
			_worldspace set [count _worldspace, "0"];
		};
	};

	if (!_wsDone) then {
		if ((count _posATL) >= 2) then {
			_pos = [_posATL select 0,_posATL select 1,0];
			diag_log format["MOVED OBJ: %1 of class %2 with worldspace array = %3 to pos: %4",_idKey,_type,_worldspace,_pos];
		} else {
			diag_log format["MOVED OBJ: %1 of class %2 with worldspace array = %3 to pos: [0,0,0]",_idKey,_type,_worldspace];
		};
	};

	//diag_log format["OBJ: %1 - %2,%3,%4,%5,%6,%7,%8", _idKey,_type,_ownerID,_worldspace,_inventory,_hitPoints,_fuel,_damage];
	/*
		if (_type in _tempMaint) then {
			//Use hitpoints for Maintenance system and other systems later.
			//Enable model swap for a damaged model.
			if ("Maintenance" in _hitPoints) then {
				_maintenanceModeVars = [_type,_pos];
				_type = _type + "_Damaged";
			};	
			//TODO add remove object and readd old fence (hideobject would be nice to use here :-( )
			//Pending change to new fence models\Layout
		};
	*/
		_nonCollide = _type in DayZ_nonCollide;	
		//Create it
		if (_nonCollide) then {
			_object = createVehicle [_type, [0,0,0], [], 0, "NONE"];
		} else {
			_object = _type createVehicle [0,0,0]; //more than 2x faster than createvehicle array
		};
		_object setDir _dir;
		_object setPosATL _pos;
		_object setDamage _damage;
		if (_vecExists) then {
			_object setVectorDirAndUp _vector;
		};
		_object enableSimulation false;

		_doorLocked = _type in DZE_DoorsLocked;
		_isPlot = _type == "Plastic_Pole_EP1_DZ";
		
		// prevent immediate hive write when vehicle parts are set up
		_object setVariable ["lastUpdate",diag_ticktime];
		_object setVariable ["ObjectID", _idKey, true];
		_object setVariable ["OwnerPUID", _ownerPUID, true];
		if (Z_SingleCurrency && {(_type in DZE_MoneyStorageClasses) || (_object isKindOf "AllVehicles")}) then {
			_object setVariable [Z_MoneyVariable, _storageMoney, true];
		};

		dayz_serverIDMonitor set [count dayz_serverIDMonitor,_idKey];
		
		if (!_wsDone) then {[_object,"position",true] call server_updateObject;};
		if (_type == "Base_Fire_DZ") then {_object spawn base_fireMonitor;};
		
		_isDZ_Buildable = _object isKindOf "DZ_buildables";
		_isTrapItem = _object isKindOf "TrapItems";
		_isSafeObject = _type in DayZ_SafeObjects;
		
		//Dont add inventory for traps.
		if (!_isDZ_Buildable && !_isTrapItem) then {
			clearWeaponCargoGlobal _object;
			clearMagazineCargoGlobal _object;
			clearBackpackCargoGlobal _object;
			if( (count _inventory > 0) && !_isPlot && !_doorLocked) then {
				if (_type in DZE_LockedStorage) then {
					// Do not send big arrays over network! Only server needs these
					_object setVariable ["WeaponCargo",(_inventory select 0),false];
					_object setVariable ["MagazineCargo",(_inventory select 1),false];
					_object setVariable ["BackpackCargo",(_inventory select 2),false];
				} else {
					_weaponcargo = _inventory select 0 select 0;
					_magcargo = _inventory select 1 select 0;
					_backpackcargo = _inventory select 2 select 0;
				   _weaponqty = _inventory select 0 select 1;
					{_object addWeaponCargoGlobal [_x, _weaponqty select _foreachindex];} foreach _weaponcargo;

					_magqty = _inventory select 1 select 1;
					{_object addMagazineCargoGlobal [_x, _magqty select _foreachindex];} foreach _magcargo;

					_backpackqty = _inventory select 2 select 1;
					{_object addBackpackCargoGlobal [_x, _backpackqty select _foreachindex];} foreach _backpackcargo;
				};
			} else {
				if (DZE_permanentPlot && _isPlot) then {
					_object setVariable ["plotfriends", _inventory, true];
				};
				if (DZE_doorManagement && _doorLocked) then {
					_object setVariable ["doorfriends", _inventory, true];
				};
			};
		};
		
		if (_object isKindOf "AllVehicles") then {
			_object setVariable ["CharacterID", _ownerID, true];
			_isAir = _object isKindOf "Air";
			{
				_selection = _x select 0;
				_dam = if (!_isAir && {_selection in dayZ_explosiveParts}) then {(_x select 1) min 0.8;} else {_x select 1;};
				_strH = "hit_" + (_selection);
				_object setHit[_selection,_dam];
				_object setVariable [_strH,_dam,true];
			} foreach _hitpoints;
			[_object,"damage"] call server_updateObject;

			_object setFuel _fuel;
			if (!_isSafeObject) then {
				_DZE_VehObjects set [count _DZE_VehObjects,_object]; 
				_object call fnc_veh_ResetEH;
				if (_ownerID != "0" && {!(_object isKindOf "Bicycle")}) then {_object setVehicleLock "locked";};
				_serverVehicleCounter set [count _serverVehicleCounter,_type]; // total each vehicle
			} else {
				_object enableSimulation true;
			};
		} else {
			// Fix for leading zero issues on safe codes after restart
			_lockable = getNumber (configFile >> "CfgVehicles" >> _type >> "lockable");
			_codeCount = count (toArray _ownerID);
			switch (_lockable) do {
				case 4: {
					switch (_codeCount) do {
						case 3: {_ownerID = format["0%1",_ownerID];};
						case 2: {_ownerID = format["00%1",_ownerID];};
						case 1: {_ownerID = format["000%1",_ownerID];};
					};
				};
				case 3: {
					switch (_codeCount) do {
						case 2: {_ownerID = format["0%1",_ownerID];};
						case 1: {_ownerID = format["00%1",_ownerID];};
					};
				};
			};
			_object setVariable ["CharacterID", _ownerID, true];
			if (_isDZ_Buildable || {(_isSafeObject && !_isTrapItem)}) then {
				_object setVariable["memDir",_dir,true];
				if (DZE_GodModeBase && {!(_type in DZE_GodModeBaseExclude)}) then {
					_object addEventHandler ["HandleDamage",{false}];
				} else {
					_object addMPEventHandler ["MPKilled",{_this call vehicle_handleServerKilled;}];
				};
				_object setVariable ["OEMPos",_pos,true]; // used for inplace upgrades and lock/unlock of safe
			} else {
				_object enableSimulation true;
			};
			if (_isDZ_Buildable || {_isTrapItem}) then {
				//Use inventory for owner/clan info and traps armed state
				{
					_xTypeName = typeName _x;
					switch (_xTypeName) do {
						case "ARRAY": {
							_x1 = _x select 1;
							switch (_x select 0) do {
								case "ownerArray" : { _object setVariable ["ownerArray", _x1, true]; };
								case "clanArray" : { _object setVariable ["clanArray", _x1, true]; };
								case "armed" : { _object setVariable ["armed", _x1, true]; };
								case "padlockCombination" : { _object setVariable ["dayz_padlockCombination", _x1, false]; };
								case "BuildLock" : { _object setVariable ["BuildLock", _x1, true]; };
							};
						};
						case "STRING": {_object setVariable ["ownerArray", [_x], true]; };
						case "BOOLEAN": {_object setVariable ["armed", _x, true]};
					};
				} foreach _inventory;
				
				if (_maintenanceMode) then { _object setVariable ["Maintenance", true, true]; _object setVariable ["MaintenanceVars", _maintenanceModeVars]; };
			};
		};
		dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object]; //Monitor the object
} forEach _myArray;

//enable simulation on vehicles after all buildables are spawned
{
	_x enableSimulation true;
	_x setVelocity [0,0,1];
} forEach _DZE_VehObjects;

diag_log format["HIVE: BENCHMARK - Server_monitor.sqf finished streaming %1 objects in %2 seconds (unscheduled)",_val,diag_tickTime - _timeStart];

// # END OF STREAMING #
if (dayz_townGenerator) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_plantSpawner.sqf"; // Draw the pseudo random seeds
};
[] execFSM "\z\addons\dayz_server\system\server_vehicleSync.fsm"; 
[] execVM "\z\addons\dayz_server\system\scheduler\sched_init.sqf"; // launch the new task scheduler

createCenter civilian;

actualSpawnMarkerCount = 0;
// count valid spawn markers, since different maps have different amounts
for "_i" from 0 to 10 do {
	if ((getMarkerPos format["spawn%1",_i]) distance [0,0,0] > 0) then {
		actualSpawnMarkerCount = actualSpawnMarkerCount + 1;
	} else {
		_i = 11; // exit since we did not find any further markers 
	};
};
diag_log format["Total Number of spawn locations %1", actualSpawnMarkerCount];

if (isDedicated) then {endLoadingScreen;};
[] ExecVM "\z\addons\dayz_server\WAI\init.sqf";
[] ExecVM "\z\addons\dayz_server\DZMS\DZMSInit.sqf";
allowConnection = true;
sm_done = true;
publicVariable "sm_done";

// Trap loop
[] spawn {
	private ["_array","_array2","_array3","_script","_armed"];
	_array = str dayz_traps;
	_array2 = str dayz_traps_active;
	_array3 = str dayz_traps_trigger;

	while {1 == 1} do {
		if ((str dayz_traps != _array) || (str dayz_traps_active != _array2) || (str dayz_traps_trigger != _array3)) then {
			_array = str dayz_traps;
			_array2 = str dayz_traps_active;
			_array3 = str dayz_traps_trigger;
			//diag_log "DEBUG: traps";
			//diag_log format["dayz_traps (%2) -> %1", dayz_traps, count dayz_traps];
			//diag_log format["dayz_traps_active (%2) -> %1", dayz_traps_active, count dayz_traps_active];
			//diag_log format["dayz_traps_trigger (%2) -> %1", dayz_traps_trigger, count dayz_traps_trigger];
			//diag_log "DEBUG: end traps";
		};

		{
			if (isNull _x) then {
				dayz_traps = dayz_traps - [_x];
				_armed = false;
				_script = {};
			} else {
				_armed = _x getVariable ["armed", false];
				_script = call compile getText (configFile >> "CfgVehicles" >> typeOf _x >> "script");
			};
			
			if (_armed) then {
				if !(_x in dayz_traps_active) then {["arm", _x] call _script;};
			} else {
				if (_x in dayz_traps_active) then {["disarm", _x] call _script;};
			};
			uiSleep 0.01;
		} forEach dayz_traps;
		uiSleep 1;
	};
};

//Points of interest
//[] execVM "\z\addons\dayz_server\compile\server_spawnInfectedCamps.sqf"; //Adds random spawned camps in the woods with corpses and loot tents (negatively impacts FPS)
[] execVM "\z\addons\dayz_server\compile\server_spawnCarePackages.sqf";
[] execVM "\z\addons\dayz_server\compile\server_spawnCrashSites.sqf";

if (dayz_townGenerator) then {execVM "\z\addons\dayz_server\system\lit_fireplaces.sqf";};

"PVDZ_sec_atp" addPublicVariableEventHandler {
	_x = _this select 1;
	switch (1==1) do {
		case (typeName (_x select 0) == "SCALAR") : { // just some logs from the client
			diag_log (toString _x);
		};
		case (count _x == 2) : { // wrong side
			diag_log format["P1ayer %1 reports possible 'side' hack. Server may be compromised!",(_x select 1) call fa_plr2Str];
		};
		default { // player hit
			_unit = _x select 0;
			_source = _x select 1;
			if (!isNull _source) then {
				diag_log format ["P1ayer %1 hit by %2 %3 from %4 meters in %5 for %6 damage",
					_unit call fa_plr2Str, _source call fa_plr2Str, toString (_x select 2), _x select 3, _x select 4, _x select 5];
			};
		};
	};
};

"PVDZ_objgather_Knockdown" addPublicVariableEventHandler {
	_tree = (_this select 1) select 0;
	_player = (_this select 1) select 1;
	_dis = _player distance _tree;
	_name = if (alive _player) then {name _player} else {"DeadPlayer"};
	_uid = getPlayerUID _player;
	_treeModel = _tree call fn_getModelName;

	if ((_dis < 30) && (_treeModel in dayz_trees) && (_uid != "")) then {
		_tree setDamage 1;
		dayz_choppedTrees set [count dayz_choppedTrees,_tree];
		diag_log format["Server setDamage on tree %1 chopped down by %2(%3)",_treeModel,_name,_uid];
	};
};

// preload server traders menu data into cache
if !(DZE_ConfigTrader) then {
	{
		// get tids
		_traderData = call compile format["menu_%1;",_x];
		if (!isNil "_traderData") then {
			{
				_traderid = _x select 1;
				_retrader = [];

				_key = format["CHILD:399:%1:",_traderid];
				_data = "HiveEXT" callExtension _key;
				_result = call compile format["%1",_data];
				_status = _result select 0;
		
				if (_status == "ObjectStreamStart") then {
					_val = _result select 1;
					call compile format["ServerTcache_%1 = [];",_traderid];
					for "_i" from 1 to _val do {
						_data = "HiveEXT" callExtension _key;
						_result = call compile format ["%1",_data];
						call compile format["ServerTcache_%1 set [count ServerTcache_%1,%2]",_traderid,_result];
						_retrader set [count _retrader,_result];
					};
				};
			} forEach (_traderData select 0);
		};
	} forEach serverTraders;
};

if (_hiveLoaded) then {
	_serverVehicleCounter spawn {
		//  spawn_vehicles
		// Get all buildings and roads only once. Very taxing, but only on first startup
		_serverVehicleCounter = _this;
		_vehiclesToUpdate = [];
		_startTime = diag_tickTime;
		_buildingList = [];
		_cfgLootFile = missionConfigFile >> "CfgLoot" >> "Buildings";
		{
			if (isClass (_cfgLootFile >> typeOf _x)) then {
				_buildingList set [count _buildingList,_x];
			};
		} count (getMarkerPos "center" nearObjects ["building",((getMarkerSize "center") select 1)]);
		_roadList = getMarkerPos "center" nearRoads ((getMarkerSize "center") select 1);
		
		_vehLimit = MaxVehicleLimit - (count _serverVehicleCounter);
		if (_vehLimit > 0) then {
			diag_log ("HIVE: Spawning # of Vehicles: " + str(_vehLimit));
			for "_x" from 1 to _vehLimit do {call spawn_vehicles;};
		} else {
			diag_log "HIVE: Vehicle Spawn limit reached!";
			_vehLimit = 0;
		};
		
		if (dayz_townGenerator) then {
			// Vanilla town generator spawns debris locally on each client
			MaxDynamicDebris = 0;
		} else {
			// Epoch global dynamic debris
			diag_log ("HIVE: Spawning # of Debris: " + str(MaxDynamicDebris));
			for "_x" from 1 to MaxDynamicDebris do {call spawn_roadblocks;};
		};

		diag_log ("HIVE: Spawning # of Ammo Boxes: " + str(MaxAmmoBoxes));
		for "_x" from 1 to MaxAmmoBoxes do {call spawn_ammosupply;};

		diag_log ("HIVE: Spawning # of Veins: " + str(MaxMineVeins));
		for "_x" from 1 to MaxMineVeins do {call spawn_mineveins;};
		
		diag_log format["HIVE: BENCHMARK - Server finished spawning %1 DynamicVehicles, %2 Debris, %3 SupplyCrates and %4 MineVeins in %5 seconds (scheduled)",_vehLimit,MaxDynamicDebris,MaxAmmoBoxes,MaxMineVeins,diag_tickTime - _startTime];
		
		//Update gear last after all dynamic vehicles are created to save random loot to database (low priority)
		{[_x,"gear"] call server_updateObject} count _vehiclesToUpdate;
	};
};
	//Origins
	if (isServer && isNil "sm_done") then {

	serverVehicleCounter = [];
	_hiveResponse = [];

	for "_i" from 1 to 5 do {
		diag_log "HIVE: trying to get objects";
		_key = format["CHILD:302:%1:", dayZ_instance];
		_hiveResponse = _key call server_hiveReadWrite;  
		if ((((isnil "_hiveResponse") || {(typeName _hiveResponse != "ARRAY")}) || {((typeName (_hiveResponse select 1)) != "SCALAR")})) then {
			if ((_hiveResponse select 1) == "Instance already initialized") then {
				_superkey = profileNamespace getVariable "SUPERKEY";
				_shutdown = format["CHILD:400:%1:", _superkey];
				_res = _shutdown call server_hiveReadWrite;
				diag_log ("HIVE: attempt to kill.. HiveExt response:"+str(_res));
			} else {
				diag_log ("HIVE: connection problem... HiveExt response:"+str(_hiveResponse));
			
			};
			_hiveResponse = ["",0];
		} 
		else {
			diag_log ("HIVE: found "+str(_hiveResponse select 1)+" objects" );
			_i = 99; // break
		};
	};
	
	_BuildingQueue = [];
	_objectQueue = [];
	_originsQueue = [];
	//Define arrays
	owner_B1 = [];
	owner_B2 = [];
	owner_B3 = [];
	owner_H1 = [];
	owner_H2 = [];
	owner_H3 = [];
	owner_SG = [];
	owner_LG = [];
	owner_KING = [];
	owner_SH = [];
	if ((_hiveResponse select 0) == "ObjectStreamStart") then {
	
		// save superkey
		profileNamespace setVariable ["SUPERKEY",(_hiveResponse select 2)];
		
		_hiveLoaded = true;
	
		diag_log ("HIVE: Commence Object Streaming...");
		_key = format["CHILD:302:%1:", dayZ_instance];
		_objectCount = _hiveResponse select 1;
		_bQty = 0;
		_vQty = 0;
		_oQty = 0;
		for "_i" from 1 to _objectCount do {
			_isOrigins = false;
			_hiveResponse = _key call server_hiveReadWriteLarge;
			//diag_log (format["HIVE dbg %1 %2", typeName _hiveResponse, _hiveResponse]);
			{
				if((_hiveResponse select 2) isKindOf _x) exitWith {
					_originsQueue set [_oQty,_hiveResponse];
					_oQty = _oQty + 1;
					_isOrigins = true;
				};
			} forEach DZE_Origins_Buildings;
			if(!_isOrigins) then {
				if ((_hiveResponse select 2) isKindOf "ModularItems") then {
					_BuildingQueue set [_bQty,_hiveResponse];
					_bQty = _bQty + 1;
				} else {
					_objectQueue set [_vQty,_hiveResponse];
					_vQty = _vQty + 1;
				};
			};
		};
		diag_log ("HIVE: got " + str(_bQty) + " Epoch Objects and " + str(_vQty) + " Vehicles");
	};
	
	
		// # NOW SPAWN OBJECTS #
	_totalvehicles = 0;
	PVDZE_EvacChopperFields = [];
	{
		_idKey = 		_x select 1;
		_type =			_x select 2;
		_ownerID = 		_x select 3;

		_worldspace = 	_x select 4;
		_intentory =	_x select 5;
		_hitPoints =	_x select 6;
		_fuel =			_x select 7;
		_damage = 		_x select 8;
		
		_dir = 0;

		
		_pos = [0,0,0];
		_wsDone = false;
		if (count _worldspace >= 2) then
		{
			if ((typeName (_worldspace select 0)) == "STRING") then {
				_worldspace set [0, call compile (_worldspace select 0)];
				_worldspace set [1, call compile (_worldspace select 1)];
			};
			_dir = _worldspace select 0;
			if (count (_worldspace select 1) == 3) then {
				_pos = _worldspace select 1;
				_wsDone = true;
			}
		};	
		
		if (!_wsDone) then {
			if (count _worldspace >= 1) then { _dir = _worldspace select 0; };
			_pos = [getMarkerPos "center",0,4000,10,0,2000,0] call BIS_fnc_findSafePos;
			if (count _pos < 3) then { _pos = [_pos select 0,_pos select 1,0]; };
			diag_log ("MOVED OBJ: " + str(_idKey) + " of class " + _type + " to pos: " + str(_pos));
		};
		
		_vector = [[0,0,0],[0,0,0]];
		_vecExists = false;
		_ownerPUID = "0";
		if (count _worldspace >= 3) then{
			if(count _worldspace == 3) then{
					if(typename (_worldspace select 2) == "STRING")then{
						_ownerPUID = _worldspace select 2;
					}else{
						 if(typename (_worldspace select 2) == "ARRAY")then{
							_vector = _worldspace select 2;
							if(count _vector == 2)then{
								if(((count (_vector select 0)) == 3) && ((count (_vector select 1)) == 3))then{
									_vecExists = true;
								};
							};
						};					
					};
					
			}else{
				//Was not 3 elements, so check if 4 or more
				if(count _worldspace == 4) then{
					if(typename (_worldspace select 3) == "STRING")then{
						_ownerPUID = _worldspace select 3;
					}else{
						if(typename (_worldspace select 2) == "STRING")then{
							_ownerPUID = _worldspace select 2;
						};
					};
			
			
					if(typename (_worldspace select 2) == "ARRAY")then{
						_vector = _worldspace select 2;
						if(count _vector == 2)then{
							if(((count (_vector select 0)) == 3) && ((count (_vector select 1)) == 3))then{
								_vecExists = true;
							};
						};
					}else{
						if(typename (_worldspace select 3) == "ARRAY")then{
							_vector = _worldspace select 3;
							if(count _vector == 2)then{
								if(((count (_vector select 0)) == 3) && ((count (_vector select 1)) == 3))then{
									_vecExists = true;
								};
							};
						};
					};
					
				}else{
					//More than 3 or 4 elements found
					//Might add a search for the vector, ownerPUID will equal 0
				};
			};
		};
		   	   
		// diag_log format["Server_monitor: [ObjectID = %1]  [ClassID = %2] [_ownerPUID = %3]", _idKey, _type, _ownerPUID];
		
		if (_damage < 1) then {
			//diag_log format["OBJ: %1 - %2", _idKey,_type];
			
			//Create it
			_object = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
			_object setVariable ["lastUpdate",time];
			_object setVariable ["ObjectID", _idKey, true];
			if (typeOf (_object) == "Plastic_Pole_EP1_DZ") then {
				_object setVariable ["plotfriends", _intentory, true];
			};
			_object setVariable ["OwnerPUID", _ownerPUID, true];
			if (typeOf (_object) in  DZE_DoorsLocked) then {
				_object setVariable ["doorfriends", _intentory, true];
			};
			_lockable = 0;
			if(isNumber (configFile >> "CfgVehicles" >> _type >> "lockable")) then {
				_lockable = getNumber(configFile >> "CfgVehicles" >> _type >> "lockable");
			};

			// fix for leading zero issues on safe codes after restart
			if (_lockable == 4) then {
				_codeCount = (count (toArray _ownerID));
				if(_codeCount == 3) then {
					_ownerID = format["0%1", _ownerID];
				};
				if(_codeCount == 2) then {
					_ownerID = format["00%1", _ownerID];
				};
				if(_codeCount == 1) then {
					_ownerID = format["000%1", _ownerID];
				};
			};

			if (_lockable == 3) then {
				_codeCount = (count (toArray _ownerID));
				if(_codeCount == 2) then {
					_ownerID = format["0%1", _ownerID];
				};
				if(_codeCount == 1) then {
					_ownerID = format["00%1", _ownerID];
				};
			};

			_object setVariable ["CharacterID", _ownerID, true];
			
			clearWeaponCargoGlobal  _object;
			clearMagazineCargoGlobal  _object;
			// _object setVehicleAmmo DZE_vehicleAmmo;
			
			_object setdir _dir;
			
			if(_vecExists)then{
				_object setVectorDirAndUp _vector;
			};
			
			_object setposATL _pos;
			_object setDamage _damage;
			
			if ((typeOf _object) in dayz_allowedObjects) then {
				if (DZE_GodModeBase) then {
					_object addEventHandler ["HandleDamage", {false}];
				} else {
					_object addMPEventHandler ["MPKilled",{_this call object_handleServerKilled;}];
				};
				// Test disabling simulation server side on buildables only.
				_object enableSimulation false;
				// used for inplace upgrades && lock/unlock of safe
				_object setVariable ["OEMPos", _pos, true];
				
			};

			//if (count _intentory > 0) then {
			 if ((count _intentory > 0) && !(typeOf( _object) in  DZE_DoorsLocked) && !(typeOf( _object) == "Plastic_Pole_EP1_DZ")) then {
				if( count (_intentory) > 3)then{
					_object setVariable ["bankMoney", _intentory select 3, true];
				}else{
					_object setVariable ["bankMoney", 0, true];
				};
				if (_type in DZE_LockedStorage || _type in DZE_Origins_Buildings) then {
					// Fill variables with loot
					_object setVariable ["WeaponCargo", (_intentory select 0),true];
					_object setVariable ["MagazineCargo", (_intentory select 1),true];
					_object setVariable ["BackpackCargo", (_intentory select 2),true];
				} else {

					//Add weapons
					_objWpnTypes = (_intentory select 0) select 0;
					_objWpnQty = (_intentory select 0) select 1;
					_countr = 0;					
					{
						if(_x in (DZE_REPLACE_WEAPONS select 0)) then {
							_x = (DZE_REPLACE_WEAPONS select 1) select ((DZE_REPLACE_WEAPONS select 0) find _x);
						};
						_isOK = 	isClass(configFile >> "CfgWeapons" >> _x);
						if (_isOK) then {
							_object addWeaponCargoGlobal [_x,(_objWpnQty select _countr)];
						};
						_countr = _countr + 1;
					} count _objWpnTypes; 
				
					//Add Magazines
					_objWpnTypes = (_intentory select 1) select 0;
					_objWpnQty = (_intentory select 1) select 1;
					_countr = 0;
					{
						if (_x == "BoltSteel") then { _x = "WoodenArrow" }; // Convert BoltSteel to WoodenArrow
						if (_x == "ItemTent") then { _x = "ItemTentOld" };
						_isOK = 	isClass(configFile >> "CfgMagazines" >> _x);
						if (_isOK) then {
							_object addMagazineCargoGlobal [_x,(_objWpnQty select _countr)];
						};
						_countr = _countr + 1;
					} count _objWpnTypes;

					//Add Backpacks
					_objWpnTypes = (_intentory select 2) select 0;
					_objWpnQty = (_intentory select 2) select 1;
					_countr = 0;
					{
						_isOK = 	isClass(configFile >> "CfgVehicles" >> _x);
						if (_isOK) then {
							_object addBackpackCargoGlobal [_x,(_objWpnQty select _countr)];
						};
						_countr = _countr + 1;
					} count _objWpnTypes;
				};
			};	
			
			if (_object isKindOf "AllVehicles") then {
				{
					_selection = _x select 0;
					_dam = _x select 1;
					if (_selection in Ori_VehicleUpgrades) then {
                        _object animate [_selection,_dam];
                        _object setVariable [_selection,_dam,true];
                    } else {   
                        if (_selection in dayZ_explosiveParts and _dam > 0.8) then {_dam = 0.8};
                        [_object,_selection,_dam] call object_setFixServer;
                    };
				} count _hitpoints;
				
				_object setFuel _fuel;

			//Origins
			if(_type in DZE_Origins_Buildings) then {
				//diag_log format["Origins Object: %1 - %2", _type,_ownerID];
				_object setVariable ["CanBeUpdated",false, true];
				{
					_object setVariable ["OwnerUID",(_x select 0), true];
					_object setVariable ["OwnerName",(_x select 1), true];
				}   count _hitPoints;
				_ownerUID = _object getVariable ["OwnerUID","0"];
				switch(_type) do {
					case "Uroven1DrevenaBudka"  : { owner_B1 set [count owner_B1, _ownerUID];};
					case "Uroven2KladaDomek"    : { owner_B2 set [count owner_B2, _ownerUID];};
					case "Uroven3DrevenyDomek"  : { owner_B3 set [count owner_B3, _ownerUID];};
					case "Uroven1VelkaBudka"    : { owner_H1 set [count owner_H1, _ownerUID];};
					case "Uroven2MalyDomek"     : { owner_H2 set [count owner_H2, _ownerUID];};
					case "Uroven3VelkyDomek"    : { owner_H3 set [count owner_H3, _ownerUID];};
					case "malaGaraz"            : { owner_SG set [count owner_SG, _ownerUID];};
					case "velkaGaraz"           : { owner_LG set [count owner_LG, _ownerUID];};
					case "kingramida"           : { owner_KING set [count owner_KING, _ownerUID];};
					case "krepost"              : { owner_SH set [count owner_SH, _ownerUID];};
				};
				if((_pos select 2) < 0.25) then {
					_object setVectorUp surfaceNormal position _object;
				};
				_object setVectorUp surfaceNormal position _object;
			}; 
			//Monitor the object
			PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object];
		};
	} count (_BuildingQueue + _originsQueue + _objectQueue);
	// # END SPAWN OBJECTS # 
		};
	};
	
//origins
[] ExecVM "\z\addons\dayz_server\origins\variables.sqf";
[] ExecVM "\z\addons\dayz_server\custom\box.sqf";
[] ExecVM "\z\addons\dayz_server\custom\safeZoneVehicleUnlocker.sqf";
[] spawn server_spawnEvents;
/* //Causes issues with changing clothes
_debugMarkerPosition = [(respawn_west_original select 0),(respawn_west_original select 1),1];
_vehicle_0 = createVehicle ["DebugBox_DZ", _debugMarkerPosition, [], 0, "CAN_COLLIDE"];
_vehicle_0 setPos _debugMarkerPosition;
_vehicle_0 setVariable ["ObjectID","1",true];
*/
