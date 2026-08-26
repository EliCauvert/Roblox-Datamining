local runService = game:GetService("RunService")
local parent = script.Parent
local constantsModule = require(parent.Constants)
local usePanel3DRenderStepModule = require(parent.usePanel3DRenderStep)
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local roactModule = require(parent_2.Roact)
local object = require(parent_2.LuauPolyfill).Object
local var1 = require(parent_1.Core.Utility.GetEngineFeatureSafe)("CurvedSurfaceGuisEnabled")
local t = {
	lerp = false,
	tilt = 0,
	faceCamera = false,
	panelName = "PanelBase",
	alwaysOnTop = true,
	hidden = false,
	curvature = 1,
	zOffset = 0,
	connectPanelManagerFunction = nil,
	partRef = nil,
	partSize = Vector2.new(10, 10),
	virtualScreenSize = Vector2.new(10, 10),
	offset = CFrame.new(0, 0, 0),
	anchoring = constantsModule.AnchoringTypes.World,
	movementUpdateEvent = runService.RenderStepped,
	vrService = game:GetService("VRService"),
	parent = workspace
}

return function(p1)
	-- upvalues: object (ref), t (ref), reactModule (ref), usePanel3DRenderStepModule (ref), constantsModule (ref), roactModule (ref), var1 (ref)
	local var2 = object.assign({}, t, p1)
	local partRef = var2.partRef or reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	usePanel3DRenderStepModule(var2, partRef)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), constantsModule (copy), var3 (ref)
		if var2.anchoring ~= constantsModule.AnchoringTypes.PanelManaged then
			return function() end
		elseif var2.connectPanelManagerFunction == nil then
			return function() end
		elseif var3 == nil or not var2.connectPanelManagerFunction then
			return function() end
		end
		var2.connectPanelManagerFunction(var3)
		
		return function()
			-- upvalues: var2 (copy)
			var2.connectPanelManagerFunction(nil)
		end
	end, { var3, var2.anchoring, var2.connectPanelManagerFunction })
	
	return reactModule.createElement("Folder", { Archivable = false, ref = var4 }, {
		WorkspacePortal = reactModule.createElement(roactModule.Portal, { target = var2.parent }, {
			GUIPart = if var2.hidden then nil else reactModule.createElement("Part", {
				Anchored = true,
				Transparency = 1,
				CanCollide = false,
				CanTouch = false,
				Name = var2.panelName .. "_Part",
				ref = partRef,
				CFrame = var2.offset * CFrame.Angles(math.rad(var2.tilt), 0, 0),
				Size = Vector3.new(var2.partSize.X, var2.partSize.Y, 0.05),
				Color = Color3.new(0, 0, 0)
			})
		}),
		AppUI = reactModule.createElement("SurfaceGui", {
			Active = true,
			LightInfluence = 0,
			Name = var2.panelName .. "_SurfaceGui",
			ref = var3,
			Adornee = partRef,
			Enabled = not var2.hidden,
			CanvasSize = var2.virtualScreenSize,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			children = var2.children,
			AlwaysOnTop = var2.alwaysOnTop,
			Shape = if var1 and var2.curvature ~= 0 then Enum.SurfaceGuiShape.CurvedHorizontally else nil,
			HorizontalCurvature = if var1 then var2.curvature else nil,
			ZOffset = var2.zOffset
		})
	})
end