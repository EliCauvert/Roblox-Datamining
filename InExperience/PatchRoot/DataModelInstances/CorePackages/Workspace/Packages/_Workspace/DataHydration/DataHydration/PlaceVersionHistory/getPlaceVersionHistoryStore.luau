local createPlaceVersionHistoryStoreModule = require(script.Parent.createPlaceVersionHistoryStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 9 ]]
	-- upvalues: createPlaceVersionHistoryStoreModule (ref)
	return createPlaceVersionHistoryStoreModule()
end)