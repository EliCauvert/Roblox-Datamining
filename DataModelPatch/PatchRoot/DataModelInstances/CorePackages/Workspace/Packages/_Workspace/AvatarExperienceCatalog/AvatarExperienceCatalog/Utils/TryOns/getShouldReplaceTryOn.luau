local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local _ = require(AvatarExperienceCatalog.Types)
local Constants = AvatarExperienceCommonModule.Constants
local ItemTypeEnum = AvatarExperienceCommonModule.Enums.ItemTypeEnum
local FFlagAXCatalogMakeupSupport = require(Parent.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport

function shouldReplaceTryOn(p1, p2): boolean
	-- upvalues: ItemTypeEnum (copy), FFlagAXCatalogMakeupSupport (copy), Constants (copy)
	if p1.isDynamicHead and p2.isClassicHeadOrFace then
		return true
	end
	if p1.isClassicHeadOrFace and p2.isDynamicHead then
		return true
	end
	if p1.itemType == ItemTypeEnum.Asset and p2.itemType == ItemTypeEnum.Asset then
		if p1.itemSubType == p2.itemSubType and (not FFlagAXCatalogMakeupSupport or not Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[p2.itemSubType]) then
			return true
		end
		for i, _ in p2.layeredClothingCategories do
			if p1.layeredClothingCategories[i] then
				return true
			end
		end
	end
	if p1.itemType == ItemTypeEnum.Bundle then
		if p2.itemType == ItemTypeEnum.Bundle and p1.itemSubType == p2.itemSubType then
			return true
		end
		local IsItemSubTypeMatch: boolean = p2.itemType == ItemTypeEnum.Bundle and p2.itemSubType == tostring(Enum.BundleType.BodyParts.Value)
		for i1, _ in p1.assetTypes do
			if p2.assetTypes[i1] and not IsItemSubTypeMatch then
				return true
			end
		end
		for i2, _ in p1.layeredClothingCategories do
			if p2.layeredClothingCategories[i2] and not IsItemSubTypeMatch then
				return true
			end
		end
	end
	return false
end

return shouldReplaceTryOn