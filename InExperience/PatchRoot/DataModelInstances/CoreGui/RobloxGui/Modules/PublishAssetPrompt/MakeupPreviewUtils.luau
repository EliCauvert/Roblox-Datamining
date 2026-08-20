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

function t.getFolderAccessories(p7, p8) --[[ line: 106 ]]
	local t = {}
	
	for i, v in ipairs(p7:GetChildren()) do
		if v:IsA("Accessory") then
			table.insert(t, {
				asset = v,
				assetType = if p8 and p8[i] then p8[i].assetType else nil
			})
		end
	end
	return t
end

local function createHeadWithAsset(value, p9, p10, p11) --[[ line: 120 ]]
	-- upvalues: addAssetToDescription (ref), playersService (ref), t (ref)
	if p9 then
		addAssetToDescription(value, p9, p10)
	end
	if p11 then
		for i, v in ipairs(p11) do
			addAssetToDescription(value, v.asset, v.assetType)
		end
	end
	local var17 = nil
	
	return nil
end

function t.createMakeupHeadPreview(p12, p13, p14) --[[ line: 165 ]]
	-- upvalues: playersService (ref), createHeadWithAsset (ref)
	local var18 = nil
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		local ok, status = pcall(function() --[[ line: 173 ]]
			-- upvalues: playersService (copy), localPlayer (ref)
			return playersService:GetHumanoidDescriptionFromUserIdAsync(localPlayer.UserId)
		end)
		
		if ok and status then
			var18 = status
		end
	end
	return createHeadWithAsset(var18 or Instance.new("HumanoidDescription"), p12, p13, p14)
end

function t.createMakeupThumbnailPreview(p15, p16) --[[ line: 191 ]]
	-- upvalues: createHeadWithAsset (ref), brickColor (ref)
	local humanoidDescription = Instance.new("HumanoidDescription")
	humanoidDescription.Head = 103273511207307
	local var20 = createHeadWithAsset(humanoidDescription, p15, p16)
	
	if not var20 then
		return nil
	end
	local bodyColors = var20:FindFirstChildOfClass("BodyColors")
	
	if bodyColors then
		bodyColors.HeadColor = brickColor
	end
	local head = var20:FindFirstChild("Head")
	
	if head then
		head.Color = brickColor.Color
	end
	return var20
end

function t.compositeMakeupFolder(p17, p18) --[[ line: 219 ]]
	-- upvalues: assetService (ref)
	local t = {}
	
	for i, v in ipairs(p17:GetChildren()) do
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
	elseif p18 then
		table.sort(t, function(p19, p20) --[[ line: 237 ]]
			-- upvalues: p18 (ref)
			return (p18[p19.Name] or 0) < (p18[p20.Name] or 0)
		end)
	end
	local var28
	local size = object.Size
	local vector2 = Vector2.new(size.X, size.Y)
	local decal = Instance.new("Decal")
	
	for i_1, v_1 in ipairs({
		"TextureContent",
		"RoughnessMapContent",
		"MetalnessMapContent",
		"NormalMapContent"
	}) do
		var28 = false
		
		for i_2, v_2 in ipairs(t) do
			local i_3 = v_2[v_1]
			
			if i_3 and (i_3.Object or i_3.Uri) then
				var28 = true
				break
			end
		end
		if var28 then
			local var29 = assetService:CreateEditableImage({ Size = vector2 })
			local var30 = false
			
			for i_3, v_3 in ipairs(t) do
				local var31 = v_3[v_1]
				
				if var31 then
					local object_1 = var31.Object
					
					if not object_1 and var31.Uri and var31.Uri ~= "" then
						local ok, status = pcall(function() --[[ line: 276 ]]
							-- upvalues: assetService (copy), var31 (ref)
							return assetService:CreateEditableImageAsync(var31)
						end)
						
						if ok then
							object_1 = status
						end
					end
					if object_1 then
						var29:DrawImage(Vector2.new(0, 0), object_1, if not var30 then Enum.ImageCombineType.Overwrite else Enum.ImageCombineType.AlphaBlend)
						var30 = true
					end
				end
			end
			decal[v_1] = Content.fromObject(var29)
		end
	end
	local wrapTextureTransfer = t[1]:FindFirstChildWhichIsA("WrapTextureTransfer")
	
	if wrapTextureTransfer then
		wrapTextureTransfer:Clone().Parent = decal
	end
	return decal
end

return t