local FriendsMenu = script:FindFirstAncestor("FriendsMenu")
local _ = require(FriendsMenu.friendsMenuModalType)

return (require(FriendsMenu.Parent.React).createContext({
	hasFriends = false,
	isFetchingFriends = false,
	isFriendsListFetchFailed = false,
	searchFriendsString = "",
	friends = {},
	searchFriends = function()
		return {}
	end,
	fetchMoreFriends = function()
		return {}
	end,
	friendsNames = { loading = true }
}))