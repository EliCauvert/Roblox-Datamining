local createDictationModeSettingStoreModule = require(script.createDictationModeSettingStore)

return require(script:FindFirstAncestor("ExpChat").Parent.Signals).createComputed(function()
	-- upvalues: createDictationModeSettingStoreModule (ref)
	return createDictationModeSettingStoreModule()
end)