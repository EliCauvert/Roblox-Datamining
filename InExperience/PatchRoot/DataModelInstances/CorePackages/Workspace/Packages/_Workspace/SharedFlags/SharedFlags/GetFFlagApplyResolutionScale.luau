game:DefineFastFlag("ApplyResolutionScale", false)

return function() --[[ line: 3 ]]
	return game:GetFastFlag("ApplyResolutionScale") and game:GetEngineFeature("CanvasGroupCustomResolutionScale")
end