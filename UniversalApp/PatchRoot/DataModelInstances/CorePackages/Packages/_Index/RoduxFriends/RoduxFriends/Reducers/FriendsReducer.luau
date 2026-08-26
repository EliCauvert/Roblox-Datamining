local byUserIdModule = require(script.Parent.Friends.byUserId)
local countsByUserIdModule = require(script.Parent.Friends.countsByUserId)
local requestsModule = require(script.Parent.Friends.requests)
local recommendationsModule = require(script.Parent.Friends.recommendations)
local friendshipStatusModule = require(script.Parent.Friends.friendshipStatus)
local friendsRankByUserIdModule = require(script.Parent.Friends.friendsRankByUserId)
local contactNamesByUserIdModule = require(script.Parent.Friends.contactNamesByUserId)
local t = {
	countsByUserId = {},
	byUserId = {},
	requests = { receivedCount = 0 },
	recommendations = {},
	friendshipStatus = {},
	friendsRankByUserId = {},
	contactNamesByUserId = {}
}

return function(p1)
	-- upvalues: t (ref), byUserIdModule (ref), countsByUserIdModule (ref), requestsModule (ref), recommendationsModule (ref), friendshipStatusModule (ref), friendsRankByUserIdModule (ref), contactNamesByUserIdModule (ref)
	return function(p2, p3)
		-- upvalues: t (copy), byUserIdModule (copy), p1 (ref), countsByUserIdModule (copy), requestsModule (copy), recommendationsModule (copy), friendshipStatusModule (copy), friendsRankByUserIdModule (copy), contactNamesByUserIdModule (copy)
		p2 = p2 or t
		
		return {
			byUserId = byUserIdModule(p1)(p2.byUserId, p3),
			countsByUserId = countsByUserIdModule(p1)(p2, p3),
			requests = requestsModule(p1)(p2.requests, p3),
			recommendations = recommendationsModule(p1)(p2.recommendations, p3),
			friendshipStatus = friendshipStatusModule(p1)(p2.friendshipStatus, p3),
			friendsRankByUserId = friendsRankByUserIdModule(p1)(p2.friendsRankByUserId, p3),
			contactNamesByUserId = contactNamesByUserIdModule(p1)(p2.contactNamesByUserId, p3)
		}
	end
end