return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(TextChannel)
	return { textChannel = TextChannel }
end)