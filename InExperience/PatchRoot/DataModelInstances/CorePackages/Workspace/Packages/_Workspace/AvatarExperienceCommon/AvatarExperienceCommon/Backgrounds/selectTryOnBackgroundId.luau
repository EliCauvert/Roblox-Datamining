local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local itemTypeEnumModule = require(avatarExperienceCommon.Enums.ItemTypeEnum)
local avatarBackground = require(avatarExperienceCommon.Constants).ASSET_TYPE_NAME_TO_ID_STRING.AvatarBackground

return function(value)
	-- upvalues: itemTypeEnumModule (ref), avatarBackground (ref)
	local var1 = value and value.AvatarExperience
	local avatarScene = var1 and var1.AvatarScene
	local tryOnItems = avatarScene and (avatarScene.OutfitTryOn and avatarScene.OutfitTryOn.TryOnItems)
	
	if not tryOnItems then
		return nil
	end
	for i, v in tryOnItems do
		if not v.isUnequipped and v.itemType == itemTypeEnumModule.Asset and v.itemSubType == avatarBackground then
			local var2 = tonumber(v.itemId)
			
			if var2 then
				return var2
			end
		end
	end
	return nil
end