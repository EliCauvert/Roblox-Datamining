local userSearch = script:FindFirstAncestor("UserSearch")
local parent = userSearch.Parent
local roduxFriendsModule = require(userSearch.Rodux.RoduxFriends)

return require(parent.SocialReducerAdaptors).convertActions(roduxFriendsModule.installReducer(), require(parent.SocialReducerAdaptors).friendsActionAdaptor(roduxFriendsModule), {
	countsByUserId = {},
	byUserId = {},
	requests = { receivedCount = 0 },
	recommendations = {},
	friendshipStatus = {},
	followings = {},
	friendsRankByUserId = {}
})