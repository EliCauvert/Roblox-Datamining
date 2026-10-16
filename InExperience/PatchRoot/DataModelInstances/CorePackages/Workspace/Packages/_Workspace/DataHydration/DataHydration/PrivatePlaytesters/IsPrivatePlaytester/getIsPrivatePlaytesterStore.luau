local CreateIsPrivatePlaytesterStoreModule = require(script.Parent.createIsPrivatePlaytesterStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateIsPrivatePlaytesterStoreModule (copy)
	return CreateIsPrivatePlaytesterStoreModule()
end)