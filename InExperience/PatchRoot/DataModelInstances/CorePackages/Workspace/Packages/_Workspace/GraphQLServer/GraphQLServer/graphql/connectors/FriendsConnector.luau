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
local passRequestIdToFriendsApiCalls = game:DefineFastFlag("PassRequestIdToFriendsApiCalls", false)
local httpService = game:GetService("HttpService")
local friendsSortFriendsApiFeatureLoggingEnabled = game:DefineFastFlag("FriendsSortFriendsApiFeatureLoggingEnabled", false)
local loggingProtocolModule = require(parent.LoggingProtocol)
local supportedTelemetryBackends = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local var8 = urlBuilder.new({
	path = "users/{userId}/friends/find",
	base = urlBase.FRIENDS,
	query = {
		{ name = "limit", value = "{limit}", optional = false },
		{ name = "userSort", value = "{userSort}", optional = true },
		{ name = "cursor", value = "{cursor}", optional = true }
	}
})
local var9 = urlBuilder.new({
	path = "users/{userId}/friends/online",
	base = urlBase.FRIENDS,
	query = {
		{ name = "userSort", value = "{userSort}", optional = true }
	}
})

local _ = function() --[[ line: 102 ]]
	-- upvalues: httpService (ref)
	return string.format("friends-sort-%s", httpService:GenerateGUID(false))
end

local var10 = if passRequestIdToFriendsApiCalls then socialLuaAnalyticsModule.Telemetry.createEmitter({
	telemetryImpl = loggingProtocolModule.default,
	defaultTelemetryConfig = {
		links = "https://docs.google.com/document/d/1uRCdl8pEuiW9wDiOTL39JPMGLhgxtpvVgiXovE8Xof4",
		throttlingThousandths = game:DefineFastInt("FriendsCommonAnalyticsThrottlingThousandths", 10000)
	},
	getSharedInfo = function() --[[ line: 113 ]]
		return {}
	end
}) else nil
local var11 = if passRequestIdToFriendsApiCalls then socialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeFindFriendsResponse",
	description = "User making a request to /FindFriends",
	lastUpdated = { 2026, 3, 18 },
	backendsList = {
		{
			type = supportedTelemetryBackends.EventIngest,
			format = function(p0, _) --[[ line: 127 ]]
				return p0
			end
		}
	}
}) else nil
local var12 = if passRequestIdToFriendsApiCalls then socialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeGetAllOnlineFriendsResponse",
	description = "User making a request to /GetAllOnlineFriends",
	lastUpdated = { 2026, 3, 18 },
	backendsList = {
		{
			type = supportedTelemetryBackends.EventIngest,
			format = function(p1, _) --[[ line: 143 ]]
				return p1
			end
		}
	}
}) else nil

local _ = function(p2, p3, p4, p5) --[[ line: 151 ]]
	-- upvalues: var10 (ref)
	var10.emit(p4, {
		requestId = p2,
		friendIds = table.concat(p3, ","),
		sortType = p5
	})
end

local function fireLoadingEvent(p6, p7, p8) --[[ line: 285 ]]
	-- upvalues: createDiagMetricString (ref), getPlatformSuffix (ref), platformSpecificity (ref), diag (ref)
	diag:reportStats(createDiagMetricString(p6, p7) .. getPlatformSuffix(platformSpecificity.BucketsOnly), p8)
end

