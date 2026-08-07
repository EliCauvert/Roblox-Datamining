local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local playersService = game:GetService("Players")
local localPlayer = playersService.LocalPlayer
local blockingUtilityModule = require(parent.BlockingUtility)
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local reactModule = require(parent.React)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local dialogSize = foundationModule.Enums.DialogSize
local orientation = foundationModule.Enums.Orientation
local view = foundationModule.View
local abuseReportAnalyticsContextModule = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local arTranslationModule = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation)
local footerModule = require(genericAbuseReporting.BeduiV2.Components.Footer)
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local textLinkModule = require(genericAbuseReporting.BeduiV2.Components.TextLink)
local textWithTranslationModule = require(genericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local useInExpFocusNavigationRefsModule = require(genericAbuseReporting.BeduiV2.Hooks.FocusNavigation.useInExpFocusNavigationRefs)
local useInExpOpenLinkModule = require(genericAbuseReporting.BeduiV2.Hooks.useInExpOpenLink)
local userBlockModule = require(genericAbuseReporting.BeduiV2.Api.userBlock)
local userMuteModule = require(genericAbuseReporting.BeduiV2.Api.userMute)
local voiceSpeakingSignalsModule = require(genericAbuseReporting.BeduiV2.Utils.Signals.voiceSpeakingSignals)
local sharedFlagsModule = require(parent.SharedFlags)
local blockUser = userBlockModule.blockUser
local isBlockedUser = userBlockModule.isBlockedUser
local isUserMuted = userMuteModule.isUserMuted
local muteUser = userMuteModule.muteUser
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local useAbuseReportAnalytics = abuseReportAnalyticsContextModule.useAbuseReportAnalytics
local useArTranslation = arTranslationModule.useArTranslation
local useLayoutSlots = layoutSlotsModule.useLayoutSlots
local fFlagAbuseReportLinkOpenedAnalytics = sharedFlagsModule.FFlagAbuseReportLinkOpenedAnalytics

local function _(p0) --[[ line: 86 | named "computeInitialMuteState" ]]
	-- upvalues: isUserMuted (ref)
	if not p0 or not p0.userId then
		return "Hidden"
	end
	local userId = tonumber(p0.userId) or 0
	
	return if userId == 0 or isUserMuted(userId) then "Hidden" else "Visible"
end

local function useBlockMuteActions(p1, p2, p3) --[[ line: 97 ]]
	-- upvalues: useArTranslation (ref), reactModule (ref), voiceSpeakingSignalsModule (ref), isUserMuted (ref), useAbuseReportAnalytics (ref), useRoactService (ref), roactNetworking (ref), isBlockedUser (ref), telemetryEventType (ref), dashModule (ref), localPlayer (ref), muteUser (ref), playersService (ref), blockingUtilityModule (ref), blockUser (ref), buttonVariant (ref)
	local translateIntoString = useArTranslation().translateIntoString
	local var23 = reactModule.useContext(voiceSpeakingSignalsModule.VoiceChatServiceManagerContext)
	local hidden, hidden_1 = reactModule.useState("Hidden")
	local var26, var27 = reactModule.useState(function() --[[ line: 108 ]]
		-- upvalues: p2 (ref), isUserMuted (copy)
		if not p2 or not p2.userId then
			return "Hidden"
		end
		local userId = tonumber(p2.userId) or 0
		
		return if userId == 0 or isUserMuted(userId) then "Hidden" else "Visible"
	end)
	local var28, var29 = reactModule.useState(false)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var30 = useRoactService(roactNetworking)
	reactModule.useEffect(function() --[[ line: 116 ]]
		-- upvalues: p1 (ref), isBlockedUser (copy), var30 (ref), hidden_1 (ref), var29 (ref), sendEvent (ref), telemetryEventType (copy), dashModule (copy)
		if p1 and p1.userId then
			isBlockedUser(var30, p1.userId):andThen(function(p5) --[[ line: 119 ]]
				-- upvalues: hidden_1 (copy), var29 (copy)
				hidden_1(if p5.responseBody then "Hidden" else "Visible")
				var29(true)
			end):catch(function(p4) --[[ line: 124 ]]
				-- upvalues: sendEvent (copy), telemetryEventType (copy), dashModule (copy), var29 (copy)
				sendEvent({
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = "isBlockedUser: " .. dashModule.pretty(p4, { depth = 10 })
					}
				})
				var29(true)
			end)
			sendEvent({ sub_event_type = telemetryEventType.IsUserBlockAvailable })
		end
	end, { if p1 then p1.userId else nil, var30, sendEvent })
	local var31 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 145 ]]
		-- upvalues: var26 (ref), var31 (ref), sendEvent (ref), telemetryEventType (copy)
		if var26 == "Visible" and not var31.current then
			var31.current = true
			sendEvent({ sub_event_type = telemetryEventType.IsUserMuteAvailable })
		end
	end, { var26, sendEvent })
	local var32 = reactModule.useCallback(function() --[[ line: 152 ]]
		-- upvalues: p2 (ref), localPlayer (copy), var27 (ref), muteUser (copy), var23 (ref), sendEvent (ref), telemetryEventType (copy), p3 (ref)
		if not p2 or not p2.userId then return end
		local var37 = tonumber(p2.userId)
		
		if var37 and localPlayer then
			var27("Loading")
			
			if muteUser(var37, localPlayer, var23) then
				sendEvent({ sub_event_type = telemetryEventType.DidMuteUser })
				p3({ didBlockUser = false, didMuteUser = true })
				
				return
			end
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = { error_message = `muteUser failed for userId: {var37}` }
			})
			p3({ didBlockUser = false, didMuteUser = false })
		end
	end, { p2, sendEvent, p3, var23 })
	local var33 = reactModule.useCallback(function(p6) --[[ line: 178 ]]
		-- upvalues: sendEvent (ref), telemetryEventType (copy), playersService (copy), blockingUtilityModule (copy)
		if not p6 or p6 == 0 then
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = { error_message = "AddPlayerToBlockList invalid userId" }
			})
			
			return
		end
		local var38 = playersService:GetPlayerByUserId(p6)
		
		if var38 and not blockingUtilityModule:AddPlayerToBlockList(var38) then
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = `AddPlayerToBlockList failed for userId: {p6}`
				}
			})
		end
	end, { sendEvent })
	local var34 = reactModule.useCallback(function() --[[ line: 198 ]]
		-- upvalues: p1 (ref), hidden_1 (ref), blockUser (copy), var30 (ref), sendEvent (ref), telemetryEventType (copy), var33 (ref), p3 (ref)
		if p1 and p1.userId then
			hidden_1("Loading")
			blockUser(var30, p1.userId):andThen(function() --[[ line: 204 ]]
				-- upvalues: sendEvent (copy), telemetryEventType (copy), p1 (copy), var33 (copy), p3 (copy)
				sendEvent({ sub_event_type = telemetryEventType.DidBlockUser })
				local var39 = tonumber(p1.userId)
				
				if var39 then
					var33(var39)
				end
				p3({ didBlockUser = true, didMuteUser = false })
			end):catch(function() --[[ line: 212 ]]
				-- upvalues: hidden_1 (copy), sendEvent (copy), telemetryEventType (copy), p1 (copy)
				hidden_1("Error")
				sendEvent({
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = `blockUser failed for userId: {p1.userId}`
					}
				})
			end)
			
			return
		end
	end, {
		p1,
		p3,
		var33,
		var30,
		sendEvent
	})
	local var35 = if p1 ~= nil then var28 else true
	
	return {
		actions = reactModule.useMemo(function() --[[ line: 226 ]]
			-- upvalues: var35 (ref), p1 (ref), hidden (ref), translateIntoString (ref), buttonVariant (copy), var34 (ref), p2 (ref), var26 (ref), var32 (ref)
			local t = {}
			
			if not var35 then
				return t
			elseif p1 and hidden ~= "Hidden" then
				table.insert(t, {
					text = translateIntoString(p1.label),
					variant = buttonVariant.Alert,
					onActivated = var34,
					isLoading = hidden == "Loading"
				})
			end
			if p2 and var26 ~= "Hidden" then
				table.insert(t, {
					text = translateIntoString(p2.label),
					variant = buttonVariant.Alert,
					onActivated = var32,
					isLoading = var26 == "Loading"
				})
			end
			return t
		end, {
			p1, p2, var34, var32, translateIntoString, hidden, var26, var35
		}),
		blockState = hidden,
		muteState = var26,
		hasActions = if p1 == nil then p2 ~= nil else true,
		hasLoadedActions = var35
	}
