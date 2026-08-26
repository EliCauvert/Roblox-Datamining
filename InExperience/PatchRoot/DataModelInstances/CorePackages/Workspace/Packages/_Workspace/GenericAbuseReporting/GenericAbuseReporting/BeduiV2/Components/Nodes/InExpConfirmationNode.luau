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

local function _(p1)
	-- upvalues: isUserMuted (ref)
	if not p1 or not p1.userId then
		return "Hidden"
	end
	local userId = tonumber(p1.userId) or 0
	
	return if userId == 0 or isUserMuted(userId) then "Hidden" else "Visible"
end

local function useBlockMuteActions(p1, p2, p3)
	-- upvalues: useArTranslation (ref), reactModule (ref), voiceSpeakingSignalsModule (ref), isUserMuted (ref), useAbuseReportAnalytics (ref), useRoactService (ref), roactNetworking (ref), isBlockedUser (ref), telemetryEventType (ref), fFlagAbuseReportImproveErrorEventsModule (ref), formatHttpErrorMessageForAnalytics (ref), dashModule (ref), localPlayer (ref), muteUser (ref), playersService (ref), blockingUtilityModule (ref), blockUser (ref), flaggedMutedError (ref), buttonVariant (ref)
	local translateIntoString = useArTranslation().translateIntoString
	local var1 = reactModule.useContext(voiceSpeakingSignalsModule.VoiceChatServiceManagerContext)
	local hidden, hidden_1 = reactModule.useState("Hidden")
	local var2, var3 = reactModule.useState(function()
		-- upvalues: p2 (ref), isUserMuted (copy)
		if not p2 or not p2.userId then
			return "Hidden"
		end
		local userId = tonumber(p2.userId) or 0
		
		return if userId == 0 or isUserMuted(userId) then "Hidden" else "Visible"
	end)
	local var4, var5 = reactModule.useState(false)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var6 = useRoactService(roactNetworking)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), isBlockedUser (copy), var6 (ref), hidden_1 (ref), var5 (ref), sendEvent (ref), telemetryEventType (copy), fFlagAbuseReportImproveErrorEventsModule (copy), formatHttpErrorMessageForAnalytics (copy), dashModule (copy)
		if p1 and p1.userId then
			isBlockedUser(var6, p1.userId):andThen(function(p4)
				-- upvalues: hidden_1 (copy), var5 (copy)
				hidden_1(if p4.responseBody then "Hidden" else "Visible")
				var5(true)
			end):catch(function(p4)
				-- upvalues: sendEvent (copy), telemetryEventType (copy), fFlagAbuseReportImproveErrorEventsModule (copy), formatHttpErrorMessageForAnalytics (copy), p1 (copy), dashModule (copy), var5 (copy)
				sendEvent({
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = if fFlagAbuseReportImproveErrorEventsModule then formatHttpErrorMessageForAnalytics(`isBlockedUser failed for userId: {p1.userId}`, p4) else "isBlockedUser: " .. dashModule.pretty(p4, { depth = 10 })
					}
				})
				var5(true)
			end)
			sendEvent({ sub_event_type = telemetryEventType.IsUserBlockAvailable })
		end
	end, { if p1 then p1.userId else nil, var6, sendEvent })
	local var7 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var7 (ref), sendEvent (ref), telemetryEventType (copy)
		if var2 == "Visible" and not var7.current then
			var7.current = true
			sendEvent({ sub_event_type = telemetryEventType.IsUserMuteAvailable })
		end
	end, { var2, sendEvent })
	local var8 = reactModule.useCallback(function()
		-- upvalues: p2 (ref), localPlayer (copy), var3 (ref), muteUser (copy), var1 (ref), sendEvent (ref), telemetryEventType (copy), p3 (ref)
		if not p2 or not p2.userId then return end
		local var9 = tonumber(p2.userId)
		
		if var9 and localPlayer then
			var3("Loading")
			
			if muteUser(var9, localPlayer, var1) then
				sendEvent({ sub_event_type = telemetryEventType.DidMuteUser })
				p3({ didBlockUser = false, didMuteUser = true })
				
				return
			end
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = { error_message = `muteUser failed for userId: {var9}` }
			})
			p3({ didBlockUser = false, didMuteUser = false })
		end
	end, { p2, sendEvent, p3, var1 })
	local var10 = reactModule.useCallback(function(p4)
		-- upvalues: sendEvent (ref), telemetryEventType (copy), playersService (copy), blockingUtilityModule (copy)
		if not p4 or p4 == 0 then
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = { error_message = "AddPlayerToBlockList invalid userId" }
			})
			
			return
		end
		local var11 = playersService:GetPlayerByUserId(p4)
		
		if var11 and not blockingUtilityModule:AddPlayerToBlockList(var11) then
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = `AddPlayerToBlockList failed for userId: {p4}`
				}
			})
		end
	end, { sendEvent })
	local var12 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), fFlagAbuseReportImproveErrorEventsModule (copy), hidden_1 (ref), blockUser (copy), var6 (ref), var10 (ref), flaggedMutedError (copy), p3 (ref), sendEvent (ref), telemetryEventType (copy), formatHttpErrorMessageForAnalytics (copy)
		if not p1 or not p1.userId then return end
		if fFlagAbuseReportImproveErrorEventsModule then
			hidden_1("Loading")
			blockUser(var6, p1.userId):andThen(function()
				-- upvalues: hidden_1 (copy), p1 (copy), var10 (copy), flaggedMutedError (copy), p3 (copy)
				hidden_1("Hidden")
				local var13 = tonumber(p1.userId)
				
				if var13 then
					local ok, status = pcall(function()
						-- upvalues: var10 (copy), var13 (ref)
						var10(var13)
						
						return nil
					end)
					
					if not ok then
						flaggedMutedError("AbuseReportInExpLocalBlockError", tostring(status))
					end
				end
				p3({ didBlockUser = true, didMuteUser = false })
			end, function(p5)
				-- upvalues: hidden_1 (copy), sendEvent (copy), telemetryEventType (copy), formatHttpErrorMessageForAnalytics (copy), p1 (copy)
				hidden_1("Error")
				sendEvent({
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = formatHttpErrorMessageForAnalytics(`blockUser failed for userId: {p1.userId}`, p5)
					}
				})
			end)
			sendEvent({ sub_event_type = telemetryEventType.DidBlockUser })
			
			return
		end
		hidden_1("Loading")
		blockUser(var6, p1.userId):andThen(function()
			-- upvalues: sendEvent (copy), telemetryEventType (copy), p1 (copy), var10 (copy), p3 (copy)
			sendEvent({ sub_event_type = telemetryEventType.DidBlockUser })
			local var13 = tonumber(p1.userId)
			
			if var13 then
				var10(var13)
			end
			p3({ didBlockUser = true, didMuteUser = false })
		end):catch(function()
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
		var10,
		var6,
		sendEvent
	})
	local var13 = if p1 ~= nil then var4 else true
	
	return {
		actions = reactModule.useMemo(function()
			-- upvalues: var13 (ref), p1 (ref), hidden (ref), translateIntoString (ref), buttonVariant (copy), var12 (ref), p2 (ref), var2 (ref), var8 (ref)
			local t = {}
			
			if not var13 then
				return t
			elseif p1 and hidden ~= "Hidden" then
				table.insert(t, {
					text = translateIntoString(p1.label),
					variant = buttonVariant.Alert,
					onActivated = var12,
					isLoading = hidden == "Loading"
				})
			end
			if p2 and var2 ~= "Hidden" then
				table.insert(t, {
					text = translateIntoString(p2.label),
					variant = buttonVariant.Alert,
					onActivated = var8,
					isLoading = var2 == "Loading"
				})
			end
			return t
		end, {
			p1, p2, var12, var8, translateIntoString, hidden, var2, var13
		}),
		blockState = hidden,
		muteState = var2,
		hasActions = if p1 == nil then p2 ~= nil else true,
		hasLoadedActions = var13
	}
