local Parent = script:FindFirstAncestor("FriendsChat").Parent
local TelemetryModule = require(Parent.AppChat.Telemetry)
local DefaultTelemetryEventsModule = require(Parent.AppChat.DefaultTelemetryEvents)

return {
	AppChatVisible = TelemetryModule.new({
		name = "appChatVisible",
		description = "",
		lastUpdated = { 2026, 10, 7 },
		backendsList = {
			DefaultTelemetryEventsModule.namedCounterConfigurationAndFormat("AppChat.Navigation.Visible", function(p1)
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
		lastUpdated = { 2026, 7, 7 },
		backendsList = {
			DefaultTelemetryEventsModule.namedCounterConfigurationAndFormat("AppChat.Navigation.Closed", function(p1)
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
	})
}