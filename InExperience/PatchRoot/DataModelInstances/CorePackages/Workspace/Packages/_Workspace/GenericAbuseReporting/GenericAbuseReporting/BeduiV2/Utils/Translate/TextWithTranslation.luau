local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ControlState = FoundationModule.Enums.ControlState
local Text = FoundationModule.Text
local UseOpenLinkModule = require(GenericAbuseReporting.BeduiV2.Hooks.useOpenLink)
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)
local UseArTranslationFunction = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local AddFontStyleToTextWithTranslation = game:DefineFastFlag("AddFontStyleToTextWithTranslation", false)
local TelemetryEventType = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService).TelemetryEventType
local UseOptionalAbuseReportAnalyticsFunction = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).useOptionalAbuseReportAnalytics

return ReactModule.memo(function(p1) --[[ Line: 43 | Named "TextWithTranslation" ]]
	-- upvalues: UseArTranslationFunction (copy), UseOpenLinkModule (copy), ReactModule (copy), UseOptionalAbuseReportAnalyticsFunction (copy), TelemetryEventType (copy), ControlState (copy), Text (copy), AddFontStyleToTextWithTranslation (copy)
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	local TranslateIntoRichTextStringFunction = UseArTranslationFunction().translateIntoRichTextString
	local UseOpenLinkModuleResult = UseOpenLinkModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseOptionalAbuseReportAnalyticsResult = UseOptionalAbuseReportAnalyticsFunction()
	local SendEvent = if UseOptionalAbuseReportAnalyticsResult then UseOptionalAbuseReportAnalyticsResult.sendEvent else nil
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 52 ]]
		-- upvalues: TranslateIntoRichTextStringFunction (copy), p1 (copy)
		return TranslateIntoRichTextStringFunction(p1.input)
	end, { p1.input, TranslateIntoRichTextStringFunction })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 57 ]]
		-- upvalues: UseMemoResult2 (copy), SendEvent (copy), TelemetryEventType (upval), p1 (copy), UseOpenLinkModuleResult (copy), TranslateIntoStringFunction (copy)
		local Href = if UseMemoResult2 ~= nil then UseMemoResult2.href else nil
		
		if SendEvent and Href then
			SendEvent({
				sub_event_type = TelemetryEventType.LinkOpened,
				link_detail = { href = Href, link_id = p1.linkId, source = p1.linkSource }
			})
		end
		UseOpenLinkModuleResult(TranslateIntoStringFunction(p1.input), Href)
	end, {
		UseMemoResult2, p1.input, UseOpenLinkModuleResult, TranslateIntoStringFunction,
		SendEvent, p1.linkId, p1.linkSource
	})
	local UseResult1 = ReactModule.useCallback(function(Hover) --[[ Line: 85 ]]
		-- upvalues: ControlState (upval), UseStateResult2 (copy)
		if Hover == ControlState.Hover then
			UseStateResult2(true)
			
			return
		else
			UseStateResult2(false)
		end
	end, {})
	
	return ReactModule.createElement(Text, {
		RichText = true,
		TextWrapped = true,
		Text = if UseStateResult then `<u>{UseMemoResult}</u>` else UseMemoResult,
		TextXAlignment = Enum.TextXAlignment.Left,
		fontStyle = if AddFontStyleToTextWithTranslation then p1.fontStyle else nil,
		tag = p1.tag,
		LayoutOrder = p1.layoutOrder,
		onActivated = if UseMemoResult2 == nil then nil else UseResult,
		onStateChanged = if UseMemoResult2 == nil then nil else UseResult1
	})
end)