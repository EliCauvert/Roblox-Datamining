local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local textArea = foundationModule.TextArea
local abuseReportAnalyticsContextModule = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local eyebrowModule = require(genericAbuseReporting.BeduiV2.Components.Eyebrow)
local footerModule = require(genericAbuseReporting.BeduiV2.Components.Footer)
local getCodePointLengthModule = require(genericAbuseReporting.BeduiV2.Utils.getCodePointLength)
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local translateModule = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local useArTranslation = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local useAbuseReportAnalytics = abuseReportAnalyticsContextModule.useAbuseReportAnalytics
local useLayoutSlots = layoutSlotsModule.useLayoutSlots
local fFlagAddReportCharacterLimit = sharedFlagsModule.FFlagAddReportCharacterLimit
local fFlagAbuseReportMenuV2 = sharedFlagsModule.FFlagAbuseReportMenuV2
local abuseReportCommentNodeAnalyticsIntegration = game:DefineFastFlag("AbuseReportCommentNodeAnalyticsIntegration", false)

return reactModule.memo(function(p0) --[[ line: 56 | named "CommentNode" ]]
	-- upvalues: reactModule (ref), fFlagAddReportCharacterLimit (ref), translateModule (ref), useArTranslation (ref), abuseReportCommentNodeAnalyticsIntegration (ref), useAbuseReportAnalytics (ref), useLayoutSlots (ref), fFlagAbuseReportMenuV2 (ref), getCodePointLengthModule (ref), telemetryEventType (ref), eyebrowModule (ref), textArea (ref), footerModule (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var12, var13 = reactModule.useBinding(p0.initialValue or "")
	local var14, var15 = reactModule.useState(false)
	local var16 = if fFlagAddReportCharacterLimit then translateModule.mergeTranslationParams else nil
	local translateIntoString = useArTranslation().translateIntoString
	local var17 = if abuseReportCommentNodeAnalyticsIntegration then useAbuseReportAnalytics().sendEvent else nil
	local var18 = reactModule.useRef(false)
	local var19 = useLayoutSlots()
	local body = var19.Body
	local actions = var19.Actions
	local title = var19.Title
	local var20 = if fFlagAbuseReportMenuV2 then var19.Layout else nil
	local var21 = reactModule.useCallback(function(p1) --[[ line: 75 ]]
		-- upvalues: var13 (ref), fFlagAddReportCharacterLimit (copy), p0 (ref), getCodePointLengthModule (copy), var15 (ref), abuseReportCommentNodeAnalyticsIntegration (copy), var18 (ref)
		var13(p1)
		
		if fFlagAddReportCharacterLimit and p0.maxLength then
			local var26 = p0.maxLength < getCodePointLengthModule(p1)
			var15(var26)
			
			if abuseReportCommentNodeAnalyticsIntegration and var26 then
				var18.current = true
			end
		end
	end, { p0.maxLength })
	local var22 = reactModule.useCallback(function() --[[ line: 87 ]]
		-- upvalues: abuseReportCommentNodeAnalyticsIntegration (copy), var17 (ref), telemetryEventType (copy), getCodePointLengthModule (copy), var12 (ref), p0 (ref), var18 (ref)
		if abuseReportCommentNodeAnalyticsIntegration and var17 then
			var17({
				sub_event_type = telemetryEventType.CommentInput,
				comment_input_detail = {
					comment_length = getCodePointLengthModule(var12:getValue()),
					has_initial_value = p0.initialValue ~= nil and p0.initialValue ~= "",
					did_modify_initial = p0.initialValue ~= nil and var12:getValue() ~= p0.initialValue,
					hit_character_limit = var18.current,
					max_length = p0.maxLength or 0
				}
			})
		end
		if p0.onNext then
			p0.onNext(var12:getValue())
		end
	end, {
		var12,
		p0.onNext,
		if abuseReportCommentNodeAnalyticsIntegration then var17 else nil,
		if abuseReportCommentNodeAnalyticsIntegration then p0.initialValue else nil,
		if abuseReportCommentNodeAnalyticsIntegration then p0.maxLength else nil
	})
	local var23 = reactModule.useCallback(function(p2) --[[ line: 118 ]]
		-- upvalues: p0 (ref), var16 (ref), translateIntoString (ref), getCodePointLengthModule (copy)
		return if p0.helperText and p0.maxLength and var16 then translateIntoString(var16(p0.helperText, {
			currentLength = tostring(getCodePointLengthModule(p2)),
			maxLength = tostring(p0.maxLength)
		})) elseif p0.helperText then translateIntoString(p0.helperText) else nil
	end, { p0.helperText, p0.maxLength })
	local t = {
		Eyebrow = reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = p0.eyebrow }),
		Title = reactModule.createElement(title, {
			layoutOrder = 1,
			input = p0.title,
			subtitle = p0.subtitle,
			tag = if fFlagAbuseReportMenuV2 then nil else "padding-bottom-small"
		}),
		TextArea = reactModule.createElement(textArea, {
			numLines = 6,
			LayoutOrder = 2,
			text = var12,
			hint = if fFlagAddReportCharacterLimit and p0.helperText then var12:map(function(p3) --[[ line: 145 ]]
				-- upvalues: var23 (ref)
				return var23(p3)
			end) else nil,
			onChanged = var21,
			label = if p0.textAreaLabel then translateIntoString(p0.textAreaLabel) else "",
			placeholder = translateIntoString(p0.placeholder or ""),
			hasError = if fFlagAddReportCharacterLimit then var14 else false,
			width = UDim.new(1, 0)
		}),
		Footer = if fFlagAbuseReportMenuV2 and p0.footerItems then reactModule.createElement(footerModule, {
			additionalTag = "padding-top-medium",
			layoutOrder = 3,
			footerItems = p0.footerItems
		}) else nil
	}
	local var25 = if p0.onNext then reactModule.createElement(button, {
		text = translateIntoString(p0.nextButtonText or ""),
		variant = buttonVariant.Emphasis,
		fillBehavior = fillBehavior.Fill,
		isLoading = p0.isSubmitting,
		isDisabled = if fFlagAddReportCharacterLimit then p0.isSubmitting or var14 else p0.isSubmitting,
		onActivated = var22
	}) else nil
	
	return if fFlagAbuseReportMenuV2 then reactModule.createElement(var20, {
		body = reactModule.createElement(reactModule.Fragment, nil, t),
		actions = var25
	}) else reactModule.createElement(reactModule.Fragment, nil, {
		Content = reactModule.createElement(body, nil, t),
		Actions = if var25 then reactModule.createElement(actions, nil, { Button = var25 }) else nil
	})
end)