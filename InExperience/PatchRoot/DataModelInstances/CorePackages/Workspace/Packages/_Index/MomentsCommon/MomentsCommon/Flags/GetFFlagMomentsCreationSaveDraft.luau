game:DefineFastFlag("MomentsCreationSaveDraft", false)

return function()
	return game:GetFastFlag("MomentsCreationSaveDraft") and game:GetEngineFeature("MomentsDraftStorageKey")
end