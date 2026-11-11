local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local NotificationService = game:GetService("NotificationService")
local CorePackages = game:GetService("CorePackages")
local InsertService = game:GetService("InsertService")
local AssetService = game:GetService("AssetService")
local ContentProvider = game:GetService("ContentProvider")
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local LightUtility = require(CorePackages.Packages.Thumbnailing).LightUtility
local SignalsModule = require(CorePackages.Packages.Signals)
local ParticleEffectManagerModule = require(Modules.AvatarExperience.Common.Managers.ParticleEffectManager)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local GetFIntAvatarEditorParticleEmitterRateOverrideModule = require(Modules.LuaApp.Flags.GetFIntAvatarEditorParticleEmitterRateOverride)
local FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule = require(Modules.AvatarExperience.Flags.FFlagUseUpdatedBackgroundSceneSettingsOnMobile)
local FFlagAXGuardCharacterSpotLightSideAccessModule = require(Modules.AvatarExperience.Flags.FFlagAXGuardCharacterSpotLightSideAccess)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetSceneOverridesStoreFunction = require(CorePackages.Workspace.Packages.Style).getSceneOverridesStore
local AXSkyboxBlockerSizeX = game:DefineFastInt("AXSkyboxBlockerSizeX", 31)
local AXSkyboxBlockerSizeY = game:DefineFastInt("AXSkyboxBlockerSizeY", 175)
local AXSkyboxBlockerSizeZ = game:DefineFastInt("AXSkyboxBlockerSizeZ", 400)
local AXSkyboxBlockerPositionX = game:DefineFastInt("AXSkyboxBlockerPositionX", -50)
local AXSkyboxBlockerPositionY = game:DefineFastInt("AXSkyboxBlockerPositionY", 77)
local AXSkyboxBlockerPositionZ = game:DefineFastInt("AXSkyboxBlockerPositionZ", -9)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXPhotoboothFunctionality = AvatarExperienceFlagsModule.FFlagAXPhotoboothFunctionality
local FFlagAXBackgroundCycloramaRendering = AvatarExperienceFlagsModule.FFlagAXBackgroundCycloramaRendering
local FFlagAXBackgroundsCycloramaVR = AvatarExperienceFlagsModule.FFlagAXBackgroundsCycloramaVR
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local LoadBackgroundAsset = AvatarExperienceCommonModule.Backgrounds.loadBackgroundAsset
local SelectActiveBackgroundFunction = AvatarExperienceCommonModule.Backgrounds.selectActiveBackground
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local PhotoboothSceneDataModule = require(Modules.AvatarExperience.Photobooth.Components.Scenes.PhotoboothSceneData)
local PhotoboothStoreBridge = require(CorePackages.Workspace.Packages.AvatarExperiencePhotobooth).PhotoboothStoreBridge
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local BackgroundType = ConstantsModule.BackgroundType
local ParticleType = ConstantsModule.ParticleType
local PagePlayParticleType = ConstantsModule.PagePlayParticleType
local PageBackgroundType = ConstantsModule.PageBackgroundType
local _TweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local _TweenInfo1 = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0.4)
local _Vector2 = Vector2.new(3, 3)
local CF = CFrame.new(0, 0, -6) * CFrame.Angles(0, 3.141592653589793, 0)
local BackgroundSceneManagerDEPRECATEDModule = {}
BackgroundSceneManagerDEPRECATEDModule.__index = BackgroundSceneManagerDEPRECATEDModule
local config = {
	Lighting = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then {
		Brightness = 2,
		ClockTime = 11,
		FogEnd = 92,
		GeographicLatitude = 24,
		TimeOfDay = "11:00:00",
		ColorShift_Bottom = Color3.fromRGB(108, 94, 66),
		ColorShift_Top = Color3.fromRGB(94, 100, 172),
		OutdoorAmbient = Color3.fromRGB(0, 0, 0)
	} else {
		Brightness = 2,
		ClockTime = 12,
		GeographicLatitude = 41.733,
		TimeOfDay = "12:00:00",
		FogEnd = 92,
		FogStart = 20,
		ColorShift_Bottom = Color3.fromRGB(232, 255, 146),
		ColorShift_Top = Color3.fromRGB(85, 136, 167),
		OutdoorAmbient = Color3.fromRGB(0, 0, 0),
		Ambient = Color3.fromRGB(170, 170, 170),
		FogColor = Color3.fromRGB(45, 46, 49),
		Sky = { CelestialBodiesShown = true, StarCount = 3000 }
	},
	Bloom = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then { Intensity = 0.2, Size = 12, Threshold = 0.95 } else { Intensity = 0.3, Size = 12, Threshold = 0.95 },
	ColorCorrection = { Brightness = 0, Contrast = 0, Saturation = 0 }
}
local config1 = {
	Lighting = {
		Brightness = 1,
		ClockTime = 14,
		GeographicLatitude = 41.733,
		TimeOfDay = "14:00:00",
		FogEnd = 100000,
		FogStart = 0,
		ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
		ColorShift_Top = Color3.fromRGB(0, 0, 0),
		OutdoorAmbient = Color3.fromRGB(127, 127, 127),
		Ambient = Color3.fromRGB(127, 127, 127),
		FogColor = Color3.fromRGB(192, 192, 192),
		Sky = { CelestialBodiesShown = true, StarCount = 3000 }
	}
}
local config2 = {
	LightTheme = {
		CharacterSpotLightBrightness = 6,
		SkyboxAssetLocation = "rbxasset://textures/AvatarEditorImages/LightPixel.png",
		AmbientLightColor = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then Color3.fromRGB(130, 130, 130) else nil,
		EnvironmentDiffuseScale = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 0.2 else nil,
		EnvironmentSpecularScale = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 1 else nil,
		FogStart = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 30 else nil,
		BackPanelTextureColor = Color3.fromRGB(213, 213, 213),
		CloudsTextureColor = Color3.fromRGB(222, 222, 222),
		LargerShapesTextureColor = Color3.fromRGB(222, 222, 222),
		BasePlateColor = Color3.fromRGB(213, 213, 213),
		FogColor = Color3.fromRGB(213, 213, 213),
		ParticleEmitterColorCatalogToAE = ColorSequence.new(Color3.fromRGB(171, 169, 161), Color3.fromRGB(158, 135, 120)),
		ParticleEmitterColorAEToCatalog = ColorSequence.new(Color3.fromRGB(158, 135, 120), Color3.fromRGB(171, 169, 161))
	},
	DarkTheme = {
		CharacterSpotLightBrightness = 12,
		SkyboxAssetLocation = "rbxasset://textures/ui/AvatarExperience/AvatarExperienceSkyboxDarkTheme.png",
		AmbientLightColor = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then Color3.fromRGB(180, 180, 180) else nil,
		EnvironmentDiffuseScale = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 1 else nil,
		EnvironmentSpecularScale = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 1 else nil,
		FogStart = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 20 else nil,
		BackPanelTextureColor = Color3.fromRGB(83, 80, 82),
		CloudsTextureColor = Color3.fromRGB(100, 101, 108),
		LargerShapesTextureColor = Color3.fromRGB(100, 101, 108),
		BasePlateColor = Color3.fromRGB(83, 80, 82),
		FogColor = Color3.fromRGB(55, 56, 59),
		ParticleEmitterColorCatalogToAE = ColorSequence.new(Color3.fromRGB(79, 75, 79), Color3.fromRGB(51, 49, 52)),
		ParticleEmitterColorAEToCatalog = ColorSequence.new(Color3.fromRGB(51, 49, 52), Color3.fromRGB(79, 75, 79))
	}
}
local config3 = {
	LargerShapes = {
		TextureWallTransparency = 1,
		LargerShapesPosition = vector.create(-62.89799880981445, 6.96999979019165, -8.8149995803833),
		CloudsPosition = vector.create(-90, 20, 0),
		BaseplateTransparency = 0
	},
	Walls = {
		TextureWallTransparency = 0,
		LargerShapesPosition = vector.create(-62.89799880981445, -12.300000190734863, -8.8149995803833),
		CloudsPosition = vector.create(-90, 80, 0),
		BaseplateTransparency = 0
	},
	NoShapesNoWalls = {
		TextureWallTransparency = 1,
		LargerShapesPosition = vector.create(-62.89799880981445, -1000, -8.8149995803833),
		CloudsPosition = vector.create(-90, 1000, 0),
		BaseplateTransparency = 1
	}
}

