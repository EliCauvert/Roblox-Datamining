local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
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

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), translateModule (ref), useArTranslation (ref), useAbuseReportAnalytics (ref), useLayoutSlots (ref), getCodePointLengthModule (ref), telemetryEventType (ref), eyebrowModule (ref), textArea (ref), footerModule (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var1, var2 = reactModule.useBinding(p1.initialValue or "")
	local var3, var4 = reactModule.useState(false)
	local mergeTranslationParams = translateModule.mergeTranslationParams
	local translateIntoString = useArTranslation().translateIntoString
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var5 = reactModule.useRef(false)
	local var6 = useLayoutSlots()
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), mergeTranslationParams (ref), translateIntoString (ref), getCodePointLengthModule (copy)
		return if p1.helperText and p1.maxLength and mergeTranslationParams then translateIntoString(mergeTranslationParams(p1.helperText, {
			currentLength = tostring(getCodePointLengthModule(p2)),
			maxLength = tostring(p1.maxLength)
		})) elseif p1.helperText then translateIntoString(p1.helperText) else nil
	end, { p1.helperText, p1.maxLength })
	
	return reactModule.createElement(var6.Layout, {
		body = reactModule.createElement(reactModule.Fragment, nil, {
			Eyebrow = reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = p1.eyebrow }),
			Title = reactModule.createElement(var6.Title, {
				layoutOrder = 1,
				input = p1.title,
				subtitle = p1.subtitle
			}),
			TextArea = reactModule.createElement(textArea, {
				numLines = 6,
				LayoutOrder = 2,
				text = var1,
				hint = if p1.helperText then var1:map(function(p2)
					-- upvalues: var7 (ref)
					return var7(p2)
				end) else nil,
				onChanged = reactModule.useCallback(function(p2)
					-- upvalues: var2 (ref), p1 (ref), getCodePointLengthModule (copy), var4 (ref), var5 (ref)
					var2(p2)
					
					if p1.maxLength then
						local var8 = p1.maxLength < getCodePointLengthModule(p2)
						var4(var8)
						
						if var8 then
							var5.current = true
						end
					end
				end, { p1.maxLength }),
				label = if p1.textAreaLabel then translateIntoString(p1.textAreaLabel) else "",
				placeholder = translateIntoString(p1.placeholder or ""),
				hasError = var3,
				width = UDim.new(1, 0)
			}),
			Footer = if p1.footerItems then reactModule.createElement(footerModule, {
				additionalTag = "padding-top-medium",
				layoutOrder = 3,
				footerItems = p1.footerItems
			}) else nil
		}),
		actions = if p1.onNext then reactModule.createElement(button, {
			text = translateIntoString(p1.nextButtonText or ""),
			variant = buttonVariant.Emphasis,
			fillBehavior = fillBehavior.Fill,
			isLoading = p1.isSubmitting,
			isDisabled = p1.isSubmitting or var3,
			onActivated = reactModule.useCallback(function()
				-- upvalues: sendEvent (ref), telemetryEventType (copy), getCodePointLengthModule (copy), var1 (ref), p1 (ref), var5 (ref)
				sendEvent({
					sub_event_type = telemetryEventType.CommentInput,
					comment_input_detail = {
						comment_length = getCodePointLengthModule(var1:getValue()),
						has_initial_value = p1.initialValue ~= nil and p1.initialValue ~= "",
						did_modify_initial = p1.initialValue ~= nil and var1:getValue() ~= p1.initialValue,
						hit_character_limit = var5.current,
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
		}) else nil
	})
end)