local CreateDeletedMomentsStoreModule = require(script.createDeletedMomentsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function() --[[ Line: 7 ]]
	-- upvalues: CreateDeletedMomentsStoreModule (copy)
	return CreateDeletedMomentsStoreModule()
end)