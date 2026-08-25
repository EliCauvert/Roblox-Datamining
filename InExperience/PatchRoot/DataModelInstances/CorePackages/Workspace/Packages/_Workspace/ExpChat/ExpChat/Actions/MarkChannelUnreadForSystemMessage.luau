return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2)
	return { text = p0, channelNameOverride = p1, metadata = p2 }
end)