local function darkenPixelBuffer(Buf, p1)
	for i = 0, buffer.len(Buf) - 4, 4 do
		for i1 = 0, 2 do
			buffer.writeu8(Buf, i + i1, (math.clamp(math.round(buffer.readu8(Buf, i + i1) * p1), 0, 255)))
		end
	end
end

BackgroundSceneManagerDEPRECATEDModule.darkenPixelBuffer = darkenPixelBuffer

local function _(Part: Part, CycloramaState, p2)
	-- upvalues: AssetService (copy), MutedErrorModule (copy), _Vector2 (copy), darkenPixelBuffer (copy)
	if Part:IsA("MeshPart") then
		local ActiveToken = CycloramaState.activeToken
		task.spawn(function()
			-- upvalues: AssetService (upval), p2 (copy), MutedErrorModule (upval), ActiveToken (copy), CycloramaState (copy), _Vector2 (upval), darkenPixelBuffer (upval), Part (copy)
			local Success, Result = pcall(function()
				-- upvalues: AssetService (upval), p2 (upval)
				return AssetService:CreateEditableImageAsync(Content.fromUri(`rbxassetid://{p2}`))
			end)
			
			if not Success or not Result then
				MutedErrorModule("BackgroundSceneManager: cyclorama downsample failed to load texture for imageId=" .. tostring(p2))
				
				return
			end
			if ActiveToken ~= CycloramaState.activeToken then return end
			local EditableImage = AssetService:CreateEditableImage({ Size = _Vector2 })
			
			if not EditableImage then
				MutedErrorModule("BackgroundSceneManager: cyclorama downsample exceeded the EditableImage budget")
				
				return
			end
			local Size = Result.Size
			EditableImage:DrawImageTransformed(Vector2.zero, Vector2.new(_Vector2.X / Size.X, _Vector2.Y / Size.Y), 0, Result, {
				CombineType = Enum.ImageCombineType.Overwrite,
				PivotPoint = Vector2.zero
			})
			local PixelsBuffer = EditableImage:ReadPixelsBuffer(Vector2.zero, _Vector2)
			darkenPixelBuffer(PixelsBuffer, 0.5)
			EditableImage:WritePixelsBuffer(Vector2.zero, _Vector2, PixelsBuffer)
			
			if ActiveToken == CycloramaState.activeToken then
				Part.TextureContent = Content.fromObject(EditableImage)
				
				return
			end
		end)
		
		return
	end
end

local _ = function(CycloramaState)
	return CycloramaState.textureBuffers[CycloramaState.activeTextureIndex]
end

local _ = function(CycloramaState)
	return CycloramaState.textureBuffers[3 - CycloramaState.activeTextureIndex]
end

local _ = function(p2)
	if p2.crossfadeTweens then
		for _, crossfadeTween in p2.crossfadeTweens do
			crossfadeTween:Cancel()
		end
		p2.crossfadeTweens = nil
	end
end

function BackgroundSceneManagerDEPRECATEDModule:stageCrossfade(Part: Part, p3)
	-- upvalues: AssetService (copy), MutedErrorModule (copy), _Vector2 (copy), darkenPixelBuffer (copy)
	local ImageId = p3.imageId
	
	if Part:IsA("MeshPart") then
		local ActiveToken = self.activeToken
		task.spawn(function()
			-- upvalues: AssetService (upval), ImageId (copy), MutedErrorModule (upval), ActiveToken (copy), self (copy), _Vector2 (upval), darkenPixelBuffer (upval), Part (copy)
			local Success, Result = pcall(function()
				-- upvalues: AssetService (upval), ImageId (upval)
				return AssetService:CreateEditableImageAsync(Content.fromUri(`rbxassetid://{ImageId}`))
			end)
			
			if not Success or not Result then
				MutedErrorModule("BackgroundSceneManager: cyclorama downsample failed to load texture for imageId=" .. tostring(ImageId))
				
				return
			end
			if ActiveToken ~= self.activeToken then return end
			local EditableImage = AssetService:CreateEditableImage({ Size = _Vector2 })
			
			if not EditableImage then
				MutedErrorModule("BackgroundSceneManager: cyclorama downsample exceeded the EditableImage budget")
				
				return
			end
			local Size = Result.Size
			EditableImage:DrawImageTransformed(Vector2.zero, Vector2.new(_Vector2.X / Size.X, _Vector2.Y / Size.Y), 0, Result, {
				CombineType = Enum.ImageCombineType.Overwrite,
				PivotPoint = Vector2.zero
			})
			local PixelsBuffer = EditableImage:ReadPixelsBuffer(Vector2.zero, _Vector2)
			darkenPixelBuffer(PixelsBuffer, 0.5)
			EditableImage:WritePixelsBuffer(Vector2.zero, _Vector2, PixelsBuffer)
			
			if ActiveToken == self.activeToken then
				Part.TextureContent = Content.fromObject(EditableImage)
				
				return
			end
		end)
	end
	local TextureBuffer = self.textureBuffers[3 - self.activeTextureIndex]
	TextureBuffer.Transparency = 1
	
	if TextureBuffer:IsA("MeshPart") then
		TextureBuffer.TextureContent = Content.fromUri(`rbxassetid://{p3.imageId}`)
	end
	return TextureBuffer
end

local function hideCycloramaSceneElements(NewBackgroundScene, CurrentPageHasBlocksResult)
	-- upvalues: TweenService (copy), _TweenInfo (copy), config3 (copy)
	TweenService:Create(NewBackgroundScene.Baseplate, _TweenInfo, { Transparency = 1 }):Play()
	
	if not CurrentPageHasBlocksResult then
		NewBackgroundScene.LargerShapes.Position = config3.NoShapesNoWalls.LargerShapesPosition
		NewBackgroundScene.Clouds.Position = config3.NoShapesNoWalls.CloudsPosition
	end
	NewBackgroundScene.BackPanel.TextureWall.Transparency = 1
	NewBackgroundScene.BackPanel.TextureFloor.Transparency = 1
end

