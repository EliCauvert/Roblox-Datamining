local createMomentsStoreModule = require(script.createMomentsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_) --[[ line: 7 ]]
	-- upvalues: createMomentsStoreModule (ref)
	return createMomentsStoreModule()
end)