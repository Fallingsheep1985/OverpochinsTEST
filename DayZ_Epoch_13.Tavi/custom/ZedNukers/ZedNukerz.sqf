if (isNil "zombiefree") then {
    zombiefree = false;
};

while {zombiefree} do {
            _entity_array = (getPos player) nearEntities ["CAManBase",500];
            {
                if (_x isKindof "zZombie_Base") then {
                    deletevehicle _x;
                };
            } forEach _entity_array;
            sleep 4;
        };