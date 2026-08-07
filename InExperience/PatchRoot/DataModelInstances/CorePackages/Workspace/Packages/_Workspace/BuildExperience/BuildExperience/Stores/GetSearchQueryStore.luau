local createSearchQueryStoreModule = require(script.createSearchQueryStore)

return require(script:FindFirstAncestor("BuildExperience").Parent.Signals).createComputed(function() --[[ line: 7 ]]
	-- upvalues: createSearchQueryStoreModule (ref)
	return createSearchQueryStoreModule()
end)