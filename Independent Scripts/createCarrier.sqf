/*
	WARNING: THIS SCRIPT REQUIRES AiATP (e.g. you can see the Utes island in the editor's map list) IN ORDER TO WORK PROPERLY!
	
	***PLEASE MAKE SURE THAT THIS FILE IS RUN ONLY SERVERSIDE***
	
			tagus_fnc_spawnCarrier
			----------------------
				Arguments:
					0	(position) The location of where to spawn the carrier
					1	(string, optional) The name that you want to give the ship
					2	(string, optional) The classname of the aircraft you want to spawn in the Jet positions on the carrier
					3	(boolean, optional) If true, a civilian Little Bird will spawn on the roof of the Carrier
				
			This script will spawn the Arma 2 carrier in terms of sea-level, so it'll clip into the ground if it's not over the water.
			
			~ Made by /u/tagus, 27 March 2015
				
 */
 
 //Parse the given parameters:
_chosenCenter				=	[_this, 0, [0,0], [[]], [2,3]] call BIS_fnc_param;
_shipName				=	[_this, 1, "USS Iwo Jima", [""]] call BIS_fnc_param;
_jetType					=	[_this, 2, "", [""]] call BIS_fnc_param;
_helicopterAllowed		=	[_this, 3, true] call BIS_fnc_param;
 
_direction				=	0;	//the god damn thing rotates but it doesn't rotate perfectly no matter how hard I try!
 
//initialize the attributes
if (isNil "tagus_carrierMarkerList") then {tagus_carrierObjList = [];};
if (isNil "tagus_carrierMarkerList") then {tagus_carrierMarkerList = [];};	
if (isNil "tagus_markerList") then { tagus_markerList = []; };
if (isNil "tagus_triggerList") then { tagus_triggerList = []; };
 
//the boring parts (assuming direction = due north)
_objArray = ["Land_LHD_1","Land_LHD_2","Land_LHD_3","Land_LHD_4","Land_LHD_5","Land_LHD_6","Land_LHD_house_1","Land_LHD_house_2", "Land_LHD_elev_R"];
 _posArray = [[-0.628244,84.45], [-1.227366,23], [0,0], [-2.069756,-45], [-2.455127,-89.97], [-2.064272,-131], [-3.269653,-6.13], [-6.478291,-46.929], [2.473122,-116.121]];
_dirArray = [0,0,0,0,0,0,0,0,0,0];
 
//main loop
{	
	//prepare to generate the carrier's objects
	_tempDir = (_dirArray select _forEachIndex) + _direction;
	
	_tempPos = 
	[
		(_chosenCenter select 0) + ((_posArray select _forEachIndex) select 0),
		(_chosenCenter select 1) + ((_posArray select _forEachIndex) select 1),
		0
	];
 
	
	//actually generate the carrier's objects
	_tempVeh = (_x) createVehicle _tempPos;
	_tempVeh setPosASL _tempPos;
	tagus_carrierObjList pushBack _tempVeh;
	
	//prepare to generate the map markers for the carrier
	_objectDimensions = boundingBoxReal _tempVeh;
	_objWidth = ((_objectDimensions select 1) select 0) - ((_objectDimensions select 0) select 0);
	_objHeight = ((_objectDimensions select 1) select 1) - ((_objectDimensions select 0) select 1);
 
	
	//finally, generate the markers themselves
	_tempMarker = createMarker [("Carrier Part number " + str (count tagus_carrierMarkerList)), _tempPos];
	_tempMarker setMarkerShape "RECTANGLE";
	_tempMarker setMarkerBrush "SolidFull";
	_tempMarker setMarkerColor "ColorGrey";
	_tempMarker setMarkerSize [0.55*_objWidth, 0.55*_objHeight];	//reducing by 45% seems accurate enough...
	_tempMarker setMarkerDir _tempDir;
	tagus_carrierMarkerList pushBack _tempMarker;
} forEach (_objArray);
 
