return require(script:FindFirstAncestor("GenericAbuseReporting").Parent.Rodux).makeActionCreator(script.Name, function(p1) --[[ Line: 15 ]]
	return {
		context = p1.context,
		place_id = p1.place_id,
		accumulated_time_ms = p1.accumulated_time_ms
	}
end)