-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:04 2026 Pacific Standard Time.

local runService = game:GetService("RunService")
local parent = script.Parent
local constantsModule = require(parent.Constants)
local usePanel3DRenderStepModule = require(parent.usePanel3DRenderStep)
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local roactModule = require(parent_2.Roact)
local object = require(parent_2.LuauPolyfill).Object
local var5 = require(parent_1.Core.Utility.GetEngineFeatureSafe)("CurvedSurfaceGuisEnabled")
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

return function(p0) --[[ line: 43 | named "Panel3D" ]]
	-- upvalues: object (ref), t (ref), reactModule (ref), usePanel3DRenderStepModule (ref), constantsModule (ref), roactModule (ref), var5 (ref)
	local var7 = object.assign({}, t, p0)
	local partRef = var7.partRef or reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	usePanel3DRenderStepModule(var7, partRef)
	reactModule.useEffect(function() --[[ line: 51 ]]
		-- upvalues: var7 (ref), constantsModule (copy), var9 (ref)
		if var7.anchoring ~= constantsModule.AnchoringTypes.PanelManaged then
			return function() --[[ line: 53 ]] end
		elseif var7.connectPanelManagerFunction == nil then
			return function() --[[ line: 57 ]] end
		elseif var9 == nil or not var7.connectPanelManagerFunction then
			return function() --[[ line: 68 ]] end
		end
		var7.connectPanelManagerFunction(var9)
		
		return function() --[[ line: 63 ]]
			-- upvalues: var7 (copy)
			var7.connectPanelManagerFunction(nil)
		end
	end, { var9, var7.anchoring, var7.connectPanelManagerFunction })
	
	return reactModule.createElement("Folder", { Archivable = false, ref = var10 }, {
		WorkspacePortal = reactModule.createElement(roactModule.Portal, { target = var7.parent }, {
			GUIPart = if var7.hidden then nil else reactModule.createElement("Part", {
				Anchored = true,
				Transparency = 1,
				CanCollide = false,
				CanTouch = false,
				Name = var7.panelName .. "_Part",
				ref = partRef,
				CFrame = var7.offset * CFrame.Angles(math.rad(var7.tilt), 0, 0),
				Size = Vector3.new(var7.partSize.X, var7.partSize.Y, 0.05),
				Color = Color3.new(0, 0, 0)
			})
		}),
		AppUI = reactModule.createElement("SurfaceGui", {
			Active = true,
			LightInfluence = 0,
			Name = var7.panelName .. "_SurfaceGui",
			ref = var9,
			Adornee = partRef,
			Enabled = not var7.hidden,
			CanvasSize = var7.virtualScreenSize,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			children = var7.children,
			AlwaysOnTop = var7.alwaysOnTop,
			Shape = if var5 and var7.curvature ~= 0 then Enum.SurfaceGuiShape.CurvedHorizontally else nil,
			HorizontalCurvature = if var5 then var7.curvature else nil,
			ZOffset = var7.zOffset
		})
	})
end