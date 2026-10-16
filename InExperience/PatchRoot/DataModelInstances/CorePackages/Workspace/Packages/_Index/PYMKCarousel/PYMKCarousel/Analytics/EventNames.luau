local DependenciesModule = require(script.Parent.Parent.dependencies)

return DependenciesModule.enumerate(script.Name, {
	CarouselLoadedWithUsers = "CarouselLoadedWithUsers",
	PYMKCarouselLoadingTime = "PYMKCarouselLoadingTime",
	UserSeen = "UserSeen",
	UserSeenCollection = "UserSeenCollection",
	UserPressed = "UserPressed",
	RequestFriendship = "RequestFriendship",
	AcceptFriendship = "AcceptFriendship",
	PYMKUserPresenceLoad = "PYMKUserPresenceLoad",
	CarouselGenericTileClicked = if DependenciesModule.getFFlagPYMKAddFriendsEntry() then "CarouselGenericTileClicked" else nil
})