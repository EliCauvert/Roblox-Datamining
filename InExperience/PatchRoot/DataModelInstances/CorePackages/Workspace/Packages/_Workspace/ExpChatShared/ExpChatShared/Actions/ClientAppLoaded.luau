return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return {
		team = p1.team,
		isChatCoreGuiEnabled = p1.isChatCoreGuiEnabled == nil or p1.isChatCoreGuiEnabled,
		isTouchEnabled = p1.isTouchEnabled,
		isGamepadEnabled = p1.isGamepadEnabled
	}
end)