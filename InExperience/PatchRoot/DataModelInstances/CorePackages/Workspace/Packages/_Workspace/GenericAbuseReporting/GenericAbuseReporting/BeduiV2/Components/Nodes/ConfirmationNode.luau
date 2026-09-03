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
local fFlagAbuseReportOptimisticBlockToggleModule = require(genericAbuseReporting.Flags.FFlagAbuseReportOptimisticBlockToggle)
local fFlagSupportSubmissionOnAllReportNodes = sharedFlagsModule.FFlagSupportSubmissionOnAllReportNodes

local function useBlockToggle(p1)
	-- upvalues: reactModule (ref), fFlagAbuseReportOptimisticBlockToggleModule (ref), useAbuseReportAnalytics (ref), useRoactService (ref), roactNetworking (ref), isBlockedUser (ref), telemetryEventType (ref), fFlagAbuseReportImproveErrorEventsModule (ref), formatHttpErrorMessageForAnalytics (ref), dashModule (ref), unblockUser (ref), blockUser (ref)
	local var1, var2 = reactModule.useState(if p1 then "Loading" else "Hidden")
	local var3, var4 = reactModule.useState(false)
	local var5 = nil
	local var6 = nil
	
	if fFlagAbuseReportOptimisticBlockToggleModule then
		local var7, var8 = reactModule.useState(false)
		var5 = var7
		var6 = var8
	end
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var9 = useRoactService(roactNetworking)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), isBlockedUser (copy), var9 (ref), var2 (ref), sendEvent (ref), telemetryEventType (copy), fFlagAbuseReportImproveErrorEventsModule (copy), formatHttpErrorMessageForAnalytics (copy), dashModule (copy)
		if p1 and p1.userId then
			isBlockedUser(var9, p1.userId):andThen(function(p2)
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
	end, { p1 and p1.userId, sendEvent, var9 })
	
	return {
		blockToggleState = var1,
		handleBlockToggleChange = reactModule.useCallback(function()
			-- upvalues: p1 (ref), fFlagAbuseReportOptimisticBlockToggleModule (copy), var5 (write), var6 (write), var4 (ref), var3 (ref), unblockUser (copy), var9 (ref), var2 (ref), sendEvent (ref), telemetryEventType (copy), fFlagAbuseReportImproveErrorEventsModule (copy), formatHttpErrorMessageForAnalytics (copy), dashModule (copy), blockUser (copy)
			if p1 == nil or p1.userId == nil then return end
			if fFlagAbuseReportOptimisticBlockToggleModule then
				if var5 then return end
				if var6 then
					var6(true)
				end
				var4(not var3)
			end
			local var10
			local _ = nil
			
			if var3 then
				var10 = unblockUser(var9, p1.userId):andThen(function()
					-- upvalues: var4 (copy)
					var4(false)
				end):catch(function(p2)
					-- upvalues: fFlagAbuseReportOptimisticBlockToggleModule (copy), var4 (copy), var2 (copy), sendEvent (copy), telemetryEventType (copy), fFlagAbuseReportImproveErrorEventsModule (copy), formatHttpErrorMessageForAnalytics (copy), p1 (copy), dashModule (copy)
					if fFlagAbuseReportOptimisticBlockToggleModule then
						var4(true)
					end
					var2("Error")
					sendEvent({
						sub_event_type = telemetryEventType.Error,
						error_detail = {
							error_message = if fFlagAbuseReportImproveErrorEventsModule then formatHttpErrorMessageForAnalytics(`unblockUser failed for userId: {p1.userId}`, p2) else "unblockUser: " .. dashModule.pretty(p2, { depth = 10 })
						}
					})
				end)
				sendEvent({ sub_event_type = telemetryEventType.DidUnblockUser })
			else
				var10 = blockUser(var9, p1.userId):andThen(function()
					-- upvalues: fFlagAbuseReportOptimisticBlockToggleModule (copy), sendEvent (copy), telemetryEventType (copy), var4 (copy)
					if not fFlagAbuseReportOptimisticBlockToggleModule then
						sendEvent({ sub_event_type = telemetryEventType.DidBlockUser })
					end
					var4(true)
				end):catch(function(p3)
					-- upvalues: fFlagAbuseReportOptimisticBlockToggleModule (copy), var4 (copy), var2 (copy), sendEvent (copy), telemetryEventType (copy), fFlagAbuseReportImproveErrorEventsModule (copy), formatHttpErrorMessageForAnalytics (copy), p1 (copy), dashModule (copy)
					if fFlagAbuseReportOptimisticBlockToggleModule then
						var4(false)
					end
					var2("Error")
					sendEvent({
						sub_event_type = telemetryEventType.Error,
						error_detail = {
							error_message = if fFlagAbuseReportImproveErrorEventsModule then formatHttpErrorMessageForAnalytics(`blockUser failed for userId: {p1.userId}`, p3) else "blockUser: " .. dashModule.pretty(p3, { depth = 10 })
						}
					})
				end)
				
				if fFlagAbuseReportOptimisticBlockToggleModule then
					sendEvent({ sub_event_type = telemetryEventType.DidBlockUser })
				end
			end
			if fFlagAbuseReportOptimisticBlockToggleModule then
				var10:finally(function()
					-- upvalues: var6 (copy)
					if var6 then
						var6(false)
					end
				end)
			end
		end, {
			sendEvent,
			var9,
			p1 and p1.userId,
			var3,
			var5
		}),
		isBlocked = var3,
		isBlockRequestInFlight = var5
	}
