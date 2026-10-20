game:DefineFastString("AdsVolumeOffImageLua", "rbxassetid://14986179621")
game:DefineFastString("AdsVolumeOnImageLua", "rbxassetid://14986178697")
game:DefineFastString("AdsEnterFullscreenImageLua", "rbxassetid://14986182327")
game:DefineFastString("AdsExitFullscreenImageLua", "rbxassetid://14986181606")
game:DefineFastString("AdsEudsaPromptActiveImageLua", "rbxassetid://16017622465")
game:DefineFastString("AdsEudsaPromptInactiveImageLua", "rbxassetid://16040129720")
game:DefineFastString("AdGuiPlayButtonImageLua", "rbxassetid://16639542545")
game:DefineFastString("AdGuiPauseButtonImageLua", "rbxassetid://16639540538")
game:DefineFastString("AdGuiCloseButtonImageLua", "rbxassetid://16639540023")
game:DefineFastString("AdGuiLivePreviewWatermark", "rbxassetid://18539441909")
game:DefineFastString("AdGuiLivePreviewWatermarkV2", "rbxassetid://18641531344")
game:DefineFastString("LivePreviewPlaceId", "-1")
game:DefineFastFlag("UseV2LivePreviewWatermark", false)
game:DefineFastFlag("EnableReportAdDropdown5", false)
game:DefineFastInt("UniversalAppPolicyFailureTelemetryThrottleHundredthsPercent", 10000)
game:DefineFastFlag("EnableHideReportAdModalDuringScreenshot2", false)
game:DefineFastInt("AdGuiInteractivityPixelsPerStud", 50)

return {
	GetFStringAdsVolumeOffImageLua = function()
		return game:GetFastString("AdsVolumeOffImageLua")
	end,
	GetFStringAdsVolumeOnImageLua = function()
		return game:GetFastString("AdsVolumeOnImageLua")
	end,
	GetFStringAdsEnterFullscreenImageLua = function()
		return game:GetFastString("AdsEnterFullscreenImageLua")
	end,
	GetFStringAdsExitFullscreenImageLua = function()
		return game:GetFastString("AdsExitFullscreenImageLua")
	end,
	GetFStringAdsEudsaPromptActiveImageLua = function()
		return game:GetFastString("AdsEudsaPromptActiveImageLua")
	end,
	GetFStringAdsEudsaPromptInactiveImageLua = function()
		return game:GetFastString("AdsEudsaPromptInactiveImageLua")
	end,
	GetFStringAdGuiPlayButtonImageLua = function()
		return game:GetFastString("AdGuiPlayButtonImageLua")
	end,
	GetFStringAdGuiPauseButtonImageLua = function()
		return game:GetFastString("AdGuiPauseButtonImageLua")
	end,
	GetFStringAdGuiCloseButtonImageLua = function()
		return game:GetFastString("AdGuiCloseButtonImageLua")
	end,
	GetFStringAdGuiLivePreviewWatermark = function()
		return game:GetFastString("AdGuiLivePreviewWatermark")
	end,
	GetFStringLivePreviewPlaceId = function()
		return game:GetFastString("LivePreviewPlaceId")
	end,
	GetFFlagUseV2LivePreviewWatermark = function()
		return game:GetFastFlag("UseV2LivePreviewWatermark")
	end,
	GetFStringAdGuiLivePreviewWatermarkV2 = function()
		return game:GetFastString("AdGuiLivePreviewWatermarkV2")
	end,
	GetFFlagEnableReportAdDropdown = function()
		return game:GetFastFlag("EnableReportAdDropdown5")
	end,
	FFlagFixReportAdInfoDuringRotation = game:DefineFastFlag("FixReportAdInfoDuringRotation", false),
	GetFIntUniversalAppPolicyFailureTelemetryThrottleHundredthsPercent = function()
		return game:GetFastInt("UniversalAppPolicyFailureTelemetryThrottleHundredthsPercent")
	end,
	GetEnableHideReportAdModalDuringScreenshot = function()
		return game:GetFastFlag("EnableHideReportAdModalDuringScreenshot2")
	end,
	GetAdGuiInteractivityPixelsPerStud = function()
		return game:GetFastInt("AdGuiInteractivityPixelsPerStud")
	end
}