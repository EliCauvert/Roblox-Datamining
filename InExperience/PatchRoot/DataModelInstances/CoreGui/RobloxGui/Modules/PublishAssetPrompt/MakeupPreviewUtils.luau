local assetService = game:GetService("AssetService")
local playersService = game:GetService("Players")
local constantsModule = require(script.Parent.Constants)
local brickColor = BrickColor.new(194)
local t = {
	isMakeupAssetType = function(value) --[[ line: 16 ]]
		-- upvalues: constantsModule (ref)
		return constantsModule.MakeupAssetTypes[value] == true
	end
}
local t_1 = {
	[Enum.AvatarAssetType.FaceMakeup] = Enum.MakeupType.Face,
	[Enum.AvatarAssetType.LipMakeup] = Enum.MakeupType.Lip,
	[Enum.AvatarAssetType.EyeMakeup] = Enum.MakeupType.Eye
}
local t_2 = {
	[Enum.AvatarAssetType.EyebrowAccessory] = Enum.AccessoryType.Eyebrow,
	[Enum.AvatarAssetType.EyelashAccessory] = Enum.AccessoryType.Eyelash
}
local t_3 = {
	[Enum.AccessoryType.Hat] = true,
	[Enum.AccessoryType.Hair] = true,
	[Enum.AccessoryType.Face] = true,
	[Enum.AccessoryType.Eyebrow] = true,
	[Enum.AccessoryType.Eyelash] = true
}

local function removeMatchingChildren(p0, p1) --[[ line: 41 ]]
	for i, v in ipairs(p0:GetChildren()) do
		if p1(v) then
			v:Destroy()
		end
	end
end

local function addAssetToDescription(value, p2, p3) --[[ line: 50 ]]
	-- upvalues: t_1 (ref), t_2 (ref), removeMatchingChildren (ref)
	local var11 = p3 and t_1[p3]
	local var12 = p3 and t_2[p3]
	
	if var11 then
		removeMatchingChildren(value, function(p4) --[[ line: 55 ]]
			return p4:IsA("MakeupDescription")
		end)
		local makeupDescription = Instance.new("MakeupDescription")
		makeupDescription.MakeupType = var11
		makeupDescription.Instance = p2
		makeupDescription.Parent = value
		
		return
	elseif var12 then
		removeMatchingChildren(value, function(p5) --[[ line: 63 ]]
			-- upvalues: var12 (ref)
			return p5:IsA("AccessoryDescription") and p5.AccessoryType == var12
		end)
		local accessoryDescription = Instance.new("AccessoryDescription")
		accessoryDescription.AccessoryType = var12
		accessoryDescription.Instance = p2
		accessoryDescription.IsLayered = true
		accessoryDescription.Parent = value
	end
end

function t.stripToHead(p6) --[[ line: 80 ]]
	-- upvalues: t_3 (ref)
	local head = p6:FindFirstChild("Head")
	
	if not head then return end
	for i, v in ipairs(p6:GetChildren()) do
		if v:IsA("BasePart") then
			if v ~= head then
				v:Destroy()
			end
		elseif v:IsA("Accessory") and not t_3[v.AccessoryType] then
			v:Destroy()
		end
	end
end

function t.anchorRigidPreviewParts(p7) --[[ line: 101 ]]
	for i, v in ipairs(p7:GetDescendants()) do
		if v:IsA("BasePart") then
			local accessory = v:FindFirstAncestorWhichIsA("Accessory")
			
			if not accessory or accessory:FindFirstChildWhichIsA("WrapLayer", true) == nil then
				v.Anchored = true
			end
		end
	end
end

function t.getFolderAccessories(p8, p9) --[[ line: 119 ]]
	local t = {}
	
	for i, v in ipairs(p8:GetChildren()) do
		if v:IsA("Accessory") then
			table.insert(t, {
				asset = v,
				assetType = if p9 and p9[i] then p9[i].assetType else nil
			})
		end
	end
	return t