end

local function useDelayedTrue(p7) --[[ line: 271 ]]
	-- upvalues: reactModule (ref)
	local var41, var42 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 273 ]]
		-- upvalues: p7 (ref), var42 (ref)
		local delayedThread = task.delay(p7, function() --[[ line: 274 ]]
			-- upvalues: var42 (copy)
			var42(true)
		end)
		
		return function() --[[ line: 277 ]]
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { p7 })
	
	return var41
end

return reactModule.memo(function(p8) --[[ line: 289 | named "InExpConfirmationNode" ]]
	-- upvalues: useArTranslation (ref), useInExpOpenLinkModule (ref), fFlagAbuseReportLinkOpenedAnalytics (ref), useAbuseReportAnalytics (ref), useBlockMuteActions (ref), useDelayedTrue (ref), useLayoutSlots (ref), reactModule (ref), telemetryEventType (ref), useInExpFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), dialog (ref), dialogSize (ref), view (ref), textWithTranslationModule (ref), textLinkModule (ref), footerModule (ref), orientation (ref)
	local translateIntoString = useArTranslation().translateIntoString
	local var44 = useInExpOpenLinkModule()
	local var45 = if fFlagAbuseReportLinkOpenedAnalytics then useAbuseReportAnalytics().sendEvent else nil
	local var46 = useBlockMuteActions(p8.blockToggle, p8.muteToggle, p8.onNext)
	local actions = var46.actions
	local blockState = var46.blockState
	local muteState = var46.muteState
	local isStoryMode = p8.isStoryMode or (useDelayedTrue(0.6) or (not var46.hasActions or var46.hasLoadedActions))
	local layout = useLayoutSlots().Layout
	
	if fFlagAbuseReportLinkOpenedAnalytics then
		reactModule.useEffect(function() --[[ line: 317 ]]
			-- upvalues: var45 (write), isStoryMode (ref), p8 (ref), telemetryEventType (copy)
			if var45 and isStoryMode and (p8.helpline and p8.helpline.href) then
				var45({ sub_event_type = telemetryEventType.HelplineShown })
			end
		end, { p8.helpline and p8.helpline.href, isStoryMode })
	end
	local createElement_1
	local var48 = reactModule.useCallback(function() --[[ line: 326 ]]
		-- upvalues: p8 (ref), var44 (ref), fFlagAbuseReportLinkOpenedAnalytics (copy), var45 (write), telemetryEventType (copy)
		if p8.helpline and p8.helpline.href then
			var44(p8.helpline.href)
			
			if fFlagAbuseReportLinkOpenedAnalytics and var45 then
				var45({ sub_event_type = telemetryEventType.HelplineOpened })
			end
		end
	end, { p8.helpline, var44 })
	local var49 = reactModule.useCallback(function() --[[ line: 335 ]]
		-- upvalues: p8 (ref)
		p8.onNext({ didBlockUser = false, didMuteUser = false })
	end, { p8.onNext })
	local var50 = useInExpFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, var49)
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var51 = nil
	local t = {
		Content = reactModule.createElement(layout, { body = nil, actions = nil })
	}
	
	if isStoryMode then
		local var60
		createElement_1 = reactModule.createElement
		local root = dialog.Root
		local t_1 = {
			ref = var50,
			size = dialogSize.Small,
			hasBackdrop = if p8.isStoryMode then false else true,
			disablePortal = if p8.isStoryMode then true else false,
			onClose = var49
		}
		local t_2 = {
			DialogTitle = reactModule.createElement(dialog.Title, { text = translateIntoString(p8.title) })
		}
		local createElement_2 = reactModule.createElement
		local content = dialog.Content
		local t_3 = { LayoutOrder = 2 }
		local t_4 = {}
		local createElement_3 = reactModule.createElement
		local var57 = view
		local t_5 = { tag = "col gap-small size-full-0 auto-y" }
		local t_6 = {
			Message = reactModule.createElement(textWithTranslationModule, {
				tag = "size-full-0 auto-y text-body-medium",
				layoutOrder = 2,
				input = p8.message
			}),
			Helpline = p8.helpline and reactModule.createElement(view, {
				tag = "col gap-small size-full-0 auto-y",
				LayoutOrder = 3
			}, {
				Heading = reactModule.createElement(textWithTranslationModule, {
					tag = "size-full-0 auto-y text-body-medium",
					layoutOrder = 1,
					input = p8.helpline.heading
				}),
				Link = reactModule.createElement(textLinkModule, {
					tag = "auto-xy text-body-medium text-wrap text-align-x-left radius-small content-emphasis",
					layoutOrder = 2,
					text = translateIntoString(p8.helpline.buttonText),
					onActivated = var48
				})
			})
		}
		
		if blockState == "Error" or muteState == "Error" then
			var60 = reactModule.createElement
			var60 = var60(textWithTranslationModule, {
				tag = "size-full-0 auto-y text-body-medium content-system-alert",
				layoutOrder = 4,
				input = if blockState == "Error" and p8.blockToggle then p8.blockToggle.errorLabel elseif muteState == "Error" and p8.muteToggle then p8.muteToggle.errorLabel else ""
			})
		else
			var60 = nil
		end
		t_6.ErrorMessage = var60
		t_6.Footer = p8.footerItems and reactModule.createElement(footerModule, {
			additionalTag = "padding-top-medium",
			layoutOrder = 5,
			footerItems = p8.footerItems
		})
		t_4.DialogContentView = createElement_3(var57, t_5, t_6)
		t_2.DialogContent = createElement_2(content, t_3, t_4)
		t_2.DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 4,
			actions = actions,
			orientation = orientation.Vertical
		})
		createElement_1 = createElement_1(root, t_1, t_2)
	else
		createElement_1 = nil
	end
	t.ConfirmationDialog = createElement_1
	
	return createElement(fragment, var51, t)
end)