end

return reactModule.memo(function(p2)
	-- upvalues: useArTranslation (ref), useOpenLinkModule (ref), useAbuseReportAnalytics (ref), useBlockToggle (ref), useLayoutSlots (ref), reactModule (ref), telemetryEventType (ref), eyebrowModule (ref), textWithTranslationModule (ref), view (ref), toggle (ref), button (ref), buttonVariant (ref), footerModule (ref), fillBehavior (ref), fFlagSupportSubmissionOnAllReportNodes (ref)
	local var11
	local translateIntoString = useArTranslation().translateIntoString
	local var12 = useOpenLinkModule()
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var13 = useBlockToggle(p2.blockToggle)
	local blockToggleState = var13.blockToggleState
	local handleBlockToggleChange = var13.handleBlockToggleChange
	local isBlocked = var13.isBlocked
	local isBlockRequestInFlight = var13.isBlockRequestInFlight
	local var14 = useLayoutSlots()
	local title = var14.Title
	local layout = var14.Layout
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), sendEvent (ref), telemetryEventType (copy)
		if p2.helpline and p2.helpline.href then
			sendEvent({ sub_event_type = telemetryEventType.HelplineShown })
		end
	end, { p2.helpline and p2.helpline.href, sendEvent })
	local var15 = reactModule.useCallback(function()
		-- upvalues: p2 (ref)
		if p2.onNext then
			p2.onNext()
		end
	end, { p2.onNext })
	local var16 = reactModule.useCallback(function()
		-- upvalues: p2 (ref), var12 (ref), translateIntoString (ref), sendEvent (ref), telemetryEventType (copy)
		if p2.helpline and p2.helpline.href then
			var12(translateIntoString(p2.helpline.heading or ""), p2.helpline.href)
			sendEvent({ sub_event_type = telemetryEventType.HelplineOpened })
		end
	end, {
		p2.helpline and p2.helpline.href,
		var12,
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
			testId = "ConfirmationNode.BlockToggleContainer",
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
					testId = "ConfirmationNode.BlockToggle",
					isChecked = isBlocked,
					isDisabled = isBlockRequestInFlight,
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
		var11 = reactModule.createElement
		var11 = var11(view, {
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
				onActivated = var16
			}) else nil
		})
	else
		var11 = nil
	end
	t.InformationContainer = var11
	t.Footer = if p2.footerItems then reactModule.createElement(footerModule, {
		additionalTag = "padding-top-medium",
		layoutOrder = 5,
		footerItems = p2.footerItems
	}) else nil
	
	return reactModule.createElement(layout, {
		body = reactModule.createElement(reactModule.Fragment, nil, t),
		actions = if p2.onNext then reactModule.createElement(button, {
			text = translateIntoString(p2.nextButtonText),
			variant = buttonVariant.Emphasis,
			fillBehavior = fillBehavior.Fill,
			isLoading = if fFlagSupportSubmissionOnAllReportNodes then p2.isSubmitting else false,
			isDisabled = if fFlagSupportSubmissionOnAllReportNodes then p2.isSubmitting else false,
			onActivated = var15
		}) else nil
	})
end)