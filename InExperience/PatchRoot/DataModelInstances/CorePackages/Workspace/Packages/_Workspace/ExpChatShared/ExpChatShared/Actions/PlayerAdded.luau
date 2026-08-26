return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3, p4)
	return {
		userId = tostring(p1),
		username = p2,
		displayName = p3,
		hasVerifiedBadge = p4
	}
end)