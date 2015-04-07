comment "Exported from Arsenal by Cpl.Helios";

comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform "LOP_U_AFR_Fatigue_02";
for "_i" from 1 to 5 do {player addItemToUniform "AGM_Bandage";};
for "_i" from 1 to 2 do {player addItemToUniform "AGM_Morphine";};
player addItemToUniform "hlc_45Rnd_545x39_t_rpk";
player addVest "V_PlateCarrier1_rgr";
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
player addItemToVest "rhs_mag_mk84";
for "_i" from 1 to 3 do {player addItemToVest "rhs_VOG25P";};
for "_i" from 1 to 3 do {player addItemToVest "rhs_VG40OP_white";};
for "_i" from 1 to 3 do {player addItemToVest "hlc_45Rnd_545x39_t_rpk";};
player addGoggles "rhs_balaclava";

comment "Add weapons";
player addWeapon "hlc_rifle_RPK12";


comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player addItemToUniform "ACRE_PRC148";
player linkItem "B_UavTerminal";

comment "Set identity";
player setFace "GreekHead_A3_08";
player setSpeaker "AGM_NoVoice";
