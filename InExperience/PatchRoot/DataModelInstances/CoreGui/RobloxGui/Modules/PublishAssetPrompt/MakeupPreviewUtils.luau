local assetService = game:GetService("AssetService")
local playersService = game:GetService("Players")
local constantsModule = require(script.Parent.Constants)
local brickColor = BrickColor.new(194)

local function _(p0, p1)
	return CFrame.lookAt(p0, p0 + p1)
end

local lookAtCFrame = CFrame.lookAt(Vector3.new(0, 0.093621298671, -15.755899429321), Vector3.new(0, 0.093621298671, -14.755899429321))
local t = {
	[Enum.AvatarAssetType.FaceMakeup] = lookAtCFrame,
	[Enum.AvatarAssetType.LipMakeup] = CFrame.lookAt(Vector3.new(0, -0.299141585827, -6.41348028183), Vector3.new(0, -0.299141585827, -5.41348028183)),
	[Enum.AvatarAssetType.EyeMakeup] = CFrame.lookAt(Vector3.new(0, 0.108529612422, -9.357427597046), Vector3.new(0, 0.108529612422, -8.357427597046)),
	[Enum.AvatarAssetType.EyebrowAccessory] = CFrame.lookAt(Vector3.new(4.59289264679, 0.379174172878, -7.374272823334), Vector3.new(4.046112537384, 0.359522521496, -6.537227153778)),
	[Enum.AvatarAssetType.EyelashAccessory] = CFrame.lookAt(Vector3.new(4.593966007233, 0.279193401337, -7.37591791153), Vector3.new(4.047185897827, 0.259541749954, -6.538872241974))
}
local t_1 = {
	getHeadPreviewCameraData = function(p2)
		local head = p2:FindFirstChild("Head")
		
		if head and head:IsA("MeshPart") and not p2:FindFirstChild("HumanoidRootPart") then
			return head.CFrame, head.Size
		end
		return nil, nil
	end,
	setupMakeupThumbnailCamera = function(value, p3, p4)
		-- upvalues: lookAtCFrame (ref), t (ref)
		local head = value:FindFirstChild("Head")
		
		if not head or not head:IsA("MeshPart") then
			return false
		end
		local var15 = lookAtCFrame
		
		if p4 then
			var15 = t[p4] or var15
		end
		p3.CFrame = head.CFrame * var15
		p3.Focus = head.CFrame
		p3.FieldOfView = 5
		
		return true
	end,
	isMakeupAssetType = function(value)
		-- upvalues: constantsModule (ref)
		return constantsModule.MakeupAssetTypes[value] == true
	end
}
local t_2 = {
	[Enum.AvatarAssetType.FaceMakeup] = Enum.MakeupType.Face,
	[Enum.AvatarAssetType.LipMakeup] = Enum.MakeupType.Lip,
	[Enum.AvatarAssetType.EyeMakeup] = Enum.MakeupType.Eye
}
local t_3 = {
	[Enum.AvatarAssetType.EyebrowAccessory] = Enum.AccessoryType.Eyebrow,
	[Enum.AvatarAssetType.EyelashAccessory] = Enum.AccessoryType.Eyelash
}
local t_4 = {
	[Enum.AccessoryType.Hat] = true,
	[Enum.AccessoryType.Hair] = true,
	[Enum.AccessoryType.Face] = true,
	[Enum.AccessoryType.Eyebrow] = true,
	[Enum.AccessoryType.Eyelash] = true
}

local function removeMatchingChildren(p5, p6)
	for i, v in ipairs(p5:GetChildren()) do
		if p6(v) then
			v:Destroy()
		end
	end
end

local function addAssetToDescription(value, p7, p8)
	-- upvalues: t_2 (ref), t_3 (ref), removeMatchingChildren (ref)
	local var16 = p8 and t_2[p8]
	local var17 = p8 and t_3[p8]
	
	if var16 then
		removeMatchingChildren(value, function(p9)
			return p9:IsA("MakeupDescription")
		end)
		local makeupDescription = Instance.new("MakeupDescription")
		makeupDescription.MakeupType = var16
		makeupDescription.Instance = p7
		makeupDescription.Parent = value
		
		return
	elseif var17 then
		removeMatchingChildren(value, function(p10)
			-- upvalues: var17 (ref)
			return p10:IsA("AccessoryDescription") and p10.AccessoryType == var17
		end)
		local accessoryDescription = Instance.new("AccessoryDescription")
		accessoryDescription.AccessoryType = var17
		accessoryDescription.Instance = p7
		accessoryDescription.IsLayered = true
		accessoryDescription.Parent = value
	end
end

function t_1.stripToHead(p11)
	-- upvalues: t_4 (ref)
	local head = p11:FindFirstChild("Head")
	
	if not head then return end
	for i, v in ipairs(p11:GetChildren()) do
		if v:IsA("BasePart") then
			if v ~= head then
				v:Destroy()
			end
		elseif v:IsA("Accessory") and not t_4[v.AccessoryType] then
			v:Destroy()
		end
	end
