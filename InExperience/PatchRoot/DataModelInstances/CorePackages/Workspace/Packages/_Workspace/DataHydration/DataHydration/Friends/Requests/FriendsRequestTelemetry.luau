local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpService = game:GetService("HttpService")
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local SupportedTelemetryBackends = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local Emitter = SocialLuaAnalyticsModule.Telemetry.createEmitter({
	telemetryImpl = require(Parent.LoggingProtocol).default,
	defaultTelemetryConfig = {
		links = "https://docs.google.com/document/d/1uRCdl8pEuiW9wDiOTL39JPMGLhgxtpvVgiXovE8Xof4",
		throttlingThousandths = game:DefineFastInt("FriendsCommonAnalyticsThrottlingThousandths", 10000)
	},
	getSharedInfo = function() --[[ Line: 23 ]]
		return {}
	end
})
local FriendsSortFeFindFriendsResponse = SocialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeFindFriendsResponse",
	description = "User making a request to /FindFriends",
	lastUpdated = { 2026, 6, 18 },
	backendsList = {
		{
			type = SupportedTelemetryBackends.EventIngest,
			format = function(p1, _) --[[ Line: 35 ]]
				return p1
			end
		}
	}
})
local NewResult = SocialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeGetAllOnlineFriendsResponse",
	description = "User making a request to /GetAllOnlineFriends",
	lastUpdated = { 2026, 6, 18 },
	backendsList = {
		{
			type = SupportedTelemetryBackends.EventIngest,
			format = function(p1, _) --[[ Line: 49 ]]
				return p1
			end
		}
	}
})

local function _(p1, p2) --[[ Line: 72 | Named "safeEmit" ]]
	-- upvalues: Emitter (copy)
	pcall(function() --[[ Line: 73 ]]
		-- upvalues: Emitter (upval), p1 (copy), p2 (copy)
		Emitter.emit(p1, p2)
	end)
end

return {
	generateRequestId = function(): string --[[ Line: 56 ]]
		-- upvalues: HttpService (copy)
		return string.format("friends-sort-%s", HttpService:GenerateGUID(false))
	end,
	getRequestOptions = function(p1) --[[ Line: 60 ]]
		return if p1 == nil then nil else { headers = { ["friends-sort"] = p1 } }
	end,
	emitFindFriendsResponse = function(RequestId, List) --[[ Line: 78 ]]
		-- upvalues: FriendsSortFeFindFriendsResponse (copy), Emitter (copy)
		local config = {
			sortType = "FriendScore",
			requestId = RequestId,
			friendIds = table.concat(List, ",")
		}
		pcall(function() --[[ Line: 73 ]]
			-- upvalues: Emitter (upval), FriendsSortFeFindFriendsResponse (copy), config (copy)
			Emitter.emit(FriendsSortFeFindFriendsResponse, config)
		end)
	end,
	emitGetAllOnlineFriendsResponse = function(RequestId, List) --[[ Line: 86 ]]
		-- upvalues: NewResult (copy), Emitter (copy)
		local config = {
			sortType = "Carousel",
			requestId = RequestId,
			friendIds = table.concat(List, ",")
		}
		pcall(function() --[[ Line: 73 ]]
			-- upvalues: Emitter (upval), NewResult (copy), config (copy)
			Emitter.emit(NewResult, config)
		end)
	end
}