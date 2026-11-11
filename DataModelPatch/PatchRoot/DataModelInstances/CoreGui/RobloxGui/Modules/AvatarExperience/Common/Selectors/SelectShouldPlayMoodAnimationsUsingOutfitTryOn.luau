local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local SelectOutfitTryOnMoodAnimationAssetIdModule = require(Modules.AvatarExperience.Common.Selectors.SelectOutfitTryOnMoodAnimationAssetId)
local SelectShouldPlayMoodAnimationsEquippedModule = require(Modules.AvatarExperience.Common.Selectors.SelectShouldPlayMoodAnimationsEquipped)

return function(p1)
	-- upvalues: SelectOutfitTryOnMoodAnimationAssetIdModule (copy), SelectShouldPlayMoodAnimationsEquippedModule (copy)
	return if SelectOutfitTryOnMoodAnimationAssetIdModule(p1) then true else SelectShouldPlayMoodAnimationsEquippedModule(p1)
end