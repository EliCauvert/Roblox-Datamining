return require(script:FindFirstAncestor("RoduxShareLinks").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { shareInviteLink = p0 }
end)