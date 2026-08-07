return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1) --[[ line: 6 ]]
	return { conversationId = p0, fetchingOlderMessages = p1 }
end)