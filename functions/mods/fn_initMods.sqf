//Check a bunch of default mods so don't have to make custom checks for all of them every time they come up
ARTR_activeMods = [];

private _defaultMods = [
	["ace_medical"],
	["ace_microdagr"],
	["ace_vector"],
	["ace_maptools"],
	["ace_atragmx"],
	["ace_kestrel4500", "ace_kestrel"],
	["ace_dagr"],
	["ace_rangecard"],
	["task_force_radio","TFR"],
	["Expansion","DLC_Apex"],
	["Heli","DLC_Helicopters"],
	["Mark","DLC_Marksmen"],
	["Jets","DLC_Jets"],
	["Tank","DLC_Tanks"],
	["Tacops","DLC_Tacops"],
	["Orange","DLC_Orange"],
	["Kart","DLC_Karts"]
];

{
	_x call ARTR_fnc_checkMod;
} forEach _defaultMods;
