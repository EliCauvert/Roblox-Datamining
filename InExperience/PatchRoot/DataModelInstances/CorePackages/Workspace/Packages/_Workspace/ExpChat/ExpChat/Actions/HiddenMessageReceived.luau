return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { userMessageIntent = p1 }
end)