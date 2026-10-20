local CreateModeratedItemsStoreModule = require(script.createModeratedItemsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function()
	-- upvalues: CreateModeratedItemsStoreModule (copy)
	return CreateModeratedItemsStoreModule()
end)