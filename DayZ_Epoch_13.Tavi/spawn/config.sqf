/*
	ESSV3 Client Side Config

	For detailed information about these variables see:
	https://github.com/ebayShopper/ESSV3/blob/master/DOCUMENTATION.md
*/

class_selection = true; //Enable class selection dialog
#define START_ITEMS "FoodMRE","PartGeneric","ItemPainkiller","ItemBandage","ItemBandage"
class_public = [ // These are visible to anyone on the server
	[(localize "str_playerstats_bandit")+" Lvl1","GUE_Commander_DZ","BB_Merc_OA_Female_light",[START_ITEMS,"15Rnd_9x19_M9","15Rnd_9x19_M9","ItemAntibiotic","ItemBloodbag"],["M9_DZ","ItemMap","ItemKnife","ItemEtool","ItemCrowbar","ItemToolbox","ItemGPS"],"DZ_TK_Assault_Pack_EP1",[],[],0,-5000,0],
	[(localize "str_playerstats_bandit")+" Lvl2","Ins_Soldier_2_DZ","BB_Merc_OA_Female_light",[START_ITEMS,"ItemBandage","ItemBandage","6Rnd_45ACP","6Rnd_45ACP","ItemAntibiotic","ItemBloodbag"],["Revolver_DZ","ItemMap","ItemKnife","ItemEtool","ItemCrowbar","ItemToolbox","ItemGPS"],"DZ_British_ACU",[],[],0,-15000,0],
	[(localize "str_playerstats_bandit")+" Lvl3","Sniper1_DZ","BB_Merc_OA_Female_light",[START_ITEMS,"ItemBandage","ItemBandage","30Rnd_9x19_UZI","30Rnd_9x19_UZI","ItemAntibiotic","ItemBloodbag","ItemMorphine","ItemPainkiller"],["PDW_DZ","ItemMap","ItemKnife","ItemEtool","ItemCrowbar","ItemToolbox","ItemGPS"],"DZ_GunBag_EP1",[],[],0,-25000,0],
	//[(localize "str_playerstats_bandit")+" Lvl4","gsc_eco_stalker_mask_fred","BB_Merc_OA_Female_light",[START_ITEMS,"17Rnd_9x19_glock17",4,"ItemMorphine"],["G17_DZ","ItemGPS","ItemRadio","ItemToolbox"],"DZ_TK_Assault_Pack_EP1",[],[],0,-40000,0,"MeleeHatchet"],
	[(localize "str_playerstats_hero")+" Lvl1",if (class_epoch) then {"GUE_Commander_DZ"} else {"Survivor3_DZ"},"BB_Merc_OA_Female_light",[START_ITEMS,"15Rnd_9x19_M9","15Rnd_9x19_M9","ItemAntibiotic","ItemBloodbag"],["M9_DZ","ItemMap","ItemKnife","ItemEtool","ItemCrowbar","ItemToolbox","ItemGPS"],"DZ_TK_Assault_Pack_EP1",[],[],0,5000,0],
	[(localize "str_playerstats_hero")+" Lvl2",if (class_epoch) then {"UN_CDF_Soldier_Guard_EP1"} else {"Survivor3_DZ"},"BB_Merc_OA_Female_light",[START_ITEMS,"ItemBandage","ItemBandage","6Rnd_45ACP","6Rnd_45ACP","ItemAntibiotic","ItemBloodbag"],["Revolver_DZ","ItemMap","ItemKnife","ItemEtool","ItemCrowbar","ItemToolbox","ItemGPS"],"DZ_British_ACU",[],[],0,15000,0],
	[(localize "str_playerstats_hero")+" Lvl3",if (class_epoch) then {"Soldier_Sniper_PMC_DZ"} else {"Survivor3_DZ"},"BB_Merc_OA_Female_light",[START_ITEMS,"ItemBandage","ItemBandage","30Rnd_9x19_UZI","30Rnd_9x19_UZI","ItemAntibiotic","ItemBloodbag","ItemMorphine","ItemPainkiller"],["PDW_DZ","ItemMap","ItemKnife","ItemEtool","ItemCrowbar","ItemToolbox","ItemGPS"],"DZ_GunBag_EP1",[],[],0,25000,0],
	//[(localize "str_playerstats_hero")+" Lvl4",if (class_epoch) then {"gsc_military_helmet_grey"} else {"Survivor3_DZ"},"BB_Merc_OA_Female_light",[START_ITEMS,"6Rnd_45ACP",4,"ItemMorphine"],["Revolver_DZ","ItemGPS","ItemRadio","ItemToolbox"],"DZ_TK_Assault_Pack_EP1",[],[],0,40000,0,"MeleeHatchet"],
	[localize "str_playerstats_survivor","Haris_Press_EP1_DZ","BB_Merc_OA_Female_light",[START_ITEMS,"15Rnd_9x19_M9"],["M9_DZ","ItemMap","ItemKnife","ItemEtool","ItemCrowbar","ItemToolbox","ItemGPS"],"DZ_Patrol_Pack_EP1",[],[],0,0,0]
];

halo_selection = false; // Enable HALO selection dialog
halo_force = false; // Skip HALO selection dialog and force HALO spawn.
halo_type = ""; // Type of plane. Tested with C130J_US_EP1_DZ, AN2_DZ, MV22_DZ. Use "" to disable the plane and use regular HALO.

spawn_selection = true; // Enable spawn selection dialog
spawn_bodyCheck = -1; // If a player has a body within this distance of a spawn that spawn will be blocked. Set to -1 to disable.
spawn_nearGroup = true; // Allow players to spawn near their group. BodyCheck can override.
spawn_nearPlot = true; // Allow players to spawn near their plot. BodyCheck can override.
spawn_radius = 1000; // Distance around spawn to find a safe pos. Lower is closer to exact coordinates. Do not set too low or BIS_fnc_findSafePos may fail.

spawn_public = switch (toLower worldName) do {
	case "tavi": {
		[
			[localize "str_disp_srvsetup_random",[[9093,2614,0],[17588,4952,0],[15954,15847,0],[16674,13930,0],[11361,6685,0],[17744,10299,0],[18292,7537,0],[13561,19300,0],[15246,17425,0],[12268,9763,0]],0,0,1],
			["Topolka",[9093,2614,0],0,0],
			["Stari Sad",[17588,4952,0],0,0],
			["Sevastopol",[15954,15847,0],0,0],
			["Martin",[16674,13930,0],0,0],
			["Komarovo",[11361,6685,0],0,0],
			["Dubovo",[17744,10299,0],0,0],
			["Byelov",[18292,7537,0],0,0],
			["Khotanovsk",[13561,19300,0],0,0],
			["Dalnogorsk",[15246,17425,0],0,0],
			["Kameni",[8350,18937,0],0,0],
			["Lyepestok",[11238,14413,0],0,0],
			["Marina",[10184,1542,0],0,0],
			["Race Track",[1529,7271,0],0,0],
			["Chernovar",[5904,10519,0],0,0],
			["Vladimir",[2116,17368,0],0,0],
			["Alexander",[5294,17800,0],0,0]
			//["Sector B (!Dangerous place!)",[22087,19089,0],0,0]	
		]
	};
};