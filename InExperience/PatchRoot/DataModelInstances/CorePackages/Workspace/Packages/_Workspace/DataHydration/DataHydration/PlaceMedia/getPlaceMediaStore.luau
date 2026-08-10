local createPlaceMediaStoreModule = require(script.Parent.createPlaceMediaStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 8 ]]
	-- upvalues: createPlaceMediaStoreModule (ref)
	return createPlaceMediaStoreModule()
end)