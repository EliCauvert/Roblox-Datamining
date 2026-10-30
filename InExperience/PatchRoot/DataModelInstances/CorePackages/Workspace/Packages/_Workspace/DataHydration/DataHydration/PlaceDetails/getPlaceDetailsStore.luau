local CreatePlaceDetailsStoreModule = require(script.Parent.createPlaceDetailsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreatePlaceDetailsStoreModule (copy)
	return CreatePlaceDetailsStoreModule()
end)