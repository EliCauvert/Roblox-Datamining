local CreateCommentReactionsStoreModule = require(script.createCommentReactionsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function()
	-- upvalues: CreateCommentReactionsStoreModule (copy)
	return CreateCommentReactionsStoreModule()
end)