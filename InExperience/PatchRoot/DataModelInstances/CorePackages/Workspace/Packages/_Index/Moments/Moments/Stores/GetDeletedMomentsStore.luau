local createDeletedMomentsStoreModule = require(script.createDeletedMomentsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function()
	-- upvalues: createDeletedMomentsStoreModule (ref)
	return createDeletedMomentsStoreModule()
end)