local createCommentReactionsStoreModule = require(script.createCommentReactionsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function()
	-- upvalues: createCommentReactionsStoreModule (ref)
	return createCommentReactionsStoreModule()
end)