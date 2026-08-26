local parent = script:FindFirstAncestor("FriendsChat").Parent
local telemetryModule = require(parent.AppChat.Telemetry)
local defaultTelemetryEventsModule = require(parent.AppChat.DefaultTelemetryEvents)

return {
	AppChatVisible = telemetryModule.new({
		name = "appChatVisible",
		description = "",
		lastUpdated = { 2026, 7, 7 },
		backendsList = {
			defaultTelemetryEventsModule.namedCounterConfigurationAndFormat("AppChat.Navigation.Visible", function(p1)
				return { isChatEnabled = p1.isChatEnabled }
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
				return { isChatEnabled = p1.isChatEnabled }
			end)
		}
	}),
	AppChatClosed = telemetryModule.new({
		name = "appChatClosed",
		description = "",
		lastUpdated = { 2026, 7, 7 },
		backendsList = {
			defaultTelemetryEventsModule.namedCounterConfigurationAndFormat("AppChat.Navigation.Closed", function(p1)
				return { isChatEnabled = p1.isChatEnabled }
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1)
				return { isChatEnabled = p1.isChatEnabled }
			end)
		}
	})
}