function BackgroundSceneManagerDEPRECATEDModule.new(Store, Networking, AvatarRoute, p3)
	-- upvalues: BackgroundSceneManagerDEPRECATEDModule (copy), FFlagAXBackgroundsCycloramaVR (copy), ParticleEffectManagerModule (copy), Lighting (copy), ReplicatedStorage (copy), FFlagAXPhotoboothFunctionality (copy), ParticleType (copy), config3 (copy), NotificationService (copy), FFlagAXBackgroundCycloramaRendering (copy)
	local t = {}
	setmetatable(t, BackgroundSceneManagerDEPRECATEDModule)
	t.connections = {}
	t.store = Store
	t.networking = Networking
	t.avatarRoute = AvatarRoute
	t.isSpatial = p3 or false
	
	if FFlagAXBackgroundsCycloramaVR and t.isSpatial then
		t:initCyclorama()
		
		return t
	end
	t.ParticleEffectManager = ParticleEffectManagerModule.new(Store, AvatarRoute)
	t.colorCorrection = Lighting:FindFirstChild("ColorCorrection")
	
	if not t.colorCorrection then
		t.colorCorrection = Instance.new("ColorCorrectionEffect")
		t.colorCorrection.Parent = Lighting
	end
	t.bloom = Lighting:FindFirstChild("Bloom")
	
	if not t.bloom then
		t.bloom = Instance.new("BloomEffect")
		t.bloom.Parent = Lighting
	end
	t.newBackgroundScene = ReplicatedStorage:WaitForChild("AvatarSceneNew")
	t.currentScene = nil
	
	if FFlagAXPhotoboothFunctionality then
		t.currentSceneLighting = nil
	end
	t.particleStorage = {
		[ParticleType.CatalogToAvatarEditor] = {
			largeParticleEmitter = t.newBackgroundScene.CatalogToAvatarEditorPFX.BIGBOIS,
			smallParticleEmitter = t.newBackgroundScene.CatalogToAvatarEditorPFX.SmolBois
		},
		[ParticleType.AvatarEditorToCatalog] = {
			largeParticleEmitter = t.newBackgroundScene.AvatarEditorToCatalogPFX.BIGBOIS,
			smallParticleEmitter = t.newBackgroundScene.AvatarEditorToCatalogPFX.SmolBois
		}
	}
	t.newBackgroundScene.BackPanel.Transparency = config3.LargerShapes.TextureWallTransparency
	t:setupTweening()
	t:updateTheme(string.lower(NotificationService.SelectedTheme or nil))
	
	if FFlagAXBackgroundCycloramaRendering then
		t:initCyclorama()
	end
	return t
end

function BackgroundSceneManagerDEPRECATEDModule:initCyclorama()
	-- upvalues: ReplicatedStorage (copy), MutedErrorModule (copy), FFlagAXBackgroundsCycloramaVR (copy), CF (copy)
	local AvatarCyclorama = ReplicatedStorage:FindFirstChild("AvatarCyclorama")
	
	if not AvatarCyclorama then
		MutedErrorModule("BackgroundSceneManager: AvatarCyclorama missing from ReplicatedStorage")
		
		return
	end
	local TextureMesh = AvatarCyclorama:FindFirstChild("texture_mesh")
	local ColorMesh = AvatarCyclorama:FindFirstChild("color_mesh")
	
	if not TextureMesh or not ColorMesh then
		MutedErrorModule(string.format("BackgroundSceneManager: AvatarCyclorama missing texture_mesh=%s color_mesh=%s", tostring(TextureMesh ~= nil), (tostring(ColorMesh ~= nil))))
		
		return
	end
	local texture_mesh_buffer = TextureMesh:Clone()
	texture_mesh_buffer.Name = "texture_mesh_buffer"
	texture_mesh_buffer.Parent = AvatarCyclorama
	self.cyclorama = AvatarCyclorama
	self.cycloramaFront = TextureMesh
	self.cycloramaBack = ColorMesh
	self.cycloramaState = {
		activeToken = 0,
		currentAssetId = nil,
		activeTextureIndex = 1,
		textureBuffers = { TextureMesh, texture_mesh_buffer }
	}
	TextureMesh.Anchored = true
	ColorMesh.Anchored = true
	texture_mesh_buffer.Anchored = true
	TextureMesh.Transparency = 1
	ColorMesh.Transparency = 1
	texture_mesh_buffer.Transparency = 1
	
	if FFlagAXBackgroundsCycloramaVR and self.isSpatial then
		AvatarCyclorama:PivotTo(CF)
	else
		AvatarCyclorama:PivotTo(CFrame.new(0, 0.01, 0) * CFrame.Angles(0, -1.5707963267948966, 0))
	end
	AvatarCyclorama.Parent = workspace
end

function BackgroundSceneManagerDEPRECATEDModule:applyBackground(p3)
	-- upvalues: FFlagAXBackgroundsCycloramaVR (copy), TweenService (copy), _TweenInfo (copy), AssetService (copy), MutedErrorModule (copy), _Vector2 (copy), darkenPixelBuffer (copy), _TweenInfo1 (copy), hideCycloramaSceneElements (copy)
	if not self.cyclorama then return end
	if self.cycloramaFront:IsA("MeshPart") then
		self.cycloramaFront.TextureContent = Content.fromUri(`rbxassetid://{p3.imageId}`)
	end
	if FFlagAXBackgroundsCycloramaVR and self.isSpatial then
		TweenService:Create(self.cycloramaFront, _TweenInfo, { Transparency = 0.015 }):Play()
		
		return
	end
	self.cycloramaBack.Color = p3.backgroundColor
	local CycloramaBack = self.cycloramaBack
	local CycloramaState = self.cycloramaState
	local ImageId = p3.imageId
	
	if CycloramaBack:IsA("MeshPart") then
		local ActiveToken = CycloramaState.activeToken
		task.spawn(function()
			-- upvalues: AssetService (upval), ImageId (copy), MutedErrorModule (upval), ActiveToken (copy), CycloramaState (copy), _Vector2 (upval), darkenPixelBuffer (upval), CycloramaBack (copy)
			local Success, Result = pcall(function()
				-- upvalues: AssetService (upval), ImageId (upval)
				return AssetService:CreateEditableImageAsync(Content.fromUri(`rbxassetid://{ImageId}`))
			end)
			
			if not Success or not Result then
				MutedErrorModule("BackgroundSceneManager: cyclorama downsample failed to load texture for imageId=" .. tostring(ImageId))
				
				return
			end
			if ActiveToken ~= CycloramaState.activeToken then return end
			local EditableImage = AssetService:CreateEditableImage({ Size = _Vector2 })
			
			if not EditableImage then
				MutedErrorModule("BackgroundSceneManager: cyclorama downsample exceeded the EditableImage budget")
				
				return
			end
			local Size = Result.Size
			EditableImage:DrawImageTransformed(Vector2.zero, Vector2.new(_Vector2.X / Size.X, _Vector2.Y / Size.Y), 0, Result, {
				CombineType = Enum.ImageCombineType.Overwrite,
				PivotPoint = Vector2.zero
			})
			local PixelsBuffer = EditableImage:ReadPixelsBuffer(Vector2.zero, _Vector2)
			darkenPixelBuffer(PixelsBuffer, 0.5)
			EditableImage:WritePixelsBuffer(Vector2.zero, _Vector2, PixelsBuffer)
			
			if ActiveToken == CycloramaState.activeToken then
				CycloramaBack.TextureContent = Content.fromObject(EditableImage)
				
				return
			end
		end)
	end
	TweenService:Create(self.cycloramaBack, _TweenInfo, { Transparency = 0 }):Play()
	TweenService:Create(self.cycloramaFront, _TweenInfo1, { Transparency = 0.015 }):Play()
	local CurrentPageHasBlocksResult = self:currentPageHasBlocks()
	
	if CurrentPageHasBlocksResult then
		self.largerShapesDisappearTween:Play()
		self.cloudsDisappearTween:Play()
	end
	hideCycloramaSceneElements(self.newBackgroundScene, CurrentPageHasBlocksResult)
end

