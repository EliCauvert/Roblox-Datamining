game:DefineFastFlag("MomentsStickerButton3", false)

return function()
	return game:GetFastFlag("MomentsStickerButton3") and game:GetEngineFeature("MomentsStickerOverlay")
end