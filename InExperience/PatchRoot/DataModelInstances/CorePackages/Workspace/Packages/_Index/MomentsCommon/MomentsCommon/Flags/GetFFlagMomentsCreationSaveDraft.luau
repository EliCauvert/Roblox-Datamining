game:DefineFastFlag("MomentsCreationSaveDraft", false)

return function() --[[ Line: 9 ]]
	return game:GetFastFlag("MomentsCreationSaveDraft") and game:GetEngineFeature("MomentsDraftStorageKey")
end