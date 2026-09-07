local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local sharedFlagsModule = require(parent.SharedFlags)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local toggle = foundationModule.Toggle
local view = foundationModule.View
local abuseReportAnalyticsContextModule = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local eyebrowModule = require(genericAbuseReporting.BeduiV2.Components.Eyebrow)
local footerModule = require(genericAbuseReporting.BeduiV2.Components.Footer)
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local textWithTranslationModule = require(genericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local useArTranslation = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local useOpenLinkModule = require(genericAbuseReporting.BeduiV2.Hooks.useOpenLink)
local userBlockModule = require(genericAbuseReporting.BeduiV2.Api.userBlock)
local blockUser = userBlockModule.blockUser
local formatHttpErrorMessageForAnalytics = analyticsServiceModule.formatHttpErrorMessageForAnalytics
local isBlockedUser = userBlockModule.isBlockedUser
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local unblockUser = userBlockModule.unblockUser
local useAbuseReportAnalytics = abuseReportAnalyticsContextModule.useAbuseReportAnalytics
local useLayoutSlots = layoutSlotsModule.useLayoutSlots
local fFlagAbuseReportImproveErrorEventsModule = require(genericAbuseReporting.Flags.FFlagAbuseReportImproveErrorEvents)
local fFlagSupportSubmissionOnAllReportNodes = sharedFlagsModule.FFlagSupportSubmissionOnAllReportNodes
local fFlagAbuseReportMenuV2 = sharedFlagsModule.FFlagAbuseReportMenuV2

local function useBlockToggle(p1)
	-- upvalues: reactModule (ref), useAbuseReportAnalytics (ref), useRoactService (ref), roactNetworking (ref), isBlockedUser (ref), telemetryEventType (ref), fFlagAbuseReportImproveErrorEventsModule (ref), formatHttpErrorMessageForAnalytics (ref), dashModule (ref), unblockUser (ref), blockUser (ref)
	local var1, var2 = reactModule.useState(if p1 then "Loading" else "Hidden")
	local var3, var4 = reactModule.useState(false)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var5 = useRoactService(roactNetworking)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), isBlockedUser (copy), var5 (ref), var2 (ref), sendEvent (ref), telemetryEventType (copy), fFlagAbuseReportImproveErrorEventsModule (copy), formatHttpErrorMessageForAnalytics (copy), dashModule (copy)
		if p1 and p1.userId then
			isBlockedUser(var5, p1.userId):andThen(function(p2)
				-- upvalues: var2 (copy)
				var2(if p2.responseBody then "Hidden" else "Visible")
			end):catch(function(p2)
				-- upvalues: var2 (copy), sendEvent (copy), telemetryEventType (copy), fFlagAbuseReportImproveErrorEventsModule (copy), formatHttpErrorMessageForAnalytics (copy), p1 (copy), dashModule (copy)
				var2("Hidden")
				sendEvent({
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = if fFlagAbuseReportImproveErrorEventsModule then formatHttpErrorMessageForAnalytics(`isBlockedUser failed for userId: {p1.userId}`, p2) else "isBlockedUser: " .. dashModule.pretty(p2, { depth = 10 })
					}
				})
			end)
			sendEvent({ sub_event_type = telemetryEventType.IsUserBlockAvailable })
			
			return
		end
		var2("Hidden")
	end, { p1 and p1.userId, sendEvent, var5 })
	
	return {
		blockToggleState = var1,
		handleBlockToggleChange = reactModule.useCallback(function()
			-- upvalues: p1 (ref), var3 (ref), unblockUser (copy), var5 (ref), var4 (ref), var2 (ref), sendEvent (ref), telemetryEventType (copy), fFlagAbuseReportImproveErrorEventsModule (copy), formatHttpErrorMessageForAnalytics (copy), dashModule (copy), blockUser (copy)
			if p1 == nil or p1.userId == nil then return end
			if var3 then
				unblockUser(var5, p1.userId):andThen(function()
					-- upvalues: var4 (copy)
					var4(false)
				end):catch(function(p2)
					-- upvalues: var2 (copy), sendEvent (copy), telemetryEventType (copy), fFlagAbuseReportImproveErrorEventsModule (copy), formatHttpErrorMessageForAnalytics (copy), p1 (copy), dashModule (copy)
					var2("Error")
					sendEvent({
						sub_event_type = telemetryEventType.Error,
						error_detail = {
							error_message = if fFlagAbuseReportImproveErrorEventsModule then formatHttpErrorMessageForAnalytics(`unblockUser failed for userId: {p1.userId}`, p2) else "unblockUser: " .. dashModule.pretty(p2, { depth = 10 })
						}
					})
				end)
				sendEvent({ sub_event_type = telemetryEventType.DidUnblockUser })
				
				return
			end
			blockUser(var5, p1.userId):andThen(function()
				-- upvalues: sendEvent (copy), telemetryEventType (copy), var4 (copy)
				sendEvent({ sub_event_type = telemetryEventType.DidBlockUser })
				var4(true)
			end):catch(function(p2)
				-- upvalues: var2 (copy), sendEvent (copy), telemetryEventType (copy), fFlagAbuseReportImproveErrorEventsModule (copy), formatHttpErrorMessageForAnalytics (copy), p1 (copy), dashModule (copy)
				var2("Error")
				sendEvent({
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = if fFlagAbuseReportImproveErrorEventsModule then formatHttpErrorMessageForAnalytics(`blockUser failed for userId: {p1.userId}`, p2) else "blockUser: " .. dashModule.pretty(p2, { depth = 10 })
					}
				})
			end)
		end, { sendEvent, var5, p1 and p1.userId, var3 }),
		isBlocked = var3
	}
