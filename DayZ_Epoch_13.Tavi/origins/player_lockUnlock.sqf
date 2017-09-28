private ["_cursorTarget","_typeOfCursorTarget","_state","_action","_strongholdCode"];
_cursorTarget = (_this select 3 select 0);
_typeOfCursorTarget = (_this select 3 select 1);
_action = (_this select 3 select 2);  // true = open ; false = locked
_strongholdCode = false;
/*
if (_typeOfCursorTarget == "krepost") then {
	private["_combination","_ok"];
	_combination = _cursorTarget getVariable ["CharacterID","0"];	
	dayz_combination = "";
	_ok = createDialog "SafeKeyPad";
	waitUntil {!dialog};
	if(_combination == dayz_combination) then {
		_strongholdCode = true;
		//THIS NEEDS TO CHANGE FOR ANIMATIONS!
		OriginsLockUnlock = [_cursorTarget,_typeOfCursorTarget,_action,dayz_playerUID,dayz_combination];
	};
} else {
//THIS NEEDS TO CHANGE FOR ANIMATIONS!
	OriginsLockUnlock = [_cursorTarget,_typeOfCursorTarget,_action,dayz_playerUID,"0"];
};
*/
OriginsLockUnlock = [_cursorTarget,_typeOfCursorTarget,_action,dayz_playerUID,"0"];
publicVariableServer "OriginsLockUnlock";

if (_typeOfCursorTarget in DZE_Origins_Houses) then {
	[nil, _cursorTarget, rSAY, "origins_door_creak", 20] call RE;
};
if (_typeOfCursorTarget in DZE_Origins_Garages) then {
	[nil, _cursorTarget, rSAY, "origins_garage_door", 20] call RE;
};

if(_typeOfCursorTarget in DZE_Origins_Stronghold) then {
	[nil, _cursorTarget, rSAY, "stronghold", 20] call RE;
};

uiSleep 1;
[2] call origins_removeActions;