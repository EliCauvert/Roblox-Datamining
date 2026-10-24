local LoadAssetModule = require(script.Parent.loadAsset)
local _CFrame = CFrame.Angles(0, 3.141592653589793, 0)

local function findBackgroundFolder(Object)
	local AvatarBackground = Object:FindFirstChild("AvatarBackground")
	
	if AvatarBackground ~= nil then
		return AvatarBackground
	end
	if Object:FindFirstChild("ImageId") ~= nil and Object:FindFirstChild("Color") ~= nil then
		return Object
	end
	for _, child in Object:GetChildren() do
		if child:FindFirstChild("ImageId") ~= nil and child:FindFirstChild("Color") ~= nil then
			return child
		end
	end
	return nil
end

local function readBackgroundData(p1)
	-- upvalues: findBackgroundFolder (copy)
	local BackgroundFolder = findBackgroundFolder(p1)
	
	if BackgroundFolder == nil then
		return nil
	else
		local ImageId = BackgroundFolder:FindFirstChild("ImageId")
		local Color = BackgroundFolder:FindFirstChild("Color")
		
		return if ImageId == nil or not ImageId:IsA("IntValue") then nil elseif Color == nil or not Color:IsA("Color3Value") then nil else { imageId = ImageId.Value, backgroundColor = Color.Value }
	end
end

local function _(Object): boolean
	return Object:FindFirstChild("texture_mesh") ~= nil and Object:FindFirstChild("color_mesh") ~= nil
end

local function extractCycloramaModel(Object)
	local AvatarCyclorama = Object:FindFirstChild("AvatarCyclorama")
	
	if AvatarCyclorama ~= nil and AvatarCyclorama:IsA("Model") and (AvatarCyclorama:FindFirstChild("texture_mesh") ~= nil and AvatarCyclorama:FindFirstChild("color_mesh") ~= nil) then
		return AvatarCyclorama
	end
	local Model = Object:FindFirstChildWhichIsA("Model")
	
	if Model ~= nil and (Model:FindFirstChild("texture_mesh") ~= nil and Model:FindFirstChild("color_mesh") ~= nil) then
		return Model
	elseif Object:IsA("Model") and (Object:FindFirstChild("texture_mesh") ~= nil and Object:FindFirstChild("color_mesh") ~= nil) then
		return Object
	else
		return nil
	end
end

local function loadCyclorama()
	-- upvalues: LoadAssetModule (copy), extractCycloramaModel (copy)
	local Success, Result = pcall(LoadAssetModule.loadAsset, 94967210842404)
	
	if not Success then
		warn(`avatarBackground: cyclorama {94967210842404} failed to load: {Result}`)
		
		return nil
	end
	if Result == nil or typeof(Result) ~= "Instance" then
		warn(`avatarBackground: cyclorama {94967210842404} loaded a {typeof(Result)}, expected an Instance`)
		
		return nil
	end
	local AvatarCyclorama = extractCycloramaModel(Result)
	
	if AvatarCyclorama == nil then
		warn(`avatarBackground: cyclorama {94967210842404} has no Model holding both texture_mesh and color_mesh`)
		Result:Destroy()
		
		return nil
	end
	if AvatarCyclorama ~= Result then
		AvatarCyclorama.Parent = nil
		Result:Destroy()
	end
	AvatarCyclorama.Name = "AvatarCyclorama"
	
	return AvatarCyclorama
end

local function loadBackgroundData(p1)
	-- upvalues: LoadAssetModule (copy), readBackgroundData (copy)
	local Success, Result = pcall(LoadAssetModule.loadAsset, p1)
	
	if not Success then
		warn(`avatarBackground: background {p1} failed to load: {Result}`)
		
		return nil
	end
	if Result == nil or typeof(Result) ~= "Instance" then
		warn(`avatarBackground: background {p1} loaded a {typeof(Result)}, expected an Instance`)
		
		return nil
	end
	local BackgroundData = readBackgroundData(Result)
	
	if BackgroundData == nil then
		warn(`avatarBackground: background {p1} has no folder with an ImageId IntValue and a Color Color3Value`)
	end
	Result:Destroy()
	
	return BackgroundData
end

local function applyTexture(Part: Part, ImageId)
	local AssetId: string = `rbxassetid://{ImageId}`
	
	if Part:IsA("MeshPart") then
		Part.TextureID = AssetId
	end
	local Success, Result = pcall(function()
		-- upvalues: Part (copy), AssetId (copy)
		Part.TextureContent = Content.fromUri(AssetId)
	end)
	
	if not Success then
		warn(`avatarBackground: TextureContent assignment failed for {ImageId}: {Result}`)
	end
end

local function applyBackground(Object, p1)
	-- upvalues: applyTexture (copy)
	local TextureMesh = Object:FindFirstChild("texture_mesh")
	local ColorMesh = Object:FindFirstChild("color_mesh")
	
	if TextureMesh ~= nil and TextureMesh:IsA("BasePart") then
		TextureMesh.Anchored = true
		TextureMesh.Transparency = 0.015
		applyTexture(TextureMesh, p1.imageId)
	end
	if ColorMesh ~= nil and ColorMesh:IsA("BasePart") then
		ColorMesh.Anchored = true
		ColorMesh.Transparency = 0
		ColorMesh.Color = p1.backgroundColor
	end
end

return {
	CYCLORAMA_ASSET_ID = 94967210842404,
	DEFAULT_ASSET_ID = 121199209890990,
	FRONT_VISIBLE_TRANSPARENCY = 0.015,
	attach = function(Parent, Enabled: number)
		-- upvalues: loadCyclorama (copy), loadBackgroundData (copy), applyBackground (copy), _CFrame (copy)
		local Enabled1 = if Enabled == false or Enabled == "none" then nil elseif type(Enabled) == "number" then if Enabled <= 0 then nil else Enabled else 121199209890990
		
		if Enabled1 == nil then
			return nil
		end
		local Cyclorama = loadCyclorama()
		
		if Cyclorama == nil then
			return nil
		end
		local BackgroundData = loadBackgroundData(Enabled1)
		
		if BackgroundData == nil then
			Cyclorama:Destroy()
			
			return nil
		else
			applyBackground(Cyclorama, BackgroundData)
			Cyclorama:PivotTo(CFrame.new() * _CFrame)
			Cyclorama.Parent = Parent
			Cyclorama.WorldPivot = Parent:GetPivot()
			
			return Cyclorama
		end
	end,
	pinToParent = function(p1, p2)
		p1.WorldPivot = p2:GetPivot()
	end,
	REST = _CFrame,
	applyBackground = applyBackground,
	resolveAssetId = function(Enabled: number)
		return if Enabled == false or Enabled == "none" then nil elseif type(Enabled) == "number" then if Enabled <= 0 then nil else Enabled else 121199209890990
	end
}