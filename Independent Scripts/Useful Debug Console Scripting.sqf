 
/*
 *
 * Creates an arsenal ammo box next to the player when executed locally
 *
 */
 
   ArBox = createVehicle ["B_supplyCrate_F", position player, [], 0, ""];
   ["AmmoboxInit",[ArBox,true]] call BIS_fnc_arsenal; 
 
/*
 *
 * Teleport on Click (thanks to TAE)
 *
 */
 
   ["click", "onMapSingleClick", { player setPos _pos; }] call BIS_fnc_addStackedEventHandler;  
 
/*
 *
 * Heal yourself.
 *
 */
 
   player setDamage 0;
 
/*
 *
 * God Mode (can still sometimes take damage from explosions and other weird things)
 *
 */
 
   player allowDamage false;
 
/*
 *
 * Will spawn smoke at the player 
 *
 * Replace "SmokeShell" with the following for different smoke
 * SmokeShellGreen
 * SmokeShellOrange
 * SmokeShellPurple
 * SmokeShellYellow
 * SmokeShellRed
 * SmokeShellBlue
 *
 */
 
   _smoke = "SmokeShell" createVehicle position player; 
 
/*
 * The actual command will repair the vehicle or heal the player you are looking at
 * setting it to 1 will destroy or kill.
 * cursorTarget could be used in conjunction with other scripts such as setting individual markers,  setting god, or spawning smoke on a player.
 */
 
   cursorTarget setDamage 0;
 
/*
 *
 * Wakeup/Knockout person in front of you
 *
 */
   [cursorTarget, 20] call AGM_Medical_fnc_knockOut;
   [cursorTarget, 20] call AGM_Medical_fnc_wakeUp;
 
/*
 *
 * handcuff person
 *
 */
  [cursorTarget, true, true] call AGM_Interaction_fnc_setCaptive;
 
/*
 * 
 * Infinite ammo
 *
 */
   player addeventhandler ["fired", {(_this select 0) setvehicleammo 1}];
 
 /*
  *
  * Advance time by X amount of hours
  *
  */
 
   skipTime x;
 
/*
 *
 *	Fade out and In to black 
 *
 */
 
   cutText ["your text goes here","BLACK OUT"];
 
   cutText ["same here","BLACK IN"];