local createReactionsStoreModule = require(script.createReactionsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function() --[[ line: 7 ]]
	-- upvalues: createReactionsStoreModule (ref)
	return createReactionsStoreModule()
end)