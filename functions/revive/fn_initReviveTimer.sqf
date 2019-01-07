#define MINDISTANCE 10
#define TIMEOUT 20

if (hasInterface) then
{
	private _conditionString = format ["lifeState player == 'INCAPACITATED' && ( allPlayers findIf { (lifeState _x == 'HEALTHY' || lifeState _x == 'INJURED') && _x distance player <= %1 } == -1 )", MINDISTANCE];

	_killTrigger = [
		_conditionString,
		"player setDamage 1",
		[TIMEOUT,TIMEOUT,TIMEOUT,true]
	] call ARTR_fnc_emptyTrigger;

};
