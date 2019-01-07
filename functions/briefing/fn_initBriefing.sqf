private _newNotes = [];
/*
	Setting up new briefing pages with optionally changing contents:

	Add a new array to _newNotes for each page or changed default page

	_newNotes pushBack [name, [section 1 ... section N], subject]
		- subject and optional section array are optional
		- optional sections are represented by %N in the actual briefing file. Use this script to create conditional selection for picking out the correct variation
*/


_newNotes call ARTR_fnc_briefingFile;
