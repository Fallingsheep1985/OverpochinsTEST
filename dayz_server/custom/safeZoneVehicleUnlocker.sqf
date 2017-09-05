private ["_safeZones","_center","_radius","_vehicles"];
_safeZones = [
	[[15586,16390.6,0],25,true],	// Hero
	[[15309,9278,0],75,true], 		//trader city Sabina
	[[11698,15210,0],75,true], 		//trader city Lyepestok
	[[5538,8762,0],75,true],		//trader city Bilgrad
	[[7376,4296,0],75,true] 		//trader city Branibor
];

{
	_center = _x select 0;
	_radius = _x select 1;
	_vehicles = nearestObjects [_center,["LandVehicle","Air","Ship"],_radius];
	{
		if (_x isKindOf "LandVehicle" || _x isKindOf "Air" || _x isKindOf "Ship") then {

			{player removeAction _x} forEach s_player_lockunlock;s_player_lockunlock = [];
			s_player_lockUnlock_crtl = 1;

			PVDZE_veh_Lock = [_x,false];
			
			if (local _x) then {
				PVDZE_veh_Lock spawn local_lockUnlock
			} else {
				publicVariable "PVDZE_veh_Lock";
			};

			s_player_lockUnlock_crtl = -1;
		};
	} forEach _vehicles;
} forEach _safeZones;