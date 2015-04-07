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
player addItemToUniform "AGM_CableTie";
for "_i" from 1 to 2 do {player addItemToUniform "AGM_Morphine";};
for "_i" from 1 to 4 do {player addItemToUniform "AGM_Bandage";};
for "_i" from 1 to 2 do {player addItemToUniform "9Rnd_45ACP_Mag";};
player addVest "rhsusf_iotv_ucp_Grenadier";
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
player addItemToVest "rhs_mag_mk84";
for "_i" from 1 to 5 do {player addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
player addItemToVest "rhs_mag_M441_HE";
player addBackpack "rhsusf_assault_eagleaiii_ucp";
for "_i" from 1 to 4 do {player addItemToBackpack "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
for "_i" from 1 to 2 do {player addItemToBackpack "rhs_mag_M441_HE";};
for "_i" from 1 to 4 do {player addItemToBackpack "rhs_mag_m4009";};
for "_i" from 1 to 3 do {player addItemToBackpack "1Rnd_Smoke_Grenade_shell";};
player addHeadgear "rhsusf_ach_helmet_ESS_ucp";
player addGoggles "G_Shades_Black";

comment "Add weapons";
player addWeapon "rhs_m4_m320";
player addPrimaryWeaponItem "rhsusf_acc_compm4";
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