end

local function useDelayedTrue(p5)
	-- upvalues: reactModule (ref)
	local var14, var15 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p5 (ref), var15 (ref)
		local delayedThread = task.delay(p5, function()
			-- upvalues: var15 (copy)
			var15(true)
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { p5 })
	
	return var14
end

return reactModule.memo(function(p5)
	-- upvalues: useArTranslation (ref), useInExpOpenLinkModule (ref), fFlagAbuseReportLinkOpenedAnalytics (ref), useAbuseReportAnalytics (ref), useBlockMuteActions (ref), useDelayedTrue (ref), useLayoutSlots (ref), reactModule (ref), telemetryEventType (ref), useInExpFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), dialog (ref), dialogSize (ref), view (ref), textWithTranslationModule (ref), textLinkModule (ref), footerModule (ref), orientation (ref)
	local translateIntoString = useArTranslation().translateIntoString
	local var14 = useInExpOpenLinkModule()
	local var15 = if fFlagAbuseReportLinkOpenedAnalytics then useAbuseReportAnalytics().sendEvent else nil
	local var16 = useBlockMuteActions(p5.blockToggle, p5.muteToggle, p5.onNext)
	local actions = var16.actions
	local blockState = var16.blockState
	local muteState = var16.muteState
	local isStoryMode = p5.isStoryMode or (useDelayedTrue(0.6) or (not var16.hasActions or var16.hasLoadedActions))
	local layout = useLayoutSlots().Layout
	
	if fFlagAbuseReportLinkOpenedAnalytics then
		reactModule.useEffect(function()
			-- upvalues: var15 (write), isStoryMode (ref), p5 (ref), telemetryEventType (copy)
			if var15 and isStoryMode and (p5.helpline and p5.helpline.href) then
				var15({ sub_event_type = telemetryEventType.HelplineShown })
			end
		end, { p5.helpline and p5.helpline.href, isStoryMode })
	end
	local createElement_1
	local var17 = reactModule.useCallback(function()
		-- upvalues: p5 (ref), var14 (ref), fFlagAbuseReportLinkOpenedAnalytics (copy), var15 (write), telemetryEventType (copy)
		if p5.helpline and p5.helpline.href then
			var14(p5.helpline.href)
			
			if fFlagAbuseReportLinkOpenedAnalytics and var15 then
				var15({ sub_event_type = telemetryEventType.HelplineOpened })
			end
		end
	end, { p5.helpline, var14 })
	local var18 = reactModule.useCallback(function()
		-- upvalues: p5 (ref)
		p5.onNext({ didBlockUser = false, didMuteUser = false })
	end, { p5.onNext })
	local var19 = useInExpFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, var18)
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var20 = nil
	local t = {
		Content = reactModule.createElement(layout, { body = nil, actions = nil })
	}
	
	if isStoryMode then
		local var21
		createElement_1 = reactModule.createElement
		local root = dialog.Root
		local t_1 = {
			ref = var19,
			size = dialogSize.Small,
			hasBackdrop = if p5.isStoryMode then false else true,
			disablePortal = if p5.isStoryMode then true else false,
			onClose = var18
		}
		local t_2 = {
			DialogTitle = reactModule.createElement(dialog.Title, { text = translateIntoString(p5.title) })
		}
		local createElement_2 = reactModule.createElement
		local content = dialog.Content
		local t_3 = { LayoutOrder = 2 }
		local t_4 = {}
		local createElement_3 = reactModule.createElement
		local var22 = view
		local t_5 = { tag = "col gap-small size-full-0 auto-y" }
		local t_6 = {
			Message = reactModule.createElement(textWithTranslationModule, {
				tag = "size-full-0 auto-y text-body-medium",
				layoutOrder = 2,
				input = p5.message
			}),
			Helpline = p5.helpline and reactModule.createElement(view, {
				tag = "col gap-small size-full-0 auto-y",
				LayoutOrder = 3
			}, {
				Heading = reactModule.createElement(textWithTranslationModule, {
					tag = "size-full-0 auto-y text-body-medium",
					layoutOrder = 1,
					input = p5.helpline.heading
				}),
				Link = reactModule.createElement(textLinkModule, {
					tag = "auto-xy text-body-medium text-wrap text-align-x-left radius-small content-emphasis",
					layoutOrder = 2,
					text = translateIntoString(p5.helpline.buttonText),
					onActivated = var17
				})
			})
		}
		
		if blockState == "Error" or muteState == "Error" then
			var21 = reactModule.createElement
			var21 = var21(textWithTranslationModule, {
				tag = "size-full-0 auto-y text-body-medium content-system-alert",
				layoutOrder = 4,
				input = if blockState == "Error" and p5.blockToggle then p5.blockToggle.errorLabel elseif muteState == "Error" and p5.muteToggle then p5.muteToggle.errorLabel else ""
			})
		else
			var21 = nil
		end
		t_6.ErrorMessage = var21
		t_6.Footer = p5.footerItems and reactModule.createElement(footerModule, {
			additionalTag = "padding-top-medium",
			layoutOrder = 5,
			footerItems = p5.footerItems
		})
		t_4.DialogContentView = createElement_3(var22, t_5, t_6)
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
	
	return createElement(fragment, var20, t)
end)