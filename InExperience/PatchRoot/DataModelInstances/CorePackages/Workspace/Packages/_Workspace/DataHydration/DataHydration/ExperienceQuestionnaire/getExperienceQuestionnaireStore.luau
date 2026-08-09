local createExperienceQuestionnaireStoreModule = require(script.Parent.createExperienceQuestionnaireStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ line: 9 ]]
	-- upvalues: createExperienceQuestionnaireStoreModule (ref)
	return createExperienceQuestionnaireStoreModule()
end)