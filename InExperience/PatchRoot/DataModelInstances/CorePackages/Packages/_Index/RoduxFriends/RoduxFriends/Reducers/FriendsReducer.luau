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

return function(p0)
	-- upvalues: t (ref), byUserIdModule (ref), countsByUserIdModule (ref), requestsModule (ref), recommendationsModule (ref), friendshipStatusModule (ref), friendsRankByUserIdModule (ref), contactNamesByUserIdModule (ref)
	return function(p1, p2)
		-- upvalues: t (copy), byUserIdModule (copy), p0 (ref), countsByUserIdModule (copy), requestsModule (copy), recommendationsModule (copy), friendshipStatusModule (copy), friendsRankByUserIdModule (copy), contactNamesByUserIdModule (copy)
		p1 = p1 or t
		
		return {
			byUserId = byUserIdModule(p0)(p1.byUserId, p2),
			countsByUserId = countsByUserIdModule(p0)(p1, p2),
			requests = requestsModule(p0)(p1.requests, p2),
			recommendations = recommendationsModule(p0)(p1.recommendations, p2),
			friendshipStatus = friendshipStatusModule(p0)(p1.friendshipStatus, p2),
			friendsRankByUserId = friendsRankByUserIdModule(p0)(p1.friendsRankByUserId, p2),
			contactNamesByUserId = contactNamesByUserIdModule(p0)(p1.contactNamesByUserId, p2)
		}
	end
end