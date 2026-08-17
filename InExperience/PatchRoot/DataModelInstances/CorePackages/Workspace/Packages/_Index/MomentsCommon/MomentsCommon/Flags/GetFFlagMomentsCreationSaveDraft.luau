game:DefineFastFlag("MomentsCreationSaveDraft", false)

return function() --[[ line: 9 ]]
	return game:GetFastFlag("MomentsCreationSaveDraft") and game:GetEngineFeature("MomentsDraftStorageKey")
end