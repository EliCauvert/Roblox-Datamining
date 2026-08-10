local createPrivatePlaytestersStoreModule = require(script.Parent.createPrivatePlaytestersStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 8 ]]
	-- upvalues: createPrivatePlaytestersStoreModule (ref)
	return createPrivatePlaytestersStoreModule()
end)