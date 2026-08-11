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

return reactModule.memo(function(p0) --[[ line: 54 | named "CommentNode" ]]
	-- upvalues: reactModule (ref), fFlagAddReportCharacterLimit (ref), translateModule (ref), useArTranslation (ref), useAbuseReportAnalytics (ref), useLayoutSlots (ref), fFlagAbuseReportMenuV2 (ref), getCodePointLengthModule (ref), telemetryEventType (ref), eyebrowModule (ref), textArea (ref), footerModule (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var11, var12 = reactModule.useBinding(p0.initialValue or "")
	local var13, var14 = reactModule.useState(false)
	local var15 = if fFlagAddReportCharacterLimit then translateModule.mergeTranslationParams else nil
	local translateIntoString = useArTranslation().translateIntoString
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var16 = reactModule.useRef(false)
	local var17 = useLayoutSlots()
	local body = var17.Body
	local actions = var17.Actions
	local title = var17.Title
	local var18 = if fFlagAbuseReportMenuV2 then var17.Layout else nil
	local var19 = reactModule.useCallback(function(p1) --[[ line: 71 ]]
		-- upvalues: var12 (ref), fFlagAddReportCharacterLimit (copy), p0 (ref), getCodePointLengthModule (copy), var14 (ref), var16 (ref)
		var12(p1)
		
		if fFlagAddReportCharacterLimit and p0.maxLength then
			local var24 = p0.maxLength < getCodePointLengthModule(p1)
			var14(var24)
			
			if var24 then
				var16.current = true
			end
		end
	end, { p0.maxLength })
	local var20 = reactModule.useCallback(function() --[[ line: 83 ]]
		-- upvalues: sendEvent (ref), telemetryEventType (copy), getCodePointLengthModule (copy), var11 (ref), p0 (ref), var16 (ref)
		sendEvent({
			sub_event_type = telemetryEventType.CommentInput,
			comment_input_detail = {
				comment_length = getCodePointLengthModule(var11:getValue()),
				has_initial_value = p0.initialValue ~= nil and p0.initialValue ~= "",
				did_modify_initial = p0.initialValue ~= nil and var11:getValue() ~= p0.initialValue,
				hit_character_limit = var16.current,
				max_length = p0.maxLength or 0
			}
		})
		
		if p0.onNext then
			p0.onNext(var11:getValue())
		end
	end, {
		var11,
		p0.onNext,
		sendEvent,
		p0.initialValue,
		p0.maxLength
	})
	local var21 = reactModule.useCallback(function(p2) --[[ line: 112 ]]
		-- upvalues: p0 (ref), var15 (ref), translateIntoString (ref), getCodePointLengthModule (copy)
		return if p0.helperText and p0.maxLength and var15 then translateIntoString(var15(p0.helperText, {
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
			text = var11,
			hint = if fFlagAddReportCharacterLimit and p0.helperText then var11:map(function(p3) --[[ line: 139 ]]
				-- upvalues: var21 (ref)
				return var21(p3)
			end) else nil,
			onChanged = var19,
			label = if p0.textAreaLabel then translateIntoString(p0.textAreaLabel) else "",
			placeholder = translateIntoString(p0.placeholder or ""),
			hasError = if fFlagAddReportCharacterLimit then var13 else false,
			width = UDim.new(1, 0)
		}),
		Footer = if fFlagAbuseReportMenuV2 and p0.footerItems then reactModule.createElement(footerModule, {
			additionalTag = "padding-top-medium",
			layoutOrder = 3,
			footerItems = p0.footerItems
		}) else nil
	}
	local var23 = if p0.onNext then reactModule.createElement(button, {
		text = translateIntoString(p0.nextButtonText or ""),
		variant = buttonVariant.Emphasis,
		fillBehavior = fillBehavior.Fill,
		isLoading = p0.isSubmitting,
		isDisabled = if fFlagAddReportCharacterLimit then p0.isSubmitting or var13 else p0.isSubmitting,
		onActivated = var20
	}) else nil
	
	return if fFlagAbuseReportMenuV2 then reactModule.createElement(var18, {
		body = reactModule.createElement(reactModule.Fragment, nil, t),
		actions = var23
	}) else reactModule.createElement(reactModule.Fragment, nil, {
		Content = reactModule.createElement(body, nil, t),
		Actions = if var23 then reactModule.createElement(actions, nil, { Button = var23 }) else nil
	})
end)