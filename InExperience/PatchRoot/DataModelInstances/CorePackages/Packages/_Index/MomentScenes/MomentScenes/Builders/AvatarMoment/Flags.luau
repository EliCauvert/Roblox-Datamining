local SafeFlagsModule = require(script:FindFirstAncestor("MomentScenes").Parent.SafeFlags)

return {
	MomentScenesAvatarMomentUserId = SafeFlagsModule.createGetFFlag("MomentScenesAvatarMomentUserId")(),
	MomentScenesAvatarMomentDefaultClothing = SafeFlagsModule.createGetFFlag("MomentScenesAvatarMomentDefaultClothing")()
}