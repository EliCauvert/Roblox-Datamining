local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(ProfilePlatform.Parent.AvatarExperienceInspectAndBuy)
local _ = require(ProfilePlatform.Common.Types)

local function _(Normal, FullDegrees, ZeroDegrees, p1)
	return {
		normal = Normal,
		fullDegrees = FullDegrees,
		zeroDegrees = ZeroDegrees,
		weight = p1 or 1
	}
end

local config = {
	normal = vector.create(0, 0, -1),
	fullDegrees = 55,
	zeroDegrees = 86,
	weight = 1
}
local config1 = {
	normal = vector.create(0, 0, 1),
	fullDegrees = 55,
	zeroDegrees = 86,
	weight = 1
}
local config2 = {
	normal = nil,
	fullDegrees = 0,
	zeroDegrees = 180,
	weight = 1
}
local config3 = {
	FaceFrontAttachment = { config },
	FaceCenterAttachment = { config },
	NeckAttachment = { config },
	BodyFrontAttachment = { config },
	WaistFrontAttachment = { config },
	LeftCollarAttachment = { config },
	RightCollarAttachment = { config },
	BodyBackAttachment = {
		{
			normal = vector.create(0, 0, 1),
			fullDegrees = 65,
			zeroDegrees = 100,
			weight = 1
		}
	},
	WaistBackAttachment = {
		{
			normal = vector.create(0, 0, 1),
			fullDegrees = 65,
			zeroDegrees = 100,
			weight = 1
		}
	},
	LeftShoulderAttachment = {
		{
			normal = vector.create(-1, 0, 0),
			fullDegrees = 65,
			zeroDegrees = 100,
			weight = 1
		},
		{
			normal = vector.create(0, 0, -1),
			fullDegrees = 35,
			zeroDegrees = 75,
			weight = 0.85
		}
	},
	RightShoulderAttachment = {
		{
			normal = vector.create(1, 0, 0),
			fullDegrees = 65,
			zeroDegrees = 100,
			weight = 1
		},
		{
			normal = vector.create(0, 0, -1),
			fullDegrees = 35,
			zeroDegrees = 75,
			weight = 0.85
		}
	}
}
local Character = {
	TShirt = Enum.AvatarAssetType.TShirt.Value,
	Shirt = Enum.AvatarAssetType.Shirt.Value,
	Pants = Enum.AvatarAssetType.Pants.Value,
	Head = Enum.AvatarAssetType.Head.Value,
	Face = Enum.AvatarAssetType.Face.Value,
	DynamicHead = Enum.AvatarAssetType.DynamicHead.Value,
	Gear = Enum.AvatarAssetType.Gear.Value
}
local config4 = {
	[Character.TShirt] = "GraphicTShirt",
	[Character.Shirt] = "Shirt",
	[Character.Pants] = "Pants",
	[Character.Head] = "Head",
	[Character.DynamicHead] = "Head",
	[Character.Face] = "Face"
}
local config5 = {
	head = { "Head" },
	torso = { "UpperTorso", "Torso" },
	legs = { "LeftUpperLeg", "Left Leg" },
	leftFoot = { "LeftFoot", "Left Leg" },
	rightFoot = { "RightFoot", "Right Leg" }
}
local config6 = {
	torso = {
		UpperTorso = true,
		LowerTorso = true,
		LeftUpperArm = true,
		LeftLowerArm = true,
		LeftHand = true,
		RightUpperArm = true,
		RightLowerArm = true,
		RightHand = true,
		Torso = true,
		["Left Arm"] = true,
		["Right Arm"] = true
	},
	legs = {
		LowerTorso = true,
		LeftUpperLeg = true,
		LeftLowerLeg = true,
		LeftFoot = true,
		RightUpperLeg = true,
		RightLowerLeg = true,
		RightFoot = true,
		["Left Leg"] = true,
		["Right Leg"] = true
	}
}
local config7 = { UpperTorso = true, Torso = true }

local _ = function(List)
	for _, value in List do
		value.frontOnly = true
	end
	return List
end

local function findBodyPart(Object, p1)
	-- upvalues: config5 (copy)
	local Child = nil
	for _, ChildName in config5[p1] do
		Child = Object:FindFirstChild(ChildName)
		
		if Child and Child:IsA("BasePart") then
			return Child
		end
	end
	return nil
end

