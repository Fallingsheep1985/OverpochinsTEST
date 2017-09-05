
fnc_can_travel = {
//Cant travel in vehicle
	if !(vehicle player == player) exitWith {
		_txt = parseText "<t shadow='true'><t shadowColor='#ff0000'><t align='center'><t underline='1'><t color='#15FF00'><t size='1.8'>Fast Travel System</t></t></t></t></t></t><br/><br/>You can not travel while you are in a vehicle!";
		hint _txt;
		closeDialog 90000;
	};
//Cant travel in combat
	if !(player getVariable["inCombat",false]) exitWith {
		_txt = parseText "<t shadow='true'><t shadowColor='#ff0000'><t align='center'><t underline='1'><t color='#15FF00'><t size='1.8'>Fast Travel System</t></t></t></t></t></t><br/><br/>You can not travel while you are in a vehicle!";
		hint _txt;
		closeDialog 90000;
	};
};

fnc_travel_warning = {
		_txt = parseText "<t shadow='true'><t shadowColor='#ff0000'><t align='center'><t underline='1'><t color='#15FF00'><t size='1.8'>Fast Travel System</t></t></t></t></t></t><br/><br/>Travel commencing in 10 seconds.";
		hint _txt;
		closeDialog 90000;
};
fnc_travel_warning5 = {
		_txt = parseText "<t shadow='true'><t shadowColor='#ff0000'><t align='center'><t underline='1'><t color='#15FF00'><t size='1.8'>Fast Travel System</t></t></t></t></t></t><br/><br/>Travel commencing in 5 seconds.";
		hint _txt;
};
fnc_travel_warning1 = {
		_txt = parseText "<t shadow='true'><t shadowColor='#ff0000'><t align='center'><t underline='1'><t color='#15FF00'><t size='1.8'>Fast Travel System</t></t></t></t></t></t><br/><br/>Travel commencing!";
		hint _txt;
};

fnc_checks = {
	//check if player can travel	
	call fnc_can_travel;
	call fnc_travel_warning;
	sleep 5;
	call fnc_travel_warning5;
	sleep 4;
	call fnc_travel_warning1;
	
};

//SABINA
fnc_travel_Sabina = {
	call fnc_checks;
	_destPos = [15043.6,9589.8711, 0];
	//teleport player near postion
	_randomposition = [_destPos, 0, 5, 0, 0, 2000, 0] call BIS_fnc_findSafePos;
	player setPos _randomposition;
};
//Martin
fnc_travel_Martin = {
	call fnc_checks;
	_destPos = [16199.478,13740.484, 0];
	//teleport player near postion
	_randomposition = [_destPos, 0, 5, 0, 0, 2000, 0] call BIS_fnc_findSafePos;
	player setPos _randomposition;
};
//Dalnogorsk
fnc_travel_Dalnogorsk = {
	call fnc_checks;
	_destPos = [15032.7,18163, 0];
	//teleport player near postion
	_randomposition = [_destPos, 0, 5, 0, 0, 2000, 0] call BIS_fnc_findSafePos;
	player setPos _randomposition;
};
//Yaroslav
fnc_travel_Yaroslav = {
	call fnc_checks;
	_destPos = [10157.741,19033.885, 0];
	//teleport player near postion
	_randomposition = [_destPos, 0, 5, 0, 0, 2000, 0] call BIS_fnc_findSafePos;
	player setPos _randomposition;
};
//Lyepestok
fnc_travel_Lyepestok = {
	call fnc_checks;
	_destPos = [11080.8,15521.6,0];
	//teleport player near postion
	_randomposition = [_destPos, 0, 5, 0, 0, 2000, 0] call BIS_fnc_findSafePos;
	player setPos _randomposition;
};
//Etanvosk
fnc_travel_Etanvosk = {
	call fnc_checks;
	_destPos = [12661.772,12103.309, 0];
	//teleport player near postion
	_randomposition = [_destPos, 0, 5, 0, 0, 2000, 0] call BIS_fnc_findSafePos;
	player setPos _randomposition;
};
//Stari Sad
fnc_travel_Stari = {
	call fnc_checks;
	_destPos = [17505.8,6391, 0];
	//teleport player near postion
	_randomposition = [_destPos, 0, 5, 0, 0, 2000, 0] call BIS_fnc_findSafePos;
	player setPos _randomposition;
};
//Seven
fnc_travel_Seven = {
	call fnc_checks;
	_destPos = [11163,655.742, 0];
	//teleport player near postion
	_randomposition = [_destPos, 0, 5, 0, 0, 2000, 0] call BIS_fnc_findSafePos;
	player setPos _randomposition;
};
//Mitrovice
fnc_travel_Mitrovice = {
	call fnc_checks;
	_destPos = [3688.86,7347.37, 0];
	//teleport player near postion
	_randomposition = [_destPos, 0, 5, 0, 0, 2000, 0] call BIS_fnc_findSafePos;
	player setPos _randomposition;
};
//Chernovar
fnc_travel_Chernovar = {
	call fnc_checks;
	_destPos = [6729.69,9916.08, 0];
	//teleport player near postion
	_randomposition = [_destPos, 0, 5, 0, 0, 2000, 0] call BIS_fnc_findSafePos;
	player setPos _randomposition;
};
//Branibor
fnc_travel_Branibor = {
	call fnc_checks;
	_destPos = [7384.33,4013.79, 0];
	//teleport player near postion
	_randomposition = [_destPos, 0, 5, 0, 0, 2000, 0] call BIS_fnc_findSafePos;
	player setPos _randomposition;
};
//Baranovka
fnc_travel_Baranovka = {
	call fnc_checks;
	_destPos = [10557.712,9981.9512, 0];
	//teleport player near postion
	_randomposition = [_destPos, 0, 5, 0, 0, 2000, 0] call BIS_fnc_findSafePos;
	player setPos _randomposition;
};
//Vladamir
fnc_travel_Vladamir = {
	call fnc_checks;
	_destPos = [1946.64,17199.5, 0];
	//teleport player near postion
	_randomposition = [_destPos, 0, 5, 0, 0, 2000, 0] call BIS_fnc_findSafePos;
	player setPos _randomposition;
};
//Biysh
fnc_travel_Biysh = {
	call fnc_checks;
	_destPos = [5682.3,16748.3, 0];
	//teleport player near postion
	_randomposition = [_destPos, 0, 5, 0, 0, 2000, 0] call BIS_fnc_findSafePos;
	player setPos _randomposition;
};