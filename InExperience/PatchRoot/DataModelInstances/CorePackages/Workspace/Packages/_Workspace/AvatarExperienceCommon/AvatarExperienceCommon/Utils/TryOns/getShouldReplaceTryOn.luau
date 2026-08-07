local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local avatarExperienceFlagsModule = require(avatarExperienceCommon.Parent.AvatarExperienceFlags)
local _ = require(avatarExperienceCommon.Types.TryOnItemComparisonData)
local constantsModule = require(avatarExperienceCommon.Constants)
local itemTypeEnumModule = require(avatarExperienceCommon.Enums.ItemTypeEnum)
local fFlagAXCatalogMakeupSupport = avatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport

function shouldReplaceTryOn(p0, p1) --[[ line: 22 ]]
	-- upvalues: itemTypeEnumModule (ref), fFlagAXCatalogMakeupSupport (ref), constantsModule (ref)
	if p0.isDynamicHead and p1.isClassicHeadOrFace then
		return true
	elseif p0.isClassicHeadOrFace and p1.isDynamicHead then
		return true
	elseif p0.itemType == itemTypeEnumModule.Asset and p1.itemType == itemTypeEnumModule.Asset then
		if p0.itemSubType == p1.itemSubType and (not fFlagAXCatalogMakeupSupport or not constantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[p1.itemSubType]) then
			return true
		end
		for i, v in p1.layeredClothingCategories do
			if p0.layeredClothingCategories[i] then
				return true
			end
		end
	end
	if p0.itemType == itemTypeEnumModule.Bundle then
		if p1.itemType == itemTypeEnumModule.Bundle and p0.itemSubType == p1.itemSubType then
			return true
		end
		local var4 = p1.itemType == itemTypeEnumModule.Bundle and p1.itemSubType == tostring(Enum.BundleType.BodyParts.Value)
		
		for i, v in p0.assetTypes do
			if p1.assetTypes[i] and not var4 then
				return true
			end
		end
		for i_1, v in p0.layeredClothingCategories do
			if p1.layeredClothingCategories[i_1] and not var4 then
				return true
			end
		end
	end
	return false
end

return shouldReplaceTryOn