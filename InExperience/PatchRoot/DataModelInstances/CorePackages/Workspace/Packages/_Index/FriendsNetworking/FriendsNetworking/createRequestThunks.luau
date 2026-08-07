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

return function(p0) --[[ line: 37 ]]
	-- upvalues: createGetFriendsFromUserIdModule (ref), createFindFriendsFromUserIdModule (ref), createSearchFriendsByQueryModule (ref), createGetFriendRequestsCountModule (ref), createGetNewFriendRequestsCountModule (ref), createUnfriendTargetUserIdModule (ref), createGetFriendRequestsModule (ref), createAcceptFriendRequestFromUserIdModule (ref), createDeclineFriendRequestFromUserIdModule (ref), createDeclineAllFriendRequestsModule (ref), createClearNewFriendRequestsModule (ref), createGetFriendsCountFromUserIdModule (ref), createGetInactiveFriendsModule (ref), createRequestFriendshipFromUserIdModule (ref), createRequestFriendshipFromContactIdModule (ref), createGetFollowingExistsModule (ref), createGetUserFollowersModule (ref), createGetFriendRecommendationsFromUserIdModule (ref), createGetFriendshipStatusModule (ref), createGetFriendshipStatusesModule (ref), createGetExtendedFriendshipStatusModule (ref), createAcceptFriendRequestWithTokenModule (ref), createGetFollowersCountModule (ref), createGetFollowingsCountModule (ref), createValidateFriendRequestNicknameModule (ref), createRemoveTCModule (ref), createSendTCRequestModule (ref)
	return {
		GetFriendsFromUserId = createGetFriendsFromUserIdModule(p0),
		FindFriendsFromUserId = createFindFriendsFromUserIdModule(p0),
		SearchFriendsByQuery = createSearchFriendsByQueryModule(p0),
		GetFriendRequestsCount = createGetFriendRequestsCountModule(p0),
		GetNewFriendRequestsCount = createGetNewFriendRequestsCountModule(p0),
		UnfriendTargetUserId = createUnfriendTargetUserIdModule(p0),
		GetFriendRequests = createGetFriendRequestsModule(p0),
		AcceptFriendRequestFromUserId = createAcceptFriendRequestFromUserIdModule(p0),
		DeclineFriendRequestFromUserId = createDeclineFriendRequestFromUserIdModule(p0),
		DeclineAllFriendRequests = createDeclineAllFriendRequestsModule(p0),
		ClearNewFriendRequests = createClearNewFriendRequestsModule(p0),
		GetFriendsCountFromUserId = createGetFriendsCountFromUserIdModule(p0),
		GetInactiveFriends = createGetInactiveFriendsModule(p0),
		RequestFriendshipFromUserId = createRequestFriendshipFromUserIdModule(p0),
		RequestFriendshipFromContactId = createRequestFriendshipFromContactIdModule(p0),
		GetFollowingExists = createGetFollowingExistsModule(p0),
		GetUserFollowers = createGetUserFollowersModule(p0),
		GetFriendRecommendationsFromUserId = createGetFriendRecommendationsFromUserIdModule(p0),
		GetFriendshipStatus = createGetFriendshipStatusModule(p0),
		GetFriendshipStatuses = createGetFriendshipStatusesModule(p0),
		GetExtendedFriendshipStatus = createGetExtendedFriendshipStatusModule(p0),
		AcceptFriendRequestWithToken = createAcceptFriendRequestWithTokenModule(p0),
		GetFollowersCount = createGetFollowersCountModule(p0),
		GetFollowingsCount = createGetFollowingsCountModule(p0),
		ValidateFriendRequestNickname = createValidateFriendRequestNicknameModule(p0),
		RemoveTC = createRemoveTCModule(p0),
		SendTCRequest = createSendTCRequestModule(p0)
	}
end