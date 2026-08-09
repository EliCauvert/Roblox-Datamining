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
	GetFStringAdsVolumeOffImageLua = function() --[[ line: 20 ]]
		return game:GetFastString("AdsVolumeOffImageLua")
	end,
	GetFStringAdsVolumeOnImageLua = function() --[[ line: 23 ]]
		return game:GetFastString("AdsVolumeOnImageLua")
	end,
	GetFStringAdsEnterFullscreenImageLua = function() --[[ line: 26 ]]
		return game:GetFastString("AdsEnterFullscreenImageLua")
	end,
	GetFStringAdsExitFullscreenImageLua = function() --[[ line: 29 ]]
		return game:GetFastString("AdsExitFullscreenImageLua")
	end,
	GetFStringAdsEudsaPromptActiveImageLua = function() --[[ line: 32 ]]
		return game:GetFastString("AdsEudsaPromptActiveImageLua")
	end,
	GetFStringAdsEudsaPromptInactiveImageLua = function() --[[ line: 35 ]]
		return game:GetFastString("AdsEudsaPromptInactiveImageLua")
	end,
	GetFStringAdGuiPlayButtonImageLua = function() --[[ line: 38 ]]
		return game:GetFastString("AdGuiPlayButtonImageLua")
	end,
	GetFStringAdGuiPauseButtonImageLua = function() --[[ line: 41 ]]
		return game:GetFastString("AdGuiPauseButtonImageLua")
	end,
	GetFStringAdGuiCloseButtonImageLua = function() --[[ line: 44 ]]
		return game:GetFastString("AdGuiCloseButtonImageLua")
	end,
	GetFStringAdGuiLivePreviewWatermark = function() --[[ line: 47 ]]
		return game:GetFastString("AdGuiLivePreviewWatermark")
	end,
	GetFStringLivePreviewPlaceId = function() --[[ line: 50 ]]
		return game:GetFastString("LivePreviewPlaceId")
	end,
	GetFFlagUseV2LivePreviewWatermark = function() --[[ line: 53 ]]
		return game:GetFastFlag("UseV2LivePreviewWatermark")
	end,
	GetFStringAdGuiLivePreviewWatermarkV2 = function() --[[ line: 56 ]]
		return game:GetFastString("AdGuiLivePreviewWatermarkV2")
	end,
	GetFFlagEnableReportAdDropdown = function() --[[ line: 59 ]]
		return game:GetFastFlag("EnableReportAdDropdown5")
	end,
	GetFIntUniversalAppPolicyFailureTelemetryThrottleHundredthsPercent = function() --[[ line: 62 ]]
		return game:GetFastInt("UniversalAppPolicyFailureTelemetryThrottleHundredthsPercent")
	end,
	GetEnableHideReportAdModalDuringScreenshot = function() --[[ line: 65 ]]
		return game:GetFastFlag("EnableHideReportAdModalDuringScreenshot2")
	end,
	GetAdGuiInteractivityPixelsPerStud = function() --[[ line: 68 ]]
		return game:GetFastInt("AdGuiInteractivityPixelsPerStud")
	end
}