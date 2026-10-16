return (require(script.Parent.Parent.Parent.React).createContext({
	selectedFriendsSize = 0,
	selectedFriends = {},
	addFriend = function() --[[ Line: 21 ]] end,
	removeFriend = function() --[[ Line: 22 ]] end,
	isFriendSelected = function(): boolean --[[ Line: 23 ]]
		return false
	end,
	preselectedUsers = {},
	onRemoveCallback = function() --[[ Line: 27 ]] end
}))