end

return reactModule.memo(function(p2)
	-- upvalues: useArTranslation (ref), useOpenLinkModule (ref), useAbuseReportAnalytics (ref), useBlockToggle (ref), useLayoutSlots (ref), fFlagAbuseReportMenuV2 (ref), reactModule (ref), telemetryEventType (ref), eyebrowModule (ref), textWithTranslationModule (ref), view (ref), toggle (ref), button (ref), buttonVariant (ref), footerModule (ref), fillBehavior (ref), fFlagSupportSubmissionOnAllReportNodes (ref)
	local var6
	local translateIntoString = useArTranslation().translateIntoString
	local var7 = useOpenLinkModule()
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var8 = useBlockToggle(p2.blockToggle)
	local blockToggleState = var8.blockToggleState
	local handleBlockToggleChange = var8.handleBlockToggleChange
	local isBlocked = var8.isBlocked
	local var9 = useLayoutSlots()
	local body = var9.Body
	local actions = var9.Actions
	local title = var9.Title
	local var10 = if fFlagAbuseReportMenuV2 then var9.Layout else nil
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), sendEvent (ref), telemetryEventType (copy)
		if p2.helpline and p2.helpline.href then
			sendEvent({ sub_event_type = telemetryEventType.HelplineShown })
		end
	end, { p2.helpline and p2.helpline.href, sendEvent })
	local var11 = reactModule.useCallback(function()
		-- upvalues: p2 (ref)
		if p2.onNext then
			p2.onNext()
		end
	end, { p2.onNext })
	local var12 = reactModule.useCallback(function()
		-- upvalues: p2 (ref), var7 (ref), translateIntoString (ref), sendEvent (ref), telemetryEventType (copy)
		if p2.helpline and p2.helpline.href then
			var7(translateIntoString(p2.helpline.heading or ""), p2.helpline.href)
			sendEvent({ sub_event_type = telemetryEventType.HelplineOpened })
		end
	end, {
		p2.helpline and p2.helpline.href,
		var7,
		translateIntoString,
		p2.helpline and p2.helpline.heading,
		sendEvent
	})
	local t = {
		Eyebrow = reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = p2.eyebrow }),
		Title = reactModule.createElement(title, {
			layoutOrder = 1,
			input = p2.title,
			subtitle = p2.subtitle
		}),
		Message = reactModule.createElement(textWithTranslationModule, {
			tag = "size-full-0 auto-y text-body-small",
			layoutOrder = 2,
			input = p2.message
		}),
		ToggleContainer = if p2.blockToggle and blockToggleState == "Visible" then reactModule.createElement(view, {
			tag = "size-full-0 auto-y col padding-large radius-medium gap-xsmall bg-action-standard",
			LayoutOrder = 3,
			onActivated = handleBlockToggleChange
		}, {
			TextContainer = reactModule.createElement(view, {
				tag = "auto-y size-full-0 row gap-small flex-x-between",
				LayoutOrder = 1
			}, {
				Label = reactModule.createElement(textWithTranslationModule, {
					tag = "text-title-large content-emphasis auto-xy",
					layoutOrder = 1,
					input = p2.blockToggle.label or ""
				}),
				Toggle = reactModule.createElement(toggle, {
					label = "",
					Selectable = false,
					LayoutOrder = 2,
					isChecked = isBlocked,
					onActivated = handleBlockToggleChange
				})
			}),
			Description = if p2.blockToggle.description then reactModule.createElement(textWithTranslationModule, {
				tag = "text-body-small auto-xy text-wrap",
				layoutOrder = 2,
				input = p2.blockToggle.description or ""
			}) else nil
		}) else nil,
		Error = if blockToggleState == "Error" and p2.blockToggle then reactModule.createElement(textWithTranslationModule, {
			tag = "size-full-0 auto-y content-system-alert text-body-small padding-bottom-medium align-x-left",
			layoutOrder = 3,
			input = p2.blockToggle.errorLabel or ""
		}) else nil
	}
	
	if p2.helpline and p2.helpline.heading and blockToggleState ~= "Loading" then
		var6 = reactModule.createElement
		var6 = var6(view, {
			tag = "size-full-0 auto-y col gap-medium",
			LayoutOrder = 4
		}, {
			InformationHeader = reactModule.createElement(textWithTranslationModule, {
				tag = "text-title-small content-emphasis auto-xy",
				layoutOrder = 1,
				input = p2.helpline.heading
			}),
			ViewInformationButton = if p2.helpline and p2.helpline.href then reactModule.createElement(button, {
				icon = "icons/navigation/externallink",
				LayoutOrder = 2,
				text = translateIntoString(p2.helpline.buttonText),
				variant = buttonVariant.Standard,
				width = UDim.new(1, 0),
				onActivated = var12
			}) else nil
		})
	else
		var6 = nil
	end
	t.InformationContainer = var6
	t.Footer = if fFlagAbuseReportMenuV2 and p2.footerItems then reactModule.createElement(footerModule, {
		additionalTag = "padding-top-medium",
		layoutOrder = 5,
		footerItems = p2.footerItems
	}) else nil
	local var13 = if p2.onNext then reactModule.createElement(button, {
		text = translateIntoString(p2.nextButtonText),
		variant = buttonVariant.Emphasis,
		fillBehavior = fillBehavior.Fill,
		isLoading = if fFlagSupportSubmissionOnAllReportNodes then p2.isSubmitting else false,
		isDisabled = if fFlagSupportSubmissionOnAllReportNodes then p2.isSubmitting else false,
		onActivated = var11
	}) else nil
	
	return if fFlagAbuseReportMenuV2 then reactModule.createElement(var10, {
		body = reactModule.createElement(reactModule.Fragment, nil, t),
		actions = var13
	}) else reactModule.createElement(reactModule.Fragment, nil, {
		Content = reactModule.createElement(body, nil, t),
		Actions = if var13 then reactModule.createElement(actions, nil, { Button = var13 }) else nil
	})
end)