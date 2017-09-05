private ["_crate","_crate2","_crate3","_crate4","_crate5","_crate6"];


DZMSProtectObj = {
	private ["_object","_objectID"];
	_object = _this select 0;
	
	_objectID = str(round(random 999999));
	_object setVariable ["ObjectID", _objectID, true];
	_object setVariable ["ObjectUID", _objectID, true];
	
	if (_object isKindOf "ReammoBox") then {
		// PermaLoot on top of ObjID because that "arma logic"
		_object setVariable ["permaLoot",true];
		_object setVariable ["Mission", "1", true];
	}; 
};



_coords  = [[22162.9,19852.4,0.001],[22300.2,19961.8,0.001]] call BIS_fnc_selectRandom; //frente prefeitura - casas OK
_coords2 = [[22462.4,19499.4,0.001],[22539.1,19900.4,0.001]] call BIS_fnc_selectRandom; //quadrado - antena - 
_coords3 = [[22491.3,20059.3,0.001],[22158.2,19519.1,0.001]] call BIS_fnc_selectRandom; //container - escola
_coords4 = [[22805.9,19853.7,0.001],[22147.2,19933.2,0.001]] call BIS_fnc_selectRandom; //hotel - oficina


// CREATE FIRST BOX
_crate = createVehicle ["UralCivil2",[(_coords select 0),(_coords select 1),0],[], 0, "CAN_COLLIDE"];
_crate setVehicleInit " 
							this setHit [""wheel_2_3_steering"", 1];
							this setHit [""wheel_2_2_steering"", 1];
							this setHit [""wheel_1_1_steering"", 1];
							this setHit [""wheel_1_3_steering"", 1];
							this allowDamage false;
						";
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

//ARMAS PRIMARIAS
_crate addWeaponCargoGlobal ["M24", 2];
_crate addWeaponCargoGlobal ["M4SPR", 2];
_crate addWeaponCargoGlobal ["Sa58V_RCO_EP1", 2];
_crate addWeaponCargoGlobal ["m16a4_acg", 2];
_crate addWeaponCargoGlobal ["FN_FAL_ANPVS4", 2];
_crate addWeaponCargoGlobal ["FN_FAL", 2];

//PISTOLAS
_crate addWeaponCargoGlobal ["glock17_EP1", 2];
_crate addWeaponCargoGlobal ["M9", 2];
_crate addWeaponCargoGlobal ["M9SD", 2];
_crate addWeaponCargoGlobal ["UZI_SD_EP1", 2];
_crate addWeaponCargoGlobal ["MakarovSD", 2];

//ITEM MÉDICO
_crate addMagazineCargoGlobal ["ItemBandage", 5];
_crate addMagazineCargoGlobal ["ItemMorphine", 5];
_crate addMagazineCargoGlobal ["ItemEpinephrine", 5];
_crate addMagazineCargoGlobal ["ItemPainkiller", 5];
_crate addMagazineCargoGlobal ["ItemWaterbottle", 5];
_crate addMagazineCargoGlobal ["FoodMRE", 5];
_crate addMagazineCargoGlobal ["ItemAntibiotic", 5];
_crate addMagazineCargoGlobal ["ItemBloodbag", 5];

//ITENS NORMAIS
_crate addMagazineCargoGlobal ["CinderBlocks", 20];
_crate addMagazineCargoGlobal ["PartGeneric", 20];
_crate addMagazineCargoGlobal ["ItemSandbag", 20];
_crate addMagazineCargoGlobal ["ItemWire", 20];
_crate addMagazineCargoGlobal ["30m_plot_kit", 2];
_crate addMagazineCargoGlobal ["ItemBriefcase100oz", 2];

//ITEM TOOLBELT
_crate addWeaponCargoGlobal ["ItemToolbox", 2];
_crate addWeaponCargoGlobal ["ItemCrowbar", 2];
_crate addWeaponCargoGlobal ["ItemKnife", 2];
_crate addWeaponCargoGlobal ["ItemEtool", 2];
_crate addWeaponCargoGlobal ["ItemHatchet_DZE", 2];
_crate addWeaponCargoGlobal ["ItemMatchbox_DZE", 2];
_crate addMagazineCargoGlobal ["FlareGreen_M203", 2];
_crate addMagazineCargoGlobal ["FlareWhite_M203", 2];
_crate addMagazineCargoGlobal ["1Rnd_HE_M203", 2];
_crate addMagazineCargoGlobal ["FlareRed_M203", 2];
_crate addMagazineCargoGlobal ["Skin_GUE_Soldier_Sniper_DZ", 2];

