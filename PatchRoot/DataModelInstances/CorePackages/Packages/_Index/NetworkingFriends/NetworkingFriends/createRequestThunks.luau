-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:53 2026 Pacific Standard Time.

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

return function(p0) --[[ line: 32 ]]
	-- upvalues: createGetFriendsFromUserIdModule (ref), createFindFriendsFromUserIdModule (ref), createSearchFriendsByQueryModule (ref), createGetFriendRequestsCountModule (ref), createUnfriendTargetUserIdModule (ref), createGetFriendRequestsModule (ref), createAcceptFriendRequestFromUserIdModule (ref), createDeclineFriendRequestFromUserIdModule (ref), createDeclineAllFriendRequestsModule (ref), createGetFriendsCountFromUserIdModule (ref), createGetInactiveFriendsModule (ref), createRequestFriendshipFromUserIdModule (ref), createRequestFriendshipFromContactIdModule (ref), createGetFollowingExistsModule (ref), createGetUserFollowersModule (ref), createGetFriendRecommendationsFromUserIdModule (ref), createGetFriendshipStatusModule (ref), createGetExtendedFriendshipStatusModule (ref), createAcceptFriendRequestWithTokenModule (ref), createGetFollowersCountModule (ref), createGetFollowingsCountModule (ref), createValidateFriendRequestNicknameModule (ref)
	return {
		GetFriendsFromUserId = createGetFriendsFromUserIdModule(p0),
		FindFriendsFromUserId = createFindFriendsFromUserIdModule(p0),
		SearchFriendsByQuery = createSearchFriendsByQueryModule(p0),
		GetFriendRequestsCount = createGetFriendRequestsCountModule(p0),
		UnfriendTargetUserId = createUnfriendTargetUserIdModule(p0),
		GetFriendRequests = createGetFriendRequestsModule(p0),
		AcceptFriendRequestFromUserId = createAcceptFriendRequestFromUserIdModule(p0),
		DeclineFriendRequestFromUserId = createDeclineFriendRequestFromUserIdModule(p0),
		DeclineAllFriendRequests = createDeclineAllFriendRequestsModule(p0),
		GetFriendsCountFromUserId = createGetFriendsCountFromUserIdModule(p0),
		GetInactiveFriends = createGetInactiveFriendsModule(p0),
		RequestFriendshipFromUserId = createRequestFriendshipFromUserIdModule(p0),
		RequestFriendshipFromContactId = createRequestFriendshipFromContactIdModule(p0),
		GetFollowingExists = createGetFollowingExistsModule(p0),
		GetUserFollowers = createGetUserFollowersModule(p0),
		GetFriendRecommendationsFromUserId = createGetFriendRecommendationsFromUserIdModule(p0),
		GetFriendshipStatus = createGetFriendshipStatusModule(p0),
		GetExtendedFriendshipStatus = createGetExtendedFriendshipStatusModule(p0),
		AcceptFriendRequestWithToken = createAcceptFriendRequestWithTokenModule(p0),
		GetFollowersCount = createGetFollowersCountModule(p0),
		GetFollowingsCount = createGetFollowingsCountModule(p0),
		ValidateFriendRequestNickname = createValidateFriendRequestNicknameModule(p0)
	}
end