local parent = script:FindFirstAncestor("UserList").Parent

return require(parent.SocialLuaAnalytics).Telemetry.createEmitter({
	telemetryImpl = require(parent.LoggingProtocol).default,
	defaultTelemetryConfig = {
		links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/user_list_interactions.proto",
		throttlingThousandths = game:DefineFastInt("UserListAnalyticsThrottlingThousandths", 10000)
	},
	getSharedInfo = function()
		return {}
	end
})