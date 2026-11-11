return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(TextChannel)
	return { textChannel = TextChannel }
end)