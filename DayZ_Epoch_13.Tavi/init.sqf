/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/


//Server settings
dayZ_instance = 11; //Instance ID of this server
dayZ_serverName = ""; //Shown to all players in the bottom left of the screen (country code + server number)

//Game settings
dayz_antihack = 0; // DayZ Antihack / 1 = enabled // 0 = disabled
dayz_REsec = 1; // DayZ RE Security / 1 = enabled // 0 = disabled
dayz_enableRules = true; //Enables a nice little news/rules feed on player login (make sure to keep the lists quick).
dayz_quickSwitch = false; //Turns on forced animation for weapon switch. (hotkeys 1,2,3) False = enable animations, True = disable animations
dayz_POIs = false; //Adds Point of Interest map additions (negatively impacts FPS)
dayz_infectiousWaterholes = false; //Randomly adds some bodies, graves and wrecks by ponds (negatively impacts FPS)
dayz_ForcefullmoonNights = true; // Forces night time to be full moon.
dayz_randomMaxFuelAmount = 500; //Puts a random amount of fuel in all fuel stations.

//Virtual Garage
DZE_garagist = ["Profiteer4","Worker3","RU_Profiteer4","Hooker1","Worker2"];


//DayZMod presets
dayz_presets = "Custom"; //"Custom","Classic","Vanilla","Elite"

//Only need to edit if you are running a custom server.
if (dayz_presets == "Custom") then {
	dayz_enableGhosting = false; //Enable disable the ghosting system.
	dayz_ghostTimer = 60; //Sets how long in seconds a player must be disconnected before being able to login again.
	dayz_spawnselection = 0; //(Chernarus only) Turn on spawn selection 0 = random only spawns, 1 = spawn choice based on limits
	dayz_spawncarepkgs_clutterCutter = 2; //0 = loot hidden in grass, 1 = loot lifted, 2 = no grass
	dayz_spawnCrashSite_clutterCutter = 2;	// heli crash options 0 = loot hidden in grass, 1 = loot lifted, 2 = no grass
	dayz_spawnInfectedSite_clutterCutter = 2; // infected base spawn 0 = loot hidden in grass, 1 = loot lifted, 2 = no grass 
	dayz_bleedingeffect = 2; //1 = blood on the ground (negatively impacts FPS), 2 = partical effect, 3 = both
	dayz_OpenTarget_TimerTicks = 60 * 10; //how long can a player be freely attacked for after attacking someone unprovoked
	dayz_nutritionValuesSystem = false; //true, Enables nutrition system, false, disables nutrition system.
	dayz_classicBloodBagSystem = true; // disable blood types system and use the single classic ItemBloodbag
	dayz_enableFlies = false; // Enable flies on dead bodies (negatively impacts FPS).
};

//Temp settings
dayz_DamageMultiplier = 3; //1 - 0 = Disabled, anything over 1 will multiply damage. Damage Multiplier for Zombies.
dayz_maxGlobalZeds = 200; //Limit the total zeds server wide.
dayz_maxLocalZombies = 40; //Max number of zombies spawned per player. (Default: 40)
dayz_spawnZombies = 40;

dayz_maxGlobalZombiesIncrease = 5; //This is the amount of global zombie limit increase per player within 400m (Default: 10)
dayz_zedsAttackVehicles = true; //Disables zombies attacking vehicles.  (Default: false)
dayz_maxZeds = 200; //Total zombie limit (Default: 500)
dayz_maxGlobalZombiesInit = 20; //Starting global max zombie count, this will increase for each player within 400m (Default: 40)

dayz_temperature_override = true; // Set to true to disable all temperature changes.

enableRadio false;
enableSentences false;

