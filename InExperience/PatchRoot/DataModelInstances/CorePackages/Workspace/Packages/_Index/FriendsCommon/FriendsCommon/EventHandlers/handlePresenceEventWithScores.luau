local parent = script:FindFirstAncestor("FriendsCommon").Parent
local queries = require(parent.ApolloLocalState).queries
local apolloFriendsModule = require(parent.ApolloFriends)
local apolloPresenceModule = require(parent.ApolloPresence)
local _ = require(parent.GraphQLServer)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local loggingProtocolModule = require(parent.LoggingProtocol)

local function rtnPresenceToGraphQLPresence(p1)
	-- upvalues: apolloPresenceModule (ref)
	return {
		__typename = "UserPresence",
		id = tostring(p1.userId),
		userPresenceType = apolloPresenceModule.Formatters.formatNumberToPresenceType(p1.userPresenceType),
		lastLocation = p1.lastLocation,
		lastOnline = p1.lastOnline or "",
		gameId = p1.gameId or "",
		placeId = p1.placeId and tostring(p1.placeId) or "",
		rootPlaceId = p1.rootPlaceId and tostring(p1.rootPlaceId) or "",
		universeId = p1.universeId and tostring(p1.universeId) or ""
	}
end

local function toUserIdToFriendMap(p1)
	local t = {}
	
	for i, v in p1 do
		t[v.id] = table.clone(v)
	end
	return t
end

local function _(p2)
	local t = {}
	
	for i, v in p2 do
		table.insert(t, v)
	end
	return t
end

local var1 = socialLuaAnalyticsModule.Telemetry.createEmitter({
	telemetryImpl = loggingProtocolModule.default,
	defaultTelemetryConfig = {
		links = "https://docs.google.com/document/d/1uRCdl8pEuiW9wDiOTL39JPMGLhgxtpvVgiXovE8Xof4",
		throttlingThousandths = game:DefineFastInt("FriendsCommonAnalyticsThrottlingThousandths", 10000)
	},
	getSharedInfo = function()
		return {}
	end
})
local var2 = socialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeRtnMessage",
	description = "User received an rtn message v2",
	lastUpdated = { 2026, 3, 18 },
	backendsList = {
		{
			type = "EventIngest",
			format = function(p3, _)
				return p3
			end
		}
	}
})

return function(p3)
	-- upvalues: apolloFriendsModule (ref), queries (ref), toUserIdToFriendMap (ref), rtnPresenceToGraphQLPresence (ref), var1 (ref), var2 (ref)
	local t = {
		userId = p3.localUserId,
		sort = apolloFriendsModule.Enums.Sort.FriendshipScore
	}
	local var3 = p3.apolloClient:readQuery({ query = queries.onlineFriendsByUserId, variables = t })
	local var4 = if var3 and var3.onlineFriendsByUserId then toUserIdToFriendMap(var3.onlineFriendsByUserId) else {}
	local t_1 = {}
	
	for i, v in pairs(p3.updatedPresences) do
		local var5 = tostring(v.userId)
		local var6 = p3.updatedSortScores[var5]
		table.insert(t_1, var5)
		
		if v.userPresenceType == 0 then
			var4[var5] = nil
		elseif var4[var5] == nil then
			var4[var5] = {
				__typename = "Friend",
				id = tostring(v.userId),
				targetUserId = p3.localUserId,
				presence = rtnPresenceToGraphQLPresence(v),
				sortScore = var6
			}
		else
			local var7 = var4[var5]
			var7.presence = rtnPresenceToGraphQLPresence(v)
			var7.sortScore = var6
		end
	end
	local t_2 = {}
	
	for i_1, v_1 in var4 do
		table.insert(t_2, v_1)
	end
	p3.apolloClient:writeQuery({
		query = queries.onlineFriendsByUserId,
		variables = t,
		data = { onlineFriendsByUserId = t_2 }
	})
	
	if p3.rtnMessageId ~= nil then
		var1.emit(var2, {
			sortType = "Carousel",
			messageId = p3.rtnMessageId,
			userId = tonumber(p3.localUserId),
			friendIds = table.concat(t_1, ",")
		})
	end
end