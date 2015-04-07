if(hasInterface) then {
private ["_playerRespawn"];

if (isNil "b1") then {b1= objNull};
if (isNil "b2") then {b2= objNull};
if (isNil "b3") then {b3= objNull};
if (isNil "b4") then {b4= objNull};
if (isNil "b5") then {b5= objNull};
if (isNil "b6") then {b6= objNull};
if (isNil "b7") then {b7= objNull};
if (isNil "b8") then {b8= objNull};
if (isNil "b9") then {b9= objNull};
if (isNil "b10") then {b10= objNull};
if (isNil "b11") then {b11= objNull};
if (isNil "b12") then {b12= objNull};
if (isNil "b13") then {b13= objNull};
if (isNil "b14") then {b14= objNull};
if (isNil "b15") then {b15= objNull};
if (isNil "b16") then {b16= objNull};
if (isNil "b17") then {b17= objNull};
if (isNil "b18") then {b18= objNull};
if (isNil "b19") then {b19= objNull};
if (isNil "b20") then {b20= objNull};
if (isNil "b21") then {b21= objNull};
if (isNil "b22") then {b22= objNull};
if (isNil "r1") then {r1= objNull};
if (isNil "r2") then {r2= objNull};
if (isNil "r3") then {r3= objNull};
if (isNil "r4") then {r4= objNull};
if (isNil "r5") then {r5= objNull};
if (isNil "r6") then {r6= objNull};
if (isNil "r7") then {r7= objNull};
if (isNil "r8") then {r8= objNull};
if (isNil "r9") then {r9= objNull};
if (isNil "r10") then {r10= objNull};
if (isNil "r11") then {r11= objNull};
if (isNil "r12") then {r12= objNull};
if (isNil "r13") then {r13= objNull};
if (isNil "r14") then {r14= objNull};
if (isNil "r15") then {r15= objNull};
if (isNil "r16") then {r16= objNull};
if (isNil "r17") then {r17= objNull};
if (isNil "r18") then {r18= objNull};
if (isNil "r19") then {r19= objNull};
if (isNil "r20") then {r20= objNull};
if (isNil "r21") then {r21= objNull};
if (isNil "r22") then {r22= objNull};



if ((local b1) || (local b3) || (local b7) || (local b11) || (local b13) || (local b15))  then 
	{

			[] execVM "scripts\mission\blead.sqf";
	}; 
	
if (local b2)  then 
	{

			[] execVM "scripts\mission\bmed.sqf";
	};
	
if ((local b6) || (local b8) || (local b9) || (local b17) || (local b19) || (local b20) || (local b21))  then 
	{

			[] execVM "scripts\mission\brfm.sqf";
	};
	
if ((local b12) || (local b14))  then 
	{

			[] execVM "scripts\mission\bmm.sqf";
	};
	
if ((local b4) || (local b16) || (local b21))  then 
	{

			[] execVM "scripts\mission\bgnd.sqf";
	};

if ((local b5) || (local b10) || (local b18))  then 
	{

			[] execVM "scripts\mission\baur.sqf";
	};
	
if ((local r1) || (local r2) || (local r3) || (local r9) || (local r17))  then 
	{

			[] execVM "scripts\mission\rlead.sqf";
	}; 
	
if ((local r4) || (local r5) || (local r6) || (local r10) || (local r11) || (local r12) || (local r18) || (local r19) || (local r20) || (local r21))  then 
	{

			[] execVM "scripts\mission\rrfm.sqf";
	}; 

if ((local r8) || (local r14) || (local r22))  then 
	{

			[] execVM "scripts\mission\raur.sqf";
	}; 

if ((local r7) || (local r13))  then 
	{

			[] execVM "scripts\mission\rgnd.sqf";
	}; 

if (local r16)  then 
	{

			[] execVM "scripts\mission\rmm.sqf";
	}; 
};