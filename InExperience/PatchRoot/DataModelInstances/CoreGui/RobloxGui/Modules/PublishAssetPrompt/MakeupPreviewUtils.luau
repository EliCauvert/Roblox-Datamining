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

local function addAssetToDescription(value, p0, p1) --[[ line: 42 ]]
	-- upvalues: t_1 (ref), t_2 (ref)
	local var10 = p1 and t_1[p1]
	local var11 = p1 and t_2[p1]
	
	if var10 then
		for i, v in ipairs(value:GetChildren()) do
			if v:IsA("MakeupDescription") then
				v:Destroy()
			end
		end
		local makeupDescription = Instance.new("MakeupDescription")
		makeupDescription.MakeupType = var10
		makeupDescription.Instance = p0
		makeupDescription.Parent = value
		
		return
	elseif var11 then
		local accessoryDescription = Instance.new("AccessoryDescription")
		accessoryDescription.AccessoryType = var11
		accessoryDescription.Instance = p0
		accessoryDescription.IsLayered = true
		accessoryDescription.Parent = value
	end
end

function t.stripToHead(p2) --[[ line: 72 ]]
	-- upvalues: t_3 (ref)
	local head = p2:FindFirstChild("Head")
	
	if not head then return end
	for i, v in ipairs(p2:GetChildren()) do
		if v:IsA("BasePart") then
			if v ~= head then
				v:Destroy()
			end
		elseif v:IsA("Accessory") and not t_3[v.AccessoryType] then
			v:Destroy()
		end
	end
end

function t.getFolderAccessories(p3, p4) --[[ line: 98 ]]
	local t = {}
	
	for i, v in ipairs(p3:GetChildren()) do
		if v:IsA("Accessory") then
			table.insert(t, {
				asset = v,
				assetType = if p4 and p4[i] then p4[i].assetType else nil
			})
		end
	end
	return t
end

local function createHeadWithAsset(value, p5, p6, p7) --[[ line: 112 ]]
	-- upvalues: addAssetToDescription (ref), playersService (ref), t (ref)
	if p5 then
		addAssetToDescription(value, p5, p6)
	end
	if p7 then
		for i, v in ipairs(p7) do
			addAssetToDescription(value, v.asset, v.assetType)
		end
	end
	local var16 = nil
	
	return nil
end

function t.createMakeupHeadPreview(p8, p9, p10) --[[ line: 150 ]]
	-- upvalues: playersService (ref), createHeadWithAsset (ref)
	local var17 = nil
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		local ok, status = pcall(function() --[[ line: 158 ]]
			-- upvalues: playersService (copy), localPlayer (ref)
			return playersService:GetHumanoidDescriptionFromUserIdAsync(localPlayer.UserId)
		end)
		
		if ok and status then
			var17 = status
		end
	end
	return createHeadWithAsset(var17 or Instance.new("HumanoidDescription"), p8, p9, p10)
end

function t.createMakeupThumbnailPreview(p11, p12) --[[ line: 176 ]]
	-- upvalues: addAssetToDescription (ref), playersService (ref), t (ref), brickColor (ref)
	local humanoidDescription = Instance.new("HumanoidDescription")
	humanoidDescription.Head = 103273511207307
	
	if p11 then
		addAssetToDescription(humanoidDescription, p11, p12)
	end
	local bodyColors = nil
	local var20 = nil
	if not var20 then
		return nil
	end
	bodyColors = var20:FindFirstChildOfClass("BodyColors")
	
	if bodyColors then
		bodyColors.HeadColor = brickColor
	end
	local head = var20:FindFirstChild("Head")
	
	if head then
		head.Color = brickColor.Color
	end
	return var20
end

function t.compositeMakeupFolder(p13, p14) --[[ line: 204 ]]
	-- upvalues: assetService (ref)
	local t = {}
	
	for i, v in ipairs(p13:GetChildren()) do
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
	elseif p14 then
		table.sort(t, function(p15, p16) --[[ line: 222 ]]
			-- upvalues: p14 (ref)
			return (p14[p15.Name] or 0) < (p14[p16.Name] or 0)
		end)
	end
	local var27
	local size = object.Size
	local vector2 = Vector2.new(size.X, size.Y)
	local decal = Instance.new("Decal")
	
	for i_1, v_1 in ipairs({
		"TextureContent",
		"RoughnessMapContent",
		"MetalnessMapContent",
		"NormalMapContent"
	}) do
		var27 = false
		
		for i_2, v_2 in ipairs(t) do
			local i_3 = v_2[v_1]
			
			if i_3 and (i_3.Object or i_3.Uri) then
				var27 = true
				break
			end
		end
		if var27 then
			local var28 = assetService:CreateEditableImage({ Size = vector2 })
			local var29 = false
			
			for i_3, v_3 in ipairs(t) do
				local var30 = v_3[v_1]
				
				if var30 then
					local object_1 = var30.Object
					
					if not object_1 and var30.Uri and var30.Uri ~= "" then
						local ok, status = pcall(function() --[[ line: 261 ]]
							-- upvalues: assetService (copy), var30 (ref)
							return assetService:CreateEditableImageAsync(var30)
						end)
						
						if ok then
							object_1 = status
						end
					end
					if object_1 then
						var28:DrawImage(Vector2.new(0, 0), object_1, if not var29 then Enum.ImageCombineType.Overwrite else Enum.ImageCombineType.AlphaBlend)
						var29 = true
					end
				end
			end
			decal[v_1] = Content.fromObject(var28)
		end
	end
	local wrapTextureTransfer = t[1]:FindFirstChildWhichIsA("WrapTextureTransfer")
	
	if wrapTextureTransfer then
		wrapTextureTransfer:Clone().Parent = decal
	end
	return decal
end

return t