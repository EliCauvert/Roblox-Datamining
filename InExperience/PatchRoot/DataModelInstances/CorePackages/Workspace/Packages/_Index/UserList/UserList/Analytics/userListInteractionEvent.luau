local UserList = script:FindFirstAncestor("UserList")
local SocialLuaAnalyticsModule = require(UserList.Parent.SocialLuaAnalytics)
local _ = require(UserList.Common.Types)

return SocialLuaAnalyticsModule.Telemetry.new({
	name = "UserListInteraction",
	description = "A user interacted with a user-list row",
	lastUpdated = { 2026, 9, 14 },
	backendsList = {
		{
			type = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.EventIngest,
			standardizedFields = { "addSessionInfo", "addSessionId" },
			format = function(p1, _) --[[ Line: 49 ]]
				return p1
			end
		}
	}
})