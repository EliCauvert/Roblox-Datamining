return require(script:FindFirstAncestor("GameInvite").Parent.Rodux).makeActionCreator(script.Name, function(p1, InviteStatus) --[[ Line: 6 ]]
	return { userId = tostring(p1), inviteStatus = InviteStatus }
end)