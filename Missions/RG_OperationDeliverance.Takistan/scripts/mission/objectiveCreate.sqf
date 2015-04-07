_centerPos = (_this select 0);


_objBluTask = [
	"OBJB",
	 WEST,
	["Escort the HVT to the area", "Escort HVT", "Escort HVT"],
	_centerPos,
	"AUTOASSIGNED",
	10,
    true,
    true
] call BIS_fnc_setTask;

_objRedTask = [
	"OBJR",
	 resistance,
	["Capture the HVT", "Stop the HVT", "Stop the HVT"],
	_centerPos,
	"AUTOASSIGNED",
	10,
    true,
    true
] call BIS_fnc_setTask;

_trg = createTrigger ["EmptyDetector", _centerPos];
_trg setTriggerArea [20, 20, 0, false];
_trg setTriggerActivation ["CIV", "PRESENT", false];
_trg setTriggerStatements ["this",format ["['OBJB','Succeeded'] call BIS_fnc_taskSetState;['OBJR','FAILED'] call BIS_fnc_taskSetState;"],""];

waitUntil {['OBJB'] call BIS_fnc_taskState isEqualTo "Succeeded"};

"end1" call BIS_fnc_endMission;