return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(p1, Character) --[[ Line: 11 ]]
	return { userId = tostring(p1), character = Character }
end)