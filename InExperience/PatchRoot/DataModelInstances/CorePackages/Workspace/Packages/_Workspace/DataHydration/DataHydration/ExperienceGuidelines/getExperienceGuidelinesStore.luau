local createExperienceGuidelinesStoreModule = require(script.Parent.createExperienceGuidelinesStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createExperienceGuidelinesStoreModule (ref)
	return createExperienceGuidelinesStoreModule()
end)