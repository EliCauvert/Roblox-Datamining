game:DefineFastFlag("MomentsRenderPostAssets2", false)

return function() --[[ Line: 3 ]]
	return game:GetFastFlag("MomentsRenderPostAssets2") and game:GetEngineFeature("MomentsServiceFetchPostApi")
end