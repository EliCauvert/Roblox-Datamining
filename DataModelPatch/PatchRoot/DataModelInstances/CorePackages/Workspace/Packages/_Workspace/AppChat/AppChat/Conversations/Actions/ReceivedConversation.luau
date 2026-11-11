return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(Conversation)
	return { conversation = Conversation }
end)