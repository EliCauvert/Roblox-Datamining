return require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 5 ]]
	assert(type(p0) == "number", "Request count must be a number")
	
	return { payload = { count = p0 } }
end)