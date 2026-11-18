local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local AvatarExperienceModelModule = require(Parent.AvatarExperienceModel)
local _ = require(Parent.DataHydration.AvatarInventory)
local AvatarAssetTypeMappingsModule = require(AvatarWorkshop.Constants.AvatarAssetTypeMappings)
local InventoryOutfitType = AvatarExperienceModelModule.Enums.InventoryOutfitType
local InventoryTypeIdToInventoryOutfitType = AvatarExperienceModelModule.Constants.InventoryTypeIdToInventoryOutfitType
local AssetTypeToAccessoryType = AvatarAssetTypeMappingsModule.assetTypeToAccessoryType
local AssetTypeFromId = AvatarAssetTypeMappingsModule.assetTypeFromId
local list = {
	Enum.AvatarAssetType.Torso,
	Enum.AvatarAssetType.LeftArm,
	Enum.AvatarAssetType.RightArm,
	Enum.AvatarAssetType.LeftLeg,
	Enum.AvatarAssetType.RightLeg
}

local function isFullyQualifiedOutfit(p1): boolean
	-- upvalues: AssetTypeFromId (copy), list (copy), AssetTypeToAccessoryType (copy)
	local AvatarAssetTypes = {}
	
	for _, asset in p1.assets do
		local AssetTypeFromIdEntry = AssetTypeFromId[asset.assetType.id]
		
		if AssetTypeFromIdEntry then
			AvatarAssetTypes[AssetTypeFromIdEntry] = true
		end
	end
	for _, value in list do
		if not AvatarAssetTypes[value] then
			return false
		end
	end
	for avatarAssetType in AvatarAssetTypes do
		local AssetTypeToAccessoryTypeEntry = AssetTypeToAccessoryType[avatarAssetType]
		
		if AssetTypeToAccessoryTypeEntry and AssetTypeToAccessoryTypeEntry ~= Enum.AccessoryType.Hair or avatarAssetType == Enum.AvatarAssetType.Gear then
			return true
		end
	end
	return false
end

return function(p2, p3): string
	-- upvalues: InventoryTypeIdToInventoryOutfitType (copy), InventoryOutfitType (copy), isFullyQualifiedOutfit (copy)
	local InventoryTypeIdToInventoryOutfitTypeEntry = InventoryTypeIdToInventoryOutfitType[tostring(p2)]
	
	return if InventoryTypeIdToInventoryOutfitTypeEntry == InventoryOutfitType.Avatar then "EditableAvatar" elseif isFullyQualifiedOutfit(p3) then "FullyQualifiedOutfit" elseif InventoryTypeIdToInventoryOutfitTypeEntry == InventoryOutfitType.DynamicHead then "DynamicHead" elseif InventoryTypeIdToInventoryOutfitTypeEntry == InventoryOutfitType.Shoes then "Shoes" elseif InventoryTypeIdToInventoryOutfitTypeEntry == InventoryOutfitType.Animations then "Animations" elseif InventoryTypeIdToInventoryOutfitTypeEntry == InventoryOutfitType.PurchasedMakeup or InventoryTypeIdToInventoryOutfitTypeEntry == InventoryOutfitType.CreatedMakeup then "Makeup" else "Other"
end