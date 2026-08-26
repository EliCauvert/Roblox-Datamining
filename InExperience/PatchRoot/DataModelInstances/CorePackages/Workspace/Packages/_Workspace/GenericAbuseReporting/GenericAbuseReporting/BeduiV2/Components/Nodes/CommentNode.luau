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

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), fFlagAddReportCharacterLimit (ref), translateModule (ref), useArTranslation (ref), useAbuseReportAnalytics (ref), useLayoutSlots (ref), fFlagAbuseReportMenuV2 (ref), getCodePointLengthModule (ref), telemetryEventType (ref), eyebrowModule (ref), textArea (ref), footerModule (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var1, var2 = reactModule.useBinding(p1.initialValue or "")
	local var3, var4 = reactModule.useState(false)
	local var5 = if fFlagAddReportCharacterLimit then translateModule.mergeTranslationParams else nil
	local translateIntoString = useArTranslation().translateIntoString
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var6 = reactModule.useRef(false)
	local var7 = useLayoutSlots()
	local body = var7.Body
	local actions = var7.Actions
	local title = var7.Title
	local var8 = if fFlagAbuseReportMenuV2 then var7.Layout else nil
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), fFlagAddReportCharacterLimit (copy), p1 (ref), getCodePointLengthModule (copy), var4 (ref), var6 (ref)
		var2(p2)
		
		if fFlagAddReportCharacterLimit and p1.maxLength then
			local var10 = p1.maxLength < getCodePointLengthModule(p2)
			var4(var10)
			
			if var10 then
				var6.current = true
			end
		end
	end, { p1.maxLength })
	local var10 = reactModule.useCallback(function()
		-- upvalues: sendEvent (ref), telemetryEventType (copy), getCodePointLengthModule (copy), var1 (ref), p1 (ref), var6 (ref)
		sendEvent({
			sub_event_type = telemetryEventType.CommentInput,
			comment_input_detail = {
				comment_length = getCodePointLengthModule(var1:getValue()),
				has_initial_value = p1.initialValue ~= nil and p1.initialValue ~= "",
				did_modify_initial = p1.initialValue ~= nil and var1:getValue() ~= p1.initialValue,
				hit_character_limit = var6.current,
				max_length = p1.maxLength or 0
			}
		})
		
		if p1.onNext then
			p1.onNext(var1:getValue())
		end
	end, {
		var1,
		p1.onNext,
		sendEvent,
		p1.initialValue,
		p1.maxLength
	})
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var5 (ref), translateIntoString (ref), getCodePointLengthModule (copy)
		return if p1.helperText and p1.maxLength and var5 then translateIntoString(var5(p1.helperText, {
			currentLength = tostring(getCodePointLengthModule(p2)),
			maxLength = tostring(p1.maxLength)
		})) elseif p1.helperText then translateIntoString(p1.helperText) else nil
	end, { p1.helperText, p1.maxLength })
	local t = {
		Eyebrow = reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = p1.eyebrow }),
		Title = reactModule.createElement(title, {
			layoutOrder = 1,
			input = p1.title,
			subtitle = p1.subtitle,
			tag = if fFlagAbuseReportMenuV2 then nil else "padding-bottom-small"
		}),
		TextArea = reactModule.createElement(textArea, {
			numLines = 6,
			LayoutOrder = 2,
			text = var1,
			hint = if fFlagAddReportCharacterLimit and p1.helperText then var1:map(function(p2)
				-- upvalues: var11 (ref)
				return var11(p2)
			end) else nil,
			onChanged = var9,
			label = if p1.textAreaLabel then translateIntoString(p1.textAreaLabel) else "",
			placeholder = translateIntoString(p1.placeholder or ""),
			hasError = if fFlagAddReportCharacterLimit then var3 else false,
			width = UDim.new(1, 0)
		}),
		Footer = if fFlagAbuseReportMenuV2 and p1.footerItems then reactModule.createElement(footerModule, {
			additionalTag = "padding-top-medium",
			layoutOrder = 3,
			footerItems = p1.footerItems
		}) else nil
	}
	local var12 = if p1.onNext then reactModule.createElement(button, {
		text = translateIntoString(p1.nextButtonText or ""),
		variant = buttonVariant.Emphasis,
		fillBehavior = fillBehavior.Fill,
		isLoading = p1.isSubmitting,
		isDisabled = if fFlagAddReportCharacterLimit then p1.isSubmitting or var3 else p1.isSubmitting,
		onActivated = var10
	}) else nil
	
	return if fFlagAbuseReportMenuV2 then reactModule.createElement(var8, {
		body = reactModule.createElement(reactModule.Fragment, nil, t),
		actions = var12
	}) else reactModule.createElement(reactModule.Fragment, nil, {
		Content = reactModule.createElement(body, nil, t),
		Actions = if var12 then reactModule.createElement(actions, nil, { Button = var12 }) else nil
	})
end)