return require(script:FindFirstAncestor("GenericAbuseReporting").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { reason_selection = p1.reason_selection }
end)