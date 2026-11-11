local EventNamesModule = require(script.Parent.EventNames)
local DiagEventTypes = require(script:FindFirstAncestor("AppChat").Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes

return {
	[EventNamesModule.ChatLandingScreenRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingScreenRenderedCounter", "ChatLandingScreenRendered")
	},
	[EventNamesModule.AppChatVisible] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("AppChatVisibleCounter", "AppChatVisible")
	},
	[EventNamesModule.AppChatClosed] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("AppChatClosedCounter", "AppChatClosed")
	},
	[EventNamesModule.ChatLandingSearchBtnClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingSearchBtnClickedCounter", "ChatLandingSearchBtnClicked")
	},
	[EventNamesModule.ChatLandingComposeBtnClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingComposeBtnClickedCounter", "ChatLandingComposeBtnClicked")
	},
	[EventNamesModule.ChatLandingNotifBtnClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingNotifBtnClickedCounter", "ChatLandingNotifBtnClicked")
	},
	[EventNamesModule.ChatLandingConversationClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingConversationClickedCounter", "ChatLandingConversationClicked")
	},
	[EventNamesModule.ChatLandingGroupsBtnClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingGroupsBtnClicked", "ChatLandingGroupsBtnClicked")
	},
	[EventNamesModule.ChatLandingPvUpsellRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingPvUpsellRenderedCounter", "ChatLandingPvUpsellRendered")
	},
	[EventNamesModule.ChatLandingPvUpsellDismissed] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingPvUpsellDismissedCounter", "ChatLandingPvUpsellDismissed")
	},
	[EventNamesModule.ChatLandingPvUpsellContinueClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingPvUpsellContinueClickedCounter", "ChatLandingPvUpsellContinueClicked")
	},
	[EventNamesModule.ChatLandingPvUpsellSucceeded] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingPvUpsellSucceededCounter", "ChatLandingPvUpsellSucceeded")
	},
	[EventNamesModule.ChatLandingPvUpsellFailed] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingPvUpsellFailedCounter", "ChatLandingPvUpsellFailed")
	},
	[EventNamesModule.ChatLandingUnfilteredThreadsFtuxRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingUnfilteredThreadsFtuxRenderedCounter", "ChatLandingUnfilteredThreadsFtuxRendered")
	},
	[EventNamesModule.ChatLandingUnfilteredThreadsFtuxDismissed] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingUnfilteredThreadsFtuxDismissedCounter", "ChatLandingUnfilteredThreadsFtuxDismissed")
	},
	[EventNamesModule.ChatLandingUnfilteredThreadsFtuxLearnMoreClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingUnfilteredThreadsFtuxLearnMoreClickedCounter", "ChatLandingUnfilteredThreadsFtuxLearnMoreClicked")
	},
	[EventNamesModule.ConversationScreenRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationScreenRenderedCounter", "ConversationScreenRendered")
	},
	[EventNamesModule.ConversationSendBtnClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationSendBtnClickedCounter", "ConversationSendBtnClicked")
	},
	[EventNamesModule.ConversationScreenExit] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationScreenExitCounter", "ConversationScreenExit")
	},
	[EventNamesModule.ConversationInfoBtnClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationInfoBtnClickedCounter", "ConversationInfoBtnClicked")
	},
	[EventNamesModule.ConversationMessageSent] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationMessageSentCounter", "ConversationMessageSent")
	},
	[EventNamesModule.ConversationPvUpsellRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvUpsellRenderedCounter", "ConversationPvUpsellRendered")
	},
	[EventNamesModule.ConversationPvUpsellLeftGroup] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvUpsellLeftGroupCounter", "ConversationPvUpsellLeftGroup")
	},
	[EventNamesModule.ConversationPvUpsellContinueClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvUpsellContinueClickedCounter", "ConversationPvUpsellContinueClicked")
	},
	[EventNamesModule.ConversationPvUpsellSucceeded] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvUpsellSucceededCounter", "ConversationPvUpsellSucceeded")
	},
	[EventNamesModule.ConversationPvUpsellFailed] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvUpsellFailedCounter", "ConversationPvUpsellFailed")
	},
	[EventNamesModule.ConversationIneligibleModalRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationIneligibleModalRenderedCounter", "ConversationIneligibleModalRendered")
	},
	[EventNamesModule.ConversationIneligibleModalLeftGroup] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationIneligibleModalLeftGroupCounter", "ConversationIneligibleModalLeftGroup")
	},
	[EventNamesModule.ConversationIneligibleModalLearnMoreClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationIneligibleModalLearnMoreClickedCounter", "ConversationIneligibleModalLearnMoreClicked")
	},
	[EventNamesModule.ConversationPvBannerRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvBannerRenderedCounter", "ConversationPvBannerRendered")
	},
	[EventNamesModule.ConversationPvBannerActionClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvBannerActionClickedCounter", "ConversationPvBannerActionClicked")
	},
	[EventNamesModule.ConversationUpgradeBannerRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationUpgradeBannerRenderedCounter", "ConversationUpgradeBannerRendered")
	},
	[EventNamesModule.ConversationUpgradeBannerActionClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationUpgradeBannerActionClickedCounter", "ConversationUpgradeBannerActionClicked")
	},
	[EventNamesModule.ConversationLearnMoreBannerRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationLearnMoreBannerRenderedCounter", "ConversationLearnMoreBannerRendered")
	},
	[EventNamesModule.ConversationLearnMoreBannerActionClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationLearnMoreBannerActionClickedCounter", "ConversationLearnMoreBannerActionClicked")
	},
	[EventNamesModule.ConversationPvDialogRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvDialogRenderedCounter", "ConversationPvDialogRendered")
	},
	[EventNamesModule.ConversationPvDialogActionClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvDialogActionClickedCounter", "ConversationPvDialogActionClicked")
	},
	[EventNamesModule.ConversationPvDialogDismissed] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvDialogDismissedCounter", "ConversationPvDialogDismissed")
	},
	[EventNamesModule.ConversationPvDialogSucceeded] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvDialogSucceededCounter", "ConversationPvDialogSucceeded")
	},
	[EventNamesModule.ConversationPvDialogFailed] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvDialogFailedCounter", "ConversationPvDialogFailed")
	},
	[EventNamesModule.ConversationUpgradeDialogRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationUpgradeDialogRenderedCounter", "ConversationUpgradeDialogRendered")
	},
	[EventNamesModule.ConversationUpgradeDialogActionClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationUpgradeDialogActionClickedCounter", "ConversationUpgradeDialogActionClicked")
	},
	[EventNamesModule.ConversationUpgradeDialogDismissed] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationUpgradeDialogDismissedCounter", "ConversationUpgradeDialogDismissed")
	},
	[EventNamesModule.ConversationLearnMoreDialogRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationLearnMoreDialogRenderedCounter", "ConversationLearnMoreDialogRendered")
	},
	[EventNamesModule.ConversationLearnMoreDialogDismissed] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ConversationLearnMoreDialogDismissedCounter", "ConversationLearnMoreDialogDismissed")
	},
	[EventNamesModule.NewConversationCreated] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("NewConversationCreatedCounter", "NewConversationCreated")
	},
	[EventNamesModule.ChatMessagePressed] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatMessagePressedCounter", "ChatMessagePressed")
	},
	[EventNamesModule.ChatMessageLongPressed] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatMessageLongPressedCounter", "ChatMessageLongPressed")
	},
	[EventNamesModule.ChatMessageOpenMenuIconClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatMessageOpenMenuIconClickedCounter", "ChatMessageOpenMenuIconClicked")
	},
	[EventNamesModule.ChatMessageReplyIconClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatMessageReplyIconClickedCounter", "ChatMessageReplyIconClicked")
	},
	[EventNamesModule.ChatMessageMenuOpened] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatMessageMenuOpenedCounter", "ChatMessageMenuOpened")
	},
	[EventNamesModule.ChatMessageMenuReplyBtnActivated] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatMessageMenuReplyBtnActivatedCounter", "ChatMessageMenuReplyBtnActivated")
	},
	[EventNamesModule.ChatMessageMenuCopyBtnActivated] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatMessageMenuCopyBtnActivatedCounter", "ChatMessageMenuCopyBtnActivated")
	},
	[EventNamesModule.ChatInputBarReplyComposeRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatInputBarReplyComposeRenderedCounter", "ChatInputBarReplyComposeRendered")
	},
	[EventNamesModule.ChatInputBarReplyComposeCancelBtnActivated] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatInputBarReplyComposeCancelBtnActivatedCounter", "ChatInputBarReplyComposeCancelBtnActivated")
	},
	[EventNamesModule.ChatDetailsRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsRenderedCounter", "ChatDetailsRendered")
	},
	[EventNamesModule.ChatEmptyStateScreenRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatEmptyStateScreenRenderedCounter", "ChatEmptyStateScreenRendered")
	},
	[EventNamesModule.ChatAddFriendsBtnClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatAddFriendsBtnClickedCounter", "ChatAddFriendsBtnClicked")
	},
	[EventNamesModule.ChatDetailsAddFriendsBtnClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsAddFriendsBtnClickedCounter", "ChatDetailsAddFriendsBtnClicked")
	},
	[EventNamesModule.ChatDetailsLeaveGroupBtnClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsLeaveGroupBtnClickedCounter", "ChatDetailsLeaveGroupBtnClicked")
	},
	[EventNamesModule.ChatDetailsLeaveGroupDialogRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsLeaveGroupDialogRenderedCounter", "ChatDetailsLeaveGroupDialogRendered")
	},
	[EventNamesModule.ChatDetailsLeaveGroupDialogStayClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsLeaveGroupDialogStayClickedCounter", "ChatDetailsLeaveGroupDialogStayClicked")
	},
	[EventNamesModule.ChatDetailsLeaveGroupDialogLeaveClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsLeaveGroupDialogLeaveClickedCounter", "ChatDetailsLeaveGroupDialogLeaveClicked")
	},
	[EventNamesModule.ChatDetailsReportUserClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsReportUserClickedCounter", "ChatDetailsReportUserClicked")
	},
	[EventNamesModule.ChatDetailsCreateUnfilteredChatCellRendered] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsCreateUnfilteredChatCellRenderedCounter", "ChatDetailsCreateUnfilteredChatCellRendered")
	},
	[EventNamesModule.ChatDetailsCreateUnfilteredChatCellClicked] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsCreateUnfilteredChatCellClickedCounter", "ChatDetailsCreateUnfilteredChatCellClicked")
	}
}