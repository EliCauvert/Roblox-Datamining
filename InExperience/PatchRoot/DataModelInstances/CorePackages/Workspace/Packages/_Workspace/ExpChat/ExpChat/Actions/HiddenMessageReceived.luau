return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(UserMessageIntent)
	return { userMessageIntent = UserMessageIntent }
end)