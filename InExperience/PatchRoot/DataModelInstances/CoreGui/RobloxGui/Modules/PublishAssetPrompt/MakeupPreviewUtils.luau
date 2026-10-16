local AssetService = game:GetService("AssetService")
local Players = game:GetService("Players")
local ConstantsModule = require(script.Parent.Constants)
local _BrickColor = BrickColor.new(194)

local function _(Position, p1): CFrame --[[ Line: 17 | Named "makeCameraCFrame" ]]
	return CFrame.lookAt(Position, Position + p1)
end

local _CFrame = CFrame.lookAt(vector.create(0, 0.09362129867076874, -15.755899429321289), vector.create(0, 0.09362129867076874, -14.755899429321289))
local config = {
	[Enum.AvatarAssetType.FaceMakeup] = _CFrame,
	[Enum.AvatarAssetType.LipMakeup] = CFrame.lookAt(vector.create(0, -0.2991415858268738, -6.413480281829834), vector.create(0, -0.2991415858268738, -5.413480281829834)),
	[Enum.AvatarAssetType.EyeMakeup] = CFrame.lookAt(vector.create(0, 0.10852961242198944, -9.357427597045898), vector.create(0, 0.10852961242198944, -8.357427597045898)),
	[Enum.AvatarAssetType.EyebrowAccessory] = CFrame.lookAt(vector.create(4.592892646789551, 0.3791741728782654, -7.37427282333374), vector.create(4.046112537384033, 0.3595225214958191, -6.537227153778076)),
	[Enum.AvatarAssetType.EyelashAccessory] = CFrame.lookAt(vector.create(4.593966007232666, 0.2791934013366699, -7.375917911529541), vector.create(4.047185897827148, 0.25954174995422363, -6.538872241973877))
}
local config1 = {
	[Enum.AvatarAssetType.FaceMakeup] = Enum.MakeupType.Face,
	[Enum.AvatarAssetType.LipMakeup] = Enum.MakeupType.Lip,
	[Enum.AvatarAssetType.EyeMakeup] = Enum.MakeupType.Eye
}
local config2 = {
	[Enum.AvatarAssetType.EyebrowAccessory] = Enum.AccessoryType.Eyebrow,
	[Enum.AvatarAssetType.EyelashAccessory] = Enum.AccessoryType.Eyelash
}
local config3 = {
	[Enum.AccessoryType.Hat] = true,
	[Enum.AccessoryType.Hair] = true,
	[Enum.AccessoryType.Face] = true,
	[Enum.AccessoryType.Eyebrow] = true,
	[Enum.AccessoryType.Eyelash] = true
}

local function removeMatchingChildren(Parent, Callback) --[[ Line: 103 ]]
	for _, child in ipairs(Parent:GetChildren()) do
		if Callback(child) then
			child:Destroy()
		end
	end
end

local function addAssetToDescription(Parent, Asset, AssetType) --[[ Line: 112 ]]
	-- upvalues: config1 (copy), config2 (copy), removeMatchingChildren (copy)
	local Entry = AssetType and config1[AssetType]
	local Entry1 = AssetType and config2[AssetType]
	
	if Entry then
		removeMatchingChildren(Parent, function(MakeupDescription) --[[ Line: 117 ]]
			return MakeupDescription:IsA("MakeupDescription")
		end)
		local MakeupDescription = Instance.new("MakeupDescription")
		MakeupDescription.MakeupType = Entry
		MakeupDescription.Instance = Asset
		MakeupDescription.Parent = Parent
		
		return
	end
	if Entry1 then
		removeMatchingChildren(Parent, function(AccessoryDescription): boolean --[[ Line: 125 ]]
			-- upvalues: Entry1 (copy)
			return AccessoryDescription:IsA("AccessoryDescription") and AccessoryDescription.AccessoryType == Entry1
		end)
		local AccessoryDescription = Instance.new("AccessoryDescription")
		AccessoryDescription.AccessoryType = Entry1
		AccessoryDescription.Instance = Asset
		AccessoryDescription.IsLayered = true
		AccessoryDescription.Parent = Parent
	end
end

