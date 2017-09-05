/*
	DayZ Mission System Config by Vampire
	DZMS: https://github.com/SMVampire/DZMS-DayZMissionSystem
*/

///////////////////////////////////////////////////////////////////////
//If you have ZSC installed then you can set this to true to place money in ai wallets.
DZMSAICheckWallet = true;

// Do you want your players to gain humanity from killing mission AI?
DZMSMissHumanity = true;

// How Much Humanity?
DZMSCntHumanity = 100;

// Do You Want AI to use NVGs?
//(They are deleted on death)
DZMSUseNVG = true;

// Do you want AI to use RPG7V's?
//(Only one unit per group spawn will have one)
DZMSUseRPG = true;

// Do you want AI kills to count as bandit kills?
DZMSCntBanditKls = true;

// Do you want AI to disappear instantly when killed?
DZMSCleanDeath = false;

// Do you want AI that players run over to not have gear?
// (If DZMSCleanDeath is true, this doesn't matter)
DZMSRunGear = true;

// How long before bodies disappear? (in seconds) (default = 2400)
DZMSBodyTime = 2400;

// Percentage of AI that must be dead before mission completes (default = 0)
//( 0 is 0% of AI / 0.50 is 50% / 1 is 100% )
DZMSRequiredKillPercent = 0.80;

// How long in seconds before mission scenery disappears (default = 1800 / 0 = disabled)
DZMSSceneryDespawnTimer = 0;

// Should crates despawn with scenery? (default = false)
DZMSSceneryDespawnLoot = false;

//////////////////////////////////////////////////////////////////////////////////////////
// You can adjust the weapons that spawn in weapon crates inside DZMSWeaponCrateList.sqf
// You can adjust the AI's gear inside DZMSAIConfig.sqf in the ExtConfig folder also.
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
// Do you want to use static coords for missions?
// Leave this false unless you know what you are doing.
DZMSStaticPlc = false;

// Array of static locations. X,Y,Z
DZMSStatLocs = [
[0,0,0],
[0,0,0]
];

///////////////////////////////////////////////////////////////////////////////////////////////////////////
// Do you want vehicles from missions to save to the Database? (this means they will stay after a restart)
// If False, vehicles will disappear on restart. It will warn a player who gets inside of a vehicle.
// This is experimental, and off by default in this version.
DZMSSaveVehicles = false;

/////////////////////////////////////////////////////////////////////////////////////////////
// These are arrays of vehicle classnames for the missions.
// Adjust to your liking.

//Helicopters
DZMSChoppers = ["UH1H_DZE","Mi17_DZE","UH60M_MEV_EP1_DZ","BAF_Merlin_DZE","UH60M_EP1_DZE"];

//Small Vehicles
DZMSSmallVic = ["hilux1_civil_3_open_DZE","SUV_TK_CIV_EP1","HMMWV_DZ","UAZ_Unarmed_UN_EP1","HMMWV_Ambulance_CZ_DES_EP1","LandRover_TK_CIV_EP1","SUV_Camo"];

//Large Vehicles
DZMSLargeVic = ["Ural_TK_CIV_EP1","Ural_CDF","Ural_UN_EP1","UralCivil_DZE","UralCivil2_DZE","MTVR_DES_EP1","MTVR","Kamaz_DZE","KamazOpen_DZE"];

/*///////////////////////////////////////////////////////////////////////////////////////////
There are two types of missions that run simultaneously on a the server.
The two types are Major and Minor missions.

Major missions have a higher AI count, but also have more crates to loot.
Minor missions have less AI than Major missions, but have crates that reflect that.

Below is the array of mission file names and the minimum and maximum times they run.
Do not edit the Arrays unless you know what you are doing.
*/
DZMSMajorArray = ["EM1","SM1","SM2","SM3","SM4","SM5","SM6","SM7","SM9","SM10","SM12","SM13"];
DZMSMinorArray = ["SM1","SM2","SM3","SM4","SM5","SM6","SM9"];

/////////////////////////////////////////////////////////////////////////////////////////////
// The Minumum time in seconds before a major mission will run.
// At least this much time will pass between major missions. Default = 650 (10.8 Minutes)
DZMSMajorMin = 300;

// Maximum time in seconds before a major mission will run.
// A major mission will always run before this much time has passed. Default = 2000 (33.33 Minutes)
DZMSMajorMax = 2000;

// Time in seconds before a minor mission will run.
// At least this much time will pass between minor missions. Default = 600 (10 Minutes)
DZMSMinorMin = 300;

// Maximum time in seconds before a minor mission will run.
// A minor mission will always run before this much time has passed. Default = 990 (16.5 Minutes)
DZMSMinorMax = 990;

// Blacklist Zone Array -- missions will not spawn in these areas
// format: [[x,y,z],radius]
// Ex: [[06325,07807,0],300] //Starry Sobor
DZMSBlacklistZones = [
	[[0,0,0],50]
];

/*=============================================================================================*/
// Do Not Edit Below This Line
/*=============================================================================================*/
DZMSVersion = "1.1FIN";
