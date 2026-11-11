local CreatePlaceVersionHistoryStoreModule = require(script.Parent.createPlaceVersionHistoryStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreatePlaceVersionHistoryStoreModule (copy)
	return CreatePlaceVersionHistoryStoreModule()
end)