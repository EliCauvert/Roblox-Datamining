local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SelectOutfitTryOnMostRecentAssetIdModule = require(Modules.AvatarExperience.Common.Selectors.SelectOutfitTryOnMostRecentAssetId)

return function(p1)
	-- upvalues: SelectOutfitTryOnMostRecentAssetIdModule (copy), ConstantsModule (copy)
	local _, SelectOutfitTryOnMostRecentAssetIdModuleResult2, SelectOutfitTryOnMostRecentAssetIdModuleResult3 = SelectOutfitTryOnMostRecentAssetIdModule(p1, ConstantsModule.AssetTypeIdStrings.DynamicHead)
	local _, _, SelectOutfitTryOnMostRecentAssetIdModuleResult3_1 = SelectOutfitTryOnMostRecentAssetIdModule(p1, ConstantsModule.AssetTypeIdStrings.Head)
	
	if SelectOutfitTryOnMostRecentAssetIdModuleResult3_1 and (not SelectOutfitTryOnMostRecentAssetIdModuleResult3 or SelectOutfitTryOnMostRecentAssetIdModuleResult3 < SelectOutfitTryOnMostRecentAssetIdModuleResult3_1) then
		return nil
	end
	if not SelectOutfitTryOnMostRecentAssetIdModuleResult2 then
		return nil
	end
	assert(SelectOutfitTryOnMostRecentAssetIdModuleResult2, "tryOnBundleInfo is non-nil. Silence type checker")
	
	for i, value in SelectOutfitTryOnMostRecentAssetIdModuleResult2 do
		if value.assetType == ConstantsModule.AssetTypeIdStrings.MoodAnimation then
			return i
		end
	end
	return nil
end