game:DefineFastFlag("MomentsUseUploadPostAsync", false)

return function() --[[ line: 3 ]]
	return game:GetFastFlag("MomentsUseUploadPostAsync") and game:GetEngineFeature("PostUploadFormat")
end