local dependenciesModule = require(script:FindFirstAncestor("PYMKCarousel").dependencies)
local roduxFriends = dependenciesModule.RoduxFriends
local convertActions = dependenciesModule.convertActions
local friendsActionAdaptor = dependenciesModule.friendsActionAdaptor
local llama = dependenciesModule.llama
local friendsOmniActionAdaptorModule = require(script.Parent.friendsOmniActionAdaptor)
local t = {
	countsByUserId = {},
	byUserId = {},
	requests = {
		receivedCount = 0,
		newFriendRequestsCount = 0,
		byUserId = {},
		mutualFriends = {},
		sentAt = {},
		sourceUniverseIds = {}
	},
	recommendations = { byUserId = {}, bySource = {} },
	friendshipStatus = {},
	friendsRankByUserId = {}
}
local var1 = roduxFriends.installReducer()

local _ = function(p1)
	-- upvalues: llama (ref), friendsActionAdaptor (ref), roduxFriends (ref), friendsOmniActionAdaptorModule (ref)
	return llama.Dictionary.join(friendsActionAdaptor(roduxFriends), friendsOmniActionAdaptorModule(p1))
end

return function(p1)
	-- upvalues: convertActions (ref), var1 (ref), llama (ref), friendsActionAdaptor (ref), roduxFriends (ref), friendsOmniActionAdaptorModule (ref), t (ref)
	return convertActions(var1, llama.Dictionary.join(friendsActionAdaptor(roduxFriends), friendsOmniActionAdaptorModule(p1)), t)
end