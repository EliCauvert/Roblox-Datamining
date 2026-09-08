local assetService = game:GetService("AssetService")
local playersService = game:GetService("Players")
local constantsModule = require(script.Parent.Constants)
local brickColor = BrickColor.new(194)

local function _(p1, p2)
	return CFrame.lookAt(p1, p1 + p2)
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
	getHeadPreviewCameraData = function(p1)
		local head = p1:FindFirstChild("Head")
		
		if head and head:IsA("MeshPart") and not p1:FindFirstChild("HumanoidRootPart") then
			return head.CFrame, head.Size
		end
		return nil, nil
	end,
	setupMakeupThumbnailCamera = function(value, p1, p2)
		-- upvalues: lookAtCFrame (ref), t (ref)
		local head = value:FindFirstChild("Head")
		
		if not head or not head:IsA("MeshPart") then
			return false
		end
		local var1 = lookAtCFrame
		
		if p2 then
			var1 = t[p2] or var1
		end
		p1.CFrame = head.CFrame * var1
		p1.Focus = head.CFrame
		p1.FieldOfView = 5
		
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

local function removeMatchingChildren(p1, p2)
	for i, v in ipairs(p1:GetChildren()) do
		if p2(v) then
			v:Destroy()
		end
	end
end

local function addAssetToDescription(value, p3, p4)
	-- upvalues: t_2 (ref), t_3 (ref), removeMatchingChildren (ref)
	local var1 = p4 and t_2[p4]
	local var2 = p4 and t_3[p4]
	
	if var1 then
		removeMatchingChildren(value, function(p5)
			return p5:IsA("MakeupDescription")
		end)
		local makeupDescription = Instance.new("MakeupDescription")
		makeupDescription.MakeupType = var1
		makeupDescription.Instance = p3
		makeupDescription.Parent = value
		
		return
	elseif var2 then
		removeMatchingChildren(value, function(p5)
			-- upvalues: var2 (ref)
			return p5:IsA("AccessoryDescription") and p5.AccessoryType == var2
		end)
		local accessoryDescription = Instance.new("AccessoryDescription")
		accessoryDescription.AccessoryType = var2
		accessoryDescription.Instance = p3
		accessoryDescription.IsLayered = true
		accessoryDescription.Parent = value
	end
end

function t_1.stripToHead(p3)
	-- upvalues: t_4 (ref)
	local head = p3:FindFirstChild("Head")
	
	if not head then return end
	for i, v in ipairs(p3:GetChildren()) do
		if v:IsA("BasePart") then
			if v ~= head then
				v:Destroy()
			end
		elseif v:IsA("Accessory") and not t_4[v.AccessoryType] then
			v:Destroy()
		end
	end
end

function t_1.anchorRigidPreviewParts(p4)
	for i, v in ipairs(p4:GetDescendants()) do
		if v:IsA("BasePart") then
			local accessory = v:FindFirstAncestorWhichIsA("Accessory")
			
			if not accessory or accessory:FindFirstChildWhichIsA("WrapLayer", true) == nil then
				v.Anchored = true
			end
		end
	end
end

function t_1.getFolderAccessories(p5, p6)
	local t = {}
	
	for i, v in ipairs(p5:GetChildren()) do
		if v:IsA("Accessory") then
			table.insert(t, {
				asset = v,
				assetType = if p6 and p6[i] then p6[i].assetType else nil
			})
		end
	end
	return t
end

local function createHeadWithAsset(value, p7, p8, p9)
	-- upvalues: addAssetToDescription (ref), playersService (ref), t_1 (ref)
	if p7 then
		addAssetToDescription(value, p7, p8)
	end
	if p9 then
		for i, v in ipairs(p9) do
			addAssetToDescription(value, v.asset, v.assetType)
		end
	end
	local var1 = nil
	
	return nil
end

function t_1.createMakeupHeadPreview(p10, p11, p12)
	-- upvalues: playersService (ref), createHeadWithAsset (ref)
	local var2 = nil
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		local ok, status = pcall(function()
			-- upvalues: playersService (copy), localPlayer (ref)
			return playersService:GetHumanoidDescriptionFromUserIdAsync(localPlayer.UserId)
		end)
		
		if ok and status then
			var2 = status
		end
	end
	return createHeadWithAsset(var2 or Instance.new("HumanoidDescription"), p10, p11, p12)
end

function t_1.createMakeupThumbnailPreview(p10, p11)
	-- upvalues: addAssetToDescription (ref), playersService (ref), t_1 (ref), brickColor (ref)
	local humanoidDescription = Instance.new("HumanoidDescription")
	humanoidDescription.Head = 103273511207307
	
	if p10 then
		addAssetToDescription(humanoidDescription, p10, p11)
	end
	local bodyColors = nil
	local var2 = nil
	if not var2 then
		return nil
	end
	bodyColors = var2:FindFirstChildOfClass("BodyColors")
	
	if bodyColors then
		bodyColors.HeadColor = brickColor
	end
	local head = var2:FindFirstChild("Head")
	
	if head then
		head.Color = brickColor.Color
	end
	return var2
end

function t_1.compositeMakeupFolder(p10, p11)
	-- upvalues: assetService (ref)
	local t = {}
	
	for i, v in ipairs(p10:GetChildren()) do
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
	elseif p11 then
		table.sort(t, function(p12, p13)
			-- upvalues: p11 (ref)
			return (p11[p12.Name] or 0) < (p11[p13.Name] or 0)
		end)
	end
	local var2
	local size = object.Size
	local vector2 = Vector2.new(size.X, size.Y)
	local decal = Instance.new("Decal")
	
	for i_1, v_1 in ipairs({
		"TextureContent",
		"RoughnessMapContent",
		"MetalnessMapContent",
		"NormalMapContent"
	}) do
		var2 = false
		
		for i_2, v_2 in ipairs(t) do
			local i_3 = v_2[v_1]
			
			if i_3 and (i_3.Object or i_3.Uri) then
				var2 = true
				break
			end
		end
		if var2 then
			local var3 = assetService:CreateEditableImage({ Size = vector2 })
			local var4 = false
			
			for i_3, v_3 in ipairs(t) do
				local var5 = v_3[v_1]
				
				if var5 then
					local object_1 = var5.Object
					
					if not object_1 and var5.Uri and var5.Uri ~= "" then
						local ok, status = pcall(function()
							-- upvalues: assetService (copy), var5 (ref)
							return assetService:CreateEditableImageAsync(var5)
						end)
						
						if ok then
							object_1 = status
						end
					end
					if object_1 then
						var3:DrawImage(Vector2.new(0, 0), object_1, if not var4 then Enum.ImageCombineType.Overwrite else Enum.ImageCombineType.AlphaBlend)
						var4 = true
					end
				end
			end
			decal[v_1] = Content.fromObject(var3)
		end
	end
	local wrapTextureTransfer = t[1]:FindFirstChildWhichIsA("WrapTextureTransfer")
	
	if wrapTextureTransfer then
		wrapTextureTransfer:Clone().Parent = decal
	end
	return decal
end

return t_1