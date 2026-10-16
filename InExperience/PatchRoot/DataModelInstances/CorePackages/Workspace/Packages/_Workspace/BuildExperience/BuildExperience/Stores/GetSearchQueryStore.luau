local CreateSearchQueryStoreModule = require(script.createSearchQueryStore)

return require(script:FindFirstAncestor("BuildExperience").Parent.Signals).createComputed(function() --[[ Line: 7 ]]
	-- upvalues: CreateSearchQueryStoreModule (copy)
	return CreateSearchQueryStoreModule()
end)