local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local ItemTypeEnum = require(AvatarExperienceCommon.Parent.AvatarExperienceModel).Enums.ItemTypeEnum
local AvatarBackground = require(AvatarExperienceCommon.Constants).ASSET_TYPE_NAME_TO_ID_STRING.AvatarBackground

return function(p1): number?
	-- upvalues: ItemTypeEnum (copy), AvatarBackground (copy)
	local AvatarExperience = p1 and p1.AvatarExperience or p1
	local AvatarScene = AvatarExperience and AvatarExperience.AvatarScene
	local TryOnItems = AvatarScene and (AvatarScene.OutfitTryOn and AvatarScene.OutfitTryOn.TryOnItems)
	
	if not TryOnItems then
		return nil
	end
	local Number = nil
	for _, tryOnItem in TryOnItems do
		if not tryOnItem.isUnequipped and tryOnItem.itemType == ItemTypeEnum.Asset and tryOnItem.itemSubType == AvatarBackground then
			Number = tonumber(tryOnItem.itemId)
			
			if Number then
				return Number
			end
		end
	end
	return nil
end