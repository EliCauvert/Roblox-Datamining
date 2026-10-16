local FriendsCommon = script:FindFirstAncestor("FriendsCommon")
local Parent = FriendsCommon.Parent
local ReactModule = require(Parent.React)
local ApolloFriendsModule = require(Parent.ApolloFriends)
local Queries = require(Parent.ApolloLocalState).queries
local UserIdExistsFunction = require(Parent.SocialCommon).Utils.userIdExists
local ApolloClientModule = require(Parent.ApolloClient)
local UseQueryFunction = ApolloClientModule.useQuery
local UseApolloClientFunction = ApolloClientModule.useApolloClient
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local HandleFriendshipEventModule = require(FriendsCommon.EventHandlers.handleFriendshipEvent)
local FFlagFriendSortedByPresenceSignalsImplementation = require(Parent.SharedFlags).FFlagFriendSortedByPresenceSignalsImplementation

return function() --[[ Line: 25 | Named "useHandleFriendshipEvent" ]]
	-- upvalues: UseLocalUserIdFunction (copy), FFlagFriendSortedByPresenceSignalsImplementation (copy), UseApolloClientFunction (copy), UseQueryFunction (copy), Queries (copy), UserIdExistsFunction (copy), ApolloFriendsModule (copy), ReactModule (copy), HandleFriendshipEventModule (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseApolloClientResult = if FFlagFriendSortedByPresenceSignalsImplementation then nil else UseApolloClientFunction()
	local UseQueryResult = if FFlagFriendSortedByPresenceSignalsImplementation then nil else UseQueryFunction(Queries.onlineFriendsByUserId, {
		notifyOnNetworkStatusChange = true,
		skip = not UserIdExistsFunction(UseLocalUserIdResult),
		variables = {
			userId = UseLocalUserIdResult,
			sort = ApolloFriendsModule.Enums.Sort.FriendshipScore
		}
	})
	
	return (ReactModule.useCallback(function(FriendshipUpdate) --[[ Line: 41 ]]
		-- upvalues: HandleFriendshipEventModule (upval), UseLocalUserIdResult (copy), FFlagFriendSortedByPresenceSignalsImplementation (upval), UseQueryResult (copy), UseApolloClientResult (copy)
		HandleFriendshipEventModule({
			localUserId = UseLocalUserIdResult,
			onlineFriendsRef = if FFlagFriendSortedByPresenceSignalsImplementation then nil else UseQueryResult,
			apolloClient = if FFlagFriendSortedByPresenceSignalsImplementation then nil else UseApolloClientResult,
			friendshipUpdate = FriendshipUpdate
		})
	end, {
		if FFlagFriendSortedByPresenceSignalsImplementation then nil else UseQueryResult
	}))
end