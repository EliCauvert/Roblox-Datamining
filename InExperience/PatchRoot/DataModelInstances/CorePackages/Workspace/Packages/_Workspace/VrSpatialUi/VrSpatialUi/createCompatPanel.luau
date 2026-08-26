local vrSpatialUi = script:FindFirstAncestor("VrSpatialUi")
local parent = vrSpatialUi.Parent
local coreGuiService = game:GetService("CoreGui")
local curvedSurfaceGuisEnabledEngineFeature = game:GetEngineFeature("CurvedSurfaceGuisEnabled")
local constantsModule = require(vrSpatialUi.Constants)
local spatialUIType = constantsModule.SpatialUIType
local object = require(parent.LuauPolyfill).Object
local VRService = game:GetService("VRService")
local t = {
	spatialPanelProps = nil,
	screenGuiProps = nil,
	type = spatialUIType.ScreenUI
}
local t_1 = {
	Name = "ScreenGui",
	ResetOnSpawn = false,
	DisplayOrder = 0,
	ZIndexBehavior = nil
}
local t_2 = {
	name = "",
	alwaysOnTop = true,
	hidden = false,
	curvature = 1,
	transparency = 1,
	partSize = constantsModule.DEFAULT_VR_PANEL_SIZE,
	virtualScreenSize = constantsModule.DEFAULT_VR_PANEL_SIZE * constantsModule.VR_PANEL_RESOLUTION_MULTIPLIER,
	cframe = CFrame.new(0, 0, 0)
}

local function createPanelPart(p1)
	local part = Instance.new("Part")
	part.Name = p1.name .. "_Part"
	part.CFrame = p1.cframe
	part.CastShadow = false
	part.Size = Vector3.new(p1.partSize.X, p1.partSize.Y, 0.002)
	part.Transparency = if p1.transparency then p1.transparency else 1
	part.Color = Color3.new(0, 0, 0)
	part.CanCollide = false
	part.CanTouch = false
	part.Anchored = true
	part.Parent = workspace
	
	return part
end

local function createPanel(p1)
	-- upvalues: object (ref), t (ref), spatialUIType (ref), t_2 (ref), createPanelPart (ref), coreGuiService (ref), curvedSurfaceGuisEnabledEngineFeature (ref), t_1 (ref)
	local var1 = object.assign({}, t, p1)
	
	if var1.type == spatialUIType.SpatialUIPartOnly then
		return {
			type = var1.type,
			panelObject = createPanelPart(object.assign({}, t_2, var1.spatialPanelProps))
		}
	elseif var1.type == spatialUIType.SpatialUI then
		local var2 = object.assign({}, t_2, var1.spatialPanelProps)
		local var3 = createPanelPart(var2)
		local surfaceGui = Instance.new("SurfaceGui")
		surfaceGui.Parent = coreGuiService
		surfaceGui.Name = var2.name .. "_SurfaceGui"
		surfaceGui.Enabled = not var2.hidden
		surfaceGui.CanvasSize = var2.virtualScreenSize
		surfaceGui.AlwaysOnTop = var2.alwaysOnTop
		surfaceGui.Shape = if curvedSurfaceGuisEnabledEngineFeature and var2.curvature ~= 0 then Enum.SurfaceGuiShape.CurvedHorizontally else Enum.SurfaceGuiShape.Flat
		surfaceGui.HorizontalCurvature = if curvedSurfaceGuisEnabledEngineFeature then var2.curvature else 0
		surfaceGui.Active = true
		surfaceGui.Adornee = var3
		surfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		surfaceGui.LightInfluence = 0
		surfaceGui.ZOffset = 0
		surfaceGui.Face = Enum.NormalId.Back
		
		return { type = var1.type, panelObject = surfaceGui }
	elseif var1.type ~= spatialUIType.ScreenUI then
		print("Invalid panel type: " .. tostring(var1.type))
		
		return nil
	end
	local var4 = object.assign({}, t_1, var1.screenGuiProps)
	local screenGui = Instance.new("ScreenGui")
	screenGui.Parent = coreGuiService
	screenGui.Name = var4.Name
	screenGui.ResetOnSpawn = var4.ResetOnSpawn
	screenGui.DisplayOrder = var4.DisplayOrder
	
	if var4.ZIndexBehavior then
		screenGui.ZIndexBehavior = var4.ZIndexBehavior
	end
	return { type = var1.type, panelObject = screenGui }
end

return function(p1)
	-- upvalues: VRService (ref), createPanel (ref), constantsModule (ref), spatialUIType (ref)
	if VRService.VREnabled then
		local var1 = createPanel(constantsModule.COMPAT_PANEL_PROPS_MAP[p1.panelType])
		
		return if var1 == nil then nil else {
			headScale = 1,
			panelObject = var1.panelObject,
			uiType = var1.type,
			panelType = p1.panelType,
			panelPositionProps = constantsModule.SPATIAL_PANEL_POSITION_PROPS_MAP[p1.panelType]
		}
	end
	local var2 = createPanel({
		type = spatialUIType.ScreenUI,
		screenGuiProps = p1.screenGuiProps
	})
	
	return if var2 == nil then nil else {
		panelPositionProps = nil,
		panelObject = var2.panelObject,
		uiType = var2.type,
		panelType = p1.panelType
	}
end