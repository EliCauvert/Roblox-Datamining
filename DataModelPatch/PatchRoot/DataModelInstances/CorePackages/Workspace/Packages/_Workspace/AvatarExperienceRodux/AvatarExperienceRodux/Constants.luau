local ASSETTYPENAMETOIDSTRING = require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.AvatarExperienceCommon).Constants.ASSET_TYPE_NAME_TO_ID_STRING
local AssetCategory = { LCTops = "LCTops", LCBottoms = "LCBottoms" }
local AssetCategoryToAssetTypes = {
	[AssetCategory.LCTops] = {
		ASSETTYPENAMETOIDSTRING.ShirtAccessory,
		ASSETTYPENAMETOIDSTRING.TShirtAccessory,
		ASSETTYPENAMETOIDSTRING.SweaterAccessory
	},
	[AssetCategory.LCBottoms] = {
		ASSETTYPENAMETOIDSTRING.PantsAccessory,
		ASSETTYPENAMETOIDSTRING.ShortsAccessory,
		ASSETTYPENAMETOIDSTRING.DressSkirtAccessory
	}
}
local AssetTypeToAssetCategory = {}

for i, assetCategoryToAssetType in AssetCategoryToAssetTypes do
	for _, value in assetCategoryToAssetType do
		AssetTypeToAssetCategory[value] = i
	end
end
return {
	AssetCategory = AssetCategory,
	AssetCategoryToAssetTypes = AssetCategoryToAssetTypes,
	AssetTypeToAssetCategory = AssetTypeToAssetCategory
}