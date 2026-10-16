local GraphQLServer = script:FindFirstAncestor("GraphQLServer")
local Parent = GraphQLServer.Parent
local UrlBuilder = require(GraphQLServer.Parent.UrlBuilder).UrlBuilder
local UrlBase = require(GraphQLServer.Parent.UrlBuilder).UrlBase
local _ = require(GraphQLServer.Parent.LuauPolyfill)
local PromiseModule = require(GraphQLServer.Parent.Promise)
local GraphQLError = require(GraphQLServer.Parent.GraphQL).GraphQLError
local _ = require(GraphQLServer.graphql.generatedTypes)
local FetchModule = require(GraphQLServer.Parent.Fetch)
local Fetch = FetchModule.fetch
local Response = FetchModule.Response
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local ReportPromiseLoadingTimeWrapperFunction = SocialLuaAnalyticsModule.Analytics.Timing.reportPromiseLoadingTimeWrapper
local CreateDiagMetricStringFunction = SocialLuaAnalyticsModule.Analytics.Formatters.createDiagMetricString
local Diag = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService.Diag
local GetPlatformSuffixFunction = SocialLuaAnalyticsModule.Analytics.FireEvent.getPlatformSuffix
local PlatformSpecificity = SocialLuaAnalyticsModule.Analytics.Enums.PlatformSpecificity
local HttpService = game:GetService("HttpService")
local SupportedTelemetryBackends = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local NewUrlBuilder = UrlBuilder.new({
	path = "users/{userId}/friends/find",
	base = UrlBase.FRIENDS,
	query = {
		{ name = "limit", value = "{limit}", optional = false },
		{ name = "userSort", value = "{userSort}", optional = true },
		{ name = "cursor", value = "{cursor}", optional = true }
	}
})
local NewUrlBuilder1 = UrlBuilder.new({
	path = "users/{userId}/friends/online",
	base = UrlBase.FRIENDS,
	query = {
		{ name = "userSort", value = "{userSort}", optional = true }
	}
})

local function _(): string --[[ Line: 98 ]]
	-- upvalues: HttpService (copy)
	return string.format("friends-sort-%s", HttpService:GenerateGUID(false))
end

local Emitter = SocialLuaAnalyticsModule.Telemetry.createEmitter({
	telemetryImpl = require(Parent.LoggingProtocol).default,
	defaultTelemetryConfig = {
		links = "https://docs.google.com/document/d/1uRCdl8pEuiW9wDiOTL39JPMGLhgxtpvVgiXovE8Xof4",
		throttlingThousandths = game:DefineFastInt("FriendsCommonAnalyticsThrottlingThousandths", 10000)
	},
	getSharedInfo = function() --[[ Line: 108 ]]
		return {}
	end
})
local FriendsSortFeFindFriendsResponse = SocialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeFindFriendsResponse",
	description = "User making a request to /FindFriends",
	lastUpdated = { 2026, 3, 18 },
	backendsList = {
		{
			type = SupportedTelemetryBackends.EventIngest,
			format = function(p1, _) --[[ Line: 120 ]]
				return p1
			end
		}
	}
})
local NewResult = SocialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeGetAllOnlineFriendsResponse",
	description = "User making a request to /GetAllOnlineFriends",
	lastUpdated = { 2026, 3, 18 },
	backendsList = {
		{
			type = SupportedTelemetryBackends.EventIngest,
			format = function(p1, _) --[[ Line: 134 ]]
				return p1
			end
		}
	}
})

local _ = function(RequestId, List, p1, SortType) --[[ Line: 141 ]]
	-- upvalues: Emitter (copy)
	Emitter.emit(p1, {
		requestId = RequestId,
		friendIds = table.concat(List, ","),
		sortType = SortType
	})
end

local function fireLoadingEvent(p1, p2, p3) --[[ Line: 261 ]]
	-- upvalues: CreateDiagMetricStringFunction (copy), GetPlatformSuffixFunction (copy), PlatformSpecificity (copy), Diag (copy)
	Diag:reportStats(CreateDiagMetricStringFunction(p1, p2) .. GetPlatformSuffixFunction(PlatformSpecificity.BucketsOnly), p3)
end