end

function t_1.anchorRigidPreviewParts(p12)
	for i, v in ipairs(p12:GetDescendants()) do
		if v:IsA("BasePart") then
			local accessory = v:FindFirstAncestorWhichIsA("Accessory")
			
			if not accessory or accessory:FindFirstChildWhichIsA("WrapLayer", true) == nil then
				v.Anchored = true
			end
		end
	end
end

function t_1.getFolderAccessories(p13, p14)
	local t = {}
	
	for i, v in ipairs(p13:GetChildren()) do
		if v:IsA("Accessory") then
			table.insert(t, {
				asset = v,
				assetType = if p14 and p14[i] then p14[i].assetType else nil
			})
		end
	end
	return t
end

local function createHeadWithAsset(value, p15, p16, p17)
	-- upvalues: addAssetToDescription (ref), playersService (ref), t_1 (ref)
	if p15 then
		addAssetToDescription(value, p15, p16)
	end
	if p17 then
		for i, v in ipairs(p17) do
			addAssetToDescription(value, v.asset, v.assetType)
		end
	end
	local var23 = nil
	
	return nil
end

function t_1.createMakeupHeadPreview(p18, p19, p20)
	-- upvalues: playersService (ref), createHeadWithAsset (ref)
	local var24 = nil
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		local ok, status = pcall(function()
			-- upvalues: playersService (copy), localPlayer (ref)
			return playersService:GetHumanoidDescriptionFromUserIdAsync(localPlayer.UserId)
		end)
		
		if ok and status then
			var24 = status
		end
	end
	return createHeadWithAsset(var24 or Instance.new("HumanoidDescription"), p18, p19, p20)
end

function t_1.createMakeupThumbnailPreview(p21, p22)
	-- upvalues: addAssetToDescription (ref), playersService (ref), t_1 (ref), brickColor (ref)
	local humanoidDescription = Instance.new("HumanoidDescription")
	humanoidDescription.Head = 103273511207307
	
	if p21 then
		addAssetToDescription(humanoidDescription, p21, p22)
	end
	local bodyColors = nil
	local var27 = nil
	if not var27 then
		return nil
	end
	bodyColors = var27:FindFirstChildOfClass("BodyColors")
	
	if bodyColors then
		bodyColors.HeadColor = brickColor
	end
	local head = var27:FindFirstChild("Head")
	
	if head then
		head.Color = brickColor.Color
	end
	return var27
end

function t_1.compositeMakeupFolder(p23, p24)
	-- upvalues: assetService (ref)
	local t = {}
	
	for i, v in ipairs(p23:GetChildren()) do
		if v:IsA("Decal") then
			table.insert(t, v)
		end
	end
	if #t == 0 then
		return nil
	end
	local object = t[1].TextureContent and t[1].TextureContent.Object
	
	if not object then
		return nil
	elseif p24 then
		table.sort(t, function(p25, p26)
			-- upvalues: p24 (ref)
			return (p24[p25.Name] or 0) < (p24[p26.Name] or 0)
		end)
	end
	local var34
	local size = object.Size
	local vector2 = Vector2.new(size.X, size.Y)
	local decal = Instance.new("Decal")
	
	for i_1, v_1 in ipairs({
		"TextureContent",
		"RoughnessMapContent",
		"MetalnessMapContent",
		"NormalMapContent"
	}) do
		var34 = false
		
		for i_2, v_2 in ipairs(t) do
			local i_3 = v_2[v_1]
			
			if i_3 and (i_3.Object or i_3.Uri) then
				var34 = true
				break
			end
		end
		if var34 then
			local var35 = assetService:CreateEditableImage({ Size = vector2 })
			local var36 = false
			
			for i_3, v_3 in ipairs(t) do
				local var37 = v_3[v_1]
				
				if var37 then
					local object_1 = var37.Object
					
					if not object_1 and var37.Uri and var37.Uri ~= "" then
						local ok, status = pcall(function()
							-- upvalues: assetService (copy), var37 (ref)
							return assetService:CreateEditableImageAsync(var37)
						end)
						
						if ok then
							object_1 = status
						end
					end
					if object_1 then
						var35:DrawImage(Vector2.new(0, 0), object_1, if not var36 then Enum.ImageCombineType.Overwrite else Enum.ImageCombineType.AlphaBlend)
						var36 = true
					end
				end
			end
			decal[v_1] = Content.fromObject(var35)
		end
	end
	local wrapTextureTransfer = t[1]:FindFirstChildWhichIsA("WrapTextureTransfer")
	
	if wrapTextureTransfer then
		wrapTextureTransfer:Clone().Parent = decal
	end
	return decal
end

return t_1