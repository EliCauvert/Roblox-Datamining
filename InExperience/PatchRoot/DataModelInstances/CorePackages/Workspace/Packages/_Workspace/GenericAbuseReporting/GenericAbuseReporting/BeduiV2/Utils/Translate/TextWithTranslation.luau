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
local fFlagAbuseReportLinkOpenedAnalytics = sharedFlagsModule.FFlagAbuseReportLinkOpenedAnalytics
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local useOptionalAbuseReportAnalytics = abuseReportAnalyticsContextModule.useOptionalAbuseReportAnalytics

return reactModule.memo(function(p1)
	-- upvalues: useArTranslation (ref), useOpenLinkModule (ref), reactModule (ref), fFlagAbuseReportLinkOpenedAnalytics (ref), useOptionalAbuseReportAnalytics (ref), telemetryEventType (ref), controlState (ref), text (ref), addFontStyleToTextWithTranslation (ref)
	local translateIntoString = useArTranslation().translateIntoString
	local translateIntoRichTextString = useArTranslation().translateIntoRichTextString
	local var1 = useOpenLinkModule()
	local var2, var3 = reactModule.useState(false)
	local var4 = nil
	
	if fFlagAbuseReportLinkOpenedAnalytics then
		local var5 = useOptionalAbuseReportAnalytics()
		var4 = if var5 then var5.sendEvent else nil
	end
	local var6, var7 = reactModule.useMemo(function()
		-- upvalues: translateIntoRichTextString (ref), p1 (ref)
		return translateIntoRichTextString(p1.input)
	end, { p1.input, translateIntoRichTextString })
	
	return reactModule.createElement(text, {
		RichText = true,
		TextWrapped = true,
		Text = if var2 then `<u>{var6}</u>` else var6,
		TextXAlignment = Enum.TextXAlignment.Left,
		fontStyle = if addFontStyleToTextWithTranslation then p1.fontStyle else nil,
		tag = p1.tag,
		LayoutOrder = p1.layoutOrder,
		onActivated = if var7 ~= nil then nil else reactModule.useCallback(function()
			-- upvalues: var7 (ref), fFlagAbuseReportLinkOpenedAnalytics (copy), var4 (write), telemetryEventType (copy), p1 (ref), var1 (ref), translateIntoString (ref)
			local var8 = if var7 ~= nil then var7.href else nil
			
			if fFlagAbuseReportLinkOpenedAnalytics and var4 and var8 then
				var4({
					sub_event_type = telemetryEventType.LinkOpened,
					link_detail = {
						href = var8,
						link_id = p1.linkId,
						source = p1.linkSource
					}
				})
			end
			var1(translateIntoString(p1.input), var8)
		end, {
			var7, p1.input, var1, translateIntoString,
			if fFlagAbuseReportLinkOpenedAnalytics then var4 else nil,
			if fFlagAbuseReportLinkOpenedAnalytics then p1.linkId else nil,
			if fFlagAbuseReportLinkOpenedAnalytics then p1.linkSource else nil
		}),
		onStateChanged = if var7 ~= nil then nil else reactModule.useCallback(function(p2)
			-- upvalues: controlState (copy), var3 (ref)
			if p2 == controlState.Hover then
				var3(true)
				
				return
			end
			var3(false)
		end, {})
	})
end)