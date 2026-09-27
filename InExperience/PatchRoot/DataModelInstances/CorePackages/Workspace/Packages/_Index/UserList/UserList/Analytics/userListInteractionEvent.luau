local userList = script:FindFirstAncestor("UserList")
local socialLuaAnalyticsModule = require(userList.Parent.SocialLuaAnalytics)
local _ = require(userList.Common.Types)

return socialLuaAnalyticsModule.Telemetry.new({
	name = "UserListInteraction",
	description = "A user interacted with a user-list row",
	lastUpdated = { 2026, 9, 14 },
	backendsList = {
		{
			type = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.EventIngest,
			standardizedFields = { "addSessionInfo", "addSessionId" },
			format = function(p1, _)
				return p1
			end
		}
	}
})