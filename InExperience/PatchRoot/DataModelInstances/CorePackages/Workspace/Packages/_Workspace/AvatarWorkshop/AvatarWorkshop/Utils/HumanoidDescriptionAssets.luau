local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local _ = require(AvatarWorkshop.Parent.DataHydration.AvatarInventory)
local AvatarAssetTypeMappingsModule = require(AvatarWorkshop.Constants.AvatarAssetTypeMappings)
local AssetTypeToAccessoryType = AvatarAssetTypeMappingsModule.assetTypeToAccessoryType
local LayeredClothingOrder = AvatarAssetTypeMappingsModule.layeredClothingOrder
local AssetTypeToMakeupType = AvatarAssetTypeMappingsModule.assetTypeToMakeupType
local LayeredMakeupOrder = AvatarAssetTypeMappingsModule.layeredMakeupOrder
local SpawnEffectAssetType = AvatarAssetTypeMappingsModule.spawnEffectAssetType
local list = {
	Enum.AvatarAssetType.Shirt, Enum.AvatarAssetType.Pants,
	Enum.AvatarAssetType.TShirt, Enum.AvatarAssetType.Face,
	Enum.AvatarAssetType.Head, Enum.AvatarAssetType.Torso,
	Enum.AvatarAssetType.LeftArm, Enum.AvatarAssetType.RightArm,
	Enum.AvatarAssetType.LeftLeg, Enum.AvatarAssetType.RightLeg,
	Enum.AvatarAssetType.IdleAnimation, Enum.AvatarAssetType.WalkAnimation,
	Enum.AvatarAssetType.RunAnimation, Enum.AvatarAssetType.JumpAnimation,
	Enum.AvatarAssetType.FallAnimation, Enum.AvatarAssetType.ClimbAnimation,
	Enum.AvatarAssetType.SwimAnimation, Enum.AvatarAssetType.MoodAnimation
}

local function getPropertyAsset(Humanoid, AvatarAssetType)
	return if AvatarAssetType == Enum.AvatarAssetType.Shirt then Humanoid.Shirt elseif AvatarAssetType == Enum.AvatarAssetType.Pants then Humanoid.Pants elseif AvatarAssetType == Enum.AvatarAssetType.TShirt then Humanoid.GraphicTShirt elseif AvatarAssetType == Enum.AvatarAssetType.Face then Humanoid.Face elseif AvatarAssetType == Enum.AvatarAssetType.Head or AvatarAssetType == Enum.AvatarAssetType.DynamicHead then Humanoid.Head elseif AvatarAssetType == Enum.AvatarAssetType.Torso then Humanoid.Torso elseif AvatarAssetType == Enum.AvatarAssetType.LeftArm then Humanoid.LeftArm elseif AvatarAssetType == Enum.AvatarAssetType.RightArm then Humanoid.RightArm elseif AvatarAssetType == Enum.AvatarAssetType.LeftLeg then Humanoid.LeftLeg elseif AvatarAssetType == Enum.AvatarAssetType.RightLeg then Humanoid.RightLeg elseif AvatarAssetType == Enum.AvatarAssetType.IdleAnimation then Humanoid.IdleAnimation elseif AvatarAssetType == Enum.AvatarAssetType.WalkAnimation then Humanoid.WalkAnimation elseif AvatarAssetType == Enum.AvatarAssetType.RunAnimation then Humanoid.RunAnimation elseif AvatarAssetType == Enum.AvatarAssetType.JumpAnimation then Humanoid.JumpAnimation elseif AvatarAssetType == Enum.AvatarAssetType.FallAnimation then Humanoid.FallAnimation elseif AvatarAssetType == Enum.AvatarAssetType.ClimbAnimation then Humanoid.ClimbAnimation elseif AvatarAssetType == Enum.AvatarAssetType.SwimAnimation then Humanoid.SwimAnimation elseif AvatarAssetType == Enum.AvatarAssetType.MoodAnimation then Humanoid.MoodAnimation else nil
end

