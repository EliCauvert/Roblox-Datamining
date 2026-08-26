return require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	assert(type(p1) == "number", "Request count must be a number")
	
	return { payload = { count = p1 } }
end)