return require(script:FindFirstAncestor("Http").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1) --[[ line: 11 ]]
	return {
		fetchingStatuses = p0,
		shouldImmediatelyDispatch = p1 or false
	}
end)