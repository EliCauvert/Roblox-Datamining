game:DefineFastFlag("MomentsRenderPostAssets", false)

return function()
	return game:GetFastFlag("MomentsRenderPostAssets") and game:GetEngineFeature("MomentsServiceFetchPostApi")
end