local MakeupPreviewUtils = {
	getHeadPreviewCameraData = function(Object) --[[ Line: 48 ]]
		local Head = Object:FindFirstChild("Head")
		
		if Head and Head:IsA("MeshPart") and not Object:FindFirstChild("HumanoidRootPart") then
			return Head.CFrame, Head.Size
		else
			return nil, nil
		end
	end,
	setupMakeupThumbnailCamera = function(Object, Camera, p1): boolean --[[ Line: 58 ]]
		-- upvalues: _CFrame (copy), config (copy)
		local Head = Object:FindFirstChild("Head")
		
		if not Head or not Head:IsA("MeshPart") then
			return false
		end
		local _CFrame1 = _CFrame
		
		if p1 then
			_CFrame1 = config[p1] or _CFrame1
		end
		Camera.CFrame = Head.CFrame * _CFrame1
		Camera.Focus = Head.CFrame
		Camera.FieldOfView = 5
		
		return true
	end,
	isMakeupAssetType = function(p1): boolean --[[ Line: 78 ]]
		-- upvalues: ConstantsModule (copy)
		return ConstantsModule.MakeupAssetTypes[p1] == true
	end,
	stripToHead = function(Model) --[[ Line: 142 ]]
		-- upvalues: config3 (copy)
		local Head = Model:FindFirstChild("Head")
		
		if not Head then return end
		for _, child in ipairs(Model:GetChildren()) do
			if child:IsA("BasePart") then
				if child ~= Head then
					child:Destroy()
				end
			elseif child:IsA("Accessory") and not config3[child.AccessoryType] then
				child:Destroy()
			end
		end
	end,
	anchorRigidPreviewParts = function(Model) --[[ Line: 163 ]]
		for _, Part in ipairs(Model:GetDescendants()) do
			if Part:IsA("BasePart") then
				local Accessory = Part:FindFirstAncestorWhichIsA("Accessory")
				
				if not Accessory or Accessory:FindFirstChildWhichIsA("WrapLayer", true) == nil then
					Part.Anchored = true
				end
			end
		end
	end,
	getFolderAccessories = function(Object, p1) --[[ Line: 181 ]]
		local List = {}
		
		for i, Accessory in ipairs(Object:GetChildren()) do
			if Accessory:IsA("Accessory") then
				table.insert(List, {
					asset = Accessory,
					assetType = if p1 and p1[i] then p1[i].assetType else nil
				})
			end
		end
		return List
	end
}

local function createHeadWithAsset(Parent, p2, p3, List) --[[ Line: 195 ]]
	-- upvalues: addAssetToDescription (copy), Players (copy), MakeupPreviewUtils (copy)
	if p2 then
		addAssetToDescription(Parent, p2, p3)
	end
	if List then
		for _, value in ipairs(List) do
			addAssetToDescription(Parent, value.asset, value.assetType)
		end
	end
	local HumanoidModelFromDescriptionAsync = nil
	
	if pcall(function() --[[ Line: 212 ]]
		-- upvalues: HumanoidModelFromDescriptionAsync (ref), Players (upval), Parent (copy)
		HumanoidModelFromDescriptionAsync = Players:CreateHumanoidModelFromDescriptionAsync(Parent, Enum.HumanoidRigType.R15)
	end) and HumanoidModelFromDescriptionAsync then
		HumanoidModelFromDescriptionAsync.Parent = workspace
		HumanoidModelFromDescriptionAsync:GetBoundingBox()
		HumanoidModelFromDescriptionAsync.Parent = nil
		MakeupPreviewUtils.stripToHead(HumanoidModelFromDescriptionAsync)
		MakeupPreviewUtils.anchorRigidPreviewParts(HumanoidModelFromDescriptionAsync)
		
		return HumanoidModelFromDescriptionAsync
	else
		return nil
	end
end

