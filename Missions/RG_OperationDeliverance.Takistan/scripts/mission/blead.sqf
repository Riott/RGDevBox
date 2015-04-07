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
player addVest "rhsusf_iotv_ucp_Squadleader";
for "_i" from 1 to 6 do {player addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
player addItemToVest "rhs_mag_mk84";
player addHeadgear "rhsusf_ach_helmet_headset_ess_ucp";
player addGoggles "G_Shades_Black";

comment "Add weapons";
player addWeapon "rhs_weap_m16a4_carryhandle_pmag";
player addPrimaryWeaponItem "rhsusf_acc_ACOG3";
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
