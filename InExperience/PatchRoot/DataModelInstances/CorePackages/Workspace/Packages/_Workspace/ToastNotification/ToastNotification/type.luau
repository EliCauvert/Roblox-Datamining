local parent = script.Parent.Parent
local _ = require(parent.ToastNotificationsProtocol)

return {
	ChannelListEnum = {
		App = "toast-in-app-notifications",
		Experience = "toast-in-experience-notifications",
		Dual = "toast-in-app-and-experience-notifications",
		Desktop = "toast-in-app-and-experience-desktop-notifications"
	},
	ActionTypeEnum = {
		Report = "reportNotification",
		Deeplink = "deeplink",
		NotificationApi = "notificationAPI",
		Dismiss = "dismiss",
		Reload = "reload",
		None = "none",
		VoltronBroadcast = "voltronBroadcast",
		UpdateState = "updateState",
		WebView = "webview"
	},
	SENDERButtonStyleEnum = {
		Primary = "Primary",
		Secondary = "Secondary",
		Alert = "Alert",
		Growth = "Growth"
	},
	SENDERThumbnailTypeEnum = {
		User = "userThumbnail",
		Game = "gameThumbnail",
		Group = "groupThumbnail",
		Asset = "assetThumbnail",
		Bundle = "bundleThumbnail",
		Icon = "icon",
		AvatarImageUrl = "avatarImageUrlThumbnail"
	},
	ToastNotificationActionsEnum = {
		ModalCancel = "modalCancel",
		ModalConfirm = "modalConfirm",
		Dismissed = "dismissed",
		Display = "displayed",
		Hover = "hoverOver",
		Ignored = "ignored",
		Update = "update",
		DeeplinkFailed = "deeplinkFailed"
	},
	RenderLocationEnum = { UniversalApp = "universalApp", CoreScript = "coreScript" },
	DeviceOrientationEnum = {
		Portrait = "Portrait",
		Landscape = "Landscape",
		Unknown = "Unknown"
	},
	VisualItemTypeEnum = {
		Button = "button",
		TextBody = "textBody",
		Thumbnail = "thumbnail",
		MetaAction = "metaAction"
	},
	MetaActionIcons = {
		snooze = require(parent.UIBlox).App.ImageSet.Images["icons/common/snoozeNotificationsOff"]
	},
	NotificationTypeEnum = {
		CallReceived = "CallReceived",
		ChatNewMessage = "ChatNewMessage",
		ScheduledSquadReminder = "ScheduledSquadReminder",
		ScheduledSquadHappeningNow = "ScheduledSquadHappeningNow",
		SquadInvitation = "SquadInvitation",
		SquadInvitationV2 = "SquadInvitationV2",
		SquadExperienceInvitation = "SquadExperienceInvitation",
		SquadJoinRequestPrompt = "SquadJoinRequestPrompt",
		SquadAcceptJoinRequest = "SquadAcceptJoinRequest",
		SquadStartPartyPrompt = "SquadStartPartyPrompt",
		SquadNudgeInvite = "SquadNudgeInvite",
		NudgeForInviterSquad = "NudgeForInviterSquad",
		PromptUserToRequest = "PromptUserToRequest",
		RequestToJoinParty = "RequestToJoinParty",
		ClientNotification = "ClientNotification",
		FriendRequestReceived = "FriendRequestReceived",
		SecurityAlert = "SecurityAlert"
	},
	SnoozeActionEnum = { Mute = "Mute", Unmute = "Unmute" }
}