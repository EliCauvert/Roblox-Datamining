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
local handlePresenceEventWithScoresModule = require(friendsCommon.EventHandlers.handlePresenceEventWithScores)

return function()
	-- upvalues: useLocalUserId (ref), useApolloClient (ref), useQuery (ref), queries (ref), userIdExists (ref), apolloFriendsModule (ref), reactModule (ref), handlePresenceEventWithScoresModule (ref)
	local var1 = useLocalUserId()
	local var2 = useApolloClient()
	local var3 = useQuery(queries.onlineFriendsByUserId, {
		notifyOnNetworkStatusChange = true,
		skip = not userIdExists(var1),
		variables = {
			userId = var1,
			sort = apolloFriendsModule.Enums.Sort.FriendshipScore
		}
	})
	
	return {
		handleNewEvent = reactModule.useCallback(function(p1, p2, p3)
			-- upvalues: handlePresenceEventWithScoresModule (copy), var1 (ref), var2 (ref), var3 (ref)
			handlePresenceEventWithScoresModule({
				localUserId = var1,
				apolloClient = var2,
				onlineFriendsRef = var3,
				updatedPresences = p1,
				updatedSortScores = p2,
				rtnMessageId = p3
			})
		end, { var1, var2, var3 }),
		refetchOnlineFriends = reactModule.useCallback(function()
			-- upvalues: var3 (ref)
			return var3.refetch()
		end, { var3 })
	}
end