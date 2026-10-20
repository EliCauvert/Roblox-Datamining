local CreateExperienceQuestionnaireStoreModule = require(script.Parent.createExperienceQuestionnaireStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateExperienceQuestionnaireStoreModule (copy)
	return CreateExperienceQuestionnaireStoreModule()
end)