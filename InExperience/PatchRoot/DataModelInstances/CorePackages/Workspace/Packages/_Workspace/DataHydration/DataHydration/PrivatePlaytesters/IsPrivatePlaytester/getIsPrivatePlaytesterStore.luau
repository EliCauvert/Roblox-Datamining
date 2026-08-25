local createIsPrivatePlaytesterStoreModule = require(script.Parent.createIsPrivatePlaytesterStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createIsPrivatePlaytesterStoreModule (ref)
	return createIsPrivatePlaytesterStoreModule()
end)