return require(script.Parent.Parent.ActionCreator)("AddGameStat", function(StatName, IsPrimary, Priority) --[[ Line: 4 ]]
	return {
		statName = StatName,
		isPrimary = IsPrimary,
		priority = Priority
	}
end)