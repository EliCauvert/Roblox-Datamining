return require(script.Parent.Parent.Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { universeId = p1, isEligible = p2 }
end)