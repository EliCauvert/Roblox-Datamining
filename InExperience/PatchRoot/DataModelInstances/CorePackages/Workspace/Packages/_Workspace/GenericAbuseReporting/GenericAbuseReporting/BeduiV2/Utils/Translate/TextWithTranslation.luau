local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local controlState = foundationModule.Enums.ControlState
local text = foundationModule.Text
local abuseReportAnalyticsContextModule = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local useOpenLinkModule = require(genericAbuseReporting.BeduiV2.Hooks.useOpenLink)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local useArTranslation = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local addFontStyleToTextWithTranslation = game:DefineFastFlag("AddFontStyleToTextWithTranslation", false)
local addUnderlineToLinksInTextWithTranslation = game:DefineFastFlag("AddUnderlineToLinksInTextWithTranslation", false)
local fFlagAbuseReportLinkOpenedAnalytics = sharedFlagsModule.FFlagAbuseReportLinkOpenedAnalytics
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local useOptionalAbuseReportAnalytics = abuseReportAnalyticsContextModule.useOptionalAbuseReportAnalytics

return reactModule.memo(function(p0)
	-- upvalues: useArTranslation (ref), useOpenLinkModule (ref), reactModule (ref), fFlagAbuseReportLinkOpenedAnalytics (ref), useOptionalAbuseReportAnalytics (ref), telemetryEventType (ref), addUnderlineToLinksInTextWithTranslation (ref), controlState (ref), text (ref), addFontStyleToTextWithTranslation (ref)
	local translateIntoString = useArTranslation().translateIntoString
	local translateIntoRichTextString = useArTranslation().translateIntoRichTextString
	local var9 = useOpenLinkModule()
	local var10, var11 = reactModule.useState(false)
	local var12 = nil
	
	if fFlagAbuseReportLinkOpenedAnalytics then
		local var13 = useOptionalAbuseReportAnalytics()
		var12 = if var13 then var13.sendEvent else nil
	end
	local var14, var15 = reactModule.useMemo(function()
		-- upvalues: translateIntoRichTextString (ref), p0 (ref)
		return translateIntoRichTextString(p0.input)
	end, { p0.input, translateIntoRichTextString })
	
	return reactModule.createElement(text, {
		RichText = true,
		TextWrapped = true,
		Text = if var10 then `<u>{var14}</u>` else var14,
		TextXAlignment = Enum.TextXAlignment.Left,
		fontStyle = if addFontStyleToTextWithTranslation then p0.fontStyle else nil,
		tag = p0.tag,
		LayoutOrder = p0.layoutOrder,
		onActivated = if var15 ~= nil then nil else reactModule.useCallback(function()
			-- upvalues: var15 (ref), fFlagAbuseReportLinkOpenedAnalytics (copy), var12 (write), telemetryEventType (copy), p0 (ref), var9 (ref), translateIntoString (ref)
			local var16 = if var15 ~= nil then var15.href else nil
			
			if fFlagAbuseReportLinkOpenedAnalytics and var12 and var16 then
				var12({
					sub_event_type = telemetryEventType.LinkOpened,
					link_detail = {
						href = var16,
						link_id = p0.linkId,
						source = p0.linkSource
					}
				})
			end
			var9(translateIntoString(p0.input), var16)
		end, {
			var15, p0.input, var9, translateIntoString,
			if fFlagAbuseReportLinkOpenedAnalytics then var12 else nil,
			if fFlagAbuseReportLinkOpenedAnalytics then p0.linkId else nil,
			if fFlagAbuseReportLinkOpenedAnalytics then p0.linkSource else nil
		}),
		onStateChanged = if addUnderlineToLinksInTextWithTranslation and var15 ~= nil then if addUnderlineToLinksInTextWithTranslation then reactModule.useCallback(function(p1)
			-- upvalues: controlState (copy), var11 (ref)
			if p1 == controlState.Hover then
				var11(true)
				
				return
			end
			var11(false)
		end, {}) else nil else nil
	})
end)