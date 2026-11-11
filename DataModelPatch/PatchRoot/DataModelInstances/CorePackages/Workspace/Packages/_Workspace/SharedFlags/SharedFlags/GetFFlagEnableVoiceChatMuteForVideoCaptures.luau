return function(): boolean
	return game:GetEngineFeature("EnableVideoCaptureApiLua") and not game:GetEngineFeature("ReenableMomentsVoice")
end