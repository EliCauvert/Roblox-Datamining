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
local var1 = urlBuilder.new({
	path = "users/{userId}/friends/find",
	base = urlBase.FRIENDS,
	query = {
		{ name = "limit", value = "{limit}", optional = false },
		{ name = "userSort", value = "{userSort}", optional = true },
		{ name = "cursor", value = "{cursor}", optional = true }
	}
})
local var2 = urlBuilder.new({
	path = "users/{userId}/friends/online",
	base = urlBase.FRIENDS,
	query = {
		{ name = "userSort", value = "{userSort}", optional = true }
	}
})

local _ = function()
	-- upvalues: httpService (ref)
	return string.format("friends-sort-%s", httpService:GenerateGUID(false))
end

local var3 = socialLuaAnalyticsModule.Telemetry.createEmitter({
	telemetryImpl = loggingProtocolModule.default,
	defaultTelemetryConfig = {
		links = "https://docs.google.com/document/d/1uRCdl8pEuiW9wDiOTL39JPMGLhgxtpvVgiXovE8Xof4",
		throttlingThousandths = game:DefineFastInt("FriendsCommonAnalyticsThrottlingThousandths", 10000)
	},
	getSharedInfo = function()
		return {}
	end
})
local var4 = socialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeFindFriendsResponse",
	description = "User making a request to /FindFriends",
	lastUpdated = { 2026, 3, 18 },
	backendsList = {
		{
			type = supportedTelemetryBackends.EventIngest,
			format = function(p1, _)
				return p1
			end
		}
	}
})
local var5 = socialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeGetAllOnlineFriendsResponse",
	description = "User making a request to /GetAllOnlineFriends",
	lastUpdated = { 2026, 3, 18 },
	backendsList = {
		{
			type = supportedTelemetryBackends.EventIngest,
			format = function(p1, _)
				return p1
			end
		}
	}
})

local _ = function(p1, p2, p3, p4)
	-- upvalues: var3 (ref)
	var3.emit(p3, {
		requestId = p1,
		friendIds = table.concat(p2, ","),
		sortType = p4
	})
end

local function fireLoadingEvent(p1, p2, p3)
	-- upvalues: createDiagMetricString (ref), getPlatformSuffix (ref), platformSpecificity (ref), diag (ref)
	diag:reportStats(createDiagMetricString(p1, p2) .. getPlatformSuffix(platformSpecificity.BucketsOnly), p3)
end

return {
	getAllFriendsByUserId = reportPromiseLoadingTimeWrapper(function(p1, p2)
		-- upvalues: fetch (ref), promiseModule (ref), var1 (ref), httpService (ref), response (ref), graphQLError (ref), var4 (ref), var3 (ref)
		local var6 = p2 or fetch
		
		return promiseModule.new(function(p3, p4)
			-- upvalues: var1 (copy), p1 (ref), httpService (copy), var6 (ref), response (copy), graphQLError (copy), var4 (copy), var3 (copy)
			local formattedText = string.format("friends-sort-%s", httpService:GenerateGUID(false))
			local var7 = var6(var1({
				userId = p1.userId,
				limit = p1.pageLimit or 50,
				cursor = p1.pageCursor,
				userSort = p1.sort
			}), {
				method = "GET",
				headers = { ["friends-sort"] = formattedText }
			}):catch(function(p5)
				-- upvalues: response (copy)
				local var8 = response.error()
				var8.statusText = p5.message
				
				return var8
			end):expect()
			
			if not var7.ok then
				p4(graphQLError.new(var7.statusText, nil, nil, nil, nil, {
					extensions = { status = var7.status, statusText = var7.statusText }
				}))
				
				return
			end
			local var8 = var7:json():catch(function()
				return nil
			end):expect()
			
			if not var8 then
				p4(graphQLError.new("Failed to decode HTTP response as JSON for friends API"))
				
				return
			end
			p3(var8)
			
			if formattedText == nil then return end
			local t = {}
			
			for i, v in pairs(var8.PageItems) do
				table.insert(t, v.id)
			end
			var3.emit(var4, {
				sortType = "FriendScore",
				requestId = formattedText,
				friendIds = table.concat(t, ",")
			})
		end)
	end, function(p3)
		return {
			fetch = "friends_find",
			nextPage = p3.pageCursor and p3.pageCursor ~= ""
		}
	end, { fireEvent = fireLoadingEvent }),
	getOnlineFriendsByUserId = reportPromiseLoadingTimeWrapper(function(p3, p4)
		-- upvalues: fetch (ref), promiseModule (ref), var2 (ref), httpService (ref), response (ref), graphQLError (ref), var5 (ref), var3 (ref)
		local var7 = p4 or fetch
		
		return promiseModule.new(function(p5, p6)
			-- upvalues: var2 (copy), p3 (ref), httpService (copy), var7 (ref), response (copy), graphQLError (copy), var5 (copy), var3 (copy)
			local formattedText = string.format("friends-sort-%s", httpService:GenerateGUID(false))
			local var8 = var7(var2({ userId = p3.userId, userSort = p3.sort }), {
				method = "GET",
				headers = { ["friends-sort"] = formattedText }
			}):catch(function(p7)
				-- upvalues: response (copy)
				local var9 = response.error()
				var9.statusText = p7.message
				
				return var9
			end):expect()
			
			if not var8.ok then
				p6(graphQLError.new(var8.statusText, nil, nil, nil, nil, {
					extensions = { status = var8.status, statusText = var8.statusText }
				}))
				
				return
			end
			local var9 = var8:json():catch(function()
				return nil
			end):expect()
			
			if not var9 then
				p6(graphQLError.new("Failed to decode HTTP response as JSON for friends API"))
				
				return
			end
			local data = var9.data or {}
			p5(data)
			
			if formattedText == nil then return end
			local t = {}
			
			for i, v in data do
				table.insert(t, v.id)
			end
			var3.emit(var5, {
				sortType = "Carousel",
				requestId = formattedText,
				friendIds = table.concat(t, ",")
			})
		end)
	end, function(_)
		return { fetch = "friends_online" }
	end, { fireEvent = fireLoadingEvent })
}