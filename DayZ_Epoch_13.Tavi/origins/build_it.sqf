private ["_canBuildOnPlot","_hero1","_hero2","_hero3","_garage1","_garage2","_pyramid1","_stronghold1","_bandit1","_bandit2","_bandit3","_houselevel","_humanityNeed","_classname","_buildingpart","_name","_case","_humanity","_playerUID","_hasLevel1","_hasLevel2","_hasLevel3","_hasSG","_hasLG","_hasKING","_hasSH","_canBuild","_hasone"];
closeDialog 0;
_houselevel = _this select 0;	// H1
_humanityNeed = _this select 1;	// 5000
_classname = _this select 2;	// "Uroven1VelkaBudka"
_buildingpart = _this select 3; // "ItemSodaSmashtEmpty"
_name = _this select 4; // "Bandit Level 1 House"
_case = _this select 5; // "house"
_humanity = player getVariable["humanity",0];
_playerUID = dayz_playerUID;

// Need Near Requirements
_abort = false;
_reason = "";
_canBuildOnPlot = false;
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
_needText = "ORIGINS: Plot Pole";

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
if(_isPole && _IsNearPlot > 0) exitWith {  dayz_actionInProgress = false; cutText [ "ORIGINS: To close to another PlotPole!" , "PLAIN DOWN"]; };

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
	_can_build_stronghold = ((_hasAccess select 0) or (_hasAccess select 2));
	can_build_stronghold = _can_build_stronghold;
	// 0= owner + 2= plot owner + 3= plot friends + 4=plot admins  
	if(_allowed) then {  //Keep ownership
		// owner can build anything within his plot except other plots
		_canBuildOnPlot = true; // 0= owner + 2= plot owner + 3= plot friends + 4=plot admins -> can build
	};
	if(_isPole) then { // not if it is a plot
		_canBuildOnPlot = false;
	};
};

if (_canBuildOnPlot) then{
/*
	_findNearestKINGs = nearestObjects [(vehicle player), ["kingramida"], _distance];
	_findNearestKING = [];
	{
		if (alive _x) then {
			_findNearestKING set [(count _findNearestKING),_x];
		};
	} count _findNearestKINGs;
	_hasKING = count (_findNearestKING);
	
	_findNearestLGs = nearestObjects [(vehicle player), ["velkaGaraz"], _distance];
	_findNearestLG = [];
	{
		if (alive _x) then {
			_findNearestB2 set [(count _findNearestB2),_x];
		};
	} count _findNearestB2s;
	_findNearestSGs = nearestObjects [(vehicle player), ["malaGaraz"], _distance];
	_findNearestSG = [];
	{
		if (alive _x) then {
			_findNearestB2 set [(count _findNearestB2),_x];
		};
	} count _findNearestB2s;

*/
	// check level 1 house nearby
	_findNearestB1s = nearestObjects [(vehicle player), ["Uroven1DrevenaBudka","Uroven1VelkaBudka"], _distance];
	_findNearestB1 = [];
	{
		if (alive _x) then {
			_findNearestB1 set [(count _findNearestB1),_x];
		};
	} count _findNearestB1s;
	_hasLevel1x = count (_findNearestB1);
	if(_hasLevel1x > 0)then{
	_hasLevel1 = true;
	}else{
	_hasLevel1 = false;
	};
	// check level 2 house nearby
	_findNearestB2s = nearestObjects [(vehicle player), ["Uroven2KladaDomek","Uroven2MalyDomek"], _distance];
	_findNearestB2 = [];
	{
		if (alive _x) then {
			_findNearestB2 set [(count _findNearestB2),_x];
		};
	} count _findNearestB2s;
	_hasLevel2x = count (_findNearestB2);
	if(_hasLevel2x > 0)then{_hasLevel2 = true;
	}else{
	_hasSH = false;
	};
	// check level 3 house nearby
	_findNearestB3s = nearestObjects [(vehicle player), ["Uroven3DrevenyDomek","Uroven3VelkyDomek"], _distance];
	_findNearestB3 = [];
	{
		if (alive _x) then {
			_findNearestB3 set [(count _findNearestB3),_x];
		};
	} count _findNearestB3s;
	_hasLevel3x = count (_findNearestB3);
	if(_hasLevel3x > 0)then{
	_hasLevel3 = true;
	}else{
	_hasLevel3 = false;
	};
	
	_findNearestSHs = nearestObjects [(vehicle player), ["krepost"], _distance];
	_findNearestSH = [];
	{
		if (alive _x) then {
			_findNearestSH set [(count _findNearestSH),_x];
		};
	} count _findNearestSHs;
	
	_hasSHx = count (_findNearestSH);
	if(_hasSHx > 0)then{
	_hasSH = true;
	}else{
	_hasSH = false;
	};
	
} else {
//default to old orgins method (dosnt work but sets variables up)
	_hasLevel1 = (_playerUID in owner_H1 || _playerUID in owner_B1);
	_hasLevel2 = (_playerUID in owner_H2 || _playerUID in owner_B2);
	_hasLevel3 = (_playerUID in owner_H3 || _playerUID in owner_B3);
	_hasSG = (_playerUID in owner_SG);
	_hasLG = (_playerUID in owner_LG);
	_hasKING = (_playerUID in owner_KING);
	_hasSH = (_playerUID in owner_SH);
};

