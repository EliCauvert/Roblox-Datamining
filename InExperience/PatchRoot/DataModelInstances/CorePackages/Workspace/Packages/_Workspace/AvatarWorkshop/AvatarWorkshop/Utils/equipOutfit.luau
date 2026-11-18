local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local _ = require(AvatarWorkshop.Parent.DataHydration.AvatarInventory)
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local HumanoidDescriptionAssetsModule = require(AvatarWorkshop.Utils.HumanoidDescriptionAssets)
local CreateAvatarStateFromOutfitDetailModule = require(AvatarWorkshop.Utils.createAvatarStateFromOutfitDetail)
local _ = require(AvatarWorkshop.Utils.getOutfitKind)
local WearOutfitAssetsModule = require(AvatarWorkshop.Utils.wearOutfitAssets)
local AssetTypeFromId = require(AvatarWorkshop.Constants.AvatarAssetTypeMappings).assetTypeFromId
local list = {
	Enum.AvatarAssetType.Head,
	Enum.AvatarAssetType.DynamicHead,
	Enum.AvatarAssetType.EyebrowAccessory,
	Enum.AvatarAssetType.EyelashAccessory,
	Enum.AvatarAssetType.MoodAnimation
}
local list1 = {
	Enum.AvatarAssetType.EyebrowAccessory,
	Enum.AvatarAssetType.EyelashAccessory,
	Enum.AvatarAssetType.FaceMakeup,
	Enum.AvatarAssetType.EyeMakeup,
	Enum.AvatarAssetType.LipMakeup
}

local function equipWithFullReset(p1, p2, p3)
	-- upvalues: CreateAvatarStateFromOutfitDetailModule (copy), HumanoidDescriptionAssetsModule (copy)
	local AvatarStateFromOutfitDetailModule = CreateAvatarStateFromOutfitDetailModule(p2)
	local HumanoidDescription = AvatarStateFromOutfitDetailModule.humanoidDescription
	local HumanoidDescription1 = p1.humanoidDescription
	HumanoidDescription:SetEmotes(HumanoidDescription1:GetEmotes())
	HumanoidDescription:SetEquippedEmotes(HumanoidDescription1:GetEquippedEmotes())
	local SpawnEffect = HumanoidDescriptionAssetsModule.getSpawnEffect(HumanoidDescription1)
	
	if SpawnEffect and HumanoidDescriptionAssetsModule.getSpawnEffect(HumanoidDescription) == nil then
		SpawnEffect:Clone().Parent = HumanoidDescription
	end
	if p3 == "FullyQualifiedOutfit" then
		HumanoidDescription.HeadColor = HumanoidDescription1.HeadColor
		HumanoidDescription.TorsoColor = HumanoidDescription1.TorsoColor
		HumanoidDescription.LeftArmColor = HumanoidDescription1.LeftArmColor
		HumanoidDescription.RightArmColor = HumanoidDescription1.RightArmColor
		HumanoidDescription.LeftLegColor = HumanoidDescription1.LeftLegColor
		HumanoidDescription.RightLegColor = HumanoidDescription1.RightLegColor
	end
	return AvatarStateFromOutfitDetailModule
end

local function mergeOutfit(p1, p2, p3)
	-- upvalues: AssetTypeFromId (copy), list (copy), list1 (copy), HumanoidDescriptionAssetsModule (copy), WearOutfitAssetsModule (copy)
	local List = {}
	local Flag = false
	
	for _, asset in p2.assets do
		local AssetTypeFromIdEntry = AssetTypeFromId[asset.assetType.id]
		
		if AssetTypeFromIdEntry then
			table.insert(List, AssetTypeFromIdEntry)
			
			if AssetTypeFromIdEntry == Enum.AvatarAssetType.Head or AssetTypeFromIdEntry == Enum.AvatarAssetType.DynamicHead then
				Flag = true
			end
		end
	end
	if Flag or p3 == "DynamicHead" then
		table.move(list, 1, #list, #List + 1, List)
	end
	if p3 == "DynamicHead" then
		table.insert(List, Enum.AvatarAssetType.Face)
	elseif p3 == "Makeup" then
		table.move(list1, 1, #list1, #List + 1, List)
	end
	local HumanoidDescription = p1.humanoidDescription:Clone()
	HumanoidDescriptionAssetsModule.clearAssetTypes(HumanoidDescription, List)
	
	return {
		humanoidDescription = HumanoidDescription,
		rigType = p1.rigType,
		gearId = WearOutfitAssetsModule(HumanoidDescription, p2) or p1.gearId
	}
end

return function(p4, p5, p6)
	-- upvalues: equipWithFullReset (copy), mergeOutfit (copy)
	return if p6 == "EditableAvatar" or p6 == "FullyQualifiedOutfit" then equipWithFullReset(p4, p5, p6) else mergeOutfit(p4, p5, p6)
end