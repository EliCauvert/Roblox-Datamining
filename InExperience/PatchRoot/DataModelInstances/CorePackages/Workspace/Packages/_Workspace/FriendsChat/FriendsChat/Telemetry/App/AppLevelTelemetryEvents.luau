local parent = script:FindFirstAncestor("FriendsChat").Parent
local telemetryModule = require(parent.AppChat.Telemetry)
local defaultTelemetryEventsModule = require(parent.AppChat.DefaultTelemetryEvents)

return {
	AppChatVisible = telemetryModule.new({
		name = "appChatVisible",
		description = "",
		lastUpdated = { 2026, 7, 7 },
		backendsList = {
			defaultTelemetryEventsModule.namedCounterConfigurationAndFormat("AppChat.Navigation.Visible", function(p0) --[[ line: 27 ]]
				return { isChatEnabled = p0.isChatEnabled }
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p1) --[[ line: 33 ]]
				return { isChatEnabled = p1.isChatEnabled }
			end)
		}
	}),
	AppChatClosed = telemetryModule.new({
		name = "appChatClosed",
		description = "",
		lastUpdated = { 2026, 7, 7 },
		backendsList = {
			defaultTelemetryEventsModule.namedCounterConfigurationAndFormat("AppChat.Navigation.Closed", function(p2) --[[ line: 47 ]]
				return { isChatEnabled = p2.isChatEnabled }
			end),
			defaultTelemetryEventsModule.eventIngestWithFormatFunction(function(p3) --[[ line: 53 ]]
				return { isChatEnabled = p3.isChatEnabled }
			end)
		}
	})
}