local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local _ = require(friendsMenu.friendsMenuModalType)

return require(friendsMenu.Parent.React).createContext({
	hasFriends = false,
	isFetchingFriends = false,
	isFriendsListFetchFailed = false,
	searchFriendsString = "",
	friends = {},
	searchFriends = function() --[[ line: 15 ]]
		return {}
	end,
	fetchMoreFriends = function() --[[ line: 18 ]]
		return {}
	end,
	friendsNames = { loading = true }
})