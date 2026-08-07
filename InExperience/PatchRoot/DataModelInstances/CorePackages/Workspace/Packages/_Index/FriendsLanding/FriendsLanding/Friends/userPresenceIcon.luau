local presenceType = require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxPresence.Enums.PresenceType

return {
	[presenceType.Offline] = nil,
	[presenceType.Online] = "component_assets/circle_16",
	[presenceType.InGame] = "icons/menu/games_small",
	[presenceType.InStudio] = "icons/logo/studiologo_small"
}