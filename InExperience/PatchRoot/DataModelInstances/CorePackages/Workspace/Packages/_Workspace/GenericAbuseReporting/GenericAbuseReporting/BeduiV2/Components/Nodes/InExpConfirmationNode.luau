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
local flaggedMutedError = require(parent.RobloxAppLoggers).flaggedMutedError
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
local formatHttpErrorMessageForAnalytics = analyticsServiceModule.formatHttpErrorMessageForAnalytics
local useAbuseReportAnalytics = abuseReportAnalyticsContextModule.useAbuseReportAnalytics
local useArTranslation = arTranslationModule.useArTranslation
local useLayoutSlots = layoutSlotsModule.useLayoutSlots
local fFlagAbuseReportImproveErrorEventsModule = require(genericAbuseReporting.Flags.FFlagAbuseReportImproveErrorEvents)
local fFlagAbuseReportLinkOpenedAnalytics = sharedFlagsModule.FFlagAbuseReportLinkOpenedAnalytics

local function _(p0) --[[ line: 89 | named "computeInitialMuteState" ]]
	-- upvalues: isUserMuted (ref)
	if not p0 or not p0.userId then
		return "Hidden"
	end
	local userId = tonumber(p0.userId) or 0
	
	return if userId == 0 or isUserMuted(userId) then "Hidden" else "Visible"
end

