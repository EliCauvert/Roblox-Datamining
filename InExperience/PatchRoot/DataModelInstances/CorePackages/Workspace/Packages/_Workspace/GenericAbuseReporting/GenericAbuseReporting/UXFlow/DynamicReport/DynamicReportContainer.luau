local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local ReactModule = require(Parent.React)
local LayerCollectorProvider = require(Parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local AbuseReportAnalyticsProviderModule = require(GenericAbuseReporting.Bedui.Provider.AbuseReportAnalyticsProvider)
local AbuseReportBeduiProviderModule = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiProvider)
local AbuseReportFormDataProviderModule = require(GenericAbuseReporting.Bedui.Provider.AbuseReportFormDataProvider)
local _ = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local AbuseVectorModule = require(GenericAbuseReporting.Enums.AbuseVector)
local DynamicReportModule = require(GenericAbuseReporting.UXFlow.DynamicReport.DynamicReport)
local DynamicReportV2ContainerModule = require(GenericAbuseReporting.UXFlow.DynamicReportV2.DynamicReportV2Container)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAddThumbnailSelectorReport = SharedFlagsModule.FFlagAddThumbnailSelectorReport
local FFlagEnableMomentsCommentReporting = SharedFlagsModule.FFlagEnableMomentsCommentReporting
local FFlagEnableNewReportFlowGameTile = SharedFlagsModule.FFlagEnableNewReportFlowGameTile
local FFlagEnableGroupAnnouncementReporting = SharedFlagsModule.FFlagEnableGroupAnnouncementReporting
local FFlagAbuseReportAttributes = SharedFlagsModule.FFlagAbuseReportAttributes

local function DynamicReportV2Adapter(p1)
	-- upvalues: ReactModule (copy), DynamicReportV2ContainerModule (copy)
	local TargetId = p1.targetId
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: TargetId (copy)
		if TargetId == nil then
			return nil
		else
			assert(type(TargetId) == "string", "DynamicReportV2 requires a string targetId")
			
			return { targetId = TargetId }
		end
	end, { TargetId })
	
	return ReactModule.createElement(DynamicReportV2ContainerModule, {
		abuseVector = p1.abuseVector,
		attributes = if TargetId == nil then p1.attributes else UseMemoResult,
		analyticsTargetId = if TargetId == nil then p1.analyticsTargetId else TargetId,
		onClose = p1.onClose,
		onSubmit = p1.onSubmit,
		onCustomSubmit = p1.onCustomSubmit,
		clientActionHandlers = p1.clientActionHandlers,
		custom = p1.custom
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: FFlagAbuseReportAttributes (copy), AbuseVectorModule (copy), FFlagEnableMomentsCommentReporting (copy), FFlagEnableNewReportFlowGameTile (copy), FFlagEnableGroupAnnouncementReporting (copy), ReactModule (copy), DynamicReportV2Adapter (copy), DynamicReportV2ContainerModule (copy), LayerCollectorProvider (copy), AbuseReportBeduiProviderModule (copy), AbuseReportFormDataProviderModule (copy), FFlagAddThumbnailSelectorReport (copy), AbuseReportAnalyticsProviderModule (copy), DynamicReportModule (copy)
	if FFlagAbuseReportAttributes and p1.targetId ~= nil and (p1.attributes ~= nil or p1.analyticsTargetId ~= nil) then
		error("targetId is mutually exclusive with attributes and analyticsTargetId")
	end
	if p1.abuseVector == AbuseVectorModule.UserProfile or p1.abuseVector == AbuseVectorModule.MomentsFeed or FFlagEnableMomentsCommentReporting and p1.abuseVector == AbuseVectorModule.MomentComment or FFlagEnableNewReportFlowGameTile and p1.abuseVector == AbuseVectorModule.GameTile or FFlagEnableGroupAnnouncementReporting and p1.abuseVector == AbuseVectorModule.GroupAnnouncement then
		return if FFlagAbuseReportAttributes then ReactModule.createElement(DynamicReportV2Adapter, p1) else ReactModule.createElement(DynamicReportV2ContainerModule, {
			abuseVector = p1.abuseVector,
			targetId = p1.targetId,
			onClose = p1.onClose,
			onSubmit = p1.onSubmit,
			onCustomSubmit = p1.onCustomSubmit,
			clientActionHandlers = p1.clientActionHandlers,
			custom = p1.custom
		})
	end
	if FFlagAbuseReportAttributes then
		assert(p1.targetId ~= nil, "attributes are only supported by the Dynamic Report V2 flow")
	end
	return ReactModule.createElement(LayerCollectorProvider, {}, {
		AbuseReportBeduiProvider = ReactModule.createElement(AbuseReportBeduiProviderModule, { abuseVector = p1.abuseVector }, {
			AbuseReportFormDataProvider = ReactModule.createElement(AbuseReportFormDataProviderModule, {
				custom = if FFlagAddThumbnailSelectorReport then p1.custom else nil
			}, {
				AbuseReportAnalyticsProvider = ReactModule.createElement(AbuseReportAnalyticsProviderModule, { abuseVector = p1.abuseVector }, {
					DynamicReport = ReactModule.createElement(DynamicReportModule, {
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