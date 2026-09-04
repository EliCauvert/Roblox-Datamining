local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(parent.React)
local layerCollectorProvider = require(parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
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

return reactModule.memo(function(p1)
	-- upvalues: abuseVectorModule (ref), fFlagEnableReportingFlowForMomentsFeed (ref), reactModule (ref), dynamicReportV2ContainerModule (ref), layerCollectorProvider (ref), abuseReportBeduiProviderModule (ref), abuseReportFormDataProviderModule (ref), fFlagAddThumbnailSelectorReport (ref), abuseReportAnalyticsProviderModule (ref), dynamicReportModule (ref)
	return if p1.abuseVector == abuseVectorModule.UserProfile or fFlagEnableReportingFlowForMomentsFeed and p1.abuseVector == abuseVectorModule.MomentsFeed then reactModule.createElement(dynamicReportV2ContainerModule, {
		abuseVector = p1.abuseVector,
		targetId = p1.targetId,
		onClose = p1.onClose,
		onSubmit = p1.onSubmit,
		onCustomSubmit = p1.onCustomSubmit,
		clientActionHandlers = p1.clientActionHandlers,
		custom = p1.custom
	}) else reactModule.createElement(layerCollectorProvider, {}, {
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
end)