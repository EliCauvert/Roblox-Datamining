local AppChat = script:FindFirstAncestor("AppChat")
local TelemetryModule = require(AppChat.Telemetry.Telemetry)
local _ = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local _ = require(AppChat.Parent.SocialLuaAnalytics)
local DefaultTelemetryEventsModule = require(AppChat.Telemetry.DefaultTelemetryEvents)
local NamedCounterConfigurationNoEmittedInfoFunction = DefaultTelemetryEventsModule.namedCounterConfigurationNoEmittedInfo
local NamedCounterConfigurationAndFormatFunction = DefaultTelemetryEventsModule.namedCounterConfigurationAndFormat
local NamedStatConfigurationAndFormatFunction = DefaultTelemetryEventsModule.namedStatConfigurationAndFormat
local EVENTINGESTNOEMITTEDINFO = DefaultTelemetryEventsModule.EVENT_INGEST_NO_EMITTED_INFO

return {
	AppChatVisible = TelemetryModule.new({
		name = "appChatVisible",
		description = "",
		lastUpdated = { 2026, 10, 7 },
		backendsList = {
			NamedCounterConfigurationAndFormatFunction("AppChat.Navigation.Visible", function(p1)
				return {
					isChatEnabled = p1.isChatEnabled,
					isChatLoading = p1.isChatLoading,
					isInConversation = p1.isInConversation
				}
			end),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
				return {
					isChatEnabled = p1.isChatEnabled,
					isChatLoading = p1.isChatLoading
				}
			end)
		}
	}),
	AppChatClosed = TelemetryModule.new({
		name = "appChatClosed",
		description = "",
		lastUpdated = { 2026, 2, 9 },
		backendsList = {
			NamedCounterConfigurationAndFormatFunction("AppChat.Navigation.Closed", function(p1)
				return {
					isChatEnabled = p1.isChatEnabled,
					isChatLoading = p1.isChatLoading
				}
			end),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
				return {
					isChatEnabled = p1.isChatEnabled,
					isChatLoading = p1.isChatLoading
				}
			end)
		}
	}),
	ScreenRendered = TelemetryModule.new({
		name = "chatLandingScreenRendered",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			NamedCounterConfigurationAndFormatFunction("AppChat.ChatLanding.Rendered", function(p1)
				return { isChatEnabled = p1.isChatEnabled }
			end),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
				return { isChatEnabled = p1.isChatEnabled }
			end)
		}
	}),
	ChatEmptyStateScreenRendered = TelemetryModule.new({
		name = "chatEmptyStateScreenRendered",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			NamedCounterConfigurationAndFormatFunction("AppChat.ChatLanding.EmptyState.Rendered", function(p1)
				return { emptyStateType = p1.emptyStateType }
			end),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
				return { emptyStateType = p1.emptyStateType }
			end)
		}
	}),
	ChatAddFriendsBtnClicked = TelemetryModule.new({
		name = "chatAddFriendsBtnClicked",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatLanding.Button.AddConnections"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	ChatLandingSearchBtnClicked = TelemetryModule.new({
		name = "chatLandingSearchBtnClicked",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatLanding.Button.Search"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	ChatLandingComposeBtnClicked = TelemetryModule.new({
		name = "chatLandingComposeBtnClicked",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatLanding.Button.Compose"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	ChatLandingNotifBtnClicked = TelemetryModule.new({
		name = "chatLandingNotifBtnClicked",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatLanding.Button.Notifications"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	ChatLandingSnoozeBtnClicked = TelemetryModule.new({
		name = "chatLandingSnoozeBtnClicked",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			NamedCounterConfigurationAndFormatFunction("AppChat.ChatLanding.Button.Snooze", function(p1)
				return { isChatNotificationsMuted = p1.isChatNotificationsMuted }
			end),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
				return { isChatNotificationsMuted = p1.isChatNotificationsMuted }
			end)
		}
	}),
	ConversationCellRendered = TelemetryModule.new({
		name = "chatLandingConversationCellRendered",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			NamedCounterConfigurationAndFormatFunction("AppChat.ChatLanding.ConversationCell.Rendered", function(p1)
				return {
					isFiltered = p1.isFiltered,
					hasUnreadMessages = p1.hasUnreadMessages,
					selectedConversationModerationType = p1.selectedConversationModerationType,
					selectedConversationUserPendingStatus = p1.selectedConversationUserPendingStatus,
					osaAcknowledgementStatus = p1.osaAcknowledgementStatus
				}
			end),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
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
	ConversationCellRenderedIndexStat = TelemetryModule.new({
		name = "chatLandingConversationCellRenderedIndexStat",
		description = "",
		lastUpdated = { 2026, 1, 30 },
		backendsList = {
			NamedStatConfigurationAndFormatFunction("chatLandingConversationCellRenderedIndexStat", function(_)
				return {}
			end)
		}
	}),
	ConversationClicked = TelemetryModule.new({
		name = "chatLandingConversationClicked",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			NamedCounterConfigurationAndFormatFunction("AppChat.ChatLanding.Button.Conversation", function(p1)
				return {
					isFiltered = p1.isFiltered,
					hasUnreadMessages = p1.hasUnreadMessages,
					selectedConversationModerationType = p1.selectedConversationModerationType,
					selectedConversationUserPendingStatus = p1.selectedConversationUserPendingStatus,
					osaAcknowledgementStatus = p1.osaAcknowledgementStatus
				}
			end),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
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
	ConversationClickedIndexStat = TelemetryModule.new({
		name = "chatLandingConversationClickedIndexStat",
		description = "",
		lastUpdated = { 2026, 1, 30 },
		backendsList = {
			NamedStatConfigurationAndFormatFunction("chatLandingConversationClickedIndexStat", function(_)
				return {}
			end)
		}
	}),
	SearchStarted = TelemetryModule.new({
		name = "chatLandingSearchStarted",
		description = "A search session opened on the chat landing list. Once per session, on both the client-filter and backend-search paths.",
		lastUpdated = { 2026, 9, 21 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatLanding.Search.Started"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	SearchResultsRendered = TelemetryModule.new({
		name = "chatLandingSearchResultsRendered",
		description = "A search query settled. Once per query, with the result count and outcome, which the cell events cannot express when zero cells render.",
		lastUpdated = { 2026, 9, 21 },
		backendsList = {
			NamedCounterConfigurationAndFormatFunction("AppChat.ChatLanding.Search.ResultsRendered", function(p1)
				return { searchResultType = p1.searchResultType }
			end),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
				return {
					searchResultCount = p1.searchResultCount,
					searchResultType = p1.searchResultType,
					searchLatencyMs = p1.searchLatencyMs
				}
			end)
		}
	}),
	ChatLandingGroupsBtnClicked = TelemetryModule.new({
		name = "chatLandingGroupsBtnClicked",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatLanding.Button.Groups"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	ChatLandingPvUpsellRendered = TelemetryModule.new({
		name = "chatLandingPvUpsellRendered",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatLanding.PvUpsell.Rendered"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	ChatLandingPvUpsellDismissed = TelemetryModule.new({
		name = "chatLandingPvUpsellDismissed",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatLanding.PvUpsell.Dismissed"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	ChatLandingPvUpsellContinueClicked = TelemetryModule.new({
		name = "chatLandingPvUpsellContinueClicked",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatLanding.PvUpsell.Button.Continue"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	ChatLandingPvUpsellSucceeded = TelemetryModule.new({
		name = "chatLandingPvUpsellSucceeded",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatLanding.PvUpsell.Succeeded"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	ChatLandingPvUpsellFailed = TelemetryModule.new({
		name = "chatLandingPvUpsellFailed",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatLanding.PvUpsell.Failed"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	ChatLandingUnfilteredThreadsFtuxRendered = TelemetryModule.new({
		name = "chatLandingUnfilteredThreadsFtuxRendered",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatLanding.UnfilteredThreadsFtux.Rendered"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	ChatLandingUnfilteredThreadsFtuxDismissed = TelemetryModule.new({
		name = "chatLandingUnfilteredThreadsFtuxDismissed",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatLanding.UnfilteredThreadsFtux.Dismissed"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	ChatLandingUnfilteredThreadsFtuxLearnMoreClicked = TelemetryModule.new({
		name = "chatLandingUnfilteredThreadsFtuxLearnMoreClicked",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatLanding.UnfilteredThreadsFtux.Button.LearnMore"),
			EVENTINGESTNOEMITTEDINFO
		}
	})
}