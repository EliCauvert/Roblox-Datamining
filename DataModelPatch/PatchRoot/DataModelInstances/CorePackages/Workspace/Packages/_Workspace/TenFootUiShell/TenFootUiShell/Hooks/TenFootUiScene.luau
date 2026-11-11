local Lighting = game:GetService("Lighting")
local TenFootUiShell = script:FindFirstAncestor("TenFootUiShell")
local ConstantsModule = require(TenFootUiShell.Constants)
local ConstantsModule1 = require(TenFootUiShell.ReactNavigationExtend.Views.Constants)
local Parent = TenFootUiShell.Parent
local SceneManagementModule = require(Parent.SceneManagement)
local Lighting1 = SceneManagementModule.Lighting
local BackgroundScene = SceneManagementModule.BackgroundScene
local OtterModule = require(Parent.Otter)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableCoreContentTheme = SharedFlagsModule.FFlagEnableCoreContentTheme
local FFlagEnableCoreContentThemeConsole = SharedFlagsModule.FFlagEnableCoreContentThemeConsole
local FFlagUseDefaultOverrideColorsFor10ftModels = SharedFlagsModule.FFlagUseDefaultOverrideColorsFor10ftModels
local GetSceneOverridesStoreFunction = require(Parent.Style).getSceneOverridesStore
local BACKGROUNDMODELNAME = ConstantsModule.BACKGROUND_MODEL_NAME
local TenFootSkyboxBlockerSizeX = game:DefineFastInt("TenFootSkyboxBlockerSizeX", 2048)
local TenFootSkyboxBlockerSizeY = game:DefineFastInt("TenFootSkyboxBlockerSizeY", 2048)
local TenFootSkyboxBlockerSizeZ = game:DefineFastInt("TenFootSkyboxBlockerSizeZ", 2)
local TenFootSkyboxBlockerPositionX = game:DefineFastInt("TenFootSkyboxBlockerPositionX", 0)
local TenFootSkyboxBlockerPositionY = game:DefineFastInt("TenFootSkyboxBlockerPositionY", 27)
local TenFootSkyboxBlockerPositionZ = game:DefineFastInt("TenFootSkyboxBlockerPositionZ", -300)
local _Color3 = Color3.fromRGB(66, 63, 65)
local _Color3_1 = Color3.fromRGB(90, 91, 98)
local _Color3_2 = Color3.fromRGB(55, 56, 59)
local config = {
	BackgroundConfigs = {
		PositionOffset = vector.create(10, 0, 0),
		RotationOffset = vector.create(0, 50, 0),
		BackgroundModelName = BACKGROUNDMODELNAME,
		DistanceToCamera = ConstantsModule1.DEFAULT_BACKGROUND_DISTANCE_TO_CAMERA
	},
	CameraConfigs = {
		FieldOfView = 50,
		Position = ConstantsModule.CAMERA_POSITION
	}
}
local config1 = {
	positionX = OtterModule.createSingleMotor(0),
	positionZ = OtterModule.createSingleMotor(0)
}
local Tbl = {}
local SubscribeResult: (() -> ())? = nil

local function shutDownMotors()
	-- upvalues: Tbl (ref)
	for _, value in Tbl do
		value()
	end
	table.clear(Tbl)
end

local function getOrCreateSkyboxBlocker(Parent)
	-- upvalues: TenFootSkyboxBlockerSizeX (copy), TenFootSkyboxBlockerSizeY (copy), TenFootSkyboxBlockerSizeZ (copy), TenFootSkyboxBlockerPositionX (copy), TenFootSkyboxBlockerPositionY (copy), TenFootSkyboxBlockerPositionZ (copy)
	local SkyboxBlocker = Parent:FindFirstChild("SkyboxBlocker")
	
	if SkyboxBlocker and SkyboxBlocker:IsA("BasePart") then
		return SkyboxBlocker
	else
		local SkyboxBlocker1 = Instance.new("Part")
		SkyboxBlocker1.Name = "SkyboxBlocker"
		SkyboxBlocker1.Material = Enum.Material.SmoothPlastic
		SkyboxBlocker1.Anchored = true
		SkyboxBlocker1.CanCollide = false
		SkyboxBlocker1.CanTouch = false
		SkyboxBlocker1.CanQuery = false
		SkyboxBlocker1.CastShadow = false
		SkyboxBlocker1.Size = Vector3.new(TenFootSkyboxBlockerSizeX, TenFootSkyboxBlockerSizeY, TenFootSkyboxBlockerSizeZ)
		SkyboxBlocker1.Position = Vector3.new(TenFootSkyboxBlockerPositionX, TenFootSkyboxBlockerPositionY, TenFootSkyboxBlockerPositionZ)
		SkyboxBlocker1.Transparency = 1
		SkyboxBlocker1.Parent = Parent
		
		return SkyboxBlocker1
	end
end

