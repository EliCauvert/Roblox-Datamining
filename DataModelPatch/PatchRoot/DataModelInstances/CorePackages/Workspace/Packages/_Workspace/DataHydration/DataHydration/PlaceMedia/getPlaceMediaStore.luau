local CreatePlaceMediaStoreModule = require(script.Parent.createPlaceMediaStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreatePlaceMediaStoreModule (copy)
	return CreatePlaceMediaStoreModule()
end)