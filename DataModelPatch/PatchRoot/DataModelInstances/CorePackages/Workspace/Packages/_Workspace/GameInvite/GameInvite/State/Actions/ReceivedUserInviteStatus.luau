return require(script:FindFirstAncestor("GameInvite").Parent.Rodux).makeActionCreator(script.Name, function(p1, InviteStatus)
	return { userId = tostring(p1), inviteStatus = InviteStatus }
end)