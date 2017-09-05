/*

	CUSTOM TRADERS FOR TAVIANA EPOCH
	(Credits: DayZ Epoch Devs for their Originsal traders.)
	AUTHOR: AVendettaForYou
	Date: 12/11/2013

*/

serverTraders = [
"GUE_Worker2", //Bandit Air
"Soldier_Sniper_KSVK_PMC",
"Soldier_GL_PMC",
"GUE_Soldier_Pilot",
"GUE_Woodlander3",
"Worker4",
"Reynolds_PMC",
"Soldier_Sniper_PMC", //Hero Air
"GUE_Soldier_3",
"RU_Doctor",
"Doctor",
"UN_CDF_Soldier_Pilot_EP1",
"RU_Worker4",
"RU_Woodlander4",
"Citizen3",
"RU_Damsel5",
"Dr_Hladik_EP1",
"GUE_Commander",
"Profiteer2_EP1",
"RU_Farmwife5",
"GUE_Woodlander1",
"RU_Worker1",
"GUE_Soldier_2"];

/*---------------------------------------------------------------------------
			HERO VENDORS
---------------------------------------------------------------------------*/


//Main Seller
menu_GUE_Woodlander3 = [
	[["Origins",700],["Ammo",478],["Military Armed",562],["Helicopter Armed",493],["Trucks Armed",479],["Weapons",477],["Clothes",476]],
	[],
	"hero"
];
//Supplies
menu_RU_Damsel5 = [
	[["Vehicle Parts",677],["Medical Supplies",541],["Backpacks",538],["Drinks",601],["Packaged Food",629]],
	[],
	"hero"
];
//Air Trader
menu_Soldier_Sniper_PMC = [
	[["Planes",2015]],
	[],
	"hero"
];

/*---------------------------------------------------------------------------
			BANDIT VENDORS
---------------------------------------------------------------------------*/

//Main Seller
menu_GUE_Woodlander1 = [
	[["Origins",700],["Ammo",478],["Military Armed",562],["Helicopter Armed",493],["Trucks Armed",479],["Weapons",477],["Clothes",476]],
	[],
	"hostile"
];
//SUPPLIES
menu_RU_Worker1 = [
	[["Building Supplies",678],["Medical Supplies",541],["Backpacks",538],["Drinks",601],["Packaged Food",629]],
	[],
	"hostile"
];
//Air Trader
menu_GUE_Worker2 = [
	[["Planes",2016]],
	[],
	"hostile"
];

/*---------------------------------------------------------------------------
			NEUTRAL VENDORS
---------------------------------------------------------------------------*/

//MEDICAL
menu_Doctor = [
	[["Chem-lites/Flares",542],["Medical Supplies",541],["Smoke Grenades",543]],
	[],
	"neutral"
];
//SUPPLIES
menu_RU_Worker4 = [
	[["Building Supplies",678],["Currency and gems",1100],["Tools",679],["Vehicle Parts",677]],
	[],
	"neutral"
];
//WEAPONS
menu_Soldier_Sniper_KSVK_PMC = [
	[["ACR",412],["Attachments",693],["HK416 Variants",1004],["HK417 Variants",1002],["AK Variants",1003],["G3 Variants",1007],["Masada Variants",1009],["Assault Rifle",485],["Light Machine Gun",486],["LMG Variants",1008],["SCAR Variants",1011],["Sniper Variants",1001],["Pistols",489],["Shotguns and Single-shot",574],["Sniper Rifle",487],["Submachine Guns",488]],
	[],
	"neutral"
];
//AMMUNITION
menu_Soldier_GL_PMC = [
	[["Assault Rifle Ammo",621],["Grenades",529],["Light Machine Gun Ammo",622],["Pistol Ammo",625],["Shotguns and Single-shot Ammo",623],["Sniper Rifle Ammo",624],["Submachine Gun Ammo",626]],
	[],
	"neutral"
];
//FOOD & DRINK
menu_Citizen3 = [
	[["Backpacks",538],["Clothes",628],["Cooked Meats",630],["Currency and gems",1100],["Drinks",601],["Packaged Food",629]],
	[],
	"neutral"
];


/*---------------------------------------------------------------------------
			NEUTRAL VEHICLE VENDORS
---------------------------------------------------------------------------*/

menu_GUE_Soldier_3 = [
	[["Bikes and ATV",608],["Buses and Vans",563],["Cargo Trucks",564],["Fuel Trucks",492],["Military Unarmed",491],["Trucks",495],["Used Cars",585],["Utility Vehicles",565],["Cop cars",1012],["Nissan 350z",1013]],
	[],
	"neutral"
];
menu_RU_Woodlander4 = [
	[["Bikes and ATV",608],["Buses and Vans",563],["Cargo Trucks",564],["Fuel Trucks",492],["Military Unarmed",491],["Trucks",495],["Used Cars",585],["Utility Vehicles",565],["Cop cars",1012],["Nissan 350z",1013]],
	[],
	"neutral"
];
menu_Worker4 = [
	[["Boats Armed",673],["Boats Unarmed",672],["Origins Boats",702]],
	[],
	"neutral"
];
menu_Profiteer2_EP1 = [
	[["Boats Armed",673],["Boats Unarmed",672],["Origins Boats",702]],
	[],
	"neutral"
];
menu_GUE_Soldier_Pilot = [
	[["Origins Air",699],["Airplanes",517],["Currency and gems",1100],["Helicopter Unarmed",519],["Overwatch Camels (Armed)",1014]],
	[],
	"neutral"
];
menu_UN_CDF_Soldier_Pilot_EP1 = [
	[["Origins Air",699],["Airplanes",517],["Currency and gems",1100],["Helicopter Unarmed",519],["Overwatch Camels (Armed)",1014]],
	[],
	"neutral"
];

/*---------------------------------------------------------------------------
			FRIENDLY VENDORS
---------------------------------------------------------------------------*/

/*
//Origins Trader
menu_GUE_Commander = [
	[["Origins Houses",703]],
	[],
	"neutral"
];
*/
/*---------------------------------------------------------------------------
			WHOLESALE VENDORS
---------------------------------------------------------------------------*/

//EAST BRIDGE
menu_GUE_Soldier_2 = [
	[["Wholesale",675],["Currency and gems",1100]],
	[],
	"neutral"
];
//WEST BRIDGE
menu_Reynolds_PMC = [
	[["Wholesale",675],["Currency and gems",1100]],
	[],
	"neutral"
];
