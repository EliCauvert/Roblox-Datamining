return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(MessageId, NewText) --[[ Line: 11 ]]
	return { messageId = MessageId, newText = NewText }
end)