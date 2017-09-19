private ["_objects","_count","_onLadder","_isWater","_cancel","_reason","_canBuildOnPlot","_vehicle","_inVehicle","_houselevel","_classname","_name","_buildingpart","_charID","_playerUID","_playerName","_abort","_classnametmp","_requireplot","_isAllowedUnderGround","_offset","_isPole","_isLandFireDZ","_distance","_needText","_findNearestPoles","_findNearestPole","_IsNearPlot","_nearestPole","_playerID","_ownerID","_friendlies","_message","_require","_missing","_hasrequireditem","_hastoolweapon","_location","_isOk","_location1","_dir","_object","_position","_objHDiff","_zheightchanged","_zheightdirection","_rotate","_location2","_tmpbuilt","_limit","_proceed","_counter","_dis","_sfx","_started","_finished","_animState","_isMedic","_activatingPlayer"];

if(dayz_actionInProgress) exitWith { cutText [(localize "str_epoch_player_40") , "PLAIN DOWN"]; };
dayz_actionInProgress = true;

_objects = nearestObjects [player, DZE_maintainClasses, (DZE_PlotPole select 0)];
_count = count _objects;
if (_count > DZE_BuildingLimit) exitWith { dayz_actionInProgress = false; cutText ["\n\nCannot build, too many objects within plot pole area.","PLAIN DOWN"]; };

_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_isWater = 		dayz_isSwimming;
_cancel = false;
_reason = "";
_canBuildOnPlot = false;

_vehicle = vehicle player;
_inVehicle = (_vehicle != player);

DZE_Q = false;
DZE_Z = false;

DZE_Q_alt = false;
DZE_Z_alt = false;

DZE_Q_ctrl = false;
DZE_Z_ctrl = false;

DZE_5 = false;
DZE_4 = false;
DZE_6 = false;

DZE_cancelBuilding = false;

call gear_ui_init;
closeDialog 1;

if (dayz_isSwimming) exitWith {dayz_actionInProgress = false; cutText [ "Cant Build while Swimming!", "PLAIN DOWN"];};
if (_inVehicle) exitWith {dayz_actionInProgress = false; cutText [ "Cant Build in vehicle!", "PLAIN DOWN"];};
if (_onLadder) exitWith {dayz_actionInProgress = false; cutText [ "Cant Build on Ladder!", "PLAIN DOWN"];};
if (player getVariable["inCombat",false]) exitWith {dayz_actionInProgress = false; cutText [ "Cant Build in Combat!", "PLAIN DOWN"];};

_houselevel = _this select 0;
_classname = _this select 1;
_name = _this select 2;
_buildingpart = _this select 3;
_charID = dayz_characterID;
_playerUID = dayz_playerUID;
_playerName = (name player);


// Need Near Requirements
_abort = false;
_reason = "";

_classnametmp = _classname;

_requireplot = DZE_requireplot;
_isAllowedUnderGround = 0;

if (_classname in DZE_Origins_Stronghold) then {
	_offset = [0,30,0];
} else {
	_offset = [0,10,0];
};

_isPole = (_classname == "Plastic_Pole_EP1_DZ");
_isLandFireDZ = (_classname == "Land_Fire_DZ");

_distance = DZE_PlotPole select 0;
_needText = localize "str_epoch_player_246";

if(_isPole) then {
	_distance = DZE_PlotPole select 1;
};

// check for near plot
_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], _distance];
_findNearestPole = [];

{
	if (alive _x) then {
		_findNearestPole set [(count _findNearestPole),_x];
	};
} count _findNearestPoles;

_IsNearPlot = count (_findNearestPole);

// If item is plot pole && another one exists within 45m
if(_isPole && _IsNearPlot > 0) exitWith {  dayz_actionInProgress = false; cutText [ "Need to near PlotPole!" , "PLAIN DOWN"]; };

if(_IsNearPlot == 0) then {  // no plot pole close
	// Allow building of plot
	if(_requireplot == 0 || _isLandFireDZ) then {
		_canBuildOnPlot = true;
	};
} else { // there is a plot pole close
	// check nearby plots ownership && then for friend status
	_nearestPole = _findNearestPole select 0;

	// Find owner	
	_hasAccess 	= false;
	_hasAccess 	= [player, _nearestPole] call FNC_check_access;
	_allowed 	= ((_hasAccess select 0) or (_hasAccess select 2) or (_hasAccess select 3) or (_hasAccess select 4));
	// 0= owner + 2= plot owner + 3= plot friends + 4=plot admins  
	if(_allowed) then {  //Keep ownership
		// owner can build anything within his plot except other plots
		_canBuildOnPlot = true; // 0= owner + 2= plot owner + 3= plot friends + 4=plot admins -> can build
	};
	if(_isPole) then { // not if it is a plot
		_canBuildOnPlot = false;
	};
};

