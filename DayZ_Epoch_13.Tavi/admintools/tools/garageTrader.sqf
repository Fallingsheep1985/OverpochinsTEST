private ["_player"];
area = 1;
aCount = 1;

_player = player;

if(EAT_logMajorTool) then {
	EAT_PVEH_usageLogger = format["%1 %2 -- has spawned %3 Garage Trader units",name _player,getPlayerUID _player,aCount];
	[] spawn {publicVariable "EAT_PVEH_usageLogger";};
};

spawnAI = {
	private ["_pos_x","_pos_y","_pos_z","_weaponandmag","_weapon","_magazine","_aigear","_unitGroup","_unit"];
	_aiSkill = [["aimingAccuracy",0.60],["aimingShake",0.60],["aimingSpeed",0.60],["endurance",1.00],["spotDistance",0.60],["spotTime",0.60],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];
	_aiAssault = [["M16A4_ACG","30Rnd_556x45_Stanag"],["Sa58V_RCO_EP1","30Rnd_762x39_AK47"],["SCAR_L_STD_Mk4CQT","30Rnd_556x45_Stanag"],["M8_sharpshooter","30Rnd_556x45_Stanag"],["M4A1_HWS_GL_camo","30Rnd_556x45_Stanag"],["SCAR_L_STD_HOLO","30Rnd_556x45_Stanag"],["M4A3_CCO_EP1","30Rnd_556x45_Stanag"],["M4A3_CCO_EP1","30Rnd_556x45_Stanag"],["M4A1_AIM_SD_camo","30Rnd_556x45_StanagSD"],["M16A4","30Rnd_556x45_Stanag"],["m8_carbine","30Rnd_556x45_Stanag"],["BAF_L85A2_RIS_Holo","30Rnd_556x45_Stanag"],["Sa58V_CCO_EP1","30Rnd_762x39_AK47"]];
	_aiMachine = [["RPK_74","75Rnd_545x39_RPK"],["MK_48_DZ","100Rnd_762x51_M240"],["M249_EP1_DZ","200Rnd_556x45_M249"],["Pecheneg_DZ","100Rnd_762x54_PK"],["M240_DZ","100Rnd_762x51_M240"]];
	_aiSniper = [["M14_EP1","20Rnd_762x51_DMR"],["SCAR_H_LNG_Sniper_SD","20Rnd_762x51_SB_SCAR"],["M110_NVG_EP1","20rnd_762x51_B_SCAR"],["SVD_CAMO","10Rnd_762x54_SVD"],["VSS_Vintorez","20Rnd_9x39_SP5_VSS"],["DMR","20Rnd_762x51_DMR"],["M40A3","5Rnd_762x51_M24"]];
	_aiRandomWep = [_aiAssault,_aiAssault,_aiAssault,_aiSniper,_aiMachine];
	_aiBags = ["DZ_Czech_Vest_Puch","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_British_ACU","DZ_GunBag_EP1","DZ_CivilBackpack_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1"];
	_aiSkin = ["Profiteer4"];

	_divisor = _this select 0;
	_aiPosition = getPos _player;
	_pos_x = _aiPosition select 0;
	_pos_y = _aiPosition select 1;
	_pos_z = _aiPosition select 2;
	_weaponandmag = (_aiRandomWep call BIS_fnc_selectRandom) call BIS_fnc_selectRandom;
	_weapon = _weaponandmag select 0;
	_magazine = _weaponandmag select 1;
	_aigear = [["ItemBandage","ItemBandage","ItemPainkiller"],["ItemKnife","ItemMap"]];
	_unitGroup = createGroup WEST;

	for "_x" from 1 to (aCount/_divisor) do {
		_unit = _unitGroup createUnit [(_aiSkin call BIS_fnc_selectRandom),[_pos_x,_pos_y,_pos_z],[],(area/2),"CAN COLLIDE"];
		[_unit] joinSilent _unitGroup;
		removeAllWeapons _unit;
		removeAllItems _unit;
		_unit addweapon "NVGoggles";
		_i = 0;
		
		// Magazine count 3
		for "_i" from 1 to 3 do {
			_unit addMagazine _magazine;
		};
		
		_unit addweapon _weapon;
		_unit selectWeapon _weapon;
		_unit addBackpack (_aiBags call BIS_fnc_selectRandom);

		{
			_unit addMagazine _x
		} count (_aigear select 0);

		{
			_unit addweapon _x
		} count (_aigear select 1);
		{
			_unit setSkill [(_x select 0),(_x select 1)]
		} count _aiSkill;
		_unit addEventHandler ["Killed",{_unit removeWeapon "NVGoggles"; Sleep 900; deleteVehicle _unit;}]; // Delete units 15 minutes after death
	};
	_unitGroup setFormation "ECH LEFT";
	_unitGroup selectLeader ((units _unitGroup) select 0);
	[_unitGroup, [_pos_x,_pos_y,_pos_z]] spawn unit_waypoints;
};

[1] call spawnAI;


