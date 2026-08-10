local graphQLServer = script:FindFirstAncestor("GraphQLServer")
local parent = graphQLServer.Parent
local urlBuilder = require(graphQLServer.Parent.UrlBuilder).UrlBuilder
local urlBase = require(graphQLServer.Parent.UrlBuilder).UrlBase
local _ = require(graphQLServer.Parent.LuauPolyfill)
local promiseModule = require(graphQLServer.Parent.Promise)
local graphQLError = require(graphQLServer.Parent.GraphQL).GraphQLError
local _ = require(graphQLServer.graphql.generatedTypes)
local fetchModule = require(graphQLServer.Parent.Fetch)
local fetch = fetchModule.fetch
local response = fetchModule.Response
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local reportPromiseLoadingTimeWrapper = socialLuaAnalyticsModule.Analytics.Timing.reportPromiseLoadingTimeWrapper
local createDiagMetricString = socialLuaAnalyticsModule.Analytics.Formatters.createDiagMetricString
local diag = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService.Diag
local getPlatformSuffix = socialLuaAnalyticsModule.Analytics.FireEvent.getPlatformSuffix
local platformSpecificity = socialLuaAnalyticsModule.Analytics.Enums.PlatformSpecificity
local httpService = game:GetService("HttpService")
local loggingProtocolModule = require(parent.LoggingProtocol)
local supportedTelemetryBackends = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local var6 = urlBuilder.new({
	path = "users/{userId}/friends/find",
	base = urlBase.FRIENDS,
	query = {
		{ name = "limit", value = "{limit}", optional = false },
		{ name = "userSort", value = "{userSort}", optional = true },
		{ name = "cursor", value = "{cursor}", optional = true }
	}
})
local var7 = urlBuilder.new({
	path = "users/{userId}/friends/online",
	base = urlBase.FRIENDS,
	query = {
		{ name = "userSort", value = "{userSort}", optional = true }
	}
})

local _ = function() --[[ line: 98 ]]
	-- upvalues: httpService (ref)
	return string.format("friends-sort-%s", httpService:GenerateGUID(false))
end

local var8 = socialLuaAnalyticsModule.Telemetry.createEmitter({
	telemetryImpl = loggingProtocolModule.default,
	defaultTelemetryConfig = {
		links = "https://docs.google.com/document/d/1uRCdl8pEuiW9wDiOTL39JPMGLhgxtpvVgiXovE8Xof4",
		throttlingThousandths = game:DefineFastInt("FriendsCommonAnalyticsThrottlingThousandths", 10000)
	},
	getSharedInfo = function() --[[ line: 108 ]]
		return {}
	end
})
local var9 = socialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeFindFriendsResponse",
	description = "User making a request to /FindFriends",
	lastUpdated = { 2026, 3, 18 },
	backendsList = {
		{
			type = supportedTelemetryBackends.EventIngest,
			format = function(p0, _) --[[ line: 120 ]]
				return p0
			end
		}
	}
})
local var10 = socialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeGetAllOnlineFriendsResponse",
	description = "User making a request to /GetAllOnlineFriends",
	lastUpdated = { 2026, 3, 18 },
	backendsList = {
		{
			type = supportedTelemetryBackends.EventIngest,
			format = function(p1, _) --[[ line: 134 ]]
				return p1
			end
		}
	}
})

local _ = function(p2, p3, p4, p5) --[[ line: 141 ]]
	-- upvalues: var8 (ref)
	var8.emit(p4, {
		requestId = p2,
		friendIds = table.concat(p3, ","),
		sortType = p5
	})
end

local function fireLoadingEvent(p6, p7, p8) --[[ line: 261 ]]
	-- upvalues: createDiagMetricString (ref), getPlatformSuffix (ref), platformSpecificity (ref), diag (ref)
	diag:reportStats(createDiagMetricString(p6, p7) .. getPlatformSuffix(platformSpecificity.BucketsOnly), p8)
end

