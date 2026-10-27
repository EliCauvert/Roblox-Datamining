local EventNamesModule = require(script.Parent.EventNames)
local DiagEventTypes = require(script:FindFirstAncestor("AppChat").Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes

return {
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
	}
}