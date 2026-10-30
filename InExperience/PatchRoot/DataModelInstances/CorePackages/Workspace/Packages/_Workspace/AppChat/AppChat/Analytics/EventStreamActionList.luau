local Parent = script:FindFirstAncestor("AppChat").Parent
local LocalizationService = game:GetService("LocalizationService")
local DashModule = require(Parent.Dash)
local Enums = require(Parent.SocialLuaAnalytics).Analytics.Enums
local EventTypes = Enums.EventTypes
local Contexts = Enums.Contexts
local EventNamesModule = require(script.Parent.EventNames)

return {
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