
    if (isServer) then {
        while {true} do {

			numb = 0; {if(side _x == west) then {numb = numb +1;};}forEach allUnits;
			if (numb == 0) exitWith {
            
                [2,false] call f_fnc_mpEnd;
            };

			
			numr = 0; {if(side _x == east) then {numr = numr +1;};}forEach allUnits;
			if (numr == 0) exitWith {
			
                [1,false] call f_fnc_mpEnd;
            };
		sleep 2;
        };

    };  
