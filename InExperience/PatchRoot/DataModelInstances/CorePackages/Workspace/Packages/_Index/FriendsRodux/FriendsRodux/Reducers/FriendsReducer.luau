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

return function(p1)
	-- upvalues: byUserIdModule (ref), countsByUserIdModule (ref), requestsModule (ref), recommendationsModule (ref), followingsModule (ref), friendshipStatusModule (ref), friendsRankByUserIdModule (ref), contactNamesByUserIdModule (ref), t (ref)
	local var1 = byUserIdModule(p1)
	local var2 = countsByUserIdModule(p1)
	local var3 = requestsModule(p1)
	local var4 = recommendationsModule(p1)
	local var5 = followingsModule(p1)
	local var6 = friendshipStatusModule(p1)
	local var7 = friendsRankByUserIdModule(p1)
	local var8 = contactNamesByUserIdModule(p1)
	
	return function(p2, p3)
		-- upvalues: t (copy), var1 (ref), var2 (ref), var3 (ref), var4 (ref), var5 (ref), var6 (ref), var7 (ref), var8 (ref)
		p2 = p2 or t
		
		return {
			byUserId = var1(p2.byUserId, p3),
			countsByUserId = var2(p2.countsByUserId, p3),
			requests = var3(p2.requests, p3),
			recommendations = var4(p2.recommendations, p3),
			followings = var5(p2.followings, p3),
			friendshipStatus = var6(p2.friendshipStatus, p3),
			friendsRankByUserId = var7(p2.friendsRankByUserId, p3),
			contactNamesByUserId = var8(p2.contactNamesByUserId, p3)
		}
	end
end