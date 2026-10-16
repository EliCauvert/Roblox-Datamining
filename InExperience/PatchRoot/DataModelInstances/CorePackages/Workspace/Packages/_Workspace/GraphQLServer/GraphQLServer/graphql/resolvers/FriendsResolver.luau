local GraphQLServer = script:FindFirstAncestor("GraphQLServer")
local GraphQLError = require(GraphQLServer.Parent.GraphQL).GraphQLError
local _ = require(GraphQLServer.graphql.generatedTypes)
local _ = require(GraphQLServer.Parent.LuauPolyfill)
local FriendsConnectorModule = require(GraphQLServer.graphql.connectors.FriendsConnector)
local GetAllFriendsByUserIdFunction = FriendsConnectorModule.getAllFriendsByUserId
local GetOnlineFriendsByUserIdFunction = FriendsConnectorModule.getOnlineFriendsByUserId

local function _(p1): string --[[ Line: 20 | Named "convertToStringWithDefault" ]]
	return if p1 then tostring(p1) else ""
end

return {
	UserPresence = {
		id = function(p1) --[[ Line: 26 ]]
			return p1.id
		end,
		userPresenceType = function(p1) --[[ Line: 29 ]]
			return p1.userPresence.UserPresenceType
		end,
		gameId = function(p1): string --[[ Line: 32 ]]
			local GameInstanceId = p1.userPresence.gameInstanceId
			
			return if GameInstanceId then tostring(GameInstanceId) else ""
		end,
		placeId = function(p1): string --[[ Line: 35 ]]
			local PlaceId = p1.userPresence.placeId
			
			return if PlaceId then tostring(PlaceId) else ""
		end,
		rootPlaceId = function(p1): string --[[ Line: 38 ]]
			local RootPlaceId = p1.userPresence.rootPlaceId
			
			return if RootPlaceId then tostring(RootPlaceId) else ""
		end,
		universeId = function(p1): string --[[ Line: 41 ]]
			local UniverseId = p1.userPresence.universeId
			
			return if UniverseId then tostring(UniverseId) else ""
		end,
		lastLocation = function(p1) --[[ Line: 44 ]]
			return p1.userPresence.lastLocation
		end,
		lastOnline = function(p1) --[[ Line: 47 ]]
			return p1.userPresence.lastOnline
		end
	},
	Friend = {
		targetUserId = function(_, _, _, p1) --[[ Line: 52 ]]
			return p1.variableValues.userId
		end,
		displayName = function() --[[ Line: 55 ]]
			-- upvalues: GraphQLError (copy)
			return GraphQLError.new("The displayName field is being deprecated, please use UserProfile to retrieve names")
		end,
		presence = function(p1) --[[ Line: 60 ]]
			return p1
		end,
		hasVerifiedBadge = function(_): boolean --[[ Line: 63 ]]
			return false
		end,
		sortScore = function(p1) --[[ Line: 66 ]]
			return p1.sortScore or 0
		end
	},
	AllFriendsPage = {
		targetUserId = function(_, _, _, p1) --[[ Line: 71 ]]
			return p1.variableValues.userId
		end,
		curCursor = function(_, _, _, p1) --[[ Line: 74 ]]
			return p1.variableValues.pageCursor or ""
		end,
		nextCursor = function(p1) --[[ Line: 77 ]]
			return p1.NextCursor or ""
		end,
		prevCursor = function(p1) --[[ Line: 80 ]]
			return p1.PreviousCursor or ""
		end,
		friends = function(p1) --[[ Line: 83 ]]
			return p1.PageItems or {}
		end
	},
	Query = {
		allFriendsByUserId = function(_, p1, p2) --[[ Line: 88 ]]
			-- upvalues: GetAllFriendsByUserIdFunction (copy)
			return GetAllFriendsByUserIdFunction(p1, p2.fetchImpl)
		end,
		onlineFriendsByUserId = function(_, p1, p2) --[[ Line: 91 ]]
			-- upvalues: GetOnlineFriendsByUserIdFunction (copy)
			return GetOnlineFriendsByUserIdFunction(p1, p2.fetchImpl)
		end
	}
}