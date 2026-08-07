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

return function() --[[ line: 38 | named "useHandlePresenceEvent" ]]
	-- upvalues: useLocalUserId (ref), useApolloClient (ref), useQuery (ref), queries (ref), userIdExists (ref), apolloFriendsModule (ref), reactModule (ref), handlePresenceEventWithScoresModule (ref)
	local var5 = useLocalUserId()
	local var6 = useApolloClient()
	local var7 = useQuery(queries.onlineFriendsByUserId, {
		notifyOnNetworkStatusChange = true,
		skip = not userIdExists(var5),
		variables = {
			userId = var5,
			sort = apolloFriendsModule.Enums.Sort.FriendshipScore
		}
	})
	
	return {
		handleNewEvent = reactModule.useCallback(function(p0, p1, p2) --[[ line: 52 ]]
			-- upvalues: handlePresenceEventWithScoresModule (copy), var5 (ref), var6 (ref), var7 (ref)
			handlePresenceEventWithScoresModule({
				localUserId = var5,
				apolloClient = var6,
				onlineFriendsRef = var7,
				updatedPresences = p0,
				updatedSortScores = p1,
				rtnMessageId = p2
			})
		end, { var5, var6, var7 }),
		refetchOnlineFriends = reactModule.useCallback(function() --[[ line: 63 ]]
			-- upvalues: var7 (ref)
			return var7.refetch()
		end, { var7 })
	}
end