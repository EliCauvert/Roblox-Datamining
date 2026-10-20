game:DefineFastFlag("VRPanelWidthIXPEnabledV5", false)

return function()
	return game:GetEngineFeature("IxpLayerPlatformExcellenceQualityImprovementVREnabled") and game:GetFastFlag("VRPanelWidthIXPEnabledV5")
end