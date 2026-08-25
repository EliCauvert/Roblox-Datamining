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
local var33 = false
local var34 = nil
local var35 = nil

local _ = function()
	-- upvalues: fFlagFriendshipNotifsUseSendrExperiment (ref), var33 (write), var34 (write), var35 (write), IXPServiceWrapper (ref), friendshipNotifsUseSendrLayerName (ref), FRRToastPositionVariantKey (ref)
	if fFlagFriendshipNotifsUseSendrExperiment and not var33 then
		local ok, status = pcall(function()
			-- upvalues: var33 (copy), IXPServiceWrapper (copy), friendshipNotifsUseSendrLayerName (copy)
			var33 = true
			
			return IXPServiceWrapper:GetLayerData(friendshipNotifsUseSendrLayerName)
		end)
		var34 = ok
		var35 = status
	end
	return if var34 and var35 then var35[FRRToastPositionVariantKey] else nil
end

local t = { frequency = 4, damping = 1 }
local getDeviceOrientation = toastNotificationHelperModule.getDeviceOrientation
local getNotificationSize = toastNotificationHelperModule.getNotificationSize
local marshalNotificationData = toastNotificationHelperModule.marshalNotificationData
local calculateToastPosition = toastNotificationHelperModule.calculateToastPosition
local isToastToRight = toastNotificationHelperModule.isToastToRight
local calculateTimeRemaining = toastNotificationHelperModule.calculateTimeRemaining

