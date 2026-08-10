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
local isBlockedUser = userBlockModule.isBlockedUser
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local unblockUser = userBlockModule.unblockUser
local useAbuseReportAnalytics = abuseReportAnalyticsContextModule.useAbuseReportAnalytics
local useLayoutSlots = layoutSlotsModule.useLayoutSlots
local fFlagSupportSubmissionOnAllReportNodes = sharedFlagsModule.FFlagSupportSubmissionOnAllReportNodes
local fFlagAbuseReportMenuV2 = sharedFlagsModule.FFlagAbuseReportMenuV2

local function useBlockToggle(p0) --[[ line: 71 ]]
	-- upvalues: reactModule (ref), useAbuseReportAnalytics (ref), useRoactService (ref), roactNetworking (ref), isBlockedUser (ref), telemetryEventType (ref), dashModule (ref), unblockUser (ref), blockUser (ref)
	local var14, var15 = reactModule.useState(if p0 then "Loading" else "Hidden")
	local var16, var17 = reactModule.useState(false)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var18 = useRoactService(roactNetworking)
	reactModule.useEffect(function() --[[ line: 78 ]]
		-- upvalues: p0 (ref), isBlockedUser (copy), var18 (ref), var15 (ref), sendEvent (ref), telemetryEventType (copy), dashModule (copy)
		if p0 and p0.userId then
			isBlockedUser(var18, p0.userId):andThen(function(p2) --[[ line: 81 ]]
				-- upvalues: var15 (copy)
				var15(if p2.responseBody then "Hidden" else "Visible")
			end):catch(function(p1) --[[ line: 85 ]]
				-- upvalues: var15 (copy), sendEvent (copy), telemetryEventType (copy), dashModule (copy)
				var15("Hidden")
				sendEvent({
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = "isBlockedUser: " .. dashModule.pretty(p1, { depth = 10 })
					}
				})
			end)
			sendEvent({ sub_event_type = telemetryEventType.IsUserBlockAvailable })
			
			return
		end
		var15("Hidden")
	end, { p0 and p0.userId, sendEvent, var18 })
	
	return {
		blockToggleState = var14,
		handleBlockToggleChange = reactModule.useCallback(function() --[[ line: 100 ]]
			-- upvalues: p0 (ref), var16 (ref), unblockUser (copy), var18 (ref), var17 (ref), var15 (ref), sendEvent (ref), telemetryEventType (copy), dashModule (copy), blockUser (copy)
			if p0 == nil or p0.userId == nil then return end
			if var16 then
				unblockUser(var18, p0.userId):andThen(function() --[[ line: 107 ]]
					-- upvalues: var17 (copy)
					var17(false)
				end):catch(function(p3) --[[ line: 110 ]]
					-- upvalues: var15 (copy), sendEvent (copy), telemetryEventType (copy), dashModule (copy)
					var15("Error")
					sendEvent({
						sub_event_type = telemetryEventType.Error,
						error_detail = {
							error_message = "unblockUser: " .. dashModule.pretty(p3, { depth = 10 })
						}
					})
				end)
				sendEvent({ sub_event_type = telemetryEventType.DidUnblockUser })
				
				return
			end
			blockUser(var18, p0.userId):andThen(function() --[[ line: 122 ]]
				-- upvalues: sendEvent (copy), telemetryEventType (copy), var17 (copy)
				sendEvent({ sub_event_type = telemetryEventType.DidBlockUser })
				var17(true)
			end):catch(function(p4) --[[ line: 126 ]]
				-- upvalues: var15 (copy), sendEvent (copy), telemetryEventType (copy), dashModule (copy)
				var15("Error")
				sendEvent({
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = "blockUser: " .. dashModule.pretty(p4, { depth = 10 })
					}
				})
			end)
		end, { sendEvent, var18, p0 and p0.userId, var16 }),
		isBlocked = var16
	}
end

