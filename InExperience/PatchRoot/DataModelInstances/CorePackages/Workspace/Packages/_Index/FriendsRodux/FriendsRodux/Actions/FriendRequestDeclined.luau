return require(script:FindFirstAncestor("FriendsRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { ids = p1 }
end)