return function(p0)
	-- upvalues: typeModule (ref), toastNotificationHelperModule (ref), constantsModule (ref), toastNotificationProtocol (ref), reactModule (ref), userGameSettingsService (ref), getNotificationSize (ref), getDeviceOrientation (ref), fFlagFriendshipNotifsUseSendrExperiment (ref), calculateToastPosition (ref), isToastToRight (ref), useIsSpatial (ref), usePreferredInput (ref), responsiveModule (ref), userInputService (ref), useKeyCodeHoldModule (ref), useStyle (ref), playersService (ref), loggerModule (ref), analyticsServiceModule (ref), toastNotificationSessionizationHelperModule (ref), cryoModule (ref), default (ref), var33 (write), var34 (write), var35 (write), IXPServiceWrapper (ref), friendshipNotifsUseSendrLayerName (ref), FRRToastPositionVariantKey (ref), enableNotificationsToastTTLFix (ref), clientToastNotificationsEnabledEngineFeature (ref), guiService (ref), joinExperience (ref), httpService (ref), calculateTimeRemaining (ref), lifecycleEventsModule (ref), getFStringPCGDKFilteredNotificationTypes (ref), thirdPartyUserService (ref), enableDisplayLoggingForToastsFix (ref), getFFlagFilterSecurityAlertsVRToastEnabled (ref), getFFlagEnableChatNewMessage (ref), marshalNotificationData (ref), t (ref), reactOtterModule (ref), isVRAppBuild (ref), touchEnabled (ref), imageSetLabel (ref), close (ref), springAnimatedItem (ref), swipeDetectionWrapperModule (ref), clientNotificationWrapperModule (ref), enableClientToastNotificationsReducedMotion (ref), notificationCardProviderModule (ref), notificationCardModule (ref), toastVRWrapperModule (ref), toastNotificationSnoozeMenuModule (ref), deeplinkConfirmationModal (ref)
	local var37 = p0.renderLocation == typeModule.RenderLocationEnum.CoreScript
	local var38 = toastNotificationHelperModule.isDesktopDevice()
	local var39 = if var37 then constantsModule.CardTopMargin.Experience else constantsModule.CardTopMargin.App
	local default_1 = toastNotificationProtocol.default
	
	local _ = function()
		return workspace.CurrentCamera.ViewportSize
	end
	
	local _ = function(p1)
		-- upvalues: constantsModule (copy)
		return p1 and workspace.CurrentCamera.ViewportSize.X < constantsModule.CompactCardThreashold
	end
	
	local var40, var41 = reactModule.useState(userGameSettingsService.ReducedMotion)
	local var42, var43 = reactModule.useState(getNotificationSize(var37, workspace.CurrentCamera.ViewportSize.X))
	local var44, var45 = reactModule.useState(getDeviceOrientation(workspace.CurrentCamera.ViewportSize))
	local var46, var47 = reactModule.useState(if fFlagFriendshipNotifsUseSendrExperiment then workspace.CurrentCamera.ViewportSize else nil)
	local var48, var49 = reactModule.useState(false)
	local var50, var51 = reactModule.useState(nil)
	local var52, var53 = reactModule.useState(nil)
	local var54, var55 = reactModule.useState(calculateToastPosition(false, isToastToRight(var44), var39, var40))
	local var56, var57 = reactModule.useState(nil)
	local var58, var59 = reactModule.useState(nil)
	local var60, var61 = reactModule.useState(function()
		-- upvalues: var37 (ref), constantsModule (copy)
		return var37 and workspace.CurrentCamera.ViewportSize.X < constantsModule.CompactCardThreashold
	end)
	local var62, var63 = reactModule.useState(false)
	local var64, var65 = reactModule.useState(false)
	local var66, var67 = reactModule.useState(false)
	local var68 = reactModule.useRef(false)
	local var69, var70 = reactModule.useState(false)
	local var71, var72 = reactModule.useState(false)
	local var73, var74 = reactModule.useState(false)
	local var75, var76 = reactModule.useState({})
	local var77 = useIsSpatial()
	local _ = nil
	local _ = nil
	local var78 = usePreferredInput() == responsiveModule.Input.Directional
	local var79, var80 = reactModule.useState(false)
	local var81 = var79
	local var82 = var80
	local var83 = reactModule.useMemo(function()
		-- upvalues: var78 (ref), var81 (write), var50 (ref)
		return not var78 or (var81 or var50 == nil)
	end, { var78, var81, var50 })
	reactModule.useEffect(function()
		-- upvalues: var81 (write), userInputService (copy), var82 (write)
		if var81 then
			local inputBeganConnection = userInputService.InputBegan:Connect(function(p2, p3)
				-- upvalues: var82 (copy)
				if p3 then return end
				if p2.KeyCode == Enum.KeyCode.ButtonB then
					var82(false)
				end
			end)
			
			return function()
				-- upvalues: inputBeganConnection (ref)
				inputBeganConnection:Disconnect()
			end
		end
	end, { var81 })
	local var84 = useKeyCodeHoldModule(Enum.KeyCode.ButtonSelect, constantsModule.SIGNAL_HOLD_INTENT_SECONDS, constantsModule.SIGNAL_HOLD_COMPLETE_SECONDS, reactModule.useCallback(function()
		-- upvalues: var82 (write)
		var82(true)
	end, {}), var83)
	local holdProgress = var84.holdProgress
	local holding = var84.holding
	local var85, var86 = reactModule.useState(Instance.new("BindableEvent"))
	local var87 = useStyle()
	
	local _ = function()
		-- upvalues: getDeviceOrientation (copy), getNotificationSize (copy), var37 (ref), var43 (ref), var61 (ref), constantsModule (copy), var45 (ref)
		local viewportSize = workspace.CurrentCamera.ViewportSize
		local var113 = getDeviceOrientation(viewportSize)
		var43(getNotificationSize(var37, viewportSize.X))
		var61(var37 and workspace.CurrentCamera.ViewportSize.X < constantsModule.CompactCardThreashold)
		var45(var113)
	end
	
	local _ = function(p4)
		-- upvalues: default_1 (ref)
		default_1:dismissNotification(p4)
	end
	
	local var69_1 = var69 or var71
	local userId = playersService and (playersService.LocalPlayer and (playersService.LocalPlayer.UserId or nil))
	
	local var90 = function(p5, p6, p7)
		-- upvalues: loggerModule (copy), analyticsServiceModule (copy), toastNotificationSessionizationHelperModule (copy), toastNotificationHelperModule (copy), cryoModule (copy), constantsModule (copy), var37 (ref), default (copy), fFlagFriendshipNotifsUseSendrExperiment (copy), typeModule (copy), var33 (copy), var34 (copy), var35 (copy), IXPServiceWrapper (copy), friendshipNotifsUseSendrLayerName (copy), FRRToastPositionVariantKey (copy)
		if p7 == nil then return end
		local var116
		loggerModule:info("NotificationType: {} with event: {}", p7.notificationType, p5)
		local eventStream = analyticsServiceModule.EventStream
		toastNotificationSessionizationHelperModule(p5)
		local var114 = if p7 and p7.displayTimestamp then DateTime.now().UnixTimestampMillis - p7.displayTimestamp else 0
		local fireEvent = toastNotificationHelperModule.fireEvent
		local join = cryoModule.Dictionary.join
		local t = {
			action_type = p5,
			delivery_channel = constantsModule.DeliveryChannel,
			notification_type = if p7 then p7.notificationType else nil,
			notification_id = if p7 then p7.id else nil,
			recipient_userid = p6 or nil,
			recipient_universe_id = if var37 then game and game.GameId else nil,
			client_destination = if var37 then constantsModule.Destinations.Experience else constantsModule.Destinations.App,
			deliver_timestamp = if p7 then p7.deliverTimestamp else nil,
			snoozed = if p7 and p7.notificationType then default:isSnoozedNotificationType(p7.notificationType) else false,
			time_to_action_timestamp = var114
		}
		
		if fFlagFriendshipNotifsUseSendrExperiment and p7.notificationType == typeModule.NotificationTypeEnum.FriendRequestReceived then
			if fFlagFriendshipNotifsUseSendrExperiment and not var33 then
				local ok, status = pcall(function()
					-- upvalues: var33 (copy), IXPServiceWrapper (copy), friendshipNotifsUseSendrLayerName (copy)
					var33 = true
					
					return IXPServiceWrapper:GetLayerData(friendshipNotifsUseSendrLayerName)
				end)
				var34 = ok
				var35 = status
			end
			var116 = if var34 and var35 then var35[FRRToastPositionVariantKey] else nil
		else
			var116 = nil
		end
		t.frr_toast_position_variant = var116
		fireEvent(eventStream, join(t, if p7 then p7.clientEventsPayload else {}))
	end
	
	reactModule.useEffect(function()
		-- upvalues: userGameSettingsService (copy), var41 (ref)
		local changedConnection = userGameSettingsService.Changed:Connect(function(p8)
			-- upvalues: userGameSettingsService (copy), var41 (copy)
			if p8 == "ReducedMotion" then
				local ok, status = pcall(function()
					-- upvalues: userGameSettingsService (copy), p8 (ref)
					return userGameSettingsService[p8]
				end)
				
				if ok then
					var41(status)
				end
			end
		end)
		
		return function()
			-- upvalues: changedConnection (ref)
			if changedConnection then
				changedConnection:Disconnect()
			end
		end
	end, { var41, userGameSettingsService })
	
	local var91 = function(p9)
		-- upvalues: var90 (ref), typeModule (copy), userId (ref), var50 (ref), var65 (ref), var85 (ref)
		if not p9 then
			var90(typeModule.ToastNotificationActionsEnum.ModalCancel, userId, var50)
			var65(false)
		end
		if var85 then
			var90(typeModule.ToastNotificationActionsEnum.ModalConfirm, userId, var50)
			var85:Fire(p9)
		end
	end
	
	local var92 = reactModule.useCallback(function()
		-- upvalues: var56 (ref), var57 (ref)
		if var56 then
			task.cancel(var56)
		end
		var57(nil)
	end, { var56 })
	
	local _ = function(p10)
		-- upvalues: default_1 (ref), var53 (ref), var92 (ref)
		default_1:dismissNotification(p10)
		var53(nil)
		var92()
	end
	
	local _ = function(p11)
		-- upvalues: constantsModule (copy)
		local timeOnScreenMs = p11.state and p11.state.timeOnScreenMs
		
		return (timeOnScreenMs and timeOnScreenMs / 1000 or constantsModule.DefaultNotificationDisplayTime) + 1
	end
	
	local var93 = if enableNotificationsToastTTLFix then function(p15, p16, p17)
		-- upvalues: var92 (ref), var68 (ref), var90 (ref), typeModule (copy), userId (ref), clientToastNotificationsEnabledEngineFeature (copy), guiService (copy), default_1 (ref), var53 (ref), var57 (ref)
		var92()
		var57(task.delay(p16, function()
			-- upvalues: var68 (copy), var92 (copy), var90 (copy), typeModule (copy), userId (copy), p17 (ref), clientToastNotificationsEnabledEngineFeature (copy), guiService (copy), p15 (ref), default_1 (copy), var53 (copy)
			if var68.current then
				var92()
				
				return
			end
			var90(typeModule.ToastNotificationActionsEnum.Ignored, userId, p17)
			
			if clientToastNotificationsEnabledEngineFeature and p17 and p17.luaNotifInfo then
				guiService:DismissNotification(p15)
				
				return
			end
			default_1:dismissNotification(p15)
			var53(nil)
			var92()
		end))
	end else reactModule.useCallback(function(p12, p13, p14)
		-- upvalues: var92 (ref), var66 (ref), var90 (ref), typeModule (copy), userId (ref), clientToastNotificationsEnabledEngineFeature (copy), guiService (copy), default_1 (ref), var53 (ref), var57 (ref)
		var92()
		var57(task.delay(p13, function()
			-- upvalues: var66 (copy), var90 (copy), typeModule (copy), userId (copy), p14 (ref), clientToastNotificationsEnabledEngineFeature (copy), guiService (copy), p12 (ref), default_1 (copy), var53 (copy), var92 (copy)
			if not var66 then
				var90(typeModule.ToastNotificationActionsEnum.Ignored, userId, p14)
				
				if clientToastNotificationsEnabledEngineFeature and p14 and p14.luaNotifInfo then
					guiService:DismissNotification(p12)
					
					return
				end
				default_1:dismissNotification(p12)
				var53(nil)
				var92()
			end
		end))
	end, { var66 })
	local var94 = reactModule.useCallback(function()
		-- upvalues: var50 (ref), var52 (ref), clientToastNotificationsEnabledEngineFeature (copy), guiService (copy), default_1 (ref), var53 (ref), var92 (ref)
		if var50 and var52 and var52.id == var50.id then
			if clientToastNotificationsEnabledEngineFeature and var50.luaNotifInfo then
				guiService:DismissNotification(var50.id)
				
				return
			end
			default_1:dismissNotification(var50.id)
			var53(nil)
			var92()
		end
	end, { var50, var52 })
	
	local var95 = function()
		-- upvalues: var90 (ref), typeModule (copy), userId (ref), var50 (ref), var94 (ref), var72 (ref)
		var90(typeModule.ToastNotificationActionsEnum.Dismissed, userId, var50)
		var94()
		var72(false)
	end
	
	local var96 = reactModule.useCallback(function()
		-- upvalues: var37 (ref), var85 (ref), var65 (ref)
		if var37 and var85 then
			var65(true)
			
			return var85.Event:Wait()
		end
		return true
	end, { var37, var85 })
	
	local var97 = function()
		-- upvalues: var50 (ref), var52 (ref), var56 (ref), var93 (write), constantsModule (copy)
		if var50 and var52 and not var56 then
			local timeOnScreenMs = var50.state and var50.state.timeOnScreenMs
			var93(var50.id, (timeOnScreenMs and timeOnScreenMs / 1000 or constantsModule.DefaultNotificationDisplayTime) + 1, var50)
		end
	end
	
	local var98 = if enableNotificationsToastTTLFix then function(p21, ...)
		-- upvalues: var92 (ref), var50 (ref), var52 (ref), var56 (ref), var93 (write), constantsModule (copy)
		if p21 then
			var92()
			
			return
		elseif var50 and var52 and not var56 then
			local timeOnScreenMs = var50.state and var50.state.timeOnScreenMs
			var93(var50.id, (timeOnScreenMs and timeOnScreenMs / 1000 or constantsModule.DefaultNotificationDisplayTime) + 1, var50)
		end
	end else function(p18, p19, p20)
		if p18 then
			p19()
			
			return
		end
		p20()
	end
	local var99 = reactModule.useCallback(function()
		-- upvalues: var75 (ref)
		for i, v in ipairs(var75) do
			task.cancel(v)
		end
	end, { var75 })
	reactModule.useEffect(function()
		-- upvalues: var99 (ref)
		return function()
			-- upvalues: var99 (copy)
			var99()
		end
	end, { var99 })
	local var100 = reactModule.useCallback(function(p22, p23)
		-- upvalues: typeModule (copy), var94 (ref), var96 (ref), joinExperience (copy), var37 (ref), var65 (ref), default_1 (ref), var90 (ref), userId (ref), httpService (copy), loggerModule (copy), toastNotificationProtocol (copy)
		if p22.actionType == typeModule.ActionTypeEnum.Dismiss then
			var94()
			
			return
		elseif p22.actionType ~= typeModule.ActionTypeEnum.Deeplink then
			if p22.actionType == typeModule.ActionTypeEnum.VoltronBroadcast then
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p22 (ref)
					return httpService:JSONDecode(p22.parameters)
				end)
				
				if ok then
					default_1:voltronBroadcast(p22.messageId, status)
					
					return
				end
				loggerModule:warning("Invalid decoded payload for voltronBroadcast")
				
				return
			elseif p22.actionType == typeModule.ActionTypeEnum.UpdateState and p22.nextState ~= nil and (p22.nextState ~= "" and p23) and p23.id then
				toastNotificationProtocol:updateNotification(p23.id, p22.nextState)
			end
		elseif var96() then
			if joinExperience(p22.path or "", var37) then
				var65(false)
				
				if p23 then
					default_1:dismissNotification(p23.id)
					
					return
				end
			else
				var90(typeModule.ToastNotificationActionsEnum.DeeplinkFailed, userId, p23)
				var94()
				
				return
			end
		end
	end, { var94, var96 })
	local var101 = reactModule.useCallback(function(p24)
		-- upvalues: var100 (ref), var99 (ref), calculateTimeRemaining (copy), var76 (ref)
		local function _(p25)
			-- upvalues: var100 (copy), p24 (ref)
			for i, v in ipairs(p25) do
				var100(v, p24)
			end
		end
		
		var99()
		
		if p24.timers then
			local t = {}
			
			for i, v in pairs(p24.timers) do
				local var122 = calculateTimeRemaining(v, p24.notificationReceivedTimestampMs, p24.displayTimestamp)
				
				if var122 > 0 then
					table.insert(t, task.delay(var122 / 1000, function()
						-- upvalues: v (ref), var100 (copy), p24 (ref)
						for i, v_1 in ipairs(v.actions) do
							var100(v_1, p24)
						end
					end))
				else
					for i_1, v_1 in ipairs(v.actions) do
						var100(v_1, p24)
					end
				end
			end
			if #t > 0 then
				var76(t)
			end
		end
	end, { var100, var99, calculateTimeRemaining })
	local var102 = reactModule.useCallback(function(p26)
		-- upvalues: var62 (ref), var63 (ref), var90 (ref), userId (ref), var50 (ref), lifecycleEventsModule (copy), var100 (ref), typeModule (copy), var96 (ref)
		if var62 then return end
		var63(true)
		
		if p26.eventName then
			var90(p26.eventName, userId, var50)
		end
		if p26.actionEventParams and var50 then
			lifecycleEventsModule:DispatchEvent(lifecycleEventsModule.ToastEvents.UserAction, var50.notificationType, {
				userActionType = "click",
				notificationData = var50,
				visualItem = p26,
				parameters = p26.actionEventParams
			})
		end
		if p26.actions and #p26.actions > 0 then
			for i, v in ipairs(p26.actions) do
				var100(v, var50)
				
				if v.actionType == typeModule.ActionTypeEnum.Deeplink and var96() then break end
			end
		end
		var63(false)
	end, { var50, var94, var62, var96 })
	
	local var103 = function(p27, p28)
		-- upvalues: getFStringPCGDKFilteredNotificationTypes (copy), thirdPartyUserService (copy), default_1 (ref), typeModule (copy), enableDisplayLoggingForToastsFix (copy), default (copy), var90 (ref), userId (ref), var51 (ref), constantsModule (copy), var93 (write), var101 (ref), clientToastNotificationsEnabledEngineFeature (copy), guiService (copy), var59 (ref)
		p27.displayTimestamp = DateTime.now().UnixTimestampMillis
		
		if getFStringPCGDKFilteredNotificationTypes()[p27.notificationType] and (thirdPartyUserService and (thirdPartyUserService:IsChatRestrictionSupported() and thirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted)) then
			default_1:dismissNotification(p27.id)
			
			return
		end
		local var123 = if p28 == "update" then typeModule.ToastNotificationActionsEnum.Update else typeModule.ToastNotificationActionsEnum.Display
		
		if enableDisplayLoggingForToastsFix then
			if default:isSnoozedNotificationType(p27.notificationType) then
				default_1:dismissNotification(p27.id)
				
				return
			end
			var90(var123, userId, p27)
		else
			var90(var123, userId, p27)
			
			if default:isSnoozedNotificationType(p27.notificationType) then
				default_1:dismissNotification(p27.id)
				
				return
			end
		end
		var51(p27)
		local timeOnScreenMs = p27.state and p27.state.timeOnScreenMs
		var93(p27.id, (timeOnScreenMs and timeOnScreenMs / 1000 or constantsModule.DefaultNotificationDisplayTime) + 1, p27)
		
		if p28 == "display" then
			var101(p27)
		end
		if clientToastNotificationsEnabledEngineFeature and p27 and p27.luaNotifInfo then
			guiService:OnNotificationDisplayed(p27.id)
		end
		var59(nil)
	end
	
	local _ = function(p29, p30)
		-- upvalues: var58 (ref), var103 (ref), lifecycleEventsModule (copy), var59 (ref)
		if var58 then
			task.cancel(var58)
		end
		var59(task.delay(p30, function()
			-- upvalues: var103 (copy), p29 (ref), lifecycleEventsModule (copy)
			var103(p29, "display")
			lifecycleEventsModule:DispatchEvent(lifecycleEventsModule.ToastEvents.Display, p29.notificationType, p29)
		end))
	end
	
	local var104 = reactModule.useCallback(function(p31)
		-- upvalues: guiService (copy), typeModule (copy), getFFlagFilterSecurityAlertsVRToastEnabled (copy), var77 (ref), getFFlagEnableChatNewMessage (copy), default_1 (ref), marshalNotificationData (copy), var53 (ref), lifecycleEventsModule (copy)
		if guiService:IsTenFootInterface() and p31 and (p31.notificationType ~= nil and p31.notificationType ~= typeModule.NotificationTypeEnum.ClientNotification) then return end
		if getFFlagFilterSecurityAlertsVRToastEnabled() and var77 and (p31 and p31.notificationType ~= nil) and p31.notificationType == typeModule.NotificationTypeEnum.SecurityAlert then return end
		if p31 and p31.notificationType == typeModule.NotificationTypeEnum.ChatNewMessage and (not getFFlagEnableChatNewMessage() and p31.content) and p31.content.id then
			default_1:dismissNotification(p31.content.id)
			
			return
		elseif p31 and p31.content and p31.content.id ~= nil then
			local var125 = marshalNotificationData(p31)
			var53(var125)
			lifecycleEventsModule:DispatchEvent(lifecycleEventsModule.ToastEvents.AttemptDisplay, var125.notificationType, var125)
			
			return
		end
		var53(nil)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var52 (ref), var50 (ref), var103 (ref), lifecycleEventsModule (copy), constantsModule (copy), t (copy), var58 (ref), var59 (ref)
		if var52 then
			if var50 and var50.id == var52.id then
				var103(var52, "update")
				lifecycleEventsModule:DispatchEvent(lifecycleEventsModule.ToastEvents.Update, var52.notificationType, var52)
				
				return
			end
			local var126 = var52
			local var127 = if var52.luaNotifInfo ~= nil then if var50 then 1 / t.frequency else 0 else constantsModule.DisplayNotificationDelay
			
			if var58 then
				task.cancel(var58)
			end
			var59(task.delay(var127, function()
				-- upvalues: var103 (copy), var126 (ref), lifecycleEventsModule (copy)
				var103(var126, "display")
				lifecycleEventsModule:DispatchEvent(lifecycleEventsModule.ToastEvents.Display, var126.notificationType, var126)
			end))
		end
	end, { var52 })
	reactModule.useEffect(function()
		-- upvalues: var52 (ref), var50 (ref), var49 (ref), var82 (write)
		local var128
		if var52 and var50 then
			var128 = true
			
			if var52.id ~= var50.id then
				var128 = false
			end
			var49(var128)
			
			if var128 == false then
				var82(false)
			end
		end
	end, { var52, var50 })
	reactModule.useEffect(function()
		-- upvalues: var48 (ref), var62 (ref), var69 (ref), var71 (ref), var73 (ref), var81 (write), holding (ref), var67 (ref), enableNotificationsToastTTLFix (copy), var68 (ref)
		local var62_1 = var48 and (var62 or (var69 or (var71 or (var73 or (var81 or holding)))))
		var67(var62_1)
		
		if enableNotificationsToastTTLFix then
			var68.current = var62_1
		end
	end, {
		var48, var62, var69, var71, var73, var81, holding
	})
	reactModule.useEffect(function()
		-- upvalues: enableNotificationsToastTTLFix (copy), var98 (write), var66 (ref), var92 (ref), var97 (ref)
		if enableNotificationsToastTTLFix then
			var98(var66)
			
			return
		end
		var98(var66, var92, var97)
	end, { var66 })
	local var105, var106 = reactOtterModule.useAnimatedBinding(1, function()
		-- upvalues: var48 (ref), var51 (ref), var99 (ref)
		if not var48 then
			var51(nil)
			var99()
		end
	end)
	reactModule.useEffect(function()
		-- upvalues: var106 (ref), reactOtterModule (copy), var48 (ref), t (copy)
		var106(reactOtterModule.spring(if var48 then 0 else 1, t))
	end, { var48, var106 })
	reactModule.useEffect(function()
		-- upvalues: fFlagFriendshipNotifsUseSendrExperiment (copy), var50 (ref), typeModule (copy), var33 (copy), var34 (copy), var35 (copy), IXPServiceWrapper (copy), friendshipNotifsUseSendrLayerName (copy), FRRToastPositionVariantKey (copy), calculateToastPosition (copy), var48 (ref), isToastToRight (copy), var44 (ref), var39 (ref), var40 (ref), var46 (ref), var55 (ref)
		local var131
		local _ = nil
		
		if fFlagFriendshipNotifsUseSendrExperiment then
			local var130
			if var50 and var50.notificationType == typeModule.NotificationTypeEnum.FriendRequestReceived then
				if fFlagFriendshipNotifsUseSendrExperiment and not var33 then
					local ok, status = pcall(function()
						-- upvalues: var33 (copy), IXPServiceWrapper (copy), friendshipNotifsUseSendrLayerName (copy)
						var33 = true
						
						return IXPServiceWrapper:GetLayerData(friendshipNotifsUseSendrLayerName)
					end)
					var34 = ok
					var35 = status
				end
				var130 = if (if var34 and var35 then var35[FRRToastPositionVariantKey] else nil) == "legacyBottomRight" then "legacyBottomRight" else nil
			end
			var131 = calculateToastPosition(var48, isToastToRight(var44), var39, var40, var130, var46)
		else
			var131 = calculateToastPosition(var48, isToastToRight(var44), var39, var40)
		end
		var55(var131)
	end, {
		var44, var48, var40,
		if fFlagFriendshipNotifsUseSendrExperiment then var50 else nil,
		if fFlagFriendshipNotifsUseSendrExperiment then var39 else nil,
		if fFlagFriendshipNotifsUseSendrExperiment then var46 else nil
	})
	reactModule.useEffect(function()
		-- upvalues: getDeviceOrientation (copy), getNotificationSize (copy), var37 (ref), var43 (ref), var61 (ref), constantsModule (copy), var45 (ref), fFlagFriendshipNotifsUseSendrExperiment (copy), var47 (ref)
		local viewportSize = workspace.CurrentCamera.ViewportSize
		local var132 = getDeviceOrientation(viewportSize)
		var43(getNotificationSize(var37, viewportSize.X))
		var61(var37 and workspace.CurrentCamera.ViewportSize.X < constantsModule.CompactCardThreashold)
		var45(var132)
		local var133 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			-- upvalues: getDeviceOrientation (copy), getNotificationSize (copy), var37 (copy), var43 (copy), var61 (copy), constantsModule (copy), var45 (copy), fFlagFriendshipNotifsUseSendrExperiment (copy), var47 (copy)
			local viewportSize = workspace.CurrentCamera.ViewportSize
			local var134 = getDeviceOrientation(viewportSize)
			var43(getNotificationSize(var37, viewportSize.X))
			var61(var37 and workspace.CurrentCamera.ViewportSize.X < constantsModule.CompactCardThreashold)
			var45(var134)
			
			if fFlagFriendshipNotifsUseSendrExperiment then
				var47(workspace.CurrentCamera.ViewportSize)
			end
		end)
		
		return function()
			-- upvalues: var133 (ref)
			if var133 then
				var133:Disconnect()
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var58 (ref), var56 (ref), var85 (ref), var86 (ref)
		return function()
			-- upvalues: var58 (copy), var56 (copy), var85 (copy), var86 (copy)
			if var58 then
				task.cancel(var58)
			end
			if var56 then
				task.cancel(var56)
			end
			if var85 then
				var86(nil)
				var85:Fire(false)
				var85:Destroy()
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var37 (ref), typeModule (copy), var38 (ref), default_1 (ref)
		task.delay(0, function()
			-- upvalues: var37 (copy), typeModule (copy), var38 (copy), default_1 (copy)
			local var135 = if var37 then {
				typeModule.ChannelListEnum.Experience,
				typeModule.ChannelListEnum.Dual
			} else {
				typeModule.ChannelListEnum.App,
				typeModule.ChannelListEnum.Dual
			}
			
			if var38 then
				table.insert(var135, typeModule.ChannelListEnum.Desktop)
			end
			default_1:setupNotifications(var135)
		end)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: default_1 (ref), var104 (ref)
		local var136 = default_1:listenToDisplayNotification(var104)
		
		return function()
			-- upvalues: var136 (ref)
			if var136 then
				var136:Disconnect()
			end
		end
	end, { var104 })
	local var107 = isVRAppBuild()
	local var48_1 = var48 or not var107
	local var48_2 = var69_1 and (not touchEnabled and (not var107 and var48))
	local textButton = reactModule.createElement("TextButton", {
		ZIndex = 2,
		LayoutOrder = 1,
		AnchorPoint = Vector2.new(0, 0),
		Size = UDim2.new(0, constantsModule.CardSizeDefault.closeButton, 0, constantsModule.CardSizeDefault.closeButton),
		Position = UDim2.new(0, -10, 0, -10),
		BackgroundTransparency = var87.Theme.BackgroundUIDefault.Transparency,
		BackgroundColor3 = var87.Theme.BackgroundUIDefault.Color,
		Text = "",
		[reactModule.Event.Activated] = var95,
		[reactModule.Event.MouseEnter] = function()
			-- upvalues: var72 (ref)
			var72(true)
		end,
		[reactModule.Event.MouseLeave] = function()
			-- upvalues: var72 (ref)
			var72(false)
		end
	}, {
		Border = reactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = var87.Theme.UIDefault.Color
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
			ImageColor3 = var87.Theme.SystemPrimaryDefault.Color
		})
	})
	local var111 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), springAnimatedItem (copy), var42 (ref), var48_1 (ref), var50 (ref), var90 (ref), typeModule (copy), userId (ref), var70 (ref), var54 (ref), t (copy), var107 (ref), var48 (ref), var51 (ref), var99 (ref), swipeDetectionWrapperModule (copy), var94 (ref), var72 (ref), clientToastNotificationsEnabledEngineFeature (copy), clientNotificationWrapperModule (copy), var74 (ref), enableClientToastNotificationsReducedMotion (copy), var105 (ref), var48_2 (ref), textButton (ref), notificationCardProviderModule (copy), var60 (ref), var102 (ref), notificationCardModule (copy), var69_1 (ref), var81 (write), var78 (ref), holdProgress (ref)
		return reactModule.createElement(springAnimatedItem.AnimatedFrame, {
			regularProps = {
				ClipsDescendants = false,
				Size = var42,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Active = true,
				Visible = var48_1 and var50 ~= nil,
				[reactModule.Event.MouseEnter] = function()
					-- upvalues: var90 (copy), typeModule (copy), userId (copy), var50 (copy), var70 (copy)
					var90(typeModule.ToastNotificationActionsEnum.Hover, userId, var50)
					var70(true)
				end,
				[reactModule.Event.MouseLeave] = function()
					-- upvalues: var70 (copy)
					var70(false)
				end
			},
			animatedValues = var54,
			springOptions = t,
			mapValuesToProps = function(p32)
				-- upvalues: var107 (copy)
				return {
					Position = if var107 then UDim2.new(0.5, 0, 0.5, 0) else UDim2.new(p32.positionX, p32.positionXOffset, p32.positionY, p32.positionYOffset),
					AnchorPoint = if var107 then Vector2.new(0.5, 0.5) else Vector2.new(p32.anchorX, p32.anchorY)
				}
			end,
			onComplete = function()
				-- upvalues: var48 (copy), var51 (copy), var99 (copy)
				if not var48 then
					var51(nil)
					var99()
				end
			end
		}, {
			SwipeDetector = reactModule.createElement(swipeDetectionWrapperModule, {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				swipeEnabled = var48,
				swipeCallback = function(p33)
					-- upvalues: var90 (copy), typeModule (copy), userId (copy), var50 (copy), var94 (copy), var72 (copy)
					if p33 == Enum.SwipeDirection.Up or p33 == Enum.SwipeDirection.Right then
						var90(typeModule.ToastNotificationActionsEnum.Dismissed, userId, var50)
						var94()
						var72(false)
					end
				end
			}, {
				NotificationProvider = if clientToastNotificationsEnabledEngineFeature and var50 and (var50.luaNotifInfo and var50.id) then reactModule.createElement(clientNotificationWrapperModule, {
					notificationInfo = var50.luaNotifInfo,
					notificationId = var50.id,
					onPause = var74,
					onHover = var70,
					transparency = if enableClientToastNotificationsReducedMotion then var105 else nil,
					width = var42.X
				}, { ToastCloseButton = if var48_2 then textButton else nil }) else reactModule.createElement(notificationCardProviderModule, {
					state = var50 and var50.state,
					isCompact = var60,
					handleActions = var102,
					notificationReceivedTimestampMs = var50 and var50.notificationReceivedTimestampMs,
					timers = var50 and var50.timers,
					displayTimestampMs = var50 and var50.displayTimestamp
				}, {
					NotificationCardCanvasGroup = if var50 then reactModule.createElement("CanvasGroup", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = var42,
						GroupTransparency = var105
					}, {
						NotificationCard = reactModule.createElement(notificationCardModule, {
							isHover = var69_1,
							shouldAutoFocus = var81,
							showHoldButton = var78,
							holdProgress = holdProgress
						})
					}) else nil,
					ToastCloseButton = if var48_2 then textButton else nil
				})
			})
		})
	end, {
		constantsModule, var87, var50, var48_1, var48, var60, var48_2, var69_1, var54,
		var95, var70, var72, var102
	})
	
	return if var107 then reactModule.createElement(toastVRWrapperModule, {
		isConfirmModalOpen = var64,
		isToastOpen = var48,
		isCoreScript = var37,
		ToastComponent = var111,
		ToastNotificationSnoozeMenu = reactModule.createElement(toastNotificationSnoozeMenuModule),
		ConfirmationModalComponent = reactModule.createElement(deeplinkConfirmationModal, { backgroundTransparency = 1, closeCallback = var91 })
	}) else reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		DisplayOrder = p0.displayOrder,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Toast = var111,
		ToastNotificationSnoozeMenu = reactModule.createElement(toastNotificationSnoozeMenuModule),
		DeeplinkConfirmationModal = var64 and reactModule.createElement(deeplinkConfirmationModal, { closeCallback = var91 })
	})
end