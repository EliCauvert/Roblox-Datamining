local createPlaceMediaStoreModule = require(script.Parent.createPlaceMediaStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createPlaceMediaStoreModule (ref)
	return createPlaceMediaStoreModule()
end)