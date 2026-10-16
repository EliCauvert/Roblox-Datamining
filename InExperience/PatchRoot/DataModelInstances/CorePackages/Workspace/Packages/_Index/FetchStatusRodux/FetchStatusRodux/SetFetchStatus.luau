return require(script:FindFirstAncestor("FetchStatusRodux").Parent.Rodux).makeActionCreator(script.Name, function(FetchNamespace, FetchKey, FetchStatus) --[[ Line: 6 ]]
	return {
		fetchNamespace = FetchNamespace,
		fetchKey = FetchKey,
		fetchStatus = FetchStatus
	}
end)