local friendsCommon = script:FindFirstAncestor("FriendsCommon")
local parent = friendsCommon.Parent
local reactModule = require(parent.React)
local apolloFriendsModule = require(parent.ApolloFriends)
local queries = require(parent.ApolloLocalState).queries
local userIdExists = require(parent.SocialCommon).Utils.userIdExists
local apolloClientModule = require(parent.ApolloClient)
local useQuery = apolloClientModule.useQuery
local useApolloClient = apolloClientModule.useApolloClient
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local handleFriendshipEventModule = require(friendsCommon.EventHandlers.handleFriendshipEvent)
local fFlagFriendSortedByPresenceSignalsImplementation = require(parent.SharedFlags).FFlagFriendSortedByPresenceSignalsImplementation

return function() --[[ line: 25 | named "useHandleFriendshipEvent" ]]
	-- upvalues: useLocalUserId (ref), fFlagFriendSortedByPresenceSignalsImplementation (ref), useApolloClient (ref), useQuery (ref), queries (ref), userIdExists (ref), apolloFriendsModule (ref), reactModule (ref), handleFriendshipEventModule (ref)
	local var5 = useLocalUserId()
	local var6 = if fFlagFriendSortedByPresenceSignalsImplementation then nil else useApolloClient()
	local var7 = if fFlagFriendSortedByPresenceSignalsImplementation then nil else useQuery(queries.onlineFriendsByUserId, {
		notifyOnNetworkStatusChange = true,
		skip = not userIdExists(var5),
		variables = {
			userId = var5,
			sort = apolloFriendsModule.Enums.Sort.FriendshipScore
		}
	})
	
	return reactModule.useCallback(function(p0) --[[ line: 41 ]]
		-- upvalues: handleFriendshipEventModule (copy), var5 (ref), fFlagFriendSortedByPresenceSignalsImplementation (copy), var7 (ref), var6 (ref)
		handleFriendshipEventModule({
			localUserId = var5,
			onlineFriendsRef = if fFlagFriendSortedByPresenceSignalsImplementation then nil else var7,
			apolloClient = if fFlagFriendSortedByPresenceSignalsImplementation then nil else var6,
			friendshipUpdate = p0
		})
	end, {
		if fFlagFriendSortedByPresenceSignalsImplementation then nil else var7
	})
end