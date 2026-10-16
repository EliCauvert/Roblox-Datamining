local Parent = script:FindFirstAncestor("FriendsLanding").Parent

return {
	supportedActions = { "Chat", "JoinExperience" },
	chatEntryPoint = require(Parent.SocialCommon).Enums.ChatEntryPointNames.FriendsLandingPage,
	analytics = {
		surface = require(Parent.UserList).Enums.CtaSurfaces.FriendsLandingPage
	}
}