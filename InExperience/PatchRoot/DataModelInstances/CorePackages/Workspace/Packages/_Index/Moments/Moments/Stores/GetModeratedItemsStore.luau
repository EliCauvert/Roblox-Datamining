local createModeratedItemsStoreModule = require(script.createModeratedItemsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function()
	-- upvalues: createModeratedItemsStoreModule (ref)
	return createModeratedItemsStoreModule()
end)