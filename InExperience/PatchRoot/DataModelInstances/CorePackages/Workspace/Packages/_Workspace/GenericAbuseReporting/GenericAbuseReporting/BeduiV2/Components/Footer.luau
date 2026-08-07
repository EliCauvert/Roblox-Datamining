local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useDefaultTags = foundationModule.Hooks.useDefaultTags
local view = foundationModule.View
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local textWithTranslationModule = require(genericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local fFlagAbuseReportDensifyResolvedArraysModule = require(genericAbuseReporting.Flags.FFlagAbuseReportDensifyResolvedArrays)
local fFlagAbuseReportLinkOpenedAnalytics = sharedFlagsModule.FFlagAbuseReportLinkOpenedAnalytics
local linkOpenedSource = analyticsServiceModule.LinkOpenedSource

return reactModule.memo(function(p0) --[[ line: 35 | named "Footer" ]]
	-- upvalues: useDefaultTags (ref), fFlagAbuseReportDensifyResolvedArraysModule (ref), reactModule (ref), textWithTranslationModule (ref), fFlagAbuseReportLinkOpenedAnalytics (ref), linkOpenedSource (ref), view (ref)
	local var7 = useDefaultTags(p0.additionalTag, "col gap-small size-full-0 auto-y")
	
	if not p0.footerItems or fFlagAbuseReportDensifyResolvedArraysModule and #p0.footerItems == 0 then
		return nil
	end
	local t = {}
	
	for i, v in ipairs(p0.footerItems) do
		table.insert(t, reactModule.createElement(textWithTranslationModule, {
			tag = "auto-xy text-body-small",
			input = v.label,
			linkId = if fFlagAbuseReportLinkOpenedAnalytics then v.id else nil,
			linkSource = if fFlagAbuseReportLinkOpenedAnalytics then linkOpenedSource.Footer else nil,
			layoutOrder = if fFlagAbuseReportDensifyResolvedArraysModule then i else nil,
			LayoutOrder = if fFlagAbuseReportDensifyResolvedArraysModule then nil else i
		}))
	end
	return reactModule.createElement(view, {
		padding = p0.padding,
		tag = var7,
		LayoutOrder = p0.layoutOrder
	}, t)
end)