return require(script.Parent.Parent.ActionCreator)("SetGameStatText", function(p1, p2)
	return { statName = p1, text = p2 }
end)