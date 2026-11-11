return (require(script.Parent.Parent.Parent.React).createContext({
	selectedFriendsSize = 0,
	selectedFriends = {},
	addFriend = function() end,
	removeFriend = function() end,
	isFriendSelected = function(): boolean
		return false
	end,
	preselectedUsers = {},
	onRemoveCallback = function() end
}))