game:DefineFastFlag("ApplyResolutionScale", false)

return function() --[[ Line: 3 ]]
	return game:GetFastFlag("ApplyResolutionScale") and game:GetEngineFeature("CanvasGroupCustomResolutionScale")
end