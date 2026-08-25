return require(script:FindFirstAncestor("PlayabilityRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	assert(type(p0) == "table", "SetPlayabilityStatus action expects playabilityStatus to be a table")
	
	return { playabilityStatus = p0 }
end)