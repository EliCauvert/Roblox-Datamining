local _ = require(script.Parent.networkingFriendsTypes)
local networkRequests = script.Parent.networkRequests
local createGetFriendsFromUserIdModule = require(networkRequests.createGetFriendsFromUserId)
local createFindFriendsFromUserIdModule = require(networkRequests.createFindFriendsFromUserId)
local createSearchFriendsByQueryModule = require(networkRequests.createSearchFriendsByQuery)
local createGetFriendRequestsCountModule = require(networkRequests.createGetFriendRequestsCount)
local createUnfriendTargetUserIdModule = require(networkRequests.createUnfriendTargetUserId)
local createGetFriendRequestsModule = require(networkRequests.createGetFriendRequests)
local createAcceptFriendRequestFromUserIdModule = require(networkRequests.createAcceptFriendRequestFromUserId)
local createDeclineFriendRequestFromUserIdModule = require(networkRequests.createDeclineFriendRequestFromUserId)
local createDeclineAllFriendRequestsModule = require(networkRequests.createDeclineAllFriendRequests)
local createGetFriendsCountFromUserIdModule = require(networkRequests.createGetFriendsCountFromUserId)
local createGetInactiveFriendsModule = require(networkRequests.createGetInactiveFriends)
local createRequestFriendshipFromUserIdModule = require(networkRequests.createRequestFriendshipFromUserId)
local createRequestFriendshipFromContactIdModule = require(networkRequests.createRequestFriendshipFromContactId)
local createGetFollowingExistsModule = require(networkRequests.createGetFollowingExists)
local createGetUserFollowersModule = require(networkRequests.createGetUserFollowers)
local createGetFriendRecommendationsFromUserIdModule = require(networkRequests.createGetFriendRecommendationsFromUserId)
local createGetFriendshipStatusModule = require(networkRequests.createGetFriendshipStatus)
local createGetExtendedFriendshipStatusModule = require(networkRequests.createGetExtendedFriendshipStatus)
local createAcceptFriendRequestWithTokenModule = require(networkRequests.createAcceptFriendRequestWithToken)
local createGetFollowersCountModule = require(networkRequests.createGetFollowersCount)
local createGetFollowingsCountModule = require(networkRequests.createGetFollowingsCount)
local createValidateFriendRequestNicknameModule = require(networkRequests.createValidateFriendRequestNickname)

return function(p1)
	-- upvalues: createGetFriendsFromUserIdModule (ref), createFindFriendsFromUserIdModule (ref), createSearchFriendsByQueryModule (ref), createGetFriendRequestsCountModule (ref), createUnfriendTargetUserIdModule (ref), createGetFriendRequestsModule (ref), createAcceptFriendRequestFromUserIdModule (ref), createDeclineFriendRequestFromUserIdModule (ref), createDeclineAllFriendRequestsModule (ref), createGetFriendsCountFromUserIdModule (ref), createGetInactiveFriendsModule (ref), createRequestFriendshipFromUserIdModule (ref), createRequestFriendshipFromContactIdModule (ref), createGetFollowingExistsModule (ref), createGetUserFollowersModule (ref), createGetFriendRecommendationsFromUserIdModule (ref), createGetFriendshipStatusModule (ref), createGetExtendedFriendshipStatusModule (ref), createAcceptFriendRequestWithTokenModule (ref), createGetFollowersCountModule (ref), createGetFollowingsCountModule (ref), createValidateFriendRequestNicknameModule (ref)
	return {
		GetFriendsFromUserId = createGetFriendsFromUserIdModule(p1),
		FindFriendsFromUserId = createFindFriendsFromUserIdModule(p1),
		SearchFriendsByQuery = createSearchFriendsByQueryModule(p1),
		GetFriendRequestsCount = createGetFriendRequestsCountModule(p1),
		UnfriendTargetUserId = createUnfriendTargetUserIdModule(p1),
		GetFriendRequests = createGetFriendRequestsModule(p1),
		AcceptFriendRequestFromUserId = createAcceptFriendRequestFromUserIdModule(p1),
		DeclineFriendRequestFromUserId = createDeclineFriendRequestFromUserIdModule(p1),
		DeclineAllFriendRequests = createDeclineAllFriendRequestsModule(p1),
		GetFriendsCountFromUserId = createGetFriendsCountFromUserIdModule(p1),
		GetInactiveFriends = createGetInactiveFriendsModule(p1),
		RequestFriendshipFromUserId = createRequestFriendshipFromUserIdModule(p1),
		RequestFriendshipFromContactId = createRequestFriendshipFromContactIdModule(p1),
		GetFollowingExists = createGetFollowingExistsModule(p1),
		GetUserFollowers = createGetUserFollowersModule(p1),
		GetFriendRecommendationsFromUserId = createGetFriendRecommendationsFromUserIdModule(p1),
		GetFriendshipStatus = createGetFriendshipStatusModule(p1),
		GetExtendedFriendshipStatus = createGetExtendedFriendshipStatusModule(p1),
		AcceptFriendRequestWithToken = createAcceptFriendRequestWithTokenModule(p1),
		GetFollowersCount = createGetFollowersCountModule(p1),
		GetFollowingsCount = createGetFollowingsCountModule(p1),
		ValidateFriendRequestNickname = createValidateFriendRequestNicknameModule(p1)
	}
end