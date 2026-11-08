local AvatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local Parent = AvatarExperienceSlotBasedEditor.Parent
local AXCommonModule = require(Parent.AXCommon)
local ASSETTYPENAMETOIDSTRING = AXCommonModule.Constants.ASSET_TYPE_NAME_TO_ID_STRING
local InventoryOutfitTypeToInventoryTypeId = require(Parent.AvatarExperienceModel).Constants.InventoryOutfitTypeToInventoryTypeId
local InventorySearchItemTypeModule = require(AvatarExperienceSlotBasedEditor.Enums.InventorySearchItemType)
local config = {
	[ASSETTYPENAMETOIDSTRING.Head] = true,
	[ASSETTYPENAMETOIDSTRING.Face] = true
}
local AssetSubtypes = {}

for i, value in AXCommonModule.Constants.ASSET_TYPE_ID_STRING_TO_NAME do
	if not config[i] then
		AssetSubtypes[tonumber(i)] = value
	end
end
local OutfitSubtypes = {}

for i1, value1 in InventoryOutfitTypeToInventoryTypeId do
	OutfitSubtypes[value1] = i1
end
return {
	KeyPrefix = "InventorySearch:",
	MaxPageLimit = 500,
	AssetSubtypes = AssetSubtypes,
	OutfitSubtypes = OutfitSubtypes,
	SearchableSubtypesByItemType = {
		[InventorySearchItemTypeModule.Asset] = AssetSubtypes,
		[InventorySearchItemTypeModule.Outfit] = OutfitSubtypes
	}
}