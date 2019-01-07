//this runs post-init. Construct cool gear stuff here

/*
Gear config setup:
	side/faction, [item,quantity (or item type to replace),condition]
*/

ARTR_gearSides = [];
ARTR_gearFactions = [];
ARTR_gearGeneral = [];


//Medical gear (with ACE stuff)
private _vanillaMedicalGear = [
	["FirstAidKit", [2,0,0,0], {side _this != civilian}],
	["FirstAidKit", [0,0,10,0], ["medic", "I_C_Soldier_Para_3_F"]],
	["MediKit", [0,0,1,0], ["medic", "I_C_Soldier_Para_3_F"]]
];

private _ACEBasicMedicalGear = [
	["ACE_fieldDressing", [6,0,0,0], {side _this != civilian}],
	["ACE_epinephrine", [2,0,0,0], {side _this != civilian}],
	["ACE_morphine", [2,0,0,0], {side _this != civilian}],
	["ACE_fieldDressing", [0,0,25,0], ["medic", "I_C_Soldier_Para_3_F"]],
	["ACE_epinephrine", [0,0,10,0], ["medic", "I_C_Soldier_Para_3_F"]],
	["ACE_morphine", [0,0,10,0], ["medic", "I_C_Soldier_Para_3_F"]],
	["ACE_bloodIV_500", [0,0,8,0], ["medic", "I_C_Soldier_Para_3_F"]]
];

private _ACEAdvancedMedicalGear = [
	["ACE_fieldDressing", [6,0,0,0], {side _this != civilian}],
	["ACE_packingBandage", [6,0,0,0], {side _this != civilian}],
	["ACE_epinephrine", [2,0,0,0], {side _this != civilian}],
	["ACE_morphine", [2,0,0,0], {side _this != civilian}],
	["ACE_tourniquet", [2,0,0,0], {side _this != civilian}],
	["ACE_fieldDressing", [0,0,15,0], ["medic", "I_C_Soldier_Para_3_F"]],
	["ACE_packingBandage", [0,0,15,0], ["medic", "I_C_Soldier_Para_3_F"]],
	["ACE_elasticBandage", [0,0,15,0], ["medic", "I_C_Soldier_Para_3_F"]],
	["ACE_quikclot", [0,0,15,0], ["medic", "I_C_Soldier_Para_3_F"]],
	["ACE_epinephrine", [0,0,10,0], ["medic", "I_C_Soldier_Para_3_F"]],
	["ACE_morphine", [0,0,10,0], ["medic", "I_C_Soldier_Para_3_F"]],
	["ACE_atropine", [0,0,10,0], ["medic", "I_C_Soldier_Para_3_F"]],
	["ACE_tourniquet", [0,0,5,0], ["medic", "I_C_Soldier_Para_3_F"]],
	["ACE_bloodIV_500", [0,0,8,0], ["medic", "I_C_Soldier_Para_3_F"]]
];

if ("ace_medical" in ARTR_activeMods) then
{
	ARTR_gearGeneral append ( [_ACEBasicMedicalGear,_ACEAdvancedMedicalGear] select (missionNamespace getVariable ["ace_medical_level",0] == 2) );
} else {
	ARTR_gearGeneral append _vanillaMedicalGear;
};

//Random ACE gear
if ("ace_microdagr" in ARTR_activeMods) then
{
	ARTR_gearGeneral pushBack ["ACE_Microdagr","ItemGPS"];
};
if ("ace_vector" in ARTR_activeMods) then
{
	ARTR_gearGeneral pushBack ["ACE_Vector","Rangefinder"];
};
if ("ace_maptools" in ARTR_activeMods) then
{
	ARTR_gearGeneral pushBack ["ACE_MapTools"];
};
if (missionNamespace getVariable ["ace_hearing_enableCombatDeafness",false]) then
{
	ARTR_gearGeneral pushBack ["ACE_EarPlugs"];
};
if ("ace_rangecard" in ARTR_activeMods) then
{
	ARTR_gearGeneral pushBack ["ACE_RangeCard",[1,0,0,0],["sniper","ghillie","spotter","Sharpshooter"]];
};
if ("ace_kestrel4500" in ARTR_activeMods) then
{
	ARTR_gearGeneral pushBack ["ACE_Kestrel4500",[1,0,0,0],["sniper","ghillie","spotter","Sharpshooter"]];
};
if ("ace_dagr" in ARTR_activeMods) then
{
	ARTR_gearGeneral pushBack ["ACE_DAGR",[1,0,0,0],["sniper","ghillie","spotter","Sharpshooter"]];
};
if ("ace_atragmx" in ARTR_activeMods) then
{
	ARTR_gearGeneral pushBack ["ACE_ATragMX",[1,0,0,0],["sniper","ghillie","spotter","Sharpshooter"]];
};
