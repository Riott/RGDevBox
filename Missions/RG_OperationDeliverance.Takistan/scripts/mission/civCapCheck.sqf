/*
 *
 *
 * civCapCheck
 * ------------------------
 *	
 *  usage:
 *	null = [unit, delay] execVM "scripts\mission\civCapCheck.sqf"
 * 
 */

 private ["_unit", "_delay"];
 _unit = _this select 0;
 _delay = _this select 1;
 hint "lol ok unit is in";

while {alive _unit} do { 
	hint "got into while";
	if (_unit getVariable ["AGM_isCaptive", false]) then {
		hint "captured";
		// execute code for opfor win and break loop
		break;
	}
	else {
		
		hint "not captured";
		
		// do nothing
	};
	

	
// run loop after _delay seconds
	sleep _delay;

};
hint "end of file";