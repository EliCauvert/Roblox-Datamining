local assetService = game:GetService("AssetService")
local playersService = game:GetService("Players")
local constantsModule = require(script.Parent.Constants)
local brickColor = BrickColor.new(194)

local function _(p0, p1) --[[ line: 17 | named "makeCameraCFrame" ]]
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
	setupMakeupThumbnailCamera = function(value, p2, p3) --[[ line: 48 ]]
		-- upvalues: lookAtCFrame (ref), t (ref)
		local head = value:FindFirstChild("Head")
		
		if not head or not head:IsA("MeshPart") then
			return false
		end
		local var14 = lookAtCFrame
		
		if p3 then
			var14 = t[p3] or var14
		end
		p2.CFrame = head.CFrame * var14
		p2.Focus = head.CFrame
		p2.FieldOfView = 5
		
		return true
	end,
	isMakeupAssetType = function(value) --[[ line: 68 ]]
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

local function removeMatchingChildren(p4, p5) --[[ line: 93 ]]
	for i, v in ipairs(p4:GetChildren()) do
		if p5(v) then
			v:Destroy()
		end
	end
end

local function addAssetToDescription(value, p6, p7) --[[ line: 102 ]]
	-- upvalues: t_2 (ref), t_3 (ref), removeMatchingChildren (ref)
	local var15 = p7 and t_2[p7]
	local var16 = p7 and t_3[p7]
	
	if var15 then
		removeMatchingChildren(value, function(p8) --[[ line: 107 ]]
			return p8:IsA("MakeupDescription")
		end)
		local makeupDescription = Instance.new("MakeupDescription")
		makeupDescription.MakeupType = var15
		makeupDescription.Instance = p6
		makeupDescription.Parent = value
		
		return
	elseif var16 then
		removeMatchingChildren(value, function(p9) --[[ line: 115 ]]
			-- upvalues: var16 (ref)
			return p9:IsA("AccessoryDescription") and p9.AccessoryType == var16
		end)
		local accessoryDescription = Instance.new("AccessoryDescription")
		accessoryDescription.AccessoryType = var16
		accessoryDescription.Instance = p6
		accessoryDescription.IsLayered = true
		accessoryDescription.Parent = value
	end
end

function t_1.stripToHead(p10) --[[ line: 132 ]]
	-- upvalues: t_4 (ref)
	local head = p10:FindFirstChild("Head")
	
	if not head then return end
	for i, v in ipairs(p10:GetChildren()) do
		if v:IsA("BasePart") then
			if v ~= head then
				v:Destroy()
			end
		elseif v:IsA("Accessory") and not t_4[v.AccessoryType] then
			v:Destroy()
		end
	end
end

function t_1.anchorRigidPreviewParts(p11) --[[ line: 153 ]]
	for i, v in ipairs(p11:GetDescendants()) do
		if v:IsA("BasePart") then
			local accessory = v:FindFirstAncestorWhichIsA("Accessory")
			
			if not accessory or accessory:FindFirstChildWhichIsA("WrapLayer", true) == nil then
				v.Anchored = true
			end
		end
	end
end

function t_1.getFolderAccessories(p12, p13) --[[ line: 171 ]]
	local t = {}
	
	for i, v in ipairs(p12:GetChildren()) do
		if v:IsA("Accessory") then
			table.insert(t, {
				asset = v,
				assetType = if p13 and p13[i] then p13[i].assetType else nil
			})
		end
	end
	return t
end

local function createHeadWithAsset(value, p14, p15, p16) --[[ line: 185 ]]
	-- upvalues: addAssetToDescription (ref), playersService (ref), t_1 (ref)
	if p14 then
		addAssetToDescription(value, p14, p15)
	end
	if p16 then
		for i, v in ipairs(p16) do
			addAssetToDescription(value, v.asset, v.assetType)
		end
	end
	local var22 = nil
	
	return nil
end

function t_1.createMakeupHeadPreview(p17, p18, p19) --[[ line: 227 ]]
	-- upvalues: playersService (ref), createHeadWithAsset (ref)
	local var23 = nil
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		local ok, status = pcall(function() --[[ line: 235 ]]
			-- upvalues: playersService (copy), localPlayer (ref)
			return playersService:GetHumanoidDescriptionFromUserIdAsync(localPlayer.UserId)
		end)
		
		if ok and status then
			var23 = status
		end
	end
	return createHeadWithAsset(var23 or Instance.new("HumanoidDescription"), p17, p18, p19)
end

function t_1.createMakeupThumbnailPreview(p20, p21) --[[ line: 253 ]]
	-- upvalues: addAssetToDescription (ref), playersService (ref), t_1 (ref), brickColor (ref)
	local humanoidDescription = Instance.new("HumanoidDescription")
	humanoidDescription.Head = 103273511207307
	
	if p20 then
		addAssetToDescription(humanoidDescription, p20, p21)
	end
	local bodyColors = nil
	local var26 = nil
	if not var26 then
		return nil
	end
	bodyColors = var26:FindFirstChildOfClass("BodyColors")
	
	if bodyColors then
		bodyColors.HeadColor = brickColor
	end
	local head = var26:FindFirstChild("Head")
	
	if head then
		head.Color = brickColor.Color
	end
	return var26
end

function t_1.compositeMakeupFolder(p22, p23) --[[ line: 281 ]]
	-- upvalues: assetService (ref)
	local t = {}
	
	for i, v in ipairs(p22:GetChildren()) do
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
	elseif p23 then
		table.sort(t, function(p24, p25) --[[ line: 299 ]]
			-- upvalues: p23 (ref)
			return (p23[p24.Name] or 0) < (p23[p25.Name] or 0)
		end)
	end
	local var33
	local size = object.Size
	local vector2 = Vector2.new(size.X, size.Y)
	local decal = Instance.new("Decal")
	
	for i_1, v_1 in ipairs({
		"TextureContent",
		"RoughnessMapContent",
		"MetalnessMapContent",
		"NormalMapContent"
	}) do
		var33 = false
		
		for i_2, v_2 in ipairs(t) do
			local i_3 = v_2[v_1]
			
			if i_3 and (i_3.Object or i_3.Uri) then
				var33 = true
				break
			end
		end
		if var33 then
			local var34 = assetService:CreateEditableImage({ Size = vector2 })
			local var35 = false
			
			for i_3, v_3 in ipairs(t) do
				local var36 = v_3[v_1]
				
				if var36 then
					local object_1 = var36.Object
					
					if not object_1 and var36.Uri and var36.Uri ~= "" then
						local ok, status = pcall(function() --[[ line: 338 ]]
							-- upvalues: assetService (copy), var36 (ref)
							return assetService:CreateEditableImageAsync(var36)
						end)
						
						if ok then
							object_1 = status
						end
					end
					if object_1 then
						var34:DrawImage(Vector2.new(0, 0), object_1, if not var35 then Enum.ImageCombineType.Overwrite else Enum.ImageCombineType.AlphaBlend)
						var35 = true
					end
				end
			end
			decal[v_1] = Content.fromObject(var34)
		end
	end
	local wrapTextureTransfer = t[1]:FindFirstChildWhichIsA("WrapTextureTransfer")
	
	if wrapTextureTransfer then
		wrapTextureTransfer:Clone().Parent = decal
	end
	return decal
end

return t_1