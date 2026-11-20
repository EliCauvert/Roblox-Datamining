local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local AvatarAssetTypeMappingsModule = require(AvatarWorkshop.Constants.AvatarAssetTypeMappings)
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local _ = require(AvatarWorkshop.PreBuildFilters.PreBuildFilterTypes)
local _ = require(AvatarWorkshop.Utils.ExperienceAvatarSettings.ExperienceAvatarSettingsTypes)
local config = {
	[Enum.GameAvatarType.R6] = Enum.HumanoidRigType.R6,
	[Enum.GameAvatarType.R15] = Enum.HumanoidRigType.R15
}
local t = {}

for i, value in AvatarAssetTypeMappingsModule.assetTypeToAccessoryType do
	t[value] = i
end
local list = {
	Enum.AvatarAssetType.Hat, Enum.AvatarAssetType.HairAccessory,
	Enum.AvatarAssetType.FaceAccessory, Enum.AvatarAssetType.NeckAccessory,
	Enum.AvatarAssetType.ShoulderAccessory, Enum.AvatarAssetType.FrontAccessory,
	Enum.AvatarAssetType.BackAccessory, Enum.AvatarAssetType.WaistAccessory
}
local list1 = {
	Enum.AvatarAssetType.TShirtAccessory, Enum.AvatarAssetType.ShirtAccessory,
	Enum.AvatarAssetType.PantsAccessory, Enum.AvatarAssetType.DressSkirtAccessory,
	Enum.AvatarAssetType.JacketAccessory, Enum.AvatarAssetType.SweaterAccessory,
	Enum.AvatarAssetType.LeftShoeAccessory,
	Enum.AvatarAssetType.RightShoeAccessory, Enum.AvatarAssetType.ShortsAccessory
}
local config1 = {
	[Enum.AvatarAssetType.TShirtAccessory] = "Tops",
	[Enum.AvatarAssetType.ShirtAccessory] = "Tops",
	[Enum.AvatarAssetType.PantsAccessory] = "Bottoms",
	[Enum.AvatarAssetType.ShortsAccessory] = "Bottoms",
	[Enum.AvatarAssetType.DressSkirtAccessory] = "Bottoms",
	[Enum.AvatarAssetType.JacketAccessory] = "Outerwear",
	[Enum.AvatarAssetType.SweaterAccessory] = "Outerwear",
	[Enum.AvatarAssetType.LeftShoeAccessory] = "LeftShoes",
	[Enum.AvatarAssetType.RightShoeAccessory] = "RightShoes"
}
local config2 = {
	Tops = 7,
	Bottoms = 6,
	Outerwear = 8,
	LeftShoes = 5,
	RightShoes = 5
}
local config3 = {
	[Enum.AvatarAssetType.Head] = function(p1, Head)
		p1.Head = Head
	end,
	[Enum.AvatarAssetType.Torso] = function(p1, Torso)
		p1.Torso = Torso
	end,
	[Enum.AvatarAssetType.LeftArm] = function(p1, LeftArm)
		p1.LeftArm = LeftArm
	end,
	[Enum.AvatarAssetType.RightArm] = function(p1, RightArm)
		p1.RightArm = RightArm
	end,
	[Enum.AvatarAssetType.LeftLeg] = function(p1, LeftLeg)
		p1.LeftLeg = LeftLeg
	end,
	[Enum.AvatarAssetType.RightLeg] = function(p1, RightLeg)
		p1.RightLeg = RightLeg
	end,
	[Enum.AvatarAssetType.Shirt] = function(p1, Shirt)
		p1.Shirt = Shirt
	end,
	[Enum.AvatarAssetType.Pants] = function(p1, Pants)
		p1.Pants = Pants
	end,
	[Enum.AvatarAssetType.TShirt] = function(p1, GraphicTShirt)
		p1.GraphicTShirt = GraphicTShirt
	end
}

local function _(p1, List)
	-- upvalues: config3 (copy)
	for i, value in List do
		local Entry: (any, any) -> () = config3[i]
		
		if Entry then
			Entry(p1, value)
		end
	end
end

local _ = function(p2)
	p2.RunAnimation = 0
	p2.WalkAnimation = 0
	p2.FallAnimation = 0
	p2.JumpAnimation = 0
	p2.IdleAnimation = 0
	p2.SwimAnimation = 0
	p2.ClimbAnimation = 0
end

