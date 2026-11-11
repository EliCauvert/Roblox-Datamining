local ByUserIdModule = require(script.Parent.Friends.byUserId)
local CountsByUserIdModule = require(script.Parent.Friends.countsByUserId)
local RequestsModule = require(script.Parent.Friends.requests)
local RecommendationsModule = require(script.Parent.Friends.recommendations)
local FollowingsModule = require(script.Parent.Friends.followings)
local FriendshipStatusModule = require(script.Parent.Friends.friendshipStatus)
local FriendsRankByUserIdModule = require(script.Parent.Friends.friendsRankByUserId)
local ContactNamesByUserIdModule = require(script.Parent.Friends.contactNamesByUserId)
local config = {
	countsByUserId = {},
	byUserId = {},
	requests = { receivedCount = 0, newFriendRequestsCount = 0 },
	recommendations = {},
	followings = {},
	friendshipStatus = {},
	friendsRankByUserId = {},
	contactNamesByUserId = {}
}

return function(p1)
	-- upvalues: ByUserIdModule (copy), CountsByUserIdModule (copy), RequestsModule (copy), RecommendationsModule (copy), FollowingsModule (copy), FriendshipStatusModule (copy), FriendsRankByUserIdModule (copy), ContactNamesByUserIdModule (copy), config (copy)
	local ByUserIdModuleResult = ByUserIdModule(p1)
	local CountsByUserIdModuleResult = CountsByUserIdModule(p1)
	local RequestsModuleResult = RequestsModule(p1)
	local RecommendationsModuleResult = RecommendationsModule(p1)
	local FollowingsModuleResult = FollowingsModule(p1)
	local FriendshipStatusModuleResult = FriendshipStatusModule(p1)
	local FriendsRankByUserIdModuleResult = FriendsRankByUserIdModule(p1)
	local ContactNamesByUserIdModuleResult = ContactNamesByUserIdModule(p1)
	
	return function(p2, p3)
		-- upvalues: config (upval), ByUserIdModuleResult (copy), CountsByUserIdModuleResult (copy), RequestsModuleResult (copy), RecommendationsModuleResult (copy), FollowingsModuleResult (copy), FriendshipStatusModuleResult (copy), FriendsRankByUserIdModuleResult (copy), ContactNamesByUserIdModuleResult (copy)
		local P1 = p2 or config
		
		return {
			byUserId = ByUserIdModuleResult(P1.byUserId, p3),
			countsByUserId = CountsByUserIdModuleResult(P1.countsByUserId, p3),
			requests = RequestsModuleResult(P1.requests, p3),
			recommendations = RecommendationsModuleResult(P1.recommendations, p3),
			followings = FollowingsModuleResult(P1.followings, p3),
			friendshipStatus = FriendshipStatusModuleResult(P1.friendshipStatus, p3),
			friendsRankByUserId = FriendsRankByUserIdModuleResult(P1.friendsRankByUserId, p3),
			contactNamesByUserId = ContactNamesByUserIdModuleResult(P1.contactNamesByUserId, p3)
		}
	end
end