local parent = script:FindFirstAncestor("FriendsCommon").Parent
local queries = require(parent.ApolloLocalState).queries
local apolloFriendsModule = require(parent.ApolloFriends)
local apolloPresenceModule = require(parent.ApolloPresence)
local _ = require(parent.GraphQLServer)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local loggingProtocolModule = require(parent.LoggingProtocol)

local function rtnPresenceToGraphQLPresence(p0) --[[ line: 37 ]]
	-- upvalues: apolloPresenceModule (ref)
	return {
		__typename = "UserPresence",
		id = tostring(p0.userId),
		userPresenceType = apolloPresenceModule.Formatters.formatNumberToPresenceType(p0.userPresenceType),
		lastLocation = p0.lastLocation,
		lastOnline = p0.lastOnline or "",
		gameId = p0.gameId or "",
		placeId = p0.placeId and tostring(p0.placeId) or "",
		rootPlaceId = p0.rootPlaceId and tostring(p0.rootPlaceId) or "",
		universeId = p0.universeId and tostring(p0.universeId) or ""
	}
end

local function toUserIdToFriendMap(p1) --[[ line: 51 ]]
	local t = {}
	
	for i, v in p1 do
		t[v.id] = table.clone(v)
	end
	return t
end

local function _(p2) --[[ line: 60 | named "userIdFriendMapToList" ]]
	local t = {}
	
	for i, v in p2 do
		table.insert(t, v)
	end
	return t
end

local var6 = socialLuaAnalyticsModule.Telemetry.createEmitter({
	telemetryImpl = loggingProtocolModule.default,
	defaultTelemetryConfig = {
		links = "https://docs.google.com/document/d/1uRCdl8pEuiW9wDiOTL39JPMGLhgxtpvVgiXovE8Xof4",
		throttlingThousandths = game:DefineFastInt("FriendsCommonAnalyticsThrottlingThousandths", 10000)
	},
	getSharedInfo = function() --[[ line: 82 ]]
		return {}
	end
})
local var7 = socialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeRtnMessage",
	description = "User received an rtn message v2",
	lastUpdated = { 2026, 3, 18 },
	backendsList = {
		{
			type = "EventIngest",
			format = function(p3, _) --[[ line: 94 ]]
				return p3
			end
		}
	}
})

return function(p4) --[[ line: 101 | named "handlePresenceEventWithScores" ]]
	-- upvalues: apolloFriendsModule (ref), queries (ref), toUserIdToFriendMap (ref), rtnPresenceToGraphQLPresence (ref), var6 (ref), var7 (ref)
	local t = {
		userId = p4.localUserId,
		sort = apolloFriendsModule.Enums.Sort.FriendshipScore
	}
	local var11 = p4.apolloClient:readQuery({ query = queries.onlineFriendsByUserId, variables = t })
	local var12 = if var11 and var11.onlineFriendsByUserId then toUserIdToFriendMap(var11.onlineFriendsByUserId) else {}
	local t_1 = {}
	
	for i, v in pairs(p4.updatedPresences) do
		local var15 = tostring(v.userId)
		local var16 = p4.updatedSortScores[var15]
		table.insert(t_1, var15)
		
		if v.userPresenceType == 0 then
			var12[var15] = nil
		elseif var12[var15] == nil then
			var12[var15] = {
				__typename = "Friend",
				id = tostring(v.userId),
				targetUserId = p4.localUserId,
				presence = rtnPresenceToGraphQLPresence(v),
				sortScore = var16
			}
		else
			local var17 = var12[var15]
			var17.presence = rtnPresenceToGraphQLPresence(v)
			var17.sortScore = var16
		end
	end
	local t_2 = {}
	
	for i_1, v_1 in var12 do
		table.insert(t_2, v_1)
	end
	p4.apolloClient:writeQuery({
		query = queries.onlineFriendsByUserId,
		variables = t,
		data = { onlineFriendsByUserId = t_2 }
	})
	
	if p4.rtnMessageId ~= nil then
		var6.emit(var7, {
			sortType = "Carousel",
			messageId = p4.rtnMessageId,
			userId = tonumber(p4.localUserId),
			friendIds = table.concat(t_1, ",")
		})
	end
end