return require(script:FindFirstAncestor("GenericAbuseReporting").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return {
		context = p0.context,
		place_id = p0.place_id,
		accumulated_time_ms = p0.accumulated_time_ms
	}
end)