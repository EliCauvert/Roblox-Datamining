local Parent = script:FindFirstAncestor("AppChat").Parent
local LocalizationService = game:GetService("LocalizationService")
local DashModule = require(Parent.Dash)
local Enums = require(Parent.SocialLuaAnalytics).Analytics.Enums
local EventTypes = Enums.EventTypes
local Contexts = Enums.Contexts
local EventNamesModule = require(script.Parent.EventNames)

return {
	[EventNamesModule.AppChatVisible] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.AppChatVisible,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			isChatEnabled = DashModule.identity,
			isChatLoading = DashModule.identity,
			chatLandingListCount = DashModule.identity
		}
	},
	[EventNamesModule.AppChatClosed] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.AppChatClosed,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			isChatEnabled = DashModule.identity,
			isChatLoading = DashModule.identity,
			chatLandingListCount = DashModule.identity
		}
	},
	[EventNamesModule.ChatLandingScreenRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatLandingScreenRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { isChatEnabled = DashModule.identity }
	},
	[EventNamesModule.ChatLandingSearchBtnClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatLandingSearchBtnClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId }
	},
	[EventNamesModule.ChatLandingComposeBtnClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatLandingComposeBtnClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId }
	},
	[EventNamesModule.ChatLandingNotifBtnClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatLandingNotifBtnClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId }
	},
	[EventNamesModule.ChatLandingSnoozeBtnClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatLandingSnoozeBtnClicked,
		additionalInfo = {
			locale = LocalizationService.RobloxLocaleId,
			isChatNotificationsMuted = DashModule.identity
		}
	},
	[EventNamesModule.ChatLandingConversationClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatLandingConversationClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			isFiltered = DashModule.identity,
			conversationListCount = DashModule.identity,
			selectedConversationId = DashModule.identity,
			selectedIndex = DashModule.identity,
			hasUnreadMessages = DashModule.identity,
			selectedConversationModerationType = DashModule.identity,
			selectedConversationUserPendingStatus = DashModule.identity
		}
	},
	[EventNamesModule.ChatLandingGroupsBtnClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatLandingGroupsBtnClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {}
	},
	[EventNamesModule.ChatLandingPartyQuickStartButtonClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatLandingPartyQuickStartButtonClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			clickLocation = DashModule.identity,
			partyAttemptId = DashModule.identity,
			placeId = DashModule.identity,
			universeId = DashModule.identity
		}
	},
	[EventNamesModule.ChatLandingPvUpsellRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatLandingPvUpsellRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId }
	},
	[EventNamesModule.ChatLandingPvUpsellDismissed] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatLandingPvUpsellDismissed,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId }
	},
	[EventNamesModule.ChatLandingPvUpsellContinueClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatLandingPvUpsellContinueClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId }
	},
	[EventNamesModule.ChatLandingPvUpsellSucceeded] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatLandingPvUpsellSucceeded,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId }
	},
	[EventNamesModule.ChatLandingPvUpsellFailed] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatLandingPvUpsellFailed,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId }
	},
	[EventNamesModule.ChatLandingUnfilteredThreadsFtuxRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatLandingUnfilteredThreadsFtuxRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId }
	},
	[EventNamesModule.ChatLandingUnfilteredThreadsFtuxDismissed] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatLandingUnfilteredThreadsFtuxDismissed,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId }
	},
	[EventNamesModule.ChatLandingUnfilteredThreadsFtuxLearnMoreClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatLandingUnfilteredThreadsFtuxLearnMoreClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId }
	},
	[EventNamesModule.ConversationScreenRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationScreenRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			loadedMessageCount = DashModule.identity
		}
	},
	[EventNamesModule.ConversationSendBtnClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationSendBtnClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			sendBtnClickResult = require(script.Parent.Enums).SendButtonClickActionResult
		}
	},
	[EventNamesModule.ConversationScreenExit] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationScreenExit,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			conversationExitType = require(script.Parent.Enums).ConversationExitType
		}
	},
	[EventNamesModule.ConversationInfoBtnClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationInfoBtnClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.NewConversationCreated] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.NewConversationCreated,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			createConversationResult = DashModule.identity,
			participantsCount = DashModule.identity,
			createdReason = DashModule.identity
		}
	},
	[EventNamesModule.ChatMessagePressed] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatMessagePressed,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			targetMessageSenderId = DashModule.identity,
			targetMessageId = DashModule.identity,
			targetMessageSentAt = DashModule.identity,
			targetMessageLength = DashModule.identity
		}
	},
	[EventNamesModule.ChatMessageLongPressed] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatMessageLongPressed,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			targetMessageSenderId = DashModule.identity,
			targetMessageId = DashModule.identity,
			targetMessageSentAt = DashModule.identity,
			targetMessageLength = DashModule.identity
		}
	},
	[EventNamesModule.ChatMessageOpenMenuIconClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatMessageOpenMenuIconClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			targetMessageSenderId = DashModule.identity,
			targetMessageId = DashModule.identity,
			targetMessageSentAt = DashModule.identity,
			targetMessageLength = DashModule.identity
		}
	},
	[EventNamesModule.ChatMessageReplyIconClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatMessageReplyIconClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			targetMessageSenderId = DashModule.identity,
			targetMessageId = DashModule.identity,
			targetMessageSentAt = DashModule.identity,
			targetMessageLength = DashModule.identity
		}
	},
	[EventNamesModule.ChatMessageMenuOpened] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatMessageMenuOpened,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			targetMessageSenderId = DashModule.identity,
			targetMessageId = DashModule.identity,
			targetMessageSentAt = DashModule.identity,
			targetMessageLength = DashModule.identity
		}
	},
	[EventNamesModule.ChatMessageMenuReplyBtnActivated] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatMessageMenuReplyBtnActivated,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			targetMessageSenderId = DashModule.identity,
			targetMessageId = DashModule.identity,
			targetMessageSentAt = DashModule.identity,
			targetMessageLength = DashModule.identity
		}
	},
	[EventNamesModule.ChatMessageMenuCopyBtnActivated] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatMessageMenuCopyBtnActivated,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			targetMessageSenderId = DashModule.identity,
			targetMessageId = DashModule.identity,
			targetMessageSentAt = DashModule.identity,
			targetMessageLength = DashModule.identity
		}
	},
	[EventNamesModule.ChatInputBarReplyComposeRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatInputBarReplyComposeRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			targetMessageSenderId = DashModule.identity,
			targetMessageId = DashModule.identity,
			targetMessageSentAt = DashModule.identity,
			targetMessageLength = DashModule.identity
		}
	},
	[EventNamesModule.ChatInputBarReplyComposeCancelBtnActivated] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatInputBarReplyComposeCancelBtnActivated,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			targetMessageSenderId = DashModule.identity,
			targetMessageId = DashModule.identity,
			targetMessageSentAt = DashModule.identity,
			targetMessageLength = DashModule.identity
		}
	},
	[EventNamesModule.ChatDetailsRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatDetailsRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			participantsCount = DashModule.identity,
			isGroupOwner = DashModule.identity,
			isGroupConversation = DashModule.identity
		}
	},
	[EventNamesModule.ConversationMessageSent] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationMessageSent,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			messageSentResult = DashModule.identity,
			messageId = DashModule.identity,
			recipientIds = DashModule.identity,
			targetMessageId = DashModule.identity,
			targetMessageSenderId = DashModule.identity,
			targetMessageSentAt = DashModule.identity,
			targetMessageLength = DashModule.identity
		}
	},
	[EventNamesModule.ChatEmptyStateScreenRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatEmptyStateScreenRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			emptyStateType = require(script.Parent.Enums).EmptyStateType
		}
	},
	[EventNamesModule.ChatAddFriendsBtnClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatAddFriendsBtnClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {}
	},
	[EventNamesModule.ChatDetailsAddFriendsBtnClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatDetailsAddFriendsBtnClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			participantsCount = DashModule.identity,
			isGroupOwner = DashModule.identity,
			isGroupConversation = DashModule.identity
		}
	},
	[EventNamesModule.ChatDetailsLeaveGroupBtnClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatDetailsLeaveGroupBtnClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			participantsCount = DashModule.identity,
			isGroupOwner = DashModule.identity
		}
	},
	[EventNamesModule.ChatDetailsLeaveGroupDialogRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatDetailsLeaveGroupDialogRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ChatDetailsLeaveGroupDialogStayClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatDetailsLeaveGroupDialogStayClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ChatDetailsLeaveGroupDialogLeaveClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatDetailsLeaveGroupDialogLeaveClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			selectedConversationHasGroupUp = DashModule.identity
		}
	},
	[EventNamesModule.ChatDetailsReportUserClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatDetailsReportUserClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ChatDetailsCreateUnfilteredChatCellRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatDetailsCreateUnfilteredChatCellRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ChatDetailsCreateUnfilteredChatCellClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ChatDetailsCreateUnfilteredChatCellClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			participantsCount = DashModule.identity,
			isGroupOwner = DashModule.identity
		}
	},
	[EventNamesModule.ConversationPvUpsellRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationPvUpsellRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationPvUpsellLeftGroup] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationPvUpsellLeftGroup,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationPvUpsellContinueClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationPvUpsellContinueClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationPvUpsellSucceeded] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationPvUpsellSucceeded,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationPvUpsellFailed] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationPvUpsellFailed,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationIneligibleModalRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationIneligibleModalRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationIneligibleModalLeftGroup] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationIneligibleModalLeftGroup,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationIneligibleModalLearnMoreClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationIneligibleModalLearnMoreClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationPvBannerRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationPvBannerRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationPvBannerActionClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationPvBannerActionClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationUpgradeBannerRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationUpgradeBannerRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationUpgradeBannerActionClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationUpgradeBannerActionClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationLearnMoreBannerRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationLearnMoreBannerRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationLearnMoreBannerActionClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationLearnMoreBannerActionClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationPvDialogRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationPvDialogRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationPvDialogActionClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationPvDialogActionClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationPvDialogDismissed] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationPvDialogDismissed,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationPvDialogSucceeded] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationPvDialogSucceeded,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationPvDialogFailed] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationPvDialogFailed,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationUpgradeDialogRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationUpgradeDialogRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationUpgradeDialogActionClicked] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationUpgradeDialogActionClicked,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationUpgradeDialogDismissed] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationUpgradeDialogDismissed,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationLearnMoreDialogRendered] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationLearnMoreDialogRendered,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.ConversationLearnMoreDialogDismissed] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.ConversationLearnMoreDialogDismissed,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = DashModule.identity }
	},
	[EventNamesModule.preloadSocialTabDataEvent] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.preloadSocialTabDataEvent,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { unreadConversationCount = DashModule.identity }
	},
	[EventNamesModule.preloadSocialTabDataFailedEvent] = {
		context = Contexts.PlatformChat,
		eventType = EventTypes.preloadSocialTabDataFailedEvent,
		additionalInfo = { locale = LocalizationService.RobloxLocaleId }
	}
}