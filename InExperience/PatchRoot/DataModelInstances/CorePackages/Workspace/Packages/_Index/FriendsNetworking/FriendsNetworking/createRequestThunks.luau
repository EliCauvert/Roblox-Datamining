local _ = require(script.Parent.networkingFriendsTypes)
local networkRequests = script.Parent.networkRequests
local createGetFriendsFromUserIdModule = require(networkRequests.createGetFriendsFromUserId)
local createFindFriendsFromUserIdModule = require(networkRequests.createFindFriendsFromUserId)
local createSearchFriendsByQueryModule = require(networkRequests.createSearchFriendsByQuery)
local createGetFriendRequestsCountModule = require(networkRequests.createGetFriendRequestsCount)
local createGetNewFriendRequestsCountModule = require(networkRequests.createGetNewFriendRequestsCount)
local createUnfriendTargetUserIdModule = require(networkRequests.createUnfriendTargetUserId)
local createGetFriendRequestsModule = require(networkRequests.createGetFriendRequests)
local createAcceptFriendRequestFromUserIdModule = require(networkRequests.createAcceptFriendRequestFromUserId)
local createDeclineFriendRequestFromUserIdModule = require(networkRequests.createDeclineFriendRequestFromUserId)
local createDeclineAllFriendRequestsModule = require(networkRequests.createDeclineAllFriendRequests)
local createClearNewFriendRequestsModule = require(networkRequests.createClearNewFriendRequests)
local createGetFriendsCountFromUserIdModule = require(networkRequests.createGetFriendsCountFromUserId)
local createGetInactiveFriendsModule = require(networkRequests.createGetInactiveFriends)
local createRequestFriendshipFromUserIdModule = require(networkRequests.createRequestFriendshipFromUserId)
local createRequestFriendshipFromContactIdModule = require(networkRequests.createRequestFriendshipFromContactId)
local createGetFollowingExistsModule = require(networkRequests.createGetFollowingExists)
local createGetUserFollowersModule = require(networkRequests.createGetUserFollowers)
local createGetFriendRecommendationsFromUserIdModule = require(networkRequests.createGetFriendRecommendationsFromUserId)
local createGetFriendshipStatusModule = require(networkRequests.createGetFriendshipStatus)
local createGetFriendshipStatusesModule = require(networkRequests.createGetFriendshipStatuses)
local createGetExtendedFriendshipStatusModule = require(networkRequests.createGetExtendedFriendshipStatus)
local createAcceptFriendRequestWithTokenModule = require(networkRequests.createAcceptFriendRequestWithToken)
local createGetFollowersCountModule = require(networkRequests.createGetFollowersCount)
local createGetFollowingsCountModule = require(networkRequests.createGetFollowingsCount)
local createValidateFriendRequestNicknameModule = require(networkRequests.createValidateFriendRequestNickname)
local createRemoveTCModule = require(networkRequests.createRemoveTC)
local createSendTCRequestModule = require(networkRequests.createSendTCRequest)

return function(p1)
	-- upvalues: createGetFriendsFromUserIdModule (ref), createFindFriendsFromUserIdModule (ref), createSearchFriendsByQueryModule (ref), createGetFriendRequestsCountModule (ref), createGetNewFriendRequestsCountModule (ref), createUnfriendTargetUserIdModule (ref), createGetFriendRequestsModule (ref), createAcceptFriendRequestFromUserIdModule (ref), createDeclineFriendRequestFromUserIdModule (ref), createDeclineAllFriendRequestsModule (ref), createClearNewFriendRequestsModule (ref), createGetFriendsCountFromUserIdModule (ref), createGetInactiveFriendsModule (ref), createRequestFriendshipFromUserIdModule (ref), createRequestFriendshipFromContactIdModule (ref), createGetFollowingExistsModule (ref), createGetUserFollowersModule (ref), createGetFriendRecommendationsFromUserIdModule (ref), createGetFriendshipStatusModule (ref), createGetFriendshipStatusesModule (ref), createGetExtendedFriendshipStatusModule (ref), createAcceptFriendRequestWithTokenModule (ref), createGetFollowersCountModule (ref), createGetFollowingsCountModule (ref), createValidateFriendRequestNicknameModule (ref), createRemoveTCModule (ref), createSendTCRequestModule (ref)
	return {
		GetFriendsFromUserId = createGetFriendsFromUserIdModule(p1),
		FindFriendsFromUserId = createFindFriendsFromUserIdModule(p1),
		SearchFriendsByQuery = createSearchFriendsByQueryModule(p1),
		GetFriendRequestsCount = createGetFriendRequestsCountModule(p1),
		GetNewFriendRequestsCount = createGetNewFriendRequestsCountModule(p1),
		UnfriendTargetUserId = createUnfriendTargetUserIdModule(p1),
		GetFriendRequests = createGetFriendRequestsModule(p1),
		AcceptFriendRequestFromUserId = createAcceptFriendRequestFromUserIdModule(p1),
		DeclineFriendRequestFromUserId = createDeclineFriendRequestFromUserIdModule(p1),
		DeclineAllFriendRequests = createDeclineAllFriendRequestsModule(p1),
		ClearNewFriendRequests = createClearNewFriendRequestsModule(p1),
		GetFriendsCountFromUserId = createGetFriendsCountFromUserIdModule(p1),
		GetInactiveFriends = createGetInactiveFriendsModule(p1),
		RequestFriendshipFromUserId = createRequestFriendshipFromUserIdModule(p1),
		RequestFriendshipFromContactId = createRequestFriendshipFromContactIdModule(p1),
		GetFollowingExists = createGetFollowingExistsModule(p1),
		GetUserFollowers = createGetUserFollowersModule(p1),
		GetFriendRecommendationsFromUserId = createGetFriendRecommendationsFromUserIdModule(p1),
		GetFriendshipStatus = createGetFriendshipStatusModule(p1),
		GetFriendshipStatuses = createGetFriendshipStatusesModule(p1),
		GetExtendedFriendshipStatus = createGetExtendedFriendshipStatusModule(p1),
		AcceptFriendRequestWithToken = createAcceptFriendRequestWithTokenModule(p1),
		GetFollowersCount = createGetFollowersCountModule(p1),
		GetFollowingsCount = createGetFollowingsCountModule(p1),
		ValidateFriendRequestNickname = createValidateFriendRequestNicknameModule(p1),
		RemoveTC = createRemoveTCModule(p1),
		SendTCRequest = createSendTCRequestModule(p1)
	}
end