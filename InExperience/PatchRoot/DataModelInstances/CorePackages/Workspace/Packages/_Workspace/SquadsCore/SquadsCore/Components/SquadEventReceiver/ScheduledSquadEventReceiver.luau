local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local httpService = game:GetService("HttpService")
local constantsModule = require(squadsCore.Common.Constants)
local createOrJoinSquadModule = require(squadsCore.Thunks.createOrJoinSquad)
local getScheduledSquadsStoreModule = require(squadsCore.Stores.GetScheduledSquadsStore)
local eventNamesModule = require(squadsCore.Analytics.EventNames)
local squadExternalContractContextModule = require(squadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local squadToastActionsAndStatesModule = require(squadsCore.Enums.SquadToastActionsAndStates)
local squadToastTypeModule = require(squadsCore.Enums.SquadToastType)
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local toastNotificationModule = require(parent.ToastNotification)
local toastNotificationsProtocolModule = require(parent.ToastNotificationsProtocol)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local lifecycleEvents = toastNotificationModule.LifecycleEvents
local notificationTypeEnum = toastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local default = toastNotificationsProtocolModule.ToastNotificationProtocol.default

return function()
	-- upvalues: useDispatch (ref), reactModule (ref), squadExternalContractContextModule (ref), default (ref), notificationTypeEnum (ref), lifecycleEvents (ref), constantsModule (ref), httpService (ref), eventNamesModule (ref), squadToastActionsAndStatesModule (ref), squadToastTypeModule (ref), createOrJoinSquadModule (ref), realtimeDeliveryModule (ref), getScheduledSquadsStoreModule (ref)
	local var1 = useDispatch()
	local var2 = reactModule.useContext(squadExternalContractContextModule)
	local var3 = var2.useIsChatEnabled()
	reactModule.useEffect(function()
		-- upvalues: default (copy), notificationTypeEnum (copy), var3 (ref)
		local var4 = default:listenToDisplayNotification(function(p1)
			-- upvalues: notificationTypeEnum (copy), var3 (copy), default (copy)
			if (p1.notificationType == notificationTypeEnum.ScheduledSquadHappeningNow or p1.notificationType == notificationTypeEnum.ScheduledSquadReminder) and not var3 then
				default:dismissNotification(p1.notificationId)
			end
		end)
		
		return function()
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), constantsModule (copy), httpService (copy), var2 (ref), eventNamesModule (copy), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), var1 (ref), createOrJoinSquadModule (copy)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.ScheduledSquadHappeningNow, function(p1)
			-- upvalues: constantsModule (copy), httpService (copy), var2 (copy), eventNamesModule (copy), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), var1 (copy), createOrJoinSquadModule (copy)
			if p1 and p1.userActionType == "click" and (p1.visualItem and p1.visualItem.actionEventParams) and p1.visualItem.visualItemName == constantsModule.JOIN_SQUAD then
				local actionEventParams = httpService:JSONDecode(p1.visualItem.actionEventParams)
				var2.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
					parentChannelId = actionEventParams.parentChannelId,
					toastAction = squadToastActionsAndStatesModule.ScheduledSquadHappeningNowJoinParty,
					toastType = squadToastTypeModule.ScheduledSquadHappeningNow
				})
				var1(createOrJoinSquadModule(actionEventParams.parentChannelId, var2.setSquadPrompt, var2.fireSquadAnalytics, var2.squadLocation, httpService:GenerateGUID(false), function() end, tostring(actionEventParams.scheduledGroupUpId)))
			end
		end)
		
		return function()
			-- upvalues: userAction (ref)
			userAction()
		end
	end, {
		var1,
		var2.setSquadPrompt,
		var2.fireSquadAnalytics,
		var2.squadLocation
	})
	realtimeDeliveryModule.useRealtimeNamespace(constantsModule.COMMUNICATION_CHANNEL_RTN_NAMESPACE, function(p1)
		-- upvalues: constantsModule (copy), getScheduledSquadsStoreModule (copy)
		if p1.Type == constantsModule.SCHEDULED_GROUP_UP_CHANGED_RTN_TYPE then
			local var4 = getScheduledSquadsStoreModule(false)
			
			for i, v in ipairs(p1.ScheduledGroupUpIds) do
				var4.fetchAndCacheScheduledSquadStatus(v)
			end
		end
	end, {})
end