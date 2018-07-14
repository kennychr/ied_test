EODS_FNC_PRESSURE_PLATE = {

  params ["_ied"];
  _ied setVariable ["EODS_Ieds_STATUS_ARMADO", true, true];

  _handol = [{

    _ied = _this select 0 select 0;
    _iedPos = getPos _ied;
    //_nearEntitiesCount = count (_iedPos nearEntities [["Man", "Air", "Car", "Motorcycle", "Tank"], 2]);
    //DEBUG
    //_nearEntitiesCount remoteExec ["hint",0];

    //if (_nearEntitiesCount > 0 )
    if ({_x distance _ied < 4} count allPlayers > 0 && (alive _ied) ) then {


           _posicion = getpos _ied;
           _tipodebomba = "Bo_GBU12_LGB_MI10";
           _numeroexplisiones = 1;
           _numerofragmentos = 150;
           _maxAfecDistancia = 180;
           _radioCaida = 80;
           _tipoMetralla = "B_408_Ball";
           _explosion = createVehicle [_tipodebomba, _posicion, [], 0, "CAN_COLLIDE"];
           _ied setpos [0,0,0];
           [_posicion,_numerofragmentos,_tipoMetralla] spawn FNC_EODS_METRALLA;

           [_handol] call CBA_fnc_removePerFrameHandler;
       };
    } , 0.05, [_ied]] call CBA_fnc_addPerFrameHandler;
};
