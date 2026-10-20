local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local _ = require(AvatarExperienceCatalog.Types)
local ItemTypeEnum = require(AvatarExperienceCatalog.Parent.AvatarExperienceCommon).Enums.ItemTypeEnum
local config = {
	[tostring(Enum.AssetType.ShirtAccessory.Value)] = "LCTops",
	[tostring(Enum.AssetType.TShirtAccessory.Value)] = "LCTops",
	[tostring(Enum.AssetType.SweaterAccessory.Value)] = "LCTops",
	[tostring(Enum.AssetType.PantsAccessory.Value)] = "LCBottoms",
	[tostring(Enum.AssetType.ShortsAccessory.Value)] = "LCBottoms",
	[tostring(Enum.AssetType.DressSkirtAccessory.Value)] = "LCBottoms"
}

function getTryOnItemComparisonData(p1)
	-- upvalues: config (copy), ItemTypeEnum (copy)
	local AssetTypes = {}
	local LayeredClothingCategories = {}
	local IsClassicHeadOrFace = false
	local IsDynamicHead = false
	
	local function _(Key)
		-- upvalues: AssetTypes (copy), config (upval), LayeredClothingCategories (copy)
		AssetTypes[Key] = true
		local Entry = config[Key]
		
		if Entry then
			LayeredClothingCategories[Entry] = true
		end
	end
	
	if p1.itemType == ItemTypeEnum.Asset then
		local ItemSubType = p1.itemSubType
		AssetTypes[ItemSubType] = true
		local Entry = config[ItemSubType]
		
		if Entry then
			LayeredClothingCategories[Entry] = true
		end
		if p1.itemSubType == tostring(Enum.AssetType.Head.Value) or p1.itemSubType == tostring(Enum.AssetType.Face.Value) then
			IsClassicHeadOrFace = true
		end
	elseif p1.itemType == ItemTypeEnum.Bundle and p1.bundleInfo then
		if p1.itemSubType == tostring(Enum.BundleType.DynamicHead.Value) then
			IsDynamicHead = true
		end
		for _, value in p1.bundleInfo do
			local AssetType = value.assetType
			AssetTypes[AssetType] = true
			local Entry = config[AssetType]
			
			if Entry then
				LayeredClothingCategories[Entry] = true
			end
		end
	end
	return {
		assetTypes = AssetTypes,
		layeredClothingCategories = LayeredClothingCategories,
		isClassicHeadOrFace = IsClassicHeadOrFace,
		isDynamicHead = IsDynamicHead,
		itemType = p1.itemType,
		itemSubType = p1.itemSubType
	}
end

return getTryOnItemComparisonData