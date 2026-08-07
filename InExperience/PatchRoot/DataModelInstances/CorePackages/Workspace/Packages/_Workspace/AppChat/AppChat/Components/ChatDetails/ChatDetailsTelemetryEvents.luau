local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local telemetryModule = require(appChat.Telemetry.Telemetry)
local _ = require(appChat.Telemetry.Layers.ChatDetailsTelemetryLayer)
local _ = require(appChat.Telemetry.Layers.ChatDialogTelemetryLayer)
local _ = require(parent.SocialLuaAnalytics)
local defaultTelemetryEventsModule = require(appChat.Telemetry.DefaultTelemetryEvents)
local namedCounterConfigurationNoEmittedInfo = defaultTelemetryEventsModule.namedCounterConfigurationNoEmittedInfo
local namedCounterConfigurationAndFormat = defaultTelemetryEventsModule.namedCounterConfigurationAndFormat
local EVENT_INGEST_NO_EMITTED_INFO = defaultTelemetryEventsModule.EVENT_INGEST_NO_EMITTED_INFO
local namedCounterConfigurationNoEmittedInfo_1 = defaultTelemetryEventsModule.namedCounterConfigurationNoEmittedInfo
local EVENT_INGEST_NO_EMITTED_INFO_1 = defaultTelemetryEventsModule.EVENT_INGEST_NO_EMITTED_INFO

return {
	ScreenRendered = telemetryModule.new({
		name = "chatDetailsRendered",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p0) --[[ line: 28 ]]
				return { isGroupConversation = p0.isGroupConversation }
			end),
			namedCounterConfigurationAndFormat("AppChat.ChatDetails.Rendered", function(p1) --[[ line: 34 ]]
				return { isGroupConversation = p1.isGroupConversation }
			end)
		}
	}),
	ChatDetailsLeaveGroupBtnClicked = telemetryModule.new({
		name = "chatDetailsLeaveGroupBtnClicked",
		description = "",
		lastUpdated = { 2025, 7, 14 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatDetails.Button.LeaveGroup"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ChatDetailsCreateUnfilteredChatCellClicked = telemetryModule.new({
		name = "chatDetailsCreateUnfilteredChatCellClicked",
		description = "",
		lastUpdated = { 2025, 7, 14 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatDetails.Button.CreateUnfilteredChat"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ChatDetailsCreateUnfilteredChatCellRendered = telemetryModule.new({
		name = "chatDetailsCreateUnfilteredChatCellRendered",
		description = "",
		lastUpdated = { 2025, 7, 14 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatDetails.CreateUnfilteredChatCell.Rendered"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	ChatDetailsAddFriendsBtnClicked = telemetryModule.new({
		name = "chatDetailsAddFriendsBtnClicked",
		description = "",
		lastUpdated = { 2025, 7, 14 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo("AppChat.ChatDetails.Button.AddFriends"),
			EVENT_INGEST_NO_EMITTED_INFO
		}
	}),
	LeaveGroupDialogRendered = telemetryModule.new({
		name = "chatDetailsLeaveGroupDialogRendered",
		description = "",
		lastUpdated = { 2025, 7, 14 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo_1("AppChat.Dialog.LeaveGroup.Rendered"),
			EVENT_INGEST_NO_EMITTED_INFO_1
		}
	}),
	LeaveGroupDialogLeaveClicked = telemetryModule.new({
		name = "chatDetailsLeaveGroupDialogLeaveClicked",
		description = "",
		lastUpdated = { 2025, 7, 14 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo_1("AppChat.Dialog.LeaveGroup.Button.Leave"),
			EVENT_INGEST_NO_EMITTED_INFO_1
		}
	}),
	LeaveGroupDialogStayClicked = telemetryModule.new({
		name = "chatDetailsLeaveGroupDialogStayClicked",
		description = "",
		lastUpdated = { 2025, 7, 14 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo_1("AppChat.Dialog.LeaveGroup.Button.Stay"),
			EVENT_INGEST_NO_EMITTED_INFO_1
		}
	}),
	ParticipantDialogReportUserClicked = telemetryModule.new({
		name = "chatDetailsReportUserClicked",
		description = "",
		lastUpdated = { 2025, 7, 14 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo_1("AppChat.Dialog.ParticipantDetails.Button.ReportUser"),
			EVENT_INGEST_NO_EMITTED_INFO_1
		}
	}),
	ParticipantDialogChatClicked = telemetryModule.new({
		name = "chatDetailsParticipantDialogChatClicked",
		description = "",
		lastUpdated = { 2026, 4, 2 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo_1("AppChat.Dialog.ParticipantDetails.Button.Chat"),
			EVENT_INGEST_NO_EMITTED_INFO_1
		}
	}),
	ParticipantDialogAddTrustedConnectionClicked = telemetryModule.new({
		name = "chatDetailsParticipantDialogAddTrustedConnectionClicked",
		description = "",
		lastUpdated = { 2026, 4, 30 },
		backendsList = {
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p2) --[[ line: 130 ]]
				return { modalVariantOverride = p2.modalVariantOverride }
			end),
			namedCounterConfigurationAndFormat("AppChat.Dialog.ParticipantDetails.Button.AddTrustedConnection", function(p3) --[[ line: 138 ]]
				return { modalVariantOverride = p3.modalVariantOverride }
			end)
		}
	}),
	ParticipantDialogAddIncomingTrustedConnectionClicked = telemetryModule.new({
		name = "chatDetailsParticipantDialogAddIncomingTrustedConnectionClicked",
		description = "",
		lastUpdated = { 2026, 4, 30 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo_1("AppChat.Dialog.ParticipantDetails.Button.AddIncomingTrustedConnection"),
			EVENT_INGEST_NO_EMITTED_INFO_1
		}
	}),
	ParticipantDialogRemoveTrustedConnectionClicked = telemetryModule.new({
		name = "chatDetailsParticipantDialogRemoveTrustedConnectionClicked",
		description = "",
		lastUpdated = { 2026, 4, 30 },
		backendsList = {
			namedCounterConfigurationNoEmittedInfo_1("AppChat.Dialog.ParticipantDetails.Button.RemoveTrustedConnection"),
			EVENT_INGEST_NO_EMITTED_INFO_1
		}
	})
}