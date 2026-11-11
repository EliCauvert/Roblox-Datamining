return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(MessageData)
	return { messageData = MessageData }
end)