_canBuild = false;
_hasone = false;

switch (_case) do {		
	case "house": {
		if ((_humanityNeed > 0 && _humanity >= _humanityNeed) || (_humanityNeed < 0 && _humanity <= _humanityNeed)) then {
			if (_houselevel in ["H1","B1"] ) then { _canBuild = true; };
			if (_houselevel in ["H2","B2"] ) then { _canBuild = true; };
			if (_houselevel in ["H3","B3"] ) then { _canBuild = true; };
		} else {
			cutText [format["You do not have %1 humanity for this house!",_humanityNeed], "PLAIN DOWN"];
		};
	};
	case "garage": {
		if (_houselevel in ["SGH","SGB"]) then {
			if (_hasLevel1 && !_hasSG) then {
				_canBuild = true;
			} else {
				cutText [format["%1 you need level 1 house before you can build %2 or you already own %2",name player,_name], "PLAIN DOWN"];
			};
		};
		if (_houselevel in ["LGH","LGB"]) then {
			if (_hasLevel3 && !_hasLG) then {
				_canBuild = true;
			} else {
				cutText [format["%1 you need level 3 house before you can build %2 or you already own %2",name player,_name], "PLAIN DOWN"];
			};
		};
		if (_houselevel in ["KINGH","KINGB"]) then {
			if !("ItemEmerald" in magazines player) exitWith { cutText [format["%1 you need one Emerald for %2. Sector B urals might have one!",name player,_name], "PLAIN DOWN"]; };
			if (_hasLevel3 && !_hasKING) then {
				_canBuild = true;
			} else {
				cutText [format["%1 you need level 3 house before you can build %2 or you already own %2",name player,_name], "PLAIN DOWN"];
			};
		};
		if (_houselevel in ["SHH","SHB"] && !_hasSH) then {
			if (!_can_build_stronghold) exitWith {cutText["Only the plot owner can build a Stronghold!"];};
			if (_hasLevel3 && !_hasSH) then {
				_canBuild = true;
			} else {
				cutText [format["%1 you need a level 3 house before you can build %2 or you already own %2",name player,_name], "PLAIN DOWN"];
			};
		};
	};
};

//if (_hasone) then { cutText [format["%1 you already have %2! You can only own one!",name player,_name], "PLAIN DOWN"]; };
if (_canBuild) then { [_houselevel,_classname,_name,_buildingpart] execVM "origins\player_build.sqf"; };
