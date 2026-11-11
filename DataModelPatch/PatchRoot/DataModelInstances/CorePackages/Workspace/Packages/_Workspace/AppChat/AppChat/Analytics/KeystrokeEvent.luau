return {
	eventName = "appChatKeyStrokes",
	throttlingPercentage = 10000,
	description = "Tracks keystroke data for the chat conversation screen",
	links = "https://docs.google.com/document/d/1CIP98uWhheThwiGBioCeXJ_WDmnym5D-zmUe5cNxOJ0/edit?tab=t.0#heading=h.q5oxzu9wbzz6",
	backends = {
		require(script:FindFirstAncestor("AppChat").Parent.LoggingProtocol).TelemetryBackends.EventIngest
	},
	lastUpdated = { 24, 5, 20 }
}