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
local blockUser = userBlockModule.blockUser
local isBlockedUser = userBlockModule.isBlockedUser
local isUserMuted = userMuteModule.isUserMuted
local muteUser = userMuteModule.muteUser
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local useAbuseReportAnalytics = abuseReportAnalyticsContextModule.useAbuseReportAnalytics
local useArTranslation = arTranslationModule.useArTranslation
local useLayoutSlots = layoutSlotsModule.useLayoutSlots

local function _(p0) --[[ line: 81 | named "computeInitialMuteState" ]]
	-- upvalues: isUserMuted (ref)
	if not p0 or not p0.userId then
		return "Hidden"
	end
	local userId = tonumber(p0.userId) or 0
	
	return if userId == 0 or isUserMuted(userId) then "Hidden" else "Visible"
end

local function useBlockMuteActions(p1, p2, p3) --[[ line: 92 ]]
	-- upvalues: useArTranslation (ref), reactModule (ref), isUserMuted (ref), useAbuseReportAnalytics (ref), useRoactService (ref), roactNetworking (ref), isBlockedUser (ref), telemetryEventType (ref), dashModule (ref), localPlayer (ref), muteUser (ref), playersService (ref), blockingUtilityModule (ref), blockUser (ref), buttonVariant (ref)
	local translateIntoString = useArTranslation().translateIntoString
	local hidden, hidden_1 = reactModule.useState("Hidden")
	local var23, var24 = reactModule.useState(function() --[[ line: 102 ]]
		-- upvalues: p2 (ref), isUserMuted (copy)
		if not p2 or not p2.userId then
			return "Hidden"
		end
		local userId = tonumber(p2.userId) or 0
		
		return if userId == 0 or isUserMuted(userId) then "Hidden" else "Visible"
	end)
	local var25, var26 = reactModule.useState(false)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var27 = useRoactService(roactNetworking)
	reactModule.useEffect(function() --[[ line: 110 ]]
		-- upvalues: p1 (ref), isBlockedUser (copy), var27 (ref), hidden_1 (ref), var26 (ref), sendEvent (ref), telemetryEventType (copy), dashModule (copy)
		if p1 and p1.userId then
			isBlockedUser(var27, p1.userId):andThen(function(p5) --[[ line: 113 ]]
				-- upvalues: hidden_1 (copy), var26 (copy)
				hidden_1(if p5.responseBody then "Hidden" else "Visible")
				var26(true)
			end):catch(function(p4) --[[ line: 118 ]]
				-- upvalues: sendEvent (copy), telemetryEventType (copy), dashModule (copy), var26 (copy)
				sendEvent({
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = "isBlockedUser: " .. dashModule.pretty(p4, { depth = 10 })
					}
				})
				var26(true)
			end)
			sendEvent({ sub_event_type = telemetryEventType.IsUserBlockAvailable })
		end
	end, { if p1 then p1.userId else nil, var27, sendEvent })
	local var28 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 139 ]]
		-- upvalues: var23 (ref), var28 (ref), sendEvent (ref), telemetryEventType (copy)
		if var23 == "Visible" and not var28.current then
			var28.current = true
			sendEvent({ sub_event_type = telemetryEventType.IsUserMuteAvailable })
		end
	end, { var23, sendEvent })
	local var29 = reactModule.useCallback(function() --[[ line: 146 ]]
		-- upvalues: p2 (ref), localPlayer (copy), var24 (ref), muteUser (copy), sendEvent (ref), telemetryEventType (copy), p3 (ref)
		if not p2 or not p2.userId then return end
		local var34 = tonumber(p2.userId)
		
		if var34 and localPlayer then
			var24("Loading")
			
			if muteUser(var34, localPlayer) then
				sendEvent({ sub_event_type = telemetryEventType.DidMuteUser })
				p3({ didBlockUser = false, didMuteUser = true })
				
				return
			end
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = { error_message = `muteUser failed for userId: {var34}` }
			})
			p3({ didBlockUser = false, didMuteUser = false })
		end
	end, { p2, sendEvent, p3 })
	local var30 = reactModule.useCallback(function(p6) --[[ line: 172 ]]
		-- upvalues: sendEvent (ref), telemetryEventType (copy), playersService (copy), blockingUtilityModule (copy)
		if not p6 or p6 == 0 then
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = { error_message = "AddPlayerToBlockList invalid userId" }
			})
			
			return
		end
		local var35 = playersService:GetPlayerByUserId(p6)
		
		if var35 and not blockingUtilityModule:AddPlayerToBlockList(var35) then
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = `AddPlayerToBlockList failed for userId: {p6}`
				}
			})
		end
	end, { sendEvent })
	local var31 = reactModule.useCallback(function() --[[ line: 192 ]]
		-- upvalues: p1 (ref), hidden_1 (ref), blockUser (copy), var27 (ref), sendEvent (ref), telemetryEventType (copy), var30 (ref), p3 (ref)
		if p1 and p1.userId then
			hidden_1("Loading")
			blockUser(var27, p1.userId):andThen(function() --[[ line: 198 ]]
				-- upvalues: sendEvent (copy), telemetryEventType (copy), p1 (copy), var30 (copy), p3 (copy)
				sendEvent({ sub_event_type = telemetryEventType.DidBlockUser })
				local var36 = tonumber(p1.userId)
				
				if var36 then
					var30(var36)
				end
				p3({ didBlockUser = true, didMuteUser = false })
			end):catch(function() --[[ line: 206 ]]
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
		var30,
		var27,
		sendEvent
	})
	local var32 = if p1 ~= nil then var25 else true
	
	return {
		actions = reactModule.useMemo(function() --[[ line: 220 ]]
			-- upvalues: var32 (ref), p1 (ref), hidden (ref), translateIntoString (ref), buttonVariant (copy), var31 (ref), p2 (ref), var23 (ref), var29 (ref)
			local t = {}
			
			if not var32 then
				return t
			elseif p1 and hidden ~= "Hidden" then
				table.insert(t, {
					text = translateIntoString(p1.label),
					variant = buttonVariant.Alert,
					onActivated = var31,
					isLoading = hidden == "Loading"
				})
			end
			if p2 and var23 ~= "Hidden" then
				table.insert(t, {
					text = translateIntoString(p2.label),
					variant = buttonVariant.Alert,
					onActivated = var29,
					isLoading = var23 == "Loading"
				})
			end
			return t
		end, {
			p1, p2, var31, var29, translateIntoString, hidden, var23, var32
		}),
		blockState = hidden,
		muteState = var23,
		hasActions = if p1 == nil then p2 ~= nil else true,
		hasLoadedActions = var32
	}
