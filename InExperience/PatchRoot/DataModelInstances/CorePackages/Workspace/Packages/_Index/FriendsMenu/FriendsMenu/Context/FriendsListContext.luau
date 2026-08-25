local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local _ = require(friendsMenu.friendsMenuModalType)

return require(friendsMenu.Parent.React).createContext({
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
})