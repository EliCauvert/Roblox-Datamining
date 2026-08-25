local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local telemetryModule = require(appChat.Telemetry.Telemetry)
local _ = require(appChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local _ = require(appChat.Analytics.Enums.ConversationActionType)
local _ = require(parent.SocialLuaAnalytics)
local defaultTelemetryEventsModule = require(appChat.Telemetry.DefaultTelemetryEvents)
local fFlagAppChatEnableMessageContextMenuModule = require(appChat.Flags.FFlagAppChatEnableMessageContextMenu)
local fFlagAppChatUseSwipeForRepliesModule = require(appChat.Flags.FFlagAppChatUseSwipeForReplies)
local namedCounterConfigurationNoEmittedInfo = defaultTelemetryEventsModule.namedCounterConfigurationNoEmittedInfo
local namedCounterConfigurationAndFormat = defaultTelemetryEventsModule.namedCounterConfigurationAndFormat

local function targetMessageFormatFunction()
	-- upvalues: defaultTelemetryEventsModule (ref)
	return defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p0)
		return {
			targetMessageId = p0.targetMessageId,
			targetMessageSenderId = p0.targetMessageSenderId,
			targetMessageSentAt = p0.targetMessageSentAt,
			targetMessageLength = p0.targetMessageLength,
			targetMessageVisibility = p0.targetMessageVisibility
		}
	end)
end

return {
	ScreenRendered = telemetryModule.new({
		name = "conversationScreenRendered",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatConversation.Rendered"),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
				return { loadedMessageCount = p1.loadedMessageCount }
			end)
		}
	}),
	ScreenExit = telemetryModule.new({
		name = "conversationScreenExit",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationAndFormat("AppChat.ChatConversation.Exit", function(p2)
				return { conversationExitType = p2.conversationExitType }
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p3)
				return { conversationExitType = p3.conversationExitType }
			end)
		}
	}),
	ConversationInfoBtnClicked = telemetryModule.new({
		name = "conversationInfoBtnClicked",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatConversation.Button.Info"),
			defaultTelemetryEventsModule.EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ConversationMessageSent = telemetryModule.new({
		name = "conversationMessageSent",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationAndFormat("AppChat.ChatConversation.Message.Sent", function(p4)
				return { messageSentResult = p4.messageSentResult }
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p5)
				return {
					messageSentResult = p5.messageSentResult,
					messageId = p5.messageId,
					recipientIds = p5.recipientIds,
					targetMessageId = p5.targetMessageId,
					targetMessageSenderId = p5.targetMessageSenderId,
					targetMessageSentAt = p5.targetMessageSentAt,
					targetMessageLength = p5.targetMessageLength
				}
			end)
		}
	}),
	ConversationMoreMenuBtnClicked = telemetryModule.new({
		name = "conversationMoreMenuBtnClicked",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationAndFormat("AppChat.ChatConversation.Button.MoreMenu", function(p6)
				return { action = p6.action }
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p7)
				return { action = p7.action }
			end)
		}
	}),
	ConversationSendBtnClicked = telemetryModule.new({
		name = "conversationSendBtnClicked",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationAndFormat("AppChat.ChatConversation.Button.Send", function(p8)
				return { sendBtnClickResult = p8.sendBtnClickResult }
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p9)
				return { sendBtnClickResult = p9.sendBtnClickResult }
			end)
		}
	}),
	ConversationMessagePressed = telemetryModule.new({
		name = "chatMessagePressed",
		description = "",
		lastUpdated = { 2025, 9, 9 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatConversation.Message.Pressed"),
			targetMessageFormatFunction()
		}
	}),
	ConversationMessageLongPressed = telemetryModule.new({
		name = "chatMessageLongPressed",
		description = "",
		lastUpdated = { 2025, 9, 9 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatConversation.Message.LongPressed"),
			targetMessageFormatFunction()
		}
	}),
	ConversationMessageSwiped = if fFlagAppChatUseSwipeForRepliesModule then telemetryModule.new({
		name = "chatMessageSwiped",
		description = "",
		lastUpdated = { 2025, 11, 25 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatConversation.Message.Swiped"),
			targetMessageFormatFunction()
		}
	}) else nil,
	ConversationMessageReplyIconImpression = telemetryModule.new({
		name = "chatMessageReplyIconImpression",
		description = "",
		lastUpdated = { 2025, 9, 9 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatConversation.Message.ReplyIcon.Impression"),
			targetMessageFormatFunction()
		}
	}),
	ConversationMessageReplyIconClicked = telemetryModule.new({
		name = "chatMessageReplyIconClicked",
		description = "",
		lastUpdated = { 2025, 9, 9 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatConversation.Message.ReplyIcon.Clicked"),
			targetMessageFormatFunction()
		}
	}),
	ConversationMessageOpenMenuIconClicked = if fFlagAppChatEnableMessageContextMenuModule then telemetryModule.new({
		name = "chatMessageOpenMenuIconClicked",
		description = "",
		lastUpdated = { 2025, 9, 9 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatConversation.Message.OpenMenuIcon.Clicked"),
			targetMessageFormatFunction()
		}
	}) else nil,
	ConversationInputBarReplyComposeRendered = telemetryModule.new({
		name = "chatInputBarReplyComposeRendered",
		description = "",
		lastUpdated = { 2025, 9, 17 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatConversation.ReplyComposeBar.Rendered"),
			targetMessageFormatFunction()
		}
	}),
	ConversationInputBarReplyComposeCancelBtnActivated = telemetryModule.new({
		name = "chatInputBarReplyComposeCancelBtnActivated",
		description = "",
		lastUpdated = { 2025, 9, 17 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatConversation.ReplyComposeBar.Button.Cancel"),
			targetMessageFormatFunction()
		}
	}),
	ConversationMessageFtuxTooltipImpression = telemetryModule.new({
		name = "chatMessageFtuxTooltipImpression",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationAndFormat("AppChat.ChatConversation.Message.FtuxTooltip.Impression", function(p10)
				return { tooltipVariant = p10.tooltipVariant }
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p11)
				return { tooltipVariant = p11.tooltipVariant }
			end)
		}
	}),
	ConversationMessageFtuxTooltipDismissed = telemetryModule.new({
		name = "chatMessageFtuxTooltipDismissed",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			namedCounterConfigurationAndFormat("AppChat.ChatConversation.Message.FtuxTooltip.Dismissed", function(p12)
				return { tooltipVariant = p12.tooltipVariant }
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p13)
				return { tooltipVariant = p13.tooltipVariant }
			end)
		}
	}),
	GameCardThumbnailClicked = telemetryModule.new({
		name = "gameCardThumbnailClicked",
		description = "",
		lastUpdated = { 2025, 11, 18 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatConversation.GameCard.Thumbnail.Clicked"),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p14)
				return { universeId = p14.universeId, placeId = p14.placeId }
			end)
		}
	}),
	GameCardPlayButtonClicked = telemetryModule.new({
		name = "gameCardPlayButtonClicked",
		description = "",
		lastUpdated = { 2025, 11, 18 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatConversation.GameCard.Button.Play"),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p15)
				return { universeId = p15.universeId, placeId = p15.placeId }
			end)
		}
	}),
	GameCardMetadataClicked = telemetryModule.new({
		name = "gameCardMetadataClicked",
		description = "",
		lastUpdated = { 2025, 11, 19 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatConversation.GameCard.Metadata.Clicked"),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p16)
				return { universeId = p16.universeId, placeId = p16.placeId }
			end)
		}
	})
}