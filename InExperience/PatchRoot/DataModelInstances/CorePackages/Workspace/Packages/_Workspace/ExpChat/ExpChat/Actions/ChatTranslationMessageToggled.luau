return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(UseTranslation, MessageId)
	return { useTranslation = UseTranslation, messageId = MessageId }
end)