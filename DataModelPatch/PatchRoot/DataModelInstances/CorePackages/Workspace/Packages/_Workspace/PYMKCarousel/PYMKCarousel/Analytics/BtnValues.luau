local DependenciesModule = require(script.Parent.Parent.dependencies)
local GetFFlagPYMKAddFriendsEntryFunction = DependenciesModule.getFFlagPYMKAddFriendsEntry

return DependenciesModule.enumerate(script.Name, {
	RequestFriendship = "requestFriendship",
	OpenPeopleList = "openPeopleList",
	AcceptFriendship = "acceptFriendship",
	FindFriends = if GetFFlagPYMKAddFriendsEntryFunction() then "findFriends" else "",
	SeeAll = if GetFFlagPYMKAddFriendsEntryFunction() then "seeAll" else ""
})