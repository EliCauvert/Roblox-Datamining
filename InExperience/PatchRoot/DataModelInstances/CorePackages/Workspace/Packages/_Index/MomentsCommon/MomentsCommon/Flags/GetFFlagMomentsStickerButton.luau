game:DefineFastFlag("MomentsStickerButton2", false)

return function() --[[ line: 3 ]]
	return game:GetFastFlag("MomentsStickerButton2") and game:GetEngineFeature("MomentsStickerOverlay")
end