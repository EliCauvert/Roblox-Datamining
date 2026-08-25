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

return function(p0)
	-- upvalues: useLocalization (ref), argoPartyExperimentation (ref), universalAppPolicyModule (ref), chatSnoozeMenuDescriptionFixEnabled (ref), fFlagAppChatToastChatTerminologyFixEnabled (ref), fFlagExpChatEnableFriendsTab (ref), getFFlagIsSquadEnabled (ref), reactModule (ref), default (ref), toastNotificationTypeModule (ref), notificationSnoozedSignal (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), iconButton (ref), images (ref), notificationGroups (ref), showNotificationSnoozeMenuSignal (ref), chatLandingTelemetryEventsModule (ref)
	local var9 = useLocalization({
		party = "Feature.Squads.Label.Party",
		unmuteFeedback = "Feature.Notifications.Heading.RemoveSnoozeFeedback",
		chat = if argoPartyExperimentation.getIsRenameEnabled() then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "CommonUI.Features.Label.Chat" else "Feature.Squads.Label.Party" else "Feature.Chat.Heading.ChatWithConnections",
		snoozeDescription = if chatSnoozeMenuDescriptionFixEnabled then "Feature.Chat.Description.SnoozeDescription" else nil,
		snoozeTitle = if fFlagAppChatToastChatTerminologyFixEnabled and fFlagExpChatEnableFriendsTab then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Label.MuteInGameChatToastNotifications" else "Feature.Chat.Label.MuteInGamePartyToastNotifications" elseif fFlagExpChatEnableFriendsTab then "Feature.Chat.Label.MuteInGameChatToastNotifications" elseif argoPartyExperimentation.getIsRenameEnabled() then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Title.MuteChatNotifications" else "Feature.Chat.Label.SnoozePartyNotifications" elseif getFFlagIsSquadEnabled() then "Feature.Chat.Label.SnoozePartyNotifications" else "Feature.Chat.Label.SnoozeChatNotifications"
	})
	local var10, var11 = reactModule.useState(default:isSnoozedNotificationType(toastNotificationTypeModule.NotificationTypeEnum.ChatNewMessage))
	reactModule.useEffect(function()
		-- upvalues: notificationSnoozedSignal (copy), toastNotificationTypeModule (copy), var11 (ref)
		local var13 = notificationSnoozedSignal:connect(function(p1)
			-- upvalues: toastNotificationTypeModule (copy), var11 (copy)
			if p1.notificationType == toastNotificationTypeModule.NotificationTypeEnum.ChatNewMessage then
				var11(p1.actionType == toastNotificationTypeModule.SnoozeActionEnum.Mute)
			end
		end)
		
		return function()
			-- upvalues: var13 (ref)
			var13:disconnect()
		end
	end, {})
	local var12 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	
	return reactModule.createElement(iconButton, {
		size = p0.size,
		icon = if var10 then images["icons/common/snoozeNotificationsOn"] else images["icons/common/snoozeNotificationsOff"],
		layoutOrder = p0.layoutOrder,
		onActivated = function()
			-- upvalues: var10 (ref), var9 (ref), argoPartyExperimentation (copy), getFFlagIsSquadEnabled (copy), default (copy), notificationGroups (copy), showNotificationSnoozeMenuSignal (copy), chatSnoozeMenuDescriptionFixEnabled (copy), var12 (ref), chatLandingTelemetryEventsModule (copy)
			if var10 then
				default:unmuteNotification({
					context = "ChatLandingSnoozeToastNotificationsButton",
					notificationType = notificationGroups.ChatLandingNotificationsGroup,
					modalMessage = var9.unmuteFeedback:gsub("{title}", if argoPartyExperimentation.getIsRenameEnabled() or not getFFlagIsSquadEnabled() then var9.chat else var9.party)
				})
			else
				showNotificationSnoozeMenuSignal:fire({
					context = "ChatLandingSnoozeToastNotificationsButton",
					notificationType = notificationGroups.ChatLandingNotificationsGroup,
					title = var9.snoozeTitle,
					description = if chatSnoozeMenuDescriptionFixEnabled then var9.snoozeDescription else nil
				})
			end
			var12.emit(chatLandingTelemetryEventsModule.ChatLandingSnoozeBtnClicked, { isChatNotificationsMuted = var10 })
		end
	})
end