local CreateCommentReactionsStoreModule = require(script.createCommentReactionsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateCommentReactionsStoreModule (copy)
	return CreateCommentReactionsStoreModule()
end)