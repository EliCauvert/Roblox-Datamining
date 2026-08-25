return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { endTimestamp = p0, isEnforced = p1 }
end)