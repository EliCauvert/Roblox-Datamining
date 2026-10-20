local Parent = script:FindFirstAncestor("FriendsCommon").Parent
local Queries = require(Parent.ApolloLocalState).queries
local ApolloFriendsModule = require(Parent.ApolloFriends)
local ApolloPresenceModule = require(Parent.ApolloPresence)
local _ = require(Parent.GraphQLServer)
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)

local function rtnPresenceToGraphQLPresence(p1)
	-- upvalues: ApolloPresenceModule (copy)
	return {
		__typename = "UserPresence",
		id = tostring(p1.userId),
		userPresenceType = ApolloPresenceModule.Formatters.formatNumberToPresenceType(p1.userPresenceType),
		lastLocation = p1.lastLocation,
		lastOnline = p1.lastOnline or "",
		gameId = p1.gameId or "",
		placeId = p1.placeId and tostring(p1.placeId) or "",
		rootPlaceId = p1.rootPlaceId and tostring(p1.rootPlaceId) or "",
		universeId = p1.universeId and tostring(p1.universeId) or ""
	}
end

local function toUserIdToFriendMap(OnlineFriendsByUserId)
	local t = {}
	
	for _, value in OnlineFriendsByUserId do
		t[value.id] = table.clone(value)
	end
	return t
end

local function _(List)
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, value)
	end
	return List1
end

local Emitter = SocialLuaAnalyticsModule.Telemetry.createEmitter({
	telemetryImpl = require(Parent.LoggingProtocol).default,
	defaultTelemetryConfig = {
		links = "https://docs.google.com/document/d/1uRCdl8pEuiW9wDiOTL39JPMGLhgxtpvVgiXovE8Xof4",
		throttlingThousandths = game:DefineFastInt("FriendsCommonAnalyticsThrottlingThousandths", 10000)
	},
	getSharedInfo = function()
		return {}
	end
})
local FriendsSortFeRtnMessage = SocialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeRtnMessage",
	description = "User received an rtn message v2",
	lastUpdated = { 2026, 3, 18 },
	backendsList = {
		{
			type = "EventIngest",
			format = function(p1, _)
				return p1
			end
		}
	}
})

return function(p1)
	-- upvalues: ApolloFriendsModule (copy), Queries (copy), toUserIdToFriendMap (copy), rtnPresenceToGraphQLPresence (copy), Emitter (copy), FriendsSortFeRtnMessage (copy)
	local Variables = {
		userId = p1.localUserId,
		sort = ApolloFriendsModule.Enums.Sort.FriendshipScore
	}
	local Query = p1.apolloClient:readQuery({
		query = Queries.onlineFriendsByUserId,
		variables = Variables
	})
	local UserIdToFriendMap = if Query and Query.onlineFriendsByUserId then toUserIdToFriendMap(Query.onlineFriendsByUserId) else {}
	local List = {}
	
	for _, updatedPresence in pairs(p1.updatedPresences) do
		local Text = tostring(updatedPresence.userId)
		local UpdatedSortScore = p1.updatedSortScores[Text]
		table.insert(List, Text)
		
		if updatedPresence.userPresenceType == 0 then
			UserIdToFriendMap[Text] = nil
		elseif UserIdToFriendMap[Text] == nil then
			UserIdToFriendMap[Text] = {
				__typename = "Friend",
				id = tostring(updatedPresence.userId),
				targetUserId = p1.localUserId,
				presence = rtnPresenceToGraphQLPresence(updatedPresence),
				sortScore = UpdatedSortScore
			}
		else
			local UserIdToFriend = UserIdToFriendMap[Text]
			UserIdToFriend.presence = rtnPresenceToGraphQLPresence(updatedPresence)
			UserIdToFriend.sortScore = UpdatedSortScore
		end
	end
	local OnlineFriendsByUserId = {}
	
	for _, value in UserIdToFriendMap do
		table.insert(OnlineFriendsByUserId, value)
	end
	p1.apolloClient:writeQuery({
		query = Queries.onlineFriendsByUserId,
		variables = Variables,
		data = { onlineFriendsByUserId = OnlineFriendsByUserId }
	})
	
	if p1.rtnMessageId ~= nil then
		Emitter.emit(FriendsSortFeRtnMessage, {
			sortType = "Carousel",
			messageId = p1.rtnMessageId,
			userId = tonumber(p1.localUserId),
			friendIds = table.concat(List, ",")
		})
	end
end