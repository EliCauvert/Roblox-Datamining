game:DefineFastFlag("MomentsUseMomentsServiceForUpload", false)

return function()
	return game:GetFastFlag("MomentsUseMomentsServiceForUpload") and (game:GetEngineFeature("MomentsServiceCreatePostApi") and game:GetEngineFeature("PostUploadFormat"))
end