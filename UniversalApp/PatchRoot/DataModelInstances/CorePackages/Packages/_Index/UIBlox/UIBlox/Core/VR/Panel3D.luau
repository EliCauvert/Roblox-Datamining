local Parent = script.Parent
local ConstantsModule = require(Parent.Constants)
local UsePanel3DRenderStepModule = require(Parent.usePanel3DRenderStep)
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local ReactModule = require(Parent2.React)
local RoactModule = require(Parent2.Roact)
local Object = require(Parent2.LuauPolyfill).Object
local CurvedSurfaceGuisEnabled = require(Parent1.Core.Utility.GetEngineFeatureSafe)("CurvedSurfaceGuisEnabled")
local config = {
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
	anchoring = ConstantsModule.AnchoringTypes.World,
	movementUpdateEvent = game:GetService("RunService").RenderStepped,
	vrService = game:GetService("VRService"),
	parent = workspace
}

return function(p1) --[[ Line: 43 | Named "Panel3D" ]]
	-- upvalues: Object (copy), config (copy), ReactModule (copy), UsePanel3DRenderStepModule (copy), ConstantsModule (copy), RoactModule (copy), CurvedSurfaceGuisEnabled (copy)
	local AssignResult = Object.assign({}, config, p1)
	local PartRef = AssignResult.partRef or ReactModule.useRef(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	UsePanel3DRenderStepModule(AssignResult, PartRef)
	ReactModule.useEffect(function() --[[ Line: 51 ]]
		-- upvalues: AssignResult (copy), ConstantsModule (upval), UseRefResult (copy)
		if AssignResult.anchoring ~= ConstantsModule.AnchoringTypes.PanelManaged then
			return function() --[[ Line: 53 ]] end
		elseif AssignResult.connectPanelManagerFunction == nil then
			return function() --[[ Line: 57 ]] end
		elseif UseRefResult == nil or not AssignResult.connectPanelManagerFunction then
			return function() --[[ Line: 68 ]] end
		else
			AssignResult.connectPanelManagerFunction(UseRefResult)
			
			return function() --[[ Line: 63 ]]
				-- upvalues: AssignResult (upval)
				AssignResult.connectPanelManagerFunction(nil)
			end
		end
	end, {
		UseRefResult,
		AssignResult.anchoring,
		AssignResult.connectPanelManagerFunction
	})
	
	return ReactModule.createElement("Folder", { Archivable = false, ref = UseRefResult1 }, {
		WorkspacePortal = ReactModule.createElement(RoactModule.Portal, { target = AssignResult.parent }, {
			GUIPart = if AssignResult.hidden then nil else ReactModule.createElement("Part", {
				Anchored = true,
				Transparency = 1,
				CanCollide = false,
				CanTouch = false,
				Name = AssignResult.panelName .. "_Part",
				ref = PartRef,
				CFrame = AssignResult.offset * CFrame.Angles(math.rad(AssignResult.tilt), 0, 0),
				Size = Vector3.new(AssignResult.partSize.X, AssignResult.partSize.Y, 0.05),
				Color = Color3.new(0, 0, 0)
			})
		}),
		AppUI = ReactModule.createElement("SurfaceGui", {
			Active = true,
			LightInfluence = 0,
			Name = AssignResult.panelName .. "_SurfaceGui",
			ref = UseRefResult,
			Adornee = PartRef,
			Enabled = not AssignResult.hidden,
			CanvasSize = AssignResult.virtualScreenSize,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			children = AssignResult.children,
			AlwaysOnTop = AssignResult.alwaysOnTop,
			Shape = if CurvedSurfaceGuisEnabled and AssignResult.curvature ~= 0 then Enum.SurfaceGuiShape.CurvedHorizontally else nil,
			HorizontalCurvature = if CurvedSurfaceGuisEnabled then AssignResult.curvature else nil,
			ZOffset = AssignResult.zOffset
		})
	})
end