game:DefineFastFlag("MomentsUseMomentsServiceForUpload", false)

return function() --[[ Line: 3 ]]
	return game:GetFastFlag("MomentsUseMomentsServiceForUpload") and (game:GetEngineFeature("MomentsServiceCreatePostApi") and game:GetEngineFeature("PostUploadFormat"))
end