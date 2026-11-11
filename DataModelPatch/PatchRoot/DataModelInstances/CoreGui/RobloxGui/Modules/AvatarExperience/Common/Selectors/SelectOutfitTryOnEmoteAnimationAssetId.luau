local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SelectOutfitTryOnMostRecentAssetIdModule = require(Modules.AvatarExperience.Common.Selectors.SelectOutfitTryOnMostRecentAssetId)

return function(p1)
	-- upvalues: SelectOutfitTryOnMostRecentAssetIdModule (copy), ConstantsModule (copy)
	return (SelectOutfitTryOnMostRecentAssetIdModule(p1, ConstantsModule.AssetTypeIdStrings.EmoteAnimation))
end