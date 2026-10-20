local Parent = script.Parent
local CoreGui = game:GetService("CoreGui")
local ExperienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local LayerCollectorProvider = require(Parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local Localization = require(Parent.InExperienceLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagHighlightModePreciseSelectionEnabled = SharedFlagsModule.FFlagHighlightModePreciseSelectionEnabled
local FFlagAbuseReportMenuV2 = SharedFlagsModule.FFlagAbuseReportMenuV2
local MessageBusService = game:GetService("MessageBusService")
local CaptureModeMessageId = MessageBusService:GetMessageId("CaptureMode", "sceneSelectionExitReason")
local SceneAnalysisModule = require(script.Analysis.SceneAnalysis)
local InGameAssetReportModeModule = require(script.InGameAssetReportUI.Components.InGameAssetReportMode)
local GetHighlightModeVariantModule = require(script.Utility.getHighlightModeVariant)
local HighlightModeVariants = require(script.InGameAssetReportUI.Resources.Constants).HighlightModeVariants
local config = {
	[HighlightModeVariants.Default] = InGameAssetReportModeModule,
	[HighlightModeVariants.NoPreview] = require(script.InGameAssetReportUI.Components.PreciseSelection.InGameAssetReportModePreciseSelection)
}

return {
	interpretAnnotation = SceneAnalysisModule.interpretAnnotation,
	extractItemsFromInterpretations = SceneAnalysisModule.extractItemsFromInterpretations,
	__setRandomGenerator = SceneAnalysisModule.__setRandomGenerator,
	initialize = function()
		-- upvalues: InGameAssetReportModeModule (copy), FFlagHighlightModePreciseSelectionEnabled (copy), GetHighlightModeVariantModule (copy), HighlightModeVariants (copy), config (copy), ReactModule (copy), LayerCollectorProvider (copy), FoundationProvider (copy), RoactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), StyleProviderWithDefaultTheme (copy), FFlagAbuseReportMenuV2 (copy), MessageBusService (copy), CaptureModeMessageId (copy), ExperienceStateCaptureService (copy), CoreGui (copy)
		local InGameAssetReportModeModule1 = InGameAssetReportModeModule
		
		if FFlagHighlightModePreciseSelectionEnabled then
			local HighlightModeVariantModule = GetHighlightModeVariantModule()
			
			if HighlightModeVariantModule ~= HighlightModeVariants.Default and config[HighlightModeVariantModule] ~= nil then
				game:GetService("ExperienceStateCaptureService").SelectionMode = Enum.ExperienceStateCaptureSelectionMode.SafetyHighlightMode
				InGameAssetReportModeModule1 = config[HighlightModeVariantModule]
			end
		end
		local ScreenGui = ReactModule.createElement("ScreenGui", {
			IgnoreGuiInset = true,
			OnTopOfCoreBlur = false,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			LayerCollectorProvider = ReactModule.createElement(LayerCollectorProvider, {}, {
				FoundationProvider = ReactModule.createElement(FoundationProvider, { theme = "Dark" }, {
					LocalizationProvider = RoactModule.createElement(LocalizationProvider, {
						localization = Localization.new(LocalizationService.RobloxLocaleId)
					}, {
						StyleProvider = ReactModule.createElement(StyleProviderWithDefaultTheme, { withDarkTheme = true }, {
							InGameAssetReportUI = RoactModule.createElement(InGameAssetReportModeModule1, {
								backAction = function()
									-- upvalues: FFlagAbuseReportMenuV2 (upval), MessageBusService (upval), CaptureModeMessageId (upval), ExperienceStateCaptureService (upval)
									if FFlagAbuseReportMenuV2 then
										MessageBusService:Publish(CaptureModeMessageId, { reason = "back" })
									end
									ExperienceStateCaptureService:ToggleCaptureMode()
								end,
								onReportComplete = function()
									-- upvalues: FFlagAbuseReportMenuV2 (upval), MessageBusService (upval), CaptureModeMessageId (upval), ExperienceStateCaptureService (upval)
									if FFlagAbuseReportMenuV2 then
										MessageBusService:Publish(CaptureModeMessageId, { reason = "submit" })
									end
									ExperienceStateCaptureService:ToggleCaptureMode()
								end,
								getIsSmallPortraitMode = function(Vector): boolean
									return Vector.X < Vector.Y and Vector.X < 800
								end
							})
						})
					})
				})
			})
		})
		
		if game:GetEngineFeature("ExperienceStateCaptureHiddenSelection") then
			ExperienceStateCaptureService.HiddenSelectionEnabled = true
		end
		RoactModule.mount(ScreenGui, CoreGui, "InGameAssetReportMode")
	end,
	getHighlightModeVariant = GetHighlightModeVariantModule,
	HighlightModeVariants = HighlightModeVariants,
	["jest.config"] = script["jest.config"]
}