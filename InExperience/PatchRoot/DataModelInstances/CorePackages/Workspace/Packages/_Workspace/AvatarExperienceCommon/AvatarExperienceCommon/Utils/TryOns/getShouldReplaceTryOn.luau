local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local avatarExperienceFlagsModule = require(avatarExperienceCommon.Parent.AvatarExperienceFlags)
local _ = require(avatarExperienceCommon.Types.TryOnItemComparisonData)
local constantsModule = require(avatarExperienceCommon.Constants)
local itemTypeEnumModule = require(avatarExperienceCommon.Enums.ItemTypeEnum)
local fFlagAXCatalogMakeupSupport = avatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport

function shouldReplaceTryOn(p1, p2)
	-- upvalues: itemTypeEnumModule (ref), fFlagAXCatalogMakeupSupport (ref), constantsModule (ref)
	if p1.isDynamicHead and p2.isClassicHeadOrFace then
		return true
	elseif p1.isClassicHeadOrFace and p2.isDynamicHead then
		return true
	elseif p1.itemType == itemTypeEnumModule.Asset and p2.itemType == itemTypeEnumModule.Asset then
		if p1.itemSubType == p2.itemSubType and (not fFlagAXCatalogMakeupSupport or not constantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[p2.itemSubType]) then
			return true
		end
		for i, v in p2.layeredClothingCategories do
			if p1.layeredClothingCategories[i] then
				return true
			end
		end
	end
	if p1.itemType == itemTypeEnumModule.Bundle then
		if p2.itemType == itemTypeEnumModule.Bundle and p1.itemSubType == p2.itemSubType then
			return true
		end
		local var1 = p2.itemType == itemTypeEnumModule.Bundle and p2.itemSubType == tostring(Enum.BundleType.BodyParts.Value)
		
		for i, v in p1.assetTypes do
			if p2.assetTypes[i] and not var1 then
				return true
			end
		end
		for i_1, v in p1.layeredClothingCategories do
			if p2.layeredClothingCategories[i_1] and not var1 then
				return true
			end
		end
	end
	return false
end

return shouldReplaceTryOn