return require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Rodux).makeActionCreator(script.Name, function(Status)
	assert(type(Status) == "string", string.format("SetHomePageDataStatus action expects status to be an string, was %s", (type(Status))))
	
	return { status = Status }
end)