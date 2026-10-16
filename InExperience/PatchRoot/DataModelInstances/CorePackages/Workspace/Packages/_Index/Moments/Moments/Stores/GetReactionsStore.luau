local CreateReactionsStoreModule = require(script.createReactionsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function() --[[ Line: 7 ]]
	-- upvalues: CreateReactionsStoreModule (copy)
	return CreateReactionsStoreModule()
end)