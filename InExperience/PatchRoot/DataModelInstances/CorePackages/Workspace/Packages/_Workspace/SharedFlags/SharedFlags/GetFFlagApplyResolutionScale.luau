game:DefineFastFlag("ApplyResolutionScale", false)

return function()
	return game:GetFastFlag("ApplyResolutionScale") and game:GetEngineFeature("CanvasGroupCustomResolutionScale")
end