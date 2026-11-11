return require(script:FindFirstAncestor("Http").Parent.Rodux).makeActionCreator(script.Name, function(FetchingStatuses, p1)
	return {
		fetchingStatuses = FetchingStatuses,
		shouldImmediatelyDispatch = p1 or false
	}
end)