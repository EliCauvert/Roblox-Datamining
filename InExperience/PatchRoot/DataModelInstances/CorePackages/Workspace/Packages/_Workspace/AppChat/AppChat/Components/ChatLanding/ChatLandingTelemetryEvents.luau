local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local telemetryModule = require(appChat.Telemetry.Telemetry)
local _ = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local _ = require(parent.SocialLuaAnalytics)
local defaultTelemetryEventsModule = require(appChat.Telemetry.DefaultTelemetryEvents)
local namedCounterConfigurationNoEmittedInfo = defaultTelemetryEventsModule.namedCounterConfigurationNoEmittedInfo
local namedCounterConfigurationAndFormat = defaultTelemetryEventsModule.namedCounterConfigurationAndFormat
local namedStatConfigurationAndFormat = defaultTelemetryEventsModule.namedStatConfigurationAndFormat
local EVENT_INGEST_NO_EMITTED_INFO = defaultTelemetryEventsModule.EVENT_INGEST_NO_EMITTED_INFO

return {
	AppChatVisible = telemetryModule.new({
		name = "appChatVisible",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationAndFormat("AppChat.Navigation.Visible", function(p1)
				return {
					isChatEnabled = p1.isChatEnabled,
					isChatLoading = p1.isChatLoading
				}
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
				return {
					isChatEnabled = p1.isChatEnabled,
					isChatLoading = p1.isChatLoading
				}
			end)
		}
	}),
	AppChatClosed = telemetryModule.new({
		name = "appChatClosed",
		description = "",
		lastUpdated = { 2026, 2, 9 },
		backendsList = {
			namedCounterConfigurationAndFormat("AppChat.Navigation.Closed", function(p1)
				return {
					isChatEnabled = p1.isChatEnabled,
					isChatLoading = p1.isChatLoading
				}
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
				return {
					isChatEnabled = p1.isChatEnabled,
					isChatLoading = p1.isChatLoading
				}
			end)
		}
	}),
	ScreenRendered = telemetryModule.new({
		name = "chatLandingScreenRendered",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationAndFormat("AppChat.ChatLanding.Rendered", function(p1)
				return { isChatEnabled = p1.isChatEnabled }
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
				return { isChatEnabled = p1.isChatEnabled }
			end)
		}
	}),
	ChatEmptyStateScreenRendered = telemetryModule.new({
		name = "chatEmptyStateScreenRendered",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationAndFormat("AppChat.ChatLanding.EmptyState.Rendered", function(p1)
				return { emptyStateType = p1.emptyStateType }
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
				return { emptyStateType = p1.emptyStateType }
			end)
		}
	}),
	ChatAddFriendsBtnClicked = telemetryModule.new({
		name = "chatAddFriendsBtnClicked",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatLanding.Button.AddConnections"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ChatLandingSearchBtnClicked = telemetryModule.new({
		name = "chatLandingSearchBtnClicked",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatLanding.Button.Search"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ChatLandingComposeBtnClicked = telemetryModule.new({
		name = "chatLandingComposeBtnClicked",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatLanding.Button.Compose"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ChatLandingNotifBtnClicked = telemetryModule.new({
		name = "chatLandingNotifBtnClicked",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatLanding.Button.Notifications"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ChatLandingSnoozeBtnClicked = telemetryModule.new({
		name = "chatLandingSnoozeBtnClicked",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationAndFormat("AppChat.ChatLanding.Button.Snooze", function(p1)
				return { isChatNotificationsMuted = p1.isChatNotificationsMuted }
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
				return { isChatNotificationsMuted = p1.isChatNotificationsMuted }
			end)
		}
	}),
	ConversationCellRendered = telemetryModule.new({
		name = "chatLandingConversationCellRendered",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationAndFormat("AppChat.ChatLanding.ConversationCell.Rendered", function(p1)
				return {
					isFiltered = p1.isFiltered,
					hasUnreadMessages = p1.hasUnreadMessages,
					selectedConversationModerationType = p1.selectedConversationModerationType,
					selectedConversationUserPendingStatus = p1.selectedConversationUserPendingStatus,
					osaAcknowledgementStatus = p1.osaAcknowledgementStatus
				}
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
				return {
					isFiltered = p1.isFiltered,
					conversationListCount = p1.conversationListCount,
					selectedConversationId = p1.selectedConversationId,
					selectedIndex = p1.selectedIndex,
					hasUnreadMessages = p1.hasUnreadMessages,
					selectedConversationModerationType = p1.selectedConversationModerationType,
					selectedConversationUserPendingStatus = p1.selectedConversationUserPendingStatus,
					participantUserIds = p1.participantUserIds,
					osaAcknowledgementStatus = p1.osaAcknowledgementStatus
				}
			end)
		}
	}),
	ConversationCellRenderedIndexStat = telemetryModule.new({
		name = "chatLandingConversationCellRenderedIndexStat",
		description = "",
		lastUpdated = { 2026, 1, 30 },
		backendsList = {
			namedStatConfigurationAndFormat("chatLandingConversationCellRenderedIndexStat", function(_)
				return {}
			end)
		}
	}),
	ConversationClicked = telemetryModule.new({
		name = "chatLandingConversationClicked",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationAndFormat("AppChat.ChatLanding.Button.Conversation", function(p1)
				return {
					isFiltered = p1.isFiltered,
					hasUnreadMessages = p1.hasUnreadMessages,
					selectedConversationModerationType = p1.selectedConversationModerationType,
					selectedConversationUserPendingStatus = p1.selectedConversationUserPendingStatus,
					osaAcknowledgementStatus = p1.osaAcknowledgementStatus
				}
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
				return {
					isFiltered = p1.isFiltered,
					conversationListCount = p1.conversationListCount,
					selectedConversationId = p1.selectedConversationId,
					selectedIndex = p1.selectedIndex,
					hasUnreadMessages = p1.hasUnreadMessages,
					selectedConversationModerationType = p1.selectedConversationModerationType,
					selectedConversationUserPendingStatus = p1.selectedConversationUserPendingStatus,
					participantUserIds = p1.participantUserIds,
					osaAcknowledgementStatus = p1.osaAcknowledgementStatus,
					osaImpressionId = p1.osaImpressionId
				}
			end)
		}
	}),
	ConversationClickedIndexStat = telemetryModule.new({
		name = "chatLandingConversationClickedIndexStat",
		description = "",
		lastUpdated = { 2026, 1, 30 },
		backendsList = {
			namedStatConfigurationAndFormat("chatLandingConversationClickedIndexStat", function(_)
				return {}
			end)
		}
	}),
	ChatLandingGroupsBtnClicked = telemetryModule.new({
		name = "chatLandingGroupsBtnClicked",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatLanding.Button.Groups"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ChatLandingPvUpsellRendered = telemetryModule.new({
		name = "chatLandingPvUpsellRendered",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatLanding.PvUpsell.Rendered"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ChatLandingPvUpsellDismissed = telemetryModule.new({
		name = "chatLandingPvUpsellDismissed",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatLanding.PvUpsell.Dismissed"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ChatLandingPvUpsellContinueClicked = telemetryModule.new({
		name = "chatLandingPvUpsellContinueClicked",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatLanding.PvUpsell.Button.Continue"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ChatLandingPvUpsellSucceeded = telemetryModule.new({
		name = "chatLandingPvUpsellSucceeded",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatLanding.PvUpsell.Succeeded"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ChatLandingPvUpsellFailed = telemetryModule.new({
		name = "chatLandingPvUpsellFailed",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatLanding.PvUpsell.Failed"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ChatLandingUnfilteredThreadsFtuxRendered = telemetryModule.new({
		name = "chatLandingUnfilteredThreadsFtuxRendered",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatLanding.UnfilteredThreadsFtux.Rendered"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ChatLandingUnfilteredThreadsFtuxDismissed = telemetryModule.new({
		name = "chatLandingUnfilteredThreadsFtuxDismissed",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatLanding.UnfilteredThreadsFtux.Dismissed"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ChatLandingUnfilteredThreadsFtuxLearnMoreClicked = telemetryModule.new({
		name = "chatLandingUnfilteredThreadsFtuxLearnMoreClicked",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatLanding.UnfilteredThreadsFtux.Button.LearnMore"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	})
}