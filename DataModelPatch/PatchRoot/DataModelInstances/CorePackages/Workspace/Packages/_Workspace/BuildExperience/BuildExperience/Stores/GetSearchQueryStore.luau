local CreateSearchQueryStoreModule = require(script.createSearchQueryStore)

return require(script:FindFirstAncestor("BuildExperience").Parent.Signals).createComputed(function()
	-- upvalues: CreateSearchQueryStoreModule (copy)
	return CreateSearchQueryStoreModule()
end)