//BACKPACKS
_crate addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 2];
_crate addBackpackCargoGlobal ["DZ_CivilBackpack_EP1", 2];

//Launcher
_crate addWeaponCargoGlobal ["Javelin", 1];
//Ammo
_crate addMagazineCargoGlobal ["Javelin", 2];

[_crate] call DZMSProtectObj;
_crate setDir -28.85478;


// ---------------------------------------------------------------


// CREATE SECOND BOX
_crate2 = createVehicle ["UralCivil2",[(_coords2 select 0),(_coords2 select 1),0],[], 0, "CAN_COLLIDE"];
_crate2 setVehicleInit " 
							this setHit [""wheel_2_3_steering"", 1];
							this setHit [""wheel_2_2_steering"", 1];
							this setHit [""wheel_1_1_steering"", 1];
							this setHit [""wheel_1_3_steering"", 1];
							this allowDamage false;
						";
clearWeaponCargoGlobal _crate2;
clearMagazineCargoGlobal _crate2;

//ARMAS PRIMARIAS
_crate2 addWeaponCargoGlobal ["SVD", 2];
_crate2 addWeaponCargoGlobal ["M14_EP1", 2];
_crate2 addWeaponCargoGlobal ["M4A3_CCO_EP1", 4];
_crate2 addWeaponCargoGlobal ["AK_107_PSO", 3];

_crate2 addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 10];
_crate2 addMagazineCargoGlobal ["30Rnd_762x39_AK47", 10];
_crate2 addMagazineCargoGlobal ["20Rnd_762x51_DMR", 4];
_crate2 addMagazineCargoGlobal ["10Rnd_762x54_SVD", 5];

//PISTOLAS
_crate2 addWeaponCargoGlobal ["glock17_EP1", 2];
_crate2 addWeaponCargoGlobal ["M9", 2];
_crate2 addWeaponCargoGlobal ["MakarovSD", 2];

_crate2 addMagazineCargoGlobal ["17Rnd_9x19_glock17", 10];
_crate2 addMagazineCargoGlobal ["8Rnd_9x18_Makarov", 5];

//ITEM MÉDICO
_crate2 addMagazineCargoGlobal ["ItemBandage", 5];
_crate2 addMagazineCargoGlobal ["ItemMorphine", 5];
_crate2 addMagazineCargoGlobal ["ItemEpinephrine", 5];
_crate2 addMagazineCargoGlobal ["ItemPainkiller", 5];
_crate2 addMagazineCargoGlobal ["ItemWaterbottle", 5];
_crate2 addMagazineCargoGlobal ["FoodMRE", 5];
_crate2 addMagazineCargoGlobal ["ItemAntibiotic", 5];
_crate2 addMagazineCargoGlobal ["ItemBloodbag", 5];

//ITENS NORMAIS
_crate addMagazineCargoGlobal ["CinderBlocks", 20];
_crate2 addMagazineCargoGlobal ["PartGeneric", 20];
_crate2 addMagazineCargoGlobal ["ItemSandbag", 20];
_crate2 addMagazineCargoGlobal ["MortarBucket", 20];
_crate2 addMagazineCargoGlobal ["ItemWire", 20];
_crate2 addMagazineCargoGlobal ["30m_plot_kit", 2];
_crate2 addMagazineCargoGlobal ["ItemBriefcase100oz", 2];

