local AppChat = script:FindFirstAncestor("AppChat")
local TelemetryModule = require(AppChat.Telemetry.Telemetry)
local _ = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local _ = require(AppChat.Analytics.Enums.ConversationActionType)
local _ = require(AppChat.Parent.SocialLuaAnalytics)
local DefaultTelemetryEventsModule = require(AppChat.Telemetry.DefaultTelemetryEvents)
local FFlagAppChatEnableMessageContextMenuModule = require(AppChat.Flags.FFlagAppChatEnableMessageContextMenu)
local NamedCounterConfigurationNoEmittedInfoFunction = DefaultTelemetryEventsModule.namedCounterConfigurationNoEmittedInfo
local NamedCounterConfigurationAndFormatFunction = DefaultTelemetryEventsModule.namedCounterConfigurationAndFormat

local function targetMessageFormatFunction() --[[ Line: 22 ]]
	-- upvalues: DefaultTelemetryEventsModule (copy)
	return DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1) --[[ Line: 23 ]]
		return {
			targetMessageId = p1.targetMessageId,
			targetMessageSenderId = p1.targetMessageSenderId,
			targetMessageSentAt = p1.targetMessageSentAt,
			targetMessageLength = p1.targetMessageLength,
			targetMessageVisibility = p1.targetMessageVisibility
		}
	end)
end

