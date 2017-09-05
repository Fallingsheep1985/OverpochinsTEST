if(isServer) then {

	private 		["_crate_type","_crate","_position"];
	
	[
		[6304,8278,0],						// Position
		50,									// Number Of units
		"Random",							// Skill level of unit (easy, medium, hard, extreme, Random)
		"Random",							// Primary gun set number and rocket launcher. "Random" for random weapon set, "at" for anti-tank, "aa" for anti-air launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random",							// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] call spawn_group;

	//_crate_type 	= crates_small call BIS_fnc_selectRandom;
	//_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
	//[_crate,100,4,0,2] call dynamic_crate;
	
	diag_log format["WAI: Static mission for %1 loaded", missionName];

};
