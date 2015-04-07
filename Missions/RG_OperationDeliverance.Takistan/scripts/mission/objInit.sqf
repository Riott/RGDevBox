_locations = ["obj1","obj2","obj3","obj4"];

_objType = floor(random(1));
_rndLoc = _locations call BIS_fnc_selectRandom;
switch (_objType) do
{
   case 0: {[(getMarkerPos _rndLoc)] execVM "scripts\mission\objectiveCreate.sqf"};//have your task be created in this file and other objective specific stuff created
   default {hintSilent "Objective not defined"};
};  