return {
	getAllFriendsByUserId = ReportPromiseLoadingTimeWrapperFunction(function(p1, p2) --[[ Line: 150 | Named "getAllFriendsByUserId" ]]
		-- upvalues: Fetch (copy), PromiseModule (copy), NewUrlBuilder (copy), HttpService (copy), Response (copy), GraphQLError (copy), FriendsSortFeFindFriendsResponse (copy), Emitter (copy)
		local Fetch1 = if p2 then p2 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 153 ]]
			-- upvalues: NewUrlBuilder (upval), p1 (copy), HttpService (upval), Fetch1 (copy), Response (upval), GraphQLError (upval), FriendsSortFeFindFriendsResponse (upval), Emitter (upval)
			local Formatted = string.format("friends-sort-%s", HttpService:GenerateGUID(false))
			local v1 = Fetch1(NewUrlBuilder({
				userId = p1.userId,
				limit = p1.pageLimit or 50,
				cursor = p1.pageCursor,
				userSort = p1.sort
			}), {
				method = "GET",
				headers = { ["friends-sort"] = Formatted }
			}):catch(function(Err) --[[ Line: 163 ]]
				-- upvalues: Response (upval)
				local v2 = Response.error()
				v2.statusText = Err.message
				
				return v2
			end):expect()
			
			if not v1.ok then
				Callback(GraphQLError.new(v1.statusText, nil, nil, nil, nil, {
					extensions = { status = v1.status, statusText = v1.statusText }
				}))
				
				return
			end
			local v2 = v1:json():catch(function() --[[ Line: 182 ]]
				return nil
			end):expect()
			
			if not v2 then
				Callback(GraphQLError.new("Failed to decode HTTP response as JSON for friends API"))
				
				return
			end
			Callback1(v2)
			
			if Formatted == nil then return end
			local List = {}
			
			for _, pageItem in pairs(v2.PageItems) do
				table.insert(List, pageItem.id)
			end
			Emitter.emit(FriendsSortFeFindFriendsResponse, {
				sortType = "FriendScore",
				requestId = Formatted,
				friendIds = table.concat(List, ",")
			})
		end)
	end, function(p3) --[[ Line: 269 ]]
		return {
			fetch = "friends_find",
			nextPage = p3.pageCursor and p3.pageCursor ~= ""
		}
	end, { fireEvent = fireLoadingEvent }),
	getOnlineFriendsByUserId = ReportPromiseLoadingTimeWrapperFunction(function(p3, p4) --[[ Line: 206 | Named "getOnlineFriendsByUserId" ]]
		-- upvalues: Fetch (copy), PromiseModule (copy), NewUrlBuilder1 (copy), HttpService (copy), Response (copy), GraphQLError (copy), NewResult (copy), Emitter (copy)
		local Fetch1 = if p4 then p4 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 209 ]]
			-- upvalues: NewUrlBuilder1 (upval), p3 (copy), HttpService (upval), Fetch1 (copy), Response (upval), GraphQLError (upval), NewResult (upval), Emitter (upval)
			local Formatted = string.format("friends-sort-%s", HttpService:GenerateGUID(false))
			local v1 = Fetch1(NewUrlBuilder1({ userId = p3.userId, userSort = p3.sort }), {
				method = "GET",
				headers = { ["friends-sort"] = Formatted }
			}):catch(function(Err) --[[ Line: 217 ]]
				-- upvalues: Response (upval)
				local v2 = Response.error()
				v2.statusText = Err.message
				
				return v2
			end):expect()
			
			if not v1.ok then
				Callback(GraphQLError.new(v1.statusText, nil, nil, nil, nil, {
					extensions = { status = v1.status, statusText = v1.statusText }
				}))
				
				return
			end
			local v2 = v1:json():catch(function() --[[ Line: 236 ]]
				return nil
			end):expect()
			
			if not v2 then
				Callback(GraphQLError.new("Failed to decode HTTP response as JSON for friends API"))
				
				return
			end
			local Data = v2.data or {}
			Callback1(Data)
			
			if Formatted == nil then return end
			local List = {}
			
			for _, entry in Data do
				table.insert(List, entry.id)
			end
			Emitter.emit(NewResult, {
				sortType = "Carousel",
				requestId = Formatted,
				friendIds = table.concat(List, ",")
			})
		end)
	end, function(_) --[[ Line: 277 ]]
		return { fetch = "friends_online" }
	end, { fireEvent = fireLoadingEvent })
}