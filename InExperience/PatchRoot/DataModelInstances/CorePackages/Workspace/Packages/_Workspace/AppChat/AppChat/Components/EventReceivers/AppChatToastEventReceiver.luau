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
	navigateToChat = function() --[[ line: 41 ]] end
}

return function(p0) --[[ line: 44 ]]
	-- upvalues: cryoModule (ref), t (ref), useLocalization (ref), fFlagAppChatToastChatTerminologyFixEnabled (ref), fFlagExpChatEnableFriendsTab (ref), universalAppPolicyModule (ref), getFFlagIsSquadEnabled (ref), getFFlagAppChatInExpToastSnoozeMenuDismissFix (ref), useIsChatEnabledModule (ref), reactModule (ref), lifecycleEvents (ref), notificationTypeEnum (ref), httpService (ref), default (ref), showNotificationSnoozeMenuSignal (ref), notificationGroups (ref), shouldHideFriendsChatToastModule (ref), dismissNotificationSnoozeMenuSignal (ref)
	local var10 = cryoModule.Dictionary.join(t, p0)
	local var11 = useLocalization({
		snoozeDescription = "Feature.Chat.Description.SnoozeDescription",
		snoozeTitle = if fFlagAppChatToastChatTerminologyFixEnabled and fFlagExpChatEnableFriendsTab then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Label.MuteInGameChatToastNotifications" else "Feature.Chat.Label.MuteInGamePartyToastNotifications" elseif fFlagExpChatEnableFriendsTab then "Feature.Chat.Label.MuteInGameChatToastNotifications" elseif getFFlagIsSquadEnabled() then "Feature.Chat.Label.SnoozePartyNotifications" else "Feature.Chat.Label.SnoozeChatNotifications"
	})
	local canSeeChatTab = universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTab()
	local var13 = (if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then var10.isAppChatVisible else var10.hideAllChatToasts) or not useIsChatEnabledModule()
	reactModule.useEffect(function() --[[ line: 67 ]]
		-- upvalues: lifecycleEvents (copy), notificationTypeEnum (copy), httpService (copy), default (copy), var10 (ref), showNotificationSnoozeMenuSignal (copy), var11 (ref), notificationGroups (copy)
		local userAction = lifecycleEvents:RegisterCallback(lifecycleEvents.ToastEvents.UserAction, notificationTypeEnum.ChatNewMessage, function(p1) --[[ line: 71 ]]
			-- upvalues: httpService (copy), default (copy), var10 (copy), showNotificationSnoozeMenuSignal (copy), var11 (copy), notificationGroups (copy)
			if p1 and p1.userActionType == "click" and (p1.notificationData and p1.visualItem) and (p1.visualItem.eventName == "ChatMessageBody" and p1.visualItem.actionEventParams) then
				local actionEventParams = httpService:JSONDecode(p1.visualItem.actionEventParams)
				default:dismissNotification(p1.notificationData.id)
				var10.navigateToChat(actionEventParams.conversationId)
			end
			if p1 and p1.userActionType == "click" and (p1.notificationData and p1.visualItem) and p1.visualItem.eventName == "ChatMessageSnoozeSingleMetaAction" then
				showNotificationSnoozeMenuSignal:fire({
					context = "Toast",
					description = var11.snoozeDescription,
					notificationType = notificationGroups.ChatMessageGroup,
					title = var11.snoozeTitle
				})
			end
		end)
		
		return function() --[[ line: 103 ]]
			-- upvalues: userAction (ref)
			userAction()
		end
	end, { var10.navigateToChat, var11 })
	reactModule.useEffect(function() --[[ line: 108 ]]
		-- upvalues: default (copy), notificationTypeEnum (copy), fFlagExpChatEnableFriendsTab (copy), var10 (ref), shouldHideFriendsChatToastModule (copy), var13 (write), canSeeChatTab (ref)
		local var16 = default:listenToDisplayNotification(function(p2) --[[ line: 110 ]]
			-- upvalues: notificationTypeEnum (copy), fFlagExpChatEnableFriendsTab (copy), var10 (copy), shouldHideFriendsChatToastModule (copy), var13 (copy), canSeeChatTab (copy), default (copy)
			if p2.notificationType == notificationTypeEnum.ChatNewMessage then
				if var13 or not canSeeChatTab or (fFlagExpChatEnableFriendsTab and (var10.visibleFriendsConversationId ~= nil and shouldHideFriendsChatToastModule(p2, var10.visibleFriendsConversationId))) then
					default:dismissNotification(p2.notificationId)
				end
			end
		end)
		
		return function() --[[ line: 122 ]]
			-- upvalues: var16 (ref)
			var16:Disconnect()
		end
	end, { var13, canSeeChatTab, var10.visibleFriendsConversationId })
	
	if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then
		reactModule.useEffect(function() --[[ line: 128 ]]
			-- upvalues: var10 (ref), dismissNotificationSnoozeMenuSignal (copy)
			if not var10.isAppChatVisible and dismissNotificationSnoozeMenuSignal then
				dismissNotificationSnoozeMenuSignal:fire()
			end
		end, { var10.isAppChatVisible })
	end
end