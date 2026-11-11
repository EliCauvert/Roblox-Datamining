local CreateExperienceGenreStoreModule = require(script.Parent.createExperienceGenreStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateExperienceGenreStoreModule (copy)
	return CreateExperienceGenreStoreModule()
end)