return {
	ScreenRendered = TelemetryModule.new({
		name = "conversationScreenRendered",
		description = "",
		lastUpdated = { 2025, 7, 31 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatConversation.Rendered"),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1) --[[ Line: 47 ]]
				return { loadedMessageCount = p1.loadedMessageCount }
			end)
		}
	}),
	ScreenExit = TelemetryModule.new({
		name = "conversationScreenExit",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			NamedCounterConfigurationAndFormatFunction("AppChat.ChatConversation.Exit", function(p1) --[[ Line: 59 ]]
				return { conversationExitType = p1.conversationExitType }
			end),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1) --[[ Line: 67 ]]
				return { conversationExitType = p1.conversationExitType }
			end)
		}
	}),
	ConversationInfoBtnClicked = TelemetryModule.new({
		name = "conversationInfoBtnClicked",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatConversation.Button.Info"),
			DefaultTelemetryEventsModule.EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ConversationMessageSent = TelemetryModule.new({
		name = "conversationMessageSent",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			NamedCounterConfigurationAndFormatFunction("AppChat.ChatConversation.Message.Sent", function(p1) --[[ Line: 89 ]]
				return { messageSentResult = p1.messageSentResult }
			end),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1) --[[ Line: 102 ]]
				return {
					messageSentResult = p1.messageSentResult,
					messageId = p1.messageId,
					recipientIds = p1.recipientIds,
					targetMessageId = p1.targetMessageId,
					targetMessageSenderId = p1.targetMessageSenderId,
					targetMessageSentAt = p1.targetMessageSentAt,
					targetMessageLength = p1.targetMessageLength
				}
			end)
		}
	}),
	ConversationMoreMenuBtnClicked = TelemetryModule.new({
		name = "conversationMoreMenuBtnClicked",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			NamedCounterConfigurationAndFormatFunction("AppChat.ChatConversation.Button.MoreMenu", function(p1) --[[ Line: 128 ]]
				return { action = p1.action }
			end),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1) --[[ Line: 136 ]]
				return { action = p1.action }
			end)
		}
	}),
	ConversationSendBtnClicked = TelemetryModule.new({
		name = "conversationSendBtnClicked",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			NamedCounterConfigurationAndFormatFunction("AppChat.ChatConversation.Button.Send", function(p1) --[[ Line: 149 ]]
				return { sendBtnClickResult = p1.sendBtnClickResult }
			end),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1) --[[ Line: 156 ]]
				return { sendBtnClickResult = p1.sendBtnClickResult }
			end)
		}
	}),
	ConversationMessagePressed = TelemetryModule.new({
		name = "chatMessagePressed",
		description = "",
		lastUpdated = { 2025, 9, 9 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatConversation.Message.Pressed"),
			targetMessageFormatFunction()
		}
	}),
	ConversationMessageLongPressed = TelemetryModule.new({
		name = "chatMessageLongPressed",
		description = "",
		lastUpdated = { 2025, 9, 9 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatConversation.Message.LongPressed"),
			targetMessageFormatFunction()
		}
	}),
	ConversationMessageSwiped = TelemetryModule.new({
		name = "chatMessageSwiped",
		description = "",
		lastUpdated = { 2025, 11, 25 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatConversation.Message.Swiped"),
			targetMessageFormatFunction()
		}
	}),
	ConversationMessageReplyIconImpression = TelemetryModule.new({
		name = "chatMessageReplyIconImpression",
		description = "",
		lastUpdated = { 2025, 9, 9 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatConversation.Message.ReplyIcon.Impression"),
			targetMessageFormatFunction()
		}
	}),
	ConversationMessageReplyIconClicked = TelemetryModule.new({
		name = "chatMessageReplyIconClicked",
		description = "",
		lastUpdated = { 2025, 9, 9 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatConversation.Message.ReplyIcon.Clicked"),
			targetMessageFormatFunction()
		}
	}),
	ConversationMessageOpenMenuIconClicked = if FFlagAppChatEnableMessageContextMenuModule then TelemetryModule.new({
		name = "chatMessageOpenMenuIconClicked",
		description = "",
		lastUpdated = { 2025, 9, 9 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatConversation.Message.OpenMenuIcon.Clicked"),
			targetMessageFormatFunction()
		}
	}) else nil,
	ConversationInputBarReplyComposeRendered = TelemetryModule.new({
		name = "chatInputBarReplyComposeRendered",
		description = "",
		lastUpdated = { 2025, 9, 17 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatConversation.ReplyComposeBar.Rendered"),
			targetMessageFormatFunction()
		}
	}),
	ConversationInputBarReplyComposeCancelBtnActivated = TelemetryModule.new({
		name = "chatInputBarReplyComposeCancelBtnActivated",
		description = "",
		lastUpdated = { 2025, 9, 17 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatConversation.ReplyComposeBar.Button.Cancel"),
			targetMessageFormatFunction()
		}
	}),
	ConversationMessageFtuxTooltipImpression = TelemetryModule.new({
		name = "chatMessageFtuxTooltipImpression",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			NamedCounterConfigurationAndFormatFunction("AppChat.ChatConversation.Message.FtuxTooltip.Impression", function(p1) --[[ Line: 244 ]]
				return { tooltipVariant = p1.tooltipVariant }
			end),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1) --[[ Line: 252 ]]
				return { tooltipVariant = p1.tooltipVariant }
			end)
		}
	}),
	ConversationMessageFtuxTooltipDismissed = TelemetryModule.new({
		name = "chatMessageFtuxTooltipDismissed",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			NamedCounterConfigurationAndFormatFunction("AppChat.ChatConversation.Message.FtuxTooltip.Dismissed", function(p1) --[[ Line: 268 ]]
				return { tooltipVariant = p1.tooltipVariant }
			end),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1) --[[ Line: 276 ]]
				return { tooltipVariant = p1.tooltipVariant }
			end)
		}
	}),
	GameCardThumbnailClicked = TelemetryModule.new({
		name = "gameCardThumbnailClicked",
		description = "",
		lastUpdated = { 2025, 11, 18 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatConversation.GameCard.Thumbnail.Clicked"),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1) --[[ Line: 291 ]]
				return { universeId = p1.universeId, placeId = p1.placeId }
			end)
		}
	}),
	GameCardPlayButtonClicked = TelemetryModule.new({
		name = "gameCardPlayButtonClicked",
		description = "",
		lastUpdated = { 2025, 11, 18 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatConversation.GameCard.Button.Play"),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1) --[[ Line: 308 ]]
				return { universeId = p1.universeId, placeId = p1.placeId }
			end)
		}
	}),
	GameCardMetadataClicked = TelemetryModule.new({
		name = "gameCardMetadataClicked",
		description = "",
		lastUpdated = { 2025, 11, 19 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatConversation.GameCard.Metadata.Clicked"),
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1) --[[ Line: 325 ]]
				return { universeId = p1.universeId, placeId = p1.placeId }
			end)
		}
	})
}