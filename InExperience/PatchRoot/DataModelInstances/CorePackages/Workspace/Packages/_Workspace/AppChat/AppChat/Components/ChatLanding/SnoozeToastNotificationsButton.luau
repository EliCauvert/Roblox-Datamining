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
local FFlagAppChatToastChatTerminologyFixEnabled = require(Parent.SharedFlags).FFlagAppChatToastChatTerminologyFixEnabled

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UniversalAppPolicyModule (copy), FFlagAppChatToastChatTerminologyFixEnabled (copy), ReactModule (copy), Default (copy), ToastNotificationTypeModule (copy), NotificationSnoozedSignal (copy), UseTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), IconButton (copy), Images (copy), NotificationGroups (copy), ShowNotificationSnoozeMenuSignal (copy), ChatLandingTelemetryEventsModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		snoozeDescription = "Feature.Chat.Description.SnoozeDescription",
		unmuteFeedback = "Feature.Notifications.Heading.RemoveSnoozeFeedback",
		chat = if UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "CommonUI.Features.Label.Chat" else "Feature.Squads.Label.Party",
		snoozeTitle = if FFlagAppChatToastChatTerminologyFixEnabled then if UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Label.MuteInGameChatToastNotifications" else "Feature.Chat.Label.MuteInGamePartyToastNotifications" else "Feature.Chat.Label.MuteInGameChatToastNotifications"
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
			-- upvalues: UseStateResult (copy), UseLocalizationResult (copy), Default (upval), NotificationGroups (upval), ShowNotificationSnoozeMenuSignal (upval), UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval)
			if UseStateResult then
				Default:unmuteNotification({
					context = "ChatLandingSnoozeToastNotificationsButton",
					notificationType = NotificationGroups.ChatLandingNotificationsGroup,
					modalMessage = UseLocalizationResult.unmuteFeedback:gsub("{title}", UseLocalizationResult.chat)
				})
			else
				ShowNotificationSnoozeMenuSignal:fire({
					context = "ChatLandingSnoozeToastNotificationsButton",
					notificationType = NotificationGroups.ChatLandingNotificationsGroup,
					title = UseLocalizationResult.snoozeTitle,
					description = UseLocalizationResult.snoozeDescription
				})
			end
			UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule.ChatLandingSnoozeBtnClicked, { isChatNotificationsMuted = UseStateResult })
		end
	})
end