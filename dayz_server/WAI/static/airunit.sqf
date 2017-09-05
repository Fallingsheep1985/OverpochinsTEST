if(isServer) then {


	//Custom Spawns file//
	/*
	Custom group spawns Eg.

	[
		[953.237,4486.48,0.001],			// Position
		4,									// Number Of units
		"Random",							// Skill level of unit (easy, medium, hard, extreme, Random)
		"Random",	or ["Random","at"],		// Primary gun set number and rocket launcher. "Random" for random weapon set, "at" for anti-tank, "aa" for anti-air launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random",							// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] call spawn_group;

	Place your custom group spawns below
	*/

	/*
	Custom static weapon spawns Eg. (with mutiple positions)

	[
		[									// Position(s) (can be multiple)
			[911.21,4532.76,2.62],
			[921.21,4542.76,2.62]
		],
		"M2StaticMG",						// Classname of turret
		"easy",								// Skill level of unit (easy, medium, hard, extreme, Random)
		"Bandit2_DZ",						// Skin classname, use "Random" or classname here
		"Bandit",							// AI Type, "Hero" or "Bandit".
		"Random",							// Primary gun set number. "Random" for random weapon set
		2,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random"							// Gearset classname, use "Random" or classname here
	] call spawn_static;

	Place your custom static weapon spawns below
	*/
	
	[
		[									// Position(s) (can be multiple)
			[22215.723, 19780.213, 13.0001],
			[22338.311, 19738.691, 23.540525],
			[22884.711, 19856.395, 11.0001],
			[22446.395, 20098.475, 6.8244929],
			[22691.1,20085.1,0.00143862],
			[22686.5,19163.2,0.00143862],
			[22812.1,19935.2,13.1167],
			[22200.4,19647.6,0.00143862],
			[22536.129, 19998.018, 6.6184354],
			[23064.297, 19371.266, 10.033691]
			
		],
		"DSHKM_Ins",						// Classname of turret
		"extreme",							// Skill level of unit (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit",							// AI Type, "Hero" or "Bandit".
		"Random",							// Primary gun set number. "Random" for random weapon set
		9,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"random"							// Gearset classname, use "Random" or classname here
	] call spawn_static;


	/*
	Custom Chopper Patrol spawn Eg.

	[
		[725.391,4526.06,0.001],				// Position to patrol
		[0,0,0.001],							// Position to spawn chopper at
		2000,								// Radius of patrol
		10,									// Number of waypoints to give
		"UH1H_DZ",							// Classname of vehicle (make sure it has driver and two gunners)
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;

	Place your heli patrols below
	*/
	
	[
	[22198.2,19852.7,0.001],   				//Position to patrol
	[18764.8,20099.6,0.001],				// Position to spawn chopper at
	3000,								// Radius of patrol
	20,									// Number of waypoints to give
	"UH1H_DZ",							// Classname of vehicle (make sure it has driver and two gunners)
	"extreme",							// Skill level of units (easy, medium, hard, extreme, Random)
	"Random",							// Skin classname, use "Random" or classname here
	"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;

	[
		[22574.6,19677.5,0.001],  				//Position to patrol
		[18727.1,19600.2,0.001],				// Position to spawn chopper at
		1000,								// Radius of patrol
		20,									// Number of waypoints to give
		"UH1H_DZ",							// Classname of vehicle (make sure it has driver and two gunners)
		"extreme",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;

	[
		[22574.6,19677.5,0.001],  			  	//Position to patrol
		[18736.5,19129,0.001],					// Position to spawn chopper at
		1000,								// Radius of patrol
		20,									// Number of waypoints to give
		"UH1H_DZ",							// Classname of vehicle (make sure it has driver and two gunners)
		"extreme",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;
	/*
	[
		[6859.62,6353.27,0.001],    			//Position to patrol
		[0,0,0.001],							// Position to spawn chopper at
		7500,								// Radius of patrol
		20,									// Number of waypoints to give
		"UH1H_DZ",							// Classname of vehicle (make sure it has driver and two gunners)
		"extreme",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;

	[
		[3769.38,17121.1,0.001],    			//Position to patrol
		[423.494,23830.4,0.001],				// Position to spawn chopper at
		4000,								// Radius of patrol
		20,									// Number of waypoints to give
		"UH1H_DZ",							// Classname of vehicle (make sure it has driver and two gunners)
		"extreme",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;

	[
		[16870.8,9198.18,0.001],    			//Position to patrol
		[21236.1,2062.48,0.001],				// Position to spawn chopper at
		3500,								// Radius of patrol
		20,									// Number of waypoints to give
		"UH1H_DZ",							// Classname of vehicle (make sure it has driver and two gunners)
		"extreme",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;

	[
		[13165.7,16610.4,0.001],   				//Position to patrol
		[20122.7,16734.8,0.001],				// Position to spawn chopper at
		3500,								// Radius of patrol
		20,									// Number of waypoints to give
		"UH1H_DZ",							// Classname of vehicle (make sure it has driver and two gunners)
		"extreme",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;
	*/




	/* 
	Custom Vehicle patrol spawns Eg. (Watch out they are stupid)

	[
		[725.391,4526.06,0.001],				// Position to patrol
		[725.391,4526.06,0.001],				// Position to spawn at
		200,								// Radius of patrol
		10,									// Number of waypoints to give
		"HMMWV_Armored",					// Classname of vehicle (make sure it has driver and gunner)
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn vehicle_patrol;

	Place your vehicle patrols below this line
	*/





	/*
	Paradropped unit custom spawn Eg.

	[
		[911.21545,4532.7612,2.6292224],	// Position that units will be dropped by
		[0,0,0.001],							// Starting position of the heli
		400,								// Radius from drop position a player has to be to spawn chopper
		"UH1H_DZ",							// Classname of chopper (Make sure it has 2 gunner seats!)
		5,									// Number of units to be para dropped
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",	or ["Random","at"],		// Primary gun set number and rocket launcher. "Random" for random weapon set, "at" for anti-tank, "aa" for anti-air launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Bandit2_DZ",						// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set.
		"Bandit",							// AI Type, "Hero" or "Bandit".
		true								// true: Aircraft will stay at position and fight. false: Heli will leave if not under fire. 
	] spawn heli_para;

	Place your paradrop spawns under this line
	*/

	diag_log "WAI: Static mission loaded";

};