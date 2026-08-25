local createExperienceGenreStoreModule = require(script.Parent.createExperienceGenreStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createExperienceGenreStoreModule (ref)
	return createExperienceGenreStoreModule()
end)