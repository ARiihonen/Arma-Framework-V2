//init respawn tickets to 0 to avoid unlimited respawning
if (isServer) then {
	[missionNamespace, 1] call BIS_fnc_respawnTickets;
	[missionNamespace, -1] call BIS_fnc_respawnTickets;
};
