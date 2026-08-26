local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(parent.React)
local layerCollectorProvider = require(parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local appearanceContext = require(parent.Style).AppearanceContext
local abuseReportAnalyticsProviderModule = require(genericAbuseReporting.Bedui.Provider.AbuseReportAnalyticsProvider)
local abuseReportBeduiProviderModule = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiProvider)
local abuseReportFormDataProviderModule = require(genericAbuseReporting.Bedui.Provider.AbuseReportFormDataProvider)
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local abuseVectorModule = require(genericAbuseReporting.Enums.AbuseVector)
local dynamicReportModule = require(genericAbuseReporting.UXFlow.DynamicReport.DynamicReport)
local dynamicReportV2ContainerModule = require(genericAbuseReporting.UXFlow.DynamicReportV2.DynamicReportV2Container)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAddThumbnailSelectorReport = sharedFlagsModule.FFlagAddThumbnailSelectorReport
local fFlagEnableReportingFlowForMomentsFeed = sharedFlagsModule.FFlagEnableReportingFlowForMomentsFeed
local fixKidsBlueOnReportDropdown = game:DefineFastFlag("FixKidsBlueOnReportDropdown", false)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), appearanceContext (ref), abuseVectorModule (ref), fFlagEnableReportingFlowForMomentsFeed (ref), dynamicReportV2ContainerModule (ref), fixKidsBlueOnReportDropdown (ref), layerCollectorProvider (ref), abuseReportBeduiProviderModule (ref), abuseReportFormDataProviderModule (ref), fFlagAddThumbnailSelectorReport (ref), abuseReportAnalyticsProviderModule (ref), dynamicReportModule (ref), foundationProvider (ref), foundationModule (ref)
	return if p1.abuseVector == abuseVectorModule.UserProfile or fFlagEnableReportingFlowForMomentsFeed and p1.abuseVector == abuseVectorModule.MomentsFeed then reactModule.createElement(dynamicReportV2ContainerModule, {
		abuseVector = p1.abuseVector,
		targetId = p1.targetId,
		onClose = p1.onClose,
		onSubmit = p1.onSubmit,
		onCustomSubmit = p1.onCustomSubmit,
		clientActionHandlers = p1.clientActionHandlers,
		custom = p1.custom
	}) elseif fixKidsBlueOnReportDropdown then reactModule.createElement(layerCollectorProvider, {}, {
		AbuseReportBeduiProvider = reactModule.createElement(abuseReportBeduiProviderModule, { abuseVector = p1.abuseVector }, {
			AbuseReportFormDataProvider = reactModule.createElement(abuseReportFormDataProviderModule, {
				custom = if fFlagAddThumbnailSelectorReport then p1.custom else nil
			}, {
				AbuseReportAnalyticsProvider = reactModule.createElement(abuseReportAnalyticsProviderModule, { abuseVector = p1.abuseVector }, {
					DynamicReport = reactModule.createElement(dynamicReportModule, p1)
				})
			})
		})
	}) else reactModule.createElement(layerCollectorProvider, {}, {
		FoundationProvider = reactModule.createElement(foundationProvider, {
			colorMode = if reactModule.useContext(appearanceContext).theme == "light" then foundationModule.Enums.ColorMode.Light else foundationModule.Enums.ColorMode.Dark
		}, {
			AbuseReportBeduiProvider = reactModule.createElement(abuseReportBeduiProviderModule, { abuseVector = p1.abuseVector }, {
				AbuseReportFormDataProvider = reactModule.createElement(abuseReportFormDataProviderModule, {
					custom = if fFlagAddThumbnailSelectorReport then p1.custom else nil
				}, {
					AbuseReportAnalyticsProvider = reactModule.createElement(abuseReportAnalyticsProviderModule, { abuseVector = p1.abuseVector }, {
						DynamicReport = reactModule.createElement(dynamicReportModule, p1)
					})
				})
			})
		})
	})
end)