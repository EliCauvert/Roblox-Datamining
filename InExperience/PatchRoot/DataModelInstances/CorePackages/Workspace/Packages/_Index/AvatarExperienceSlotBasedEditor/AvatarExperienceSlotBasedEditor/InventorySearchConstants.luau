local AvatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local Parent = AvatarExperienceSlotBasedEditor.Parent
local AXCommonModule = require(Parent.AXCommon)
local AvatarExperienceModelModule = require(Parent.AvatarExperienceModel)
local ASSETTYPENAMETOIDSTRING = AXCommonModule.Constants.ASSET_TYPE_NAME_TO_ID_STRING
local InventoryOutfitTypeToInventoryTypeId = AvatarExperienceModelModule.Constants.InventoryOutfitTypeToInventoryTypeId
local InventoryOutfitType = AvatarExperienceModelModule.Enums.InventoryOutfitType
local InventorySearchItemTypeModule = require(AvatarExperienceSlotBasedEditor.Enums.InventorySearchItemType)
local _ = require(AvatarExperienceSlotBasedEditor.Types)
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
local config1 = {
	[InventoryOutfitType.Body] = true,
	[InventoryOutfitType.DynamicHead] = true,
	[InventoryOutfitType.Shoes] = true,
	[InventoryOutfitType.Animations] = true
}
local t = {}

for _, value2 in {
	Enum.AvatarAssetType.DynamicHead, Enum.AvatarAssetType.MoodAnimation,
	Enum.AvatarAssetType.EyebrowAccessory, Enum.AvatarAssetType.EyelashAccessory,
	Enum.AvatarAssetType.Torso, Enum.AvatarAssetType.LeftArm,
	Enum.AvatarAssetType.RightArm, Enum.AvatarAssetType.LeftLeg,
	Enum.AvatarAssetType.RightLeg, Enum.AvatarAssetType.ClimbAnimation,
	Enum.AvatarAssetType.FallAnimation, Enum.AvatarAssetType.IdleAnimation,
	Enum.AvatarAssetType.JumpAnimation, Enum.AvatarAssetType.RunAnimation,
	Enum.AvatarAssetType.SwimAnimation, Enum.AvatarAssetType.WalkAnimation,
	Enum.AvatarAssetType.LeftShoeAccessory,
	Enum.AvatarAssetType.RightShoeAccessory, Enum.AvatarAssetType.EmoteAnimation
} do
	t[value2.Value] = true
end
local List = {}

for assetSubtype in AssetSubtypes do
	if not t[assetSubtype] then
		table.insert(List, assetSubtype)
	end
end
table.sort(List)
local List1 = {}

for i2, value3 in InventoryOutfitTypeToInventoryTypeId do
	if config1[i2] then
		table.insert(List1, value3)
	end
end
table.sort(List1)
local List2 = {}

for _, ItemSubType in List do
	table.insert(List2, {
		itemType = InventorySearchItemTypeModule.Asset,
		itemSubType = ItemSubType
	})
end
for _, ItemSubType1 in List1 do
	table.insert(List2, {
		itemType = InventorySearchItemTypeModule.Outfit,
		itemSubType = ItemSubType1
	})
end
return {
	KeyPrefix = "InventorySearch:",
	MaxPageLimit = 500,
	AssetSubtypes = AssetSubtypes,
	OutfitSubtypes = OutfitSubtypes,
	SearchableSubtypesByItemType = {
		[InventorySearchItemTypeModule.Asset] = AssetSubtypes,
		[InventorySearchItemTypeModule.Outfit] = OutfitSubtypes
	},
	AllTabItemCategories = List2
}