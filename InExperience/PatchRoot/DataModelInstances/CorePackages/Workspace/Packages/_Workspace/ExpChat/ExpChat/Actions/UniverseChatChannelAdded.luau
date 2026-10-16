return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(ChannelName, TabIndex) --[[ Line: 10 ]]
	return { channelName = ChannelName, tabIndex = TabIndex }
end)