return {
	getAllFriendsByUserId = reportPromiseLoadingTimeWrapper(function(p9, p10) --[[ line: 150 | named "getAllFriendsByUserId" ]]
		-- upvalues: fetch (ref), promiseModule (ref), var6 (ref), httpService (ref), response (ref), graphQLError (ref), var9 (ref), var8 (ref)
		local var12 = p10 or fetch
		
		return promiseModule.new(function(p11, p12) --[[ line: 153 ]]
			-- upvalues: var6 (copy), p9 (ref), httpService (copy), var12 (ref), response (copy), graphQLError (copy), var9 (copy), var8 (copy)
			local formattedText = string.format("friends-sort-%s", httpService:GenerateGUID(false))
			local var14 = var12(var6({
				userId = p9.userId,
				limit = p9.pageLimit or 50,
				cursor = p9.pageCursor,
				userSort = p9.sort
			}), {
				method = "GET",
				headers = { ["friends-sort"] = formattedText }
			}):catch(function(p13) --[[ line: 163 ]]
				-- upvalues: response (copy)
				local var17 = response.error()
				var17.statusText = p13.message
				
				return var17
			end):expect()
			
			if not var14.ok then
				p12(graphQLError.new(var14.statusText, nil, nil, nil, nil, {
					extensions = { status = var14.status, statusText = var14.statusText }
				}))
				
				return
			end
			local var15 = var14:json():catch(function() --[[ line: 182 ]]
				return nil
			end):expect()
			
			if not var15 then
				p12(graphQLError.new("Failed to decode HTTP response as JSON for friends API"))
				
				return
			end
			p11(var15)
			
			if formattedText == nil then return end
			local t = {}
			
			for i, v in pairs(var15.PageItems) do
				table.insert(t, v.id)
			end
			var8.emit(var9, {
				sortType = "FriendScore",
				requestId = formattedText,
				friendIds = table.concat(t, ",")
			})
		end)
	end, function(p14) --[[ line: 269 ]]
		return {
			fetch = "friends_find",
			nextPage = p14.pageCursor and p14.pageCursor ~= ""
		}
	end, { fireEvent = fireLoadingEvent }),
	getOnlineFriendsByUserId = reportPromiseLoadingTimeWrapper(function(p15, p16) --[[ line: 206 | named "getOnlineFriendsByUserId" ]]
		-- upvalues: fetch (ref), promiseModule (ref), var7 (ref), httpService (ref), response (ref), graphQLError (ref), var10 (ref), var8 (ref)
		local var18 = p16 or fetch
		
		return promiseModule.new(function(p17, p18) --[[ line: 209 ]]
			-- upvalues: var7 (copy), p15 (ref), httpService (copy), var18 (ref), response (copy), graphQLError (copy), var10 (copy), var8 (copy)
			local formattedText = string.format("friends-sort-%s", httpService:GenerateGUID(false))
			local var20 = var18(var7({ userId = p15.userId, userSort = p15.sort }), {
				method = "GET",
				headers = { ["friends-sort"] = formattedText }
			}):catch(function(p19) --[[ line: 217 ]]
				-- upvalues: response (copy)
				local var24 = response.error()
				var24.statusText = p19.message
				
				return var24
			end):expect()
			
			if not var20.ok then
				p18(graphQLError.new(var20.statusText, nil, nil, nil, nil, {
					extensions = { status = var20.status, statusText = var20.statusText }
				}))
				
				return
			end
			local var21 = var20:json():catch(function() --[[ line: 236 ]]
				return nil
			end):expect()
			
			if not var21 then
				p18(graphQLError.new("Failed to decode HTTP response as JSON for friends API"))
				
				return
			end
			local data = var21.data or {}
			p17(data)
			
			if formattedText == nil then return end
			local t = {}
			
			for i, v in data do
				table.insert(t, v.id)
			end
			var8.emit(var10, {
				sortType = "Carousel",
				requestId = formattedText,
				friendIds = table.concat(t, ",")
			})
		end)
	end, function(_) --[[ line: 277 ]]
		return { fetch = "friends_online" }
	end, { fireEvent = fireLoadingEvent })
}