function BackgroundSceneManagerDEPRECATEDModule:crossfadeToBackground(p3, ActiveToken)
	-- upvalues: AssetService (copy), MutedErrorModule (copy), _Vector2 (copy), darkenPixelBuffer (copy), FFlagAXBackgroundsCycloramaVR (copy), hideCycloramaSceneElements (copy), ContentProvider (copy), TweenService (copy), _TweenInfo (copy)
	if not self.cyclorama then return end
	local CycloramaState = self.cycloramaState
	
	if CycloramaState.crossfadeTweens then
		for _, crossfadeTween in CycloramaState.crossfadeTweens do
			crossfadeTween:Cancel()
		end
		CycloramaState.crossfadeTweens = nil
	end
	local CycloramaState1 = self.cycloramaState
	local TextureBuffer = CycloramaState1.textureBuffers[CycloramaState1.activeTextureIndex]
	local CycloramaState2 = self.cycloramaState
	local CycloramaBack = self.cycloramaBack
	local ImageId = p3.imageId
	
	if CycloramaBack:IsA("MeshPart") then
		local ActiveToken1 = CycloramaState2.activeToken
		task.spawn(function()
			-- upvalues: AssetService (upval), ImageId (copy), MutedErrorModule (upval), ActiveToken1 (copy), CycloramaState2 (copy), _Vector2 (upval), darkenPixelBuffer (upval), CycloramaBack (copy)
			local Success, Result = pcall(function()
				-- upvalues: AssetService (upval), ImageId (upval)
				return AssetService:CreateEditableImageAsync(Content.fromUri(`rbxassetid://{ImageId}`))
			end)
			
			if not Success or not Result then
				MutedErrorModule("BackgroundSceneManager: cyclorama downsample failed to load texture for imageId=" .. tostring(ImageId))
				
				return
			end
			if ActiveToken1 ~= CycloramaState2.activeToken then return end
			local EditableImage = AssetService:CreateEditableImage({ Size = _Vector2 })
			
			if not EditableImage then
				MutedErrorModule("BackgroundSceneManager: cyclorama downsample exceeded the EditableImage budget")
				
				return
			end
			local Size = Result.Size
			EditableImage:DrawImageTransformed(Vector2.zero, Vector2.new(_Vector2.X / Size.X, _Vector2.Y / Size.Y), 0, Result, {
				CombineType = Enum.ImageCombineType.Overwrite,
				PivotPoint = Vector2.zero
			})
			local PixelsBuffer = EditableImage:ReadPixelsBuffer(Vector2.zero, _Vector2)
			darkenPixelBuffer(PixelsBuffer, 0.5)
			EditableImage:WritePixelsBuffer(Vector2.zero, _Vector2, PixelsBuffer)
			
			if ActiveToken1 == CycloramaState2.activeToken then
				CycloramaBack.TextureContent = Content.fromObject(EditableImage)
				
				return
			end
		end)
	end
	local TextureBuffer1 = CycloramaState2.textureBuffers[3 - CycloramaState2.activeTextureIndex]
	TextureBuffer1.Transparency = 1
	
	if TextureBuffer1:IsA("MeshPart") then
		TextureBuffer1.TextureContent = Content.fromUri(`rbxassetid://{p3.imageId}`)
	end
	TextureBuffer.Transparency = 0.015
	
	if not FFlagAXBackgroundsCycloramaVR or not self.isSpatial then
		hideCycloramaSceneElements(self.newBackgroundScene)
	end
	task.spawn(function()
		-- upvalues: ContentProvider (upval), TextureBuffer1 (copy), MutedErrorModule (upval), p3 (copy), ActiveToken (copy), self (copy), TweenService (upval), _TweenInfo (upval), TextureBuffer (copy)
		if not pcall(function()
			-- upvalues: ContentProvider (upval), TextureBuffer1 (upval)
			ContentProvider:PreloadAsync({ TextureBuffer1 })
		end) then
			MutedErrorModule("BackgroundSceneManager: cyclorama crossfade preload failed for assetId=" .. tostring(p3.imageId))
		end
		if ActiveToken == self.cycloramaState.activeToken then
			local Tween = TweenService:Create(TextureBuffer1, _TweenInfo, { Transparency = 0.015 })
			local Tween1 = TweenService:Create(TextureBuffer, _TweenInfo, { Transparency = 1 })
			self.cycloramaState.crossfadeTweens = { Tween, Tween1 }
			Tween:Play()
			Tween1:Play()
			self.cycloramaState.activeTextureIndex = 3 - self.cycloramaState.activeTextureIndex
			self.cycloramaFront = TextureBuffer1
			
			return
		end
	end)
end

function BackgroundSceneManagerDEPRECATEDModule:hideBackground()
	-- upvalues: FFlagAXBackgroundsCycloramaVR (copy), TweenService (copy), _TweenInfo (copy), _TweenInfo1 (copy), config3 (copy)
	if not self.cyclorama then return end
	local CycloramaState = self.cycloramaState
	
	if CycloramaState.crossfadeTweens then
		for _, crossfadeTween in CycloramaState.crossfadeTweens do
			crossfadeTween:Cancel()
		end
		CycloramaState.crossfadeTweens = nil
	end
	if FFlagAXBackgroundsCycloramaVR and self.isSpatial then
		for _, textureBuffer in self.cycloramaState.textureBuffers do
			TweenService:Create(textureBuffer, _TweenInfo, { Transparency = 1 }):Play()
		end
		return
	else
		for _, textureBuffer1 in self.cycloramaState.textureBuffers do
			TweenService:Create(textureBuffer1, _TweenInfo, { Transparency = 1 }):Play()
		end
		TweenService:Create(self.cycloramaBack, _TweenInfo1, { Transparency = 1 }):Play()
		local ModelInformationForAppPage = self:getModelInformationForAppPage(self:getCurrentPage())
		
		if not ModelInformationForAppPage then
			TweenService:Create(self.newBackgroundScene.Baseplate, _TweenInfo, { Transparency = 0 }):Play()
			self.newBackgroundScene.BackPanel.TextureWall.Transparency = 1
			self.newBackgroundScene.BackPanel.TextureFloor.Transparency = 1
			
			return
		end
		TweenService:Create(self.newBackgroundScene.Baseplate, _TweenInfo, {
			Transparency = ModelInformationForAppPage.BaseplateTransparency
		}):Play()
		
		if self:currentPageHasBlocks() then
			self.newBackgroundScene.LargerShapes.Position = config3.Walls.LargerShapesPosition
			self.newBackgroundScene.Clouds.Position = config3.Walls.CloudsPosition
			self.largerShapesAppearTween:Play()
			self.cloudsAppearTween:Play()
		else
			self.newBackgroundScene.LargerShapes.Position = ModelInformationForAppPage.LargerShapesPosition
			self.newBackgroundScene.Clouds.Position = ModelInformationForAppPage.CloudsPosition
		end
		self.newBackgroundScene.BackPanel.TextureWall.Transparency = ModelInformationForAppPage.TextureWallTransparency
		self.newBackgroundScene.BackPanel.TextureFloor.Transparency = ModelInformationForAppPage.TextureWallTransparency
	end
end

function BackgroundSceneManagerDEPRECATEDModule:updateActiveBackground(State)
	-- upvalues: SelectActiveBackgroundFunction (copy), LoadBackgroundAsset (copy), MutedErrorModule (copy)
	if not self.cyclorama then return end
	local SelectActiveBackgroundResult = SelectActiveBackgroundFunction(State)
	
	if SelectActiveBackgroundResult == self.cycloramaState.currentAssetId then return end
	local CurrentAssetId = self.cycloramaState.currentAssetId
	local CycloramaState = self.cycloramaState
	CycloramaState.activeToken += 1
	local ActiveToken = self.cycloramaState.activeToken
	self.cycloramaState.currentAssetId = SelectActiveBackgroundResult
	
	if SelectActiveBackgroundResult == nil then
		self:hideBackground()
		
		return
	else
		LoadBackgroundAsset.load(SelectActiveBackgroundResult):andThen(function(Result)
			-- upvalues: ActiveToken (copy), self (copy), CurrentAssetId (copy)
			if ActiveToken ~= self.cycloramaState.activeToken then return end
			if CurrentAssetId == nil then
				self:applyBackground(Result)
				
				return
			else
				self:crossfadeToBackground(Result, ActiveToken)
			end
		end):catch(function(Err)
			-- upvalues: ActiveToken (copy), self (copy), MutedErrorModule (upval), SelectActiveBackgroundResult (copy)
			if ActiveToken == self.cycloramaState.activeToken then
				MutedErrorModule("BackgroundSceneManager: cyclorama load failed for assetId=" .. tostring(SelectActiveBackgroundResult) .. ": " .. tostring(Err))
				self.cycloramaState.currentAssetId = nil
				self:hideBackground()
				
				return
			end
		end)
	end
