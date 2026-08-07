local presenceType = require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxPresence.Enums.PresenceType

return {
	[presenceType.Offline] = "Common.Presence.Label.Offline",
	[presenceType.Online] = "Common.Presence.Label.Online",
	[presenceType.InGame] = "Common.Presence.Label.Online",
	[presenceType.InStudio] = "Common.Presence.Label.Online"
}