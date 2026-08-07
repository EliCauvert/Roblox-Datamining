local loggingProtocolModule = require(script:FindFirstAncestor("PageLoadTracker").Parent.LoggingProtocol)

return {
	IDLE_TIMEOUT_SECONDS = 1,
	PAGE_LOAD_SUMMARY_CONFIG = {
		eventName = "app_page_load_time",
		throttlingPercentage = 10000,
		description = "Page load completion events with automatic idle detection",
		links = "",
		backends = {
			loggingProtocolModule.TelemetryBackends.Points,
			loggingProtocolModule.TelemetryBackends.EventIngest
		},
		lastUpdated = { 25, 6, 18 }
	},
	VISUAL_DEBUG = {
		HIGHLIGHT_DURATION = 1,
		FADE_DURATION = 2,
		HIGHLIGHT_COLOR = nil,
		MIN_BORDER_SIZE = 2,
		TRANSPARENCY_REDUCTION = 0.3,
		BORDER_COLOR = Color3.fromRGB(255, 0, 0),
		END_COLOR = Color3.fromRGB(200, 200, 200)
	},
	SCREEN_BOUNDS = {
		DEFAULT_TOP_BAR_HEIGHT = 0,
		MIN_VISIBILITY_RATIO = 0.5,
		DEFAULT_SCREEN_SIZE = Vector2.new(1000, 1000)
	}
}