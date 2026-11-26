local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local _ = require(AvatarWorkshop.Utils.HumanoidDescriptionAssets)

local function _(p1): string
	return "#" .. string.upper(p1:ToHex())
end

local _ = function(Vector, Vector1)
	return if Vector == nil or Vector == Vector1 then nil else { X = Vector.X, Y = Vector.Y, Z = Vector.Z }
end

local _ = function(List, Id, Meta)
	if Id ~= 0 then
		table.insert(List, { id = Id, meta = Meta })
	end
end

local function getDynamicHeadMeta(HumanoidDescription)
	local HeadShape = nil
	
	for _, BodyPartDescription in HumanoidDescription:GetChildren() do
		if BodyPartDescription:IsA("BodyPartDescription") and BodyPartDescription.BodyPart == Enum.BodyPart.Head and BodyPartDescription.HeadShape ~= "" and BodyPartDescription.HeadShape ~= "Default" then
			HeadShape = BodyPartDescription.HeadShape
		end
	end
	local Success, Result = pcall(function()
		-- upvalues: HumanoidDescription (copy)
		return HumanoidDescription.StaticFacialAnimation
	end)
	local IsResult = Success and Result == true or nil
	
	return if HeadShape == nil and IsResult == nil then nil else {
		version = 1,
		headShape = HeadShape,
		staticFacialAnimation = IsResult
	}
end

local function getAccessoryMeta(p1)
	local Position = p1.Position
	local Config = if Position == nil or Position == vector.create(0, 0, 0) then nil else { X = Position.X, Y = Position.Y, Z = Position.Z }
	local Rotation = p1.Rotation
	local Config1 = if Rotation == nil or Rotation == vector.create(0, 0, 0) then nil else { X = Rotation.X, Y = Rotation.Y, Z = Rotation.Z }
	local Scale = p1.Scale
	local config = {
		version = 1,
		order = if p1.IsLayered then p1.Order else nil,
		puffiness = if p1.IsLayered then p1.Puffiness else nil,
		position = Config,
		rotation = Config1,
		scale = if Scale == nil or Scale == vector.create(1, 1, 1) then nil else { X = Scale.X, Y = Scale.Y, Z = Scale.Z }
	}
	
	return if config.order == nil and config.puffiness == nil and config.position == nil and config.rotation == nil and config.scale == nil then nil else config
end

local function getAssets(p1)
	-- upvalues: getDynamicHeadMeta (copy), getAccessoryMeta (copy)
	local HumanoidDescription = p1.humanoidDescription
	local List = {}
	local Head = HumanoidDescription.Head
	local DynamicHeadMeta = getDynamicHeadMeta(HumanoidDescription)
	
	if Head ~= 0 then
		table.insert(List, { id = Head, meta = DynamicHeadMeta })
	end
	for _, Id in {
		HumanoidDescription.Torso, HumanoidDescription.LeftArm,
		HumanoidDescription.RightArm, HumanoidDescription.LeftLeg,
		HumanoidDescription.RightLeg, HumanoidDescription.Face,
		HumanoidDescription.Shirt, HumanoidDescription.Pants,
		HumanoidDescription.GraphicTShirt, HumanoidDescription.IdleAnimation,
		HumanoidDescription.WalkAnimation, HumanoidDescription.RunAnimation,
		HumanoidDescription.JumpAnimation, HumanoidDescription.FallAnimation,
		HumanoidDescription.ClimbAnimation, HumanoidDescription.SwimAnimation,
		HumanoidDescription.MoodAnimation
	} do
		if Id ~= 0 then
			table.insert(List, { meta = nil, id = Id })
		end
	end
	for _, accessory in HumanoidDescription:GetAccessories(true) do
		local AssetId = accessory.AssetId
		local AccessoryMeta = getAccessoryMeta(accessory)
		
		if AssetId ~= 0 then
			table.insert(List, { id = AssetId, meta = AccessoryMeta })
		end
	end
	for _, child in HumanoidDescription:GetChildren() do
		if child:IsA("MakeupDescription") then
			local AssetId = child.AssetId
			local Meta = { version = 1, order = child.Order }
			
			if AssetId ~= 0 then
				table.insert(List, { id = AssetId, meta = Meta })
			end
		elseif child:IsA("AvatarEffectDescription") then
			local AssetId = child.AssetId
			
			if AssetId ~= 0 then
				table.insert(List, { meta = nil, id = AssetId })
			end
		end
	end
	local GearId = p1.gearId or 0
	
	if GearId ~= 0 then
		table.insert(List, { meta = nil, id = GearId })
	end
	return List
end

return function(p2, Name)
	-- upvalues: getAssets (copy)
	local HumanoidDescription = p2.humanoidDescription
	
	return {
		outfitDefinition = {
			updateOutfitModel = {
				name = Name,
				bodyColors = {
					headColor = "#" .. string.upper(HumanoidDescription.HeadColor:ToHex()),
					torsoColor = "#" .. string.upper(HumanoidDescription.TorsoColor:ToHex()),
					rightArmColor = "#" .. string.upper(HumanoidDescription.RightArmColor:ToHex()),
					leftArmColor = "#" .. string.upper(HumanoidDescription.LeftArmColor:ToHex()),
					rightLegColor = "#" .. string.upper(HumanoidDescription.RightLegColor:ToHex()),
					leftLegColor = "#" .. string.upper(HumanoidDescription.LeftLegColor:ToHex())
				},
				assets = getAssets(p2),
				scale = {
					height = HumanoidDescription.HeightScale,
					width = HumanoidDescription.WidthScale,
					head = HumanoidDescription.HeadScale,
					depth = HumanoidDescription.DepthScale,
					proportion = HumanoidDescription.ProportionScale,
					bodyType = HumanoidDescription.BodyTypeScale
				},
				playerAvatarType = if p2.rigType == Enum.HumanoidRigType.R6 then 1 else 3
			}
		}
	}
end