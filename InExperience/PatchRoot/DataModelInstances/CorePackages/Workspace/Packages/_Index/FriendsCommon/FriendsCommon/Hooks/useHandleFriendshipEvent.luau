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

return function()
	-- upvalues: useLocalUserId (ref), fFlagFriendSortedByPresenceSignalsImplementation (ref), useApolloClient (ref), useQuery (ref), queries (ref), userIdExists (ref), apolloFriendsModule (ref), reactModule (ref), handleFriendshipEventModule (ref)
	local var1 = useLocalUserId()
	local var2 = if fFlagFriendSortedByPresenceSignalsImplementation then nil else useApolloClient()
	local var3 = if fFlagFriendSortedByPresenceSignalsImplementation then nil else useQuery(queries.onlineFriendsByUserId, {
		notifyOnNetworkStatusChange = true,
		skip = not userIdExists(var1),
		variables = {
			userId = var1,
			sort = apolloFriendsModule.Enums.Sort.FriendshipScore
		}
	})
	
	return reactModule.useCallback(function(p1)
		-- upvalues: handleFriendshipEventModule (copy), var1 (ref), fFlagFriendSortedByPresenceSignalsImplementation (copy), var3 (ref), var2 (ref)
		handleFriendshipEventModule({
			localUserId = var1,
			onlineFriendsRef = if fFlagFriendSortedByPresenceSignalsImplementation then nil else var3,
			apolloClient = if fFlagFriendSortedByPresenceSignalsImplementation then nil else var2,
			friendshipUpdate = p1
		})
	end, {
		if fFlagFriendSortedByPresenceSignalsImplementation then nil else var3
	})
end