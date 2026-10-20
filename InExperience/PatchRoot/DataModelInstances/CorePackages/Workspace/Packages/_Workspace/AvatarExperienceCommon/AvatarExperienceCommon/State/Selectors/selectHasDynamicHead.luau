local DynamicHead = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants).ASSET_TYPE_NAME_TO_ID_STRING.DynamicHead
local AXDHEquippedAssetsNilCheck = game:DefineFastFlag("AXDHEquippedAssetsNilCheck", false)

return function(p1): boolean
	-- upvalues: AXDHEquippedAssetsNilCheck (copy), DynamicHead (copy)
	local EquippedAssets = p1.AvatarExperience.AvatarEditor.Character.EquippedAssets
	
	if AXDHEquippedAssetsNilCheck and not EquippedAssets then
		return false
	end
	local EquippedAsset = EquippedAssets[DynamicHead]
	
	if EquippedAsset then
		for _ in EquippedAsset do
			return true
		end
	end
	local TryOnItems = p1.AvatarExperience.AvatarScene.OutfitTryOn and p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	
	if TryOnItems then
		for _, tryOnItem in TryOnItems do
			if tryOnItem.assetType == DynamicHead then
				return true
			end
		end
	end
	return false
end