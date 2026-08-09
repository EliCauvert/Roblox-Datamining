local createExperienceGenreStoreModule = require(script.Parent.createExperienceGenreStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 9 ]]
	-- upvalues: createExperienceGenreStoreModule (ref)
	return createExperienceGenreStoreModule()
end)