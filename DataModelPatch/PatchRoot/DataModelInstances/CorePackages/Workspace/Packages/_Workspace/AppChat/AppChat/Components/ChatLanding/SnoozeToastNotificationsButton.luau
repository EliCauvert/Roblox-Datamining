local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local ToastNotificationModule = require(Parent.ToastNotification)
local UIBloxModule = require(Parent.UIBlox)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local NotificationSnoozedSignal = ToastNotificationModule.Signals.NotificationSnoozedSignal
local ShowNotificationSnoozeMenuSignal = ToastNotificationModule.Signals.ShowNotificationSnoozeMenuSignal
local Default = ToastNotificationModule.ToastNotificationSnoozeManager.default
local ToastNotificationTypeModule = ToastNotificationModule.ToastNotificationTypeModule
local NotificationGroups = ToastNotificationModule.NotificationGroups
local IconButton = UIBloxModule.App.Button.IconButton
local Images = UIBloxModule.App.ImageSet.Images
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatLandingTelemetryEventsModule = require(script:FindFirstAncestor("ChatLanding").ChatLandingTelemetryEvents)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local ArgoPartyExperimentation = require(Parent.SocialExperiments).ArgoPartyExperimentation

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ArgoPartyExperimentation (copy), UniversalAppPolicyModule (copy), GetFFlagIsSquadEnabledFunction (copy), ReactModule (copy), Default (copy), ToastNotificationTypeModule (copy), NotificationSnoozedSignal (copy), UseTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), IconButton (copy), Images (copy), NotificationGroups (copy), ShowNotificationSnoozeMenuSignal (copy), ChatLandingTelemetryEventsModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		party = "Feature.Squads.Label.Party",
		unmuteFeedback = "Feature.Notifications.Heading.RemoveSnoozeFeedback",
		chat = if ArgoPartyExperimentation.getIsRenameEnabled() then if UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "CommonUI.Features.Label.Chat" else "Feature.Squads.Label.Party" else "Feature.Chat.Heading.ChatWithConnections",
		snoozeTitle = if ArgoPartyExperimentation.getIsRenameEnabled() then if UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Title.MuteChatNotifications" else "Feature.Chat.Label.SnoozePartyNotifications" elseif GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Label.SnoozePartyNotifications" else "Feature.Chat.Label.SnoozeChatNotifications"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(Default:isSnoozedNotificationType(ToastNotificationTypeModule.NotificationTypeEnum.ChatNewMessage))
	ReactModule.useEffect(function()
		-- upvalues: NotificationSnoozedSignal (upval), ToastNotificationTypeModule (upval), UseStateResult2 (copy)
		local Connection = NotificationSnoozedSignal:connect(function(p2)
			-- upvalues: ToastNotificationTypeModule (upval), UseStateResult2 (upval)
			if p2.notificationType == ToastNotificationTypeModule.NotificationTypeEnum.ChatNewMessage then
				UseStateResult2(p2.actionType == ToastNotificationTypeModule.SnoozeActionEnum.Mute)
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, {})
	local UseTelemetryModuleResult = UseTelemetryModule(ChatLandingTelemetryLayerModule.Context)
	
	return ReactModule.createElement(IconButton, {
		size = p1.size,
		icon = if UseStateResult then Images["icons/common/snoozeNotificationsOn"] else Images["icons/common/snoozeNotificationsOff"],
		layoutOrder = p1.layoutOrder,
		onActivated = function()
			-- upvalues: UseStateResult (copy), UseLocalizationResult (copy), ArgoPartyExperimentation (upval), GetFFlagIsSquadEnabledFunction (upval), Default (upval), NotificationGroups (upval), ShowNotificationSnoozeMenuSignal (upval), UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval)
			if UseStateResult then
				Default:unmuteNotification({
					context = "ChatLandingSnoozeToastNotificationsButton",
					notificationType = NotificationGroups.ChatLandingNotificationsGroup,
					modalMessage = UseLocalizationResult.unmuteFeedback:gsub("{title}", if ArgoPartyExperimentation.getIsRenameEnabled() or not GetFFlagIsSquadEnabledFunction() then UseLocalizationResult.chat else UseLocalizationResult.party)
				})
			else
				ShowNotificationSnoozeMenuSignal:fire({
					context = "ChatLandingSnoozeToastNotificationsButton",
					notificationType = NotificationGroups.ChatLandingNotificationsGroup,
					title = UseLocalizationResult.snoozeTitle
				})
			end
			UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule.ChatLandingSnoozeBtnClicked, { isChatNotificationsMuted = UseStateResult })
		end
	})
end