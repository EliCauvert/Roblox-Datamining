local _ = require(script.Parent.networkingFriendsTypes)
local NetworkRequests = script.Parent.networkRequests
local CreateGetFriendsFromUserIdModule = require(NetworkRequests.createGetFriendsFromUserId)
local CreateFindFriendsFromUserIdModule = require(NetworkRequests.createFindFriendsFromUserId)
local CreateSearchFriendsByQueryModule = require(NetworkRequests.createSearchFriendsByQuery)
local CreateGetFriendRequestsCountModule = require(NetworkRequests.createGetFriendRequestsCount)
local CreateGetNewFriendRequestsCountModule = require(NetworkRequests.createGetNewFriendRequestsCount)
local CreateUnfriendTargetUserIdModule = require(NetworkRequests.createUnfriendTargetUserId)
local CreateGetFriendRequestsModule = require(NetworkRequests.createGetFriendRequests)
local CreateAcceptFriendRequestFromUserIdModule = require(NetworkRequests.createAcceptFriendRequestFromUserId)
local CreateDeclineFriendRequestFromUserIdModule = require(NetworkRequests.createDeclineFriendRequestFromUserId)
local CreateDeclineAllFriendRequestsModule = require(NetworkRequests.createDeclineAllFriendRequests)
local CreateClearNewFriendRequestsModule = require(NetworkRequests.createClearNewFriendRequests)
local CreateGetFriendsCountFromUserIdModule = require(NetworkRequests.createGetFriendsCountFromUserId)
local CreateGetInactiveFriendsModule = require(NetworkRequests.createGetInactiveFriends)
local CreateRequestFriendshipFromUserIdModule = require(NetworkRequests.createRequestFriendshipFromUserId)
local CreateRequestFriendshipFromContactIdModule = require(NetworkRequests.createRequestFriendshipFromContactId)
local CreateGetFollowingExistsModule = require(NetworkRequests.createGetFollowingExists)
local CreateGetUserFollowersModule = require(NetworkRequests.createGetUserFollowers)
local CreateGetFriendRecommendationsFromUserIdModule = require(NetworkRequests.createGetFriendRecommendationsFromUserId)
local CreateGetFriendshipStatusModule = require(NetworkRequests.createGetFriendshipStatus)
local CreateGetFriendshipStatusesModule = require(NetworkRequests.createGetFriendshipStatuses)
local CreateGetExtendedFriendshipStatusModule = require(NetworkRequests.createGetExtendedFriendshipStatus)
local CreateAcceptFriendRequestWithTokenModule = require(NetworkRequests.createAcceptFriendRequestWithToken)
local CreateGetFollowersCountModule = require(NetworkRequests.createGetFollowersCount)
local CreateGetFollowingsCountModule = require(NetworkRequests.createGetFollowingsCount)
local CreateValidateFriendRequestNicknameModule = require(NetworkRequests.createValidateFriendRequestNickname)
local CreateRemoveTCModule = require(NetworkRequests.createRemoveTC)
local CreateSendTCRequestModule = require(NetworkRequests.createSendTCRequest)

return function(p1)
	-- upvalues: CreateGetFriendsFromUserIdModule (copy), CreateFindFriendsFromUserIdModule (copy), CreateSearchFriendsByQueryModule (copy), CreateGetFriendRequestsCountModule (copy), CreateGetNewFriendRequestsCountModule (copy), CreateUnfriendTargetUserIdModule (copy), CreateGetFriendRequestsModule (copy), CreateAcceptFriendRequestFromUserIdModule (copy), CreateDeclineFriendRequestFromUserIdModule (copy), CreateDeclineAllFriendRequestsModule (copy), CreateClearNewFriendRequestsModule (copy), CreateGetFriendsCountFromUserIdModule (copy), CreateGetInactiveFriendsModule (copy), CreateRequestFriendshipFromUserIdModule (copy), CreateRequestFriendshipFromContactIdModule (copy), CreateGetFollowingExistsModule (copy), CreateGetUserFollowersModule (copy), CreateGetFriendRecommendationsFromUserIdModule (copy), CreateGetFriendshipStatusModule (copy), CreateGetFriendshipStatusesModule (copy), CreateGetExtendedFriendshipStatusModule (copy), CreateAcceptFriendRequestWithTokenModule (copy), CreateGetFollowersCountModule (copy), CreateGetFollowingsCountModule (copy), CreateValidateFriendRequestNicknameModule (copy), CreateRemoveTCModule (copy), CreateSendTCRequestModule (copy)
	return {
		GetFriendsFromUserId = CreateGetFriendsFromUserIdModule(p1),
		FindFriendsFromUserId = CreateFindFriendsFromUserIdModule(p1),
		SearchFriendsByQuery = CreateSearchFriendsByQueryModule(p1),
		GetFriendRequestsCount = CreateGetFriendRequestsCountModule(p1),
		GetNewFriendRequestsCount = CreateGetNewFriendRequestsCountModule(p1),
		UnfriendTargetUserId = CreateUnfriendTargetUserIdModule(p1),
		GetFriendRequests = CreateGetFriendRequestsModule(p1),
		AcceptFriendRequestFromUserId = CreateAcceptFriendRequestFromUserIdModule(p1),
		DeclineFriendRequestFromUserId = CreateDeclineFriendRequestFromUserIdModule(p1),
		DeclineAllFriendRequests = CreateDeclineAllFriendRequestsModule(p1),
		ClearNewFriendRequests = CreateClearNewFriendRequestsModule(p1),
		GetFriendsCountFromUserId = CreateGetFriendsCountFromUserIdModule(p1),
		GetInactiveFriends = CreateGetInactiveFriendsModule(p1),
		RequestFriendshipFromUserId = CreateRequestFriendshipFromUserIdModule(p1),
		RequestFriendshipFromContactId = CreateRequestFriendshipFromContactIdModule(p1),
		GetFollowingExists = CreateGetFollowingExistsModule(p1),
		GetUserFollowers = CreateGetUserFollowersModule(p1),
		GetFriendRecommendationsFromUserId = CreateGetFriendRecommendationsFromUserIdModule(p1),
		GetFriendshipStatus = CreateGetFriendshipStatusModule(p1),
		GetFriendshipStatuses = CreateGetFriendshipStatusesModule(p1),
		GetExtendedFriendshipStatus = CreateGetExtendedFriendshipStatusModule(p1),
		AcceptFriendRequestWithToken = CreateAcceptFriendRequestWithTokenModule(p1),
		GetFollowersCount = CreateGetFollowersCountModule(p1),
		GetFollowingsCount = CreateGetFollowingsCountModule(p1),
		ValidateFriendRequestNickname = CreateValidateFriendRequestNicknameModule(p1),
		RemoveTC = CreateRemoveTCModule(p1),
		SendTCRequest = CreateSendTCRequestModule(p1)
	}
end