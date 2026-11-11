local CurvedSurfaceGuisEnabledEngineFeature = game:GetEngineFeature("CurvedSurfaceGuisEnabled")
local CoreGui = game:GetService("CoreGui")
local ConstantsModule = require(script.Parent.Constants)
local SpatialUIType = ConstantsModule.SpatialUIType
local Object = require(game:GetService("CorePackages").Packages.LuauPolyfill).Object
local VRService = game:GetService("VRService")
local config = {
	spatialPanelProps = nil,
	screenGuiProps = nil,
	type = SpatialUIType.ScreenUI
}
local config1 = {
	Name = "ScreenGui",
	ResetOnSpawn = false,
	DisplayOrder = 0,
	ZIndexBehavior = nil
}
local config2 = {
	name = "",
	alwaysOnTop = true,
	hidden = false,
	curvature = 1,
	transparency = 1,
	partSize = ConstantsModule.DEFAULT_VR_PANEL_SIZE,
	virtualScreenSize = ConstantsModule.DEFAULT_VR_PANEL_SIZE * ConstantsModule.VR_PANEL_RESOLUTION_MULTIPLIER,
	cframe = CFrame.new(0, 0, 0)
}

local function createPanelPart(AssignResult)
	local Part = Instance.new("Part")
	Part.Parent = workspace.CurrentCamera
	Part.Name = AssignResult.name .. "_Part"
	Part.CFrame = AssignResult.cframe
	Part.CastShadow = false
	Part.Size = Vector3.new(AssignResult.partSize.X, AssignResult.partSize.Y, 0.002)
	Part.Transparency = if AssignResult.transparency then AssignResult.transparency else 1
	Part.Color = Color3.new(0, 0, 0)
	Part.CanCollide = false
	Part.CanTouch = false
	Part.Anchored = true
	
	return Part
end

local function createPanel(COMPATPANELPROPS)
	-- upvalues: Object (copy), config (copy), SpatialUIType (copy), config2 (copy), createPanelPart (copy), CoreGui (copy), CurvedSurfaceGuisEnabledEngineFeature (copy), config1 (copy)
	local AssignResult = Object.assign({}, config, COMPATPANELPROPS)
	
	if AssignResult.type == SpatialUIType.SpatialUIPartOnly then
		return {
			type = AssignResult.type,
			panelObject = createPanelPart((Object.assign({}, config2, AssignResult.spatialPanelProps)))
		}
	end
	if AssignResult.type == SpatialUIType.SpatialUI then
		local AssignResult1 = Object.assign({}, config2, AssignResult.spatialPanelProps)
		local PanelPart = createPanelPart(AssignResult1)
		local SurfaceGui = Instance.new("SurfaceGui", CoreGui)
		SurfaceGui.Name = AssignResult1.name .. "_SurfaceGui"
		SurfaceGui.Enabled = not AssignResult1.hidden
		SurfaceGui.CanvasSize = AssignResult1.virtualScreenSize
		SurfaceGui.AlwaysOnTop = AssignResult1.alwaysOnTop
		SurfaceGui.Shape = if CurvedSurfaceGuisEnabledEngineFeature and AssignResult1.curvature ~= 0 then Enum.SurfaceGuiShape.CurvedHorizontally else Enum.SurfaceGuiShape.Flat
		SurfaceGui.HorizontalCurvature = if CurvedSurfaceGuisEnabledEngineFeature then AssignResult1.curvature else 0
		SurfaceGui.Active = true
		SurfaceGui.Adornee = PanelPart
		SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		SurfaceGui.LightInfluence = 0
		SurfaceGui.ZOffset = 0
		SurfaceGui.Face = Enum.NormalId.Back
		
		return { type = AssignResult.type, panelObject = SurfaceGui }
	else
		if AssignResult.type ~= SpatialUIType.ScreenUI then
			print("Invalid panel type: " .. tostring(AssignResult.type))
			
			return nil
		end
		local AssignResult2 = Object.assign({}, config1, AssignResult.screenGuiProps)
		local ScreenGui = Instance.new("ScreenGui", CoreGui)
		ScreenGui.Name = AssignResult2.Name
		ScreenGui.ResetOnSpawn = AssignResult2.ResetOnSpawn
		ScreenGui.DisplayOrder = AssignResult2.DisplayOrder
		
		if AssignResult2.ZIndexBehavior then
			ScreenGui.ZIndexBehavior = AssignResult2.ZIndexBehavior
		end
		return { type = AssignResult.type, panelObject = ScreenGui }
	end
end

return function(p1)
	-- upvalues: VRService (copy), createPanel (copy), ConstantsModule (copy), SpatialUIType (copy)
	if VRService.VREnabled then
		local Panel = createPanel(ConstantsModule.COMPAT_PANEL_PROPS_MAP[p1.panelType])
		
		return if Panel == nil then nil else {
			headScale = 1,
			panelObject = Panel.panelObject,
			uiType = Panel.type,
			panelType = p1.panelType,
			panelPositionProps = ConstantsModule.SPATIAL_PANEL_POSITION_PROPS_MAP[p1.panelType]
		}
	else
		local Panel = createPanel({
			type = SpatialUIType.ScreenUI,
			screenGuiProps = p1.screenGuiProps
		})
		
		return if Panel == nil then nil else {
			panelPositionProps = nil,
			panelObject = Panel.panelObject,
			uiType = Panel.type,
			panelType = p1.panelType
		}
	end
end