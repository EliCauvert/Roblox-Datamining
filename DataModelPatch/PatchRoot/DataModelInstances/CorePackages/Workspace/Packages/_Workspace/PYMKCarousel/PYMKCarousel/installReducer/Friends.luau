local DependenciesModule = require(script:FindFirstAncestor("PYMKCarousel").dependencies)
local RoduxFriends = DependenciesModule.RoduxFriends
local ConvertActionsFunction = DependenciesModule.convertActions
local FriendsActionAdaptorFunction = DependenciesModule.friendsActionAdaptor
local Llama = DependenciesModule.llama
local FriendsOmniActionAdaptorModule = require(script.Parent.friendsOmniActionAdaptor)
local config = {
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
local InstallReducerResult = RoduxFriends.installReducer()

local function _(p1)
	-- upvalues: Llama (copy), FriendsActionAdaptorFunction (copy), RoduxFriends (copy), FriendsOmniActionAdaptorModule (copy)
	return Llama.Dictionary.join(FriendsActionAdaptorFunction(RoduxFriends), FriendsOmniActionAdaptorModule(p1))
end

return function(p1)
	-- upvalues: ConvertActionsFunction (copy), InstallReducerResult (copy), Llama (copy), FriendsActionAdaptorFunction (copy), RoduxFriends (copy), FriendsOmniActionAdaptorModule (copy), config (copy)
	return ConvertActionsFunction(InstallReducerResult, Llama.Dictionary.join(FriendsActionAdaptorFunction(RoduxFriends), FriendsOmniActionAdaptorModule(p1)), config)
end