call compile preprocessFileLineNumbers "\EODS_ieds\funciones\PRESSURE_IEDS\EODS_FNC_PRESSURE_PLATE.sqf";
params ["_ied"];
[_ied] spawn EODS_FNC_PRESSURE_PLATE;
