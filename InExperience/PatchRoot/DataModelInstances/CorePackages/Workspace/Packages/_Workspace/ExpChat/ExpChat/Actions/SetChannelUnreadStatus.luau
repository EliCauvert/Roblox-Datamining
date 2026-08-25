return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { channelName = p0, hasUnreadMessages = p1 }
end)