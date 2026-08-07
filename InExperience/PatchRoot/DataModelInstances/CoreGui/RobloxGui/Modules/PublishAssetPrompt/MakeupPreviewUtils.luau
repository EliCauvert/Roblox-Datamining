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

local function addAssetToDescription(value, p0, p1) --[[ line: 32 ]]
	-- upvalues: t_1 (ref), t_2 (ref)
	local var9 = p1 and t_1[p1]
	local var10 = p1 and t_2[p1]
	
	if var9 then
		for i, v in ipairs(value:GetChildren()) do
			if v:IsA("MakeupDescription") then
				v:Destroy()
			end
		end
		local makeupDescription = Instance.new("MakeupDescription")
		makeupDescription.MakeupType = var9
		makeupDescription.Instance = p0
		makeupDescription.Parent = value
		
		return
	elseif var10 then
		local accessoryDescription = Instance.new("AccessoryDescription")
		accessoryDescription.AccessoryType = var10
		accessoryDescription.Instance = p0
		accessoryDescription.IsLayered = true
		accessoryDescription.Parent = value
	end
end

local function createHeadWithAsset(value, p2, p3) --[[ line: 58 ]]
	-- upvalues: addAssetToDescription (ref), playersService (ref)
	addAssetToDescription(value, p2, p3)
	local var13 = nil
	
	return nil
end

function t.createMakeupHeadPreview(p4, p5) --[[ line: 88 ]]
	-- upvalues: playersService (ref), createHeadWithAsset (ref)
	local var15 = nil
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		local ok, status = pcall(function() --[[ line: 92 ]]
			-- upvalues: playersService (copy), localPlayer (ref)
			return playersService:GetHumanoidDescriptionFromUserIdAsync(localPlayer.UserId)
		end)
		
		if ok and status then
			var15 = status
		end
	end
	return createHeadWithAsset(var15 or Instance.new("HumanoidDescription"), p4, p5)
end

function t.createMakeupThumbnailPreview(p6, p7) --[[ line: 110 ]]
	-- upvalues: createHeadWithAsset (ref), brickColor (ref)
	local humanoidDescription = Instance.new("HumanoidDescription")
	humanoidDescription.Head = 103273511207307
	local var17 = createHeadWithAsset(humanoidDescription, p6, p7)
	
	if not var17 then
		return nil
	end
	local bodyColors = var17:FindFirstChildOfClass("BodyColors")
	
	if bodyColors then
		bodyColors.HeadColor = brickColor
	end
	local head = var17:FindFirstChild("Head")
	
	if head then
		head.Color = brickColor.Color
	end
	return var17
end

function t.compositeMakeupFolder(p8, p9) --[[ line: 138 ]]
	-- upvalues: assetService (ref)
	local t = {}
	
	for i, v in ipairs(p8:GetChildren()) do
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
	elseif p9 then
		table.sort(t, function(p10, p11) --[[ line: 156 ]]
			-- upvalues: p9 (ref)
			return (p9[p10.Name] or 0) < (p9[p11.Name] or 0)
		end)
	end
	local var25
	local size = object.Size
	local vector2 = Vector2.new(size.X, size.Y)
	local decal = Instance.new("Decal")
	
	for i_1, v_1 in ipairs({
		"TextureContent",
		"RoughnessMapContent",
		"MetalnessMapContent",
		"NormalMapContent"
	}) do
		var25 = false
		
		for i_2, v_2 in ipairs(t) do
			local i_3 = v_2[v_1]
			
			if i_3 and (i_3.Object or i_3.Uri) then
				var25 = true
				break
			end
		end
		if var25 then
			local var26 = assetService:CreateEditableImage({ Size = vector2 })
			local var27 = false
			
			for i_3, v_3 in ipairs(t) do
				local var28 = v_3[v_1]
				
				if var28 then
					local object_1 = var28.Object
					
					if not object_1 and var28.Uri and var28.Uri ~= "" then
						local ok, status = pcall(function() --[[ line: 195 ]]
							-- upvalues: assetService (copy), var28 (ref)
							return assetService:CreateEditableImageAsync(var28)
						end)
						
						if ok then
							object_1 = status
						end
					end
					if object_1 then
						var26:DrawImage(Vector2.new(0, 0), object_1, if not var27 then Enum.ImageCombineType.Overwrite else Enum.ImageCombineType.AlphaBlend)
						var27 = true
					end
				end
			end
			decal[v_1] = Content.fromObject(var26)
		end
	end
	local wrapTextureTransfer = t[1]:FindFirstChildWhichIsA("WrapTextureTransfer")
	
	if wrapTextureTransfer then
		wrapTextureTransfer:Clone().Parent = decal
	end
	return decal
end

return t