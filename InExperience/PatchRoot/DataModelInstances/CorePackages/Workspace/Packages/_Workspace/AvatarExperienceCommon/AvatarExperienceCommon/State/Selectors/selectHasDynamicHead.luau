local dynamicHead = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants).ASSET_TYPE_NAME_TO_ID_STRING.DynamicHead
local AXDHEquippedAssetsNilCheck = game:DefineFastFlag("AXDHEquippedAssetsNilCheck", false)

return function(p0)
	-- upvalues: AXDHEquippedAssetsNilCheck (ref), dynamicHead (ref)
	local equippedAssets = p0.AvatarExperience.AvatarEditor.Character.EquippedAssets
	
	if AXDHEquippedAssetsNilCheck and not equippedAssets then
		return false
	end
	local var1 = equippedAssets[dynamicHead]
	
	if var1 then
		for i in var1 do
			return true
		end
	end
	local tryOnItems = p0.AvatarExperience.AvatarScene.OutfitTryOn and p0.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	
	if tryOnItems then
		for i, v in tryOnItems do
			if v.assetType == dynamicHead then
				return true
			end
		end
	end
	return false
end