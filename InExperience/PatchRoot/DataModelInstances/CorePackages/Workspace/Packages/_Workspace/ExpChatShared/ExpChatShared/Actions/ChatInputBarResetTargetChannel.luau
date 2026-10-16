return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(IsGlobalTabActive) --[[ Line: 10 ]]
	return { isGlobalTabActive = IsGlobalTabActive }
end)