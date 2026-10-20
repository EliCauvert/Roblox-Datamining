return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(EndTimestamp, IsEnforced)
	return { endTimestamp = EndTimestamp, isEnforced = IsEnforced }
end)