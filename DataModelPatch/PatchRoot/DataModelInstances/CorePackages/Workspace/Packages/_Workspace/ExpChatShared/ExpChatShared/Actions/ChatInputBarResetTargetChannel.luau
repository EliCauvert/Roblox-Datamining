return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(IsGlobalTabActive)
	return { isGlobalTabActive = IsGlobalTabActive }
end)