end

function BackgroundSceneManagerDEPRECATEDModule:setupTweening()
	-- upvalues: TweenService (copy), config3 (copy)
	local _TweenInfo = TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0)
	local _TweenInfo1 = TweenInfo.new(0.7, Enum.EasingStyle.Elastic, Enum.EasingDirection.In, 0, false, 0)
	local _TweenInfo2 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0)
	local Goal = { Transparency = 0 }
	local Goal1 = { Transparency = 1 }
	self.wallAppearTween = TweenService:Create(self.newBackgroundScene.BackPanel.TextureWall, _TweenInfo2, Goal)
	self.wallDisappearTween = TweenService:Create(self.newBackgroundScene.BackPanel.TextureWall, _TweenInfo2, Goal1)
	self.floorAppearTween = TweenService:Create(self.newBackgroundScene.BackPanel.TextureFloor, _TweenInfo2, Goal)
	self.floorDisappearTween = TweenService:Create(self.newBackgroundScene.BackPanel.TextureFloor, _TweenInfo2, Goal1)
	self.largerShapesAppearTween = TweenService:Create(self.newBackgroundScene.LargerShapes, _TweenInfo, { Position = config3.LargerShapes.LargerShapesPosition })
	self.largerShapesDisappearTween = TweenService:Create(self.newBackgroundScene.LargerShapes, _TweenInfo1, { Position = config3.Walls.LargerShapesPosition })
	self.cloudsAppearTween = TweenService:Create(self.newBackgroundScene.Clouds, _TweenInfo, { Position = config3.LargerShapes.CloudsPosition })
	self.cloudsDisappearTween = TweenService:Create(self.newBackgroundScene.Clouds, _TweenInfo1, { Position = config3.Walls.CloudsPosition })
	self.allTweens = {
		self.wallAppearTween, self.wallDisappearTween, self.floorAppearTween,
		self.floorDisappearTween, self.largerShapesAppearTween,
		self.largerShapesDisappearTween, self.cloudsAppearTween,
		self.cloudsDisappearTween
	}
end

function BackgroundSceneManagerDEPRECATEDModule:updateTheme(Theme)
	-- upvalues: config2 (copy), SharedFlagsModule (copy), GetSceneOverridesStoreFunction (copy), FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule (copy), Lighting (copy), ParticleType (copy)
	self.theme = Theme
	local DarkTheme = if Theme == "dark" then config2.DarkTheme else config2.LightTheme
	
	if SharedFlagsModule.FFlagEnableCoreContentTheme then
		self.sceneOverrides = GetSceneOverridesStoreFunction().getSceneOverrides()
		
		if self.sceneOverrides then
			DarkTheme = table.clone(DarkTheme)
			DarkTheme.BackPanelTextureColor = self.sceneOverrides.BackPanel
			DarkTheme.CloudsTextureColor = self.sceneOverrides.Clouds
			DarkTheme.LargerShapesTextureColor = self.sceneOverrides.LargerShapes
			DarkTheme.BasePlateColor = self.sceneOverrides.Baseplate
			DarkTheme.FogStart = self.sceneOverrides.FogStart
			DarkTheme.FogEnd = self.sceneOverrides.FogEnd
			DarkTheme.FogColor = self.sceneOverrides.FogColor
			local ColorSequence1 = ColorSequence.new(self.sceneOverrides.AvatarParticles)
			DarkTheme.ParticleEmitterColorAEToCatalog = ColorSequence1
			DarkTheme.ParticleEmitterColorCatalogToAE = ColorSequence1
		end
	end
	for _, child in self.newBackgroundScene.BackPanel:GetChildren() do
		child.Color3 = DarkTheme.BackPanelTextureColor
	end
	for _, child1 in self.newBackgroundScene.Clouds:GetChildren() do
		child1.Color3 = DarkTheme.CloudsTextureColor
	end
	for _, child2 in self.newBackgroundScene.LargerShapes:GetChildren() do
		child2.Color3 = DarkTheme.LargerShapesTextureColor
	end
	self.newBackgroundScene.Baseplate.Color = DarkTheme.BasePlateColor
	local SkyboxBlocker = self.newBackgroundScene:FindFirstChild("SkyboxBlocker")
	
	if SkyboxBlocker then
		if SharedFlagsModule.FFlagEnableCoreContentTheme and self.sceneOverrides then
			SkyboxBlocker.Transparency = self.sceneOverrides.SkyboxBlockerTransparency
			SkyboxBlocker.Color = self.sceneOverrides.SkyboxBlockerColor
		else
			SkyboxBlocker.Transparency = 1
		end
	end
	if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule or SharedFlagsModule.FFlagEnableCoreContentTheme then
		if DarkTheme.AmbientLightColor ~= nil then
			Lighting.Ambient = DarkTheme.AmbientLightColor
		end
		if DarkTheme.EnvironmentDiffuseScale ~= nil then
			Lighting.EnvironmentDiffuseScale = DarkTheme.EnvironmentDiffuseScale
		end
		if DarkTheme.EnvironmentSpecularScale ~= nil then
			Lighting.EnvironmentSpecularScale = DarkTheme.EnvironmentSpecularScale
		end
		if DarkTheme.FogStart ~= nil then
			Lighting.FogStart = DarkTheme.FogStart
		end
		if DarkTheme.FogEnd ~= nil then
			Lighting.FogEnd = DarkTheme.FogEnd
		end
	else
		self.newBackgroundScene.CharacterSpotLight.SpotLight.Brightness = DarkTheme.CharacterSpotLightBrightness
	end
	Lighting.FogColor = DarkTheme.FogColor
	
	for i, value in self.particleStorage do
		for _, value1 in value do
			value1.Color = if i == ParticleType.AvatarEditorToCatalog then DarkTheme.ParticleEmitterColorAEToCatalog else DarkTheme.ParticleEmitterColorCatalogToAE
		end
	end
end

