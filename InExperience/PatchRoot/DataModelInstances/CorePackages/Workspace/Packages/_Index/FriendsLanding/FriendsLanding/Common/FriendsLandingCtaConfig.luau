local parent = script:FindFirstAncestor("FriendsLanding").Parent

return {
	supportedActions = { "Chat", "JoinExperience" },
	chatEntryPoint = require(parent.SocialCommon).Enums.ChatEntryPointNames.FriendsLandingPage,
	analytics = {
		surface = require(parent.UserList).Enums.CtaSurfaces.FriendsLandingPage
	}
}