return require(script:FindFirstAncestor("GenericAbuseReporting").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { comment_added = p1.comment_added }
end)