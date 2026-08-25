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
			namedCounterConfigurationAndFormat("AppChat.Navigation.Visible", function(p0)
				return {
					isChatEnabled = p0.isChatEnabled,
					isChatLoading = p0.isChatLoading
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
			namedCounterConfigurationAndFormat("AppChat.Navigation.Closed", function(p2)
				return {
					isChatEnabled = p2.isChatEnabled,
					isChatLoading = p2.isChatLoading
				}
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p3)
				return {
					isChatEnabled = p3.isChatEnabled,
					isChatLoading = p3.isChatLoading
				}
			end)
		}
	}),
	ScreenRendered = telemetryModule.new({
		name = "chatLandingScreenRendered",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationAndFormat("AppChat.ChatLanding.Rendered", function(p4)
				return { isChatEnabled = p4.isChatEnabled }
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p5)
				return { isChatEnabled = p5.isChatEnabled }
			end)
		}
	}),
	ChatEmptyStateScreenRendered = telemetryModule.new({
		name = "chatEmptyStateScreenRendered",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationAndFormat("AppChat.ChatLanding.EmptyState.Rendered", function(p6)
				return { emptyStateType = p6.emptyStateType }
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p7)
				return { emptyStateType = p7.emptyStateType }
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
			namedCounterConfigurationAndFormat("AppChat.ChatLanding.Button.Snooze", function(p8)
				return { isChatNotificationsMuted = p8.isChatNotificationsMuted }
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p9)
				return { isChatNotificationsMuted = p9.isChatNotificationsMuted }
			end)
		}
	}),
	ConversationCellRendered = telemetryModule.new({
		name = "chatLandingConversationCellRendered",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationAndFormat("AppChat.ChatLanding.ConversationCell.Rendered", function(p10)
				return {
					isFiltered = p10.isFiltered,
					hasUnreadMessages = p10.hasUnreadMessages,
					selectedConversationModerationType = p10.selectedConversationModerationType,
					selectedConversationUserPendingStatus = p10.selectedConversationUserPendingStatus,
					osaAcknowledgementStatus = p10.osaAcknowledgementStatus
				}
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p11)
				return {
					isFiltered = p11.isFiltered,
					conversationListCount = p11.conversationListCount,
					selectedConversationId = p11.selectedConversationId,
					selectedIndex = p11.selectedIndex,
					hasUnreadMessages = p11.hasUnreadMessages,
					selectedConversationModerationType = p11.selectedConversationModerationType,
					selectedConversationUserPendingStatus = p11.selectedConversationUserPendingStatus,
					participantUserIds = p11.participantUserIds,
					osaAcknowledgementStatus = p11.osaAcknowledgementStatus
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
			namedCounterConfigurationAndFormat("AppChat.ChatLanding.Button.Conversation", function(p12)
				return {
					isFiltered = p12.isFiltered,
					hasUnreadMessages = p12.hasUnreadMessages,
					selectedConversationModerationType = p12.selectedConversationModerationType,
					selectedConversationUserPendingStatus = p12.selectedConversationUserPendingStatus,
					osaAcknowledgementStatus = p12.osaAcknowledgementStatus
				}
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p13)
				return {
					isFiltered = p13.isFiltered,
					conversationListCount = p13.conversationListCount,
					selectedConversationId = p13.selectedConversationId,
					selectedIndex = p13.selectedIndex,
					hasUnreadMessages = p13.hasUnreadMessages,
					selectedConversationModerationType = p13.selectedConversationModerationType,
					selectedConversationUserPendingStatus = p13.selectedConversationUserPendingStatus,
					participantUserIds = p13.participantUserIds,
					osaAcknowledgementStatus = p13.osaAcknowledgementStatus,
					osaImpressionId = p13.osaImpressionId
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