local function useBlockMuteActions(p1, p2, p3) --[[ line: 100 ]]
	-- upvalues: useArTranslation (ref), reactModule (ref), voiceSpeakingSignalsModule (ref), isUserMuted (ref), useAbuseReportAnalytics (ref), useRoactService (ref), roactNetworking (ref), isBlockedUser (ref), telemetryEventType (ref), fFlagAbuseReportImproveErrorEventsModule (ref), formatHttpErrorMessageForAnalytics (ref), dashModule (ref), localPlayer (ref), muteUser (ref), playersService (ref), blockingUtilityModule (ref), blockUser (ref), flaggedMutedError (ref), buttonVariant (ref)
	local translateIntoString = useArTranslation().translateIntoString
	local var24 = reactModule.useContext(voiceSpeakingSignalsModule.VoiceChatServiceManagerContext)
	local hidden, hidden_1 = reactModule.useState("Hidden")
	local var27, var28 = reactModule.useState(function() --[[ line: 111 ]]
		-- upvalues: p2 (ref), isUserMuted (copy)
		if not p2 or not p2.userId then
			return "Hidden"
		end
		local userId = tonumber(p2.userId) or 0
		
		return if userId == 0 or isUserMuted(userId) then "Hidden" else "Visible"
	end)
	local var29, var30 = reactModule.useState(false)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var31 = useRoactService(roactNetworking)
	reactModule.useEffect(function() --[[ line: 119 ]]
		-- upvalues: p1 (ref), isBlockedUser (copy), var31 (ref), hidden_1 (ref), var30 (ref), sendEvent (ref), telemetryEventType (copy), fFlagAbuseReportImproveErrorEventsModule (copy), formatHttpErrorMessageForAnalytics (copy), dashModule (copy)
		if p1 and p1.userId then
			isBlockedUser(var31, p1.userId):andThen(function(p5) --[[ line: 122 ]]
				-- upvalues: hidden_1 (copy), var30 (copy)
				hidden_1(if p5.responseBody then "Hidden" else "Visible")
				var30(true)
			end):catch(function(p4) --[[ line: 127 ]]
				-- upvalues: sendEvent (copy), telemetryEventType (copy), fFlagAbuseReportImproveErrorEventsModule (copy), formatHttpErrorMessageForAnalytics (copy), p1 (copy), dashModule (copy), var30 (copy)
				sendEvent({
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = if fFlagAbuseReportImproveErrorEventsModule then formatHttpErrorMessageForAnalytics(`isBlockedUser failed for userId: {p1.userId}`, p4) else "isBlockedUser: " .. dashModule.pretty(p4, { depth = 10 })
					}
				})
				var30(true)
			end)
			sendEvent({ sub_event_type = telemetryEventType.IsUserBlockAvailable })
		end
	end, { if p1 then p1.userId else nil, var31, sendEvent })
	local var32 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 153 ]]
		-- upvalues: var27 (ref), var32 (ref), sendEvent (ref), telemetryEventType (copy)
		if var27 == "Visible" and not var32.current then
			var32.current = true
			sendEvent({ sub_event_type = telemetryEventType.IsUserMuteAvailable })
		end
	end, { var27, sendEvent })
	local var33 = reactModule.useCallback(function() --[[ line: 160 ]]
		-- upvalues: p2 (ref), localPlayer (copy), var28 (ref), muteUser (copy), var24 (ref), sendEvent (ref), telemetryEventType (copy), p3 (ref)
		if not p2 or not p2.userId then return end
		local var38 = tonumber(p2.userId)
		
		if var38 and localPlayer then
			var28("Loading")
			
			if muteUser(var38, localPlayer, var24) then
				sendEvent({ sub_event_type = telemetryEventType.DidMuteUser })
				p3({ didBlockUser = false, didMuteUser = true })
				
				return
			end
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = { error_message = `muteUser failed for userId: {var38}` }
			})
			p3({ didBlockUser = false, didMuteUser = false })
		end
	end, { p2, sendEvent, p3, var24 })
	local var34 = reactModule.useCallback(function(p6) --[[ line: 186 ]]
		-- upvalues: sendEvent (ref), telemetryEventType (copy), playersService (copy), blockingUtilityModule (copy)
		if not p6 or p6 == 0 then
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = { error_message = "AddPlayerToBlockList invalid userId" }
			})
			
			return
		end
		local var39 = playersService:GetPlayerByUserId(p6)
		
		if var39 and not blockingUtilityModule:AddPlayerToBlockList(var39) then
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = `AddPlayerToBlockList failed for userId: {p6}`
				}
			})
		end
	end, { sendEvent })
	local var35 = reactModule.useCallback(function() --[[ line: 206 ]]
		-- upvalues: p1 (ref), fFlagAbuseReportImproveErrorEventsModule (copy), hidden_1 (ref), blockUser (copy), var31 (ref), var34 (ref), flaggedMutedError (copy), p3 (ref), sendEvent (ref), telemetryEventType (copy), formatHttpErrorMessageForAnalytics (copy)
		if not p1 or not p1.userId then return end
		if fFlagAbuseReportImproveErrorEventsModule then
			hidden_1("Loading")
			blockUser(var31, p1.userId):andThen(function() --[[ line: 213 ]]
				-- upvalues: hidden_1 (copy), p1 (copy), var34 (copy), flaggedMutedError (copy), p3 (copy)
				hidden_1("Hidden")
				local var40 = tonumber(p1.userId)
				
				if var40 then
					local ok, status = pcall(function() --[[ line: 217 ]]
						-- upvalues: var34 (copy), var40 (ref)
						var34(var40)
						
						return nil
					end)
					
					if not ok then
						flaggedMutedError("AbuseReportInExpLocalBlockError", tostring(status))
					end
				end
				p3({ didBlockUser = true, didMuteUser = false })
			end, function(p7) --[[ line: 226 ]]
				-- upvalues: hidden_1 (copy), sendEvent (copy), telemetryEventType (copy), formatHttpErrorMessageForAnalytics (copy), p1 (copy)
				hidden_1("Error")
				sendEvent({
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = formatHttpErrorMessageForAnalytics(`blockUser failed for userId: {p1.userId}`, p7)
					}
				})
			end)
			sendEvent({ sub_event_type = telemetryEventType.DidBlockUser })
			
			return
		end
		hidden_1("Loading")
		blockUser(var31, p1.userId):andThen(function() --[[ line: 244 ]]
			-- upvalues: sendEvent (copy), telemetryEventType (copy), p1 (copy), var34 (copy), p3 (copy)
			sendEvent({ sub_event_type = telemetryEventType.DidBlockUser })
			local var41 = tonumber(p1.userId)
			
			if var41 then
				var34(var41)
			end
			p3({ didBlockUser = true, didMuteUser = false })
		end):catch(function() --[[ line: 252 ]]
			-- upvalues: hidden_1 (copy), sendEvent (copy), telemetryEventType (copy), p1 (copy)
			hidden_1("Error")
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = `blockUser failed for userId: {p1.userId}`
				}
			})
		end)
	end, {
		p1,
		p3,
		var34,
		var31,
		sendEvent
	})
	local var36 = if p1 ~= nil then var29 else true
	
	return {
		actions = reactModule.useMemo(function() --[[ line: 266 ]]
			-- upvalues: var36 (ref), p1 (ref), hidden (ref), translateIntoString (ref), buttonVariant (copy), var35 (ref), p2 (ref), var27 (ref), var33 (ref)
			local t = {}
			
			if not var36 then
				return t
			elseif p1 and hidden ~= "Hidden" then
				table.insert(t, {
					text = translateIntoString(p1.label),
					variant = buttonVariant.Alert,
					onActivated = var35,
					isLoading = hidden == "Loading"
				})
			end
			if p2 and var27 ~= "Hidden" then
				table.insert(t, {
					text = translateIntoString(p2.label),
					variant = buttonVariant.Alert,
					onActivated = var33,
					isLoading = var27 == "Loading"
				})
			end
			return t
		end, {
			p1, p2, var35, var33, translateIntoString, hidden, var27, var36
		}),
		blockState = hidden,
		muteState = var27,
		hasActions = if p1 == nil then p2 ~= nil else true,
		hasLoadedActions = var36
	}
end

local function useDelayedTrue(p8) --[[ line: 311 ]]
	-- upvalues: reactModule (ref)
	local var43, var44 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 313 ]]
		-- upvalues: p8 (ref), var44 (ref)
		local delayedThread = task.delay(p8, function() --[[ line: 314 ]]
			-- upvalues: var44 (copy)
			var44(true)
		end)
		
		return function() --[[ line: 317 ]]
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { p8 })
	
	return var43
end

