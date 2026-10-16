return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(MessageData) --[[ Line: 10 ]]
	return { messageData = MessageData }
end)