//ITEM TOOLBELT
_crate2 addWeaponCargoGlobal ["ItemToolbox", 2];
_crate2 addWeaponCargoGlobal ["ItemCrowbar", 2];
_crate2 addWeaponCargoGlobal ["ItemKnife", 2];
_crate2 addWeaponCargoGlobal ["ItemEtool", 2];
_crate2 addWeaponCargoGlobal ["ItemHatchet_DZE", 2];
_crate2 addWeaponCargoGlobal ["ItemMatchbox_DZE", 2];
_crate2 addMagazineCargoGlobal ["FlareGreen_M203", 2];
_crate2 addMagazineCargoGlobal ["FlareWhite_M203", 2];
_crate2 addMagazineCargoGlobal ["1Rnd_HE_M203", 2];
_crate2 addMagazineCargoGlobal ["FlareRed_M203", 2];
_crate2 addMagazineCargoGlobal ["Skin_GUE_Soldier_Sniper_DZ", 2];

//BACKPACKS
_crate2 addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 2];
_crate2 addBackpackCargoGlobal ["DZ_CivilBackpack_EP1", 2];

//Launcher
_crate2 addWeaponCargoGlobal ["SMAW", 1];
//Ammo
_crate2 addMagazineCargoGlobal ["SMAW_HEAA", 2];

[_crate2] call DZMSProtectObj;
_crate2 setDir -28.85478;



// ---------------------------------------------------------------


// CREATE THIRD BOX
_crate3 = createVehicle ["UralCivil2",[(_coords3 select 0),(_coords3 select 1),0],[], 0, "CAN_COLLIDE"];
_crate3 setVehicleInit " 
							this setHit [""wheel_2_3_steering"", 1];
							this setHit [""wheel_2_2_steering"", 1];
							this setHit [""wheel_1_1_steering"", 1];
							this setHit [""wheel_1_3_steering"", 1];
							this allowDamage false;
						";
clearWeaponCargoGlobal _crate3;
clearMagazineCargoGlobal _crate3;

//ARMAS PRIMARIAS
_crate3 addWeaponCargoGlobal ["DMR", 1];
_crate3 addWeaponCargoGlobal ["VSS_vintorez", 2];
_crate3 addWeaponCargoGlobal ["MP5SD", 4];
_crate3 addWeaponCargoGlobal ["M4A1_HWS_GL_SD_Camo", 3];

_crate3 addMagazineCargoGlobal ["30Rnd_9x19_MP5SD", 10];
_crate3 addMagazineCargoGlobal ["30Rnd_556x45_StanagSD", 10];
_crate3 addMagazineCargoGlobal ["20Rnd_762x51_DMR", 4];
_crate3 addMagazineCargoGlobal ["20Rnd_9x39_SP5_VSS", 5];

//PISTOLAS
_crate3 addWeaponCargoGlobal ["glock17_EP1", 2];
_crate3 addWeaponCargoGlobal ["M9", 2];
_crate3 addWeaponCargoGlobal ["MakarovSD", 2];

_crate3 addMagazineCargoGlobal ["17Rnd_9x19_glock17", 10];
_crate3 addMagazineCargoGlobal ["8Rnd_9x18_Makarov", 5];

//ITEM MÉDICO
_crate3 addMagazineCargoGlobal ["ItemBandage", 5];
_crate3 addMagazineCargoGlobal ["ItemMorphine", 5];
_crate3 addMagazineCargoGlobal ["ItemEpinephrine", 5];
_crate3 addMagazineCargoGlobal ["ItemPainkiller", 5];
_crate3 addMagazineCargoGlobal ["ItemWaterbottle", 5];
_crate3 addMagazineCargoGlobal ["FoodMRE", 5];
_crate3 addMagazineCargoGlobal ["ItemAntibiotic", 5];
_crate3 addMagazineCargoGlobal ["ItemBloodbag", 5];

//ITENS NORMAIS
_crate3 addMagazineCargoGlobal ["CinderBlocks", 20];
_crate3 addMagazineCargoGlobal ["PartGeneric", 20];
_crate3 addMagazineCargoGlobal ["ItemSandbag", 20];
_crate3 addMagazineCargoGlobal ["MortarBucket", 20];
_crate3 addMagazineCargoGlobal ["ItemWire", 20];
_crate3 addMagazineCargoGlobal ["30m_plot_kit", 2];
_crate3 addMagazineCargoGlobal ["ItemBriefcase100oz", 2];

//ITEM TOOLBELT
_crate3 addWeaponCargoGlobal ["ItemCrowbar", 2];
_crate3 addWeaponCargoGlobal ["ItemKnife", 2];
_crate3 addWeaponCargoGlobal ["ItemHatchet_DZE", 2];
_crate3 addWeaponCargoGlobal ["ItemMatchbox_DZE", 2];

