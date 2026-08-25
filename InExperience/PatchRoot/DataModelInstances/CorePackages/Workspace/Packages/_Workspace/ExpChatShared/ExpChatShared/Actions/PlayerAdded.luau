return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2, p3)
	return {
		userId = tostring(p0),
		username = p1,
		displayName = p2,
		hasVerifiedBadge = p3
	}
end)