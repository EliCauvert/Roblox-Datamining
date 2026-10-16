game:DefineFastFlag("MomentsUseUploadPostAsync", false)

return function() --[[ Line: 3 ]]
	return game:GetFastFlag("MomentsUseUploadPostAsync") and game:GetEngineFeature("PostUploadFormat")
end