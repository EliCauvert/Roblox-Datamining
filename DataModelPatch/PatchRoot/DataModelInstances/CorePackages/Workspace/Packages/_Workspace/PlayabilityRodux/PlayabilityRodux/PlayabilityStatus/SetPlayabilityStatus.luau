return require(script:FindFirstAncestor("PlayabilityRodux").Parent.Rodux).makeActionCreator(script.Name, function(PlayabilityStatus)
	assert(type(PlayabilityStatus) == "table", "SetPlayabilityStatus action expects playabilityStatus to be a table")
	
	return { playabilityStatus = PlayabilityStatus }
end)