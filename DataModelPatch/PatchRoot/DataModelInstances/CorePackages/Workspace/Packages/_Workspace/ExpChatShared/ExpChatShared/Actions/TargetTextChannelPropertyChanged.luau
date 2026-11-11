return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(TextChannel, ShouldReorderTabs)
	return {
		textChannel = TextChannel,
		shouldReorderTabs = ShouldReorderTabs
	}
end)