end

local function useDelayedTrue(p7) --[[ line: 265 ]]
	-- upvalues: reactModule (ref)
	local var38, var39 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 267 ]]
		-- upvalues: p7 (ref), var39 (ref)
		local delayedThread = task.delay(p7, function() --[[ line: 268 ]]
			-- upvalues: var39 (copy)
			var39(true)
		end)
		
		return function() --[[ line: 271 ]]
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { p7 })
	
	return var38
end

return reactModule.memo(function(p8) --[[ line: 283 | named "InExpConfirmationNode" ]]
	-- upvalues: useArTranslation (ref), useInExpOpenLinkModule (ref), useBlockMuteActions (ref), useDelayedTrue (ref), useLayoutSlots (ref), reactModule (ref), useInExpFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), dialog (ref), dialogSize (ref), view (ref), textWithTranslationModule (ref), textLinkModule (ref), footerModule (ref), orientation (ref)
	local var49
	local translateIntoString = useArTranslation().translateIntoString
	local var41 = useInExpOpenLinkModule()
	local var42 = useBlockMuteActions(p8.blockToggle, p8.muteToggle, p8.onNext)
	local actions = var42.actions
	local blockState = var42.blockState
	local muteState = var42.muteState
	local isStoryMode = p8.isStoryMode or (useDelayedTrue(0.6) or (not var42.hasActions or var42.hasLoadedActions))
	local layout = useLayoutSlots().Layout
	local var44 = reactModule.useCallback(function() --[[ line: 302 ]]
		-- upvalues: p8 (ref), var41 (ref)
		if p8.helpline and p8.helpline.href then
			var41(p8.helpline.href)
		end
	end, { p8.helpline, var41 })
	local var45 = reactModule.useCallback(function() --[[ line: 308 ]]
		-- upvalues: p8 (ref)
		p8.onNext({ didBlockUser = false, didMuteUser = false })
	end, { p8.onNext })
	local var46 = useInExpFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, var45)
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var47 = nil
	local t = {
		Content = reactModule.createElement(layout, { body = nil, actions = nil })
	}
	
	if isStoryMode then
		local var57
		var49 = reactModule.createElement
		local root = dialog.Root
		local t_1 = {
			ref = var46,
			size = dialogSize.Small,
			hasBackdrop = if p8.isStoryMode then false else true,
			disablePortal = if p8.isStoryMode then true else false,
			onClose = var45
		}
		local t_2 = {
			DialogTitle = reactModule.createElement(dialog.Title, { text = translateIntoString(p8.title) })
		}
		local createElement_1 = reactModule.createElement
		local content = dialog.Content
		local t_3 = { LayoutOrder = 2 }
		local t_4 = {}
		local createElement_2 = reactModule.createElement
		local var54 = view
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
					onActivated = var44
				})
			})
		}
		
		if blockState == "Error" or muteState == "Error" then
			var57 = reactModule.createElement
			var57 = var57(textWithTranslationModule, {
				tag = "size-full-0 auto-y text-body-medium content-system-alert",
				layoutOrder = 4,
				input = if blockState == "Error" and p8.blockToggle then p8.blockToggle.errorLabel elseif muteState == "Error" and p8.muteToggle then p8.muteToggle.errorLabel else ""
			})
		else
			var57 = nil
		end
		t_6.ErrorMessage = var57
		t_6.Footer = p8.footerItems and reactModule.createElement(footerModule, {
			additionalTag = "padding-top-medium",
			layoutOrder = 5,
			footerItems = p8.footerItems
		})
		t_4.DialogContentView = createElement_2(var54, t_5, t_6)
		t_2.DialogContent = createElement_1(content, t_3, t_4)
		t_2.DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 4,
			actions = actions,
			orientation = orientation.Vertical
		})
		var49 = var49(root, t_1, t_2)
	else
		var49 = nil
	end
	t.ConfirmationDialog = var49
	
	return createElement(fragment, var47, t)
end)