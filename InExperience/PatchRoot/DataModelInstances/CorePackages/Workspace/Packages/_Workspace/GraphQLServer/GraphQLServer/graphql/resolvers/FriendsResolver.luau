local graphQLServer = script:FindFirstAncestor("GraphQLServer")
local parent = graphQLServer.Parent
local graphQLError = require(graphQLServer.Parent.GraphQL).GraphQLError
local _ = require(graphQLServer.graphql.generatedTypes)
local _ = require(parent.LuauPolyfill)
local friendsConnectorModule = require(graphQLServer.graphql.connectors.FriendsConnector)
local getAllFriendsByUserId = friendsConnectorModule.getAllFriendsByUserId
local getOnlineFriendsByUserId = friendsConnectorModule.getOnlineFriendsByUserId

local function _(p0)
	return if p0 then tostring(p0) else ""
end

return {
	UserPresence = {
		id = function(p1)
			return p1.id
		end,
		userPresenceType = function(p2)
			return p2.userPresence.UserPresenceType
		end,
		gameId = function(p3)
			local gameInstanceId = p3.userPresence.gameInstanceId
			
			return if gameInstanceId then tostring(gameInstanceId) else ""
		end,
		placeId = function(p4)
			local placeId = p4.userPresence.placeId
			
			return if placeId then tostring(placeId) else ""
		end,
		rootPlaceId = function(p5)
			local rootPlaceId = p5.userPresence.rootPlaceId
			
			return if rootPlaceId then tostring(rootPlaceId) else ""
		end,
		universeId = function(p6)
			local universeId = p6.userPresence.universeId
			
			return if universeId then tostring(universeId) else ""
		end,
		lastLocation = function(p7)
			return p7.userPresence.lastLocation
		end,
		lastOnline = function(p8)
			return p8.userPresence.lastOnline
		end
	},
	Friend = {
		targetUserId = function(_, _, _, p9)
			return p9.variableValues.userId
		end,
		displayName = function()
			-- upvalues: graphQLError (ref)
			return graphQLError.new("The displayName field is being deprecated, please use UserProfile to retrieve names")
		end,
		presence = function(p10)
			return p10
		end,
		hasVerifiedBadge = function(_)
			return false
		end,
		sortScore = function(p11)
			return p11.sortScore or 0
		end
	},
	AllFriendsPage = {
		targetUserId = function(_, _, _, p12)
			return p12.variableValues.userId
		end,
		curCursor = function(_, _, _, p13)
			return p13.variableValues.pageCursor or ""
		end,
		nextCursor = function(p14)
			return p14.NextCursor or ""
		end,
		prevCursor = function(p15)
			return p15.PreviousCursor or ""
		end,
		friends = function(p16)
			return p16.PageItems or {}
		end
	},
	Query = {
		allFriendsByUserId = function(_, p17, p18)
			-- upvalues: getAllFriendsByUserId (ref)
			return getAllFriendsByUserId(p17, p18.fetchImpl)
		end,
		onlineFriendsByUserId = function(_, p19, p20)
			-- upvalues: getOnlineFriendsByUserId (ref)
			return getOnlineFriendsByUserId(p19, p20.fetchImpl)
		end
	}
}