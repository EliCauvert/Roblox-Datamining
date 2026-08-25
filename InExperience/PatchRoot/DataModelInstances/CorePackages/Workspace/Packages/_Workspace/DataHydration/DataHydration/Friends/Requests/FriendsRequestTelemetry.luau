local parent = script:FindFirstAncestor("DataHydration").Parent
local httpService = game:GetService("HttpService")
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local supportedTelemetryBackends = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
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
	name = "FriendsSortFeFindFriendsResponse",
	description = "User making a request to /FindFriends",
	lastUpdated = { 2026, 6, 18 },
	backendsList = {
		{
			type = supportedTelemetryBackends.EventIngest,
			format = function(p0, _)
				return p0
			end
		}
	}
})
local var4 = socialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeGetAllOnlineFriendsResponse",
	description = "User making a request to /GetAllOnlineFriends",
	lastUpdated = { 2026, 6, 18 },
	backendsList = {
		{
			type = supportedTelemetryBackends.EventIngest,
			format = function(p1, _)
				return p1
			end
		}
	}
})

local function _(p2, p3)
	-- upvalues: var2 (ref)
	pcall(function()
		-- upvalues: var2 (copy), p2 (ref), p3 (ref)
		var2.emit(p2, p3)
	end)
end

return {
	generateRequestId = function()
		-- upvalues: httpService (ref)
		return string.format("friends-sort-%s", httpService:GenerateGUID(false))
	end,
	getRequestOptions = function(p4)
		return if p4 == nil then nil else { headers = { ["friends-sort"] = p4 } }
	end,
	emitFindFriendsResponse = function(p5, p6)
		-- upvalues: var3 (ref), var2 (ref)
		local t = {
			sortType = "FriendScore",
			requestId = p5,
			friendIds = table.concat(p6, ",")
		}
		pcall(function()
			-- upvalues: var2 (copy), var3 (ref), t (ref)
			var2.emit(var3, t)
		end)
	end,
	emitGetAllOnlineFriendsResponse = function(p7, p8)
		-- upvalues: var4 (ref), var2 (ref)
		local t = {
			sortType = "Carousel",
			requestId = p7,
			friendIds = table.concat(p8, ",")
		}
		pcall(function()
			-- upvalues: var2 (copy), var4 (ref), t (ref)
			var2.emit(var4, t)
		end)
	end
}