return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(MessageId, NewText)
	return { messageId = MessageId, newText = NewText }
end)