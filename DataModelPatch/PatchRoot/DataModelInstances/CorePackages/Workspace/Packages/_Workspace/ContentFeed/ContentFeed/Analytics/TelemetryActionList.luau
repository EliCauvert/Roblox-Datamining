local SupportedTelemetryBackends = require(script.Parent.Parent.Parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends
local EventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("ContentFeedTelemetryThrottlingThousandths", 1000)
	},
	[EventNamesModule.ContentFeedCloseShortcutPressed] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContentFeedDeleteCtaPressed] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContentFeedExitCtaPressed] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContentFeedInspectCtaPressed] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContentFeedInspectItemPressed] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContentFeedImageLatency] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryStat }
		}
	},
	[EventNamesModule.ContentFeedImageLoadFailed] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContentFeedMoreMenuButtonPressed] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContentFeedPlayButtonPressed] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContentFeedPostViewed] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContentFeedReportCtaPressed] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContentFeedShareCtaPressed] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContentFeedVideoLatency] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryStat }
		}
	},
	[EventNamesModule.ContentFeedVideoLoadFailed] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	}
}