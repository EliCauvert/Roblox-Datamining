local CreateAvatarInventoryStoreModule = require(script.Parent.createAvatarInventoryStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateAvatarInventoryStoreModule (copy)
	return CreateAvatarInventoryStoreModule()
end)