local function setPropertyAsset(Humanoid, AvatarAssetType, ClimbAnimation): boolean
	if AvatarAssetType == Enum.AvatarAssetType.Shirt then
		Humanoid.Shirt = ClimbAnimation
	elseif AvatarAssetType == Enum.AvatarAssetType.Pants then
		Humanoid.Pants = ClimbAnimation
	elseif AvatarAssetType == Enum.AvatarAssetType.TShirt then
		Humanoid.GraphicTShirt = ClimbAnimation
	elseif AvatarAssetType == Enum.AvatarAssetType.Face then
		Humanoid.Face = ClimbAnimation
	elseif AvatarAssetType == Enum.AvatarAssetType.Head or AvatarAssetType == Enum.AvatarAssetType.DynamicHead then
		Humanoid.Head = ClimbAnimation
	elseif AvatarAssetType == Enum.AvatarAssetType.Torso then
		Humanoid.Torso = ClimbAnimation
	elseif AvatarAssetType == Enum.AvatarAssetType.LeftArm then
		Humanoid.LeftArm = ClimbAnimation
	elseif AvatarAssetType == Enum.AvatarAssetType.RightArm then
		Humanoid.RightArm = ClimbAnimation
	elseif AvatarAssetType == Enum.AvatarAssetType.LeftLeg then
		Humanoid.LeftLeg = ClimbAnimation
	elseif AvatarAssetType == Enum.AvatarAssetType.RightLeg then
		Humanoid.RightLeg = ClimbAnimation
	elseif AvatarAssetType == Enum.AvatarAssetType.IdleAnimation then
		Humanoid.IdleAnimation = ClimbAnimation
	elseif AvatarAssetType == Enum.AvatarAssetType.WalkAnimation then
		Humanoid.WalkAnimation = ClimbAnimation
	elseif AvatarAssetType == Enum.AvatarAssetType.RunAnimation then
		Humanoid.RunAnimation = ClimbAnimation
	elseif AvatarAssetType == Enum.AvatarAssetType.JumpAnimation then
		Humanoid.JumpAnimation = ClimbAnimation
	elseif AvatarAssetType == Enum.AvatarAssetType.FallAnimation then
		Humanoid.FallAnimation = ClimbAnimation
	elseif AvatarAssetType == Enum.AvatarAssetType.ClimbAnimation then
		Humanoid.ClimbAnimation = ClimbAnimation
	elseif AvatarAssetType == Enum.AvatarAssetType.SwimAnimation then
		Humanoid.SwimAnimation = ClimbAnimation
	else
		if AvatarAssetType ~= Enum.AvatarAssetType.MoodAnimation then
			return false
		end
		Humanoid.MoodAnimation = ClimbAnimation
	end
	return true
end

local function addChildAsset(Parent, SpawnEffectAssetType1, AssetId, p1): boolean
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
end

local function _(SpawnEffectAssetType1): boolean
	-- upvalues: AssetTypeToMakeupType (copy), SpawnEffectAssetType (copy)
	return AssetTypeToMakeupType[SpawnEffectAssetType1] ~= nil or SpawnEffectAssetType ~= nil and SpawnEffectAssetType1 == SpawnEffectAssetType
end

local function getChildAssetIdOfType(Object, SpawnEffectAssetType1)
	-- upvalues: AssetTypeToMakeupType (copy), SpawnEffectAssetType (copy)
	if Object:IsA("MakeupDescription") then
		return if Object.MakeupType == AssetTypeToMakeupType[SpawnEffectAssetType1] then Object.AssetId else nil
	elseif Object:IsA("AvatarEffectDescription") then
		local IsEffectTypeMatch: boolean = SpawnEffectAssetType1 == SpawnEffectAssetType and Object.EffectType == Enum.AvatarEffectType.Spawn
		
		return if IsEffectTypeMatch then Object.AssetId else nil
	else
		return nil
	end
end

