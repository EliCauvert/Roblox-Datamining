return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return { text = p1, channelNameOverride = p2, metadata = p3 }
end)