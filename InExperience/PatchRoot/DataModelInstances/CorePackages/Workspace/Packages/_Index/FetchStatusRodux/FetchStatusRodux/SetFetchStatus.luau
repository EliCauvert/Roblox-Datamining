return require(script:FindFirstAncestor("FetchStatusRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2)
	return { fetchNamespace = p0, fetchKey = p1, fetchStatus = p2 }
end)