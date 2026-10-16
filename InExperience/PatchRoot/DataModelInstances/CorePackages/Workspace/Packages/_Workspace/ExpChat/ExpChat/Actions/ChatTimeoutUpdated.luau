return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(EndTimestamp, IsEnforced) --[[ Line: 10 ]]
	return { endTimestamp = EndTimestamp, isEnforced = IsEnforced }
end)