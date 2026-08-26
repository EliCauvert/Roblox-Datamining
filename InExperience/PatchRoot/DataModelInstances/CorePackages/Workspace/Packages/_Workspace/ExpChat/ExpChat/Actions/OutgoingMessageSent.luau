return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { textChatMessage = p1, channelNameOverride = p2 }
end)