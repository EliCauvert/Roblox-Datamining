local AppChat = script:FindFirstAncestor("AppChat")
local TelemetryModule = require(AppChat.Telemetry.Telemetry)
local _ = require(AppChat.Telemetry.Layers.ChatDetailsTelemetryLayer)
local _ = require(AppChat.Telemetry.Layers.ChatDialogTelemetryLayer)
local _ = require(AppChat.Parent.SocialLuaAnalytics)
local DefaultTelemetryEventsModule = require(AppChat.Telemetry.DefaultTelemetryEvents)
local NamedCounterConfigurationNoEmittedInfoFunction = DefaultTelemetryEventsModule.namedCounterConfigurationNoEmittedInfo
local NamedCounterConfigurationAndFormatFunction = DefaultTelemetryEventsModule.namedCounterConfigurationAndFormat
local EVENTINGESTNOEMITTEDINFO = DefaultTelemetryEventsModule.EVENT_INGEST_NO_EMITTED_INFO
local NamedCounterConfigurationNoEmittedInfoFunction1 = DefaultTelemetryEventsModule.namedCounterConfigurationNoEmittedInfo
local EVENTINGESTNOEMITTEDINFO1 = DefaultTelemetryEventsModule.EVENT_INGEST_NO_EMITTED_INFO

return {
	ScreenRendered = TelemetryModule.new({
		name = "chatDetailsRendered",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1) --[[ Line: 28 ]]
				return { isGroupConversation = p1.isGroupConversation }
			end),
			NamedCounterConfigurationAndFormatFunction("AppChat.ChatDetails.Rendered", function(p1) --[[ Line: 34 ]]
				return { isGroupConversation = p1.isGroupConversation }
			end)
		}
	}),
	ChatDetailsLeaveGroupBtnClicked = TelemetryModule.new({
		name = "chatDetailsLeaveGroupBtnClicked",
		description = "",
		lastUpdated = { 2025, 7, 14 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatDetails.Button.LeaveGroup"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	ChatDetailsCreateUnfilteredChatCellClicked = TelemetryModule.new({
		name = "chatDetailsCreateUnfilteredChatCellClicked",
		description = "",
		lastUpdated = { 2025, 7, 14 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatDetails.Button.CreateUnfilteredChat"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	ChatDetailsCreateUnfilteredChatCellRendered = TelemetryModule.new({
		name = "chatDetailsCreateUnfilteredChatCellRendered",
		description = "",
		lastUpdated = { 2025, 7, 14 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatDetails.CreateUnfilteredChatCell.Rendered"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	ChatDetailsAddFriendsBtnClicked = TelemetryModule.new({
		name = "chatDetailsAddFriendsBtnClicked",
		description = "",
		lastUpdated = { 2025, 7, 14 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction("AppChat.ChatDetails.Button.AddFriends"),
			EVENTINGESTNOEMITTEDINFO
		}
	}),
	LeaveGroupDialogRendered = TelemetryModule.new({
		name = "chatDetailsLeaveGroupDialogRendered",
		description = "",
		lastUpdated = { 2025, 7, 14 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction1("AppChat.Dialog.LeaveGroup.Rendered"),
			EVENTINGESTNOEMITTEDINFO1
		}
	}),
	LeaveGroupDialogLeaveClicked = TelemetryModule.new({
		name = "chatDetailsLeaveGroupDialogLeaveClicked",
		description = "",
		lastUpdated = { 2025, 7, 14 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction1("AppChat.Dialog.LeaveGroup.Button.Leave"),
			EVENTINGESTNOEMITTEDINFO1
		}
	}),
	LeaveGroupDialogStayClicked = TelemetryModule.new({
		name = "chatDetailsLeaveGroupDialogStayClicked",
		description = "",
		lastUpdated = { 2025, 7, 14 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction1("AppChat.Dialog.LeaveGroup.Button.Stay"),
			EVENTINGESTNOEMITTEDINFO1
		}
	}),
	ParticipantDialogReportUserClicked = TelemetryModule.new({
		name = "chatDetailsReportUserClicked",
		description = "",
		lastUpdated = { 2025, 7, 14 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction1("AppChat.Dialog.ParticipantDetails.Button.ReportUser"),
			EVENTINGESTNOEMITTEDINFO1
		}
	}),
	ParticipantDialogChatClicked = TelemetryModule.new({
		name = "chatDetailsParticipantDialogChatClicked",
		description = "",
		lastUpdated = { 2026, 4, 2 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction1("AppChat.Dialog.ParticipantDetails.Button.Chat"),
			EVENTINGESTNOEMITTEDINFO1
		}
	}),
	ParticipantDialogAddTrustedConnectionClicked = TelemetryModule.new({
		name = "chatDetailsParticipantDialogAddTrustedConnectionClicked",
		description = "",
		lastUpdated = { 2026, 4, 30 },
		backendsList = {
			DefaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1) --[[ Line: 130 ]]
				return { modalVariantOverride = p1.modalVariantOverride }
			end),
			NamedCounterConfigurationAndFormatFunction("AppChat.Dialog.ParticipantDetails.Button.AddTrustedConnection", function(p1) --[[ Line: 138 ]]
				return { modalVariantOverride = p1.modalVariantOverride }
			end)
		}
	}),
	ParticipantDialogAddIncomingTrustedConnectionClicked = TelemetryModule.new({
		name = "chatDetailsParticipantDialogAddIncomingTrustedConnectionClicked",
		description = "",
		lastUpdated = { 2026, 4, 30 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction1("AppChat.Dialog.ParticipantDetails.Button.AddIncomingTrustedConnection"),
			EVENTINGESTNOEMITTEDINFO1
		}
	}),
	ParticipantDialogRemoveTrustedConnectionClicked = TelemetryModule.new({
		name = "chatDetailsParticipantDialogRemoveTrustedConnectionClicked",
		description = "",
		lastUpdated = { 2026, 4, 30 },
		backendsList = {
			NamedCounterConfigurationNoEmittedInfoFunction1("AppChat.Dialog.ParticipantDetails.Button.RemoveTrustedConnection"),
			EVENTINGESTNOEMITTEDINFO1
		}
	})
}