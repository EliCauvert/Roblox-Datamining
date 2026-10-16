local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local HttpService = game:GetService("HttpService")
local ConstantsModule = require(SquadsCore.Common.Constants)
local CreateOrJoinSquadModule = require(SquadsCore.Thunks.createOrJoinSquad)
local GetScheduledSquadsStoreModule = require(SquadsCore.Stores.GetScheduledSquadsStore)
local EventNamesModule = require(SquadsCore.Analytics.EventNames)
local SquadExternalContractContextModule = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local SquadToastActionsAndStatesModule = require(SquadsCore.Enums.SquadToastActionsAndStates)
local SquadToastTypeModule = require(SquadsCore.Enums.SquadToastType)
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local ToastNotificationModule = require(Parent.ToastNotification)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local LifecycleEvents = ToastNotificationModule.LifecycleEvents
local NotificationTypeEnum = ToastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local Default = require(Parent.ToastNotificationsProtocol).ToastNotificationProtocol.default

return function() --[[ Line: 26 | Named "SquadScheduledSquadEventReceiver" ]]
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), SquadExternalContractContextModule (copy), Default (copy), NotificationTypeEnum (copy), LifecycleEvents (copy), ConstantsModule (copy), HttpService (copy), EventNamesModule (copy), SquadToastActionsAndStatesModule (copy), SquadToastTypeModule (copy), CreateOrJoinSquadModule (copy), RealtimeDeliveryModule (copy), GetScheduledSquadsStoreModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseContextResult = ReactModule.useContext(SquadExternalContractContextModule)
	local UseIsChatEnabledResult = UseContextResult.useIsChatEnabled()
	ReactModule.useEffect(function() --[[ Line: 31 ]]
		-- upvalues: Default (upval), NotificationTypeEnum (upval), UseIsChatEnabledResult (copy)
		local ListenToDisplayNotificationResult = Default:listenToDisplayNotification(function(p1) --[[ Line: 33 ]]
			-- upvalues: NotificationTypeEnum (upval), UseIsChatEnabledResult (upval), Default (upval)
			if (p1.notificationType == NotificationTypeEnum.ScheduledSquadHappeningNow or p1.notificationType == NotificationTypeEnum.ScheduledSquadReminder) and not UseIsChatEnabledResult then
				Default:dismissNotification(p1.notificationId)
			end
		end)
		
		return function() --[[ Line: 45 ]]
			-- upvalues: ListenToDisplayNotificationResult (copy)
			ListenToDisplayNotificationResult:Disconnect()
		end
	end, { UseIsChatEnabledResult })
	ReactModule.useEffect(function() --[[ Line: 51 ]]
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), ConstantsModule (upval), HttpService (upval), UseContextResult (copy), EventNamesModule (upval), SquadToastActionsAndStatesModule (upval), SquadToastTypeModule (upval), UseDispatchResult (copy), CreateOrJoinSquadModule (upval)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.ScheduledSquadHappeningNow, function(p1) --[[ Line: 55 ]]
			-- upvalues: ConstantsModule (upval), HttpService (upval), UseContextResult (upval), EventNamesModule (upval), SquadToastActionsAndStatesModule (upval), SquadToastTypeModule (upval), UseDispatchResult (upval), CreateOrJoinSquadModule (upval)
			if p1 and p1.userActionType == "click" and p1.visualItem and p1.visualItem.actionEventParams and p1.visualItem.visualItemName == ConstantsModule.JOIN_SQUAD then
				local Data = HttpService:JSONDecode(p1.visualItem.actionEventParams)
				UseContextResult.fireSquadAnalytics(EventNamesModule.SquadToastActions, {
					parentChannelId = Data.parentChannelId,
					toastAction = SquadToastActionsAndStatesModule.ScheduledSquadHappeningNowJoinParty,
					toastType = SquadToastTypeModule.ScheduledSquadHappeningNow
				})
				UseDispatchResult(CreateOrJoinSquadModule(Data.parentChannelId, UseContextResult.setSquadPrompt, UseContextResult.fireSquadAnalytics, UseContextResult.squadLocation, HttpService:GenerateGUID(false), function() --[[ Line: 77 ]] end, (tostring(Data.scheduledGroupUpId))))
			end
		end)
		
		return function() --[[ Line: 85 ]]
			-- upvalues: RegisterResult (copy)
			RegisterResult()
		end
	end, {
		UseDispatchResult,
		UseContextResult.setSquadPrompt,
		UseContextResult.fireSquadAnalytics,
		UseContextResult.squadLocation
	})
	RealtimeDeliveryModule.useRealtimeNamespace(ConstantsModule.COMMUNICATION_CHANNEL_RTN_NAMESPACE, function(p1) --[[ Line: 97 ]]
		-- upvalues: ConstantsModule (upval), GetScheduledSquadsStoreModule (upval)
		if p1.Type == ConstantsModule.SCHEDULED_GROUP_UP_CHANGED_RTN_TYPE then
			local ScheduledSquadsStoreModule = GetScheduledSquadsStoreModule(false)
			
			for _, scheduledGroupUpId in ipairs(p1.ScheduledGroupUpIds) do
				ScheduledSquadsStoreModule.fetchAndCacheScheduledSquadStatus(scheduledGroupUpId)
			end
		end
	end, {})
end