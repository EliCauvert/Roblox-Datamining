local AvatarExperienceInitialization = script:FindFirstAncestor("AvatarExperienceInitialization")
local UseRemoteAvatarUpdateEffectModule = require(AvatarExperienceInitialization.Hooks.useRemoteAvatarUpdateEffect)
local UseAvatarUpdateOnGameLeaveModule = require(AvatarExperienceInitialization.Hooks.useAvatarUpdateOnGameLeave)
local AXUpdateAvatarOnGameLeave = game:DefineFastFlag("AXUpdateAvatarOnGameLeave", false)

return function(p1)
	-- upvalues: UseRemoteAvatarUpdateEffectModule (copy), AXUpdateAvatarOnGameLeave (copy), UseAvatarUpdateOnGameLeaveModule (copy)
	UseRemoteAvatarUpdateEffectModule(p1.onUpdated)
	
	if AXUpdateAvatarOnGameLeave then
		UseAvatarUpdateOnGameLeaveModule(p1.onUpdated)
	end
end