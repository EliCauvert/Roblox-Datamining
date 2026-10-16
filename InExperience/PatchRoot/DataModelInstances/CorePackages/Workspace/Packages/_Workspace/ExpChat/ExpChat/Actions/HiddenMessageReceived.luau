return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(UserMessageIntent) --[[ Line: 12 ]]
	return { userMessageIntent = UserMessageIntent }
end)