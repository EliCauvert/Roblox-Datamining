return require(script.Parent.Parent.ActionCreator)("AddGameStat", function(p1, p2, p3)
	return { statName = p1, isPrimary = p2, priority = p3 }
end)