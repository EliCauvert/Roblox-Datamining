local CreateDeletedMomentsStoreModule = require(script.createDeletedMomentsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function()
	-- upvalues: CreateDeletedMomentsStoreModule (copy)
	return CreateDeletedMomentsStoreModule()
end)