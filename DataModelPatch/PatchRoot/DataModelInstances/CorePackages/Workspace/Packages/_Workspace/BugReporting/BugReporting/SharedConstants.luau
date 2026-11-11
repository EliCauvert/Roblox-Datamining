local InfoNames = require(script:FindFirstAncestor("BugReporting").Parent.SystemInfoProtocol).SystemInfoProtocol.InfoNames

return {
	ISSUE_CHANNEL = "internal-in-app",
	SCREENSHOT_BUCKET = "InternalInAppBugReporting",
	SCREENSHOT_URN_PREFIX = "urn:roblox:moderationscreenshot:InternalInAppBugReporting",
	SCREEN_SUMMARY_KEY = "screen",
	DEVICE_SUMMARY_ORDERED_KEYS = {
		InfoNames.APP_VERSION,
		InfoNames.DEVICE_NAME,
		InfoNames.SYSTEM_VERSION,
		"screen"
	}
}