function BackgroundSceneManagerDEPRECATEDModule:setLighting(p4)
	-- upvalues: Lighting (copy), FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule (copy), SharedFlagsModule (copy), FFlagAXGuardCharacterSpotLightSideAccessModule (copy)
	Lighting.Brightness = p4.Lighting.Brightness
	Lighting.ColorShift_Bottom = p4.Lighting.ColorShift_Bottom
	Lighting.ColorShift_Top = p4.Lighting.ColorShift_Top
	Lighting.OutdoorAmbient = p4.Lighting.OutdoorAmbient
	
	if not FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then
		Lighting.Ambient = p4.Lighting.Ambient
	end
	Lighting.ClockTime = p4.Lighting.ClockTime
	Lighting.GeographicLatitude = p4.Lighting.GeographicLatitude
	Lighting.TimeOfDay = p4.Lighting.TimeOfDay
	Lighting.FogEnd = if SharedFlagsModule.FFlagEnableCoreContentTheme and self.sceneOverrides then self.sceneOverrides.FogEnd else p4.Lighting.FogEnd
	
	if not FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then
		Lighting.FogStart = if SharedFlagsModule.FFlagEnableCoreContentTheme and self.sceneOverrides then self.sceneOverrides.FogStart else p4.Lighting.FogStart
	end
	if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then
		self.newBackgroundScene.CharacterSpotLight.SpotLight.Enabled = false
		
		if FFlagAXGuardCharacterSpotLightSideAccessModule then
			local CharacterSpotLightLeft = self.newBackgroundScene:FindFirstChild("CharacterSpotLight_Left")
			
			if CharacterSpotLightLeft and CharacterSpotLightLeft:FindFirstChild("SpotLight") then
				CharacterSpotLightLeft.SpotLight.Enabled = true
			end
			local CharacterSpotLightRight = self.newBackgroundScene:FindFirstChild("CharacterSpotLight_Right")
			
			if CharacterSpotLightRight and CharacterSpotLightRight:FindFirstChild("SpotLight") then
				CharacterSpotLightRight.SpotLight.Enabled = true
			end
		else
			self.newBackgroundScene.CharacterSpotLight_Left.SpotLight.Enabled = true
			self.newBackgroundScene.CharacterSpotLight_Right.SpotLight.Enabled = true
		end
	end
	if p4.Bloom then
		if self.bloom then
			self.bloom.Enabled = true
			self.bloom.Intensity = p4.Bloom.Intensity
			self.bloom.Size = p4.Bloom.Size
			self.bloom.Threshold = p4.Bloom.Threshold
		end
	elseif self.bloom then
		self.bloom.Enabled = false
	end
	if p4.ColorCorrection then
		if self.colorCorrection then
			self.colorCorrection.Enabled = true
			self.colorCorrection.Brightness = p4.ColorCorrection.Brightness
			self.colorCorrection.Contrast = p4.ColorCorrection.Contrast
			self.colorCorrection.Saturation = p4.ColorCorrection.Saturation
			
			return
		end
	elseif self.colorCorrection then
		self.colorCorrection.Enabled = false
	end
end

function BackgroundSceneManagerDEPRECATEDModule:startLighting()
	-- upvalues: config (copy)
	self:setLighting(config)
end

function BackgroundSceneManagerDEPRECATEDModule:updateLighting(Name)
	-- upvalues: AvatarScreen (copy), config1 (copy), LightUtility (copy), config (copy)
	if Name == AvatarScreen.ProfilePictureEditorFinal then
		self:setLighting(config1)
		
		if not game.Workspace:FindFirstChild("ThumbnailLightAnchor_0") then
			local CurrentCharacter = self.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter
			
			if CurrentCharacter then
				LightUtility.AddDefaultPointLightRelativeTo(CurrentCharacter.HumanoidRootPart.CFrame)
				
				return
			end
		end
	else
		self:setLighting(config)
		local ThumbnailLightAnchor0 = game.Workspace:FindFirstChild("ThumbnailLightAnchor_0")
		
		if ThumbnailLightAnchor0 then
			ThumbnailLightAnchor0:Destroy()
		end
	end
end

function BackgroundSceneManagerDEPRECATEDModule.playParticleEmitters(p4, Name)
	-- upvalues: PagePlayParticleType (copy), ParticleType (copy)
	if PagePlayParticleType[Name] == ParticleType.CatalogToAvatarEditor then
		task.spawn(function()
			-- upvalues: p4 (copy), ParticleType (upval)
			for _, value in p4.particleStorage[ParticleType.CatalogToAvatarEditor] do
				value.Parent = p4.newBackgroundScene.CatalogToAvatarEditorPFX
				value.Enabled = true
			end
			wait(1)
			
			for _, value1 in p4.particleStorage[ParticleType.CatalogToAvatarEditor] do
				value1.Enabled = false
			end
		end)
		
		return
	end
	if PagePlayParticleType[Name] == ParticleType.AvatarEditorToCatalog then
		task.spawn(function()
			-- upvalues: p4 (copy), ParticleType (upval)
			for _, value in p4.particleStorage[ParticleType.AvatarEditorToCatalog] do
				value.Parent = p4.newBackgroundScene.AvatarEditorToCatalogPFX
				value.Enabled = true
			end
			wait(1)
			
			for _, value1 in p4.particleStorage[ParticleType.AvatarEditorToCatalog] do
				value1.Enabled = false
			end
		end)
	end
end

function BackgroundSceneManagerDEPRECATEDModule:getCurrentPage()
	return self.avatarRoute.current.name
end

function BackgroundSceneManagerDEPRECATEDModule:currentPageHasBlocks(): boolean
	-- upvalues: PageBackgroundType (copy), BackgroundType (copy)
	return PageBackgroundType[self:getCurrentPage()] == BackgroundType.LargerShapes
end

function BackgroundSceneManagerDEPRECATEDModule.animateBackground(p5, AvatarEditor)
	task.spawn(function()
		-- upvalues: p5 (copy), AvatarEditor (copy)
		p5.wallDisappearTween:Play()
		p5.floorDisappearTween:Play()
		p5:playParticleEmitters(AvatarEditor)
		wait(0.2)
		p5.largerShapesAppearTween:Play()
		wait(0.2)
		p5.cloudsAppearTween:Play()
	end)
end

function BackgroundSceneManagerDEPRECATEDModule:transitionWithTweens(AvatarExperienceLandingPage)
	-- upvalues: AvatarScreen (copy), FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule (copy)
	if AvatarExperienceLandingPage == AvatarScreen.AvatarEditor or AvatarExperienceLandingPage == AvatarScreen.MySharedAvatars then
		self:animateBackground(AvatarScreen.AvatarEditor)
		
		if AvatarExperienceLandingPage == AvatarScreen.MySharedAvatars then
			self:animateBackground(AvatarScreen.MySharedAvatars)
		end
	elseif AvatarExperienceLandingPage == AvatarScreen.ProfilePictureEditorEmotes then
		self:animateBackground(AvatarScreen.ProfilePictureEditorEmotes)
	elseif FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule and AvatarExperienceLandingPage == AvatarScreen.Catalog then
		self:animateBackground(AvatarScreen.Catalog)
	elseif AvatarExperienceLandingPage == AvatarScreen.Catalog or AvatarExperienceLandingPage == AvatarScreen.AvatarExperienceLandingPage then
		task.spawn(function()
			-- upvalues: AvatarExperienceLandingPage (copy), AvatarScreen (upval), self (copy)
			if AvatarExperienceLandingPage ~= AvatarScreen.AvatarExperienceLandingPage then
				self:playParticleEmitters(AvatarScreen.Catalog)
			end
			self.largerShapesDisappearTween:Play()
			wait(0.2)
			self.cloudsDisappearTween:Play()
			wait(0.1)
			self.wallAppearTween:Play()
			self.floorAppearTween:Play()
		end)
	end
	local ModelInformationForAppPage = self:getModelInformationForAppPage(AvatarExperienceLandingPage)
	
	if ModelInformationForAppPage then
		self.newBackgroundScene.Baseplate.Transparency = ModelInformationForAppPage.BaseplateTransparency
		
		return
	else
		self.newBackgroundScene.Baseplate.Transparency = 0
	end
end

function BackgroundSceneManagerDEPRECATEDModule:getModelInformationForAppPage(AvatarExperienceLandingPage)
	-- upvalues: PageBackgroundType (copy), BackgroundType (copy), config3 (copy)
	return if PageBackgroundType[AvatarExperienceLandingPage] == BackgroundType.LargerShapes then config3.LargerShapes elseif PageBackgroundType[AvatarExperienceLandingPage] == BackgroundType.NoShapesNoWalls then config3.NoShapesNoWalls elseif PageBackgroundType[AvatarExperienceLandingPage] == BackgroundType.Walls then config3.Walls else nil
