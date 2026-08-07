local userModel = require(script:FindFirstAncestor("SocialLibraries").dependencies).UserModel

return {
	[userModel.PresenceType.OFFLINE] = "",
	[userModel.PresenceType.ONLINE] = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-online-14x14.png",
	[userModel.PresenceType.IN_GAME] = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-ingame-14x14.png",
	[userModel.PresenceType.IN_STUDIO] = "rbxasset://textures/ui/LuaChat/graphic/gr-indicator-instudio-14x14.png"
}