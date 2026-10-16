return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(TextChannel, ShouldReorderTabs) --[[ Line: 11 ]]
	return {
		textChannel = TextChannel,
		shouldReorderTabs = ShouldReorderTabs
	}
end)