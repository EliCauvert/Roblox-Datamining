local PresenceType = require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxPresence.Enums.PresenceType

return {
	[PresenceType.Offline] = "Common.Presence.Label.Offline",
	[PresenceType.Online] = "Common.Presence.Label.Online",
	[PresenceType.InGame] = "Common.Presence.Label.Online",
	[PresenceType.InStudio] = "Common.Presence.Label.Online"
}