// EPOCH CONFIG VARIABLES START //
#include "\z\addons\dayz_code\configVariables.sqf" // Don't remove this line
// See the above file for a full list including descriptions and default values
// Uncomment the lines below to change the default loadout
DefaultMagazines = ["ItemBandage","ItemBandage","ItemPainkiller","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov"];
DefaultWeapons = ["Makarov_DZ","ItemFlashlight","ItemMap","ItemRadio","ItemToolbox"];
DefaultBackpack = "DZ_Patrol_Pack_EP1";
DefaultBackpackItems = []; // Can include both weapons and magazines i.e. ["PDW_DZ","30Rnd_9x19_UZI"];
dayz_paraSpawn = true; // Halo spawn
// Group System
dayz_groupSystem = true; // Enable group system
dayz_markGroup = 1; // Players can see their group members on the map 0=never, 1=always, 2=With GPS only
dayz_markSelf = 1; // Players can see their own position on the map 0=never, 1=always, 2=With GPS only
dayz_markBody = 1; // Players can see their corpse position on the map 0=never, 1=always, 2=With GPS only
dayz_requireRadio = false; // Require players to have a radio on their toolbelt to create a group, be in a group and receive invites.
// Plot Management and Plot for Life
DZE_Origins_Building_System = true;
DZE_AllowCargoCheck = true; //allow cargo check
DZE_permanentPlot = true; // Plot ownership saves after death. Enables Plot for Life by @RimBlock and Plot Management by @DevZupa.
DZE_plotManagementMustBeClose = true; //Players must be within 10m of pole to be added as a plot friend.
DZE_PlotManagementAdmins = ["76561197997835618"]; //Array of admin PlayerUIDs. UIDs in this list are able to access every pole's management menu and delete or build any buildable with a pole nearby.
DZE_MaxPlotFriends = 10; //Max friends allowed on a plot. There is no character limit in the inventory field of the database, but lower values limit the max global setVariable size to improve performance.
DZE_maintainCurrencyRate = 1000; //The currency rate of what maintaining an item will be, for instance: at 100, 10 items will have a worth of 1000 (1 10oz gold or 1k coins) see actions/maintain_area.sqf for more examples.
DZE_limitPlots = true; // Limit the amount of plot poles per person to 1, UIDS in the DZE_PlotManagementAdmins array are exempt.
DZE_isRemovable = ["Plastic_Pole_EP1_DZ"]; //Items that can be removed with a crowbar with no ownership or access required. To forbid base take overs remove plot pole from this list and add it to DZE_restrictRemoval. It is not necessary to add wrecks or items that inherit from 'BuiltItems' to this list.
DZE_restrictRemoval = ["Fence_corrugated_DZ","M240Nest_DZ","ParkBench_DZ","FireBarrel_DZ","Scaffolding_DZ","CanvasHut_DZ","LightPole_DZ","DeerStand_DZ","MetalGate_DZ","StickFence_DZ"]; //Items that can be removed with a crowbar only with proper ownership or access. It is not necessary to add doors, storage or items that inherit from 'ModularItems' to this list. Items that inherit from 'BuiltItems' can be added to this list if desired.
DZE_BackpackAntiTheft = True; // Prevent stealing from backpacks in trader zones
DZE_BuildOnRoads = false; // Allow building on roads
DZE_PlayerZed = false; // Enable spawning as a player zombie when players die with infected status
DZE_R3F_WEIGHT = false; // Enable R3F weight. Players carrying too much will be overburdened and forced to move slowly.
DZE_slowZombies = false; // Force zombies to always walk
DZE_StaticConstructionCount = 1; // Steps required to build. If greater than 0 this applies to all objects.
DZE_GodModeBase = true; // Make player built base objects indestructible
DZE_requireplot = 1; // Require a plot pole to build  0 = Off, 1 = On
DZE_PlotPole = [30,50]; // Radius owned by plot pole [Regular objects,Other plotpoles]. Difference between them is the minimum buffer between bases.
DZE_BuildingLimit = 200; // Max number of built objects allowed in DZE_PlotPole radius
DZE_SelfTransfuse = true; // Allow players to bloodbag themselves
DZE_selfTransfuse_Values = [10000,15,120]; // [blood amount given, infection chance %, cooldown in seconds]
MaxDynamicDebris = 20; // Max number of random road blocks to spawn around the map
MaxVehicleLimit = 0; // Max number of random vehicles to spawn around the map
spawnArea = 1000; // Distance around markers to find a safe spawn position
spawnShoremode = 0; // Random spawn locations  1 = on shores, 0 = inland
EpochUseEvents = false; //Enable event scheduler. Define custom scripts in dayz_server\modules to run on a schedule.
EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];
// EPOCH CONFIG VARIABLES END //

// Restrict building near map areas
RestrictedBuildingZones = [
//  ["What text will say", [Choords of place to block], Distance around that area to block (radius in meters)]
    ["No Building in Sector B", [22520,19818,0], 3000]
];

diag_log 'dayz_preloadFinished reset';
dayz_preloadFinished=nil;
onPreloadStarted "diag_log [diag_tickTime,'onPreloadStarted']; dayz_preloadFinished = false;";
onPreloadFinished "diag_log [diag_tickTime,'onPreloadFinished']; dayz_preloadFinished = true;";
with uiNameSpace do {RscDMSLoad=nil;}; // autologon at next logon

if (!isDedicated) then {
	enableSaving [false, false];
	startLoadingScreen ["","RscDisplayLoadCustom"];
	progressLoadingScreen 0;
	dayz_loadScreenMsg = localize 'str_login_missionFile';
	progress_monitor = [] execVM "\z\addons\dayz_code\system\progress_monitor.sqf";
	0 cutText ['','BLACK',0];
	0 fadeSound 0;
	0 fadeMusic 0;
};

