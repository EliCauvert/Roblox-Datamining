local corePackagesService = game:GetService("CorePackages")
local curvedSurfaceGuisEnabledEngineFeature = game:GetEngineFeature("CurvedSurfaceGuisEnabled")
local coreGuiService = game:GetService("CoreGui")
local constantsModule = require(script.Parent.Constants)
local spatialUIType = constantsModule.SpatialUIType
local object = require(corePackagesService.Packages.LuauPolyfill).Object
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

local function createPanelPart(p0)
	local part = Instance.new("Part")
	part.Parent = workspace.CurrentCamera
	part.Name = p0.name .. "_Part"
	part.CFrame = p0.cframe
	part.CastShadow = false
	part.Size = Vector3.new(p0.partSize.X, p0.partSize.Y, 0.002)
	part.Transparency = if p0.transparency then p0.transparency else 1
	part.Color = Color3.new(0, 0, 0)
	part.CanCollide = false
	part.CanTouch = false
	part.Anchored = true
	
	return part
end

local function createPanel(p1)
	-- upvalues: object (ref), t (ref), spatialUIType (ref), t_2 (ref), createPanelPart (ref), coreGuiService (ref), curvedSurfaceGuisEnabledEngineFeature (ref), t_1 (ref)
	local var11 = object.assign({}, t, p1)
	
	if var11.type == spatialUIType.SpatialUIPartOnly then
		return {
			type = var11.type,
			panelObject = createPanelPart(object.assign({}, t_2, var11.spatialPanelProps))
		}
	elseif var11.type == spatialUIType.SpatialUI then
		local var12 = object.assign({}, t_2, var11.spatialPanelProps)
		local var13 = createPanelPart(var12)
		local surfaceGui = Instance.new("SurfaceGui", coreGuiService)
		surfaceGui.Name = var12.name .. "_SurfaceGui"
		surfaceGui.Enabled = not var12.hidden
		surfaceGui.CanvasSize = var12.virtualScreenSize
		surfaceGui.AlwaysOnTop = var12.alwaysOnTop
		surfaceGui.Shape = if curvedSurfaceGuisEnabledEngineFeature and var12.curvature ~= 0 then Enum.SurfaceGuiShape.CurvedHorizontally else Enum.SurfaceGuiShape.Flat
		surfaceGui.HorizontalCurvature = if curvedSurfaceGuisEnabledEngineFeature then var12.curvature else 0
		surfaceGui.Active = true
		surfaceGui.Adornee = var13
		surfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		surfaceGui.LightInfluence = 0
		surfaceGui.ZOffset = 0
		surfaceGui.Face = Enum.NormalId.Back
		
		return { type = var11.type, panelObject = surfaceGui }
	elseif var11.type ~= spatialUIType.ScreenUI then
		print("Invalid panel type: " .. tostring(var11.type))
		
		return nil
	end
	local var15 = object.assign({}, t_1, var11.screenGuiProps)
	local screenGui = Instance.new("ScreenGui", coreGuiService)
	screenGui.Name = var15.Name
	screenGui.ResetOnSpawn = var15.ResetOnSpawn
	screenGui.DisplayOrder = var15.DisplayOrder
	
	if var15.ZIndexBehavior then
		screenGui.ZIndexBehavior = var15.ZIndexBehavior
	end
	return { type = var11.type, panelObject = screenGui }
end

return function(p2)
	-- upvalues: VRService (ref), createPanel (ref), constantsModule (ref), spatialUIType (ref)
	if VRService.VREnabled then
		local var17 = createPanel(constantsModule.COMPAT_PANEL_PROPS_MAP[p2.panelType])
		
		return if var17 == nil then nil else {
			headScale = 1,
			panelObject = var17.panelObject,
			uiType = var17.type,
			panelType = p2.panelType,
			panelPositionProps = constantsModule.SPATIAL_PANEL_POSITION_PROPS_MAP[p2.panelType]
		}
	end
	local var18 = createPanel({
		type = spatialUIType.ScreenUI,
		screenGuiProps = p2.screenGuiProps
	})
	
	return if var18 == nil then nil else {
		panelPositionProps = nil,
		panelObject = var18.panelObject,
		uiType = var18.type,
		panelType = p2.panelType
	}
end