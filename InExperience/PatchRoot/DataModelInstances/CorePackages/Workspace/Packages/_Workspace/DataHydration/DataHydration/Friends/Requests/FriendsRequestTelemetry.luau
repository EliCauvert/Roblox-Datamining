local parent = script:FindFirstAncestor("DataHydration").Parent
local httpService = game:GetService("HttpService")
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local supportedTelemetryBackends = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local var1 = socialLuaAnalyticsModule.Telemetry.createEmitter({
	telemetryImpl = require(parent.LoggingProtocol).default,
	defaultTelemetryConfig = {
		links = "https://docs.google.com/document/d/1uRCdl8pEuiW9wDiOTL39JPMGLhgxtpvVgiXovE8Xof4",
		throttlingThousandths = game:DefineFastInt("FriendsCommonAnalyticsThrottlingThousandths", 10000)
	},
	getSharedInfo = function()
		return {}
	end
})
local var2 = socialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeFindFriendsResponse",
	description = "User making a request to /FindFriends",
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
local var3 = socialLuaAnalyticsModule.Telemetry.new({
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

local function _(p1, p2)
	-- upvalues: var1 (ref)
	pcall(function()
		-- upvalues: var1 (copy), p1 (ref), p2 (ref)
		var1.emit(p1, p2)
	end)
end

return {
	generateRequestId = function()
		-- upvalues: httpService (ref)
		return string.format("friends-sort-%s", httpService:GenerateGUID(false))
	end,
	getRequestOptions = function(p1)
		return if p1 == nil then nil else { headers = { ["friends-sort"] = p1 } }
	end,
	emitFindFriendsResponse = function(p1, p2)
		-- upvalues: var2 (ref), var1 (ref)
		local t = {
			sortType = "FriendScore",
			requestId = p1,
			friendIds = table.concat(p2, ",")
		}
		pcall(function()
			-- upvalues: var1 (copy), var2 (ref), t (ref)
			var1.emit(var2, t)
		end)
	end,
	emitGetAllOnlineFriendsResponse = function(p1, p2)
		-- upvalues: var3 (ref), var1 (ref)
		local t = {
			sortType = "Carousel",
			requestId = p1,
			friendIds = table.concat(p2, ",")
		}
		pcall(function()
			-- upvalues: var1 (copy), var3 (ref), t (ref)
			var1.emit(var3, t)
		end)
	end
}