end

function BackgroundSceneManagerDEPRECATEDModule:transitionInstant(Name)
	-- upvalues: PagePlayParticleType (copy), ParticleType (copy)
	for _, allTween in self.allTweens do
		allTween:Cancel()
	end
	if PagePlayParticleType[Name] == ParticleType.None then
		for _, value in self.particleStorage do
			for _, value1 in value do
				value1.Enabled = false
				value1.Parent = nil
			end
		end
	end
	local ModelInformationForAppPage = self:getModelInformationForAppPage(Name)
	
	if ModelInformationForAppPage then
		self.newBackgroundScene.BackPanel.TextureFloor.Transparency = ModelInformationForAppPage.TextureWallTransparency
		self.newBackgroundScene.BackPanel.TextureWall.Transparency = ModelInformationForAppPage.TextureWallTransparency
		self.newBackgroundScene.LargerShapes.Position = ModelInformationForAppPage.LargerShapesPosition
		self.newBackgroundScene.Clouds.Position = ModelInformationForAppPage.CloudsPosition
		self.newBackgroundScene.Baseplate.Transparency = ModelInformationForAppPage.BaseplateTransparency
	end
end

function BackgroundSceneManagerDEPRECATEDModule:update(_, _, AvatarRoute, AvatarRoute1)
	-- upvalues: FFlagAXBackgroundsCycloramaVR (copy), AvatarScreen (copy), FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule (copy), UtilsModule (copy), FFlagAXBackgroundCycloramaRendering (copy), hideCycloramaSceneElements (copy), FFlagAXPhotoboothFunctionality (copy)
	if FFlagAXBackgroundsCycloramaVR and self.isSpatial then return end
	local Name = AvatarRoute.current.name
	local Name1 = AvatarRoute1.current.name
	local Name2 = AvatarRoute1.opaque.name
	local config = {
		[AvatarScreen.Catalog] = not FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule,
		[AvatarScreen.AvatarEditor] = not FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule,
		[AvatarScreen.MySharedAvatars] = not FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule,
		[AvatarScreen.ProfilePictureEditorEmotes] = true
	}
	local Flag = false
	
	if config[Name] then
		if Name == Name1 or not config[Name1] then
			if Name ~= Name2 and config[Name2] then
				Flag = true
			end
		else
			Flag = true
		end
	end
	self.ParticleEffectManager:setAvatarRoute(AvatarRoute)
	local IsNameMatch: boolean = Name == AvatarScreen.AvatarEditor or Name1 == AvatarScreen.AvatarEditor
	local IsNameMatch1: boolean = Name == AvatarScreen.Catalog or Name1 == AvatarScreen.Catalog
	local IsAvatarBackground = UtilsModule.isAvatarBackground(Name)
	local IsNameMatch2: boolean = Name == AvatarScreen.ProfilePictureEditorEmotes or Name1 == AvatarScreen.ProfilePictureEditorEmotes
	local IsNameMatch1_1: boolean = (Name == AvatarScreen.AvatarExperienceLandingPage or Name1 == AvatarScreen.AvatarExperienceLandingPage) and (IsNameMatch1 or (IsNameMatch or IsNameMatch2))
	local HasCurrentAssetId: boolean = FFlagAXBackgroundCycloramaRendering and (self.cyclorama and self.cycloramaState.currentAssetId ~= nil)
	
	if Name ~= Name1 then
		if (Flag or IsNameMatch1_1) and not HasCurrentAssetId then
			self:transitionWithTweens(Name)
		else
			self:transitionInstant(Name)
			
			if IsAvatarBackground then
				self:playParticleEmitters(Name)
			end
		end
		if HasCurrentAssetId then
			hideCycloramaSceneElements(self.newBackgroundScene)
		end
	end
	if Name ~= Name1 then
		if FFlagAXPhotoboothFunctionality and self.currentSceneLighting then return end
		self:updateLighting(Name)
	end
end

function BackgroundSceneManagerDEPRECATEDModule:start()
	-- upvalues: FFlagAXBackgroundCycloramaRendering (copy), FFlagAXBackgroundsCycloramaVR (copy), SharedFlagsModule (copy), AXSkyboxBlockerSizeX (copy), AXSkyboxBlockerSizeY (copy), AXSkyboxBlockerSizeZ (copy), AXSkyboxBlockerPositionX (copy), AXSkyboxBlockerPositionY (copy), AXSkyboxBlockerPositionZ (copy), NotificationService (copy), FFlagAXPhotoboothFunctionality (copy), GetSceneOverridesStoreFunction (copy), SignalsModule (copy), PhotoboothStoreBridge (copy), FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule (copy), GetFIntAvatarEditorParticleEmitterRateOverrideModule (copy), ReplicatedStorage (copy), AvatarScreen (copy), UtilsModule (copy)
	if FFlagAXBackgroundCycloramaRendering and self.cyclorama then
		self.cyclorama.Parent = workspace
	end
	if FFlagAXBackgroundsCycloramaVR and self.isSpatial then
		table.insert(self.connections, self.store.changed:connect(function(Value, _)
			-- upvalues: self (copy)
			if self.cyclorama then
				self:updateActiveBackground(Value)
			end
		end))
		
		if self.cyclorama then
			self:updateActiveBackground(self.store:getState())
		end
		return
	else
		self.colorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
		
		if SharedFlagsModule.FFlagEnableCoreContentTheme and not self.newBackgroundScene:FindFirstChild("SkyboxBlocker") then
			local SkyboxBlocker = self.newBackgroundScene.BackPanel:Clone()
			SkyboxBlocker.Name = "SkyboxBlocker"
			SkyboxBlocker.Material = Enum.Material.SmoothPlastic
			SkyboxBlocker.Size = Vector3.new(AXSkyboxBlockerSizeX, AXSkyboxBlockerSizeY, AXSkyboxBlockerSizeZ)
			SkyboxBlocker.Position = Vector3.new(AXSkyboxBlockerPositionX, AXSkyboxBlockerPositionY, AXSkyboxBlockerPositionZ)
			
			for _, child in SkyboxBlocker:GetChildren() do
				child:Destroy()
			end
			SkyboxBlocker.Parent = self.newBackgroundScene
		end
		self:updateTheme(self.theme)
		local Name = self.avatarRoute.current.name
		local Lowered = string.lower(NotificationService.SelectedTheme)
		
		if self.theme ~= Lowered then
			self:updateTheme(Lowered)
		end
		table.insert(self.connections, self.store.changed:connect(function(Value, p5)
			-- upvalues: self (copy), FFlagAXBackgroundCycloramaRendering (upval)
			local AvatarRoute = self.avatarRoute
			self:update(Value, p5, AvatarRoute, AvatarRoute)
			
			if FFlagAXBackgroundCycloramaRendering and self.cyclorama then
				self:updateActiveBackground(Value)
			end
		end))
		
		if FFlagAXBackgroundCycloramaRendering and self.cyclorama then
			self:updateActiveBackground(self.store:getState())
		end
		table.insert(self.connections, NotificationService:GetPropertyChangedSignal("SelectedTheme"):Connect(function()
			-- upvalues: FFlagAXPhotoboothFunctionality (upval), self (copy), NotificationService (upval)
			if not FFlagAXPhotoboothFunctionality or not self.currentScene or not self.currentSceneLighting then
				self:updateTheme(string.lower(NotificationService.SelectedTheme))
				
				return
			end
		end))
		
		if SharedFlagsModule.FFlagEnableCoreContentTheme then
			table.insert(self.connections, {
				disconnect = GetSceneOverridesStoreFunction().subscribe(function(_)
					-- upvalues: self (copy)
					self:updateTheme(self.theme)
				end)
			})
		end
		if FFlagAXPhotoboothFunctionality then
			table.insert(self.connections, SignalsModule.createEffect(function(p5)
				-- upvalues: PhotoboothStoreBridge (upval), self (copy)
				local Store = PhotoboothStoreBridge.getStore()
				
				if Store then
					local SelectedSceneId = Store.getSelectedSceneId(p5)
					self.changeSceneTask = task.spawn(function()
						-- upvalues: self (upval), SelectedSceneId (copy)
						self:pickScene(SelectedSceneId)
					end)
					
					return
				end
			end))
		end
		local Rate = 20
		self.newBackgroundScene.BlobShadow.Decal.Transparency = 0.4
		
		if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then
			local Size = self.newBackgroundScene.BlobShadow.Size
			local X = math.sqrt(Size.X * Size.Z * 0.7)
			self.newBackgroundScene.BlobShadow.Size = Vector3.new(X, Size.Y, X)
			self.newBackgroundScene.BlobShadow.Position = vector.create(0, -0.10000000149011612, 0)
		end
		local Number: number? = tonumber(GetFIntAvatarEditorParticleEmitterRateOverrideModule())
		
		if Number > 0 then
			Rate = Number
		end
		for _, value in self.particleStorage do
			for _, value1 in value do
				value1.Rate = Rate
			end
		end
		self:startLighting()
		
		if FFlagAXPhotoboothFunctionality then
			if not ReplicatedStorage:FindFirstChild("PhotoboothScenes") then
				self.scenesFolder = Instance.new("Folder")
				self.scenesFolder.Parent = ReplicatedStorage
				self.scenesFolder.Name = "PhotoboothScenes"
			end
			self:pickScene()
		else
			self.newBackgroundScene.Parent = game.Workspace
		end
		if Name == AvatarScreen.AvatarEditor or Name == AvatarScreen.AvatarExperienceLandingPage or Name == AvatarScreen.Catalog or UtilsModule.isAvatarBackground(Name) or Name == AvatarScreen.ProfilePictureEditorEmotes then
			self:transitionInstant(Name)
		end
		self.ParticleEffectManager:start()
		
		if UtilsModule.isAvatarBackground(Name) then
			self:playParticleEmitters(Name)
		end
	end
