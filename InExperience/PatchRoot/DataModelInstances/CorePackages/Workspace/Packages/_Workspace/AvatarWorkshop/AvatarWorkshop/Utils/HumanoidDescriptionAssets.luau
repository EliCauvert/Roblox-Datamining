local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local _ = require(AvatarWorkshop.Parent.DataHydration.AvatarInventory)
local AvatarAssetTypeMappingsModule = require(AvatarWorkshop.Constants.AvatarAssetTypeMappings)
local AssetTypeToAccessoryType = AvatarAssetTypeMappingsModule.assetTypeToAccessoryType
local LayeredClothingOrder = AvatarAssetTypeMappingsModule.layeredClothingOrder
local AssetTypeToMakeupType = AvatarAssetTypeMappingsModule.assetTypeToMakeupType
local LayeredMakeupOrder = AvatarAssetTypeMappingsModule.layeredMakeupOrder
local SpawnEffectAssetType = AvatarAssetTypeMappingsModule.spawnEffectAssetType

return {
	addChildAsset = function(Parent, SpawnEffectAssetType1, AssetId, p1): boolean
		-- upvalues: AssetTypeToMakeupType (copy), LayeredMakeupOrder (copy), SpawnEffectAssetType (copy)
		local AssetTypeToMakeupTypeEntry = AssetTypeToMakeupType[SpawnEffectAssetType1]
		
		if AssetTypeToMakeupTypeEntry then
			local MakeupDescription = Instance.new("MakeupDescription")
			MakeupDescription.MakeupType = AssetTypeToMakeupTypeEntry
			MakeupDescription.AssetId = AssetId
			MakeupDescription.Order = p1 or LayeredMakeupOrder[SpawnEffectAssetType1]
			MakeupDescription.Parent = Parent
		else
			if SpawnEffectAssetType == nil or SpawnEffectAssetType1 ~= SpawnEffectAssetType then
				return false
			end
			local AvatarEffectDescription = Instance.new("AvatarEffectDescription")
			AvatarEffectDescription.AssetId = AssetId
			AvatarEffectDescription.EffectType = Enum.AvatarEffectType.Spawn
			AvatarEffectDescription.Parent = Parent
		end
		return true
	end,
	createAccessoryInfo = function(AssetId, p1, p2)
		-- upvalues: AssetTypeToAccessoryType (copy), LayeredClothingOrder (copy)
		local AssetTypeToAccessoryTypeEntry = AssetTypeToAccessoryType[p1]
		
		if AssetTypeToAccessoryTypeEntry == nil then
			return nil
		else
			local P5 = p2 or LayeredClothingOrder[p1]
			
			return {
				AssetId = AssetId,
				AccessoryType = AssetTypeToAccessoryTypeEntry,
				IsLayered = P5 ~= nil,
				Order = P5
			}
		end
	end,
	setEquippedEmotes = function(HumanoidDescription, List)
		local Emotes = {}
		local List1 = {}
		
		for _, value in List do
			local Text = tostring(value.assetId)
			Emotes[Text] = { value.assetId }
			table.insert(List1, { Name = Text, Slot = value.position })
		end
		HumanoidDescription:SetEmotes(Emotes)
		HumanoidDescription:SetEquippedEmotes(List1)
	end,
	setPropertyAsset = function(p1, AvatarAssetType, ClimbAnimation): boolean
		if AvatarAssetType == Enum.AvatarAssetType.Shirt then
			p1.Shirt = ClimbAnimation
		elseif AvatarAssetType == Enum.AvatarAssetType.Pants then
			p1.Pants = ClimbAnimation
		elseif AvatarAssetType == Enum.AvatarAssetType.TShirt then
			p1.GraphicTShirt = ClimbAnimation
		elseif AvatarAssetType == Enum.AvatarAssetType.Face then
			p1.Face = ClimbAnimation
		elseif AvatarAssetType == Enum.AvatarAssetType.Head or AvatarAssetType == Enum.AvatarAssetType.DynamicHead then
			p1.Head = ClimbAnimation
		elseif AvatarAssetType == Enum.AvatarAssetType.Torso then
			p1.Torso = ClimbAnimation
		elseif AvatarAssetType == Enum.AvatarAssetType.LeftArm then
			p1.LeftArm = ClimbAnimation
		elseif AvatarAssetType == Enum.AvatarAssetType.RightArm then
			p1.RightArm = ClimbAnimation
		elseif AvatarAssetType == Enum.AvatarAssetType.LeftLeg then
			p1.LeftLeg = ClimbAnimation
		elseif AvatarAssetType == Enum.AvatarAssetType.RightLeg then
			p1.RightLeg = ClimbAnimation
		elseif AvatarAssetType == Enum.AvatarAssetType.IdleAnimation then
			p1.IdleAnimation = ClimbAnimation
		elseif AvatarAssetType == Enum.AvatarAssetType.WalkAnimation then
			p1.WalkAnimation = ClimbAnimation
		elseif AvatarAssetType == Enum.AvatarAssetType.RunAnimation then
			p1.RunAnimation = ClimbAnimation
		elseif AvatarAssetType == Enum.AvatarAssetType.JumpAnimation then
			p1.JumpAnimation = ClimbAnimation
		elseif AvatarAssetType == Enum.AvatarAssetType.FallAnimation then
			p1.FallAnimation = ClimbAnimation
		elseif AvatarAssetType == Enum.AvatarAssetType.ClimbAnimation then
			p1.ClimbAnimation = ClimbAnimation
		elseif AvatarAssetType == Enum.AvatarAssetType.SwimAnimation then
			p1.SwimAnimation = ClimbAnimation
		else
			if AvatarAssetType ~= Enum.AvatarAssetType.MoodAnimation then
				return false
			end
			p1.MoodAnimation = ClimbAnimation
		end
		return true
	end
}