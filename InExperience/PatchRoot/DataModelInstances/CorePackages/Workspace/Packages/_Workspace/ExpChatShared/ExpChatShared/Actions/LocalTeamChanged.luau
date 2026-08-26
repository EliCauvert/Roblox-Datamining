return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { team = p1 }
end)