end

if FFlagAXPhotoboothFunctionality then
	function BackgroundSceneManagerDEPRECATEDModule:updateSceneLighting(CurrentSceneLighting)
		-- upvalues: Lighting (copy)
		if not CurrentSceneLighting then
			self.currentSceneLighting = nil
			self:startLighting()
			self:updateTheme(self.theme)
			
			return
		end
		self.currentSceneLighting = CurrentSceneLighting
		
		for _, value in {
			"Brightness", "Ambient", "ColorShift_Top", "ColorShift_Bottom",
			"OutdoorAmbient", "ShadowSoftness", "ClockTime", "FogStart", "FogEnd",
			"FogColor"
		} do
			if CurrentSceneLighting[value] ~= nil then
				Lighting[value] = CurrentSceneLighting[value]
			end
		end
	end
	
	function BackgroundSceneManagerDEPRECATEDModule:pickScene(SelectedSceneId)
		-- upvalues: PhotoboothStoreBridge (copy), PhotoboothSceneDataModule (copy), ReplicatedStorage (copy), InsertService (copy)
		if self.changeSceneTask then
			task.cancel(self.changeSceneTask)
		end
		if not SelectedSceneId then
			local Store = PhotoboothStoreBridge.getStore()
			SelectedSceneId = if Store then Store.getSelectedSceneId(false) else ""
		end
		local PHOTOBOOTHSCENE = PhotoboothSceneDataModule.PHOTOBOOTH_SCENES[SelectedSceneId]
		
		if not PHOTOBOOTHSCENE then
			warn("BackgroundSceneManager: Unknown scene ID:", SelectedSceneId)
			
			return
		end
		if self.currentScene then
			self.currentScene.Parent = self.scenesFolder
			self.currentScene = nil
		end
		if SelectedSceneId == "" then
			self.newBackgroundScene.Parent = game.Workspace
			self.currentScene = nil
			self:updateSceneLighting(nil)
			self:updateTheme(self.theme)
		else
			self.newBackgroundScene.Parent = ReplicatedStorage
			
			if PHOTOBOOTHSCENE.asset then
				local Id = nil
				if self.scenesFolder:FindFirstChild(PHOTOBOOTHSCENE.id) then
					Id = self.scenesFolder:FindFirstChild(PHOTOBOOTHSCENE.id)
				else
					Id = InsertService:LoadLocalAsset(PHOTOBOOTHSCENE.asset)
					Id.Name = PHOTOBOOTHSCENE.id
					Id.Parent = self.scenesFolder
					
					if PHOTOBOOTHSCENE.position then
						Id:SetPrimaryPartCFrame(CFrame.new(PHOTOBOOTHSCENE.position))
					end
					if PHOTOBOOTHSCENE.rotation then
						Id:SetPrimaryPartCFrame(Id:GetPrimaryPartCFrame() * PHOTOBOOTHSCENE.rotation)
					end
				end
				self.currentScene = Id
				self.currentScene.Parent = game.Workspace
				
				if PHOTOBOOTHSCENE.lighting then
					self:updateSceneLighting(PHOTOBOOTHSCENE.lighting)
				else
					self:updateSceneLighting(nil)
					self:updateTheme(self.theme)
				end
			end
		end
		self.changeSceneTask = nil
	end
end
function BackgroundSceneManagerDEPRECATEDModule:stop()
	-- upvalues: FFlagAXPhotoboothFunctionality (copy), FFlagAXBackgroundCycloramaRendering (copy), ReplicatedStorage (copy), FFlagAXBackgroundsCycloramaVR (copy), ParticleType (copy)
	for _, connection in self.connections do
		if FFlagAXPhotoboothFunctionality and typeof(connection) == "function" then
			connection()
		else
			connection:disconnect()
		end
	end
	if FFlagAXPhotoboothFunctionality and self.currentScene then
		self.currentScene.Parent = self.scenesFolder
	end
	if FFlagAXBackgroundCycloramaRendering and self.cyclorama then
		self.cycloramaFront.Transparency = 1
		self.cycloramaBack.Transparency = 1
		self.cyclorama.Parent = ReplicatedStorage
		local CycloramaState = self.cycloramaState
		CycloramaState.activeToken += 1
		self.cycloramaState.currentAssetId = nil
	end
	self.connections = {}
	
	if FFlagAXBackgroundsCycloramaVR and self.isSpatial then return end
	self.newBackgroundScene.Parent = ReplicatedStorage
	self.ParticleEffectManager:stop()
	
	for i, value in self.particleStorage do
		for _, value1 in value do
			value1.Parent = if i == ParticleType.AvatarEditorToCatalog then self.newBackgroundScene.AvatarEditorToCatalogPFX else self.newBackgroundScene.CatalogToAvatarEditorPFX
		end
	end
end

function BackgroundSceneManagerDEPRECATEDModule:onDestroy()
	-- upvalues: FFlagAXBackgroundsCycloramaVR (copy)
	if not FFlagAXBackgroundsCycloramaVR or not self.isSpatial then
		self.ParticleEffectManager:onDestroy()
		
		return
	end
end

function BackgroundSceneManagerDEPRECATEDModule:updateAvatarRoute(AvatarRoute, p5)
	self.avatarRoute = AvatarRoute
	local State = self.store:getState()
	self:update(State, State, AvatarRoute, p5)
end

return BackgroundSceneManagerDEPRECATEDModule