//Create the marker with the ship's name on it
_tempMarker = createMarker [("carrierName" + str (count tagus_carrierMarkerList)), _chosenCenter];
_tempMarker setMarkerShape "ICON";
_tempMarker setMarkerType "b_naval";
_tempMarker setMarkerColor "ColorWest";
_tempMarker setMarkerText _shipName;
 
 
//////// SPAWN THE JETS IN THE APPROPRIATE PLACES!
if (_jetType != "") then
{
	tagus_jetList = [];	//used to clean up the carrier afterward via tagus_fnc_removeCarrier
	
	//format:  [x,y,z,classname,dir] <--all local to the carrier's position and orientation! Replace the _jetType to change aircraft
	_runwayJetPosLocal = [-9.5,-120,16, _jetType, 0];  
	_standbyJet1PosLocal = [8.5,-134,16, _jetType, -43];
	_standbyJet2PosLocal = [8.5,-117,16, _jetType, -43];
	_standbyJet3PosLocal = [8.5,-97,16, _jetType, -43];
 
	_aircraftPositions = [_standbyJet1PosLocal, _standbyJet2PosLocal, _standbyJet3PosLocal];
 
	if (_helicopterAllowed) then
	{	
		_helicopterType		=	"C_Heli_Light_01_civil_F";
		_helicopterPosLocal	=	[5,-38,25, _helicopterType, 0];
		_aircraftPositions pushBack _helicopterPosLocal;
 
	};
 
	
	{
		_jetSpawnPos = 
		[
			(_chosenCenter select 0) + (_x select 0),
			(_chosenCenter select 1) + (_x select 1),
			(_chosenCenter select 2) + (_x select 2)
		];
		_tempJet = (_x select 3) createVehicle _jetSpawnPos;
		_tempJet setDir (_x select 4);
		_tempJet allowDamage false;
		_tempJet setPosASL _jetSpawnPos;
		_tempJet allowDamage true;
		tagus_jetList pushBack _tempJet;
	} forEach _aircraftPositions;
	
	//give the jets their custom shit
	tagus_jetList spawn {
		{
			_temp = _x;
			{																//this section will rearm the jets with AA stuff
			_temp removeWeapon _x;												//
			} forEach ( (weapons _temp) );										//
			{																//
				_temp removeMagazines _x;										//
			} forEach ( (magazines _temp) );									//
																			//
			_x addWeapon "js_w_master_arms_safe";								//
																			//
			_x addWeapon "Cannon_30mm_Plane_CAS_02_F";							//
			_x addMagazine "500Rnd_Cannon_30mm_Plane_CAS_02_F";					//
																			//
			_x addWeapon "missiles_ASRAAM";										//
			_x addMagazine "4Rnd_AAA_missiles";									//
																			//
			_x addWeapon "CMFlareLauncher";										//
			_x addMagazine "300Rnd_CMFlare_Chaff_Magazine";						//
		} forEach _this;
	};
};
 
 
//Create the special carrier triggers (rearming zone, helicopter landing trigger)
//add a repeating trigger that blackens the screen when the player goes to third person view
_tempMarker = createMarker [("trg_serviceAircraft " + str(count tagus_markerList)), [(_chosenCenter select 0) + 8, (_chosenCenter select 1) + 53]];
_tempMarker setMarkerShape "RECTANGLE";
_tempMarker setMarkerBrush "Solid";
_tempMarker setMarkerColor "ColorCivilian";
_tempMarker setMarkerSize [8,17];
tagus_markerList pushBack _tempMarker;
 
{
	[
		[
			[_jetType, _tempMarker],
			{
				if (isNil "tagus_triggerList") then //if this variable doesn't exist, then create it
				{
					tagus_triggerList = [];
				};
				_tempTrigger = createTrigger ["EmptyDetector", getMarkerPos (_this select 1)];
				_cond = "this && {typeOf (vehicle player) == 'JS_JC_FA18E'}";
				_onAct = "[] spawn tagus_fnc_serviceAircraft";
				_onDeact = "";
				_tempTrigger triggerAttachVehicle [player];
				_tempTrigger setTriggerArea 
				[
					(getMarkerSize _tempMarker select 0), 
					(getMarkerSize _tempMarker select 1), 
					0, 
					true
				];
				_tempTrigger setTriggerActivation ["VEHICLE", "PRESENT", true];
				_tempTrigger setTriggerTimeout [3, 3, 3, true];
				_tempTrigger setTriggerStatements [_cond, _onAct, _onDeact];
				tagus_triggerList pushBack _tempTrigger;
			}
		],
		"bis_fnc_spawn",
		(owner _x),
		true
	] call BIS_fnc_MP;
} forEach (call BIS_fnc_listPlayers);
 
//Create the special carrier triggers (rearming zone, helicopter landing trigger)
//add a repeating trigger that blackens the screen when the player goes to third person view
_tempMarker = createMarker ["trg_serviceHelicopter " + str(count tagus_markerList), [(_chosenCenter select 0) + 9, (_chosenCenter select 1) - 39]];
_tempMarker setMarkerShape "RECTANGLE";
_tempMarker setMarkerBrush "Solid";
_tempMarker setMarkerColor "ColorCivilian";
_tempMarker setMarkerSize [6,6];
 
{	
	[
		[
			[_helicopterAllowed],
			{
				if (_this select 0) then
				{	
					if (isNil "tagus_triggerList") then //if this variable doesn't exist, then create it
					{
						tagus_triggerList = [];
					};
					
					_helicopterType		=	"C_Heli_Light_01_civil_F";
					
					//I still need to position this and resize it properly.
					//also I need to create the proper onActivation thing, I guess
					_tempTrigger = createTrigger ["EmptyDetector", [0,0,0]];
					_cond = "isTouchingGround player && {typeOf (vehicle player) == 'C_Heli_Light_01_civil_F'}";
					_onAct = "hint 'the helicopter is in this zone!';";
					_onDeact = "";
					_tempTrigger setTriggerStatements [_cond, _onAct, _onDeact];
					_tempTrigger triggerAttachVehicle [player];
					_tempTrigger setTriggerArea 
					[
						(getMarkerSize _tempMarker select 0), 
						(getMarkerSize _tempMarker select 1), 
						0, 
						true
					];
					_tempTrigger setTriggerActivation ["VEHICLE", "PRESENT", true];
					_tempTrigger setTriggerTimeout [1, 1, 1, true];
					_tempTrigger setTriggerStatements [_cond, _onAct, _onDeact];
					tagus_triggerList pushBack _tempTrigger;
				};
			}
		],
		"bis_fnc_spawn",
		(owner _x),
		true
	] call BIS_fnc_MP;
} forEach (call BIS_fnc_listPlayers);