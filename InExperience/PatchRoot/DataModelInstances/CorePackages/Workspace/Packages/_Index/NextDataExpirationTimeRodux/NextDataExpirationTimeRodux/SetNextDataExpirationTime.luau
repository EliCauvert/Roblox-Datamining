return require(script:FindFirstAncestor("NextDataExpirationTimeRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2)
	assert(type(p0) == "string", "SetNextDataExpirationTime: key must be a string!")
	assert(type(p1) == "number" and p1 > 0, "SetNextDataExpirationTime: nextDataExpirationTime must be a positive number!")
	
	return { key = p0, nextDataExpirationTime = p1, namespace = p2 }
end)