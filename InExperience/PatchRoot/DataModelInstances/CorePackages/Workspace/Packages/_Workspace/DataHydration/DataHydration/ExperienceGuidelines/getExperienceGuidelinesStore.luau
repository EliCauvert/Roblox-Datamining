local CreateExperienceGuidelinesStoreModule = require(script.Parent.createExperienceGuidelinesStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateExperienceGuidelinesStoreModule (copy)
	return CreateExperienceGuidelinesStoreModule()
end)