/*
Creates a local arealess trigger for checking various condition changes

Params:
	0: trigger condition - STRING.
	1: trigger exec - STRING.
	2: trigger timeout - ARRAY

Return:
	0: trigger - OBJECT
*/
params [
	[ "_condition", "", [""]],
	[ "_exec", "", [""]],
	[ "_timeout", [0,0,0,false], [[]]]
];

_newTrigger = createTrigger ["EmptyDetector", [0,0,0], false];
_newTrigger setTriggerActivation ["NONE", "PRESENT", false];
_newTrigger setTriggerStatements [
	_condition,
	_exec,
	""
];
_newTrigger setTriggerTimeout _timeout;

_newTrigger;
