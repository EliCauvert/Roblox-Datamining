local createPlaceVersionHistoryStoreModule = require(script.Parent.createPlaceVersionHistoryStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 8 ]]
	-- upvalues: createPlaceVersionHistoryStoreModule (ref)
	return createPlaceVersionHistoryStoreModule()
end)