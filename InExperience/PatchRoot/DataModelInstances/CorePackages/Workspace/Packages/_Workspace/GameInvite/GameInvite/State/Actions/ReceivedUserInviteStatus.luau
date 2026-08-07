return require(script:FindFirstAncestor("GameInvite").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1) --[[ line: 6 ]]
	return { userId = tostring(p0), inviteStatus = p1 }
end)