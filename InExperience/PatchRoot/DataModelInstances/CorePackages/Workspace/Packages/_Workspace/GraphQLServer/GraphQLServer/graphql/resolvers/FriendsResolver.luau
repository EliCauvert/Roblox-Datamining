local graphQLServer = script:FindFirstAncestor("GraphQLServer")
local parent = graphQLServer.Parent
local graphQLError = require(graphQLServer.Parent.GraphQL).GraphQLError
local _ = require(graphQLServer.graphql.generatedTypes)
local _ = require(parent.LuauPolyfill)
local friendsConnectorModule = require(graphQLServer.graphql.connectors.FriendsConnector)
local getAllFriendsByUserId = friendsConnectorModule.getAllFriendsByUserId
local getOnlineFriendsByUserId = friendsConnectorModule.getOnlineFriendsByUserId

local function _(p1)
	return if p1 then tostring(p1) else ""
end

return {
	UserPresence = {
		id = function(p1)
			return p1.id
		end,
		userPresenceType = function(p1)
			return p1.userPresence.UserPresenceType
		end,
		gameId = function(p1)
			local gameInstanceId = p1.userPresence.gameInstanceId
			
			return if gameInstanceId then tostring(gameInstanceId) else ""
		end,
		placeId = function(p1)
			local placeId = p1.userPresence.placeId
			
			return if placeId then tostring(placeId) else ""
		end,
		rootPlaceId = function(p1)
			local rootPlaceId = p1.userPresence.rootPlaceId
			
			return if rootPlaceId then tostring(rootPlaceId) else ""
		end,
		universeId = function(p1)
			local universeId = p1.userPresence.universeId
			
			return if universeId then tostring(universeId) else ""
		end,
		lastLocation = function(p1)
			return p1.userPresence.lastLocation
		end,
		lastOnline = function(p1)
			return p1.userPresence.lastOnline
		end
	},
	Friend = {
		targetUserId = function(_, _, _, p1)
			return p1.variableValues.userId
		end,
		displayName = function()
			-- upvalues: graphQLError (ref)
			return graphQLError.new("The displayName field is being deprecated, please use UserProfile to retrieve names")
		end,
		presence = function(p1)
			return p1
		end,
		hasVerifiedBadge = function(_)
			return false
		end,
		sortScore = function(p1)
			return p1.sortScore or 0
		end
	},
	AllFriendsPage = {
		targetUserId = function(_, _, _, p1)
			return p1.variableValues.userId
		end,
		curCursor = function(_, _, _, p1)
			return p1.variableValues.pageCursor or ""
		end,
		nextCursor = function(p1)
			return p1.NextCursor or ""
		end,
		prevCursor = function(p1)
			return p1.PreviousCursor or ""
		end,
		friends = function(p1)
			return p1.PageItems or {}
		end
	},
	Query = {
		allFriendsByUserId = function(_, p1, p2)
			-- upvalues: getAllFriendsByUserId (ref)
			return getAllFriendsByUserId(p1, p2.fetchImpl)
		end,
		onlineFriendsByUserId = function(_, p1, p2)
			-- upvalues: getOnlineFriendsByUserId (ref)
			return getOnlineFriendsByUserId(p1, p2.fetchImpl)
		end
	}
}