if(isServer) then {

//AA

	[
		[									// Position(s) (can be multiple)
			[23065.1,19373.4,10.0015],
			[22213.4,19980.6,13.7535]
		],
		"Igla_AA_pod_TK_EP1",				// Classname of turret
		"extreme",							// Skill level of unit (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit",							// AI Type, "Hero" or "Bandit".
		"Random",							// Primary gun set number. "Random" for random weapon set
		5,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random"							// Gearset classname, use "Random" or classname here
	] call spawn_static;
	
//DSHKM
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

	diag_log "WAI: Static mission loaded";

};