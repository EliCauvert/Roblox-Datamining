local NotificationTypeEnum = require(script.Parent.type).NotificationTypeEnum

return {
	ChatMessageGroup = {
		NotificationTypeEnum.ChatNewMessage,
		NotificationTypeEnum.SquadInvitation
	},
	ChatLandingNotificationsGroup = {
		NotificationTypeEnum.ChatNewMessage,
		NotificationTypeEnum.SquadInvitation,
		NotificationTypeEnum.SquadStartPartyPrompt,
		NotificationTypeEnum.SquadNudgeInvite
	},
	SquadNudgeInviteGroup = { NotificationTypeEnum.SquadNudgeInvite },
	SquadStartPartyPromptGroup = { NotificationTypeEnum.SquadStartPartyPrompt }
}