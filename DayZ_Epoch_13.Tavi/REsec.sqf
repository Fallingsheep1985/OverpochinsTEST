waitUntil {!isNil "BIS_MPF_remoteExecutionServer"};
_remoteExecutionServerORIGINAL = BIS_MPF_remoteExecutionServer;

waitUntil{!isNil "BIS_MPF_InitDone"};
waitUntil{!isNil "BIS_fnc_init"};

{
	call compile format["r%1code={diag_log(""WARNING illegal RE %1"");};",_x];
} forEach ["addAction", "addEventhandler", "addMagazine", "addMagazineCargo", "addWeapon",
"addWeaponCargo", "addWPCur", "animate", "callVar", "clearMagazineCargo", "clearWeaponCargo", "createDiaryRecord",
"createMarkerLocal", "createSimpleTask", "createTaskSet", "debugLog", "deleteWP", "enablesimulation", "endMission",
"execfsm", "fadeMusic", "fadeSound", "failMission", "globalChat", "globalRadio", "groupChat", "groupRadio",
"hideObject", "hint", "hintC", "kbAddTopic", "kbreact", "kbRemoveTopic", "kbtell", "land", "move", "moveIn",
"playAction", "playActionnow", "playmovenow", "playMusic", "playsound", "removeAction",
"removeAllWeapons", "setCaptive", "setCurrentTask", "setCurrentTaskArrays", "setDate", "setDir", "setGroupID",
"setMarkerPosLocal", "setObjectTexture", "setSimpleTaskDescription", "setTaskState", "setWPdesc", "setWPtype",
"showCommandingMenu", "sideChat", "sideRadio", "skiptime", "spawn", "switchAction", "switchCamera", "taskHint",
"titleCut", "Hangender"];



diag_log(__FILE__+":Monitoring Remote Exe...");
if(isNil"FN_CALL_LOG_DLL")then{FN_CALL_LOG_DLL = {};};

__defaultRemExChecks = {
	private['_fa','_co'];
	_fa=_this select 1;
	if(count _fa>=3)then
	{
		_co=_fa select 2;
		if(typeName _co=='STRING')then
		{
			_co=toLower _co;
			if(_co IN['loc','locper','perloc','per'])then
			{
				if(count _fa>=4)then
				{
					_co=_fa select 3;
				};
			};
		};
		if(typeName _co == 'STRING')then
		{
			{
				if(!((_x>=65&&_x<=90)||(_x>=97&&_x<=122))) exitWith
				{
					diag_log('WARNING possible code injection args:'+str(_this));
					_clean = false;
				};
			} forEach (toArray _co);
		};
	};
};

__fnc_inString = {
	private ['_needle','_haystack','_needleLen','_hay','_found'];
	_needle = if(isNil{_this select 0})then{''}else{if(typeName (_this select 0) == 'STRING')then{_this select 0}else{''}};
	if(_needle == '')exitWith{};
	_needle = toLower _needle;
	
	_haystack = if(isNil{_this select 1})then{''}else{if(typeName (_this select 1) == 'STRING')then{_this select 1}else{''}};
	if(_haystack == '')exitWith{};
	_haystack = toLower _haystack;
	_haystack = toArray _haystack;
	
	
	_needleLen = count toArray _needle;
	_hay = +_haystack;
	_hay resize _needleLen;
	_found = false;
	for '_i' from _needleLen to count _haystack do {
		if(toString _hay == _needle)exitWith {_found = true};
		_hay set [_needleLen, _haystack select _i];
		_hay set [0, 'x'];
		_hay = _hay - ['x']
	};
	_found
};


___remoteExecutionServer = "
	_haystackX = str(_this select 1);
	_clean = true;
	
	call "+str __defaultRemExChecks+";
	_fnc_inString = "+str __fnc_inString+";
	
	{
		_found = [_x,_haystackX] call _fnc_inString;
		if(_found)exitWith{
			_clean = false;
			diag_log format['BIS_MPF_remoteExecutionServer STOPPED! Found needle (%1)',_x];
		};
	} forEach [
		'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'
	];
	
	if(_clean)then{ call "+str _remoteExecutionServerORIGINAL+" };
";
___remoteExecutionServer = compile ___remoteExecutionServer;
while{(1 == 1)}do{
	"remExField" addPublicVariableEventHandler ___remoteExecutionServer;
	"remExFP" addPublicVariableEventHandler ___remoteExecutionServer;
};
