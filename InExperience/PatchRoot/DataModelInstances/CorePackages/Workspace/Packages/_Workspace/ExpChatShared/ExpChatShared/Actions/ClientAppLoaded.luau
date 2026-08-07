return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 13 ]]
	return {
		team = p0.team,
		isChatCoreGuiEnabled = p0.isChatCoreGuiEnabled == nil or p0.isChatCoreGuiEnabled,
		isTouchEnabled = p0.isTouchEnabled,
		isGamepadEnabled = p0.isGamepadEnabled
	}
end)