return {
	addChildAsset = addChildAsset,
	clearAssetTypes = function(Humanoid: Humanoid, List)
		-- upvalues: AssetTypeToAccessoryType (copy), AssetTypeToMakeupType (copy), SpawnEffectAssetType (copy), getChildAssetIdOfType (copy), setPropertyAsset (copy)
		local t = {}
		
		for _, value in List do
			local AssetTypeToAccessoryTypeEntry = AssetTypeToAccessoryType[value]
			
			if AssetTypeToAccessoryTypeEntry then
				t[AssetTypeToAccessoryTypeEntry] = true
			elseif AssetTypeToMakeupType[value] ~= nil or SpawnEffectAssetType ~= nil and value == SpawnEffectAssetType then
				for _, child in Humanoid:GetChildren() do
					if getChildAssetIdOfType(child, value) then
						child:Destroy()
					end
				end
			else
				setPropertyAsset(Humanoid, value, 0)
			end
		end
		local List1 = {}
		
		for _, accessory in Humanoid:GetAccessories(true) do
			if not t[accessory.AccessoryType] then
				table.insert(List1, accessory)
			end
		end
		Humanoid:SetAccessories(List1, true)
	end,
	createAccessoryInfo = function(AssetId, p1, p2)
		-- upvalues: AssetTypeToAccessoryType (copy), LayeredClothingOrder (copy)
		local AssetTypeToAccessoryTypeEntry = AssetTypeToAccessoryType[p1]
		
		if AssetTypeToAccessoryTypeEntry == nil then
			return nil
		else
			local P7 = p2 or LayeredClothingOrder[p1]
			
			return {
				AssetId = AssetId,
				AccessoryType = AssetTypeToAccessoryTypeEntry,
				IsLayered = P7 ~= nil,
				Order = P7
			}
		end
	end,
	equipAsset = function(Humanoid: Humanoid, AssetId, AvatarAssetType)
		-- upvalues: AssetTypeToMakeupType (copy), SpawnEffectAssetType (copy), getChildAssetIdOfType (copy), addChildAsset (copy), AssetTypeToAccessoryType (copy), LayeredClothingOrder (copy), getPropertyAsset (copy), setPropertyAsset (copy)
		if AssetTypeToMakeupType[AvatarAssetType] ~= nil or SpawnEffectAssetType ~= nil and AvatarAssetType == SpawnEffectAssetType then
			local List = {}
			
			for _, child in Humanoid:GetChildren() do
				local ChildAssetIdOfType = getChildAssetIdOfType(child, AvatarAssetType)
				
				if ChildAssetIdOfType == AssetId then
					return false
				elseif ChildAssetIdOfType then
					table.insert(List, child)
				end
			end
			for _, value in List do
				value:Destroy()
			end
			return (addChildAsset(Humanoid, AvatarAssetType, AssetId))
		else
			local AssetTypeToAccessoryTypeEntry = AssetTypeToAccessoryType[AvatarAssetType]
			local v1 = nil
			
			if AssetTypeToAccessoryTypeEntry == nil then
				v1 = nil
			else
				local LayeredClothingOrderEntry = LayeredClothingOrder[AvatarAssetType]
				v1 = {
					AssetId = AssetId,
					AccessoryType = AssetTypeToAccessoryTypeEntry,
					IsLayered = LayeredClothingOrderEntry ~= nil,
					Order = LayeredClothingOrderEntry
				}
			end
			if v1 == nil then
				return getPropertyAsset(Humanoid, AvatarAssetType) ~= AssetId and setPropertyAsset(Humanoid, AvatarAssetType, AssetId)
			end
			local Accessories = Humanoid:GetAccessories(true)
			local IsAccessoryTypeMatch = v1.AccessoryType == Enum.AccessoryType.Hat
			local Count = 0
			
			for _, accessory in Accessories do
				if accessory.AssetId == AssetId then
					return false
				elseif accessory.AccessoryType == Enum.AccessoryType.Hat then
					Count += 1
				end
			end
			local List = {}
			local Largest: number = if IsAccessoryTypeMatch then math.max(Count - 3 + 1, 0) else 0
			for _, accessory1 in Accessories do
				if accessory1.AccessoryType == v1.AccessoryType then
					if IsAccessoryTypeMatch then
						if Largest > 0 then
							Largest -= 1
							continue
						end
					else
						continue
					end
				end
				table.insert(List, accessory1)
			end
			table.insert(List, v1)
			Humanoid:SetAccessories(List, true)
			
			return true
		end
	end,
	getAccessories = function(Humanoid: Humanoid)
		return Humanoid:GetAccessories(true)
	end,
	getEquippedAssetIds = function(Humanoid: Humanoid)
		-- upvalues: list (copy), getPropertyAsset (copy)
		local List = {}
		
		for _, accessory in Humanoid:GetAccessories(true) do
			table.insert(List, accessory.AssetId)
		end
		for _, value in list do
			local PropertyAsset = getPropertyAsset(Humanoid, value)
			
			if PropertyAsset and PropertyAsset ~= 0 then
				table.insert(List, PropertyAsset)
			end
		end
		for _, child in Humanoid:GetChildren() do
			if child:IsA("MakeupDescription") then
				table.insert(List, child.AssetId)
			elseif child:IsA("AvatarEffectDescription") then
				table.insert(List, child.AssetId)
			end
		end
		return List
	end,
	getHeadPartDescription = function(Object)
		for _, BodyPartDescription in Object:GetChildren() do
			if BodyPartDescription:IsA("BodyPartDescription") and BodyPartDescription.BodyPart == Enum.BodyPart.Head then
				return BodyPartDescription
			end
		end
		return nil
	end,
	getSpawnEffect = function(Object)
		for _, AvatarEffectDescription in Object:GetChildren() do
			if AvatarEffectDescription:IsA("AvatarEffectDescription") and AvatarEffectDescription.EffectType == Enum.AvatarEffectType.Spawn then
				return AvatarEffectDescription
			end
		end
		return nil
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
	setPropertyAsset = setPropertyAsset,
	unequipAsset = function(Humanoid: Humanoid, AssetId, AvatarAssetType)
		-- upvalues: AssetTypeToMakeupType (copy), SpawnEffectAssetType (copy), getChildAssetIdOfType (copy), AssetTypeToAccessoryType (copy), getPropertyAsset (copy), setPropertyAsset (copy)
		if AssetTypeToMakeupType[AvatarAssetType] ~= nil or SpawnEffectAssetType ~= nil and AvatarAssetType == SpawnEffectAssetType then
			for _, child in Humanoid:GetChildren() do
				if getChildAssetIdOfType(child, AvatarAssetType) == AssetId then
					child:Destroy()
					
					return true
				end
			end
			return false
		else
			if AssetTypeToAccessoryType[AvatarAssetType] == nil then
				return getPropertyAsset(Humanoid, AvatarAssetType) == AssetId and setPropertyAsset(Humanoid, AvatarAssetType, 0)
			end
			local Accessories = Humanoid:GetAccessories(true)
			local List = {}
			
			for _, accessory in Accessories do
				if accessory.AssetId ~= AssetId then
					table.insert(List, accessory)
				end
			end
			if #List == #Accessories then
				return false
			else
				Humanoid:SetAccessories(List, true)
				
				return true
			end
		end
	end
}