/*
Creates briefing files based on configuration in initBriefing.sqf - default briefing pages are added automatically if not specially defined for modular sections and included in function parameters.

Parameters:
	0: Briefing pages. ARRAY:
		0: Record name. STRING
		1: List of optional parameters to format the txt. (ARRAY)
		2: DiarySubject (defined elsewhere). (STRING - default: "Diary")
*/
private _addedPages = [];
private _defaultPages = [
	"Intel",
	"Mission",
	"Situation",
	"Background"
];

if (count _this > 0) then
{
	{
		_x params [
			["_name", "NoName", [""]],
			["_optionals", [], [[]]],
			["_subject","Diary",[""]]
		];

		_addedPages pushBackUnique _name;
		[_name,_optionals,_subject] call ARTR_fnc_briefingPage;
	} forEach _this;
};

{
	if !(_x in _addedPages) then
	{
		[_x] call ARTR_fnc_briefingPage;
	};
} forEach _defaultPages;
