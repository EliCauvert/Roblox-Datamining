local byUserIdModule = require(script.Parent.Friends.byUserId)
local countsByUserIdModule = require(script.Parent.Friends.countsByUserId)
local requestsModule = require(script.Parent.Friends.requests)
local recommendationsModule = require(script.Parent.Friends.recommendations)
local followingsModule = require(script.Parent.Friends.followings)
local friendshipStatusModule = require(script.Parent.Friends.friendshipStatus)
local friendsRankByUserIdModule = require(script.Parent.Friends.friendsRankByUserId)
local contactNamesByUserIdModule = require(script.Parent.Friends.contactNamesByUserId)
local t = {
	countsByUserId = {},
	byUserId = {},
	requests = { receivedCount = 0, newFriendRequestsCount = 0 },
	recommendations = {},
	followings = {},
	friendshipStatus = {},
	friendsRankByUserId = {},
	contactNamesByUserId = {}
}

return function(p0) --[[ line: 24 ]]
	-- upvalues: byUserIdModule (ref), countsByUserIdModule (ref), requestsModule (ref), recommendationsModule (ref), followingsModule (ref), friendshipStatusModule (ref), friendsRankByUserIdModule (ref), contactNamesByUserIdModule (ref), t (ref)
	local var9 = byUserIdModule(p0)
	local var10 = countsByUserIdModule(p0)
	local var11 = requestsModule(p0)
	local var12 = recommendationsModule(p0)
	local var13 = followingsModule(p0)
	local var14 = friendshipStatusModule(p0)
	local var15 = friendsRankByUserIdModule(p0)
	local var16 = contactNamesByUserIdModule(p0)
	
	return function(p1, p2) --[[ line: 34 ]]
		-- upvalues: t (copy), var9 (ref), var10 (ref), var11 (ref), var12 (ref), var13 (ref), var14 (ref), var15 (ref), var16 (ref)
		p1 = p1 or t
		
		return {
			byUserId = var9(p1.byUserId, p2),
			countsByUserId = var10(p1.countsByUserId, p2),
			requests = var11(p1.requests, p2),
			recommendations = var12(p1.recommendations, p2),
			followings = var13(p1.followings, p2),
			friendshipStatus = var14(p1.friendshipStatus, p2),
			friendsRankByUserId = var15(p1.friendsRankByUserId, p2),
			contactNamesByUserId = var16(p1.contactNamesByUserId, p2)
		}
	end
end