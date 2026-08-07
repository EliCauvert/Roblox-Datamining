local userModule = require(script:FindFirstAncestor("UserLib").Models.User)

return {
	[0] = userModule.PresenceType.OFFLINE,
	[1] = userModule.PresenceType.ONLINE,
	[2] = userModule.PresenceType.IN_GAME,
	[3] = userModule.PresenceType.IN_STUDIO
}