local CreateBuildPromptChipsStoreModule = require(script.createBuildPromptChipsStore)

return require(script:FindFirstAncestor("BuildExperience").Parent.Signals).createComputed(function()
	-- upvalues: CreateBuildPromptChipsStoreModule (copy)
	return CreateBuildPromptChipsStoreModule()
end)