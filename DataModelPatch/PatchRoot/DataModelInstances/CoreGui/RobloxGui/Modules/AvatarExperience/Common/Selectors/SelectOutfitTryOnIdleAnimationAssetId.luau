local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SelectOutfitTryOnMostRecentAssetIdModule = require(Modules.AvatarExperience.Common.Selectors.SelectOutfitTryOnMostRecentAssetId)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)

return function(p1)
	-- upvalues: SelectOutfitTryOnMostRecentAssetIdModule (copy), ConstantsModule (copy)
	return SelectOutfitTryOnMostRecentAssetIdModule(p1, ConstantsModule.AssetTypeIdStrings.IdleAnimation)
end