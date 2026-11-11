game:DefineFastString("ChatLandingPvUpsellSeenAction", "record_has_seen")
game:DefineFastString("ChatLandingPvUpsellDismissAction", "record_has_seen")
game:DefineFastString("ChatLandingFtuxSeenAction", "record_has_seen")
game:DefineFastString("ChatLandingFtuxDismissAction", "record_dont_show_again")
game:DefineFastString("UnfilteredThreadsConversationBannerSeenAction", "record_has_seen")

return {
	ChatLandingPvUpsellSeenAction = game:GetFastString("ChatLandingPvUpsellSeenAction"),
	ChatLandingPvUpsellDismissAction = game:GetFastString("ChatLandingPvUpsellDismissAction"),
	ChatLandingFtuxSeenAction = game:GetFastString("ChatLandingFtuxSeenAction"),
	ChatLandingFtuxDismissAction = game:GetFastString("ChatLandingFtuxDismissAction"),
	UnfilteredThreadsConversationBannerSeenAction = game:GetFastString("UnfilteredThreadsConversationBannerSeenAction")
}