local createExperienceGenreStoreModule = require(script.Parent.createExperienceGenreStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 8 ]]
	-- upvalues: createExperienceGenreStoreModule (ref)
	return createExperienceGenreStoreModule()
end)