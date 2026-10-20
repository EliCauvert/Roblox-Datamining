return require(script:FindFirstAncestor("FriendsRodux").Parent.Rodux).makeActionCreator(script.Name, function(Ids)
	return { ids = Ids }
end)