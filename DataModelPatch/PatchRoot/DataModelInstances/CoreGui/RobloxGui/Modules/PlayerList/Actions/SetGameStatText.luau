return require(script.Parent.Parent.ActionCreator)("SetGameStatText", function(StatName, Text)
	return { statName = StatName, text = Text }
end)