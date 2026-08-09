local parent = script.Parent
local coreGuiService = game:GetService("CoreGui")
local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local styleProviderWithDefaultTheme = require(parent.Style).StyleProviderWithDefaultTheme
local layerCollectorProvider = require(parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local foundationProvider = require(parent.Foundation).FoundationProvider
local localization = require(parent.InExperienceLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagHighlightModePreciseSelectionEnabled = sharedFlagsModule.FFlagHighlightModePreciseSelectionEnabled
local fFlagAbuseReportMenuV2 = sharedFlagsModule.FFlagAbuseReportMenuV2
local messageBusService = game:GetService("MessageBusService")
local captureModeMessageId = messageBusService:GetMessageId("CaptureMode", "sceneSelectionExitReason")
local sceneAnalysisModule = require(script.Analysis.SceneAnalysis)
local inGameAssetReportModeModule = require(script.InGameAssetReportUI.Components.InGameAssetReportMode)
local inGameAssetReportModePreciseSelectionModule = require(script.InGameAssetReportUI.Components.PreciseSelection.InGameAssetReportModePreciseSelection)
local getHighlightModeVariantModule = require(script.Utility.getHighlightModeVariant)
local highlightModeVariants = require(script.InGameAssetReportUI.Resources.Constants).HighlightModeVariants
local t = {
	[highlightModeVariants.Default] = inGameAssetReportModeModule,
	[highlightModeVariants.NoPreview] = inGameAssetReportModePreciseSelectionModule
}

return {
	interpretAnnotation = sceneAnalysisModule.interpretAnnotation,
	extractItemsFromInterpretations = sceneAnalysisModule.extractItemsFromInterpretations,
	__setRandomGenerator = sceneAnalysisModule.__setRandomGenerator,
	initialize = function() --[[ line: 42 ]]
		-- upvalues: inGameAssetReportModeModule (ref), fFlagHighlightModePreciseSelectionEnabled (ref), getHighlightModeVariantModule (ref), highlightModeVariants (ref), t (ref), reactModule (ref), layerCollectorProvider (ref), foundationProvider (ref), roactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), styleProviderWithDefaultTheme (ref), fFlagAbuseReportMenuV2 (ref), messageBusService (ref), captureModeMessageId (ref), experienceStateCaptureService (ref), coreGuiService (ref)
		local _ = nil
		local var13 = inGameAssetReportModeModule
		
		if fFlagHighlightModePreciseSelectionEnabled then
			local var14 = getHighlightModeVariantModule()
			
			if var14 ~= highlightModeVariants.Default and t[var14] ~= nil then
				game:GetService("ExperienceStateCaptureService").SelectionMode = Enum.ExperienceStateCaptureSelectionMode.SafetyHighlightMode
				var13 = t[var14]
			end
		end
		local screenGui = reactModule.createElement("ScreenGui", {
			IgnoreGuiInset = true,
			OnTopOfCoreBlur = false,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			LayerCollectorProvider = reactModule.createElement(layerCollectorProvider, {}, {
				FoundationProvider = reactModule.createElement(foundationProvider, { theme = "Dark" }, {
					LocalizationProvider = roactModule.createElement(localizationProvider, {
						localization = localization.new(localizationService.RobloxLocaleId)
					}, {
						StyleProvider = reactModule.createElement(styleProviderWithDefaultTheme, { withDarkTheme = true }, {
							InGameAssetReportUI = roactModule.createElement(var13, {
								backAction = function() --[[ line: 73 ]]
									-- upvalues: fFlagAbuseReportMenuV2 (copy), messageBusService (copy), captureModeMessageId (copy), experienceStateCaptureService (copy)
									if fFlagAbuseReportMenuV2 then
										messageBusService:Publish(captureModeMessageId, { reason = "back" })
									end
									experienceStateCaptureService:ToggleCaptureMode()
								end,
								onReportComplete = function() --[[ line: 79 ]]
									-- upvalues: fFlagAbuseReportMenuV2 (copy), messageBusService (copy), captureModeMessageId (copy), experienceStateCaptureService (copy)
									if fFlagAbuseReportMenuV2 then
										messageBusService:Publish(captureModeMessageId, { reason = "submit" })
									end
									experienceStateCaptureService:ToggleCaptureMode()
								end,
								getIsSmallPortraitMode = function(p0) --[[ line: 85 ]]
									return p0.X < p0.Y and p0.X < 800
								end
							})
						})
					})
				})
			})
		})
		
		if game:GetEngineFeature("ExperienceStateCaptureHiddenSelection") then
			experienceStateCaptureService.HiddenSelectionEnabled = true
		end
		roactModule.mount(screenGui, coreGuiService, "InGameAssetReportMode")
	end,
	getHighlightModeVariant = getHighlightModeVariantModule,
	HighlightModeVariants = highlightModeVariants,
	["jest.config"] = script["jest.config"]
}