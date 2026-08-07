local parent = script:FindFirstAncestor("AppChat").Parent
local localizationService = game:GetService("LocalizationService")
local dashModule = require(parent.Dash)
local enums = require(parent.SocialLuaAnalytics).Analytics.Enums
local eventTypes = enums.EventTypes
local contexts = enums.Contexts
local eventNamesModule = require(script.Parent.EventNames)

return {
	[eventNamesModule.AppChatVisible] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.AppChatVisible,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			isChatEnabled = dashModule.identity,
			isChatLoading = dashModule.identity,
			chatLandingListCount = dashModule.identity
		}
	},
	[eventNamesModule.AppChatClosed] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.AppChatClosed,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			isChatEnabled = dashModule.identity,
			isChatLoading = dashModule.identity,
			chatLandingListCount = dashModule.identity
		}
	},
	[eventNamesModule.ChatLandingScreenRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatLandingScreenRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { isChatEnabled = dashModule.identity }
	},
	[eventNamesModule.ChatLandingSearchBtnClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatLandingSearchBtnClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId }
	},
	[eventNamesModule.ChatLandingComposeBtnClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatLandingComposeBtnClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId }
	},
	[eventNamesModule.ChatLandingNotifBtnClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatLandingNotifBtnClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId }
	},
	[eventNamesModule.ChatLandingSnoozeBtnClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatLandingSnoozeBtnClicked,
		additionalInfo = {
			locale = localizationService.RobloxLocaleId,
			isChatNotificationsMuted = dashModule.identity
		}
	},
	[eventNamesModule.ChatLandingConversationClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatLandingConversationClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			isFiltered = dashModule.identity,
			conversationListCount = dashModule.identity,
			selectedConversationId = dashModule.identity,
			selectedIndex = dashModule.identity,
			hasUnreadMessages = dashModule.identity,
			selectedConversationModerationType = dashModule.identity,
			selectedConversationUserPendingStatus = dashModule.identity
		}
	},
	[eventNamesModule.ChatLandingGroupsBtnClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatLandingGroupsBtnClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {}
	},
	[eventNamesModule.ChatLandingPartyQuickStartButtonClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatLandingPartyQuickStartButtonClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			clickLocation = dashModule.identity,
			partyAttemptId = dashModule.identity,
			placeId = dashModule.identity,
			universeId = dashModule.identity
		}
	},
	[eventNamesModule.ChatLandingPvUpsellRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatLandingPvUpsellRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId }
	},
	[eventNamesModule.ChatLandingPvUpsellDismissed] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatLandingPvUpsellDismissed,
		additionalInfo = { locale = localizationService.RobloxLocaleId }
	},
	[eventNamesModule.ChatLandingPvUpsellContinueClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatLandingPvUpsellContinueClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId }
	},
	[eventNamesModule.ChatLandingPvUpsellSucceeded] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatLandingPvUpsellSucceeded,
		additionalInfo = { locale = localizationService.RobloxLocaleId }
	},
	[eventNamesModule.ChatLandingPvUpsellFailed] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatLandingPvUpsellFailed,
		additionalInfo = { locale = localizationService.RobloxLocaleId }
	},
	[eventNamesModule.ChatLandingUnfilteredThreadsFtuxRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatLandingUnfilteredThreadsFtuxRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId }
	},
	[eventNamesModule.ChatLandingUnfilteredThreadsFtuxDismissed] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatLandingUnfilteredThreadsFtuxDismissed,
		additionalInfo = { locale = localizationService.RobloxLocaleId }
	},
	[eventNamesModule.ChatLandingUnfilteredThreadsFtuxLearnMoreClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatLandingUnfilteredThreadsFtuxLearnMoreClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId }
	},
	[eventNamesModule.ConversationScreenRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationScreenRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			loadedMessageCount = dashModule.identity
		}
	},
	[eventNamesModule.ConversationSendBtnClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationSendBtnClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			sendBtnClickResult = require(script.Parent.Enums).SendButtonClickActionResult
		}
	},
	[eventNamesModule.ConversationScreenExit] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationScreenExit,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			conversationExitType = require(script.Parent.Enums).ConversationExitType
		}
	},
	[eventNamesModule.ConversationInfoBtnClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationInfoBtnClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.NewConversationCreated] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.NewConversationCreated,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			createConversationResult = dashModule.identity,
			participantsCount = dashModule.identity,
			createdReason = dashModule.identity
		}
	},
	[eventNamesModule.ChatMessagePressed] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatMessagePressed,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			targetMessageSenderId = dashModule.identity,
			targetMessageId = dashModule.identity,
			targetMessageSentAt = dashModule.identity,
			targetMessageLength = dashModule.identity
		}
	},
	[eventNamesModule.ChatMessageLongPressed] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatMessageLongPressed,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			targetMessageSenderId = dashModule.identity,
			targetMessageId = dashModule.identity,
			targetMessageSentAt = dashModule.identity,
			targetMessageLength = dashModule.identity
		}
	},
	[eventNamesModule.ChatMessageOpenMenuIconClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatMessageOpenMenuIconClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			targetMessageSenderId = dashModule.identity,
			targetMessageId = dashModule.identity,
			targetMessageSentAt = dashModule.identity,
			targetMessageLength = dashModule.identity
		}
	},
	[eventNamesModule.ChatMessageReplyIconClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatMessageReplyIconClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			targetMessageSenderId = dashModule.identity,
			targetMessageId = dashModule.identity,
			targetMessageSentAt = dashModule.identity,
			targetMessageLength = dashModule.identity
		}
	},
	[eventNamesModule.ChatMessageMenuOpened] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatMessageMenuOpened,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			targetMessageSenderId = dashModule.identity,
			targetMessageId = dashModule.identity,
			targetMessageSentAt = dashModule.identity,
			targetMessageLength = dashModule.identity
		}
	},
	[eventNamesModule.ChatMessageMenuReplyBtnActivated] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatMessageMenuReplyBtnActivated,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			targetMessageSenderId = dashModule.identity,
			targetMessageId = dashModule.identity,
			targetMessageSentAt = dashModule.identity,
			targetMessageLength = dashModule.identity
		}
	},
	[eventNamesModule.ChatMessageMenuCopyBtnActivated] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatMessageMenuCopyBtnActivated,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			targetMessageSenderId = dashModule.identity,
			targetMessageId = dashModule.identity,
			targetMessageSentAt = dashModule.identity,
			targetMessageLength = dashModule.identity
		}
	},
	[eventNamesModule.ChatInputBarReplyComposeRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatInputBarReplyComposeRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			targetMessageSenderId = dashModule.identity,
			targetMessageId = dashModule.identity,
			targetMessageSentAt = dashModule.identity,
			targetMessageLength = dashModule.identity
		}
	},
	[eventNamesModule.ChatInputBarReplyComposeCancelBtnActivated] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatInputBarReplyComposeCancelBtnActivated,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			targetMessageSenderId = dashModule.identity,
			targetMessageId = dashModule.identity,
			targetMessageSentAt = dashModule.identity,
			targetMessageLength = dashModule.identity
		}
	},
	[eventNamesModule.ChatDetailsRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatDetailsRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			participantsCount = dashModule.identity,
			isGroupOwner = dashModule.identity,
			isGroupConversation = dashModule.identity
		}
	},
	[eventNamesModule.ConversationMessageSent] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationMessageSent,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			messageSentResult = dashModule.identity,
			messageId = dashModule.identity,
			recipientIds = dashModule.identity,
			targetMessageId = dashModule.identity,
			targetMessageSenderId = dashModule.identity,
			targetMessageSentAt = dashModule.identity,
			targetMessageLength = dashModule.identity
		}
	},
	[eventNamesModule.ChatEmptyStateScreenRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatEmptyStateScreenRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			emptyStateType = require(script.Parent.Enums).EmptyStateType
		}
	},
	[eventNamesModule.ChatAddFriendsBtnClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatAddFriendsBtnClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {}
	},
	[eventNamesModule.ChatDetailsAddFriendsBtnClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatDetailsAddFriendsBtnClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			participantsCount = dashModule.identity,
			isGroupOwner = dashModule.identity,
			isGroupConversation = dashModule.identity
		}
	},
	[eventNamesModule.ChatDetailsLeaveGroupBtnClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatDetailsLeaveGroupBtnClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			participantsCount = dashModule.identity,
			isGroupOwner = dashModule.identity
		}
	},
	[eventNamesModule.ChatDetailsLeaveGroupDialogRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatDetailsLeaveGroupDialogRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ChatDetailsLeaveGroupDialogStayClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatDetailsLeaveGroupDialogStayClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ChatDetailsLeaveGroupDialogLeaveClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatDetailsLeaveGroupDialogLeaveClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			selectedConversationHasGroupUp = dashModule.identity
		}
	},
	[eventNamesModule.ChatDetailsReportUserClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatDetailsReportUserClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ChatDetailsCreateUnfilteredChatCellRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatDetailsCreateUnfilteredChatCellRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ChatDetailsCreateUnfilteredChatCellClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ChatDetailsCreateUnfilteredChatCellClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			participantsCount = dashModule.identity,
			isGroupOwner = dashModule.identity
		}
	},
	[eventNamesModule.ConversationPvUpsellRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationPvUpsellRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationPvUpsellLeftGroup] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationPvUpsellLeftGroup,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationPvUpsellContinueClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationPvUpsellContinueClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationPvUpsellSucceeded] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationPvUpsellSucceeded,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationPvUpsellFailed] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationPvUpsellFailed,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationIneligibleModalRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationIneligibleModalRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationIneligibleModalLeftGroup] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationIneligibleModalLeftGroup,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationIneligibleModalLearnMoreClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationIneligibleModalLearnMoreClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationPvBannerRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationPvBannerRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationPvBannerActionClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationPvBannerActionClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationUpgradeBannerRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationUpgradeBannerRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationUpgradeBannerActionClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationUpgradeBannerActionClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationLearnMoreBannerRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationLearnMoreBannerRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationLearnMoreBannerActionClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationLearnMoreBannerActionClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationPvDialogRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationPvDialogRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationPvDialogActionClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationPvDialogActionClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationPvDialogDismissed] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationPvDialogDismissed,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationPvDialogSucceeded] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationPvDialogSucceeded,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationPvDialogFailed] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationPvDialogFailed,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationUpgradeDialogRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationUpgradeDialogRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationUpgradeDialogActionClicked] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationUpgradeDialogActionClicked,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationUpgradeDialogDismissed] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationUpgradeDialogDismissed,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationLearnMoreDialogRendered] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationLearnMoreDialogRendered,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.ConversationLearnMoreDialogDismissed] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.ConversationLearnMoreDialogDismissed,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { conversationId = dashModule.identity }
	},
	[eventNamesModule.preloadSocialTabDataEvent] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.preloadSocialTabDataEvent,
		additionalInfo = { locale = localizationService.RobloxLocaleId },
		formatRulesForAdditionalInfo = { unreadConversationCount = dashModule.identity }
	},
	[eventNamesModule.preloadSocialTabDataFailedEvent] = {
		context = contexts.PlatformChat,
		eventType = eventTypes.preloadSocialTabDataFailedEvent,
		additionalInfo = { locale = localizationService.RobloxLocaleId }
	}
}