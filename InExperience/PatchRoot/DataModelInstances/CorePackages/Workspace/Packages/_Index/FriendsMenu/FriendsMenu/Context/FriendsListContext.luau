local FriendsMenu = script:FindFirstAncestor("FriendsMenu")
local _ = require(FriendsMenu.friendsMenuModalType)

return (require(FriendsMenu.Parent.React).createContext({
	hasFriends = false,
	isFetchingFriends = false,
	isFriendsListFetchFailed = false,
	searchFriendsString = "",
	friends = {},
	searchFriends = function() --[[ Line: 15 ]]
		return {}
	end,
	fetchMoreFriends = function() --[[ Line: 18 ]]
		return {}
	end,
	friendsNames = { loading = true }
}))