initialized = false;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";
DZE_safeVehicle = ["ParachuteWest","ParachuteC","Old_bike_TK_INS_EP1","AH6X_DZ"];

SleepFood = 1800; //minutes 2160 (48 hours)
SleepWater = 1800; //minutes 1440 (24 hours)

//Load in compiled functions
call compile preprocessFileLineNumbers "origins\config.sqf";
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "origins\compiles.sqf";				//Compile regular functions
call compile preprocessFileLineNumbers "dayz_code\init\variables.sqf";
progressLoadingScreen 0.05;
//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";
call compile preprocessFileLineNumbers "scripts\garage\publicEH.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
progressLoadingScreen 0.15;
//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";
call compile preprocessFileLineNumbers "dayz_code\init\compiles1.sqf";
call compile preprocessFileLineNumbers "dayz_code\init\compiles.sqf";

progressLoadingScreen 0.25;
call compile preprocessFileLineNumbers "scripts\traders\server_traders.sqf";
call compile preprocessFileLineNumbers "logistic\init.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_code\system\mission\tavi.sqf"; //Add trader city objects locally on every machine early
if (dayz_POIs && (toLower worldName == "chernarus")) then {call compile preprocessFileLineNumbers "\z\addons\dayz_code\system\mission\chernarus\poi\init.sqf";}; //Add POI objects locally on every machine early

//ADMINTOOLS FOR TESTING
call compile preprocessFileLineNumbers "admintools\config.sqf"; // Epoch admin Tools config file
call compile preprocessFileLineNumbers "admintools\variables.sqf"; // Epoch admin Tools variables

initialized = true;
call compile preprocessFileLineNumbers "addons\suicide\init.sqf";

setTerrainGrid 50;
if (dayz_REsec == 1) then {call compile preprocessFileLineNumbers "\z\addons\dayz_code\system\REsec.sqf";};

//execVM "\z\addons\dayz_code\system\DynamicWeatherEffects.sqf";

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\system\dynamic_vehicle.sqf";
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\system\server_monitor.sqf";
	execVM "\z\addons\dayz_server\traders\tavi.sqf"; //Add trader agents
	execVM "\z\addons\dayz_server\bankTraders\tavi.sqf"; //Add banking agents
	
	//Get the server to setup what waterholes are going to be infected and then broadcast to everyone.
	if (dayz_infectiousWaterholes && (toLower worldName == "chernarus")) then {execVM "\z\addons\dayz_code\system\mission\chernarus\infectiousWaterholes\init.sqf";};
	
	// Lootable objects from CfgTownGeneratorDefault.hpp
	if (dayz_townGenerator) then { execVM "\z\addons\dayz_code\system\mission\chernarus\MainLootableObjects.sqf"; };
};

if (!isDedicated) then {
	//Enables Plant lib fixes
	//execVM "\z\addons\dayz_code\system\antihack.sqf";
	// Epoch Admin Tools
	[] execVM "admintools\antihack\antihack.sqf"; // Epoch Antihack with bypass
		
	if (dayz_townGenerator) then { execVM "\z\addons\dayz_code\compile\client_plantSpawner.sqf"; };
	call compile preprocessFileLineNumbers "spawn\init.sqf";
	execFSM "\z\addons\dayz_code\system\player_monitor.fsm";
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	_nil = [] execVM "custom\remote\remote.sqf";
	if (DZE_R3F_WEIGHT) then {execVM "\z\addons\dayz_code\external\R3F_Realism\R3F_Realism_Init.sqf";};
	call compile preprocessFileLineNumbers "scripts\zsc\zscInit.sqf";	
	call compile preprocessFileLineNumbers "scripts\zsc\zscATMInit.sqf";
	execVM "scripts\zsc\playerHud.sqf";
	[] execVM "dayz_code\compile\remote_message.sqf";
	execVM "scripts\service_points\service_point.sqf";
	waitUntil {scriptDone progress_monitor};
	cutText ["","BLACK IN", 3];
	3 fadeSound 1;
	3 fadeMusic 1;
	endLoadingScreen;
	
	

};
call compile preprocessFileLineNumbers "addons\bike\init.sqf";
[] execVM 'scripts\SafeZone.sqf';
[] execVM 'scripts\showtime.sqf';
[] execVM 'scripts\takeClothes.sqf';
[] execVM 'scripts\Markers\BanditAir.sqf';
[] execVM 'scripts\Markers\HeroAir.sqf';

//sheep custom fast travel
fn_ftravel = compile preprocessFile "scripts\fasttravel\fn_ftravel.sqf";

//fix dze build check missing variables
LimitPlotPoles = false; // limit how many plotpoles a player can have
PlotPoleLimit = 1; // how many plotpoles a player can have

// Epoch admin tools
[] execVM "admintools\Activate.sqf"; 

	
server_timeSync = {};
setTerrainGrid 50;