// _message
if (!_canBuildOnPlot) exitWith {  dayz_actionInProgress = false; cutText [format[(localize "STR_EPOCH_PLAYER_135"),_needText,_distance] , "PLAIN DOWN"]; };

_require = ["ItemToolbox","ItemEtool","ItemSledge"];
_missing = "";
_hasrequireditem = true;
{
	_hastoolweapon = _x in weapons player;
	if(!_hastoolweapon) exitWith { _hasrequireditem = false; _missing = getText (configFile >> "cfgWeapons" >> _x >> "displayName"); };
} count _require;

if (!_hasrequireditem) exitWith {dayz_actionInProgress = false; cutText [format[ "Cant Build Missing %1!",_missing] , "PLAIN DOWN"]; };
if (_hasrequireditem) then {
	_location = [0,0,0];
	_isOk = true;

	// get inital players position
	_location1 = getPosATL player;
	_dir = getDir player;

	_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
	_object attachTo [player,_offset];
	_position = getPosATL _object;
	cutText [(localize "str_epoch_player_45"), "PLAIN DOWN"];
	_objHDiff = 0;

	while {_isOk} do {

		_zheightchanged = false;
		_zheightdirection = "";
		_rotate = false;

		if (DZE_Q) then {
			DZE_Q = false;
			_zheightdirection = "up";
			_zheightchanged = true;
		};
		if (DZE_Z) then {
			DZE_Z = false;
			_zheightdirection = "down";
			_zheightchanged = true;
		};
		if (DZE_Q_alt) then {
			DZE_Q_alt = false;
			_zheightdirection = "up_alt";
			_zheightchanged = true;
		};
		if (DZE_Z_alt) then {
			DZE_Z_alt = false;
			_zheightdirection = "down_alt";
			_zheightchanged = true;
		};
		if (DZE_Q_ctrl) then {
			DZE_Q_ctrl = false;
			_zheightdirection = "up_ctrl";
			_zheightchanged = true;
		};
		if (DZE_Z_ctrl) then {
			DZE_Z_ctrl = false;
			_zheightdirection = "down_ctrl";
			_zheightchanged = true;
		};
		if (DZE_4) then {
			_rotate = true;
			DZE_4 = false;
			_dir = 180;
		};
		if (DZE_6) then {
			_rotate = true;
			DZE_6 = false;
			_dir = 0;
		};

		if(_rotate) then {
			_object setDir _dir;
			_object setPosATL _position;
			//diag_log format["DEBUG Rotate BUILDING POS: %1", _position];
		};

		if(_zheightchanged) then {
			detach _object;

			_position = getPosATL _object;

			if(_zheightdirection == "up") then {
				_position set [2,((_position select 2)+0.1)];
				_objHDiff = _objHDiff + 0.1;
			};
			if(_zheightdirection == "down") then {
				_position set [2,((_position select 2)-0.1)];
				_objHDiff = _objHDiff - 0.1;
			};

			if(_zheightdirection == "up_alt") then {
				_position set [2,((_position select 2)+1)];
				_objHDiff = _objHDiff + 1;
			};
			if(_zheightdirection == "down_alt") then {
				_position set [2,((_position select 2)-1)];
				_objHDiff = _objHDiff - 1;
			};

			if(_zheightdirection == "up_ctrl") then {
				_position set [2,((_position select 2)+0.01)];
				_objHDiff = _objHDiff + 0.01;
			};
			if(_zheightdirection == "down_ctrl") then {
				_position set [2,((_position select 2)-0.01)];
				_objHDiff = _objHDiff - 0.01;
			};

			_object setDir (getDir _object);

			if((_isAllowedUnderGround == 0) && ((_position select 2) < 0)) then {
				_position set [2,0];
			};

			_object setPosATL _position;

			//diag_log format["DEBUG Change BUILDING POS: %1", _position];

			_object attachTo [player];

		};

		sleep 0.5;

		_location2 = getPosATL player;

		if(DZE_5) exitWith {
			_isOk = false;
			detach _object;
			_dir = getDir _object;
			_position = getPosATL _object;
			//diag_log format["DEBUG BUILDING POS: %1", _position];
			deleteVehicle _object;
		};

		if(_location1 distance _location2 > 5) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "You've moved to far away from where you started building (within 5 meters)";
			detach _object;
			deleteVehicle _object;
		};

		if(abs(_objHDiff) > 5) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "Cannot move up || down more than 5 meters";
			detach _object;
			deleteVehicle _object;
		};

		if (player getVariable["inCombat",false]) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "Cant Build in Combat!";
			detach _object;
			deleteVehicle _object;
		};

		if (DZE_cancelBuilding) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "Cancelled building. DZE_cancelBuilding did this! ";
			detach _object;
			deleteVehicle _object;
		};
	};

	//No building on roads unless toggled
	if (!DZE_BuildOnRoads) then {
		if (isOnRoad _position) then { _cancel = true; _reason = "Cannot build on a road."; };
	};

	// No building in trader zones
	if(!canbuild) then { _cancel = true; _reason = "Cannot build in a city."; };

	if(!_cancel) then {

		_classname = _classnametmp;

		// Start Build
		_tmpbuilt = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];

		_tmpbuilt setDir _dir;

		// Get position based on object
		_location = _position;

		if((_isAllowedUnderGround == 0) && ((_location select 2) < 0)) then {
			_location set [2,0];
		};

		_tmpbuilt setPosATL _location;
		if((_location select 2) < 0.25) then {
			_tmpbuilt setVectorUp surfaceNormal position _tmpbuilt;
		};
		_location = getPosATL _tmpbuilt;

		cutText [format[(localize "str_epoch_player_138"),_name], "PLAIN DOWN"];

		_limit = 3;

		if (DZE_StaticConstructionCount > 0) then {
			_limit = DZE_StaticConstructionCount;
		}
		else {
			if (isNumber (configFile >> "CfgVehicles" >> _classname >> "constructioncount")) then {
				_limit = getNumber(configFile >> "CfgVehicles" >> _classname >> "constructioncount");
			};
		};

		_isOk = true;
		_proceed = false;
		_counter = 0;

		while {_isOk} do {

			//[10,10] call dayz_HungerThirst;
			player playActionNow "Medic";

			_dis=20;
			_sfx = "repair";
			[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
			[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

			r_interrupt = false;
			r_doLoop = true;
			_started = false;
			_finished = false;

			while {r_doLoop} do {
				_animState = animationState player;
				_isMedic = ["medic",_animState] call fnc_inString;
				if (_isMedic) then {
					_started = true;
				};
				if (_started && !_isMedic) then {
					r_doLoop = false;
					_finished = true;
				};
				if (r_interrupt || (player getVariable["inCombat",false])) then {
					r_doLoop = false;
				};
				if (DZE_cancelBuilding) exitWith {
					r_doLoop = false;
				};
				sleep 0.1;
			};
			r_doLoop = false;


			if(!_finished) exitWith {
				_isOk = false;
				_proceed = false;
			};

			if(_finished) then {
				_counter = _counter + 1;
			};

			cutText [format[(localize "str_epoch_player_139"),_name, _counter,_limit], "PLAIN DOWN"];

			if(_counter == _limit) exitWith {
				_isOk = false;
				_proceed = true;
			};

		};

		if (_proceed) then {
			cutText [format[localize "str_build_01",_name], "PLAIN DOWN"];

			if (_isPole) then {
				[] spawn player_plotPreview;
			};

			if (_classname in DZE_Origins_Stronghold) then {
				private["_combination_1","_combination_2","_combination_3","_combination_4","_combination_5","_combination_6"];
				_combination = "";
				_combination_1 = ceil(random 9);
				while {_combination_1 == 0} do {
					_combination_1 = ceil (random 9);
				};
				_combination_2 = ceil(random 9);
				_combination_3 = ceil(random 9);
				_combination_4 = ceil(random 9);
				_combination_5 = ceil(random 9);
				_combination_6 = ceil(random 9);
				_combination = format["%1%2%3%4%5%6",_combination_1,_combination_2,_combination_3,_combination_4,_combination_5,_combination_6];
				dayz_combination = _combination;
			
			};
			_combination_1 = floor(random 10);
			_combination_2 = floor(random 10);
			_combination_3 = floor(random 10);
			_combination_4 = floor(random 10);
			
			_combination = format["%1%2%3%4",_combination_1,_combination_2,_combination_3,_combination_4];
			_tmpbuilt setVariable ["OEMPos",_location,true];							
			_tmpbuilt setVariable ["CharacterID",_combination,true]; //set combination as a character ID
			_tmpbuilt setVariable ["OwnerUID",_playerUID, true];
			_tmpbuilt setVariable ["ownerPUID",_playerUID, true];			
			_tmpbuilt setVariable ["OwnerName",_playerName, true];
			_activatingPlayer = player;
			dayz_combination = _combination;
			_combinationDisplay = _combination;
			
			
			if (_proceed && (_buildingpart in magazines player)) then {
				switch (_houselevel) do {
					case 'B1' : {
						owner_B1 set [count owner_B1, _playerUID];
						publicVariable "owner_B1";
						player setVariable["DZE_Origins_Level1",true,true];
					};
					case 'B2' : {
						owner_B2 set [count owner_B2, _playerUID];
						publicVariable "owner_B2";
						player setVariable["DZE_Origins_Level2",true,true];
					};
					case 'B3' : {
						owner_B3 set [count owner_B3, _playerUID];
						publicVariable "owner_B3";
						player setVariable["DZE_Origins_Level3",true,true];
					};
					case 'H1' : {
						owner_H1 set [count owner_H1, _playerUID];
						publicVariable "owner_H1";
						player setVariable["DZE_Origins_Level1",true,true];
					};
					case 'H2' : {
						owner_H2 set [count owner_H2, _playerUID];
						publicVariable "owner_H2";
						player setVariable["DZE_Origins_Level2",true,true];
					};
					case 'H3' : {
						owner_H3 set [count owner_H3, _playerUID];
						publicVariable "owner_H3";
						player setVariable["DZE_Origins_Level3",true,true];
					};
					case 'SGH';
					case 'SGB' : {
						owner_SG set [count owner_SG, _playerUID];
						publicVariable "owner_SG";
						player setVariable["DZE_Origins_SG",true,true];
					};
					case 'LGH';
					case 'LGB' : {
						owner_LG set [count owner_LG, _playerUID];
						publicVariable "owner_LG";
						player setVariable["DZE_Origins_LG",true,true];
					};
					case 'KINGH';
					case 'KINGB' : {
						owner_KING set [count owner_KING, _playerUID];
						publicVariable "owner_KING";
						player setVariable["DZE_Origins_KING",true,true];
					};
					case 'SHH';
					case 'SHB' : {
						owner_SH set [count owner_SH, _playerUID];
						publicVariable "owner_SH";
						player setVariable["DZE_Origins_SH",true,true];
					};
				};
				if (_classname in DZE_Origins_Stronghold) then {
					PVDZ_obj_Publish = [_combination,_tmpbuilt,[_dir,_location,dayz_playerUID],[]];
					//PVDZ_obj_Publish = [_tmpbuilt,[_dir,_location,_playerUID],_classname,true,dayz_combination,_activatingPlayer];
					publicVariableServer  "PVDZ_obj_Publish";
					player removeMagazine _buildingpart;
					player removeMagazine "ItemEmerald";
					cutText [format[(localize "str_epoch_player_140"),dayz_combination,_name], "PLAIN DOWN", 5];
					systemChat format["You have setup your %2. Combination is %1",dayz_combination,_name];					
					uiSleep 5;
					//[player,3] call GiveXP;
				} else {
					//PVDZ_obj_Publish = [_tmpbuilt,[_dir,_location,_playerUID],_classname,true,_charID,_activatingPlayer];
					PVDZ_obj_Publish = [_combination,_tmpbuilt,[_dir,_location,_playerUID],[]];
					publicVariableServer  "PVDZ_obj_Publish";
					player removeMagazine _buildingpart;
					//cutText [format["You have build %1. DO NOT place gear in Origins buildings! Items wont safe!", _name], "PLAIN DOWN",5];
					//systemChat format["You have build %1. DO NOT place gear in Origins buildings! Items wont safe!", _name];					
				};
 
			} else {
				deleteVehicle _tmpbuilt;
				localize "str_epoch_player_46" call dayz_rollingMessages;
			};

		} else {
			r_interrupt = false;
			if (vehicle player == player) then {
				[objNull, player, rSwitchMove,""] call RE;
				player playActionNow "stop";
			};

			deleteVehicle _tmpbuilt;

			localize "str_epoch_player_46" call dayz_rollingMessages;
		};
	} else {
		format[localize "str_epoch_player_47",_text,_reason] call dayz_rollingMessages;
	};
};

dayz_actionInProgress = false;
