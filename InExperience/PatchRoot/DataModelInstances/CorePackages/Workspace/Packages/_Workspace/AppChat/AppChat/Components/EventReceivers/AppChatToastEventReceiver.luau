local AppChat = script:FindFirstAncestor("AppChat")
local HttpService = game:GetService("HttpService")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local ToastNotificationModule = require(Parent.ToastNotification)
local Default = require(Parent.ToastNotificationsProtocol).ToastNotificationProtocol.default
local NotificationGroups = ToastNotificationModule.NotificationGroups
local UseIsChatEnabledModule = require(AppChat.Hooks.useIsChatEnabled)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ShouldHideFriendsChatToastModule = require(script.Parent.shouldHideFriendsChatToast)
local LifecycleEvents = ToastNotificationModule.LifecycleEvents
local NotificationTypeEnum = ToastNotificationModule.ToastNotificationTypeModule.NotificationTypeEnum
local ShowNotificationSnoozeMenuSignal = ToastNotificationModule.Signals.ShowNotificationSnoozeMenuSignal
local DismissNotificationSnoozeMenuSignal = ToastNotificationModule.Signals.DismissNotificationSnoozeMenuSignal
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction = SharedFlagsModule.GetFFlagAppChatInExpToastSnoozeMenuDismissFix
local GetFFlagIsSquadEnabledFunction = SharedFlagsModule.GetFFlagIsSquadEnabled
local FFlagAppChatToastChatTerminologyFixEnabled = SharedFlagsModule.FFlagAppChatToastChatTerminologyFixEnabled
local config = {
	hideAllChatToasts = false,
	isAppChatVisible = false,
	isInExperience = false,
	navigateToChat = function() end
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseLocalizationFunction (copy), FFlagAppChatToastChatTerminologyFixEnabled (copy), FFlagExpChatEnableFriendsTab (copy), UniversalAppPolicyModule (copy), GetFFlagIsSquadEnabledFunction (copy), GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction (copy), UseIsChatEnabledModule (copy), ReactModule (copy), LifecycleEvents (copy), NotificationTypeEnum (copy), HttpService (copy), Default (copy), ShowNotificationSnoozeMenuSignal (copy), NotificationGroups (copy), ShouldHideFriendsChatToastModule (copy), DismissNotificationSnoozeMenuSignal (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseLocalizationResult = UseLocalizationFunction({
		snoozeDescription = "Feature.Chat.Description.SnoozeDescription",
		snoozeTitle = if FFlagAppChatToastChatTerminologyFixEnabled and FFlagExpChatEnableFriendsTab then if UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Label.MuteInGameChatToastNotifications" else "Feature.Chat.Label.MuteInGamePartyToastNotifications" elseif FFlagExpChatEnableFriendsTab then "Feature.Chat.Label.MuteInGameChatToastNotifications" elseif GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Label.SnoozePartyNotifications" else "Feature.Chat.Label.SnoozeChatNotifications"
	})
	local CanSeeChatTab = UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTab()
	local UseIsChatEnabledModuleResult = UseIsChatEnabledModule()
	local IsAppChatVisible = (if GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction() then JoinResult.isAppChatVisible else JoinResult.hideAllChatToasts) or not UseIsChatEnabledModuleResult
	ReactModule.useEffect(function()
		-- upvalues: LifecycleEvents (upval), NotificationTypeEnum (upval), HttpService (upval), Default (upval), JoinResult (copy), ShowNotificationSnoozeMenuSignal (upval), UseLocalizationResult (copy), NotificationGroups (upval)
		local RegisterResult = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.ChatNewMessage, function(p2)
			-- upvalues: HttpService (upval), Default (upval), JoinResult (upval), ShowNotificationSnoozeMenuSignal (upval), UseLocalizationResult (upval), NotificationGroups (upval)
			if p2 and p2.userActionType == "click" and p2.notificationData and p2.visualItem and p2.visualItem.eventName == "ChatMessageBody" and p2.visualItem.actionEventParams then
				local Data = HttpService:JSONDecode(p2.visualItem.actionEventParams)
				Default:dismissNotification(p2.notificationData.id)
				JoinResult.navigateToChat(Data.conversationId)
			end
			if p2 and p2.userActionType == "click" and p2.notificationData and p2.visualItem and p2.visualItem.eventName == "ChatMessageSnoozeSingleMetaAction" then
				ShowNotificationSnoozeMenuSignal:fire({
					context = "Toast",
					description = UseLocalizationResult.snoozeDescription,
					notificationType = NotificationGroups.ChatMessageGroup,
					title = UseLocalizationResult.snoozeTitle
				})
			end
		end)
		
		return function()
			-- upvalues: RegisterResult (copy)
			RegisterResult()
		end
	end, { JoinResult.navigateToChat, UseLocalizationResult })
	ReactModule.useEffect(function()
		-- upvalues: Default (upval), NotificationTypeEnum (upval), FFlagExpChatEnableFriendsTab (upval), JoinResult (copy), ShouldHideFriendsChatToastModule (upval), IsAppChatVisible (ref), CanSeeChatTab (copy)
		local ListenToDisplayNotificationResult = Default:listenToDisplayNotification(function(p2)
			-- upvalues: NotificationTypeEnum (upval), FFlagExpChatEnableFriendsTab (upval), JoinResult (upval), ShouldHideFriendsChatToastModule (upval), IsAppChatVisible (upval), CanSeeChatTab (upval), Default (upval)
			if p2.notificationType == NotificationTypeEnum.ChatNewMessage then
				local ShouldHideFriendsChatToastModule1 = FFlagExpChatEnableFriendsTab and (JoinResult.visibleFriendsConversationId ~= nil and ShouldHideFriendsChatToastModule(p2, JoinResult.visibleFriendsConversationId))
				
				if IsAppChatVisible or not CanSeeChatTab or ShouldHideFriendsChatToastModule1 then
					Default:dismissNotification(p2.notificationId)
				end
			end
		end)
		
		return function()
			-- upvalues: ListenToDisplayNotificationResult (copy)
			ListenToDisplayNotificationResult:Disconnect()
		end
	end, {
		IsAppChatVisible,
		CanSeeChatTab,
		JoinResult.visibleFriendsConversationId
	})
	
	if GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction() then
		ReactModule.useEffect(function()
			-- upvalues: JoinResult (copy), DismissNotificationSnoozeMenuSignal (upval)
			if not JoinResult.isAppChatVisible and DismissNotificationSnoozeMenuSignal then
				DismissNotificationSnoozeMenuSignal:fire()
			end
		end, { JoinResult.isAppChatVisible })
	end
end