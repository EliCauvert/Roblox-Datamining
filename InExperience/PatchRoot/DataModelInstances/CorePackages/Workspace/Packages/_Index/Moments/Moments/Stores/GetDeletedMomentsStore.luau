local createDeletedMomentsStoreModule = require(script.createDeletedMomentsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function() --[[ line: 7 ]]
	-- upvalues: createDeletedMomentsStoreModule (ref)
	return createDeletedMomentsStoreModule()
end)