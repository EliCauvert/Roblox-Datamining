local UserModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Models.User)

return {
	[UserModule.PresenceType.OFFLINE] = nil,
	[UserModule.PresenceType.ONLINE] = "component_assets/circle_16",
	[UserModule.PresenceType.IN_GAME] = "icons/menu/games_small",
	[UserModule.PresenceType.IN_STUDIO] = "icons/logo/studiologo_small"
}