game:SetFlagVersion("VoiceVolumeControlsPerUserPlayerListButton", 5)

return game:DefineFastFlag("VoiceVolumeControlsPerUserPlayerListButton", false) and (game:GetEngineFeature("VoiceVolumeControlsApplyPerUserMultiplier") and game:GetEngineFeature("CoreUiDragDetectorWorksWhileMenuOpen"))