return reactModule.memo(function(p9) --[[ line: 329 | named "InExpConfirmationNode" ]]
	-- upvalues: useArTranslation (ref), useInExpOpenLinkModule (ref), fFlagAbuseReportLinkOpenedAnalytics (ref), useAbuseReportAnalytics (ref), useBlockMuteActions (ref), useDelayedTrue (ref), useLayoutSlots (ref), reactModule (ref), telemetryEventType (ref), useInExpFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), dialog (ref), dialogSize (ref), view (ref), textWithTranslationModule (ref), textLinkModule (ref), footerModule (ref), orientation (ref)
	local translateIntoString = useArTranslation().translateIntoString
	local var46 = useInExpOpenLinkModule()
	local var47 = if fFlagAbuseReportLinkOpenedAnalytics then useAbuseReportAnalytics().sendEvent else nil
	local var48 = useBlockMuteActions(p9.blockToggle, p9.muteToggle, p9.onNext)
	local actions = var48.actions
	local blockState = var48.blockState
	local muteState = var48.muteState
	local isStoryMode = p9.isStoryMode or (useDelayedTrue(0.6) or (not var48.hasActions or var48.hasLoadedActions))
	local layout = useLayoutSlots().Layout
	
	if fFlagAbuseReportLinkOpenedAnalytics then
		reactModule.useEffect(function() --[[ line: 357 ]]
			-- upvalues: var47 (write), isStoryMode (ref), p9 (ref), telemetryEventType (copy)
			if var47 and isStoryMode and (p9.helpline and p9.helpline.href) then
				var47({ sub_event_type = telemetryEventType.HelplineShown })
			end
		end, { p9.helpline and p9.helpline.href, isStoryMode })
	end
	local createElement_1
	local var50 = reactModule.useCallback(function() --[[ line: 366 ]]
		-- upvalues: p9 (ref), var46 (ref), fFlagAbuseReportLinkOpenedAnalytics (copy), var47 (write), telemetryEventType (copy)
		if p9.helpline and p9.helpline.href then
			var46(p9.helpline.href)
			
			if fFlagAbuseReportLinkOpenedAnalytics and var47 then
				var47({ sub_event_type = telemetryEventType.HelplineOpened })
			end
		end
	end, { p9.helpline, var46 })
	local var51 = reactModule.useCallback(function() --[[ line: 375 ]]
		-- upvalues: p9 (ref)
		p9.onNext({ didBlockUser = false, didMuteUser = false })
	end, { p9.onNext })
	local var52 = useInExpFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, var51)
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var53 = nil
	local t = {
		Content = reactModule.createElement(layout, { body = nil, actions = nil })
	}
	
	if isStoryMode then
		local var62
		createElement_1 = reactModule.createElement
		local root = dialog.Root
		local t_1 = {
			ref = var52,
			size = dialogSize.Small,
			hasBackdrop = if p9.isStoryMode then false else true,
			disablePortal = if p9.isStoryMode then true else false,
			onClose = var51
		}
		local t_2 = {
			DialogTitle = reactModule.createElement(dialog.Title, { text = translateIntoString(p9.title) })
		}
		local createElement_2 = reactModule.createElement
		local content = dialog.Content
		local t_3 = { LayoutOrder = 2 }
		local t_4 = {}
		local createElement_3 = reactModule.createElement
		local var59 = view
		local t_5 = { tag = "col gap-small size-full-0 auto-y" }
		local t_6 = {
			Message = reactModule.createElement(textWithTranslationModule, {
				tag = "size-full-0 auto-y text-body-medium",
				layoutOrder = 2,
				input = p9.message
			}),
			Helpline = p9.helpline and reactModule.createElement(view, {
				tag = "col gap-small size-full-0 auto-y",
				LayoutOrder = 3
			}, {
				Heading = reactModule.createElement(textWithTranslationModule, {
					tag = "size-full-0 auto-y text-body-medium",
					layoutOrder = 1,
					input = p9.helpline.heading
				}),
				Link = reactModule.createElement(textLinkModule, {
					tag = "auto-xy text-body-medium text-wrap text-align-x-left radius-small content-emphasis",
					layoutOrder = 2,
					text = translateIntoString(p9.helpline.buttonText),
					onActivated = var50
				})
			})
		}
		
		if blockState == "Error" or muteState == "Error" then
			var62 = reactModule.createElement
			var62 = var62(textWithTranslationModule, {
				tag = "size-full-0 auto-y text-body-medium content-system-alert",
				layoutOrder = 4,
				input = if blockState == "Error" and p9.blockToggle then p9.blockToggle.errorLabel elseif muteState == "Error" and p9.muteToggle then p9.muteToggle.errorLabel else ""
			})
		else
			var62 = nil
		end
		t_6.ErrorMessage = var62
		t_6.Footer = p9.footerItems and reactModule.createElement(footerModule, {
			additionalTag = "padding-top-medium",
			layoutOrder = 5,
			footerItems = p9.footerItems
		})
		t_4.DialogContentView = createElement_3(var59, t_5, t_6)
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
	
	return createElement(fragment, var53, t)
end)