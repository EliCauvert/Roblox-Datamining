local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local TextArea = FoundationModule.TextArea
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local EyebrowModule = require(GenericAbuseReporting.BeduiV2.Components.Eyebrow)
local FooterModule = require(GenericAbuseReporting.BeduiV2.Components.Footer)
local GetCodePointLengthModule = require(GenericAbuseReporting.BeduiV2.Utils.getCodePointLength)
local TranslateModule = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)
local UseArTranslationFunction = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local TelemetryEventType = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService).TelemetryEventType
local UseAbuseReportAnalyticsFunction = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).useAbuseReportAnalytics
local UseLayoutSlotsFunction = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots).useLayoutSlots
local FFlagAddReportCharacterLimit = SharedFlagsModule.FFlagAddReportCharacterLimit
local FFlagAbuseReportMenuV2 = SharedFlagsModule.FFlagAbuseReportMenuV2
local AbuseReportCommentNodeAnalyticsIntegration = game:DefineFastFlag("AbuseReportCommentNodeAnalyticsIntegration", false)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), FFlagAddReportCharacterLimit (copy), TranslateModule (copy), UseArTranslationFunction (copy), AbuseReportCommentNodeAnalyticsIntegration (copy), UseAbuseReportAnalyticsFunction (copy), UseLayoutSlotsFunction (copy), FFlagAbuseReportMenuV2 (copy), GetCodePointLengthModule (copy), TelemetryEventType (copy), EyebrowModule (copy), TextArea (copy), FooterModule (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(p1.initialValue or "")
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local MergeTranslationParams = if FFlagAddReportCharacterLimit then TranslateModule.mergeTranslationParams else nil
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	local SendEvent = if AbuseReportCommentNodeAnalyticsIntegration then UseAbuseReportAnalyticsFunction().sendEvent else nil
	local UseRefResult = ReactModule.useRef(false)
	local UseLayoutSlotsResult = UseLayoutSlotsFunction()
	local Body = UseLayoutSlotsResult.Body
	local Actions = UseLayoutSlotsResult.Actions
	local Layout = if FFlagAbuseReportMenuV2 then UseLayoutSlotsResult.Layout else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: AbuseReportCommentNodeAnalyticsIntegration (upval), SendEvent (copy), TelemetryEventType (upval), GetCodePointLengthModule (upval), UseBindingResult (copy), p1 (copy), UseRefResult (copy)
		if AbuseReportCommentNodeAnalyticsIntegration and SendEvent then
			SendEvent({
				sub_event_type = TelemetryEventType.CommentInput,
				comment_input_detail = {
					comment_length = GetCodePointLengthModule(UseBindingResult:getValue()),
					has_initial_value = p1.initialValue ~= nil and p1.initialValue ~= "",
					did_modify_initial = p1.initialValue ~= nil and UseBindingResult:getValue() ~= p1.initialValue,
					hit_character_limit = UseRefResult.current,
					max_length = p1.maxLength or 0
				}
			})
		end
		if p1.onNext then
			p1.onNext(UseBindingResult:getValue())
		end
	end, {
		UseBindingResult,
		p1.onNext,
		if AbuseReportCommentNodeAnalyticsIntegration then SendEvent else nil,
		if AbuseReportCommentNodeAnalyticsIntegration then p1.initialValue else nil,
		if AbuseReportCommentNodeAnalyticsIntegration then p1.maxLength else nil
	})
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), MergeTranslationParams (copy), TranslateIntoStringFunction (copy), GetCodePointLengthModule (upval)
		return if p1.helperText and p1.maxLength and MergeTranslationParams then TranslateIntoStringFunction(MergeTranslationParams(p1.helperText, {
			currentLength = tostring(GetCodePointLengthModule(p2)),
			maxLength = tostring(p1.maxLength)
		})) elseif p1.helperText then TranslateIntoStringFunction(p1.helperText) else nil
	end, { p1.helperText, p1.maxLength })
	local config = {
		Eyebrow = ReactModule.createElement(EyebrowModule, { layoutOrder = 0, eyebrow = p1.eyebrow }),
		Title = ReactModule.createElement(UseLayoutSlotsResult.Title, {
			layoutOrder = 1,
			input = p1.title,
			subtitle = p1.subtitle,
			tag = if FFlagAbuseReportMenuV2 then nil else "padding-bottom-small"
		}),
		TextArea = ReactModule.createElement(TextArea, {
			numLines = 6,
			LayoutOrder = 2,
			text = UseBindingResult,
			hint = if FFlagAddReportCharacterLimit and p1.helperText then UseBindingResult:map(function(p2)
				-- upvalues: UseResult1 (copy)
				return UseResult1(p2)
			end) else nil,
			onChanged = ReactModule.useCallback(function(p2)
				-- upvalues: UseBindingResult2 (copy), FFlagAddReportCharacterLimit (upval), p1 (copy), GetCodePointLengthModule (upval), UseStateResult2 (copy), AbuseReportCommentNodeAnalyticsIntegration (upval), UseRefResult (copy)
				UseBindingResult2(p2)
				
				if FFlagAddReportCharacterLimit and p1.maxLength then
					local IsMaxLengthBelow = p1.maxLength < GetCodePointLengthModule(p2)
					UseStateResult2(IsMaxLengthBelow)
					
					if AbuseReportCommentNodeAnalyticsIntegration and IsMaxLengthBelow then
						UseRefResult.current = true
					end
				end
			end, { p1.maxLength }),
			label = if p1.textAreaLabel then TranslateIntoStringFunction(p1.textAreaLabel) else "",
			placeholder = TranslateIntoStringFunction(p1.placeholder or ""),
			hasError = if FFlagAddReportCharacterLimit then UseStateResult else false,
			width = UDim.new(1, 0)
		}),
		Footer = if FFlagAbuseReportMenuV2 and p1.footerItems then ReactModule.createElement(FooterModule, {
			additionalTag = "padding-top-medium",
			layoutOrder = 3,
			footerItems = p1.footerItems
		}) else nil
	}
	local Element = if p1.onNext then ReactModule.createElement(Button, {
		text = TranslateIntoStringFunction(p1.nextButtonText or ""),
		variant = ButtonVariant.Emphasis,
		fillBehavior = FillBehavior.Fill,
		isLoading = p1.isSubmitting,
		isDisabled = if FFlagAddReportCharacterLimit then p1.isSubmitting or UseStateResult else p1.isSubmitting,
		onActivated = UseResult
	}) else nil
	
	return if FFlagAbuseReportMenuV2 then ReactModule.createElement(Layout, {
		body = ReactModule.createElement(ReactModule.Fragment, nil, config),
		actions = Element
	}) else ReactModule.createElement(ReactModule.Fragment, nil, {
		Content = ReactModule.createElement(Body, nil, config),
		Actions = if Element then ReactModule.createElement(Actions, nil, { Button = Element }) else nil
	})
end)