return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { channelName = p0, tabIndex = p1 }
end)