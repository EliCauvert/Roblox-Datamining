return require(script.Parent.Parent.Action)("SetActiveTab", function(p1, p2)
	return { newTabIndex = p1, isClientView = p2 }
end)