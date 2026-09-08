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
local fFlagHighlightModePreciseSelectionEnabled = require(parent.SharedFlags).FFlagHighlightModePreciseSelectionEnabled
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
	initialize = function()
		-- upvalues: inGameAssetReportModeModule (ref), fFlagHighlightModePreciseSelectionEnabled (ref), getHighlightModeVariantModule (ref), highlightModeVariants (ref), t (ref), reactModule (ref), layerCollectorProvider (ref), foundationProvider (ref), roactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), styleProviderWithDefaultTheme (ref), messageBusService (ref), captureModeMessageId (ref), experienceStateCaptureService (ref), coreGuiService (ref)
		local _ = nil
		local var1 = inGameAssetReportModeModule
		
		if fFlagHighlightModePreciseSelectionEnabled then
			local var2 = getHighlightModeVariantModule()
			
			if var2 ~= highlightModeVariants.Default and t[var2] ~= nil then
				game:GetService("ExperienceStateCaptureService").SelectionMode = Enum.ExperienceStateCaptureSelectionMode.SafetyHighlightMode
				var1 = t[var2]
			end
		end
		local screenGui = reactModule.createElement("ScreenGui", {
			IgnoreGuiInset = true,
			OnTopOfCoreBlur = false,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			LayerCollectorProvider = reactModule.createElement(layerCollectorProvider, {}, {
				FoundationProvider = reactModule.createElement(foundationProvider, { colorMode = "Dark" }, {
					LocalizationProvider = roactModule.createElement(localizationProvider, {
						localization = localization.new(localizationService.RobloxLocaleId)
					}, {
						StyleProvider = reactModule.createElement(styleProviderWithDefaultTheme, { withDarkTheme = true }, {
							InGameAssetReportUI = roactModule.createElement(var1, {
								backAction = function()
									-- upvalues: messageBusService (copy), captureModeMessageId (copy), experienceStateCaptureService (copy)
									messageBusService:Publish(captureModeMessageId, { reason = "back" })
									experienceStateCaptureService:ToggleCaptureMode()
								end,
								onReportComplete = function()
									-- upvalues: messageBusService (copy), captureModeMessageId (copy), experienceStateCaptureService (copy)
									messageBusService:Publish(captureModeMessageId, { reason = "submit" })
									experienceStateCaptureService:ToggleCaptureMode()
								end,
								getIsSmallPortraitMode = function(p1)
									return p1.X < p1.Y and p1.X < 800
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