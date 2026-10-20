local CreateIsPrivatePlaytesterStoreModule = require(script.Parent.createIsPrivatePlaytesterStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateIsPrivatePlaytesterStoreModule (copy)
	return CreateIsPrivatePlaytesterStoreModule()
end)