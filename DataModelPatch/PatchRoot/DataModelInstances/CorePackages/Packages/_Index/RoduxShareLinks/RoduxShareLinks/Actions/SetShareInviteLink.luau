return require(script:FindFirstAncestor("RoduxShareLinks").Parent.Rodux).makeActionCreator(script.Name, function(ShareInviteLink)
	return { shareInviteLink = ShareInviteLink }
end)