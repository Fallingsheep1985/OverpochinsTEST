Z_singleCurrency = true;

DZE_maintainCurrencyRate = 1000;

DZE_MoneyStorageClasses = DZE_LockableStorage; // List of classnames that players can bank with. If you want a specific class name added (i.e Plastic_Pole_EP1_DZ) consult the README.md on github.
ZSC_defaultStorageMultiplier = 200; // Default magazine count for banks objects that don't have storage slots (i.e Suitcase, Info_Board_EP1, Plastic_Pole_EP1_DZ)
ZSC_MaxMoneyInStorageMultiplier = 500000; // Multiplier for how much money a bank object can hold, example: 200 magazine slots in the object (or the default value above ^^) multiplied by the 50,000 multiplier is 10 million coin storage. (200*50000=10m coins)

Z_bankVariable = "moneySpecial"; // If using single currency this is the variable name used to store object bank wealth.
Z_globalVariable = "GlobalMoney"; // If using single currency this is the variable name used to store coins globally.
Z_moneyVariable = "GlobalMoney"; // Uncomment this this to make it so players don't lose coins on death. Will need to disable checkWallet as you can dupe if you have this and check wallet running.

/*
	IMPORTANT: The following 2 variables below are CASE SENSITIVE! If you don't put the object/trader classname EXACTLY how
	they appear in game, THEY WILL NOT WORK!
*/

ZSC_bankObjects = ["Plastic_Pole_EP1_DZ"]; // Array of objects that are available for banking (i.e Suitcase, Info_Board_EP1)
ZSC_bankTraders = ["Functionary1_EP1_DZ"]; // Array of trader classnames that are available for banking (i.e RU_Functionary1)
ZSC_limitOnBank = true; // Have a limit on the bank? (i.e true or false) limits the global banking to the number below.
ZSC_maxBankMoney = 10000000; // Default limit for bank objects.


//Origins Houses
if(isNil "owner_H1") then {
	owner_H1 = [];
};
if(isNil "owner_H2") then {
	owner_H2 = [];
};
if(isNil "owner_H3") then {
	owner_H3 = [];
};
if(isNil "owner_B1") then {
	owner_B1 = [];
};
if(isNil "owner_B2") then {
	owner_B2 = [];
};
if(isNil "owner_B3") then {
	owner_B3 = [];
};
if(isNil "owner_SG") then {
	owner_SG = [];
};
if(isNil "owner_KING") then {
	owner_KING = [];
};
if(isNil "owner_SH") then {
	owner_SH = [];
};
if(isNil "owner_LG") then {
	owner_LG = [];
};

//undefined variables (CLIENT RPT SPAM FIX)

s_player_deploybike2 = -1;
bucketIn = -1;
bucketOut = -1;
sub_up = -1;
sub_down = -1;
s_house_sleep = -1;

//Player self-action handles
dayz_resetSelfActions = {
	s_player_equip_carry = -1;
	s_player_fire = -1;
	s_player_cook = -1;
	s_player_boil = -1;
	s_player_fireout = -1;
	s_player_packtent = -1;
	s_player_packtentinfected = -1;
	s_player_fillfuel = -1;
	s_player_grabflare = -1;
	s_player_removeflare = -1;
	s_player_studybody = -1;
	s_player_deleteBuild = -1;
	s_player_flipveh = -1;
	s_player_sleep = -1;
	s_player_fillfuel210 = -1;
	s_player_fillfuel20 = -1;
	s_player_fillfuel5 = -1;
	s_player_siphonfuel = -1;
	s_player_repair_crtl = -1;
	s_player_fishing = -1;
	s_player_fishing_veh = -1;
	s_player_gather = -1;
	s_player_destroytent = -1;
	s_player_attach_bomb = -1;
	s_player_upgradestorage = -1;
	s_player_Drinkfromhands = -1;
	/*s_player_lockhouse = -1; //Vanilla base building currently not used in Epoch
	s_player_unlockhouse = -1;
	s_player_openGate = -1;
	s_player_CloseGate = -1;
	s_player_breakinhouse = -1;
	s_player_setCode = -1;
	s_player_BuildUnLock = -1;
	s_player_BuildLock = -1;*/
	
	// EPOCH ADDITIONS
	s_player_packvault = -1;
	s_player_lockvault = -1;
	s_player_unlockvault = -1;
	s_player_attack = -1;
	s_player_callzombies = -1;
	s_player_showname = -1;
	s_player_pzombiesattack = -1;
	s_player_pzombiesvision = -1;
	s_player_pzombiesfeed = -1;
	s_player_tamedog = -1;
	s_player_parts_crtl = -1;
	s_player_movedog = -1;
	s_player_speeddog = -1;
	s_player_calldog = -1;
	s_player_feeddog = -1;
	s_player_waterdog = -1;
	s_player_staydog = -1;
	s_player_trackdog = -1;
	s_player_barkdog = -1;
	s_player_warndog = -1;
	s_player_followdog = -1;
	s_player_information = -1;
	s_player_fuelauto = -1;
	s_player_fuelauto2 = -1;
	s_player_fillgen = -1;
	s_player_upgrade_build = -1;
	s_player_maint_build = -1;
	s_player_downgrade_build = -1;
	s_player_towing = -1;
	s_halo_action = -1;
	s_player_SurrenderedGear = -1;
	s_player_maintain_area = -1;
	s_player_maintain_area_force = -1;
	s_player_maintain_area_preview = -1;
	s_player_heli_lift = -1;
	s_player_heli_detach = -1;
	s_player_lockUnlock_crtl = -1;
	s_player_lockUnlockInside_ctrl = -1;
	s_player_toggleSnap = -1;
	s_player_toggleSnapSelect = -1;
	s_player_toggleSnapSelectPoint = [];
	snapActions = -1;
	s_player_plot_boundary = -1;
	s_player_plotManagement = -1;
	s_player_toggleDegree = -1;
	s_player_toggleDegrees=[];
	degreeActions = -1;
	s_player_toggleVector = -1;
	s_player_toggleVectors=[];
	vectorActions = -1;
	s_player_manageDoor = -1;
	s_player_clothes = -1; // Zabns take clothes

	// Custom below
	s_givemoney_dialog = -1;
	s_bank_dialog = -1;
	s_player_checkWallet = -1;
	s_bank_dialog1 = -1;
	s_bank_dialog2 = -1;
	s_garage_dialog = -1;
	s_garage_dialog2 = -1;
	sub_down = -1;
	sub_up = -1;
	bucketIn = -1;
	bucketOut = -1;
	s_demolish = -1;
	s_player_deploybike2 = -1;
	s_player_clothes = -1;
	s_house_sleep = -1;
	s_player_checkgear = -1;
};

call dayz_resetSelfActions;