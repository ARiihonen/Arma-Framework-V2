/*
Creates a diary record page with optional variables to dynamically modify the briefing texts to conform to changing mission parameters.

Parameters:
	0: Record name. STRING
	1: List of optional parameters to format the txt. ARRAY
	2: DiarySubject (defined elsewhere). STRING
*/

params [
	["_name", "NoName", [""]],
	["_optionals", [], [[]]],
	["_subject","Diary",[""]]
];

private _filePath = "files\briefing\" + _name + ".txt";

private _formatParams = "[LoadFile _filePath";
{
	_formatParams = format ['%1, "%2"', _formatParams, _x];
} forEach _optionals;
_formatParams = _formatParams + "]";

if (!(player diarySubjectExists _subject)) then
{
	player createDiarySubject [_subject, _subject];
};
player createDiaryRecord [_subject, [_name, format (call compile _formatParams)]];
