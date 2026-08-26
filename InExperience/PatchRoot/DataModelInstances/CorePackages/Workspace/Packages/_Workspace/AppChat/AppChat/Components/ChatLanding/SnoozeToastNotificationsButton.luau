local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local toastNotificationModule = require(parent.ToastNotification)
local UIBloxModule = require(parent.UIBlox)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local notificationSnoozedSignal = toastNotificationModule.Signals.NotificationSnoozedSignal
local showNotificationSnoozeMenuSignal = toastNotificationModule.Signals.ShowNotificationSnoozeMenuSignal
local default = toastNotificationModule.ToastNotificationSnoozeManager.default
local toastNotificationTypeModule = toastNotificationModule.ToastNotificationTypeModule
local notificationGroups = toastNotificationModule.NotificationGroups
local iconButton = UIBloxModule.App.Button.IconButton
local images = UIBloxModule.App.ImageSet.Images
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatLandingTelemetryEventsModule = require(script:FindFirstAncestor("ChatLanding").ChatLandingTelemetryEvents)
local chatLandingTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local chatSnoozeMenuDescriptionFixEnabled = game:DefineFastFlag("ChatSnoozeMenuDescriptionFixEnabled", false)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local fFlagAppChatToastChatTerminologyFixEnabled = require(parent.SharedFlags).FFlagAppChatToastChatTerminologyFixEnabled
local argoPartyExperimentation = require(parent.SocialExperiments).ArgoPartyExperimentation

return function(p1)
	-- upvalues: useLocalization (ref), argoPartyExperimentation (ref), universalAppPolicyModule (ref), chatSnoozeMenuDescriptionFixEnabled (ref), fFlagAppChatToastChatTerminologyFixEnabled (ref), fFlagExpChatEnableFriendsTab (ref), getFFlagIsSquadEnabled (ref), reactModule (ref), default (ref), toastNotificationTypeModule (ref), notificationSnoozedSignal (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), iconButton (ref), images (ref), notificationGroups (ref), showNotificationSnoozeMenuSignal (ref), chatLandingTelemetryEventsModule (ref)
	local var1 = useLocalization({
		party = "Feature.Squads.Label.Party",
		unmuteFeedback = "Feature.Notifications.Heading.RemoveSnoozeFeedback",
		chat = if argoPartyExperimentation.getIsRenameEnabled() then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "CommonUI.Features.Label.Chat" else "Feature.Squads.Label.Party" else "Feature.Chat.Heading.ChatWithConnections",
		snoozeDescription = if chatSnoozeMenuDescriptionFixEnabled then "Feature.Chat.Description.SnoozeDescription" else nil,
		snoozeTitle = if fFlagAppChatToastChatTerminologyFixEnabled and fFlagExpChatEnableFriendsTab then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Label.MuteInGameChatToastNotifications" else "Feature.Chat.Label.MuteInGamePartyToastNotifications" elseif fFlagExpChatEnableFriendsTab then "Feature.Chat.Label.MuteInGameChatToastNotifications" elseif argoPartyExperimentation.getIsRenameEnabled() then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Title.MuteChatNotifications" else "Feature.Chat.Label.SnoozePartyNotifications" elseif getFFlagIsSquadEnabled() then "Feature.Chat.Label.SnoozePartyNotifications" else "Feature.Chat.Label.SnoozeChatNotifications"
	})
	local var2, var3 = reactModule.useState(default:isSnoozedNotificationType(toastNotificationTypeModule.NotificationTypeEnum.ChatNewMessage))
	reactModule.useEffect(function()
		-- upvalues: notificationSnoozedSignal (copy), toastNotificationTypeModule (copy), var3 (ref)
		local var4 = notificationSnoozedSignal:connect(function(p2)
			-- upvalues: toastNotificationTypeModule (copy), var3 (copy)
			if p2.notificationType == toastNotificationTypeModule.NotificationTypeEnum.ChatNewMessage then
				var3(p2.actionType == toastNotificationTypeModule.SnoozeActionEnum.Mute)
			end
		end)
		
		return function()
			-- upvalues: var4 (ref)
			var4:disconnect()
		end
	end, {})
	local var4 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	
	return reactModule.createElement(iconButton, {
		size = p1.size,
		icon = if var2 then images["icons/common/snoozeNotificationsOn"] else images["icons/common/snoozeNotificationsOff"],
		layoutOrder = p1.layoutOrder,
		onActivated = function()
			-- upvalues: var2 (ref), var1 (ref), argoPartyExperimentation (copy), getFFlagIsSquadEnabled (copy), default (copy), notificationGroups (copy), showNotificationSnoozeMenuSignal (copy), chatSnoozeMenuDescriptionFixEnabled (copy), var4 (ref), chatLandingTelemetryEventsModule (copy)
			if var2 then
				default:unmuteNotification({
					context = "ChatLandingSnoozeToastNotificationsButton",
					notificationType = notificationGroups.ChatLandingNotificationsGroup,
					modalMessage = var1.unmuteFeedback:gsub("{title}", if argoPartyExperimentation.getIsRenameEnabled() or not getFFlagIsSquadEnabled() then var1.chat else var1.party)
				})
			else
				showNotificationSnoozeMenuSignal:fire({
					context = "ChatLandingSnoozeToastNotificationsButton",
					notificationType = notificationGroups.ChatLandingNotificationsGroup,
					title = var1.snoozeTitle,
					description = if chatSnoozeMenuDescriptionFixEnabled then var1.snoozeDescription else nil
				})
			end
			var4.emit(chatLandingTelemetryEventsModule.ChatLandingSnoozeBtnClicked, { isChatNotificationsMuted = var2 })
		end
	})
end