return require(script:FindFirstAncestor("Http").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return {
		fetchingStatuses = p1,
		shouldImmediatelyDispatch = p2 or false
	}
end)