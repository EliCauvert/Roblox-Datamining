local userInputService = game:GetService("UserInputService")
local playersService = game:GetService("Players")
local guiService = game:GetService("GuiService")
local httpService = game:GetService("HttpService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local thirdPartyUserService = game:GetService("ThirdPartyUserService")
local touchEnabled = userInputService.TouchEnabled
local parent = script.Parent
local components = parent.Components
local context = parent.context
local utils = parent.utils
local loggerModule = require(parent.Logger)
local toastNotificationHelperModule = require(utils.toastNotificationHelper)
local toastNotificationSessionizationHelperModule = require(utils.toastNotificationSessionizationHelper)
local parent_1 = parent.Parent
local notificationsCommonModule = require(parent_1.NotificationsCommon)
local reactModule = require(parent_1.React)
local UIBloxModule = require(parent_1.UIBlox)
local cryoModule = require(parent_1.Cryo)
local isVRAppBuild = require(parent_1.AppCommonLib).IsVRAppBuild
local responsiveModule = require(parent_1.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local useIsSpatial = responsiveModule.useIsSpatial
local reactOtterModule = require(parent_1.ReactOtter)
local lifecycleEventsModule = require(script.Parent.utils.LifecycleEvents)
local toastNotificationProtocol = require(parent_1.ToastNotificationsProtocol).ToastNotificationProtocol
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local sharedFlagsModule = require(parent_1.SharedFlags)
local analyticsServiceModule = require(parent.analytics.analyticsService)
local notificationCardProviderModule = require(context.NotificationCardProvider)
local notificationCardModule = require(components.NotificationCard)
local toastNotificationSnoozeMenuModule = require(components.ToastNotificationSnoozeMenu)
local deeplinkConfirmationModal = notificationsCommonModule.DeeplinkConfirmationModal
local swipeDetectionWrapperModule = require(components.SwipeDetectionWrapper)
local toastVRWrapperModule = require(components.ToastVRWrapper)
local clientNotificationWrapperModule = require(components.ClientNotificationWrapper)
local useKeyCodeHoldModule = require(components.useKeyCodeHold)
local typeModule = require(parent.type)
local constantsModule = require(parent.constants)
local joinExperience = notificationsCommonModule.JoinExperience
local springAnimatedItem = UIBloxModule.Utility.SpringAnimatedItem
local close = images["icons/navigation/close"]
local getFFlagEnableChatNewMessage = sharedFlagsModule.GetFFlagEnableChatNewMessage
local clientToastNotificationsEnabledEngineFeature = game:GetEngineFeature("ClientToastNotificationsEnabled")
local enableClientToastNotificationsReducedMotion = game:DefineFastFlag("EnableClientToastNotificationsReducedMotion", false)
local enableNotificationsToastTTLFix = game:DefineFastFlag("EnableNotificationsToastTTLFix", false)
local default = require(parent.ToastNotificationSnoozeManager).default
local getFStringPCGDKFilteredNotificationTypes = sharedFlagsModule.GetFStringPCGDKFilteredNotificationTypes

local function _()
	-- upvalues: thirdPartyUserService (ref)
	return thirdPartyUserService and (thirdPartyUserService:IsChatRestrictionSupported() and thirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted)
end

local getFFlagFilterSecurityAlertsVRToastEnabled = sharedFlagsModule.GetFFlagFilterSecurityAlertsVRToastEnabled
local enableDisplayLoggingForToastsFix = game:DefineFastFlag("EnableDisplayLoggingForToastsFix", false)
local IXPServiceWrapper = require(parent_1.IXPServiceWrapper).IXPServiceWrapper
local fFlagFriendshipNotifsUseSendrExperiment = sharedFlagsModule.FFlagFriendshipNotifsUseSendrExperiment
local friendshipNotifsUseSendrLayerName = game:DefineFastString("FriendshipNotifsUseSendrLayerName", "Notification.Toast")
local FRRToastPositionVariantKey = game:DefineFastString("FRRToastPositionVariantKey", "frrToastPositionVariant")
local var1 = false
local var2 = nil
local var3 = nil

local _ = function()
	-- upvalues: fFlagFriendshipNotifsUseSendrExperiment (ref), var1 (write), var2 (write), var3 (write), IXPServiceWrapper (ref), friendshipNotifsUseSendrLayerName (ref), FRRToastPositionVariantKey (ref)
	if fFlagFriendshipNotifsUseSendrExperiment and not var1 then
		local ok, status = pcall(function()
			-- upvalues: var1 (copy), IXPServiceWrapper (copy), friendshipNotifsUseSendrLayerName (copy)
			var1 = true
			
			return IXPServiceWrapper:GetLayerData(friendshipNotifsUseSendrLayerName)
		end)
		var2 = ok
		var3 = status
	end
	return if var2 and var3 then var3[FRRToastPositionVariantKey] else nil
end

local t = { frequency = 4, damping = 1 }
local getDeviceOrientation = toastNotificationHelperModule.getDeviceOrientation
local getNotificationSize = toastNotificationHelperModule.getNotificationSize
local marshalNotificationData = toastNotificationHelperModule.marshalNotificationData
local calculateToastPosition = toastNotificationHelperModule.calculateToastPosition
local isToastToRight = toastNotificationHelperModule.isToastToRight
local calculateTimeRemaining = toastNotificationHelperModule.calculateTimeRemaining

return function(p1)
	-- upvalues: typeModule (ref), toastNotificationHelperModule (ref), constantsModule (ref), toastNotificationProtocol (ref), reactModule (ref), userGameSettingsService (ref), getNotificationSize (ref), getDeviceOrientation (ref), fFlagFriendshipNotifsUseSendrExperiment (ref), calculateToastPosition (ref), isToastToRight (ref), useIsSpatial (ref), usePreferredInput (ref), responsiveModule (ref), userInputService (ref), useKeyCodeHoldModule (ref), useStyle (ref), playersService (ref), loggerModule (ref), analyticsServiceModule (ref), toastNotificationSessionizationHelperModule (ref), cryoModule (ref), default (ref), var1 (write), var2 (write), var3 (write), IXPServiceWrapper (ref), friendshipNotifsUseSendrLayerName (ref), FRRToastPositionVariantKey (ref), enableNotificationsToastTTLFix (ref), clientToastNotificationsEnabledEngineFeature (ref), guiService (ref), joinExperience (ref), httpService (ref), calculateTimeRemaining (ref), lifecycleEventsModule (ref), getFStringPCGDKFilteredNotificationTypes (ref), thirdPartyUserService (ref), enableDisplayLoggingForToastsFix (ref), getFFlagFilterSecurityAlertsVRToastEnabled (ref), getFFlagEnableChatNewMessage (ref), marshalNotificationData (ref), t (ref), reactOtterModule (ref), isVRAppBuild (ref), touchEnabled (ref), imageSetLabel (ref), close (ref), springAnimatedItem (ref), swipeDetectionWrapperModule (ref), clientNotificationWrapperModule (ref), enableClientToastNotificationsReducedMotion (ref), notificationCardProviderModule (ref), notificationCardModule (ref), toastVRWrapperModule (ref), toastNotificationSnoozeMenuModule (ref), deeplinkConfirmationModal (ref)
	local var4 = p1.renderLocation == typeModule.RenderLocationEnum.CoreScript
	local var5 = toastNotificationHelperModule.isDesktopDevice()
	local var6 = if var4 then constantsModule.CardTopMargin.Experience else constantsModule.CardTopMargin.App
	local default_1 = toastNotificationProtocol.default
	
	local _ = function()
		return workspace.CurrentCamera.ViewportSize
	end
	
	local _ = function(p2)
		-- upvalues: constantsModule (copy)
		return p2 and workspace.CurrentCamera.ViewportSize.X < constantsModule.CompactCardThreashold
	end
	
	local var7, var8 = reactModule.useState(userGameSettingsService.ReducedMotion)
	local var9, var10 = reactModule.useState(getNotificationSize(var4, workspace.CurrentCamera.ViewportSize.X))
	local var11, var12 = reactModule.useState(getDeviceOrientation(workspace.CurrentCamera.ViewportSize))
	local var13, var14 = reactModule.useState(if fFlagFriendshipNotifsUseSendrExperiment then workspace.CurrentCamera.ViewportSize else nil)
	local var15, var16 = reactModule.useState(false)
	local var17, var18 = reactModule.useState(nil)
	local var19, var20 = reactModule.useState(nil)
	local var21, var22 = reactModule.useState(calculateToastPosition(false, isToastToRight(var11), var6, var7))
	local var23, var24 = reactModule.useState(nil)
	local var25, var26 = reactModule.useState(nil)
	local var27, var28 = reactModule.useState(function()
		-- upvalues: var4 (ref), constantsModule (copy)
		return var4 and workspace.CurrentCamera.ViewportSize.X < constantsModule.CompactCardThreashold
	end)
	local var29, var30 = reactModule.useState(false)
	local var31, var32 = reactModule.useState(false)
	local var33, var34 = reactModule.useState(false)
	local var35 = reactModule.useRef(false)
	local var36, var37 = reactModule.useState(false)
	local var38, var39 = reactModule.useState(false)
	local var40, var41 = reactModule.useState(false)
	local var42, var43 = reactModule.useState({})
	local var44 = useIsSpatial()
	local _ = nil
	local _ = nil
	local var45 = usePreferredInput() == responsiveModule.Input.Directional
	local var46, var47 = reactModule.useState(false)
	local var48 = var46
	local var49 = var47
	local var50 = reactModule.useMemo(function()
		-- upvalues: var45 (ref), var48 (write), var17 (ref)
		return not var45 or (var48 or var17 == nil)
	end, { var45, var48, var17 })
	reactModule.useEffect(function()
		-- upvalues: var48 (write), userInputService (copy), var49 (write)
		if var48 then
			local inputBeganConnection = userInputService.InputBegan:Connect(function(p2, p3)
				-- upvalues: var49 (copy)
				if p3 then return end
				if p2.KeyCode == Enum.KeyCode.ButtonB then
					var49(false)
				end
			end)
			
			return function()
				-- upvalues: inputBeganConnection (ref)
				inputBeganConnection:Disconnect()
			end
		end
	end, { var48 })
	local var51 = useKeyCodeHoldModule(Enum.KeyCode.ButtonSelect, constantsModule.SIGNAL_HOLD_INTENT_SECONDS, constantsModule.SIGNAL_HOLD_COMPLETE_SECONDS, reactModule.useCallback(function()
		-- upvalues: var49 (write)
		var49(true)
	end, {}), var50)
	local holdProgress = var51.holdProgress
	local holding = var51.holding
	local var52, var53 = reactModule.useState(Instance.new("BindableEvent"))
	local var54 = useStyle()
	
	local _ = function()
		-- upvalues: getDeviceOrientation (copy), getNotificationSize (copy), var4 (ref), var10 (ref), var28 (ref), constantsModule (copy), var12 (ref)
		local viewportSize = workspace.CurrentCamera.ViewportSize
		local var55 = getDeviceOrientation(viewportSize)
		var10(getNotificationSize(var4, viewportSize.X))
		var28(var4 and workspace.CurrentCamera.ViewportSize.X < constantsModule.CompactCardThreashold)
		var12(var55)
	end
	
	local _ = function(p2)
		-- upvalues: default_1 (ref)
		default_1:dismissNotification(p2)
	end
	
	local var55 = var36 or var38
	local userId = playersService and (playersService.LocalPlayer and (playersService.LocalPlayer.UserId or nil))
	
	local var56 = function(p2, p3, p4)
		-- upvalues: loggerModule (copy), analyticsServiceModule (copy), toastNotificationSessionizationHelperModule (copy), toastNotificationHelperModule (copy), cryoModule (copy), constantsModule (copy), var4 (ref), default (copy), fFlagFriendshipNotifsUseSendrExperiment (copy), typeModule (copy), var1 (copy), var2 (copy), var3 (copy), IXPServiceWrapper (copy), friendshipNotifsUseSendrLayerName (copy), FRRToastPositionVariantKey (copy)
		if p4 == nil then return end
		local var57
		loggerModule:info("NotificationType: {} with event: {}", p4.notificationType, p2)
		local eventStream = analyticsServiceModule.EventStream
		toastNotificationSessionizationHelperModule(p2)
		local var58 = if p4 and p4.displayTimestamp then DateTime.now().UnixTimestampMillis - p4.displayTimestamp else 0
		local fireEvent = toastNotificationHelperModule.fireEvent
		local join = cryoModule.Dictionary.join
		local t = {
			action_type = p2,
			delivery_channel = constantsModule.DeliveryChannel,
			notification_type = if p4 then p4.notificationType else nil,
			notification_id = if p4 then p4.id else nil,
			recipient_userid = p3 or nil,
			recipient_universe_id = if var4 then game and game.GameId else nil,
			client_destination = if var4 then constantsModule.Destinations.Experience else constantsModule.Destinations.App,
			deliver_timestamp = if p4 then p4.deliverTimestamp else nil,
			snoozed = if p4 and p4.notificationType then default:isSnoozedNotificationType(p4.notificationType) else false,
			time_to_action_timestamp = var58
		}
		
		if fFlagFriendshipNotifsUseSendrExperiment and p4.notificationType == typeModule.NotificationTypeEnum.FriendRequestReceived then
			if fFlagFriendshipNotifsUseSendrExperiment and not var1 then
				local ok, status = pcall(function()
					-- upvalues: var1 (copy), IXPServiceWrapper (copy), friendshipNotifsUseSendrLayerName (copy)
					var1 = true
					
					return IXPServiceWrapper:GetLayerData(friendshipNotifsUseSendrLayerName)
				end)
				var2 = ok
				var3 = status
			end
			var57 = if var2 and var3 then var3[FRRToastPositionVariantKey] else nil
		else
			var57 = nil
		end
		t.frr_toast_position_variant = var57
		fireEvent(eventStream, join(t, if p4 then p4.clientEventsPayload else {}))
	end
	
	reactModule.useEffect(function()
		-- upvalues: userGameSettingsService (copy), var8 (ref)
		local changedConnection = userGameSettingsService.Changed:Connect(function(p2)
			-- upvalues: userGameSettingsService (copy), var8 (copy)
			if p2 == "ReducedMotion" then
				local ok, status = pcall(function()
					-- upvalues: userGameSettingsService (copy), p2 (ref)
					return userGameSettingsService[p2]
				end)
				
				if ok then
					var8(status)
				end
			end
		end)
		
		return function()
			-- upvalues: changedConnection (ref)
			if changedConnection then
				changedConnection:Disconnect()
			end
		end
	end, { var8, userGameSettingsService })
	
	local var57 = function(p2)
		-- upvalues: var56 (ref), typeModule (copy), userId (ref), var17 (ref), var32 (ref), var52 (ref)
		if not p2 then
			var56(typeModule.ToastNotificationActionsEnum.ModalCancel, userId, var17)
			var32(false)
		end
		if var52 then
			var56(typeModule.ToastNotificationActionsEnum.ModalConfirm, userId, var17)
			var52:Fire(p2)
		end
	end
	
	local var58 = reactModule.useCallback(function()
		-- upvalues: var23 (ref), var24 (ref)
		if var23 then
			task.cancel(var23)
		end
		var24(nil)
	end, { var23 })
	
	local _ = function(p2)
		-- upvalues: default_1 (ref), var20 (ref), var58 (ref)
		default_1:dismissNotification(p2)
		var20(nil)
		var58()
	end
	
	local _ = function(p2)
		-- upvalues: constantsModule (copy)
		local timeOnScreenMs = p2.state and p2.state.timeOnScreenMs
		
		return (timeOnScreenMs and timeOnScreenMs / 1000 or constantsModule.DefaultNotificationDisplayTime) + 1
	end
	
	local var59 = if enableNotificationsToastTTLFix then function(p2, p3, p4)
		-- upvalues: var58 (ref), var35 (ref), var56 (ref), typeModule (copy), userId (ref), clientToastNotificationsEnabledEngineFeature (copy), guiService (copy), default_1 (ref), var20 (ref), var24 (ref)
		var58()
		var24(task.delay(p3, function()
			-- upvalues: var35 (copy), var58 (copy), var56 (copy), typeModule (copy), userId (copy), p4 (ref), clientToastNotificationsEnabledEngineFeature (copy), guiService (copy), p2 (ref), default_1 (copy), var20 (copy)
			if var35.current then
				var58()
				
				return
			end
			var56(typeModule.ToastNotificationActionsEnum.Ignored, userId, p4)
			
			if clientToastNotificationsEnabledEngineFeature and p4 and p4.luaNotifInfo then
				guiService:DismissNotification(p2)
				
				return
			end
			default_1:dismissNotification(p2)
			var20(nil)
			var58()
		end))
	end else reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: var58 (ref), var33 (ref), var56 (ref), typeModule (copy), userId (ref), clientToastNotificationsEnabledEngineFeature (copy), guiService (copy), default_1 (ref), var20 (ref), var24 (ref)
		var58()
		var24(task.delay(p3, function()
			-- upvalues: var33 (copy), var56 (copy), typeModule (copy), userId (copy), p4 (ref), clientToastNotificationsEnabledEngineFeature (copy), guiService (copy), p2 (ref), default_1 (copy), var20 (copy), var58 (copy)
			if not var33 then
				var56(typeModule.ToastNotificationActionsEnum.Ignored, userId, p4)
				
				if clientToastNotificationsEnabledEngineFeature and p4 and p4.luaNotifInfo then
					guiService:DismissNotification(p2)
					
					return
				end
				default_1:dismissNotification(p2)
				var20(nil)
				var58()
			end
		end))
	end, { var33 })
	local var60 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), var19 (ref), clientToastNotificationsEnabledEngineFeature (copy), guiService (copy), default_1 (ref), var20 (ref), var58 (ref)
		if var17 and var19 and var19.id == var17.id then
			if clientToastNotificationsEnabledEngineFeature and var17.luaNotifInfo then
				guiService:DismissNotification(var17.id)
				
				return
			end
			default_1:dismissNotification(var17.id)
			var20(nil)
			var58()
		end
	end, { var17, var19 })
	
	local var61 = function()
		-- upvalues: var56 (ref), typeModule (copy), userId (ref), var17 (ref), var60 (ref), var39 (ref)
		var56(typeModule.ToastNotificationActionsEnum.Dismissed, userId, var17)
		var60()
		var39(false)
	end
	
	local var62 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var52 (ref), var32 (ref)
		if var4 and var52 then
			var32(true)
			
			return var52.Event:Wait()
		end
		return true
	end, { var4, var52 })
	
	local var63 = function()
		-- upvalues: var17 (ref), var19 (ref), var23 (ref), var59 (write), constantsModule (copy)
		if var17 and var19 and not var23 then
			local timeOnScreenMs = var17.state and var17.state.timeOnScreenMs
			var59(var17.id, (timeOnScreenMs and timeOnScreenMs / 1000 or constantsModule.DefaultNotificationDisplayTime) + 1, var17)
		end
	end
	
	local var64 = if enableNotificationsToastTTLFix then function(p2, ...)
		-- upvalues: var58 (ref), var17 (ref), var19 (ref), var23 (ref), var59 (write), constantsModule (copy)
		if p2 then
			var58()
			
			return
		elseif var17 and var19 and not var23 then
			local timeOnScreenMs = var17.state and var17.state.timeOnScreenMs
			var59(var17.id, (timeOnScreenMs and timeOnScreenMs / 1000 or constantsModule.DefaultNotificationDisplayTime) + 1, var17)
		end
	end else function(p2, p3, p4)
		if p2 then
			p3()
			
			return
		end
		p4()
	end
	local var65 = reactModule.useCallback(function()
		-- upvalues: var42 (ref)
		for i, v in ipairs(var42) do
			task.cancel(v)
		end
	end, { var42 })
	reactModule.useEffect(function()
		-- upvalues: var65 (ref)
		return function()
			-- upvalues: var65 (copy)
			var65()
		end
	end, { var65 })
	local var66 = reactModule.useCallback(function(p2, p3)
		-- upvalues: typeModule (copy), var60 (ref), var62 (ref), joinExperience (copy), var4 (ref), var32 (ref), default_1 (ref), var56 (ref), userId (ref), httpService (copy), loggerModule (copy), toastNotificationProtocol (copy)
		if p2.actionType == typeModule.ActionTypeEnum.Dismiss then
			var60()
			
			return
		elseif p2.actionType ~= typeModule.ActionTypeEnum.Deeplink then
			if p2.actionType == typeModule.ActionTypeEnum.VoltronBroadcast then
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p2 (ref)
					return httpService:JSONDecode(p2.parameters)
				end)
				
				if ok then
					default_1:voltronBroadcast(p2.messageId, status)
					
					return
				end
				loggerModule:warning("Invalid decoded payload for voltronBroadcast")
				
				return
			elseif p2.actionType == typeModule.ActionTypeEnum.UpdateState and p2.nextState ~= nil and (p2.nextState ~= "" and p3) and p3.id then
				toastNotificationProtocol:updateNotification(p3.id, p2.nextState)
			end
		elseif var62() then
			if joinExperience(p2.path or "", var4) then
				var32(false)
				
				if p3 then
					default_1:dismissNotification(p3.id)
					
					return
				end
			else
				var56(typeModule.ToastNotificationActionsEnum.DeeplinkFailed, userId, p3)
				var60()
				
				return
			end
		end
	end, { var60, var62 })
	local var67 = reactModule.useCallback(function(p2)
		-- upvalues: var66 (ref), var65 (ref), calculateTimeRemaining (copy), var43 (ref)
		local function _(p3)
			-- upvalues: var66 (copy), p2 (ref)
			for i, v in ipairs(p3) do
				var66(v, p2)
			end
		end
		
		var65()
		
		if p2.timers then
			local t = {}
			
			for i, v in pairs(p2.timers) do
				local var68 = calculateTimeRemaining(v, p2.notificationReceivedTimestampMs, p2.displayTimestamp)
				
				if var68 > 0 then
					table.insert(t, task.delay(var68 / 1000, function()
						-- upvalues: v (ref), var66 (copy), p2 (ref)
						for i, v_1 in ipairs(v.actions) do
							var66(v_1, p2)
						end
					end))
				else
					for i_1, v_1 in ipairs(v.actions) do
						var66(v_1, p2)
					end
				end
			end
			if #t > 0 then
				var43(t)
			end
		end
	end, { var66, var65, calculateTimeRemaining })
	local var69 = reactModule.useCallback(function(p4)
		-- upvalues: var29 (ref), var30 (ref), var56 (ref), userId (ref), var17 (ref), lifecycleEventsModule (copy), var66 (ref), typeModule (copy), var62 (ref)
		if var29 then return end
		var30(true)
		
		if p4.eventName then
			var56(p4.eventName, userId, var17)
		end
		if p4.actionEventParams and var17 then
			lifecycleEventsModule:DispatchEvent(lifecycleEventsModule.ToastEvents.UserAction, var17.notificationType, {
				userActionType = "click",
				notificationData = var17,
				visualItem = p4,
				parameters = p4.actionEventParams
			})
		end
		if p4.actions and #p4.actions > 0 then
			for i, v in ipairs(p4.actions) do
				var66(v, var17)
				
				if v.actionType == typeModule.ActionTypeEnum.Deeplink and var62() then break end
			end
		end
		var30(false)
	end, { var17, var60, var29, var62 })
	
	local var70 = function(p5, p6)
		-- upvalues: getFStringPCGDKFilteredNotificationTypes (copy), thirdPartyUserService (copy), default_1 (ref), typeModule (copy), enableDisplayLoggingForToastsFix (copy), default (copy), var56 (ref), userId (ref), var18 (ref), constantsModule (copy), var59 (write), var67 (ref), clientToastNotificationsEnabledEngineFeature (copy), guiService (copy), var26 (ref)
		p5.displayTimestamp = DateTime.now().UnixTimestampMillis
		
		if getFStringPCGDKFilteredNotificationTypes()[p5.notificationType] and (thirdPartyUserService and (thirdPartyUserService:IsChatRestrictionSupported() and thirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted)) then
			default_1:dismissNotification(p5.id)
			
			return
		end
		local var71 = if p6 == "update" then typeModule.ToastNotificationActionsEnum.Update else typeModule.ToastNotificationActionsEnum.Display
		
		if enableDisplayLoggingForToastsFix then
			if default:isSnoozedNotificationType(p5.notificationType) then
				default_1:dismissNotification(p5.id)
				
				return
			end
			var56(var71, userId, p5)
		else
			var56(var71, userId, p5)
			
			if default:isSnoozedNotificationType(p5.notificationType) then
				default_1:dismissNotification(p5.id)
				
				return
			end
		end
		var18(p5)
		local timeOnScreenMs = p5.state and p5.state.timeOnScreenMs
		var59(p5.id, (timeOnScreenMs and timeOnScreenMs / 1000 or constantsModule.DefaultNotificationDisplayTime) + 1, p5)
		
		if p6 == "display" then
			var67(p5)
		end
		if clientToastNotificationsEnabledEngineFeature and p5 and p5.luaNotifInfo then
			guiService:OnNotificationDisplayed(p5.id)
		end
		var26(nil)
	end
	
	local _ = function(p5, p6)
		-- upvalues: var25 (ref), var70 (ref), lifecycleEventsModule (copy), var26 (ref)
		if var25 then
			task.cancel(var25)
		end
		var26(task.delay(p6, function()
			-- upvalues: var70 (copy), p5 (ref), lifecycleEventsModule (copy)
			var70(p5, "display")
			lifecycleEventsModule:DispatchEvent(lifecycleEventsModule.ToastEvents.Display, p5.notificationType, p5)
		end))
	end
	
	local var71 = reactModule.useCallback(function(p5)
		-- upvalues: guiService (copy), typeModule (copy), getFFlagFilterSecurityAlertsVRToastEnabled (copy), var44 (ref), getFFlagEnableChatNewMessage (copy), default_1 (ref), marshalNotificationData (copy), var20 (ref), lifecycleEventsModule (copy)
		if guiService:IsTenFootInterface() and p5 and (p5.notificationType ~= nil and p5.notificationType ~= typeModule.NotificationTypeEnum.ClientNotification) then return end
		if getFFlagFilterSecurityAlertsVRToastEnabled() and var44 and (p5 and p5.notificationType ~= nil) and p5.notificationType == typeModule.NotificationTypeEnum.SecurityAlert then return end
		if p5 and p5.notificationType == typeModule.NotificationTypeEnum.ChatNewMessage and (not getFFlagEnableChatNewMessage() and p5.content) and p5.content.id then
			default_1:dismissNotification(p5.content.id)
			
			return
		elseif p5 and p5.content and p5.content.id ~= nil then
			local var72 = marshalNotificationData(p5)
			var20(var72)
			lifecycleEventsModule:DispatchEvent(lifecycleEventsModule.ToastEvents.AttemptDisplay, var72.notificationType, var72)
			
			return
		end
		var20(nil)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var17 (ref), var70 (ref), lifecycleEventsModule (copy), constantsModule (copy), t (copy), var25 (ref), var26 (ref)
		if var19 then
			if var17 and var17.id == var19.id then
				var70(var19, "update")
				lifecycleEventsModule:DispatchEvent(lifecycleEventsModule.ToastEvents.Update, var19.notificationType, var19)
				
				return
			end
			local var72 = var19
			local var73 = if var19.luaNotifInfo ~= nil then if var17 then 1 / t.frequency else 0 else constantsModule.DisplayNotificationDelay
			
			if var25 then
				task.cancel(var25)
			end
			var26(task.delay(var73, function()
				-- upvalues: var70 (copy), var72 (ref), lifecycleEventsModule (copy)
				var70(var72, "display")
				lifecycleEventsModule:DispatchEvent(lifecycleEventsModule.ToastEvents.Display, var72.notificationType, var72)
			end))
		end
	end, { var19 })
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var17 (ref), var16 (ref), var49 (write)
		local var72
		if var19 and var17 then
			var72 = true
			
			if var19.id ~= var17.id then
				var72 = false
			end
			var16(var72)
			
			if var72 == false then
				var49(false)
			end
		end
	end, { var19, var17 })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var29 (ref), var36 (ref), var38 (ref), var40 (ref), var48 (write), holding (ref), var34 (ref), enableNotificationsToastTTLFix (copy), var35 (ref)
		local var72 = var15 and (var29 or (var36 or (var38 or (var40 or (var48 or holding)))))
		var34(var72)
		
		if enableNotificationsToastTTLFix then
			var35.current = var72
		end
	end, {
		var15, var29, var36, var38, var40, var48, holding
	})
	reactModule.useEffect(function()
		-- upvalues: enableNotificationsToastTTLFix (copy), var64 (write), var33 (ref), var58 (ref), var63 (ref)
		if enableNotificationsToastTTLFix then
			var64(var33)
			
			return
		end
		var64(var33, var58, var63)
	end, { var33 })
	local var72, var73 = reactOtterModule.useAnimatedBinding(1, function()
		-- upvalues: var15 (ref), var18 (ref), var65 (ref)
		if not var15 then
			var18(nil)
			var65()
		end
	end)
	reactModule.useEffect(function()
		-- upvalues: var73 (ref), reactOtterModule (copy), var15 (ref), t (copy)
		var73(reactOtterModule.spring(if var15 then 0 else 1, t))
	end, { var15, var73 })
	reactModule.useEffect(function()
		-- upvalues: fFlagFriendshipNotifsUseSendrExperiment (copy), var17 (ref), typeModule (copy), var1 (copy), var2 (copy), var3 (copy), IXPServiceWrapper (copy), friendshipNotifsUseSendrLayerName (copy), FRRToastPositionVariantKey (copy), calculateToastPosition (copy), var15 (ref), isToastToRight (copy), var11 (ref), var6 (ref), var7 (ref), var13 (ref), var22 (ref)
		local var74
		local _ = nil
		
		if fFlagFriendshipNotifsUseSendrExperiment then
			local var75
			if var17 and var17.notificationType == typeModule.NotificationTypeEnum.FriendRequestReceived then
				if fFlagFriendshipNotifsUseSendrExperiment and not var1 then
					local ok, status = pcall(function()
						-- upvalues: var1 (copy), IXPServiceWrapper (copy), friendshipNotifsUseSendrLayerName (copy)
						var1 = true
						
						return IXPServiceWrapper:GetLayerData(friendshipNotifsUseSendrLayerName)
					end)
					var2 = ok
					var3 = status
				end
				var75 = if (if var2 and var3 then var3[FRRToastPositionVariantKey] else nil) == "legacyBottomRight" then "legacyBottomRight" else nil
			end
			var74 = calculateToastPosition(var15, isToastToRight(var11), var6, var7, var75, var13)
		else
			var74 = calculateToastPosition(var15, isToastToRight(var11), var6, var7)
		end
		var22(var74)
	end, {
		var11, var15, var7,
		if fFlagFriendshipNotifsUseSendrExperiment then var17 else nil,
		if fFlagFriendshipNotifsUseSendrExperiment then var6 else nil,
		if fFlagFriendshipNotifsUseSendrExperiment then var13 else nil
	})
	reactModule.useEffect(function()
		-- upvalues: getDeviceOrientation (copy), getNotificationSize (copy), var4 (ref), var10 (ref), var28 (ref), constantsModule (copy), var12 (ref), fFlagFriendshipNotifsUseSendrExperiment (copy), var14 (ref)
		local viewportSize = workspace.CurrentCamera.ViewportSize
		local var74 = getDeviceOrientation(viewportSize)
		var10(getNotificationSize(var4, viewportSize.X))
		var28(var4 and workspace.CurrentCamera.ViewportSize.X < constantsModule.CompactCardThreashold)
		var12(var74)
		local var75 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			-- upvalues: getDeviceOrientation (copy), getNotificationSize (copy), var4 (copy), var10 (copy), var28 (copy), constantsModule (copy), var12 (copy), fFlagFriendshipNotifsUseSendrExperiment (copy), var14 (copy)
			local viewportSize = workspace.CurrentCamera.ViewportSize
			local var76 = getDeviceOrientation(viewportSize)
			var10(getNotificationSize(var4, viewportSize.X))
			var28(var4 and workspace.CurrentCamera.ViewportSize.X < constantsModule.CompactCardThreashold)
			var12(var76)
			
			if fFlagFriendshipNotifsUseSendrExperiment then
				var14(workspace.CurrentCamera.ViewportSize)
			end
		end)
		
		return function()
			-- upvalues: var75 (ref)
			if var75 then
				var75:Disconnect()
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var25 (ref), var23 (ref), var52 (ref), var53 (ref)
		return function()
			-- upvalues: var25 (copy), var23 (copy), var52 (copy), var53 (copy)
			if var25 then
				task.cancel(var25)
			end
			if var23 then
				task.cancel(var23)
			end
			if var52 then
				var53(nil)
				var52:Fire(false)
				var52:Destroy()
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), typeModule (copy), var5 (ref), default_1 (ref)
		task.delay(0, function()
			-- upvalues: var4 (copy), typeModule (copy), var5 (copy), default_1 (copy)
			local var74 = if var4 then {
				typeModule.ChannelListEnum.Experience,
				typeModule.ChannelListEnum.Dual
			} else {
				typeModule.ChannelListEnum.App,
				typeModule.ChannelListEnum.Dual
			}
			
			if var5 then
				table.insert(var74, typeModule.ChannelListEnum.Desktop)
			end
			default_1:setupNotifications(var74)
		end)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: default_1 (ref), var71 (ref)
		local var74 = default_1:listenToDisplayNotification(var71)
		
		return function()
			-- upvalues: var74 (ref)
			if var74 then
				var74:Disconnect()
			end
		end
	end, { var71 })
	local var74 = isVRAppBuild()
	local var75 = var15 or not var74
	local var76 = var55 and (not touchEnabled and (not var74 and var15))
	local textButton = reactModule.createElement("TextButton", {
		ZIndex = 2,
		LayoutOrder = 1,
		AnchorPoint = Vector2.new(0, 0),
		Size = UDim2.new(0, constantsModule.CardSizeDefault.closeButton, 0, constantsModule.CardSizeDefault.closeButton),
		Position = UDim2.new(0, -10, 0, -10),
		BackgroundTransparency = var54.Theme.BackgroundUIDefault.Transparency,
		BackgroundColor3 = var54.Theme.BackgroundUIDefault.Color,
		Text = "",
		[reactModule.Event.Activated] = var61,
		[reactModule.Event.MouseEnter] = function()
			-- upvalues: var39 (ref)
			var39(true)
		end,
		[reactModule.Event.MouseLeave] = function()
			-- upvalues: var39 (ref)
			var39(false)
		end
	}, {
		Border = reactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = var54.Theme.UIDefault.Color
		}),
		UICorner = reactModule.createElement("UICorner", {
			CornerRadius = constantsModule.DefaultCardCloseButtonCornerRadius
		}),
		CloseButtonIcon = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, constantsModule.CardSizeDefault.closeIcon, 0, constantsModule.CardSizeDefault.closeIcon),
			Image = close,
			ImageColor3 = var54.Theme.SystemPrimaryDefault.Color
		})
	})
	local var77 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), springAnimatedItem (copy), var9 (ref), var75 (ref), var17 (ref), var56 (ref), typeModule (copy), userId (ref), var37 (ref), var21 (ref), t (copy), var74 (ref), var15 (ref), var18 (ref), var65 (ref), swipeDetectionWrapperModule (copy), var60 (ref), var39 (ref), clientToastNotificationsEnabledEngineFeature (copy), clientNotificationWrapperModule (copy), var41 (ref), enableClientToastNotificationsReducedMotion (copy), var72 (ref), var76 (ref), textButton (ref), notificationCardProviderModule (copy), var27 (ref), var69 (ref), notificationCardModule (copy), var55 (ref), var48 (write), var45 (ref), holdProgress (ref)
		return reactModule.createElement(springAnimatedItem.AnimatedFrame, {
			regularProps = {
				ClipsDescendants = false,
				Size = var9,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Active = true,
				Visible = var75 and var17 ~= nil,
				[reactModule.Event.MouseEnter] = function()
					-- upvalues: var56 (copy), typeModule (copy), userId (copy), var17 (copy), var37 (copy)
					var56(typeModule.ToastNotificationActionsEnum.Hover, userId, var17)
					var37(true)
				end,
				[reactModule.Event.MouseLeave] = function()
					-- upvalues: var37 (copy)
					var37(false)
				end
			},
			animatedValues = var21,
			springOptions = t,
			mapValuesToProps = function(p5)
				-- upvalues: var74 (copy)
				return {
					Position = if var74 then UDim2.new(0.5, 0, 0.5, 0) else UDim2.new(p5.positionX, p5.positionXOffset, p5.positionY, p5.positionYOffset),
					AnchorPoint = if var74 then Vector2.new(0.5, 0.5) else Vector2.new(p5.anchorX, p5.anchorY)
				}
			end,
			onComplete = function()
				-- upvalues: var15 (copy), var18 (copy), var65 (copy)
				if not var15 then
					var18(nil)
					var65()
				end
			end
		}, {
			SwipeDetector = reactModule.createElement(swipeDetectionWrapperModule, {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				swipeEnabled = var15,
				swipeCallback = function(p5)
					-- upvalues: var56 (copy), typeModule (copy), userId (copy), var17 (copy), var60 (copy), var39 (copy)
					if p5 == Enum.SwipeDirection.Up or p5 == Enum.SwipeDirection.Right then
						var56(typeModule.ToastNotificationActionsEnum.Dismissed, userId, var17)
						var60()
						var39(false)
					end
				end
			}, {
				NotificationProvider = if clientToastNotificationsEnabledEngineFeature and var17 and (var17.luaNotifInfo and var17.id) then reactModule.createElement(clientNotificationWrapperModule, {
					notificationInfo = var17.luaNotifInfo,
					notificationId = var17.id,
					onPause = var41,
					onHover = var37,
					transparency = if enableClientToastNotificationsReducedMotion then var72 else nil,
					width = var9.X
				}, { ToastCloseButton = if var76 then textButton else nil }) else reactModule.createElement(notificationCardProviderModule, {
					state = var17 and var17.state,
					isCompact = var27,
					handleActions = var69,
					notificationReceivedTimestampMs = var17 and var17.notificationReceivedTimestampMs,
					timers = var17 and var17.timers,
					displayTimestampMs = var17 and var17.displayTimestamp
				}, {
					NotificationCardCanvasGroup = if var17 then reactModule.createElement("CanvasGroup", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = var9,
						GroupTransparency = var72
					}, {
						NotificationCard = reactModule.createElement(notificationCardModule, {
							isHover = var55,
							shouldAutoFocus = var48,
							showHoldButton = var45,
							holdProgress = holdProgress
						})
					}) else nil,
					ToastCloseButton = if var76 then textButton else nil
				})
			})
		})
	end, {
		constantsModule, var54, var17, var75, var15, var27, var76, var55, var21,
		var61, var37, var39, var69
	})
	
	return if var74 then reactModule.createElement(toastVRWrapperModule, {
		isConfirmModalOpen = var31,
		isToastOpen = var15,
		isCoreScript = var4,
		ToastComponent = var77,
		ToastNotificationSnoozeMenu = reactModule.createElement(toastNotificationSnoozeMenuModule),
		ConfirmationModalComponent = reactModule.createElement(deeplinkConfirmationModal, { backgroundTransparency = 1, closeCallback = var57 })
	}) else reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		DisplayOrder = p1.displayOrder,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Toast = var77,
		ToastNotificationSnoozeMenu = reactModule.createElement(toastNotificationSnoozeMenuModule),
		DeeplinkConfirmationModal = var31 and reactModule.createElement(deeplinkConfirmationModal, { closeCallback = var57 })
	})
end