local function applySceneOverrides(Object, SceneOverrides)
	-- upvalues: FFlagUseDefaultOverrideColorsFor10ftModels (copy), _Color3 (copy), _Color3_1 (copy), FFlagEnableCoreContentTheme (copy), Lighting (copy), _Color3_2 (copy)
	local SkyboxBlocker = Object:FindFirstChild("SkyboxBlocker")
	
	if not SceneOverrides then
		if SkyboxBlocker and SkyboxBlocker:IsA("BasePart") then
			SkyboxBlocker.Transparency = 1
		end
		if not FFlagUseDefaultOverrideColorsFor10ftModels then return end
	end
	if (not FFlagUseDefaultOverrideColorsFor10ftModels or SceneOverrides) and (SkyboxBlocker and SkyboxBlocker:IsA("BasePart")) then
		SkyboxBlocker.Color = SceneOverrides.SkyboxBlockerColor
		SkyboxBlocker.Transparency = SceneOverrides.SkyboxBlockerTransparency
	end
	local Baseplate = Object:FindFirstChild("Baseplate")
	
	if Baseplate and Baseplate:IsA("BasePart") then
		Baseplate.Color = if FFlagUseDefaultOverrideColorsFor10ftModels and not SceneOverrides then _Color3 else SceneOverrides.Baseplate
	end
	local Clouds = Object:FindFirstChild("Clouds")
	
	if Clouds and Clouds:IsA("BasePart") then
		local Color = if FFlagUseDefaultOverrideColorsFor10ftModels and not SceneOverrides then _Color3_1 else SceneOverrides.Clouds
		Clouds.Color = Color
		
		for _, Texture in Clouds:GetChildren() do
			if Texture:IsA("Texture") then
				Texture.Color3 = Color
			end
		end
	end
	local LargerShapes = Object:FindFirstChild("LargerShapes")
	
	if LargerShapes and LargerShapes:IsA("BasePart") then
		local Color = if FFlagUseDefaultOverrideColorsFor10ftModels and not SceneOverrides then _Color3_1 else SceneOverrides.LargerShapes
		LargerShapes.Color = Color
		
		for _, Texture1 in LargerShapes:GetChildren() do
			if Texture1:IsA("Texture") then
				Texture1.Color3 = Color
			end
		end
	end
	if FFlagEnableCoreContentTheme then
		Lighting.FogColor = if FFlagUseDefaultOverrideColorsFor10ftModels and not SceneOverrides then _Color3_2 else SceneOverrides.FogColor
	end
end

local function _()
	-- upvalues: SubscribeResult (ref)
	if SubscribeResult then
		SubscribeResult()
		SubscribeResult = nil
	end
end

local function startUpSceneOverrides(Parent)
	-- upvalues: SubscribeResult (ref), getOrCreateSkyboxBlocker (copy), GetSceneOverridesStoreFunction (copy), applySceneOverrides (copy)
	if SubscribeResult then
		SubscribeResult()
		SubscribeResult = nil
	end
	getOrCreateSkyboxBlocker(Parent)
	local SceneOverridesStore = GetSceneOverridesStoreFunction()
	applySceneOverrides(Parent, (SceneOverridesStore.getSceneOverrides()))
	SubscribeResult = SceneOverridesStore.subscribe(function(p1)
		-- upvalues: applySceneOverrides (upval), Parent (copy)
		applySceneOverrides(Parent, p1)
	end)
end

local function startUpMotors(p1)
	-- upvalues: Tbl (ref), config1 (ref), BackgroundScene (copy), BACKGROUNDMODELNAME (copy)
	for _, value in Tbl do
		value()
	end
	table.clear(Tbl)
	local Position = p1:GetPivot().Position
	Tbl = {
		config1.positionX:onStep(function(p2)
			-- upvalues: BackgroundScene (upval), BACKGROUNDMODELNAME (upval), Position (copy)
			BackgroundScene.updateXPosition(BACKGROUNDMODELNAME, Position.X + p2)
		end),
		config1.positionZ:onStep(function(p2)
			-- upvalues: BackgroundScene (upval), BACKGROUNDMODELNAME (upval), Position (copy)
			BackgroundScene.updateZPosition(BACKGROUNDMODELNAME, Position.Z + p2)
		end)
	}
end

local function deinitialize()
	-- upvalues: Tbl (ref), SubscribeResult (ref)
	for _, value in Tbl do
		value()
	end
	table.clear(Tbl)
	
	if SubscribeResult then
		SubscribeResult()
		SubscribeResult = nil
	end
end

return {
	initialize = function(p2)
		-- upvalues: Lighting1 (copy), config1 (ref), BackgroundScene (copy), config (copy), startUpMotors (copy), FFlagEnableCoreContentTheme (copy), FFlagEnableCoreContentThemeConsole (copy), startUpSceneOverrides (copy)
		Lighting1.configure()
		config1 = p2 or config1
		local InitializeResult, InitializeResult2 = BackgroundScene.initialize(config)
		startUpMotors(InitializeResult)
		
		if FFlagEnableCoreContentTheme and FFlagEnableCoreContentThemeConsole then
			startUpSceneOverrides(InitializeResult)
		end
		return InitializeResult, InitializeResult2
	end,
	deinitialize = if FFlagEnableCoreContentTheme and FFlagEnableCoreContentThemeConsole then deinitialize else shutDownMotors,
	updateXPosition = function(BACKGROUNDMODELNAME)
		-- upvalues: config1 (ref), OtterModule (copy), ConstantsModule1 (copy)
		config1.positionX:setGoal(OtterModule.spring(BACKGROUNDMODELNAME, ConstantsModule1.X_DIRECTION_ANIMATION_SPRING_CONFIG))
	end,
	updateZPosition = function(BACKGROUNDMODELNAME)
		-- upvalues: config1 (ref), OtterModule (copy), ConstantsModule1 (copy)
		config1.positionZ:setGoal(OtterModule.spring(BACKGROUNDMODELNAME, ConstantsModule1.Z_DIRECTION_ANIMATION_SPRING_CONFIG))
	end,
	getBackgroundInstance = function()
		-- upvalues: BackgroundScene (copy), BACKGROUNDMODELNAME (copy)
		return BackgroundScene.getBackgroundInstance(BACKGROUNDMODELNAME)
	end
}