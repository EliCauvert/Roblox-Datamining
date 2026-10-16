return function(): boolean --[[ Line: 1 ]]
	return game:GetEngineFeature("EnableVideoCaptureApiLua") and not game:GetEngineFeature("ReenableMomentsVoice")
end