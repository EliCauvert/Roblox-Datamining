local CreatePrivatePlaytestersStoreModule = require(script.Parent.createPrivatePlaytestersStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreatePrivatePlaytestersStoreModule (copy)
	return CreatePrivatePlaytestersStoreModule()
end)