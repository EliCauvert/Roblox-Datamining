return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(p1, Username, DisplayName, HasVerifiedBadge)
	return {
		userId = tostring(p1),
		username = Username,
		displayName = DisplayName,
		hasVerifiedBadge = HasVerifiedBadge
	}
end)