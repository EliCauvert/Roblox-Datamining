return require(script:FindFirstAncestor("FetchStatusRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return { fetchNamespace = p1, fetchKey = p2, fetchStatus = p3 }
end)