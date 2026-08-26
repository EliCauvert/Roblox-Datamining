return require(script:FindFirstAncestor("PlayabilityRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	assert(type(p1) == "table", "SetPlayabilityStatus action expects playabilityStatus to be a table")
	
	return { playabilityStatus = p1 }
end)