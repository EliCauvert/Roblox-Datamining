local dependenciesModule = require(script.Parent.Parent.dependencies)
local getFFlagPYMKAddFriendsEntry = dependenciesModule.getFFlagPYMKAddFriendsEntry

return dependenciesModule.enumerate(script.Name, {
	RequestFriendship = "requestFriendship",
	OpenPeopleList = "openPeopleList",
	AcceptFriendship = "acceptFriendship",
	FindFriends = if getFFlagPYMKAddFriendsEntry() then "findFriends" else "",
	SeeAll = if getFFlagPYMKAddFriendsEntry() then "seeAll" else ""
})