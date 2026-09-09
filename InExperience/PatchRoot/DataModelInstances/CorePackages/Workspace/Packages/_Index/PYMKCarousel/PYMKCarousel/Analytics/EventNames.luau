local dependenciesModule = require(script.Parent.Parent.dependencies)

return dependenciesModule.enumerate(script.Name, {
	CarouselLoadedWithUsers = "CarouselLoadedWithUsers",
	PYMKCarouselLoadingTime = "PYMKCarouselLoadingTime",
	UserSeen = "UserSeen",
	UserSeenCollection = "UserSeenCollection",
	UserPressed = "UserPressed",
	RequestFriendship = "RequestFriendship",
	AcceptFriendship = "AcceptFriendship",
	PYMKUserPresenceLoad = "PYMKUserPresenceLoad",
	CarouselGenericTileClicked = if dependenciesModule.getFFlagPYMKAddFriendsEntry() then "CarouselGenericTileClicked" else nil
})