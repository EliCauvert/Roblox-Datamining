return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { endTimestamp = p1, isEnforced = p2 }
end)