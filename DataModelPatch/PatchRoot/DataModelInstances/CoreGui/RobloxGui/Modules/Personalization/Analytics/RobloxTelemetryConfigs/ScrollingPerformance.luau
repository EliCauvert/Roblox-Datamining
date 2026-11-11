return {
	eventName = "ScrollingPerformance",
	throttlingPercentage = 10000,
	description = "Reporting the scrolling performance of ScrollingFrames",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/2276295974/Scrolling+Performance+Tracker",
	backends = {
		require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).TelemetryBackends.Points
	},
	lastUpdated = { 23, 10, 18 }
}