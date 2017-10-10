private["_originsBuilding","_typeOfOriginsBuilding","_action","_playerUID","_ownerUID","_state","_update","_weapons","_magazines","_backpacks","_objWpnTypes","_objWpnQty","_countr","_combinationEntry","_combinationStronghold"];
_originsBuilding = _this select 0;
_typeOfOriginsBuilding = _this select 1;
_action = _this select 2;
_playerUID = _this select 3;
_ownerUID = _originsBuilding getVariable ["OwnerUID","0"];
_charID = _originsBuilding getVariable ["CharacterID","0"];
_pos = _originsBuilding getVariable ["OEMPos",getPosATL _originsBuilding];
_dir = direction _originsBuilding;
_vector = [vectorDir _originsBuilding, vectorUp _originsBuilding];
_objectID = _originsBuilding getVariable ["ObjectID","0"];
_objectUID = _originsBuilding getVariable ["ObjectUID","0"];
_state = 0;
_update = false;

//_combinationEntry = _this select 4;
//_combinationStronghold = _originsBuilding getVariable ["CharacterID","0"];

//if(_playerUID != _ownerUID && !(_typeOfOriginsBuilding in DZE_Origins_Stronghold)) exitWith { diag_log("Origins: House is not yours");};
//if(_typeOfOriginsBuilding in DZE_Origins_Stronghold && _combinationEntry != _combinationStronghold) exitWith{diag_log("Origins: Wrong Stronghold Code");};

if(!_action) then {
	_state = 1;
	_update = true;
};

if(_typeOfOriginsBuilding in DZE_Origins_Garages) then {
	{
		_originsBuilding animate [_x,_state];
	} count ['dvereGarazLeve','vrataGaraz','dvereGarazPrave','dvereGarazLeveDva','dvereGarazPraveDva','vrataGarazLeve','vrataGarazPrave','vrataGaraz2','dvereJednaC'];
};
 if(_typeOfOriginsBuilding in DZE_Origins_Houses) then {
	{
		_originsBuilding animate [_x,_state];
	} count ['vratka','dvereJednaA','vratkaDva','dvereJedna','dvere1'];
};
if(_typeOfOriginsBuilding in DZE_Origins_Stronghold) then {
	{
		_originsBuilding animate [_x,_state];
	} count ['vrata','hride1','kolo1','vaha','kolo2','svich'];
};


//save gear using the same method as safes 
		[_originsBuilding,"gear"] call server_updateObject;
		_weapons = getWeaponCargo _originsBuilding;
		_magazines = getMagazineCargo _originsBuilding;
		_backpacks = getBackpackCargo _originsBuilding;
		if (Z_singleCurrency) then {
			_coins = _originsBuilding getVariable [Z_MoneyVariable,0];
		}else {
			_coins = 0;
		}
		_holder = _originsBuilding createVehicle [0,0,0];
		_holder setDir _dir;
		_holder setVariable ["memDir",_dir,true];
		_holder setVectorDirAndUp _vector;
		_holder setPosATL _pos;
		_holder setVariable ["CharacterID",_charID,true];
		_holder setVariable ["ObjectID",_objectID,true];
		_holder setVariable ["ObjectUID",_objectUID,true];
		_holder setVariable ["OEMPos",_pos,true];
		if (DZE_permanentPlot) then {_holder setVariable ["ownerPUID",_ownerID,true];};
		if (Z_singleCurrency) then {_holder setVariable [Z_MoneyVariable,_coins,true];};
		deleteVehicle _originsBuilding;
		
		// Local setVariable gear onto new locked safe for easy access on next unlock
		// Do not send big arrays over network! Only server needs these
		_holder setVariable ["WeaponCargo",_weapons,false];
		_holder setVariable ["MagazineCargo",_magazines,false];
		_holder setVariable ["BackpackCargo",_backpacks,false];
		
/*
if(!_update) then {
	private["_inventory"];
	clearWeaponCargoGlobal  _originsBuilding;
	clearMagazineCargoGlobal  _originsBuilding;
	clearBackpackCargoGlobal _originsBuilding;
	_inventory = [
		getWeaponCargo _originsBuilding,
		getMagazineCargo _originsBuilding,
		getBackpackCargo _originsBuilding
	];
	_originsBuilding setVariable["lastInventory",_inventory];
	} else {
		clearWeaponCargoGlobal  _originsBuilding;
		clearMagazineCargoGlobal  _originsBuilding;
		clearBackpackCargoGlobal _originsBuilding;
		_weapons = 	_originsBuilding getVariable["WeaponCargo",[]];
		_magazines = _originsBuilding getVariable["MagazineCargo",[]];
		_backpacks = _originsBuilding getVariable["BackpackCargo",[]];
	if (count _weapons > 0) then {
		_objWpnTypes = _weapons select 0;
		_objWpnQty = _weapons select 1;
		_counter = 0;
		{
			_originsBuilding addWeaponCargoGlobal [_x,(_objWpnQty select _counter)];
			_counter = _counter + 1;
		} count _objWpnTypes;
	};

	if (count _magazines > 0) then {
		_objWpnTypes = _magazines select 0;
		_objWpnQty = _magazines select 1;
		_counter = 0;
		{
			if (_x != "CSGAS") then {
				_originsBuilding addMagazineCargoGlobal [_x,(_objWpnQty select _counter)];
				_counter = _counter + 1;
			};
		} count _objWpnTypes;
	};

	if (count _backpacks > 0) then {
		_objWpnTypes = _backpacks select 0;
		_objWpnQty = _backpacks select 1;
		_counter = 0;
		{
			_originsBuilding addBackpackCargoGlobal [_x,(_objWpnQty select _counter)];
			_counter = _counter + 1;
		} count _objWpnTypes;
	};
};

_originsBuilding setVariable ["CanBeUpdated",_update, true];
*/
