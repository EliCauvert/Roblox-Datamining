local notificationTypeEnum = require(script.Parent.type).NotificationTypeEnum

return {
	ChatMessageGroup = {
		notificationTypeEnum.ChatNewMessage,
		notificationTypeEnum.SquadInvitation
	},
	ChatLandingNotificationsGroup = {
		notificationTypeEnum.ChatNewMessage,
		notificationTypeEnum.SquadInvitation,
		notificationTypeEnum.SquadStartPartyPrompt,
		notificationTypeEnum.SquadNudgeInvite
	},
	SquadNudgeInviteGroup = { notificationTypeEnum.SquadNudgeInvite },
	SquadStartPartyPromptGroup = { notificationTypeEnum.SquadStartPartyPrompt }
}