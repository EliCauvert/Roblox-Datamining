local appChat = script:FindFirstAncestor("AppChat")
local httpService = game:GetService("HttpService")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local toastNotificationModule = require(parent.ToastNotification)
local default = require(parent.ToastNotificationsProtocol).ToastNotificationProtocol.default
local notificationGroups = toastNotificationModule.NotificationGroups
local useIsChatEnabledModule = require(appChat.Hooks.useIsChatEnabled)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local lifecycleEvents = toastNotificationModule.LifecycleEvents
local notificationTypeEnum = toastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local showNotificationSnoozeMenuSignal = toastNotificationModule.Signals.ShowNotificationSnoozeMenuSignal
local dismissNotificationSnoozeMenuSignal = toastNotificationModule.Signals.DismissNotificationSnoozeMenuSignal
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local getFFlagAppChatInExpToastSnoozeMenuDismissFix = require(parent.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local t = {
	hideAllChatToasts = false,
	isAppChatVisible = false,
	isInExperience = false,
	navigateToChat = function() --[[ line: 37 ]] end
}

return function(p0) --[[ line: 40 ]]
	-- upvalues: cryoModule (ref), t (ref), useLocalization (ref), getFFlagIsSquadEnabled (ref), getFFlagAppChatInExpToastSnoozeMenuDismissFix (ref), universalAppPolicyModule (ref), useIsChatEnabledModule (ref), reactModule (ref), lifecycleEvents (ref), notificationTypeEnum (ref), httpService (ref), default (ref), showNotificationSnoozeMenuSignal (ref), notificationGroups (ref), dismissNotificationSnoozeMenuSignal (ref)
	local var8 = cryoModule.Dictionary.join(t, p0)
	local var9 = useLocalization({
		snoozeDescription = "Feature.Chat.Description.SnoozeDescription",
		snoozeTitle = if getFFlagIsSquadEnabled() then "Feature.Chat.Label.SnoozePartyNotifications" else "Feature.Chat.Label.SnoozeChatNotifications"
	})
	local var10 = 0
	local canSeeChatTab = universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTab()
	local var12 = (if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then var8.isAppChatVisible else var8.hideAllChatToasts) or not useIsChatEnabledModule()
	reactModule.useEffect(function() --[[ line: 60 ]]
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), httpService (copy), default (copy), var8 (ref), showNotificationSnoozeMenuSignal (copy), var9 (ref), notificationGroups (copy)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.ChatNewMessage, function(p1) --[[ line: 64 ]]
			-- upvalues: httpService (copy), default (copy), var8 (copy), showNotificationSnoozeMenuSignal (copy), var9 (copy), notificationGroups (copy)
			if p1 and p1.userActionType == "click" and (p1.notificationData and p1.visualItem) and (p1.visualItem.eventName == "ChatMessageBody" and p1.visualItem.actionEventParams) then
				local actionEventParams = httpService:JSONDecode(p1.visualItem.actionEventParams)
				default:dismissNotification(p1.notificationData.id)
				var8.navigateToChat(actionEventParams.conversationId)
			end
			if p1 and p1.userActionType == "click" and (p1.notificationData and p1.visualItem) and p1.visualItem.eventName == "ChatMessageSnoozeSingleMetaAction" then
				showNotificationSnoozeMenuSignal:fire({
					context = "Toast",
					description = var9.snoozeDescription,
					notificationType = notificationGroups.ChatMessageGroup,
					title = var9.snoozeTitle
				})
			end
		end)
		
		return function() --[[ line: 96 ]]
			-- upvalues: userAction (ref)
			userAction()
		end
	end, { var8.navigateToChat, var9 })
	reactModule.useEffect(function() --[[ line: 101 ]]
		-- upvalues: default (copy), notificationTypeEnum (copy), var12 (write), canSeeChatTab (ref), var10 (write)
		local var15 = default:listenToDisplayNotification(function(p2) --[[ line: 103 ]]
			-- upvalues: notificationTypeEnum (copy), var12 (copy), canSeeChatTab (copy), default (copy), var10 (copy)
			if p2.notificationType == notificationTypeEnum.ChatNewMessage then
				if var12 or not canSeeChatTab then
					default:dismissNotification(p2.notificationId)
					
					return
				end
				var10 += 1
			end
		end)
		
		return function() --[[ line: 114 ]]
			-- upvalues: var15 (ref)
			var15:Disconnect()
		end
	end, { var12, canSeeChatTab })
	
	if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then
		reactModule.useEffect(function() --[[ line: 120 ]]
			-- upvalues: var8 (ref), dismissNotificationSnoozeMenuSignal (copy)
			if not var8.isAppChatVisible and dismissNotificationSnoozeMenuSignal then
				dismissNotificationSnoozeMenuSignal:fire()
			end
		end, { var8.isAppChatVisible })
	end
end