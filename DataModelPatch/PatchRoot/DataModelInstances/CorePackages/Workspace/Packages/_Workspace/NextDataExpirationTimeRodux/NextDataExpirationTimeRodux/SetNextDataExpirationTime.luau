return require(script:FindFirstAncestor("NextDataExpirationTimeRodux").Parent.Rodux).makeActionCreator(script.Name, function(Key, NextDataExpirationTime: number, Namespace)
	assert(type(Key) == "string", "SetNextDataExpirationTime: key must be a string!")
	assert(type(NextDataExpirationTime) == "number" and NextDataExpirationTime > 0, "SetNextDataExpirationTime: nextDataExpirationTime must be a positive number!")
	
	return {
		key = Key,
		nextDataExpirationTime = NextDataExpirationTime,
		namespace = Namespace
	}
end)