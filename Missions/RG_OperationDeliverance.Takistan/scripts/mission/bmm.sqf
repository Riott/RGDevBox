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
player forceAddUniform "rhs_uniform_cu_ucp_patchless";
for "_i" from 1 to 3 do {player addItemToUniform "AGM_Bandage";};
for "_i" from 1 to 2 do {player addItemToUniform "AGM_Morphine";};
for "_i" from 1 to 2 do {player addItemToUniform "9Rnd_45ACP_Mag";};
player addItemToUniform "AGM_CableTie";
for "_i" from 1 to 2 do {player addItemToUniform "hlc_20Rnd_762x51_B_M14";};
player addVest "rhsusf_iotv_ucp";
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addItemToVest "rhs_mag_mk84";
player addHeadgear "rhs_Booniehat_ucp";
player addGoggles "G_Shades_Black";

comment "Add weapons";
player addWeapon "hlc_rifle_M21";
player addPrimaryWeaponItem "hlc_optic_artel_m14";
player addWeapon "hgun_ACPC2_F";


comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player addItemToUniform "ACRE_PRC343";
player linkItem "ItemGPS";

comment "Set identity";
player setFace "GreekHead_A3_01";
player setSpeaker "Male08ENG";