return {
	getAllFriendsByUserId = reportPromiseLoadingTimeWrapper(function(p9, p10) --[[ line: 160 | named "getAllFriendsByUserId" ]]
		-- upvalues: fetch (ref), promiseModule (ref), var8 (ref), passRequestIdToFriendsApiCalls (ref), httpService (ref), response (ref), graphQLError (ref), friendsSortFriendsApiFeatureLoggingEnabled (ref), var11 (ref), var10 (ref)
		local var14 = p10 or fetch
		
		return promiseModule.new(function(p11, p12) --[[ line: 163 ]]
			-- upvalues: var8 (copy), p9 (ref), passRequestIdToFriendsApiCalls (copy), httpService (copy), var14 (ref), response (copy), graphQLError (copy), friendsSortFriendsApiFeatureLoggingEnabled (copy), var11 (copy), var10 (copy)
			local var15 = if passRequestIdToFriendsApiCalls then string.format("friends-sort-%s", httpService:GenerateGUID(false)) else nil
			local var16 = var14(var8({
				userId = p9.userId,
				limit = p9.pageLimit or 50,
				cursor = p9.pageCursor,
				userSort = p9.sort
			}), if passRequestIdToFriendsApiCalls then { method = "GET", headers = { ["friends-sort"] = var15 } } else { method = "GET" }):catch(function(p13) --[[ line: 178 ]]
				-- upvalues: response (copy)
				local var19 = response.error()
				var19.statusText = p13.message
				
				return var19
			end):expect()
			
			if not var16.ok then
				p12(graphQLError.new(var16.statusText, nil, nil, nil, nil, {
					extensions = { status = var16.status, statusText = var16.statusText }
				}))
				
				return
			end
			local var17 = var16:json():catch(function() --[[ line: 197 ]]
				return nil
			end):expect()
			
			if not var17 then
				p12(graphQLError.new("Failed to decode HTTP response as JSON for friends API"))
				
				return
			end
			p11(var17)
			
			if passRequestIdToFriendsApiCalls and friendsSortFriendsApiFeatureLoggingEnabled then
				if var15 == nil then return end
				local t = {}
				
				for i, v in pairs(var17.PageItems) do
					table.insert(t, v.id)
				end
				var10.emit(var11, {
					sortType = "FriendScore",
					requestId = var15,
					friendIds = table.concat(t, ",")
				})
			end
		end)
	end, function(p14) --[[ line: 293 ]]
		return {
			fetch = "friends_find",
			nextPage = p14.pageCursor and p14.pageCursor ~= ""
		}
	end, { fireEvent = fireLoadingEvent }),
	getOnlineFriendsByUserId = reportPromiseLoadingTimeWrapper(function(p15, p16) --[[ line: 223 | named "getOnlineFriendsByUserId" ]]
		-- upvalues: fetch (ref), promiseModule (ref), var9 (ref), passRequestIdToFriendsApiCalls (ref), httpService (ref), response (ref), graphQLError (ref), friendsSortFriendsApiFeatureLoggingEnabled (ref), var12 (ref), var10 (ref)
		local var20 = p16 or fetch
		
		return promiseModule.new(function(p17, p18) --[[ line: 226 ]]
			-- upvalues: var9 (copy), p15 (ref), passRequestIdToFriendsApiCalls (copy), httpService (copy), var20 (ref), response (copy), graphQLError (copy), friendsSortFriendsApiFeatureLoggingEnabled (copy), var12 (copy), var10 (copy)
			local var21 = if passRequestIdToFriendsApiCalls then string.format("friends-sort-%s", httpService:GenerateGUID(false)) else nil
			local var22 = var20(var9({ userId = p15.userId, userSort = p15.sort }), if passRequestIdToFriendsApiCalls then { method = "GET", headers = { ["friends-sort"] = var21 } } else { method = "GET" }):catch(function(p19) --[[ line: 239 ]]
				-- upvalues: response (copy)
				local var26 = response.error()
				var26.statusText = p19.message
				
				return var26
			end):expect()
			
			if not var22.ok then
				p18(graphQLError.new(var22.statusText, nil, nil, nil, nil, {
					extensions = { status = var22.status, statusText = var22.statusText }
				}))
				
				return
			end
			local var23 = var22:json():catch(function() --[[ line: 258 ]]
				return nil
			end):expect()
			
			if not var23 then
				p18(graphQLError.new("Failed to decode HTTP response as JSON for friends API"))
				
				return
			end
			local data = var23.data or {}
			p17(data)
			
			if passRequestIdToFriendsApiCalls and friendsSortFriendsApiFeatureLoggingEnabled then
				if var21 == nil then return end
				local t = {}
				
				for i, v in data do
					table.insert(t, v.id)
				end
				var10.emit(var12, {
					sortType = "Carousel",
					requestId = var21,
					friendIds = table.concat(t, ",")
				})
			end
		end)
	end, function(_) --[[ line: 301 ]]
		return { fetch = "friends_online" }
	end, { fireEvent = fireLoadingEvent })
}