local function surfaceAnchors(Part, List, Head, Head1)
	local List1 = {}
	
	for _, value in List do
		local Normal = value.normal
		table.insert(List1, {
			part = Part,
			offset = Vector3.new(0, 0, Normal.Z * (Part.Size.Z / 2 + 0.05)),
			normal = Normal,
			fullDegrees = value.fullDegrees,
			zeroDegrees = value.zeroDegrees,
			weight = value.weight,
			target = Head,
			covers = Head1
		})
	end
	return List1
end

local _ = function(p2, p3, p4, p5, p6)
	-- upvalues: findBodyPart (copy), surfaceAnchors (copy), config6 (copy)
	local BodyPart = findBodyPart(p2, p3)
	
	return if BodyPart then surfaceAnchors(BodyPart, p4, p5 or BodyPart, p6 or config6[p3]) else {}
end

local config8 = {
	[Enum.AccessoryType.Jacket] = "torso",
	[Enum.AccessoryType.Sweater] = "torso",
	[Enum.AccessoryType.TShirt] = "torso",
	[Enum.AccessoryType.Shirt] = "torso",
	[Enum.AccessoryType.Pants] = "legs",
	[Enum.AccessoryType.Shorts] = "legs",
	[Enum.AccessoryType.DressSkirt] = "legs",
	[Enum.AccessoryType.LeftShoe] = "leftFoot",
	[Enum.AccessoryType.RightShoe] = "rightFoot",
	[Enum.AccessoryType.Eyebrow] = "head",
	[Enum.AccessoryType.Eyelash] = "head"
}
local config9 = {
	[Enum.AccessoryType.TShirt] = {
		UpperTorso = true,
		LowerTorso = true,
		LeftUpperArm = true,
		RightUpperArm = true
	}
}

local function accessoryAnchors(p2, Accessory: Accessory)
	-- upvalues: config8 (copy), config (copy), findBodyPart (copy), surfaceAnchors (copy), config6 (copy), config9 (copy), config1 (copy), config3 (copy), config2 (copy)
	local Handle = Accessory:FindFirstChild("Handle")
	
	if not Handle or not Handle:IsA("BasePart") then
		return {}
	end
	if Handle:FindFirstChildWhichIsA("WrapLayer") and Accessory:IsA("Accessory") then
		local Entry = config8[Accessory.AccessoryType]
		
		if Entry then
			if Entry ~= "head" then
				local Entry1 = config9[Accessory.AccessoryType]
				local list = { config, config1 }
				local BodyPart = findBodyPart(p2, Entry)
				
				return if BodyPart then surfaceAnchors(BodyPart, list, Accessory or BodyPart, Entry1 or config6[Entry]) else {}
			end
			local list = { config }
			local BodyPart = findBodyPart(p2, Entry)
			local SurfaceAnchorsResult = if BodyPart then surfaceAnchors(BodyPart, list, Accessory or BodyPart, config6[Entry]) else {}
			for _, value in SurfaceAnchorsResult do
				value.frontOnly = true
			end
			return SurfaceAnchorsResult
		end
	end
	local Attachment = Handle:FindFirstChildWhichIsA("Attachment")
	local SpecialMesh = Handle:FindFirstChildWhichIsA("SpecialMesh")
	local Offset = if SpecialMesh then SpecialMesh.Offset else vector.create(0, 0, 0)
	local List = {}
	
	for _, value1 in (if Attachment then config3[Attachment.Name] else nil) or { config2 } do
		table.insert(List, {
			part = Handle,
			offset = Offset,
			normal = value1.normal,
			fullDegrees = value1.fullDegrees,
			zeroDegrees = value1.zeroDegrees,
			weight = value1.weight,
			target = Accessory
		})
	end
	return List
end

local ItemAnchorsModule = {
	findAppliedAccessory = function(Object, AssetId)
		local Humanoid = Object:FindFirstChildOfClass("Humanoid")
		local HumanoidDescription = Humanoid and Humanoid:FindFirstChildOfClass("HumanoidDescription")
		
		if not HumanoidDescription then
			return nil
		end
		local Result = nil
		for _, AccessoryDescription in HumanoidDescription:GetChildren() do
			if AccessoryDescription:IsA("AccessoryDescription") and AccessoryDescription.AssetId == AssetId then
				local Success
				Success, Result = pcall(function()
					-- upvalues: AccessoryDescription (copy)
					return AccessoryDescription:GetAppliedInstance()
				end)
				
				if Success and Result then
					return Result
				end
			end
		end
		return nil
	end
}

