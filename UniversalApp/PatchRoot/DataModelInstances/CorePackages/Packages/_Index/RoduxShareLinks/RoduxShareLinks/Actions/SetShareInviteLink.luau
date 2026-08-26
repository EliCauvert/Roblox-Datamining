return require(script:FindFirstAncestor("RoduxShareLinks").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { shareInviteLink = p1 }
end)