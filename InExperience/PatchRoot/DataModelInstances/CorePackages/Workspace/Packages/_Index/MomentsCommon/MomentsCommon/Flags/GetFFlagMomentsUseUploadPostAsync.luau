game:DefineFastFlag("MomentsUseUploadPostAsync", false)

return function()
	return game:GetFastFlag("MomentsUseUploadPostAsync") and game:GetEngineFeature("PostUploadFormat")
end