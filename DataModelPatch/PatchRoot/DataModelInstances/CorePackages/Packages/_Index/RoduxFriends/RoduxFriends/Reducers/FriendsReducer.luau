local ByUserIdModule = require(script.Parent.Friends.byUserId)
local CountsByUserIdModule = require(script.Parent.Friends.countsByUserId)
local RequestsModule = require(script.Parent.Friends.requests)
local RecommendationsModule = require(script.Parent.Friends.recommendations)
local FriendshipStatusModule = require(script.Parent.Friends.friendshipStatus)
local FriendsRankByUserIdModule = require(script.Parent.Friends.friendsRankByUserId)
local ContactNamesByUserIdModule = require(script.Parent.Friends.contactNamesByUserId)
local config = {
	countsByUserId = {},
	byUserId = {},
	requests = { receivedCount = 0 },
	recommendations = {},
	friendshipStatus = {},
	friendsRankByUserId = {},
	contactNamesByUserId = {}
}

return function(p1)
	-- upvalues: config (copy), ByUserIdModule (copy), CountsByUserIdModule (copy), RequestsModule (copy), RecommendationsModule (copy), FriendshipStatusModule (copy), FriendsRankByUserIdModule (copy), ContactNamesByUserIdModule (copy)
	return function(p2, p3)
		-- upvalues: config (upval), ByUserIdModule (upval), p1 (copy), CountsByUserIdModule (upval), RequestsModule (upval), RecommendationsModule (upval), FriendshipStatusModule (upval), FriendsRankByUserIdModule (upval), ContactNamesByUserIdModule (upval)
		local P1 = p2 or config
		
		return {
			byUserId = ByUserIdModule(p1)(P1.byUserId, p3),
			countsByUserId = CountsByUserIdModule(p1)(p2, p3),
			requests = RequestsModule(p1)(P1.requests, p3),
			recommendations = RecommendationsModule(p1)(P1.recommendations, p3),
			friendshipStatus = FriendshipStatusModule(p1)(P1.friendshipStatus, p3),
			friendsRankByUserId = FriendsRankByUserIdModule(p1)(P1.friendsRankByUserId, p3),
			contactNamesByUserId = ContactNamesByUserIdModule(p1)(P1.contactNamesByUserId, p3)
		}
	end
end