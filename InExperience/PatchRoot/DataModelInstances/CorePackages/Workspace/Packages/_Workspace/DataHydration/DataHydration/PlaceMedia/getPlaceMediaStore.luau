local CreatePlaceMediaStoreModule = require(script.Parent.createPlaceMediaStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreatePlaceMediaStoreModule (copy)
	return CreatePlaceMediaStoreModule()
end)