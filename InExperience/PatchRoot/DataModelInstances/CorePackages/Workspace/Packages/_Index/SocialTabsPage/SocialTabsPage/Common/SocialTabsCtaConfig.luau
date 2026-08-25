local parent = script:FindFirstAncestor("SocialTabsPage").Parent
local _ = require(parent.UserList)

return {
	primaryCtaMinWidth = 64,
	primaryCtaMaxWidth = 90,
	friendshipOriginSourceType = require(parent.FriendsNetworking).Enums.FriendshipOriginSourceType.SocialTabsPage.rawValue()
}