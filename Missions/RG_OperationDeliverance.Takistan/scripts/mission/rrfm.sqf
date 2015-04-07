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
player addVest "V_PlateCarrier1_blk";
for "_i" from 1 to 6 do {player addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
player addItemToVest "rhs_mag_mk84";
player addGoggles "rhs_balaclava";

comment "Add weapons";
player addWeapon "rhs_weap_ak74m_2mag_camo";


comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player addItemToUniform "ACRE_PRC148";
player linkItem "B_UavTerminal";

comment "Set identity";
player setFace "GreekHead_A3_08";
player setSpeaker "AGM_NoVoice";
