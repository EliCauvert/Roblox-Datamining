local PresenceType = require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxPresence.Enums.PresenceType

return {
	[PresenceType.Offline] = nil,
	[PresenceType.Online] = "component_assets/circle_16",
	[PresenceType.InGame] = "icons/menu/games_small",
	[PresenceType.InStudio] = "icons/logo/studiologo_small"
}