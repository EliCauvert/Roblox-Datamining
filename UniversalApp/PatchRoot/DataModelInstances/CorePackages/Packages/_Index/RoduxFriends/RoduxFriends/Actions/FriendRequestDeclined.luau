return require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { ids = p1 }
end)