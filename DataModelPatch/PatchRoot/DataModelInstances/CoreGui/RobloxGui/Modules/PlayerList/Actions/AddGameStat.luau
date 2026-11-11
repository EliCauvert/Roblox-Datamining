return require(script.Parent.Parent.ActionCreator)("AddGameStat", function(StatName, IsPrimary, Priority)
	return {
		statName = StatName,
		isPrimary = IsPrimary,
		priority = Priority
	}
end)