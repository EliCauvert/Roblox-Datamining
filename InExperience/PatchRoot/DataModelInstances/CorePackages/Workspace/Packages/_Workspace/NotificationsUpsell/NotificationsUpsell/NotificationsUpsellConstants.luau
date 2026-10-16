local ModalKey = {
	PushUpsellHome = "homePushUpsell",
	PushUpsellChat = "chatPushUpsell"
}

return {
	ModalKey = ModalKey,
	LocalStorageKeys = {
		PromptShownCount = "PushUpsellPromptShownCount",
		ChatPromptShownCount = "PushUpsellChatPromptShownCount",
		SysPromptShownTimestamp = "PushUpsellSysPromptShownTimestamp",
		EduPromptResponseTimestamp = "PushUpsellEduPromptResponseTimestamp",
		EduPromptResponse = "PushUpsellEduPromptResponse"
	},
	TranslationKeys = {
		[ModalKey.PushUpsellHome] = {
			CancelAction = "Feature.Notifications.Action.PushUpsellNotNow",
			ConfirmAction = "Feature.Notifications.Action.PushUpsellAllow",
			Heading = "Feature.Notifications.Heading.PushUpsellGeneric",
			Body = "Feature.Notifications.Label.PushUpsellGeneric",
			SomethingWentWrong = "Feature.Call.Error.Description.Generic"
		},
		[ModalKey.PushUpsellChat] = {
			CancelAction = "Feature.Notifications.Action.PushUpsellNotNow",
			ConfirmAction = "Feature.Notifications.Action.PushUpsellAllow",
			Heading = "Feature.Notifications.Heading.PushUpsellChat",
			Body = "Feature.Notifications.Label.PushUpsellChat",
			SomethingWentWrong = "Feature.Call.Error.Description.Generic"
		}
	}
}