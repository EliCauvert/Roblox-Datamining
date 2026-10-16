local CreatePlaceVersionHistoryStoreModule = require(script.Parent.createPlaceVersionHistoryStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreatePlaceVersionHistoryStoreModule (copy)
	return CreatePlaceVersionHistoryStoreModule()
end)