return reactModule.memo(function(p5) --[[ line: 149 | named "ConfirmationNode" ]]
	-- upvalues: useArTranslation (ref), useOpenLinkModule (ref), useAbuseReportAnalytics (ref), useBlockToggle (ref), useLayoutSlots (ref), fFlagAbuseReportMenuV2 (ref), reactModule (ref), telemetryEventType (ref), eyebrowModule (ref), textWithTranslationModule (ref), view (ref), toggle (ref), button (ref), buttonVariant (ref), footerModule (ref), fillBehavior (ref), fFlagSupportSubmissionOnAllReportNodes (ref)
	local var26
	local translateIntoString = useArTranslation().translateIntoString
	local var19 = useOpenLinkModule()
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var20 = useBlockToggle(p5.blockToggle)
	local blockToggleState = var20.blockToggleState
	local handleBlockToggleChange = var20.handleBlockToggleChange
	local isBlocked = var20.isBlocked
	local var21 = useLayoutSlots()
	local body = var21.Body
	local actions = var21.Actions
	local title = var21.Title
	local var22 = if fFlagAbuseReportMenuV2 then var21.Layout else nil
	reactModule.useEffect(function() --[[ line: 170 ]]
		-- upvalues: p5 (ref), sendEvent (ref), telemetryEventType (copy)
		if p5.helpline and p5.helpline.href then
			sendEvent({ sub_event_type = telemetryEventType.HelplineShown })
		end
	end, { p5.helpline and p5.helpline.href, sendEvent })
	local var23 = reactModule.useCallback(function() --[[ line: 176 ]]
		-- upvalues: p5 (ref)
		if p5.onNext then
			p5.onNext()
		end
	end, { p5.onNext })
	local var24 = reactModule.useCallback(function() --[[ line: 183 ]]
		-- upvalues: p5 (ref), var19 (ref), translateIntoString (ref), sendEvent (ref), telemetryEventType (copy)
		if p5.helpline and p5.helpline.href then
			var19(translateIntoString(p5.helpline.heading or ""), p5.helpline.href)
			sendEvent({ sub_event_type = telemetryEventType.HelplineOpened })
		end
	end, {
		p5.helpline and p5.helpline.href,
		var19,
		translateIntoString,
		p5.helpline and p5.helpline.heading,
		sendEvent
	})
	local t = {
		Eyebrow = reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = p5.eyebrow }),
		Title = reactModule.createElement(title, {
			layoutOrder = 1,
			input = p5.title,
			subtitle = p5.subtitle
		}),
		Message = reactModule.createElement(textWithTranslationModule, {
			tag = "size-full-0 auto-y text-body-small",
			layoutOrder = 2,
			input = p5.message
		}),
		ToggleContainer = if p5.blockToggle and blockToggleState == "Visible" then reactModule.createElement(view, {
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
					input = p5.blockToggle.label or ""
				}),
				Toggle = reactModule.createElement(toggle, {
					label = "",
					Selectable = false,
					LayoutOrder = 2,
					isChecked = isBlocked,
					onActivated = handleBlockToggleChange
				})
			}),
			Description = if p5.blockToggle.description then reactModule.createElement(textWithTranslationModule, {
				tag = "text-body-small auto-xy text-wrap",
				layoutOrder = 2,
				input = p5.blockToggle.description or ""
			}) else nil
		}) else nil,
		Error = if blockToggleState == "Error" and p5.blockToggle then reactModule.createElement(textWithTranslationModule, {
			tag = "size-full-0 auto-y content-system-alert text-body-small padding-bottom-medium align-x-left",
			layoutOrder = 3,
			input = p5.blockToggle.errorLabel or ""
		}) else nil
	}
	
	if p5.helpline and p5.helpline.heading and blockToggleState ~= "Loading" then
		var26 = reactModule.createElement
		var26 = var26(view, {
			tag = "size-full-0 auto-y col gap-medium",
			LayoutOrder = 4
		}, {
			InformationHeader = reactModule.createElement(textWithTranslationModule, {
				tag = "text-title-small content-emphasis auto-xy",
				layoutOrder = 1,
				input = p5.helpline.heading
			}),
			ViewInformationButton = if p5.helpline and p5.helpline.href then reactModule.createElement(button, {
				icon = "icons/navigation/externallink",
				LayoutOrder = 2,
				text = translateIntoString(p5.helpline.buttonText),
				variant = buttonVariant.Standard,
				width = UDim.new(1, 0),
				onActivated = var24
			}) else nil
		})
	else
		var26 = nil
	end
	t.InformationContainer = var26
	t.Footer = if fFlagAbuseReportMenuV2 and p5.footerItems then reactModule.createElement(footerModule, {
		additionalTag = "padding-top-medium",
		layoutOrder = 5,
		footerItems = p5.footerItems
	}) else nil
	local var27 = if p5.onNext then reactModule.createElement(button, {
		text = translateIntoString(p5.nextButtonText),
		variant = buttonVariant.Emphasis,
		fillBehavior = fillBehavior.Fill,
		isLoading = if fFlagSupportSubmissionOnAllReportNodes then p5.isSubmitting else false,
		isDisabled = if fFlagSupportSubmissionOnAllReportNodes then p5.isSubmitting else false,
		onActivated = var23
	}) else nil
	
	return if fFlagAbuseReportMenuV2 then reactModule.createElement(var22, {
		body = reactModule.createElement(reactModule.Fragment, nil, t),
		actions = var27
	}) else reactModule.createElement(reactModule.Fragment, nil, {
		Content = reactModule.createElement(body, nil, t),
		Actions = if var27 then reactModule.createElement(actions, nil, { Button = var27 }) else nil
	})
end)