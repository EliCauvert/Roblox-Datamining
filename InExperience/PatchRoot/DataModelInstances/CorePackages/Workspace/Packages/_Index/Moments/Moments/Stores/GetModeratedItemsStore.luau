local CreateModeratedItemsStoreModule = require(script.createModeratedItemsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function() --[[ Line: 7 ]]
	-- upvalues: CreateModeratedItemsStoreModule (copy)
	return CreateModeratedItemsStoreModule()
end)