function MakeupPreviewUtils.createMakeupHeadPreview(p4, p5, p6) --[[ Line: 242 ]]
	-- upvalues: Players (copy), createHeadWithAsset (copy)
	local HumanoidDescription = nil
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer then
		local Success, Result = pcall(function() --[[ Line: 250 ]]
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
	return (createHeadWithAsset(HumanoidDescription, p4, p5, p6))
end

function MakeupPreviewUtils.createMakeupThumbnailPreview(p4, p5) --[[ Line: 268 ]]
	-- upvalues: addAssetToDescription (copy), Players (copy), MakeupPreviewUtils (copy), _BrickColor (copy)
	local HumanoidDescription = Instance.new("HumanoidDescription")
	HumanoidDescription.Head = 103273511207307
	
	if p4 then
		addAssetToDescription(HumanoidDescription, p4, p5)
	end
	local HumanoidModelFromDescriptionAsync = nil
	local Object = nil
	
	if pcall(function() --[[ Line: 212 ]]
		-- upvalues: HumanoidModelFromDescriptionAsync (ref), Players (upval), HumanoidDescription (copy)
		HumanoidModelFromDescriptionAsync = Players:CreateHumanoidModelFromDescriptionAsync(HumanoidDescription, Enum.HumanoidRigType.R15)
	end) and HumanoidModelFromDescriptionAsync then
		HumanoidModelFromDescriptionAsync.Parent = workspace
		HumanoidModelFromDescriptionAsync:GetBoundingBox()
		HumanoidModelFromDescriptionAsync.Parent = nil
		MakeupPreviewUtils.stripToHead(HumanoidModelFromDescriptionAsync)
		MakeupPreviewUtils.anchorRigidPreviewParts(HumanoidModelFromDescriptionAsync)
		Object = HumanoidModelFromDescriptionAsync
	else
		Object = nil
	end
	if not Object then
		return nil
	end
	local BodyColors = Object:FindFirstChildOfClass("BodyColors")
	
	if BodyColors then
		BodyColors.HeadColor = _BrickColor
	end
	local Head = Object:FindFirstChild("Head")
	
	if Head then
		Head.Color = _BrickColor.Color
	end
	return Object
end

function MakeupPreviewUtils.compositeMakeupFolder(Object, p4) --[[ Line: 296 ]]
	-- upvalues: AssetService (copy)
	local List = {}
	
	for _, Decal in ipairs(Object:GetChildren()) do
		if Decal:IsA("Decal") then
			table.insert(List, Decal)
		end
	end
	if #List == 0 then
		return nil
	end
	local Object1 = List[1].TextureContent and List[1].TextureContent.Object
	
	if not Object1 then
		return nil
	end
	if p4 then
		table.sort(List, function(A, B): boolean --[[ Line: 314 ]]
			-- upvalues: p4 (copy)
			return (p4[A.Name] or 0) < (p4[B.Name] or 0)
		end)
	end
	local Size = Object1.Size
	local _Vector2 = Vector2.new(Size.X, Size.Y)
	local Decal1 = Instance.new("Decal")
	local Flag = nil
	
	for _, value in ipairs({
		"TextureContent",
		"RoughnessMapContent",
		"MetalnessMapContent",
		"NormalMapContent"
	}) do
		Flag = false
		
		for _, value1 in ipairs(List) do
			local v1 = value1[value]
			
			if v1 and (v1.Object or v1.Uri) then
				Flag = true
				break
			end
		end
		if Flag then
			local EditableImage = AssetService:CreateEditableImage({ Size = _Vector2 })
			local Flag1 = false
			
			for _, value2 in ipairs(List) do
				local Content1 = value2[value]
				
				if Content1 then
					local Object2 = Content1.Object
					
					if not Object2 and Content1.Uri and Content1.Uri ~= "" then
						local Success, Result = pcall(function() --[[ Line: 353 ]]
							-- upvalues: AssetService (upval), Content1 (copy)
							return AssetService:CreateEditableImageAsync(Content1)
						end)
						
						if Success then
							Object2 = Result
						end
					end
					if Object2 then
						EditableImage:DrawImage(Vector2.new(0, 0), Object2, if Flag1 then Enum.ImageCombineType.AlphaBlend else Enum.ImageCombineType.Overwrite)
						Flag1 = true
					end
				end
			end
			Decal1[value] = Content.fromObject(EditableImage)
		end
	end
	local WrapTextureTransfer = List[1]:FindFirstChildWhichIsA("WrapTextureTransfer")
	
	if WrapTextureTransfer then
		WrapTextureTransfer:Clone().Parent = Decal1
	end
	return Decal1
end

return MakeupPreviewUtils