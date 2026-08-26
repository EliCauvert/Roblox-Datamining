return require(script:FindFirstAncestor("NextDataExpirationTimeRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	assert(type(p1) == "string", "SetNextDataExpirationTime: key must be a string!")
	assert(type(p2) == "number" and p2 > 0, "SetNextDataExpirationTime: nextDataExpirationTime must be a positive number!")
	
	return { key = p1, nextDataExpirationTime = p2, namespace = p3 }
end)