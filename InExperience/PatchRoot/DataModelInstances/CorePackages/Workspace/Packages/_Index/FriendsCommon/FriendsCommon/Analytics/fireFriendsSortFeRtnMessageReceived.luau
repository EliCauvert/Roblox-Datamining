local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("FriendsCommon").Parent
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local var2 = socialLuaAnalyticsModule.Telemetry.createEmitter({
	telemetryImpl = require(parent.LoggingProtocol).default,
	defaultTelemetryConfig = {
		links = "https://docs.google.com/document/d/1uRCdl8pEuiW9wDiOTL39JPMGLhgxtpvVgiXovE8Xof4",
		throttlingThousandths = game:DefineFastInt("FriendsCommonAnalyticsThrottlingThousandths", 10000)
	},
	getSharedInfo = function()
		return {}
	end
})
local var3 = socialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeRtnMessage",
	description = "User received an rtn message v2",
	lastUpdated = { 2026, 6, 18 },
	backendsList = {
		{
			type = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.EventIngest,
			format = function(p0, _)
				return p0
			end
		}
	}
})

return function(p1, p2)
	-- upvalues: var2 (ref), var3 (ref), playersService (ref)
	if p1 == nil or not p2 then
		return
	end
	pcall(function()
		-- upvalues: p2 (ref), var2 (copy), var3 (copy), p1 (ref), playersService (copy)
		local t = {}
		
		for i, v in pairs(p2) do
			table.insert(t, tostring(v.userId))
		end
		var2.emit(var3, {
			sortType = "Carousel",
			messageId = p1,
			userId = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil,
			friendIds = table.concat(t, ",")
		})
	end)
end