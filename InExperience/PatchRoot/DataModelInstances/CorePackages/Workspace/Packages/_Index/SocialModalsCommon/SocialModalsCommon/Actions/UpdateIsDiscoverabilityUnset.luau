return require(script:FindFirstAncestor("SocialModalsCommon").Parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 9 ]]
	assert(type(p0) == "table", string.format("UpdateIsDiscoverabilityUnset action expects params to be a table, was %s", type(p0)))
	
	return p0
end)