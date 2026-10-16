return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(UseTranslation, MessageId) --[[ Line: 10 ]]
	return { useTranslation = UseTranslation, messageId = MessageId }
end)