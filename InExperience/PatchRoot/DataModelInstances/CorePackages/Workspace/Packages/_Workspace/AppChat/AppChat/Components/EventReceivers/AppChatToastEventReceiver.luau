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
local shouldHideFriendsChatToastModule = require(script.Parent.shouldHideFriendsChatToast)
local lifecycleEvents = toastNotificationModule.LifecycleEvents
local notificationTypeEnum = toastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local showNotificationSnoozeMenuSignal = toastNotificationModule.Signals.ShowNotificationSnoozeMenuSignal
local dismissNotificationSnoozeMenuSignal = toastNotificationModule.Signals.DismissNotificationSnoozeMenuSignal
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local getFFlagAppChatInExpToastSnoozeMenuDismissFix = sharedFlagsModule.GetFFlagAppChatInExpToastSnoozeMenuDismissFix
local getFFlagIsSquadEnabled = sharedFlagsModule.GetFFlagIsSquadEnabled
local fFlagAppChatToastChatTerminologyFixEnabled = sharedFlagsModule.FFlagAppChatToastChatTerminologyFixEnabled
local t = {
	hideAllChatToasts = false,
	isAppChatVisible = false,
	isInExperience = false,
	navigateToChat = function() end
}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useLocalization (ref), fFlagAppChatToastChatTerminologyFixEnabled (ref), fFlagExpChatEnableFriendsTab (ref), universalAppPolicyModule (ref), getFFlagIsSquadEnabled (ref), getFFlagAppChatInExpToastSnoozeMenuDismissFix (ref), useIsChatEnabledModule (ref), reactModule (ref), lifecycleEvents (ref), notificationTypeEnum (ref), httpService (ref), default (ref), showNotificationSnoozeMenuSignal (ref), notificationGroups (ref), shouldHideFriendsChatToastModule (ref), dismissNotificationSnoozeMenuSignal (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useLocalization({
		snoozeDescription = "Feature.Chat.Description.SnoozeDescription",
		snoozeTitle = if fFlagAppChatToastChatTerminologyFixEnabled and fFlagExpChatEnableFriendsTab then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Label.MuteInGameChatToastNotifications" else "Feature.Chat.Label.MuteInGamePartyToastNotifications" elseif fFlagExpChatEnableFriendsTab then "Feature.Chat.Label.MuteInGameChatToastNotifications" elseif getFFlagIsSquadEnabled() then "Feature.Chat.Label.SnoozePartyNotifications" else "Feature.Chat.Label.SnoozeChatNotifications"
	})
	local canSeeChatTab = universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTab()
	local var3 = (if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then var1.isAppChatVisible else var1.hideAllChatToasts) or not useIsChatEnabledModule()
	reactModule.useEffect(function()
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), httpService (copy), default (copy), var1 (ref), showNotificationSnoozeMenuSignal (copy), var2 (ref), notificationGroups (copy)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.ChatNewMessage, function(p2)
			-- upvalues: httpService (copy), default (copy), var1 (copy), showNotificationSnoozeMenuSignal (copy), var2 (copy), notificationGroups (copy)
			if p2 and p2.userActionType == "click" and (p2.notificationData and p2.visualItem) and (p2.visualItem.eventName == "ChatMessageBody" and p2.visualItem.actionEventParams) then
				local actionEventParams = httpService:JSONDecode(p2.visualItem.actionEventParams)
				default:dismissNotification(p2.notificationData.id)
				var1.navigateToChat(actionEventParams.conversationId)
			end
			if p2 and p2.userActionType == "click" and (p2.notificationData and p2.visualItem) and p2.visualItem.eventName == "ChatMessageSnoozeSingleMetaAction" then
				showNotificationSnoozeMenuSignal:fire({
					context = "Toast",
					description = var2.snoozeDescription,
					notificationType = notificationGroups.ChatMessageGroup,
					title = var2.snoozeTitle
				})
			end
		end)
		
		return function()
			-- upvalues: userAction (ref)
			userAction()
		end
	end, { var1.navigateToChat, var2 })
	reactModule.useEffect(function()
		-- upvalues: default (copy), notificationTypeEnum (copy), fFlagExpChatEnableFriendsTab (copy), var1 (ref), shouldHideFriendsChatToastModule (copy), var3 (write), canSeeChatTab (ref)
		local var4 = default:listenToDisplayNotification(function(p2)
			-- upvalues: notificationTypeEnum (copy), fFlagExpChatEnableFriendsTab (copy), var1 (copy), shouldHideFriendsChatToastModule (copy), var3 (copy), canSeeChatTab (copy), default (copy)
			if p2.notificationType == notificationTypeEnum.ChatNewMessage then
				if var3 or not canSeeChatTab or (fFlagExpChatEnableFriendsTab and (var1.visibleFriendsConversationId ~= nil and shouldHideFriendsChatToastModule(p2, var1.visibleFriendsConversationId))) then
					default:dismissNotification(p2.notificationId)
				end
			end
		end)
		
		return function()
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, { var3, canSeeChatTab, var1.visibleFriendsConversationId })
	
	if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then
		reactModule.useEffect(function()
			-- upvalues: var1 (ref), dismissNotificationSnoozeMenuSignal (copy)
			if not var1.isAppChatVisible and dismissNotificationSnoozeMenuSignal then
				dismissNotificationSnoozeMenuSignal:fire()
			end
		end, { var1.isAppChatVisible })
	end
end