local function applyAccessoryOverrides(Humanoid: Humanoid, AssetOverrides, IsRMatch)
	-- upvalues: t (copy), config1 (copy), list (copy), AvatarAssetTypeMappingsModule (copy), list1 (copy), config2 (copy)
	local List = {}
	local Flag = false
	
	for _, accessory in Humanoid:GetAccessories(true) do
		local Entry = t[accessory.AccessoryType]
		local IsRMatch1 = Entry ~= nil and (AssetOverrides[Entry] ~= nil and (IsRMatch or config1[Entry] == nil))
		
		if accessory.AssetId == 0 or IsRMatch1 then
			Flag = true
		else
			table.insert(List, accessory)
		end
	end
	for _, value in list do
		local AssetOverride: number = AssetOverrides[value]
		
		if AssetOverride and AssetOverride > 0 then
			Flag = true
			table.insert(List, {
				IsLayered = false,
				AssetId = AssetOverride,
				AccessoryType = AvatarAssetTypeMappingsModule.assetTypeToAccessoryType[value]
			})
		end
	end
	local t1 = {}
	
	for _, value1 in if IsRMatch then list1 else {} do
		local AssetOverride: number = AssetOverrides[value1]
		local Entry = config1[value1]
		
		if AssetOverride and AssetOverride > 0 and not t1[Entry] then
			Flag = true
			t1[Entry] = true
			table.insert(List, {
				IsLayered = true,
				Puffiness = 1,
				AssetId = AssetOverride,
				AccessoryType = AvatarAssetTypeMappingsModule.assetTypeToAccessoryType[value1],
				Order = config2[Entry]
			})
		end
	end
	if Flag then
		Humanoid:SetAccessories(List, true)
	end
end

local function clampScales(HumanoidDescription, ScaleLimits)
	local function _(Value: number, p2): number
		return (math.clamp(Value, p2.Min, p2.Max))
	end
	
	local Height = ScaleLimits.height
	HumanoidDescription.HeightScale = math.clamp(HumanoidDescription.HeightScale, Height.Min, Height.Max)
	local Width = ScaleLimits.width
	HumanoidDescription.WidthScale = math.clamp(HumanoidDescription.WidthScale, Width.Min, Width.Max)
	local Head = ScaleLimits.head
	HumanoidDescription.HeadScale = math.clamp(HumanoidDescription.HeadScale, Head.Min, Head.Max)
	local BodyType = ScaleLimits.bodyType
	HumanoidDescription.BodyTypeScale = math.clamp(HumanoidDescription.BodyTypeScale, BodyType.Min, BodyType.Max)
	local Proportion = ScaleLimits.proportion
	HumanoidDescription.ProportionScale = math.clamp(HumanoidDescription.ProportionScale, Proportion.Min, Proportion.Max)
end

return function(p2)
	-- upvalues: config (copy), config3 (copy), applyAccessoryOverrides (copy), clampScales (copy)
	local Entry = if p2.avatarType then config[p2.avatarType] else nil
	local AnimationPacksMode = p2.animationPacksMode
	local IsAnimationPacksModeMatch: boolean = AnimationPacksMode ~= nil and (AnimationPacksMode == Enum.AvatarSettingsAnimationPacksMode.StandardR15 or AnimationPacksMode == Enum.AvatarSettingsAnimationPacksMode.StandardR6)
	
	return function(p3)
		-- upvalues: Entry (copy), p2 (copy), config3 (upval), applyAccessoryOverrides (upval), clampScales (upval), IsAnimationPacksModeMatch (copy)
		local Entry1 = Entry or p3.rigType
		local HumanoidDescription = p3.humanoidDescription
		local IsEntryMatch = Entry1 == Enum.HumanoidRigType.R15
		for i, assetOverride in p2.assetOverrides do
			local Entry2: (any, any) -> () = config3[i]
			
			if Entry2 then
				Entry2(HumanoidDescription, assetOverride)
			end
		end
		applyAccessoryOverrides(HumanoidDescription, p2.assetOverrides, IsEntryMatch)
		
		if p2.scaleLimits then
			clampScales(HumanoidDescription, p2.scaleLimits)
		end
		if IsEntryMatch and IsAnimationPacksModeMatch then
			HumanoidDescription.RunAnimation = 0
			HumanoidDescription.WalkAnimation = 0
			HumanoidDescription.FallAnimation = 0
			HumanoidDescription.JumpAnimation = 0
			HumanoidDescription.IdleAnimation = 0
			HumanoidDescription.SwimAnimation = 0
			HumanoidDescription.ClimbAnimation = 0
		end
		return {
			humanoidDescription = HumanoidDescription,
			rigType = Entry1,
			gearId = p3.gearId
		}
	end
end