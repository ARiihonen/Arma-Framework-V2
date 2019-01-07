params [
	["_unit",player,[objNull]]
];

private _gearList = [];

private _sideIndex = ARTR_gearSides findIf { _x select 0 == side _unit };
if (_sideIndex >= 0 ) then { _gearList append (_sideIndex select 1); };

private _factionIndex = ARTR_gearFactions findIf { _x select 0 == faction _unit };
if (_factionIndex >= 0) then { _gearList append (_factionIndex select 1); };

if (count ARTR_gearGeneral >= 0) then { _gearList append ARTR_gearGeneral; };

if (count _gearList > 0) then
{
	{
		[_x,_unit] call ARTR_fnc_switchItem;
	} forEach _gearList;
};
