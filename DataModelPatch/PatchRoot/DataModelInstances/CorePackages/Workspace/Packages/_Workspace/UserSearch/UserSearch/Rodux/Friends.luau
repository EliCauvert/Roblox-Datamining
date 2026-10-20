local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local RoduxFriendsModule = require(UserSearch.Rodux.RoduxFriends)

return require(Parent.SocialReducerAdaptors).convertActions(RoduxFriendsModule.installReducer(), require(Parent.SocialReducerAdaptors).friendsActionAdaptor(RoduxFriendsModule), {
	countsByUserId = {},
	byUserId = {},
	requests = { receivedCount = 0 },
	recommendations = {},
	friendshipStatus = {},
	followings = {},
	friendsRankByUserId = {}
})