local createSearchQueryStoreModule = require(script.createSearchQueryStore)

return require(script:FindFirstAncestor("BuildExperience").Parent.Signals).createComputed(function()
	-- upvalues: createSearchQueryStoreModule (ref)
	return createSearchQueryStoreModule()
end)