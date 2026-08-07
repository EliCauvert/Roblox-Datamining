local eventNamesModule = require(script.Parent.EventNames)
local diagEventTypes = require(script:FindFirstAncestor("AppChat").Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes

return {
	[eventNamesModule.ChatLandingScreenRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingScreenRenderedCounter", "ChatLandingScreenRendered")
	},
	[eventNamesModule.AppChatVisible] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("AppChatVisibleCounter", "AppChatVisible")
	},
	[eventNamesModule.AppChatClosed] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("AppChatClosedCounter", "AppChatClosed")
	},
	[eventNamesModule.ChatLandingSearchBtnClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingSearchBtnClickedCounter", "ChatLandingSearchBtnClicked")
	},
	[eventNamesModule.ChatLandingComposeBtnClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingComposeBtnClickedCounter", "ChatLandingComposeBtnClicked")
	},
	[eventNamesModule.ChatLandingNotifBtnClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingNotifBtnClickedCounter", "ChatLandingNotifBtnClicked")
	},
	[eventNamesModule.ChatLandingConversationClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingConversationClickedCounter", "ChatLandingConversationClicked")
	},
	[eventNamesModule.ChatLandingGroupsBtnClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingGroupsBtnClicked", "ChatLandingGroupsBtnClicked")
	},
	[eventNamesModule.ChatLandingPvUpsellRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingPvUpsellRenderedCounter", "ChatLandingPvUpsellRendered")
	},
	[eventNamesModule.ChatLandingPvUpsellDismissed] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingPvUpsellDismissedCounter", "ChatLandingPvUpsellDismissed")
	},
	[eventNamesModule.ChatLandingPvUpsellContinueClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingPvUpsellContinueClickedCounter", "ChatLandingPvUpsellContinueClicked")
	},
	[eventNamesModule.ChatLandingPvUpsellSucceeded] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingPvUpsellSucceededCounter", "ChatLandingPvUpsellSucceeded")
	},
	[eventNamesModule.ChatLandingPvUpsellFailed] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingPvUpsellFailedCounter", "ChatLandingPvUpsellFailed")
	},
	[eventNamesModule.ChatLandingUnfilteredThreadsFtuxRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingUnfilteredThreadsFtuxRenderedCounter", "ChatLandingUnfilteredThreadsFtuxRendered")
	},
	[eventNamesModule.ChatLandingUnfilteredThreadsFtuxDismissed] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingUnfilteredThreadsFtuxDismissedCounter", "ChatLandingUnfilteredThreadsFtuxDismissed")
	},
	[eventNamesModule.ChatLandingUnfilteredThreadsFtuxLearnMoreClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatLandingUnfilteredThreadsFtuxLearnMoreClickedCounter", "ChatLandingUnfilteredThreadsFtuxLearnMoreClicked")
	},
	[eventNamesModule.ConversationScreenRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationScreenRenderedCounter", "ConversationScreenRendered")
	},
	[eventNamesModule.ConversationSendBtnClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationSendBtnClickedCounter", "ConversationSendBtnClicked")
	},
	[eventNamesModule.ConversationScreenExit] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationScreenExitCounter", "ConversationScreenExit")
	},
	[eventNamesModule.ConversationInfoBtnClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationInfoBtnClickedCounter", "ConversationInfoBtnClicked")
	},
	[eventNamesModule.ConversationMessageSent] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationMessageSentCounter", "ConversationMessageSent")
	},
	[eventNamesModule.ConversationPvUpsellRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvUpsellRenderedCounter", "ConversationPvUpsellRendered")
	},
	[eventNamesModule.ConversationPvUpsellLeftGroup] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvUpsellLeftGroupCounter", "ConversationPvUpsellLeftGroup")
	},
	[eventNamesModule.ConversationPvUpsellContinueClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvUpsellContinueClickedCounter", "ConversationPvUpsellContinueClicked")
	},
	[eventNamesModule.ConversationPvUpsellSucceeded] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvUpsellSucceededCounter", "ConversationPvUpsellSucceeded")
	},
	[eventNamesModule.ConversationPvUpsellFailed] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvUpsellFailedCounter", "ConversationPvUpsellFailed")
	},
	[eventNamesModule.ConversationIneligibleModalRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationIneligibleModalRenderedCounter", "ConversationIneligibleModalRendered")
	},
	[eventNamesModule.ConversationIneligibleModalLeftGroup] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationIneligibleModalLeftGroupCounter", "ConversationIneligibleModalLeftGroup")
	},
	[eventNamesModule.ConversationIneligibleModalLearnMoreClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationIneligibleModalLearnMoreClickedCounter", "ConversationIneligibleModalLearnMoreClicked")
	},
	[eventNamesModule.ConversationPvBannerRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvBannerRenderedCounter", "ConversationPvBannerRendered")
	},
	[eventNamesModule.ConversationPvBannerActionClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvBannerActionClickedCounter", "ConversationPvBannerActionClicked")
	},
	[eventNamesModule.ConversationUpgradeBannerRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationUpgradeBannerRenderedCounter", "ConversationUpgradeBannerRendered")
	},
	[eventNamesModule.ConversationUpgradeBannerActionClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationUpgradeBannerActionClickedCounter", "ConversationUpgradeBannerActionClicked")
	},
	[eventNamesModule.ConversationLearnMoreBannerRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationLearnMoreBannerRenderedCounter", "ConversationLearnMoreBannerRendered")
	},
	[eventNamesModule.ConversationLearnMoreBannerActionClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationLearnMoreBannerActionClickedCounter", "ConversationLearnMoreBannerActionClicked")
	},
	[eventNamesModule.ConversationPvDialogRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvDialogRenderedCounter", "ConversationPvDialogRendered")
	},
	[eventNamesModule.ConversationPvDialogActionClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvDialogActionClickedCounter", "ConversationPvDialogActionClicked")
	},
	[eventNamesModule.ConversationPvDialogDismissed] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvDialogDismissedCounter", "ConversationPvDialogDismissed")
	},
	[eventNamesModule.ConversationPvDialogSucceeded] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvDialogSucceededCounter", "ConversationPvDialogSucceeded")
	},
	[eventNamesModule.ConversationPvDialogFailed] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationPvDialogFailedCounter", "ConversationPvDialogFailed")
	},
	[eventNamesModule.ConversationUpgradeDialogRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationUpgradeDialogRenderedCounter", "ConversationUpgradeDialogRendered")
	},
	[eventNamesModule.ConversationUpgradeDialogActionClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationUpgradeDialogActionClickedCounter", "ConversationUpgradeDialogActionClicked")
	},
	[eventNamesModule.ConversationUpgradeDialogDismissed] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationUpgradeDialogDismissedCounter", "ConversationUpgradeDialogDismissed")
	},
	[eventNamesModule.ConversationLearnMoreDialogRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationLearnMoreDialogRenderedCounter", "ConversationLearnMoreDialogRendered")
	},
	[eventNamesModule.ConversationLearnMoreDialogDismissed] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ConversationLearnMoreDialogDismissedCounter", "ConversationLearnMoreDialogDismissed")
	},
	[eventNamesModule.NewConversationCreated] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("NewConversationCreatedCounter", "NewConversationCreated")
	},
	[eventNamesModule.ChatMessagePressed] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatMessagePressedCounter", "ChatMessagePressed")
	},
	[eventNamesModule.ChatMessageLongPressed] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatMessageLongPressedCounter", "ChatMessageLongPressed")
	},
	[eventNamesModule.ChatMessageOpenMenuIconClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatMessageOpenMenuIconClickedCounter", "ChatMessageOpenMenuIconClicked")
	},
	[eventNamesModule.ChatMessageReplyIconClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatMessageReplyIconClickedCounter", "ChatMessageReplyIconClicked")
	},
	[eventNamesModule.ChatMessageMenuOpened] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatMessageMenuOpenedCounter", "ChatMessageMenuOpened")
	},
	[eventNamesModule.ChatMessageMenuReplyBtnActivated] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatMessageMenuReplyBtnActivatedCounter", "ChatMessageMenuReplyBtnActivated")
	},
	[eventNamesModule.ChatMessageMenuCopyBtnActivated] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatMessageMenuCopyBtnActivatedCounter", "ChatMessageMenuCopyBtnActivated")
	},
	[eventNamesModule.ChatInputBarReplyComposeRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatInputBarReplyComposeRenderedCounter", "ChatInputBarReplyComposeRendered")
	},
	[eventNamesModule.ChatInputBarReplyComposeCancelBtnActivated] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatInputBarReplyComposeCancelBtnActivatedCounter", "ChatInputBarReplyComposeCancelBtnActivated")
	},
	[eventNamesModule.ChatDetailsRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsRenderedCounter", "ChatDetailsRendered")
	},
	[eventNamesModule.ChatEmptyStateScreenRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatEmptyStateScreenRenderedCounter", "ChatEmptyStateScreenRendered")
	},
	[eventNamesModule.ChatAddFriendsBtnClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatAddFriendsBtnClickedCounter", "ChatAddFriendsBtnClicked")
	},
	[eventNamesModule.ChatDetailsAddFriendsBtnClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsAddFriendsBtnClickedCounter", "ChatDetailsAddFriendsBtnClicked")
	},
	[eventNamesModule.ChatDetailsLeaveGroupBtnClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsLeaveGroupBtnClickedCounter", "ChatDetailsLeaveGroupBtnClicked")
	},
	[eventNamesModule.ChatDetailsLeaveGroupDialogRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsLeaveGroupDialogRenderedCounter", "ChatDetailsLeaveGroupDialogRendered")
	},
	[eventNamesModule.ChatDetailsLeaveGroupDialogStayClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsLeaveGroupDialogStayClickedCounter", "ChatDetailsLeaveGroupDialogStayClicked")
	},
	[eventNamesModule.ChatDetailsLeaveGroupDialogLeaveClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsLeaveGroupDialogLeaveClickedCounter", "ChatDetailsLeaveGroupDialogLeaveClicked")
	},
	[eventNamesModule.ChatDetailsReportUserClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsReportUserClickedCounter", "ChatDetailsReportUserClicked")
	},
	[eventNamesModule.ChatDetailsCreateUnfilteredChatCellRendered] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsCreateUnfilteredChatCellRenderedCounter", "ChatDetailsCreateUnfilteredChatCellRendered")
	},
	[eventNamesModule.ChatDetailsCreateUnfilteredChatCellClicked] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("ChatDetailsCreateUnfilteredChatCellClickedCounter", "ChatDetailsCreateUnfilteredChatCellClicked")
	}
}