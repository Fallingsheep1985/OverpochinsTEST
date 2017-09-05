if (isServer) then {
	diag_log "Loading custom server compiles";	
};

if (!isDedicated) then {
	diag_log "Loading custom client compiles";
	
	fnc_usec_selfactions = compile preprocessFileLineNumbers "dayz_code\compile\fn_selfActions.sqf";
	player_humanityMorph = compile preprocessFileLineNumbers "dayz_code\compile\player_humanityMorph.sqf"; // This line can be removed when Epoch 1.0.6.2 comes out.
	player_getVehicle = 			compile preprocessFileLineNumbers "scripts\garage\getvehicle.sqf";
	player_storeVehicle = 			compile preprocessFileLineNumbers "scripts\garage\player_storeVehicle.sqf";
	vehicle_info = compile preprocessFileLineNumbers "scripts\garage\vehicle_info.sqf";
};

SC_fnc_removeCoins=
{
	private ["_player","_amount","_wealth","_newwealth", "_result"];
	_player = _this select 0;
	_amount = _this select 1;
	_result = false;
	_wealth = _player getVariable[Z_MoneyVariable,0];  
	if(_amount > 0)then{
	if (_wealth < _amount) then {
	_result = false;
	} else {                         
	_newwealth = _wealth - _amount;
	_player setVariable[Z_MoneyVariable,_newwealth, true];
	_player setVariable ["moneychanged",1,true];    
	_result = true;
	call player_forceSave;        
	};
	}else{
	_result = true;
	};
	_result
};

SC_fnc_addCoins = 
{
	private ["_player","_amount","_wealth","_newwealth", "_result"];			
	_player =  _this select  0;
	_amount =  _this select  1;
	_result = false;	
	_wealth = _player getVariable[Z_MoneyVariable,0];
	_player setVariable[Z_MoneyVariable,_wealth + _amount, true];
	call player_forceSave;
	_player setVariable ["moneychanged",1,true];					
	_newwealth = _player getVariable[Z_MoneyVariable,0];		
	if (_newwealth >= _wealth) then { _result = true; };			
	_result
};

vehicle_gear_count = {
		private["_counter"];
		_counter = 0;
		{
			_counter = _counter + _x;
		} count _this;
		_counter
	};