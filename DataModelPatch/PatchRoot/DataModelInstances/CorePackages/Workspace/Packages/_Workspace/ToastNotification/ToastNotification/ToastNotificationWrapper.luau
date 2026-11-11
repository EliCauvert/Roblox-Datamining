local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local TouchEnabled = UserInputService.TouchEnabled
local Parent = script.Parent
local Components = Parent.Components
local Utils = Parent.utils
local LoggerModule = require(Parent.Logger)
local ToastNotificationHelperModule = require(Utils.toastNotificationHelper)
local ToastNotificationSessionizationHelperModule = require(Utils.toastNotificationSessionizationHelper)
local Parent1 = Parent.Parent
local NotificationsCommonModule = require(Parent1.NotificationsCommon)
local ReactModule = require(Parent1.React)
local UIBloxModule = require(Parent1.UIBlox)
local CryoModule = require(Parent1.Cryo)
local IsVRAppBuildFunction = require(Parent1.AppCommonLib).IsVRAppBuild
local ResponsiveModule = require(Parent1.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local ReactOtterModule = require(Parent1.ReactOtter)
local LifecycleEventsModule = require(script.Parent.utils.LifecycleEvents)
local ToastNotificationProtocol = require(Parent1.ToastNotificationsProtocol).ToastNotificationProtocol
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local SharedFlagsModule = require(Parent1.SharedFlags)
local AnalyticsServiceModule = require(Parent.analytics.analyticsService)
local NotificationCardProviderModule = require(Parent.context.NotificationCardProvider)
local NotificationCardModule = require(Components.NotificationCard)
local ToastNotificationSnoozeMenuModule = require(Components.ToastNotificationSnoozeMenu)
local DeeplinkConfirmationModal = NotificationsCommonModule.DeeplinkConfirmationModal
local SwipeDetectionWrapperModule = require(Components.SwipeDetectionWrapper)
local ToastVRWrapperModule = require(Components.ToastVRWrapper)
local ClientNotificationWrapperModule = require(Components.ClientNotificationWrapper)
local UseKeyCodeHoldModule = require(Components.useKeyCodeHold)
local TypeModule = require(Parent.type)
local ConstantsModule = require(Parent.constants)
local JoinExperienceFunction = NotificationsCommonModule.JoinExperience
local SpringAnimatedItem = UIBloxModule.Utility.SpringAnimatedItem
local IconsNavigationClose = UIBloxModule.App.ImageSet.Images["icons/navigation/close"]
local GetFFlagEnableChatNewMessageFunction = SharedFlagsModule.GetFFlagEnableChatNewMessage
local ClientToastNotificationsEnabledEngineFeature = game:GetEngineFeature("ClientToastNotificationsEnabled")
local EnableClientToastNotificationsReducedMotion = game:DefineFastFlag("EnableClientToastNotificationsReducedMotion", false)
local EnableNotificationsToastTTLFix = game:DefineFastFlag("EnableNotificationsToastTTLFix", false)
local Default = require(Parent.ToastNotificationSnoozeManager).default
local GetFStringPCGDKFilteredNotificationTypesFunction = SharedFlagsModule.GetFStringPCGDKFilteredNotificationTypes

local function _(): boolean
	-- upvalues: ThirdPartyUserService (copy)
	return ThirdPartyUserService and (ThirdPartyUserService:IsChatRestrictionSupported() and ThirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted)
end

local GetFFlagFilterSecurityAlertsVRToastEnabledFunction = SharedFlagsModule.GetFFlagFilterSecurityAlertsVRToastEnabled
local EnableDisplayLoggingForToastsFix = game:DefineFastFlag("EnableDisplayLoggingForToastsFix", false)
local IXPServiceWrapper = require(Parent1.IXPServiceWrapper).IXPServiceWrapper
local FFlagFriendshipNotifsUseSendrExperiment = SharedFlagsModule.FFlagFriendshipNotifsUseSendrExperiment
local FriendshipNotifsUseSendrLayerName = game:DefineFastString("FriendshipNotifsUseSendrLayerName", "Notification.Toast")
local FRRToastPositionVariantKey = game:DefineFastString("FRRToastPositionVariantKey", "frrToastPositionVariant")
local Flag = false
local v1 = nil
local v2 = nil

local _ = function()
	-- upvalues: FFlagFriendshipNotifsUseSendrExperiment (copy), Flag (ref), v1 (ref), v2 (ref), IXPServiceWrapper (copy), FriendshipNotifsUseSendrLayerName (copy), FRRToastPositionVariantKey (copy)
	if FFlagFriendshipNotifsUseSendrExperiment and not Flag then
		v1, v49 = pcall(function()
			-- upvalues: Flag (upval), IXPServiceWrapper (upval), FriendshipNotifsUseSendrLayerName (upval)
			Flag = true
			
			return IXPServiceWrapper:GetLayerData(FriendshipNotifsUseSendrLayerName)
		end)
	end
	return if v1 and v2 then v2[FRRToastPositionVariantKey] else nil
end

local SpringOptions = { frequency = 4, damping = 1 }
local GetDeviceOrientationFunction = ToastNotificationHelperModule.getDeviceOrientation
local GetNotificationSizeFunction = ToastNotificationHelperModule.getNotificationSize
local MarshalNotificationDataFunction = ToastNotificationHelperModule.marshalNotificationData
local CalculateToastPositionFunction = ToastNotificationHelperModule.calculateToastPosition
local IsToastToRightFunction = ToastNotificationHelperModule.isToastToRight
local CalculateTimeRemainingFunction = ToastNotificationHelperModule.calculateTimeRemaining

return function(p1)
	-- upvalues: TypeModule (copy), ToastNotificationHelperModule (copy), ConstantsModule (copy), ToastNotificationProtocol (copy), ReactModule (copy), UserGameSettings (copy), GetNotificationSizeFunction (copy), GetDeviceOrientationFunction (copy), FFlagFriendshipNotifsUseSendrExperiment (copy), CalculateToastPositionFunction (copy), IsToastToRightFunction (copy), UseIsSpatialFunction (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), UserInputService (copy), UseKeyCodeHoldModule (copy), UseStyleFunction (copy), Players (copy), LoggerModule (copy), AnalyticsServiceModule (copy), ToastNotificationSessionizationHelperModule (copy), CryoModule (copy), Default (copy), Flag (ref), v1 (ref), v2 (ref), IXPServiceWrapper (copy), FriendshipNotifsUseSendrLayerName (copy), FRRToastPositionVariantKey (copy), EnableNotificationsToastTTLFix (copy), ClientToastNotificationsEnabledEngineFeature (copy), GuiService (copy), JoinExperienceFunction (copy), HttpService (copy), CalculateTimeRemainingFunction (copy), LifecycleEventsModule (copy), GetFStringPCGDKFilteredNotificationTypesFunction (copy), ThirdPartyUserService (copy), EnableDisplayLoggingForToastsFix (copy), GetFFlagFilterSecurityAlertsVRToastEnabledFunction (copy), GetFFlagEnableChatNewMessageFunction (copy), MarshalNotificationDataFunction (copy), SpringOptions (copy), ReactOtterModule (copy), IsVRAppBuildFunction (copy), TouchEnabled (copy), ImageSetLabel (copy), IconsNavigationClose (copy), SpringAnimatedItem (copy), SwipeDetectionWrapperModule (copy), ClientNotificationWrapperModule (copy), EnableClientToastNotificationsReducedMotion (copy), NotificationCardProviderModule (copy), NotificationCardModule (copy), ToastVRWrapperModule (copy), ToastNotificationSnoozeMenuModule (copy), DeeplinkConfirmationModal (copy)
	local IsRenderLocationMatch = p1.renderLocation == TypeModule.RenderLocationEnum.CoreScript
	local IsDesktopDevice = ToastNotificationHelperModule.isDesktopDevice()
	local Experience = if IsRenderLocationMatch then ConstantsModule.CardTopMargin.Experience else ConstantsModule.CardTopMargin.App
	local Default1 = ToastNotificationProtocol.default
	
	local function _()
		return workspace.CurrentCamera.ViewportSize
	end
	
	local _ = function(p2): boolean
		-- upvalues: ConstantsModule (upval)
		return p2 and workspace.CurrentCamera.ViewportSize.X < ConstantsModule.CompactCardThreashold
	end
	
	local UseStateResult, UseStateResult2 = ReactModule.useState(UserGameSettings.ReducedMotion)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(GetNotificationSizeFunction(IsRenderLocationMatch, workspace.CurrentCamera.ViewportSize.X))
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(GetDeviceOrientationFunction(workspace.CurrentCamera.ViewportSize))
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(if FFlagFriendshipNotifsUseSendrExperiment then workspace.CurrentCamera.ViewportSize else nil)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(nil)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(nil)
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(CalculateToastPositionFunction(false, IsToastToRightFunction(UseStateResult3), Experience, UseStateResult))
	local UseStateResult9, UseStateResult2_8 = ReactModule.useState(nil)
	local UseStateResult10, UseStateResult2_9 = ReactModule.useState(nil)
	local UseStateResult11, UseStateResult2_10 = ReactModule.useState(function(): boolean
		-- upvalues: IsRenderLocationMatch (copy), ConstantsModule (upval)
		return IsRenderLocationMatch and workspace.CurrentCamera.ViewportSize.X < ConstantsModule.CompactCardThreashold
	end)
	local UseStateResult12, UseStateResult2_11 = ReactModule.useState(false)
	local UseStateResult13, UseStateResult2_12 = ReactModule.useState(false)
	local UseStateResult14, UseStateResult2_13 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	local UseStateResult15, UseStateResult2_14 = ReactModule.useState(false)
	local UseStateResult16, UseStateResult2_15 = ReactModule.useState(false)
	local UseStateResult17, UseStateResult2_16 = ReactModule.useState(false)
	local UseStateResult18, UseStateResult2_17 = ReactModule.useState({})
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseStateResult19 = nil
	local UseStateResult2_18 = nil
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	UseStateResult19, UseStateResult2_18 = ReactModule.useState(false)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IsUsePreferredInputResultMatch (copy), UseStateResult19 (ref), UseStateResult6 (copy)
		return not IsUsePreferredInputResultMatch or (UseStateResult19 or UseStateResult6 == nil)
	end, {
		IsUsePreferredInputResultMatch,
		UseStateResult19,
		UseStateResult6
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult19 (ref), UserInputService (upval), UseStateResult2_18 (ref)
		if not UseStateResult19 then return end
		local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input, GameProcessed)
			-- upvalues: UseStateResult2_18 (upval)
			if GameProcessed then return end
			if Input.KeyCode == Enum.KeyCode.ButtonB then
				UseStateResult2_18(false)
			end
		end)
		
		return function()
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, { UseStateResult19 })
	local UseKeyCodeHoldModuleResult = UseKeyCodeHoldModule(Enum.KeyCode.ButtonSelect, ConstantsModule.SIGNAL_HOLD_INTENT_SECONDS, ConstantsModule.SIGNAL_HOLD_COMPLETE_SECONDS, ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_18 (ref)
		UseStateResult2_18(true)
	end, {}), UseMemoResult)
	local HoldProgress = UseKeyCodeHoldModuleResult.holdProgress
	local Holding = UseKeyCodeHoldModuleResult.holding
	local UseStateResult20, UseStateResult2_19 = ReactModule.useState((Instance.new("BindableEvent")))
	local UseStyleResult = UseStyleFunction()
	
	local _ = function()
		-- upvalues: GetDeviceOrientationFunction (upval), GetNotificationSizeFunction (upval), IsRenderLocationMatch (copy), UseStateResult2_1 (copy), UseStateResult2_10 (copy), ConstantsModule (upval), UseStateResult2_2 (copy)
		local ViewportSize = workspace.CurrentCamera.ViewportSize
		local DeviceOrientation = GetDeviceOrientationFunction(ViewportSize)
		UseStateResult2_1((GetNotificationSizeFunction(IsRenderLocationMatch, ViewportSize.X)))
		UseStateResult2_10(IsRenderLocationMatch and workspace.CurrentCamera.ViewportSize.X < ConstantsModule.CompactCardThreashold)
		UseStateResult2_2(DeviceOrientation)
	end
	
	local _ = function(p2)
		-- upvalues: Default1 (copy)
		Default1:dismissNotification(p2)
	end
	
	local UseStateResult15_1 = UseStateResult15 or UseStateResult16
	local UserId = Players and Players.LocalPlayer and Players.LocalPlayer.UserId or nil
	
	local function v112(Dismissed, UserId, NotificationData)
		-- upvalues: LoggerModule (upval), AnalyticsServiceModule (upval), ToastNotificationSessionizationHelperModule (upval), ToastNotificationHelperModule (upval), CryoModule (upval), ConstantsModule (upval), IsRenderLocationMatch (copy), Default (upval), FFlagFriendshipNotifsUseSendrExperiment (upval), TypeModule (upval), Flag (upval), v1 (upval), v2 (upval), IXPServiceWrapper (upval), FriendshipNotifsUseSendrLayerName (upval), FRRToastPositionVariantKey (upval)
		if NotificationData == nil then return end
		LoggerModule:info("NotificationType: {} with event: {}", NotificationData.notificationType, Dismissed)
		local EventStream = AnalyticsServiceModule.EventStream
		ToastNotificationSessionizationHelperModule(Dismissed)
		local FireEventFunction: (any, any) -> () = ToastNotificationHelperModule.fireEvent
		local JoinFunction = CryoModule.Dictionary.join
		local config = {
			action_type = Dismissed,
			delivery_channel = ConstantsModule.DeliveryChannel,
			notification_type = NotificationData and NotificationData.notificationType or nil,
			notification_id = NotificationData and NotificationData.id or nil,
			recipient_userid = UserId or nil,
			recipient_universe_id = if IsRenderLocationMatch then game and game.GameId else nil,
			client_destination = if IsRenderLocationMatch then ConstantsModule.Destinations.Experience else ConstantsModule.Destinations.App,
			deliver_timestamp = NotificationData and NotificationData.deliverTimestamp or nil,
			snoozed = if NotificationData and NotificationData.notificationType then Default:isSnoozedNotificationType(NotificationData.notificationType) else false,
			time_to_action_timestamp = if NotificationData and NotificationData.displayTimestamp then DateTime.now().UnixTimestampMillis - NotificationData.displayTimestamp else 0
		}
		local Frr_toast_position_variant = nil
		
		if FFlagFriendshipNotifsUseSendrExperiment and NotificationData.notificationType == TypeModule.NotificationTypeEnum.FriendRequestReceived then
			if FFlagFriendshipNotifsUseSendrExperiment and not Flag then
				v1, v49 = pcall(function()
					-- upvalues: Flag (upval), IXPServiceWrapper (upval), FriendshipNotifsUseSendrLayerName (upval)
					Flag = true
					
					return IXPServiceWrapper:GetLayerData(FriendshipNotifsUseSendrLayerName)
				end)
			end
			Frr_toast_position_variant = if v1 and v2 then v2[FRRToastPositionVariantKey] else nil
		else
			Frr_toast_position_variant = nil
		end
		config.frr_toast_position_variant = Frr_toast_position_variant
		FireEventFunction(EventStream, JoinFunction(config, NotificationData and NotificationData.clientEventsPayload or {}))
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UserGameSettings (upval), UseStateResult2 (copy)
		local ChangedConnection = UserGameSettings.Changed:Connect(function(p2)
			-- upvalues: UserGameSettings (upval), UseStateResult2 (upval)
			if p2 == "ReducedMotion" then
				local Success, Result = pcall(function()
					-- upvalues: UserGameSettings (upval), p2 (copy)
					return UserGameSettings[p2]
				end)
				
				if Success then
					UseStateResult2(Result)
				end
			end
		end)
		
		return function()
			-- upvalues: ChangedConnection (copy)
			if ChangedConnection then
				ChangedConnection:Disconnect()
			end
		end
	end, { UseStateResult2, UserGameSettings })
	
	local function CloseCallback(p2)
		-- upvalues: v112 (copy), TypeModule (upval), UserId (copy), UseStateResult6 (copy), UseStateResult2_12 (copy), UseStateResult20 (copy)
		if not p2 then
			v112(TypeModule.ToastNotificationActionsEnum.ModalCancel, UserId, UseStateResult6)
			UseStateResult2_12(false)
		end
		if UseStateResult20 then
			v112(TypeModule.ToastNotificationActionsEnum.ModalConfirm, UserId, UseStateResult6)
			UseStateResult20:Fire(p2)
		end
	end
	
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult9 (copy), UseStateResult2_8 (copy)
		if UseStateResult9 then
			task.cancel(UseStateResult9)
		end
		UseStateResult2_8(nil)
	end, { UseStateResult9 })
	
	local _ = function(p2)
		-- upvalues: Default1 (copy), UseStateResult2_6 (copy), UseResult (copy)
		Default1:dismissNotification(p2)
		UseStateResult2_6(nil)
		UseResult()
	end
	
	local _ = function(p2): number
		-- upvalues: ConstantsModule (upval)
		local TimeOnScreenMs = p2.state and p2.state.timeOnScreenMs
		
		if TimeOnScreenMs then
			TimeOnScreenMs /= 1000
		end
		return (TimeOnScreenMs or ConstantsModule.DefaultNotificationDisplayTime) + 1
	end
	
	local UseResult1 = nil
	UseResult1 = if EnableNotificationsToastTTLFix then function(NotificationId, Delay, p2)
		-- upvalues: UseResult (copy), UseRefResult (copy), v112 (copy), TypeModule (upval), UserId (copy), ClientToastNotificationsEnabledEngineFeature (upval), GuiService (upval), Default1 (copy), UseStateResult2_6 (copy), UseStateResult2_8 (copy)
		UseResult()
		UseStateResult2_8((task.delay(Delay, function()
			-- upvalues: UseRefResult (upval), UseResult (upval), v112 (upval), TypeModule (upval), UserId (upval), p2 (copy), ClientToastNotificationsEnabledEngineFeature (upval), GuiService (upval), NotificationId (copy), Default1 (upval), UseStateResult2_6 (upval)
			if UseRefResult.current then
				UseResult()
				
				return
			end
			v112(TypeModule.ToastNotificationActionsEnum.Ignored, UserId, p2)
			
			if ClientToastNotificationsEnabledEngineFeature and p2 and p2.luaNotifInfo then
				GuiService:DismissNotification(NotificationId)
				
				return
			else
				Default1:dismissNotification(NotificationId)
				UseStateResult2_6(nil)
				UseResult()
			end
		end)))
	end else ReactModule.useCallback(function(NotificationId, Delay, p2)
		-- upvalues: UseResult (copy), UseStateResult14 (copy), v112 (copy), TypeModule (upval), UserId (copy), ClientToastNotificationsEnabledEngineFeature (upval), GuiService (upval), Default1 (copy), UseStateResult2_6 (copy), UseStateResult2_8 (copy)
		UseResult()
		UseStateResult2_8((task.delay(Delay, function()
			-- upvalues: UseStateResult14 (upval), v112 (upval), TypeModule (upval), UserId (upval), p2 (copy), ClientToastNotificationsEnabledEngineFeature (upval), GuiService (upval), NotificationId (copy), Default1 (upval), UseStateResult2_6 (upval), UseResult (upval)
			if not UseStateResult14 then
				v112(TypeModule.ToastNotificationActionsEnum.Ignored, UserId, p2)
				
				if ClientToastNotificationsEnabledEngineFeature and p2 and p2.luaNotifInfo then
					GuiService:DismissNotification(NotificationId)
					
					return
				end
				Default1:dismissNotification(NotificationId)
				UseStateResult2_6(nil)
				UseResult()
			end
		end)))
	end, { UseStateResult14 })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult6 (copy), UseStateResult7 (copy), ClientToastNotificationsEnabledEngineFeature (upval), GuiService (upval), Default1 (copy), UseStateResult2_6 (copy), UseResult (copy)
		if UseStateResult6 and UseStateResult7 and UseStateResult7.id == UseStateResult6.id then
			if ClientToastNotificationsEnabledEngineFeature and UseStateResult6.luaNotifInfo then
				GuiService:DismissNotification(UseStateResult6.id)
				
				return
			end
			Default1:dismissNotification(UseStateResult6.id)
			UseStateResult2_6(nil)
			UseResult()
		end
	end, { UseStateResult6, UseStateResult7 })
	
	local function v120()
		-- upvalues: v112 (copy), TypeModule (upval), UserId (copy), UseStateResult6 (copy), UseResult2 (copy), UseStateResult2_15 (copy)
		v112(TypeModule.ToastNotificationActionsEnum.Dismissed, UserId, UseStateResult6)
		UseResult2()
		UseStateResult2_15(false)
	end
	
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: IsRenderLocationMatch (copy), UseStateResult20 (copy), UseStateResult2_12 (copy)
		if IsRenderLocationMatch and UseStateResult20 then
			UseStateResult2_12(true)
			
			return UseStateResult20.Event:Wait()
		else
			return true
		end
	end, { IsRenderLocationMatch, UseStateResult20 })
	
	local function v122()
		-- upvalues: UseStateResult6 (copy), UseStateResult7 (copy), UseStateResult9 (copy), UseResult1 (ref), ConstantsModule (upval)
		if UseStateResult6 and UseStateResult7 and not UseStateResult9 then
			local Callback: (any, any, any) -> () = UseResult1
			local Id = UseStateResult6.id
			local TimeOnScreenMs = UseStateResult6.state and UseStateResult6.state.timeOnScreenMs
			
			if TimeOnScreenMs then
				TimeOnScreenMs /= 1000
			end
			Callback(Id, (TimeOnScreenMs or ConstantsModule.DefaultNotificationDisplayTime) + 1, UseStateResult6)
		end
	end
	
	local Callback = nil
	Callback = if EnableNotificationsToastTTLFix then function(p2, ...)
		-- upvalues: UseResult (copy), UseStateResult6 (copy), UseStateResult7 (copy), UseStateResult9 (copy), UseResult1 (ref), ConstantsModule (upval)
		if p2 then
			UseResult()
			
			return
		end
		if UseStateResult6 and UseStateResult7 and not UseStateResult9 then
			local Callback: (any, any, any) -> () = UseResult1
			local Id = UseStateResult6.id
			local TimeOnScreenMs = UseStateResult6.state and UseStateResult6.state.timeOnScreenMs
			
			if TimeOnScreenMs then
				TimeOnScreenMs /= 1000
			end
			Callback(Id, (TimeOnScreenMs or ConstantsModule.DefaultNotificationDisplayTime) + 1, UseStateResult6)
		end
	end else function(p2, Callback: () -> (), Callback1: () -> ())
		if p2 then
			Callback()
			
			return
		else
			Callback1()
		end
	end
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult18 (copy)
		for _, value in ipairs(UseStateResult18) do
			task.cancel(value)
		end
	end, { UseStateResult18 })
	ReactModule.useEffect(function()
		-- upvalues: UseResult4 (copy)
		return function()
			-- upvalues: UseResult4 (upval)
			UseResult4()
		end
	end, { UseResult4 })
	local UseResult5 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: TypeModule (upval), UseResult2 (copy), UseResult3 (copy), JoinExperienceFunction (upval), IsRenderLocationMatch (copy), UseStateResult2_12 (copy), Default1 (copy), v112 (copy), UserId (copy), HttpService (upval), LoggerModule (upval), ToastNotificationProtocol (upval)
		if p2.actionType == TypeModule.ActionTypeEnum.Dismiss then
			UseResult2()
			
			return
		end
		if p2.actionType == TypeModule.ActionTypeEnum.Deeplink then
			if UseResult3() then
				if not JoinExperienceFunction(p2.path or "", IsRenderLocationMatch) then
					v112(TypeModule.ToastNotificationActionsEnum.DeeplinkFailed, UserId, p3)
					UseResult2()
					
					return
				end
				UseStateResult2_12(false)
				
				if p3 then
					Default1:dismissNotification(p3.id)
					
					return
				end
			end
		elseif p2.actionType == TypeModule.ActionTypeEnum.VoltronBroadcast then
			local Success, Result = pcall(function()
				-- upvalues: HttpService (upval), p2 (copy)
				return HttpService:JSONDecode(p2.parameters)
			end)
			
			if Success then
				Default1:voltronBroadcast(p2.messageId, Result)
				
				return
			else
				LoggerModule:warning("Invalid decoded payload for voltronBroadcast")
				
				return
			end
		elseif p2.actionType == TypeModule.ActionTypeEnum.UpdateState and p2.nextState ~= nil and p2.nextState ~= "" and p3 and p3.id then
			ToastNotificationProtocol:updateNotification(p3.id, p2.nextState)
		end
	end, { UseResult2, UseResult3 })
	local UseResult6 = ReactModule.useCallback(function(p2)
		-- upvalues: UseResult5 (copy), UseResult4 (copy), CalculateTimeRemainingFunction (upval), UseStateResult2_17 (copy)
		local function _(List)
			-- upvalues: UseResult5 (upval), p2 (copy)
			for _, value in ipairs(List) do
				UseResult5(value, p2)
			end
		end
		
		UseResult4()
		
		if p2.timers then
			local List = {}
			
			for _, timer in pairs(p2.timers) do
				local TimeRemaining: number = CalculateTimeRemainingFunction(timer, p2.notificationReceivedTimestampMs, p2.displayTimestamp)
				
				if TimeRemaining > 0 then
					table.insert(List, (task.delay(TimeRemaining / 1000, function()
						-- upvalues: timer (copy), UseResult5 (upval), p2 (copy)
						for _, action in ipairs(timer.actions) do
							UseResult5(action, p2)
						end
					end)))
				else
					for _, action in ipairs(timer.actions) do
						UseResult5(action, p2)
					end
				end
			end
			if #List > 0 then
				UseStateResult2_17(List)
			end
		end
	end, { UseResult5, UseResult4, CalculateTimeRemainingFunction })
	local UseResult7 = ReactModule.useCallback(function(VisualItem)
		-- upvalues: UseStateResult12 (copy), UseStateResult2_11 (copy), v112 (copy), UserId (copy), UseStateResult6 (copy), LifecycleEventsModule (upval), UseResult5 (copy), TypeModule (upval), UseResult3 (copy)
		if UseStateResult12 then return end
		UseStateResult2_11(true)
		
		if VisualItem.eventName then
			v112(VisualItem.eventName, UserId, UseStateResult6)
		end
		if VisualItem.actionEventParams and UseStateResult6 then
			LifecycleEventsModule:DispatchEvent(LifecycleEventsModule.ToastEvents.UserAction, UseStateResult6.notificationType, {
				userActionType = "click",
				notificationData = UseStateResult6,
				visualItem = VisualItem,
				parameters = VisualItem.actionEventParams
			})
		end
		if VisualItem.actions and #VisualItem.actions > 0 then
			for _, action in ipairs(VisualItem.actions) do
				UseResult5(action, UseStateResult6)
				
				if action.actionType == TypeModule.ActionTypeEnum.Deeplink and UseResult3() then break end
			end
		end
		UseStateResult2_11(false)
	end, {
		UseStateResult6,
		UseResult2,
		UseStateResult12,
		UseResult3
	})
	
	local function v127(p3, p4)
		-- upvalues: GetFStringPCGDKFilteredNotificationTypesFunction (upval), ThirdPartyUserService (upval), Default1 (copy), TypeModule (upval), EnableDisplayLoggingForToastsFix (upval), Default (upval), v112 (copy), UserId (copy), UseStateResult2_5 (copy), ConstantsModule (upval), UseResult1 (ref), UseResult6 (copy), ClientToastNotificationsEnabledEngineFeature (upval), GuiService (upval), UseStateResult2_9 (copy)
		p3.displayTimestamp = DateTime.now().UnixTimestampMillis
		
		if GetFStringPCGDKFilteredNotificationTypesFunction()[p3.notificationType] and (ThirdPartyUserService and (ThirdPartyUserService:IsChatRestrictionSupported() and ThirdPartyUserService.FriendCommunicationRestrictionStatus ~= Enum.ChatRestrictionStatus.NotRestricted)) then
			Default1:dismissNotification(p3.id)
			
			return
		end
		local Update = if p4 == "update" then TypeModule.ToastNotificationActionsEnum.Update else TypeModule.ToastNotificationActionsEnum.Display
		
		if EnableDisplayLoggingForToastsFix then
			if Default:isSnoozedNotificationType(p3.notificationType) then
				Default1:dismissNotification(p3.id)
				
				return
			end
			v112(Update, UserId, p3)
		else
			v112(Update, UserId, p3)
			
			if Default:isSnoozedNotificationType(p3.notificationType) then
				Default1:dismissNotification(p3.id)
				
				return
			end
		end
		UseStateResult2_5(p3)
		local TimeOnScreenMs = p3.state and p3.state.timeOnScreenMs
		
		if TimeOnScreenMs then
			TimeOnScreenMs /= 1000
		end
		UseResult1(p3.id, (TimeOnScreenMs or ConstantsModule.DefaultNotificationDisplayTime) + 1, p3)
		
		if p4 == "display" then
			UseResult6(p3)
		end
		if ClientToastNotificationsEnabledEngineFeature and p3 and p3.luaNotifInfo then
			GuiService:OnNotificationDisplayed(p3.id)
		end
		UseStateResult2_9(nil)
	end
	
	local _ = function(p3, Delay)
		-- upvalues: UseStateResult10 (copy), v127 (copy), LifecycleEventsModule (upval), UseStateResult2_9 (copy)
		if UseStateResult10 then
			task.cancel(UseStateResult10)
		end
		UseStateResult2_9((task.delay(Delay, function()
			-- upvalues: v127 (upval), p3 (copy), LifecycleEventsModule (upval)
			v127(p3, "display")
			LifecycleEventsModule:DispatchEvent(LifecycleEventsModule.ToastEvents.Display, p3.notificationType, p3)
		end)))
	end
	
	local UseResult8 = ReactModule.useCallback(function(p3)
		-- upvalues: GuiService (upval), TypeModule (upval), GetFFlagFilterSecurityAlertsVRToastEnabledFunction (upval), UseIsSpatialResult (copy), GetFFlagEnableChatNewMessageFunction (upval), Default1 (copy), MarshalNotificationDataFunction (upval), UseStateResult2_6 (copy), LifecycleEventsModule (upval)
		if GuiService:IsTenFootInterface() and p3 and p3.notificationType ~= nil and p3.notificationType ~= TypeModule.NotificationTypeEnum.ClientNotification then return end
		if GetFFlagFilterSecurityAlertsVRToastEnabledFunction() and UseIsSpatialResult and p3 and p3.notificationType ~= nil and p3.notificationType == TypeModule.NotificationTypeEnum.SecurityAlert then return end
		if p3 and p3.notificationType == TypeModule.NotificationTypeEnum.ChatNewMessage and not GetFFlagEnableChatNewMessageFunction() and p3.content and p3.content.id then
			Default1:dismissNotification(p3.content.id)
			
			return
		end
		if p3 and p3.content and p3.content.id ~= nil then
			local MarshalNotificationDataResult = MarshalNotificationDataFunction(p3)
			UseStateResult2_6(MarshalNotificationDataResult)
			LifecycleEventsModule:DispatchEvent(LifecycleEventsModule.ToastEvents.AttemptDisplay, MarshalNotificationDataResult.notificationType, MarshalNotificationDataResult)
			
			return
		else
			UseStateResult2_6(nil)
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult7 (copy), UseStateResult6 (copy), v127 (copy), LifecycleEventsModule (upval), ConstantsModule (upval), SpringOptions (upval), UseStateResult10 (copy), UseStateResult2_9 (copy)
		if UseStateResult7 then
			if UseStateResult6 and UseStateResult6.id == UseStateResult7.id then
				v127(UseStateResult7, "update")
				LifecycleEventsModule:DispatchEvent(LifecycleEventsModule.ToastEvents.Update, UseStateResult7.notificationType, UseStateResult7)
				
				return
			end
			local DisplayNotificationDelay = if UseStateResult7.luaNotifInfo == nil then ConstantsModule.DisplayNotificationDelay elseif UseStateResult6 then 1 / SpringOptions.frequency else 0
			
			if UseStateResult10 then
				task.cancel(UseStateResult10)
			end
			UseStateResult2_9((task.delay(DisplayNotificationDelay, function()
				-- upvalues: v127 (upval), UseStateResult7 (copy), LifecycleEventsModule (upval)
				v127(UseStateResult7, "display")
				LifecycleEventsModule:DispatchEvent(LifecycleEventsModule.ToastEvents.Display, UseStateResult7.notificationType, UseStateResult7)
			end)))
		end
	end, { UseStateResult7 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult7 (copy), UseStateResult6 (copy), UseStateResult2_4 (copy), UseStateResult2_18 (ref)
		local IsIdMatch: boolean = if UseStateResult7 and UseStateResult6 then UseStateResult7.id == UseStateResult6.id else false
		UseStateResult2_4(IsIdMatch)
		
		if IsIdMatch == false then
			UseStateResult2_18(false)
		end
	end, { UseStateResult7, UseStateResult6 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult5 (copy), UseStateResult12 (copy), UseStateResult15 (copy), UseStateResult16 (copy), UseStateResult17 (copy), UseStateResult19 (ref), Holding (copy), UseStateResult2_13 (copy), EnableNotificationsToastTTLFix (upval), UseRefResult (copy)
		local UseStateResult12_1 = UseStateResult5 and (UseStateResult12 or (UseStateResult15 or (UseStateResult16 or (UseStateResult17 or (UseStateResult19 or Holding)))))
		UseStateResult2_13(UseStateResult12_1)
		
		if EnableNotificationsToastTTLFix then
			UseRefResult.current = UseStateResult12_1
		end
	end, {
		UseStateResult5, UseStateResult12, UseStateResult15, UseStateResult16,
		UseStateResult17, UseStateResult19, Holding
	})
	ReactModule.useEffect(function()
		-- upvalues: EnableNotificationsToastTTLFix (upval), Callback (ref), UseStateResult14 (copy), UseResult (copy), v122 (copy)
		if EnableNotificationsToastTTLFix then
			Callback(UseStateResult14)
			
			return
		else
			Callback(UseStateResult14, UseResult, v122)
		end
	end, { UseStateResult14 })
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1, function()
		-- upvalues: UseStateResult5 (copy), UseStateResult2_5 (copy), UseResult4 (copy)
		if not UseStateResult5 then
			UseStateResult2_5(nil)
			UseResult4()
		end
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseStateResult5 (copy), SpringOptions (upval)
		UseAnimatedBindingResult2(ReactOtterModule.spring(if UseStateResult5 then 0 else 1, SpringOptions))
	end, { UseStateResult5, UseAnimatedBindingResult2 })
	ReactModule.useEffect(function()
		-- upvalues: FFlagFriendshipNotifsUseSendrExperiment (upval), UseStateResult6 (copy), TypeModule (upval), Flag (upval), v1 (upval), v2 (upval), IXPServiceWrapper (upval), FriendshipNotifsUseSendrLayerName (upval), FRRToastPositionVariantKey (upval), CalculateToastPositionFunction (upval), UseStateResult5 (copy), IsToastToRightFunction (upval), UseStateResult3 (copy), Experience (copy), UseStateResult (copy), UseStateResult4 (copy), UseStateResult2_7 (copy)
		local v3 = nil
		local ToastPosition = nil
		repeat
			if FFlagFriendshipNotifsUseSendrExperiment then
				repeat
					if UseStateResult6 and UseStateResult6.notificationType == TypeModule.NotificationTypeEnum.FriendRequestReceived then
						if FFlagFriendshipNotifsUseSendrExperiment and not Flag then
							v1, v49 = pcall(function()
								-- upvalues: Flag (upval), IXPServiceWrapper (upval), FriendshipNotifsUseSendrLayerName (upval)
								Flag = true
								
								return IXPServiceWrapper:GetLayerData(FriendshipNotifsUseSendrLayerName)
							end)
						end
						if (if v1 and v2 then v2[FRRToastPositionVariantKey] else nil) == "legacyBottomRight" then
							v3 = "legacyBottomRight"
							break
						end
					end
					v3 = nil
				until true
				ToastPosition = CalculateToastPositionFunction(UseStateResult5, IsToastToRightFunction(UseStateResult3), Experience, UseStateResult, v3, UseStateResult4)
				break
			else
				ToastPosition = CalculateToastPositionFunction(UseStateResult5, IsToastToRightFunction(UseStateResult3), Experience, UseStateResult)
				continue
			end
		until true
		UseStateResult2_7(ToastPosition)
	end, {
		UseStateResult3, UseStateResult5, UseStateResult,
		if FFlagFriendshipNotifsUseSendrExperiment then UseStateResult6 else nil,
		if FFlagFriendshipNotifsUseSendrExperiment then Experience else nil,
		if FFlagFriendshipNotifsUseSendrExperiment then UseStateResult4 else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: GetDeviceOrientationFunction (upval), GetNotificationSizeFunction (upval), IsRenderLocationMatch (copy), UseStateResult2_1 (copy), UseStateResult2_10 (copy), ConstantsModule (upval), UseStateResult2_2 (copy), FFlagFriendshipNotifsUseSendrExperiment (upval), UseStateResult2_3 (copy)
		local ViewportSize = workspace.CurrentCamera.ViewportSize
		local DeviceOrientation = GetDeviceOrientationFunction(ViewportSize)
		UseStateResult2_1((GetNotificationSizeFunction(IsRenderLocationMatch, ViewportSize.X)))
		UseStateResult2_10(IsRenderLocationMatch and workspace.CurrentCamera.ViewportSize.X < ConstantsModule.CompactCardThreashold)
		UseStateResult2_2(DeviceOrientation)
		local Connection = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			-- upvalues: GetDeviceOrientationFunction (upval), GetNotificationSizeFunction (upval), IsRenderLocationMatch (upval), UseStateResult2_1 (upval), UseStateResult2_10 (upval), ConstantsModule (upval), UseStateResult2_2 (upval), FFlagFriendshipNotifsUseSendrExperiment (upval), UseStateResult2_3 (upval)
			local ViewportSize = workspace.CurrentCamera.ViewportSize
			local DeviceOrientation = GetDeviceOrientationFunction(ViewportSize)
			UseStateResult2_1((GetNotificationSizeFunction(IsRenderLocationMatch, ViewportSize.X)))
			UseStateResult2_10(IsRenderLocationMatch and workspace.CurrentCamera.ViewportSize.X < ConstantsModule.CompactCardThreashold)
			UseStateResult2_2(DeviceOrientation)
			
			if FFlagFriendshipNotifsUseSendrExperiment then
				UseStateResult2_3(workspace.CurrentCamera.ViewportSize)
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult10 (copy), UseStateResult9 (copy), UseStateResult20 (copy), UseStateResult2_19 (copy)
		return function()
			-- upvalues: UseStateResult10 (upval), UseStateResult9 (upval), UseStateResult20 (upval), UseStateResult2_19 (upval)
			if UseStateResult10 then
				task.cancel(UseStateResult10)
			end
			if UseStateResult9 then
				task.cancel(UseStateResult9)
			end
			if UseStateResult20 then
				UseStateResult2_19(nil)
				UseStateResult20:Fire(false)
				UseStateResult20:Destroy()
			end
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: IsRenderLocationMatch (copy), TypeModule (upval), IsDesktopDevice (copy), Default1 (copy)
		task.delay(0, function()
			-- upvalues: IsRenderLocationMatch (upval), TypeModule (upval), IsDesktopDevice (upval), Default1 (upval)
			local List = if IsRenderLocationMatch then {
				TypeModule.ChannelListEnum.Experience,
				TypeModule.ChannelListEnum.Dual
			} else {
				TypeModule.ChannelListEnum.App,
				TypeModule.ChannelListEnum.Dual
			}
			
			if IsDesktopDevice then
				table.insert(List, TypeModule.ChannelListEnum.Desktop)
			end
			Default1:setupNotifications(List)
		end)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: Default1 (copy), UseResult8 (copy)
		local ListenToDisplayNotificationResult = Default1:listenToDisplayNotification(UseResult8)
		
		return function()
			-- upvalues: ListenToDisplayNotificationResult (copy)
			if ListenToDisplayNotificationResult then
				ListenToDisplayNotificationResult:Disconnect()
			end
		end
	end, { UseResult8 })
	local IsVRAppBuild = IsVRAppBuildFunction()
	local UseStateResult5_1 = UseStateResult5 or not IsVRAppBuild
	local UseStateResult5_2 = UseStateResult15_1 and (not TouchEnabled and (not IsVRAppBuild and UseStateResult5))
	local TextButton = ReactModule.createElement("TextButton", {
		ZIndex = 2,
		LayoutOrder = 1,
		AnchorPoint = Vector2.new(0, 0),
		Size = UDim2.new(0, ConstantsModule.CardSizeDefault.closeButton, 0, ConstantsModule.CardSizeDefault.closeButton),
		Position = UDim2.new(0, -10, 0, -10),
		BackgroundTransparency = UseStyleResult.Theme.BackgroundUIDefault.Transparency,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color,
		Text = "",
		[ReactModule.Event.Activated] = v120,
		[ReactModule.Event.MouseEnter] = function()
			-- upvalues: UseStateResult2_15 (copy)
			UseStateResult2_15(true)
		end,
		[ReactModule.Event.MouseLeave] = function()
			-- upvalues: UseStateResult2_15 (copy)
			UseStateResult2_15(false)
		end
	}, {
		Border = ReactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = UseStyleResult.Theme.UIDefault.Color
		}),
		UICorner = ReactModule.createElement("UICorner", {
			CornerRadius = ConstantsModule.DefaultCardCloseButtonCornerRadius
		}),
		CloseButtonIcon = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, ConstantsModule.CardSizeDefault.closeIcon, 0, ConstantsModule.CardSizeDefault.closeIcon),
			Image = IconsNavigationClose,
			ImageColor3 = UseStyleResult.Theme.SystemPrimaryDefault.Color
		})
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), SpringAnimatedItem (upval), UseStateResult1 (copy), UseStateResult5_1 (copy), UseStateResult6 (copy), v112 (copy), TypeModule (upval), UserId (copy), UseStateResult2_14 (copy), UseStateResult8 (copy), SpringOptions (upval), IsVRAppBuild (copy), UseStateResult5 (copy), UseStateResult2_5 (copy), UseResult4 (copy), SwipeDetectionWrapperModule (upval), UseResult2 (copy), UseStateResult2_15 (copy), ClientToastNotificationsEnabledEngineFeature (upval), ClientNotificationWrapperModule (upval), UseStateResult2_16 (copy), EnableClientToastNotificationsReducedMotion (upval), UseAnimatedBindingResult (copy), UseStateResult5_2 (copy), TextButton (copy), NotificationCardProviderModule (upval), UseStateResult11 (copy), UseResult7 (copy), NotificationCardModule (upval), UseStateResult15_1 (copy), UseStateResult19 (ref), IsUsePreferredInputResultMatch (copy), HoldProgress (copy)
		return ReactModule.createElement(SpringAnimatedItem.AnimatedFrame, {
			regularProps = {
				ClipsDescendants = false,
				Size = UseStateResult1,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Active = true,
				Visible = UseStateResult5_1 and UseStateResult6 ~= nil,
				[ReactModule.Event.MouseEnter] = function()
					-- upvalues: v112 (upval), TypeModule (upval), UserId (upval), UseStateResult6 (upval), UseStateResult2_14 (upval)
					v112(TypeModule.ToastNotificationActionsEnum.Hover, UserId, UseStateResult6)
					UseStateResult2_14(true)
				end,
				[ReactModule.Event.MouseLeave] = function()
					-- upvalues: UseStateResult2_14 (upval)
					UseStateResult2_14(false)
				end
			},
			animatedValues = UseStateResult8,
			springOptions = SpringOptions,
			mapValuesToProps = function(p3)
				-- upvalues: IsVRAppBuild (upval)
				return {
					Position = if IsVRAppBuild then UDim2.new(0.5, 0, 0.5, 0) else UDim2.new(p3.positionX, p3.positionXOffset, p3.positionY, p3.positionYOffset),
					AnchorPoint = if IsVRAppBuild then Vector2.new(0.5, 0.5) else Vector2.new(p3.anchorX, p3.anchorY)
				}
			end,
			onComplete = function()
				-- upvalues: UseStateResult5 (upval), UseStateResult2_5 (upval), UseResult4 (upval)
				if not UseStateResult5 then
					UseStateResult2_5(nil)
					UseResult4()
				end
			end
		}, {
			SwipeDetector = ReactModule.createElement(SwipeDetectionWrapperModule, {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				swipeEnabled = UseStateResult5,
				swipeCallback = function(SwipeDirection)
					-- upvalues: v112 (upval), TypeModule (upval), UserId (upval), UseStateResult6 (upval), UseResult2 (upval), UseStateResult2_15 (upval)
					if SwipeDirection == Enum.SwipeDirection.Up or SwipeDirection == Enum.SwipeDirection.Right then
						v112(TypeModule.ToastNotificationActionsEnum.Dismissed, UserId, UseStateResult6)
						UseResult2()
						UseStateResult2_15(false)
					end
				end
			}, {
				NotificationProvider = if ClientToastNotificationsEnabledEngineFeature and UseStateResult6 and UseStateResult6.luaNotifInfo and UseStateResult6.id then ReactModule.createElement(ClientNotificationWrapperModule, {
					notificationInfo = UseStateResult6.luaNotifInfo,
					notificationId = UseStateResult6.id,
					onPause = UseStateResult2_16,
					onHover = UseStateResult2_14,
					transparency = if EnableClientToastNotificationsReducedMotion then UseAnimatedBindingResult else nil,
					width = UseStateResult1.X
				}, {
					ToastCloseButton = if UseStateResult5_2 then TextButton else nil
				}) else ReactModule.createElement(NotificationCardProviderModule, {
					state = UseStateResult6 and UseStateResult6.state,
					isCompact = UseStateResult11,
					handleActions = UseResult7,
					notificationReceivedTimestampMs = UseStateResult6 and UseStateResult6.notificationReceivedTimestampMs,
					timers = UseStateResult6 and UseStateResult6.timers,
					displayTimestampMs = UseStateResult6 and UseStateResult6.displayTimestamp
				}, {
					NotificationCardCanvasGroup = if UseStateResult6 then ReactModule.createElement("CanvasGroup", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UseStateResult1,
						GroupTransparency = UseAnimatedBindingResult
					}, {
						NotificationCard = ReactModule.createElement(NotificationCardModule, {
							isHover = UseStateResult15_1,
							shouldAutoFocus = UseStateResult19,
							showHoldButton = IsUsePreferredInputResultMatch,
							holdProgress = HoldProgress
						})
					}) else nil,
					ToastCloseButton = if UseStateResult5_2 then TextButton else nil
				})
			})
		})
	end, {
		ConstantsModule, UseStyleResult, UseStateResult6, UseStateResult5_1,
		UseStateResult5, UseStateResult11, UseStateResult5_2, UseStateResult15_1,
		UseStateResult8, v120, UseStateResult2_14, UseStateResult2_15, UseResult7
	})
	
	return if IsVRAppBuild then ReactModule.createElement(ToastVRWrapperModule, {
		isConfirmModalOpen = UseStateResult13,
		isToastOpen = UseStateResult5,
		isCoreScript = IsRenderLocationMatch,
		ToastComponent = UseMemoResult1,
		ToastNotificationSnoozeMenu = ReactModule.createElement(ToastNotificationSnoozeMenuModule),
		ConfirmationModalComponent = ReactModule.createElement(DeeplinkConfirmationModal, {
			backgroundTransparency = 1,
			closeCallback = CloseCallback
		})
	}) else ReactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		DisplayOrder = p1.displayOrder,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Toast = UseMemoResult1,
		ToastNotificationSnoozeMenu = ReactModule.createElement(ToastNotificationSnoozeMenuModule),
		DeeplinkConfirmationModal = UseStateResult13 and ReactModule.createElement(DeeplinkConfirmationModal, { closeCallback = CloseCallback })
	})
end