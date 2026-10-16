local CreateDictationModeSettingStoreModule = require(script.createDictationModeSettingStore)

return require(script:FindFirstAncestor("ExpChat").Parent.Signals).createComputed(function() --[[ Line: 6 ]]
	-- upvalues: CreateDictationModeSettingStoreModule (copy)
	return CreateDictationModeSettingStoreModule()
end)