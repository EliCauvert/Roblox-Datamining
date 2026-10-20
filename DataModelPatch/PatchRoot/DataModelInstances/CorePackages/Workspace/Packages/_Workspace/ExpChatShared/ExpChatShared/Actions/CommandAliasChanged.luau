return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(Name, PrimaryAlias, SecondaryAlias)
	return {
		name = Name,
		primaryAlias = PrimaryAlias,
		secondaryAlias = SecondaryAlias
	}
end)