end

local function createHeadWithAsset(value, p10, p11, p12) --[[ line: 133 ]]
	-- upvalues: addAssetToDescription (ref), playersService (ref), t (ref)
	if p10 then
		addAssetToDescription(value, p10, p11)
	end
	if p12 then
		for i, v in ipairs(p12) do
			addAssetToDescription(value, v.asset, v.assetType)
		end
	end
	local var18 = nil
	
	return nil
end

function t.createMakeupHeadPreview(p13, p14, p15) --[[ line: 175 ]]
	-- upvalues: playersService (ref), createHeadWithAsset (ref)
	local var19 = nil
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		local ok, status = pcall(function() --[[ line: 183 ]]
			-- upvalues: playersService (copy), localPlayer (ref)
			return playersService:GetHumanoidDescriptionFromUserIdAsync(localPlayer.UserId)
		end)
		
		if ok and status then
			var19 = status
		end
	end
	return createHeadWithAsset(var19 or Instance.new("HumanoidDescription"), p13, p14, p15)
end

function t.createMakeupThumbnailPreview(p16, p17) --[[ line: 201 ]]
	-- upvalues: addAssetToDescription (ref), playersService (ref), t (ref), brickColor (ref)
	local humanoidDescription = Instance.new("HumanoidDescription")
	humanoidDescription.Head = 103273511207307
	
	if p16 then
		addAssetToDescription(humanoidDescription, p16, p17)
	end
	local bodyColors = nil
	local var22 = nil
	if not var22 then
		return nil
	end
	bodyColors = var22:FindFirstChildOfClass("BodyColors")
	
	if bodyColors then
		bodyColors.HeadColor = brickColor
	end
	local head = var22:FindFirstChild("Head")
	
	if head then
		head.Color = brickColor.Color
	end
	return var22
end

function t.compositeMakeupFolder(p18, p19) --[[ line: 229 ]]
	-- upvalues: assetService (ref)
	local t = {}
	
	for i, v in ipairs(p18:GetChildren()) do
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
	elseif p19 then
		table.sort(t, function(p20, p21) --[[ line: 247 ]]
			-- upvalues: p19 (ref)
			return (p19[p20.Name] or 0) < (p19[p21.Name] or 0)
		end)
	end
	local var29
	local size = object.Size
	local vector2 = Vector2.new(size.X, size.Y)
	local decal = Instance.new("Decal")
	
	for i_1, v_1 in ipairs({
		"TextureContent",
		"RoughnessMapContent",
		"MetalnessMapContent",
		"NormalMapContent"
	}) do
		var29 = false
		
		for i_2, v_2 in ipairs(t) do
			local i_3 = v_2[v_1]
			
			if i_3 and (i_3.Object or i_3.Uri) then
				var29 = true
				break
			end
		end
		if var29 then
			local var30 = assetService:CreateEditableImage({ Size = vector2 })
			local var31 = false
			
			for i_3, v_3 in ipairs(t) do
				local var32 = v_3[v_1]
				
				if var32 then
					local object_1 = var32.Object
					
					if not object_1 and var32.Uri and var32.Uri ~= "" then
						local ok, status = pcall(function() --[[ line: 286 ]]
							-- upvalues: assetService (copy), var32 (ref)
							return assetService:CreateEditableImageAsync(var32)
						end)
						
						if ok then
							object_1 = status
						end
					end
					if object_1 then
						var30:DrawImage(Vector2.new(0, 0), object_1, if not var31 then Enum.ImageCombineType.Overwrite else Enum.ImageCombineType.AlphaBlend)
						var31 = true
					end
				end
			end
			decal[v_1] = Content.fromObject(var30)
		end
	end
	local wrapTextureTransfer = t[1]:FindFirstChildWhichIsA("WrapTextureTransfer")
	
	if wrapTextureTransfer then
		wrapTextureTransfer:Clone().Parent = decal
	end
	return decal
end

return t