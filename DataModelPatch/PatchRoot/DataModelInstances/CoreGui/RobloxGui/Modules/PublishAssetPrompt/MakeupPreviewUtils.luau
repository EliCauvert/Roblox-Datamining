local Players = game:GetService("Players")
local ConstantsModule = require(script.Parent.Constants)
local _BrickColor = BrickColor.new(194)
local config = {
	[Enum.AvatarAssetType.FaceMakeup] = Enum.MakeupType.Face,
	[Enum.AvatarAssetType.LipMakeup] = Enum.MakeupType.Lip,
	[Enum.AvatarAssetType.EyeMakeup] = Enum.MakeupType.Eye
}
local config1 = {
	[Enum.AvatarAssetType.EyebrowAccessory] = Enum.AccessoryType.Eyebrow,
	[Enum.AvatarAssetType.EyelashAccessory] = Enum.AccessoryType.Eyelash
}

local function addAssetToDescription(Parent, p1, p2)
	-- upvalues: config (copy), config1 (copy)
	local Entry = p2 and config[p2]
	local Entry1 = p2 and config1[p2]
	
	if Entry then
		for _, MakeupDescription in ipairs(Parent:GetChildren()) do
			if MakeupDescription:IsA("MakeupDescription") then
				MakeupDescription:Destroy()
			end
		end
		local MakeupDescription1 = Instance.new("MakeupDescription")
		MakeupDescription1.MakeupType = Entry
		MakeupDescription1.Instance = p1
		MakeupDescription1.Parent = Parent
		
		return
	elseif Entry1 then
		local AccessoryDescription = Instance.new("AccessoryDescription")
		AccessoryDescription.AccessoryType = Entry1
		AccessoryDescription.Instance = p1
		AccessoryDescription.IsLayered = true
		AccessoryDescription.Parent = Parent
	end
end

local function createHeadWithAsset(HumanoidDescription, p3, p4)
	-- upvalues: addAssetToDescription (copy), Players (copy)
	addAssetToDescription(HumanoidDescription, p3, p4)
	local HumanoidModelFromDescriptionAsync = nil
	
	if not pcall(function()
		-- upvalues: HumanoidModelFromDescriptionAsync (ref), Players (upval), HumanoidDescription (copy)
		HumanoidModelFromDescriptionAsync = Players:CreateHumanoidModelFromDescriptionAsync(HumanoidDescription, Enum.HumanoidRigType.R15)
	end) or not HumanoidModelFromDescriptionAsync then
		return nil
	end
	local Head = HumanoidModelFromDescriptionAsync:FindFirstChild("Head")
	
	if Head then
		for _, Part in ipairs(HumanoidModelFromDescriptionAsync:GetChildren()) do
			if Part:IsA("BasePart") and Part ~= Head then
				Part:Destroy()
			end
		end
	end
	return HumanoidModelFromDescriptionAsync
end

return {
	isMakeupAssetType = function(p5): boolean
		-- upvalues: ConstantsModule (copy)
		return ConstantsModule.MakeupAssetTypes[p5] == true
	end,
	createMakeupHeadPreview = function(p5, p6)
		-- upvalues: Players (copy), createHeadWithAsset (copy)
		local HumanoidDescription = nil
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer then
			local Success, Result = pcall(function()
				-- upvalues: Players (upval), LocalPlayer (copy)
				return Players:GetHumanoidDescriptionFromUserIdAsync(LocalPlayer.UserId)
			end)
			
			if Success and Result then
				HumanoidDescription = Result
			end
		end
		if not HumanoidDescription then
			HumanoidDescription = Instance.new("HumanoidDescription")
		end
		return (createHeadWithAsset(HumanoidDescription, p5, p6))
	end,
	createMakeupThumbnailPreview = function(p5, p6)
		-- upvalues: createHeadWithAsset (copy), _BrickColor (copy)
		local HumanoidDescription = Instance.new("HumanoidDescription")
		HumanoidDescription.Head = 103273511207307
		local HeadWithAsset = createHeadWithAsset(HumanoidDescription, p5, p6)
		
		if not HeadWithAsset then
			return nil
		end
		local BodyColors = HeadWithAsset:FindFirstChildOfClass("BodyColors")
		
		if BodyColors then
			BodyColors.HeadColor = _BrickColor
		end
		local Head = HeadWithAsset:FindFirstChild("Head")
		
		if Head then
			Head.Color = _BrickColor.Color
		end
		return HeadWithAsset
	end
}