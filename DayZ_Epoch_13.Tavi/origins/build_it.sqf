private ["_houselevel","_humanityNeed","_classname","_buildingpart","_name","_case","_humanity","_playerUID","_hasLevel1","_hasLevel2","_hasLevel3","_hasSG","_hasLG","_hasKING","_hasSH","_canBuild","_hasone"];
closeDialog 0;
_houselevel = _this select 0;	// H1
_humanityNeed = _this select 1;	// 5000
_classname = _this select 2;	// "Uroven1VelkaBudka"
_buildingpart = _this select 3; // "ItemSodaSmashtEmpty"
_name = _this select 4; // "Bandit Level 1 House"
_case = _this select 5; // "house"

_humanity = player getVariable["humanity",0];
_playerUID = dayz_playerUID;
_hasLevel1 = (_playerUID in owner_H1 || _playerUID in owner_B1);
_hasLevel2 = (_playerUID in owner_H2 || _playerUID in owner_B2);
_hasLevel3 = (_playerUID in owner_H3 || _playerUID in owner_B3);
_hasSG = (_playerUID in owner_SG);
_hasLG = (_playerUID in owner_LG);
_hasKING = (_playerUID in owner_KING);
_hasSH = (_playerUID in owner_SH);

_canBuild = false;
_hasone = false;

switch (_case) do {		
	case "house": {
		if ((_humanityNeed > 0 && _humanity >= _humanityNeed) || (_humanityNeed < 0 && _humanity <= _humanityNeed)) then {
			if (_houselevel in ["H1","B1"] && !_hasLevel1) then { _canBuild = true; } else { _hasone = true; };
			if (_houselevel in ["H2","B2"] && !_hasLevel2) then { _canBuild = true; } else { _hasone = true; };
			if (_houselevel in ["H3","B3"] && !_hasLevel3) then { _canBuild = true; } else { _hasone = true; };
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
		if (_houselevel in ["SHH","SHB"] && _hasLevel1 && _hasLevel2 && _hasLevel3 && !_hasSH) then {
			if (_hasLevel1 && _hasLevel2 && _hasLevel3 && !_hasSH) then {
				_canBuild = true;
			} else {
				cutText [format["%1 you need level 1, 2 and 3 houses before you can build %2 or you already own %2",name player,_name], "PLAIN DOWN"];
			};
		};
	};
};

if (_hasone) then { cutText [format["%1 you already have %2! You can only own one!",name player,_name], "PLAIN DOWN"]; };
if (_canBuild) then { [_houselevel,_classname,_name,_buildingpart] execVM "origins\player_build.sqf"; };