local function anchorsForAsset(Object, Number, Number1, Callback)
	-- upvalues: accessoryAnchors (copy), Character (copy), config (copy), config1 (copy), findBodyPart (copy), surfaceAnchors (copy), config6 (copy), config7 (copy), config2 (copy)
	local CallbackResult = Callback(Number)
	
	if CallbackResult then
		return (accessoryAnchors(Object, CallbackResult))
	end
	if Number1 == Character.Shirt then
		local list = { config, config1 }
		local Torso = findBodyPart(Object, "torso")
		
		return if Torso then surfaceAnchors(Torso, list, Torso, config6.torso) else {}
	end
	if Number1 == Character.TShirt then
		local list = { config }
		local Torso = findBodyPart(Object, "torso")
		local SurfaceAnchorsResult = if Torso then surfaceAnchors(Torso, list, Torso, config7 or config6.torso) else {}
		for _, value in SurfaceAnchorsResult do
			value.frontOnly = true
		end
		return SurfaceAnchorsResult
	else
		if Number1 == Character.Pants then
			local list = { config, config1 }
			local Legs = findBodyPart(Object, "legs")
			
			return if Legs then surfaceAnchors(Legs, list, Legs, config6.legs) else {}
		end
		if Number1 == Character.Face then
			local list = { config }
			local Head = findBodyPart(Object, "head")
			local SurfaceAnchorsResult = if Head then surfaceAnchors(Head, list, Head, config6.head) else {}
			for _, value1 in SurfaceAnchorsResult do
				value1.frontOnly = true
			end
			return SurfaceAnchorsResult
		else
			if Number1 == Character.Head or Number1 == Character.DynamicHead then
				local list = { config }
				local Head = findBodyPart(Object, "head")
				
				return if Head then surfaceAnchors(Head, list, Head, config6.head) else {}
			end
			if Number1 == Character.Gear then
				local Tool = Object:FindFirstChildOfClass("Tool")
				local Handle = Tool and Tool:FindFirstChild("Handle")
				
				if Tool and Handle and Handle:IsA("BasePart") then
					return {
						{
							offset = vector.create(0, 0, 0),
							normal = nil,
							weight = 1,
							part = Handle,
							fullDegrees = config2.fullDegrees,
							zeroDegrees = config2.zeroDegrees,
							target = Tool
						}
					}
				end
			end
			return {}
		end
	end
end

local _ = function(Object, p3, p4): boolean
	-- upvalues: config4 (copy)
	local Entry = if p4 then config4[p4] else nil
	
	if Entry then
		local Humanoid = Object:FindFirstChildOfClass("Humanoid")
		local HumanoidDescription = Humanoid and Humanoid:FindFirstChildOfClass("HumanoidDescription")
		
		return HumanoidDescription ~= nil and HumanoidDescription[Entry] == p3
	else
		return true
	end
end

function ItemAnchorsModule.resolve(Object, List, p3)
	-- upvalues: ItemAnchorsModule (copy), config4 (copy), anchorsForAsset (copy)
	local P28 = p3 or function(p4)
		-- upvalues: ItemAnchorsModule (upval), Object (copy)
		return ItemAnchorsModule.findAppliedAccessory(Object, p4)
	end
	local List1 = {}
	
	for _, value in List do
		local Id = value.id
		local Number: number? = tonumber(Id)
		
		if Id and Number then
			local Anchors = {}
			
			if value.itemType == "Bundle" then
				local AssetsInBundle = value.assetsInBundle or {}
				for _, value1 in AssetsInBundle do
					local Number1: number? = tonumber(value1.id)
					local Number11: number? = tonumber(value1.assetType)
					
					if Number1 then
						local Entry = if Number11 then config4[Number11] else nil
						local v1 = nil
						
						if Entry then
							local Humanoid = Object:FindFirstChildOfClass("Humanoid")
							local HumanoidDescription = Humanoid and Humanoid:FindFirstChildOfClass("HumanoidDescription")
							v1 = HumanoidDescription ~= nil and HumanoidDescription[Entry] == Number1
						else
							v1 = true
						end
						if v1 then
							for _, value2 in anchorsForAsset(Object, Number1, Number11, P28) do
								table.insert(Anchors, value2)
							end
						end
					end
				end
			else
				Anchors = anchorsForAsset(Object, Number, tonumber(value.itemSubType), P28)
			end
			if #Anchors > 0 then
				table.insert(List1, { itemId = Id, anchors = Anchors })
			end
		end
	end
	return List1
end

return ItemAnchorsModule