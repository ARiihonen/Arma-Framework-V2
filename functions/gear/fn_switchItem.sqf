params [
	["_itemSetup",[],[[]]],
	["_unit",player,[objNull]]
];

_itemSetup params [
	["_item","",[""]],
	["_quantity",[1,0,0,0],[[],""]],
	["_condition",true,[true,{},"",[]]]
];

switch (typeName _condition) do
{
	case "STRING": { _condition = ((typeOf _unit) find _condition >= 0) };
	case "CODE": { _condition = (_unit call _condition) };
	case "ARRAY": { _condition = ( _condition findIf { (typeOf _unit) find _x >= 0} ) >= 0 };
};

if _condition then
{
	if (typeName _quantity == "STRING") then
	{
		private _replace = _quantity;

		private _countUniform = 0;
		private _countVest = 0;
		private _countBackpack = 0;
		private _countLinked = 0;

		while {  { _x == _replace } count uniformItems _unit > 0 } do
		{
			_countUniform = _countUniform + 1;
			_unit removeItemFromUniform _replace;
		};

		while {  { _x == _replace } count vestItems _unit > 0 } do
		{
			_countVest = _countVest + 1;
			_unit removeItemFromVest _replace;
		};

		while {  { _x == _replace } count uniformItems _unit > 0 } do
		{
			_countBackpack = _countBackpack + 1;
			_unit removeItemFromBackpack _replace;
		};

		if (_replace in assignedItems _unit) then { _countLinked = 1; _unit unLinkItem _replace; };

		_quantity = [_countUniform, _countVest, _countBackpack, _countLinked];
	};

	_quantity params [
		["_nUniform",0,[0]],
		["_nVest",0,[0]],
		["_nPack",0,[0]],
		["_nLink",0,[0]]
	];

	while { {_x == _item} count uniformItems _unit < _nUniform && _unit canAddItemToUniform _item } do
	{
		_unit addItemToUniform _item;
	};

	while { {_x == _item} count vestItems _unit < _nVest && _unit canAddItemToVest _item } do
	{
		_unit addItemToVest _item;
	};

	while { {_x == _item} count backpackItems _unit < _nPack && _unit canAddItemToBackpack _item } do
	{
		_unit addItemToBackpack _item;
	};

	if (_nLink>0) then
	{
		_unit linkItem _item;
		if !(_item in assignedItems _unit) then
		{
			if (_unit canAddItemToUniform _item) then
			{
				_unit addItemToUniform _item;
			} else {
				_unit addItemToVest _item;
			};
		};
	};
};
