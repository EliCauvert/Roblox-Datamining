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
local fFlagEnableMomentsCommentReporting = sharedFlagsModule.FFlagEnableMomentsCommentReporting
local fFlagAbuseReportAttributes = sharedFlagsModule.FFlagAbuseReportAttributes

local function DynamicReportV2Adapter(p1)
	-- upvalues: reactModule (ref), dynamicReportV2ContainerModule (ref)
	local targetId = p1.targetId
	
	return reactModule.createElement(dynamicReportV2ContainerModule, {
		abuseVector = p1.abuseVector,
		attributes = if targetId ~= nil then p1.attributes else reactModule.useMemo(function()
			-- upvalues: targetId (ref)
			if targetId == nil then
				return nil
			end
			assert(type(targetId) == "string", "DynamicReportV2 requires a string targetId")
			
			return { targetId = targetId }
		end, { targetId }),
		analyticsTargetId = if targetId ~= nil then p1.analyticsTargetId else targetId,
		onClose = p1.onClose,
		onSubmit = p1.onSubmit,
		onCustomSubmit = p1.onCustomSubmit,
		clientActionHandlers = p1.clientActionHandlers,
		custom = p1.custom
	})
end

return reactModule.memo(function(p1)
	-- upvalues: fFlagAbuseReportAttributes (ref), abuseVectorModule (ref), fFlagEnableReportingFlowForMomentsFeed (ref), fFlagEnableMomentsCommentReporting (ref), reactModule (ref), DynamicReportV2Adapter (ref), dynamicReportV2ContainerModule (ref), layerCollectorProvider (ref), abuseReportBeduiProviderModule (ref), abuseReportFormDataProviderModule (ref), fFlagAddThumbnailSelectorReport (ref), abuseReportAnalyticsProviderModule (ref), dynamicReportModule (ref)
	if fFlagAbuseReportAttributes and p1.targetId ~= nil and (p1.attributes ~= nil or p1.analyticsTargetId ~= nil) then
		error("targetId is mutually exclusive with attributes and analyticsTargetId")
	end
	if p1.abuseVector == abuseVectorModule.UserProfile or fFlagEnableReportingFlowForMomentsFeed and p1.abuseVector == abuseVectorModule.MomentsFeed or fFlagEnableMomentsCommentReporting and p1.abuseVector == abuseVectorModule.MomentComment then
		return if fFlagAbuseReportAttributes then reactModule.createElement(DynamicReportV2Adapter, p1) else reactModule.createElement(dynamicReportV2ContainerModule, {
			abuseVector = p1.abuseVector,
			targetId = p1.targetId,
			onClose = p1.onClose,
			onSubmit = p1.onSubmit,
			onCustomSubmit = p1.onCustomSubmit,
			clientActionHandlers = p1.clientActionHandlers,
			custom = p1.custom
		})
	elseif fFlagAbuseReportAttributes then
		assert(p1.targetId ~= nil, "attributes are only supported by the Dynamic Report V2 flow")
	end
	return reactModule.createElement(layerCollectorProvider, {}, {
		AbuseReportBeduiProvider = reactModule.createElement(abuseReportBeduiProviderModule, { abuseVector = p1.abuseVector }, {
			AbuseReportFormDataProvider = reactModule.createElement(abuseReportFormDataProviderModule, {
				custom = if fFlagAddThumbnailSelectorReport then p1.custom else nil
			}, {
				AbuseReportAnalyticsProvider = reactModule.createElement(abuseReportAnalyticsProviderModule, { abuseVector = p1.abuseVector }, {
					DynamicReport = reactModule.createElement(dynamicReportModule, {
						abuseVector = p1.abuseVector,
						targetId = p1.targetId,
						onClose = p1.onClose,
						onSubmit = p1.onSubmit,
						custom = p1.custom
					})
				})
			})
		})
	})
end)