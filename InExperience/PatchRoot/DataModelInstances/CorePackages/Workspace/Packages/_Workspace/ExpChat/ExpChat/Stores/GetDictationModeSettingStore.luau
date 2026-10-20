local CreateDictationModeSettingStoreModule = require(script.createDictationModeSettingStore)

return require(script:FindFirstAncestor("ExpChat").Parent.Signals).createComputed(function()
	-- upvalues: CreateDictationModeSettingStoreModule (copy)
	return CreateDictationModeSettingStoreModule()
end)