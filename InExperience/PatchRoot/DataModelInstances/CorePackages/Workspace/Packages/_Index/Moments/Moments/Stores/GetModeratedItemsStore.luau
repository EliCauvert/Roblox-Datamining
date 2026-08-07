local createModeratedItemsStoreModule = require(script.createModeratedItemsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function() --[[ line: 7 ]]
	-- upvalues: createModeratedItemsStoreModule (ref)
	return createModeratedItemsStoreModule()
end)