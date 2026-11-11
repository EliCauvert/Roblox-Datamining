local CorePackages = game:GetService("CorePackages")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local NotificationService = game:GetService("NotificationService")
local InsertService = game:GetService("InsertService")
local MaterialService = game:GetService("MaterialService")
local TweenService = game:GetService("TweenService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SignalsModule = require(CorePackages.Packages.Signals)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetSceneOverridesStoreFunction = require(CorePackages.Workspace.Packages.Style).getSceneOverridesStore
local PhotoboothSceneDataModule = require(Modules.AvatarExperience.Photobooth.Components.Scenes.PhotoboothSceneData)
local PhotoboothStoreBridge = require(CorePackages.Workspace.Packages.AvatarExperiencePhotobooth).PhotoboothStoreBridge
local ParticleEffectManagerModule = require(Modules.AvatarExperience.Common.Managers.ParticleEffectManager)
local FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule = require(Modules.AvatarExperience.Flags.FFlagUseUpdatedBackgroundSceneSettingsOnMobile)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXBackgroundCycloramaRendering = AvatarExperienceFlagsModule.FFlagAXBackgroundCycloramaRendering
local FFlagAXBackgroundsCycloramaVR = AvatarExperienceFlagsModule.FFlagAXBackgroundsCycloramaVR
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local LoadBackgroundAsset = AvatarExperienceCommonModule.Backgrounds.loadBackgroundAsset
local SelectActiveBackgroundFunction = AvatarExperienceCommonModule.Backgrounds.selectActiveBackground
local FFlagEnableCoreContentTheme = SharedFlagsModule.FFlagEnableCoreContentTheme
local _TweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local CF = CFrame.new(0, 0, -6) * CFrame.Angles(0, 3.141592653589793, 0)
local PhotoboothScenes = require(CorePackages.Workspace.Packages.AvatarExperiencePhotobooth).Enums.PhotoboothScenes
local BackgroundSceneManager = {}
BackgroundSceneManager.__index = BackgroundSceneManager

function BackgroundSceneManager.new(Store, Networking, AvatarRoute, p1)
	-- upvalues: BackgroundSceneManager (copy), FFlagAXBackgroundsCycloramaVR (copy), ParticleEffectManagerModule (copy), ReplicatedStorage (copy), FFlagAXBackgroundCycloramaRendering (copy)
	local t = {}
	setmetatable(t, BackgroundSceneManager)
	t.store = Store
	t.networking = Networking
	t.avatarRoute = AvatarRoute
	t.isSpatial = p1 or false
	t.connections = {}
	t.signals = {}
	
	if FFlagAXBackgroundsCycloramaVR and t.isSpatial then
		t.ParticleEffectManager = nil
		t.managedLightingObjects = {}
		t.originalLightingObjects = {}
		t.managedMaterialVariants = {}
		t.defaultScenes = { light = "", dark = "" }
		t.currentScene = nil
		t.changeSceneTask = nil
		t:initCyclorama()
		
		return t
	end
	t.ParticleEffectManager = ParticleEffectManagerModule.new(Store, AvatarRoute)
	t.managedLightingObjects = {}
	t.originalLightingObjects = {}
	t.managedMaterialVariants = {}
	t.defaultScenes = { light = "BlockyLight", dark = "BlockyDark" }
	
	if ReplicatedStorage:FindFirstChild("Scenes") then
		t.scenesFolder = ReplicatedStorage:FindFirstChild("Scenes")
	else
		t.scenesFolder = Instance.new("Folder")
		t.scenesFolder.Parent = ReplicatedStorage
		t.scenesFolder.Name = "Scenes"
	end
	t:CleanupDefaultBackgroundScene()
	t.currentScene = nil
	t.changeSceneTask = nil
	
	if FFlagAXBackgroundCycloramaRendering then
		t:initCyclorama()
	end
	return t
end

function BackgroundSceneManager:initCyclorama()
	-- upvalues: ReplicatedStorage (copy), MutedErrorModule (copy), FFlagAXBackgroundsCycloramaVR (copy), CF (copy)
	local AvatarCyclorama = ReplicatedStorage:FindFirstChild("AvatarCyclorama")
	
	if not AvatarCyclorama or not AvatarCyclorama:IsA("Model") then
		MutedErrorModule("BackgroundSceneManager: AvatarCyclorama missing from ReplicatedStorage")
		
		return
	end
	local TextureMesh = AvatarCyclorama:FindFirstChild("texture_mesh")
	local ColorMesh = AvatarCyclorama:FindFirstChild("color_mesh")
	local TextureMesh1 = if TextureMesh and TextureMesh:IsA("BasePart") then TextureMesh else nil
	local ColorMesh1 = if ColorMesh and ColorMesh:IsA("BasePart") then ColorMesh else nil
	
	if not TextureMesh1 or not ColorMesh1 then
		MutedErrorModule(string.format("BackgroundSceneManager: AvatarCyclorama missing texture_mesh=%s color_mesh=%s", tostring(TextureMesh1 ~= nil), (tostring(ColorMesh1 ~= nil))))
		
		return
	end
	self.cyclorama = AvatarCyclorama
	self.cycloramaFront = TextureMesh1
	self.cycloramaBack = ColorMesh1
	self.cycloramaState = { activeToken = 0, currentAssetId = nil }
	TextureMesh1.Anchored = true
	ColorMesh1.Anchored = true
	TextureMesh1.Transparency = 1
	ColorMesh1.Transparency = 1
	
	if FFlagAXBackgroundsCycloramaVR and self.isSpatial then
		AvatarCyclorama:PivotTo(CF)
	else
		AvatarCyclorama:PivotTo(CFrame.new(0, 0, 0) * CFrame.Angles(0, -1.5707963267948966, 0))
	end
	AvatarCyclorama.Parent = workspace
end

function BackgroundSceneManager:applyBackground(p1)
	-- upvalues: TweenService (copy), _TweenInfo (copy), FFlagAXBackgroundsCycloramaVR (copy)
	local CycloramaFront = self.cycloramaFront
	local CycloramaBack = self.cycloramaBack
	
	if not CycloramaFront or not CycloramaBack then return end
	if CycloramaFront:IsA("MeshPart") then
		CycloramaFront.TextureContent = Content.fromUri(`rbxassetid://{p1.imageId}`)
	end
	TweenService:Create(CycloramaFront, _TweenInfo, { Transparency = 0.015 }):Play()
	
	if not FFlagAXBackgroundsCycloramaVR or not self.isSpatial then
		CycloramaBack.Color = p1.backgroundColor
		TweenService:Create(CycloramaBack, _TweenInfo, { Transparency = 0 }):Play()
		self:hideCurrentSceneElements()
		
		return
	end
end

function BackgroundSceneManager:hideCurrentSceneElements()
	-- upvalues: TweenService (copy), _TweenInfo (copy)
	local CurrentScene = self.currentScene
	
	if not CurrentScene then return end
	local Baseplate = CurrentScene:FindFirstChild("Baseplate")
	
	if Baseplate and Baseplate:IsA("BasePart") then
		TweenService:Create(Baseplate, _TweenInfo, { Transparency = 1 }):Play()
	end
	local LargerShapes = CurrentScene:FindFirstChild("LargerShapes")
	
	if LargerShapes and LargerShapes:IsA("BasePart") then
		if self.cycloramaSavedLargerShapesPosition == nil then
			self.cycloramaSavedLargerShapesPosition = LargerShapes.Position
		end
		LargerShapes.Position = vector.create(-62.89799880981445, -1000, -8.8149995803833)
	end
	local Clouds = CurrentScene:FindFirstChild("Clouds")
	
	if Clouds and Clouds:IsA("BasePart") then
		if self.cycloramaSavedCloudsPosition == nil then
			self.cycloramaSavedCloudsPosition = Clouds.Position
		end
		Clouds.Position = vector.create(-90, 1000, 0)
	end
end

function BackgroundSceneManager:hideBackground()
	-- upvalues: TweenService (copy), _TweenInfo (copy), FFlagAXBackgroundsCycloramaVR (copy)
	local CycloramaFront = self.cycloramaFront
	local CycloramaBack = self.cycloramaBack
	
	if not CycloramaFront or not CycloramaBack then return end
	TweenService:Create(CycloramaFront, _TweenInfo, { Transparency = 1 }):Play()
	
	if FFlagAXBackgroundsCycloramaVR and self.isSpatial then return end
	TweenService:Create(CycloramaBack, _TweenInfo, { Transparency = 1 }):Play()
	local CurrentScene = self.currentScene
	
	if CurrentScene then
		local Baseplate = CurrentScene:FindFirstChild("Baseplate")
		
		if Baseplate and Baseplate:IsA("BasePart") then
			TweenService:Create(Baseplate, _TweenInfo, { Transparency = 0 }):Play()
		end
		local LargerShapes = CurrentScene:FindFirstChild("LargerShapes")
		
		if LargerShapes and LargerShapes:IsA("BasePart") and self.cycloramaSavedLargerShapesPosition then
			LargerShapes.Position = self.cycloramaSavedLargerShapesPosition
			self.cycloramaSavedLargerShapesPosition = nil
		end
		local Clouds = CurrentScene:FindFirstChild("Clouds")
		
		if Clouds and Clouds:IsA("BasePart") and self.cycloramaSavedCloudsPosition then
			Clouds.Position = self.cycloramaSavedCloudsPosition
			self.cycloramaSavedCloudsPosition = nil
		end
	end
end

function BackgroundSceneManager:updateActiveBackground(State)
	-- upvalues: SelectActiveBackgroundFunction (copy), LoadBackgroundAsset (copy), MutedErrorModule (copy)
	local CycloramaState = self.cycloramaState
	
	if not CycloramaState or not self.cyclorama then return end
	local SelectActiveBackgroundResult = SelectActiveBackgroundFunction(State)
	
	if SelectActiveBackgroundResult == CycloramaState.currentAssetId then return end
	CycloramaState.activeToken += 1
	local ActiveToken = CycloramaState.activeToken
	CycloramaState.currentAssetId = SelectActiveBackgroundResult
	
	if SelectActiveBackgroundResult == nil then
		self:hideBackground()
		
		return
	else
		LoadBackgroundAsset.load(SelectActiveBackgroundResult):andThen(function(Result)
			-- upvalues: ActiveToken (copy), CycloramaState (copy), self (copy)
			if ActiveToken == CycloramaState.activeToken then
				self:applyBackground(Result)
				
				return
			end
		end):catch(function(Err)
			-- upvalues: ActiveToken (copy), CycloramaState (copy), MutedErrorModule (upval), SelectActiveBackgroundResult (copy), self (copy)
			if ActiveToken == CycloramaState.activeToken then
				MutedErrorModule("BackgroundSceneManager: cyclorama load failed for assetId=" .. tostring(SelectActiveBackgroundResult) .. ": " .. tostring(Err))
				CycloramaState.currentAssetId = nil
				self:hideBackground()
				
				return
			end
		end)
	end
end

function BackgroundSceneManager:moveOriginalLightingToStorage()
	-- upvalues: Lighting (copy)
	for _, child in Lighting:GetChildren() do
		table.insert(self.originalLightingObjects, child)
		child.Parent = nil
	end
end

function BackgroundSceneManager:clearManagedLighting()
	for _, managedLightingObject in self.managedLightingObjects do
		managedLightingObject:Destroy()
	end
	self.managedLightingObjects = {}
end

function BackgroundSceneManager:restoreOriginalLighting()
	-- upvalues: Lighting (copy)
	self:clearManagedLighting()
	
	for _, originalLightingObject in self.originalLightingObjects do
		originalLightingObject.Parent = Lighting
	end
	self.originalLightingObjects = {}
end

function BackgroundSceneManager:applyLightingFromConfig(Object)
	-- upvalues: Lighting (copy)
	self:clearManagedLighting()
	local LightingConfig = Object:FindFirstChild("LightingConfig")
	
	if not LightingConfig then return end
	for i, attribute in LightingConfig:GetAttributes() do
		local Success, Result = pcall(function()
			-- upvalues: Lighting (upval), i (copy), attribute (copy)
			Lighting[i] = attribute
		end)
		
		if not Success then
			warn("BackgroundSceneManager: Failed to apply lighting property", i, ":", Result)
		end
	end
	local LightingObjects = Object:FindFirstChild("LightingObjects")
	
	if LightingObjects then
		for _, child in LightingObjects:GetChildren() do
			local Copy = child:Clone()
			Copy.Parent = Lighting
			table.insert(self.managedLightingObjects, Copy)
		end
	end
end

function BackgroundSceneManager:clearManagedMaterialVariants()
	for _, managedMaterialVariant in self.managedMaterialVariants do
		managedMaterialVariant:Destroy()
	end
	self.managedMaterialVariants = {}
end

function BackgroundSceneManager:applyMaterialVariantsFromConfig(Child)
	-- upvalues: MaterialService (copy)
	self:clearManagedMaterialVariants()
	local MaterialVariants = Child:FindFirstChild("MaterialVariants")
	
	if MaterialVariants then
		for _, MaterialVariant in MaterialVariants:GetChildren() do
			if MaterialVariant:IsA("MaterialVariant") then
				local MaterialVariantClone = MaterialVariant:Clone()
				MaterialVariantClone.Parent = MaterialService
				table.insert(self.managedMaterialVariants, MaterialVariantClone)
			end
		end
	end
end

function BackgroundSceneManager:pickScene(p1)
	-- upvalues: PhotoboothStoreBridge (copy), PhotoboothSceneDataModule (copy), NotificationService (copy), FFlagEnableCoreContentTheme (copy), InsertService (copy), PhotoboothScenes (copy), MutedErrorModule (copy), FFlagAXBackgroundCycloramaRendering (copy)
	if not p1 then
		local Store = PhotoboothStoreBridge.getStore()
		
		if Store then
			p1 = Store.getSelectedSceneId(false)
		end
	end
	local P22 = p1 or ""
	local PHOTOBOOTHSCENE = PhotoboothSceneDataModule.PHOTOBOOTH_SCENES[P22]
	
	if not PHOTOBOOTHSCENE then
		warn("BackgroundSceneManager: Unknown scene ID:", P22)
		
		return
	end
	if self.currentScene then
		self.currentScene.Parent = self.scenesFolder
	end
	self.currentScene = nil
	local IsDark = (NotificationService.SelectedTheme or "Light"):lower() == "dark"
	
	if P22 == "" then
		local Dark = if IsDark then self.defaultScenes.dark else self.defaultScenes.light
		local Dark1 = if self.scenesFolder then self.scenesFolder:FindFirstChild(Dark) else nil
		
		if Dark1 then
			self.currentScene = Dark1
			Dark1.Parent = workspace
			self:applyLightingFromConfig(Dark1)
			self:applyMaterialVariantsFromConfig(Dark1)
			
			if FFlagEnableCoreContentTheme then
				self:applyParticleColorOverrides()
			end
		end
	else
		local Asset = PHOTOBOOTHSCENE.asset
		local Position = PHOTOBOOTHSCENE.position
		local Rotation = PHOTOBOOTHSCENE.rotation
		local Remote = PHOTOBOOTHSCENE.remote or false
		
		if IsDark and PHOTOBOOTHSCENE.dark then
			Asset = PHOTOBOOTHSCENE.dark.asset or PHOTOBOOTHSCENE.asset
			Position = PHOTOBOOTHSCENE.dark.position or PHOTOBOOTHSCENE.position
			Rotation = PHOTOBOOTHSCENE.dark.rotation or PHOTOBOOTHSCENE.rotation
			Remote = PHOTOBOOTHSCENE.dark.remote or (PHOTOBOOTHSCENE.remote or false)
		end
		if Asset then
			local Child = nil
			local Text = PHOTOBOOTHSCENE.id .. (if IsDark and PHOTOBOOTHSCENE.dark then "_dark" else "_light")
			
			if self.scenesFolder then
				Child = self.scenesFolder:FindFirstChild(Text)
			end
			if not Child then
				local Success1, Result1 = pcall(function()
					-- upvalues: Remote (ref), Asset (ref), InsertService (upval)
					if not Remote then
						return InsertService:LoadLocalAsset(Asset)
					end
					local Number: number? = tonumber(if string.find(Asset, "rbxassetid://") then string.gsub(Asset, "rbxassetid://", "") else Asset)
					
					if not Number then
						error("Invalid asset ID format: " .. Asset)
						
						return
					end
					local Asset1 = InsertService:LoadAsset(Number)
					local Child = Asset1:GetChildren()[1]
					
					if not Child then
						error("No content found in loaded remote asset: " .. Asset)
						
						return
					end
					Child.Parent = nil
					Asset1:Destroy()
					
					return Child
				end)
				
				if Success1 and Result1 then
					Child = Result1
					
					if Child then
						Child.Name = Text
						Child.Parent = self.scenesFolder
					end
					local X = Position or vector.create(0, 0, 0)
					local Rotation1 = if Rotation then Rotation else CFrame.Angles(0, 0, 0)
					local Success2, Result2 = pcall(function()
						-- upvalues: Child (ref), X (copy), Rotation1 (copy)
						if Child then
							Child:PivotTo(CFrame.new(X) * Rotation1)
						end
					end)
					
					if not Success2 then
						warn("BackgroundSceneManager: Failed to set scene position for", PHOTOBOOTHSCENE.id, ":", Result2)
					end
				else
					warn("BackgroundSceneManager: Failed to load", if Remote then PhotoboothScenes.REMOTE else PhotoboothScenes.LOCAL, "scene asset", Asset, "for scene", PHOTOBOOTHSCENE.id)
					MutedErrorModule("BackgroundSceneManager failed to load scene asset.")
					
					if Result1 then
						warn("BackgroundSceneManager: Error details:", Result1)
					end
					local Dark = if IsDark then self.defaultScenes.dark else self.defaultScenes.light
					
					if not self.scenesFolder then
						warn("BackgroundSceneManager: No fallback scene available")
						
						return
					end
					local Dark2 = self.scenesFolder:FindFirstChild(Dark)
					
					if Dark2 then
						warn("BackgroundSceneManager: Falling back to default scene:", Dark)
						Child = Dark2
					end
				end
			end
			if Child then
				self.currentScene = Child
				self.currentScene.Parent = workspace
				local Success, Result = pcall(function()
					-- upvalues: self (copy), Child (ref)
					self:applyLightingFromConfig(Child)
				end)
				
				if not Success then
					warn("BackgroundSceneManager: Failed to apply lighting configuration for scene", PHOTOBOOTHSCENE.id, ":", Result)
				end
				local Success3, Result3 = pcall(function()
					-- upvalues: self (copy), Child (ref)
					self:applyMaterialVariantsFromConfig(Child)
				end)
				
				if not Success3 then
					warn("BackgroundSceneManager: Failed to apply material configuration for scene", PHOTOBOOTHSCENE.id, ":", Result3)
				end
				if FFlagEnableCoreContentTheme then
					self:applyParticleColorOverrides()
				end
			end
		end
	end
	local CycloramaState = self.cycloramaState
	
	if FFlagAXBackgroundCycloramaRendering and CycloramaState and CycloramaState.currentAssetId ~= nil then
		self:hideCurrentSceneElements()
	end
end

function BackgroundSceneManager:createLightingConfiguration(Parent)
	-- upvalues: Lighting (copy)
	local LightingConfig = Instance.new("Configuration")
	LightingConfig.Name = "LightingConfig"
	LightingConfig.Parent = Parent
	LightingConfig:SetAttribute("Brightness", Lighting.Brightness)
	LightingConfig:SetAttribute("ClockTime", Lighting.ClockTime)
	LightingConfig:SetAttribute("EnvironmentDiffuseScale", Lighting.EnvironmentDiffuseScale)
	LightingConfig:SetAttribute("EnvironmentSpecularScale", Lighting.EnvironmentSpecularScale)
	LightingConfig:SetAttribute("FogEnd", Lighting.FogEnd)
	LightingConfig:SetAttribute("FogStart", Lighting.FogStart)
	LightingConfig:SetAttribute("GeographicLatitude", Lighting.GeographicLatitude)
	LightingConfig:SetAttribute("ShadowSoftness", Lighting.ShadowSoftness)
	LightingConfig:SetAttribute("Ambient", Lighting.Ambient)
	LightingConfig:SetAttribute("ColorShift_Bottom", Lighting.ColorShift_Bottom)
	LightingConfig:SetAttribute("ColorShift_Top", Lighting.ColorShift_Top)
	LightingConfig:SetAttribute("FogColor", Lighting.FogColor)
	LightingConfig:SetAttribute("OutdoorAmbient", Lighting.OutdoorAmbient)
	LightingConfig:SetAttribute("TimeOfDay", Lighting.TimeOfDay)
	LightingConfig:SetAttribute("GlobalShadows", Lighting.GlobalShadows)
	
	return LightingConfig
end

local ChildNames = { "CatalogToAvatarEditorPFX", "AvatarEditorToCatalogPFX" }

function BackgroundSceneManager:applyParticleColorOverrides()
	-- upvalues: SharedFlagsModule (copy), GetSceneOverridesStoreFunction (copy), ChildNames (copy)
	if not SharedFlagsModule.FFlagEnableCoreContentTheme then return end
	local CurrentScene = self.currentScene
	
	if not CurrentScene then return end
	local SceneOverrides = GetSceneOverridesStoreFunction().getSceneOverrides()
	
	if not SceneOverrides then return end
	local ColorSequence1 = ColorSequence.new(SceneOverrides.AvatarParticles)
	
	for _, childName in ChildNames do
		local Child = CurrentScene:FindFirstChild(childName)
		
		if Child then
			for _, ParticleEmitter in Child:GetDescendants() do
				if ParticleEmitter:IsA("ParticleEmitter") then
					ParticleEmitter.Color = ColorSequence1
				end
			end
		end
	end
end

function BackgroundSceneManager:CleanupDefaultBackgroundScene()
	-- upvalues: ReplicatedStorage (copy), FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule (copy), FFlagAXBackgroundCycloramaRendering (copy)
	local AvatarSceneNew = ReplicatedStorage:WaitForChild("AvatarSceneNew")
	
	for _, value in {
		{
			name = self.defaultScenes.light,
			theme = {
				Brightness = 2,
				FogEnd = 92,
				GlobalShadows = true,
				ShadowSoftness = 0.2,
				BloomEnabled = true,
				BloomSize = 12,
				BloomThreshold = 0.95,
				ColorCorrectionEnabled = true,
				ColorCorrectionBrightness = 0,
				ColorCorrectionContrast = 0,
				ColorCorrectionSaturation = 0,
				SkyboxAssetLocation = "rbxasset://textures/AvatarEditorImages/LightPixel.png",
				ColorShift_Bottom = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then Color3.fromRGB(108, 94, 66) else Color3.fromRGB(232, 255, 146),
				ColorShift_Top = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then Color3.fromRGB(94, 100, 172) else Color3.fromRGB(85, 136, 167),
				ClockTime = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 11 else 12,
				GeographicLatitude = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 24 else 41.733,
				OutdoorAmbient = Color3.fromRGB(0, 0, 0),
				TimeOfDay = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then "11:00:00" else "12:00:00",
				Ambient = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then Color3.fromRGB(130, 130, 130) else Color3.fromRGB(170, 170, 170),
				EnvironmentDiffuseScale = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 0.2 else nil,
				EnvironmentSpecularScale = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 1 else nil,
				FogStart = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 30 else 20,
				FogColor = Color3.fromRGB(213, 213, 213),
				BloomIntensity = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 0.2 else 0.3,
				ColorCorrectionTintColor = Color3.fromRGB(255, 255, 255),
				BackPanelTextureColor = Color3.fromRGB(213, 213, 213),
				CloudsTextureColor = Color3.fromRGB(222, 222, 222),
				LargerShapesTextureColor = Color3.fromRGB(222, 222, 222),
				BasePlateColor = Color3.fromRGB(213, 213, 213)
			}
		},
		{
			name = self.defaultScenes.dark,
			theme = {
				Brightness = 2,
				FogEnd = 92,
				GlobalShadows = true,
				ShadowSoftness = 0.2,
				BloomEnabled = true,
				BloomSize = 12,
				BloomThreshold = 0.95,
				ColorCorrectionEnabled = true,
				ColorCorrectionBrightness = 0,
				ColorCorrectionContrast = 0,
				ColorCorrectionSaturation = 0,
				SkyboxAssetLocation = "rbxasset://textures/ui/AvatarExperience/AvatarExperienceSkyboxDarkTheme.png",
				ColorShift_Bottom = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then Color3.fromRGB(108, 94, 66) else Color3.fromRGB(232, 255, 146),
				ColorShift_Top = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then Color3.fromRGB(94, 100, 172) else Color3.fromRGB(85, 136, 167),
				ClockTime = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 11 else 12,
				GeographicLatitude = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 24 else 41.733,
				OutdoorAmbient = Color3.fromRGB(0, 0, 0),
				TimeOfDay = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then "11:00:00" else "12:00:00",
				Ambient = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then Color3.fromRGB(180, 180, 180) else Color3.fromRGB(170, 170, 170),
				EnvironmentDiffuseScale = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 1 else 1,
				EnvironmentSpecularScale = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 1 else 1,
				FogStart = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 20 else 20,
				FogColor = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then Color3.fromRGB(55, 56, 59) else Color3.fromRGB(45, 46, 49),
				BloomIntensity = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then 0.2 else 0.3,
				ColorCorrectionTintColor = Color3.fromRGB(255, 255, 255),
				BackPanelTextureColor = Color3.fromRGB(83, 80, 82),
				CloudsTextureColor = Color3.fromRGB(100, 101, 108),
				LargerShapesTextureColor = Color3.fromRGB(100, 101, 108),
				BasePlateColor = Color3.fromRGB(83, 80, 82)
			}
		}
	} do
		local AvatarSceneNewClone = AvatarSceneNew:Clone()
		AvatarSceneNewClone.Name = value.name
		AvatarSceneNewClone.Parent = self.scenesFolder
		
		if FFlagAXBackgroundCycloramaRendering then
			local AvatarCyclorama = AvatarSceneNewClone:FindFirstChild("AvatarCyclorama")
			
			if AvatarCyclorama then
				AvatarCyclorama:Destroy()
			end
		end
		local BlobShadow = AvatarSceneNewClone:FindFirstChild("BlobShadow")
		
		if BlobShadow then
			AvatarSceneNewClone.PrimaryPart = BlobShadow
			BlobShadow.CFrame = CFrame.new(0, 0, 0)
		end
		local Theme = value.theme
		local BackPanel = AvatarSceneNewClone:FindFirstChild("BackPanel")
		
		if BackPanel then
			BackPanel.Transparency = 1
			
			for _, Part in BackPanel:GetChildren() do
				if Part:IsA("BasePart") then
					Part.Color = Theme.BackPanelTextureColor
				else
					pcall(function()
						-- upvalues: Part (copy), Theme (copy)
						Part.Color3 = Theme.BackPanelTextureColor
					end)
				end
				Part.Transparency = 1
			end
		end
		local Clouds = AvatarSceneNewClone:FindFirstChild("Clouds")
		
		if Clouds then
			for _, Part1 in Clouds:GetChildren() do
				if Part1:IsA("BasePart") then
					Part1.Color = Theme.CloudsTextureColor
				else
					pcall(function()
						-- upvalues: Part1 (copy), Theme (copy)
						Part1.Color3 = Theme.CloudsTextureColor
					end)
				end
			end
		end
		local LargerShapes = AvatarSceneNewClone:FindFirstChild("LargerShapes")
		
		if LargerShapes then
			for _, Part2 in LargerShapes:GetChildren() do
				if Part2:IsA("BasePart") then
					Part2.Color = Theme.LargerShapesTextureColor
				else
					pcall(function()
						-- upvalues: Part2 (copy), Theme (copy)
						Part2.Color3 = Theme.LargerShapesTextureColor
					end)
				end
			end
		end
		local Baseplate = AvatarSceneNewClone:FindFirstChild("Baseplate")
		
		if Baseplate and Baseplate:IsA("BasePart") then
			Baseplate.Color = Theme.BasePlateColor
		end
		local ColorCorrect = Instance.new("ColorCorrectionEffect")
		local Bloom = Instance.new("BloomEffect")
		local Sky = Instance.new("Sky")
		Sky.CelestialBodiesShown = true
		Sky.StarCount = 3000
		Sky.SkyboxBk = Theme.SkyboxAssetLocation
		Sky.SkyboxDn = Theme.SkyboxAssetLocation
		Sky.SkyboxFt = Theme.SkyboxAssetLocation
		Sky.SkyboxLf = Theme.SkyboxAssetLocation
		Sky.SkyboxRt = Theme.SkyboxAssetLocation
		Sky.SkyboxUp = Theme.SkyboxAssetLocation
		Bloom.Enabled = Theme.BloomEnabled
		Bloom.Intensity = Theme.BloomIntensity
		Bloom.Size = Theme.BloomSize
		Bloom.Threshold = Theme.BloomThreshold
		ColorCorrect.Enabled = Theme.ColorCorrectionEnabled
		ColorCorrect.Brightness = Theme.ColorCorrectionBrightness
		ColorCorrect.Contrast = Theme.ColorCorrectionContrast
		ColorCorrect.Saturation = Theme.ColorCorrectionSaturation
		ColorCorrect.TintColor = Theme.ColorCorrectionTintColor
		local LightingObjects = Instance.new("Folder")
		LightingObjects.Name = "LightingObjects"
		LightingObjects.Parent = AvatarSceneNewClone
		ColorCorrect.Parent = LightingObjects
		Bloom.Parent = LightingObjects
		Sky.Parent = LightingObjects
		self:createLightingConfiguration(AvatarSceneNewClone)
		local LightingConfig = AvatarSceneNewClone:FindFirstChild("LightingConfig")
		
		if LightingConfig then
			for AttributeName, value1 in Theme do
				if value1 ~= nil and LightingConfig:GetAttribute(AttributeName) ~= nil then
					LightingConfig:SetAttribute(AttributeName, value1)
				end
			end
		end
	end
	AvatarSceneNew:Destroy()
end

function BackgroundSceneManager:start()
	-- upvalues: FFlagAXBackgroundCycloramaRendering (copy), FFlagAXBackgroundsCycloramaVR (copy), NotificationService (copy), SignalsModule (copy), PhotoboothStoreBridge (copy), FFlagEnableCoreContentTheme (copy), GetSceneOverridesStoreFunction (copy)
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
		self:moveOriginalLightingToStorage()
		self:pickScene()
		table.insert(self.connections, self.store.changed:connect(function(Value, p1)
			-- upvalues: self (copy), FFlagAXBackgroundCycloramaRendering (upval)
			local AvatarRoute = self.avatarRoute
			self:update(Value, p1, AvatarRoute, AvatarRoute)
			
			if FFlagAXBackgroundCycloramaRendering and self.cyclorama then
				self:updateActiveBackground(Value)
			end
		end))
		
		if FFlagAXBackgroundCycloramaRendering and self.cyclorama then
			self:updateActiveBackground(self.store:getState())
		end
		table.insert(self.connections, NotificationService:GetPropertyChangedSignal("SelectedTheme"):Connect(function()
			-- upvalues: self (copy)
			if self.changeSceneTask then
				task.cancel(self.changeSceneTask)
			end
			self.changeSceneTask = task.spawn(function()
				-- upvalues: self (upval)
				self:pickScene()
			end)
		end))
		table.insert(self.signals, SignalsModule.createEffect(function(p1)
			-- upvalues: PhotoboothStoreBridge (upval), self (copy)
			local Store = PhotoboothStoreBridge.getStore()
			
			if not Store then return end
			Store.getSelectedSceneId(p1)
			
			if self.changeSceneTask then
				task.cancel(self.changeSceneTask)
			end
			self.changeSceneTask = task.spawn(function()
				-- upvalues: self (upval)
				self:pickScene()
			end)
		end))
		
		if FFlagEnableCoreContentTheme then
			table.insert(self.connections, {
				disconnect = GetSceneOverridesStoreFunction().subscribe(function(_)
					-- upvalues: self (copy)
					self:applyParticleColorOverrides()
				end)
			})
		end
		self.ParticleEffectManager:start()
	end
end

function BackgroundSceneManager:stop()
	-- upvalues: FFlagAXBackgroundCycloramaRendering (copy), ReplicatedStorage (copy), FFlagAXBackgroundsCycloramaVR (copy)
	for _, connection in self.connections do
		connection:disconnect()
	end
	for _, signal in self.signals do
		signal()
	end
	if FFlagAXBackgroundCycloramaRendering and self.cyclorama then
		if self.cycloramaFront then
			self.cycloramaFront.Transparency = 1
		end
		if self.cycloramaBack then
			self.cycloramaBack.Transparency = 1
		end
		self.cyclorama.Parent = ReplicatedStorage
		local CycloramaState = self.cycloramaState
		
		if CycloramaState then
			CycloramaState.activeToken += 1
			CycloramaState.currentAssetId = nil
		end
	end
	if FFlagAXBackgroundsCycloramaVR and self.isSpatial then
		self.connections = {}
		self.signals = {}
		
		return
	end
	if self.currentScene then
		self.currentScene.Parent = self.scenesFolder
	end
	self:restoreOriginalLighting()
	self:clearManagedMaterialVariants()
	
	if self.changeSceneTask then
		task.cancel(self.changeSceneTask)
		self.changeSceneTask = nil
	end
	self.connections = {}
	self.signals = {}
	self.ParticleEffectManager:stop()
end

function BackgroundSceneManager:onDestroy()
	-- upvalues: FFlagAXBackgroundsCycloramaVR (copy)
	self:stop()
	
	if not FFlagAXBackgroundsCycloramaVR or not self.isSpatial then
		self.ParticleEffectManager:onDestroy()
		
		return
	end
end

function BackgroundSceneManager:update(_, _, AvatarRoute, _)
	-- upvalues: FFlagAXBackgroundsCycloramaVR (copy)
	if not FFlagAXBackgroundsCycloramaVR or not self.isSpatial then
		self.ParticleEffectManager:setAvatarRoute(AvatarRoute)
		
		return
	end
end

function BackgroundSceneManager:updateAvatarRoute(AvatarRoute, p1)
	self.avatarRoute = AvatarRoute
	local State = self.store:getState()
	self:update(State, State, AvatarRoute, p1)
end

return BackgroundSceneManager