return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { textChatMessage = p0, channelNameOverride = p1 }
end)