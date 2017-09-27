private ["_unit","_selection","_strH","_damage","_upgrades"];
_unit =         _this select 0;
_selection =    _this select 1;
_damage =       _this select 2;

if (_selection != "" && local _unit) then {
    if (_selection in Ori_VehicleUpgrades) then {
        _unit setVariable [_selection,_damage,true];
        PVDZ_veh_Save = [_unit,"repair"];
    } else {
        _strH = "hit_" + (_selection);
        _unit setHit[_selection,_damage];

        _unit setVariable [_strH,_damage,true];
        if (_damage == 0) then {
            PVDZ_veh_Save = [_unit,"repair"];
        } else {
            PVDZ_veh_Save = [_unit,"damage"];
        };
    };
   
    if (isServer) then {
        PVDZ_veh_Save call server_updateObject;
    } else {
        publicVariableServer "PVDZ_veh_Save";
    };
};