//BACKPACKS
_crate3 addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1];
_crate3 addBackpackCargoGlobal ["DZ_CivilBackpack_EP1", 1];

//Launcher
_crate3 addWeaponCargoGlobal ["Stinger", 1];
//Ammo
_crate3 addMagazineCargoGlobal ["Stinger", 2];

[_crate3] call DZMSProtectObj;
_crate3 setDir -28.85478;



// ---------------------------------------------------------------


// CREATE FORTH BOX
_crate4 = createVehicle ["UralCivil2",[(_coords4 select 0),(_coords4 select 1),0],[], 0, "CAN_COLLIDE"];
_crate4 setVehicleInit " 
							this setHit [""wheel_2_3_steering"", 1];
							this setHit [""wheel_2_2_steering"", 1];
							this setHit [""wheel_1_1_steering"", 1];
							this setHit [""wheel_1_3_steering"", 1];
							this allowDamage false;
						";
clearWeaponCargoGlobal _crate4;
clearMagazineCargoGlobal _crate4;

//ARMAS PRIMARIAS
_crate4 addWeaponCargoGlobal ["Mk_48_DZ", 1];
_crate4 addWeaponCargoGlobal ["G36_C_SD_camo", 4];
_crate4 addWeaponCargoGlobal ["M40A3", 2];

_crate4 addMagazineCargoGlobal ["5Rnd_762x51_M24", 10];
_crate4 addMagazineCargoGlobal ["30Rnd_556x45_StanagSD", 10];
_crate4 addMagazineCargoGlobal ["100Rnd_762x51_M240", 2];

//PISTOLAS
_crate4 addWeaponCargoGlobal ["glock17_EP1", 2];
_crate4 addWeaponCargoGlobal ["M9", 2];
_crate4 addWeaponCargoGlobal ["MakarovSD", 2];

_crate4 addMagazineCargoGlobal ["17Rnd_9x19_glock17", 10];
_crate4 addMagazineCargoGlobal ["8Rnd_9x18_Makarov", 5];

//ITEM MÉDICO
_crate4 addMagazineCargoGlobal ["ItemBandage", 5];
_crate4 addMagazineCargoGlobal ["ItemMorphine", 5];
_crate4 addMagazineCargoGlobal ["ItemEpinephrine", 5];
_crate4 addMagazineCargoGlobal ["ItemPainkiller", 5];
_crate4 addMagazineCargoGlobal ["ItemWaterbottle", 5];
_crate4 addMagazineCargoGlobal ["FoodMRE", 5];
_crate4 addMagazineCargoGlobal ["ItemAntibiotic", 5];
_crate4 addMagazineCargoGlobal ["ItemBloodbag", 5];

//ITENS NORMAIS
_crate4 addMagazineCargoGlobal ["CinderBlocks", 20];
_crate4 addMagazineCargoGlobal ["PartGeneric", 20];
_crate4 addMagazineCargoGlobal ["ItemSandbag", 20];
_crate4 addMagazineCargoGlobal ["MortarBucket", 20];
_crate4 addMagazineCargoGlobal ["ItemWire", 20];
_crate4 addMagazineCargoGlobal ["30m_plot_kit", 2];
_crate4 addMagazineCargoGlobal ["ItemBriefcase100oz", 2];

//ITEM TOOLBELT
_crate4 addWeaponCargoGlobal ["ItemCrowbar", 2];
_crate4 addWeaponCargoGlobal ["ItemKnife", 2];
_crate4 addWeaponCargoGlobal ["ItemHatchet_DZE", 2];
_crate4 addWeaponCargoGlobal ["ItemMatchbox_DZE", 2];

//BACKPACKS
_crate4 addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1];
_crate4 addBackpackCargoGlobal ["DZ_CivilBackpack_EP1", 1];

//Launcher
_crate4 addWeaponCargoGlobal ["RPG18", 1];
//Ammo
_crate4 addMagazineCargoGlobal ["RPG18", 2];

[_crate4] call DZMSProtectObj;
_crate4 setDir -28.85478;


// ---------------------------------------------------------------