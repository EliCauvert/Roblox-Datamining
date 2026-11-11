local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local ItemTypeEnumModule = require(AvatarExperienceCommon.Enums.ItemTypeEnum)
local ConstantsModule = require(AvatarExperienceCommon.Constants)

local function getBodiesInTryOns(TryOnItems)
	-- upvalues: ItemTypeEnumModule (copy), ConstantsModule (copy)
	local ItemIds = {}
	
	for _, tryOnItem in TryOnItems do
		if tryOnItem.itemType == ItemTypeEnumModule.Bundle and tryOnItem.itemSubType == ConstantsModule.BODY_BUNDLE_TYPE_ID then
			table.insert(ItemIds, tryOnItem.itemId)
		end
	end
	return ItemIds
end

return function(p1)
	-- upvalues: getBodiesInTryOns (copy)
	local OutfitTryOn = p1.AvatarExperience.AvatarScene.OutfitTryOn
	
	return if OutfitTryOn and OutfitTryOn.TryOnItems then getBodiesInTryOns(OutfitTryOn.TryOnItems) else {}
end