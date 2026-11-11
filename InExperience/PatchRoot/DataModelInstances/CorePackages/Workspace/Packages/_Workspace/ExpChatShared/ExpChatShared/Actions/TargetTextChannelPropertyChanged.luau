return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(TextChannel, ShouldReorderTabs, IsUserInitiated)
	return {
		textChannel = TextChannel,
		shouldReorderTabs = ShouldReorderTabs,
		isUserInitiated = IsUserInitiated
	}
end)