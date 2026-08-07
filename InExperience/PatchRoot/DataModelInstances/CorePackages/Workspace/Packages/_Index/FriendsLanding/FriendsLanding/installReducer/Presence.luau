local friendsLanding = script:FindFirstAncestor("FriendsLanding")

return if require(friendsLanding.Flags.FFlagFriendsLandingDeprecateUnusedMapToUsers) then nil else require(script.Parent.convertActions)(require(friendsLanding.dependencies).RoduxPresence.installReducer(), require(script.Parent.presenceActionAdaptor), {
	byUserId = {},
	byGameId = {},
	byGameInstanceId = {},
	byPlaceId = {}
})