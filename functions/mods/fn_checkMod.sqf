/*
This function returns a boolean after checking whether a function exists
Arguments:
	0: cfg file name. STRING.

Return: BOOL
*/
params [
	[ "_cfgName", "", [""]],
	[ "_listName", "", [""]]
];

private _return = false;
if ( isClass (configfile >> "CfgPatches" >> _cfgName) || ( isClass (configfile >> "CfgMods" >> _cfgName) ) ) then
{
	_return = true;

	private _pushBackName = [_listName,_cfgName] select (_listName isEqualTo "");
	ARTR_activeMods pushBackUnique _pushBackName;

	diag_log format ["PUSHBACK NAME: %1", _pushBackName];
};

_return;
