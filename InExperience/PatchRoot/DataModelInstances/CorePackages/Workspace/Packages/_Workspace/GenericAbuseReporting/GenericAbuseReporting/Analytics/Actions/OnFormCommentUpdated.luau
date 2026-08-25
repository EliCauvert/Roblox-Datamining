return require(script:FindFirstAncestor("GenericAbuseReporting").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { comment_added = p0.comment_added }
end)