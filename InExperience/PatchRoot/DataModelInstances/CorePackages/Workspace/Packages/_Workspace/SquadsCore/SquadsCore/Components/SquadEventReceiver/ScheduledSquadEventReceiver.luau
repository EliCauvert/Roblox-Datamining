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

return function() --[[ line: 26 | named "SquadScheduledSquadEventReceiver" ]]
	-- upvalues: useDispatch (ref), reactModule (ref), squadExternalContractContextModule (ref), default (ref), notificationTypeEnum (ref), lifecycleEvents (ref), constantsModule (ref), httpService (ref), eventNamesModule (ref), squadToastActionsAndStatesModule (ref), squadToastTypeModule (ref), createOrJoinSquadModule (ref), realtimeDeliveryModule (ref), getScheduledSquadsStoreModule (ref)
	local var13 = useDispatch()
	local var14 = reactModule.useContext(squadExternalContractContextModule)
	local var15 = var14.useIsChatEnabled()
	reactModule.useEffect(function() --[[ line: 31 ]]
		-- upvalues: default (copy), notificationTypeEnum (copy), var15 (ref)
		local var16 = default:listenToDisplayNotification(function(p0) --[[ line: 33 ]]
			-- upvalues: notificationTypeEnum (copy), var15 (copy), default (copy)
			if (p0.notificationType == notificationTypeEnum.ScheduledSquadHappeningNow or p0.notificationType == notificationTypeEnum.ScheduledSquadReminder) and not var15 then
				default:dismissNotification(p0.notificationId)
			end
		end)
		
		return function() --[[ line: 45 ]]
			-- upvalues: var16 (ref)
			var16:Disconnect()
		end
	end, { var15 })
	reactModule.useEffect(function() --[[ line: 51 ]]
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), constantsModule (copy), httpService (copy), var14 (ref), eventNamesModule (copy), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), var13 (ref), createOrJoinSquadModule (copy)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.ScheduledSquadHappeningNow, function(p1) --[[ line: 55 ]]
			-- upvalues: constantsModule (copy), httpService (copy), var14 (copy), eventNamesModule (copy), squadToastActionsAndStatesModule (copy), squadToastTypeModule (copy), var13 (copy), createOrJoinSquadModule (copy)
			if p1 and p1.userActionType == "click" and (p1.visualItem and p1.visualItem.actionEventParams) and p1.visualItem.visualItemName == constantsModule.JOIN_SQUAD then
				local actionEventParams = httpService:JSONDecode(p1.visualItem.actionEventParams)
				var14.fireSquadAnalytics(eventNamesModule.SquadToastActions, {
					parentChannelId = actionEventParams.parentChannelId,
					toastAction = squadToastActionsAndStatesModule.ScheduledSquadHappeningNowJoinParty,
					toastType = squadToastTypeModule.ScheduledSquadHappeningNow
				})
				var13(createOrJoinSquadModule(actionEventParams.parentChannelId, var14.setSquadPrompt, var14.fireSquadAnalytics, var14.squadLocation, httpService:GenerateGUID(false), function() --[[ line: 77 ]] end, tostring(actionEventParams.scheduledGroupUpId)))
			end
		end)
		
		return function() --[[ line: 85 ]]
			-- upvalues: userAction (ref)
			userAction()
		end
	end, {
		var13,
		var14.setSquadPrompt,
		var14.fireSquadAnalytics,
		var14.squadLocation
	})
	realtimeDeliveryModule.useRealtimeNamespace(constantsModule.COMMUNICATION_CHANNEL_RTN_NAMESPACE, function(p2) --[[ line: 97 ]]
		-- upvalues: constantsModule (copy), getScheduledSquadsStoreModule (copy)
		if p2.Type == constantsModule.SCHEDULED_GROUP_UP_CHANGED_RTN_TYPE then
			local var19 = getScheduledSquadsStoreModule(false)
			
			for i, v in ipairs(p2.ScheduledGroupUpIds) do
				var19.fetchAndCacheScheduledSquadStatus(v)
			end
		end
	end, {})
end