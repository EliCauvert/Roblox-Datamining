local CreatePrivatePlaytestersStoreModule = require(script.Parent.createPrivatePlaytestersStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreatePrivatePlaytestersStoreModule (copy)
	return CreatePrivatePlaytestersStoreModule()
end)