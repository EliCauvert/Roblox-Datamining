local UserModule = require(script:FindFirstAncestor("UserLib").Models.User)

return {
	[0] = UserModule.PresenceType.OFFLINE,
	[1] = UserModule.PresenceType.ONLINE,
	[2] = UserModule.PresenceType.IN_GAME,
	[3] = UserModule.PresenceType.IN_STUDIO
}