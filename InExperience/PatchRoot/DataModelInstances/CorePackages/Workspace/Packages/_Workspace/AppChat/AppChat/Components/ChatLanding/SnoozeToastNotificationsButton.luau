local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local toastNotificationModule = require(parent.ToastNotification)
local UIBloxModule = require(parent.UIBlox)
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
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local argoPartyExperimentation = require(parent.SocialExperiments).ArgoPartyExperimentation

return function(p0) --[[ line: 34 | named "SnoozeToastNotificationsButton" ]]
	-- upvalues: useLocalization (ref), argoPartyExperimentation (ref), getFFlagIsSquadEnabled (ref), reactModule (ref), default (ref), toastNotificationTypeModule (ref), notificationSnoozedSignal (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), iconButton (ref), images (ref), notificationGroups (ref), showNotificationSnoozeMenuSignal (ref), chatLandingTelemetryEventsModule (ref)
	local var7 = useLocalization({
		party = "Feature.Squads.Label.Party",
		unmuteFeedback = "Feature.Notifications.Heading.RemoveSnoozeFeedback",
		chat = if argoPartyExperimentation.getIsRenameEnabled() then "CommonUI.Features.Label.Chat" else "Feature.Chat.Heading.ChatWithConnections",
		snoozeTitle = if argoPartyExperimentation.getIsRenameEnabled() then "Feature.Chat.Title.MuteChatNotifications" elseif getFFlagIsSquadEnabled() then "Feature.Chat.Label.SnoozePartyNotifications" else "Feature.Chat.Label.SnoozeChatNotifications"
	})
	local var8, var9 = reactModule.useState(default:isSnoozedNotificationType(toastNotificationTypeModule.NotificationTypeEnum.ChatNewMessage))
	reactModule.useEffect(function() --[[ line: 53 ]]
		-- upvalues: notificationSnoozedSignal (copy), toastNotificationTypeModule (copy), var9 (ref)
		local var11 = notificationSnoozedSignal:connect(function(p1) --[[ line: 54 ]]
			-- upvalues: toastNotificationTypeModule (copy), var9 (copy)
			if p1.notificationType == toastNotificationTypeModule.NotificationTypeEnum.ChatNewMessage then
				var9(p1.actionType == toastNotificationTypeModule.SnoozeActionEnum.Mute)
			end
		end)
		
		return function() --[[ line: 65 ]]
			-- upvalues: var11 (ref)
			var11:disconnect()
		end
	end, {})
	local var10 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	
	return reactModule.createElement(iconButton, {
		size = p0.size,
		icon = if var8 then images["icons/common/snoozeNotificationsOn"] else images["icons/common/snoozeNotificationsOff"],
		layoutOrder = p0.layoutOrder,
		onActivated = function() --[[ line: 78 ]]
			-- upvalues: var8 (ref), var7 (ref), argoPartyExperimentation (copy), getFFlagIsSquadEnabled (copy), default (copy), notificationGroups (copy), showNotificationSnoozeMenuSignal (copy), var10 (ref), chatLandingTelemetryEventsModule (copy)
			if var8 then
				default:unmuteNotification({
					context = "ChatLandingSnoozeToastNotificationsButton",
					notificationType = notificationGroups.ChatLandingNotificationsGroup,
					modalMessage = var7.unmuteFeedback:gsub("{title}", if argoPartyExperimentation.getIsRenameEnabled() or not getFFlagIsSquadEnabled() then var7.chat else var7.party)
				})
			else
				showNotificationSnoozeMenuSignal:fire({
					context = "ChatLandingSnoozeToastNotificationsButton",
					notificationType = notificationGroups.ChatLandingNotificationsGroup,
					title = var7.snoozeTitle
				})
			end
			var10.emit(chatLandingTelemetryEventsModule.ChatLandingSnoozeBtnClicked, { isChatNotificationsMuted = var8 })
		end
	})
end