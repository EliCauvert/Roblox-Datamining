game:DefineFastFlag("MomentsRenderPostAssets2", false)

return function()
	return game:GetFastFlag("MomentsRenderPostAssets2") and game:GetEngineFeature("MomentsServiceFetchPostApi")
end