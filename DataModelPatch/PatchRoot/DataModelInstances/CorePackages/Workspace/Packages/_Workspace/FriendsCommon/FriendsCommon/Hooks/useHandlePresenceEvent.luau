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
local HandlePresenceEventWithScoresModule = require(FriendsCommon.EventHandlers.handlePresenceEventWithScores)

return function()
	-- upvalues: UseLocalUserIdFunction (copy), UseApolloClientFunction (copy), UseQueryFunction (copy), Queries (copy), UserIdExistsFunction (copy), ApolloFriendsModule (copy), ReactModule (copy), HandlePresenceEventWithScoresModule (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseApolloClientResult = UseApolloClientFunction()
	local UseQueryResult = UseQueryFunction(Queries.onlineFriendsByUserId, {
		notifyOnNetworkStatusChange = true,
		skip = not UserIdExistsFunction(UseLocalUserIdResult),
		variables = {
			userId = UseLocalUserIdResult,
			sort = ApolloFriendsModule.Enums.Sort.FriendshipScore
		}
	})
	
	return {
		handleNewEvent = ReactModule.useCallback(function(UpdatedPresences, UpdatedSortScores, RtnMessageId)
			-- upvalues: HandlePresenceEventWithScoresModule (upval), UseLocalUserIdResult (copy), UseApolloClientResult (copy), UseQueryResult (copy)
			HandlePresenceEventWithScoresModule({
				localUserId = UseLocalUserIdResult,
				apolloClient = UseApolloClientResult,
				onlineFriendsRef = UseQueryResult,
				updatedPresences = UpdatedPresences,
				updatedSortScores = UpdatedSortScores,
				rtnMessageId = RtnMessageId
			})
		end, {
			UseLocalUserIdResult,
			UseApolloClientResult,
			UseQueryResult
		}),
		refetchOnlineFriends = ReactModule.useCallback(function()
			-- upvalues: UseQueryResult (copy)
			return UseQueryResult.refetch()
		end, { UseQueryResult })
	}
end