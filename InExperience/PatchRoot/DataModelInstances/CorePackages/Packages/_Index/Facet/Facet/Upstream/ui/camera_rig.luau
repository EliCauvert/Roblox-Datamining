local _ = require("./types")
local _ = require("./camera_rig_types")
local _ = require("./control_types")
local GestureServiceModule = require("./gesture_service")
local DragSessionModule = require("./drag_session")
local MotionModule = require("./motion")
local _ = require("../vendor/compose/core")

return function(p1, p2)
	-- upvalues: MotionModule (copy), GestureServiceModule (copy), DragSessionModule (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local TypesVector2 = p1.types.Vector2
	local TypesVector3 = p1.types.Vector3
	local TypesCFrame = p1.types.CFrame
	local TypesEnum = p1.types.Enum
	local ForValueResult = MotionModule.forValue(p1, TypesVector3.zero)
	
	function p2.cameraRig(p3)
		-- upvalues: Compose (copy), p1 (copy), GestureServiceModule (upval), DragSessionModule (upval), MotionModule (upval), TypesVector2 (copy), TypesVector3 (copy), ForValueResult (copy), Runtime (copy), TypesEnum (copy), Host (copy), TypesCFrame (copy)
		local CameraRigRequiresAComposeOwner = assert(Compose.currentOwner(), "cameraRig requires a Compose owner")
		local CameraRigRequiresUserInputService = assert(p1.config.userInputService, "cameraRig requires UserInputService")
		local CameraRigRequiresWorkspace = assert(p1.config.services.Workspace, "cameraRig requires Workspace")
		local GestureServiceModuleResult = GestureServiceModule(p1)
		local DragSessionModuleResult = DragSessionModule(p1)
		local ReducedResult = MotionModule.reduced(p1)
		local YawBounds = p3.yawBounds or TypesVector2.new(-3.141592653589793, 3.141592653589793)
		local PitchBounds = p3.pitchBounds or TypesVector2.new(-1.5607963267948965, 1.5607963267948965)
		local DistanceBounds = p3.distanceBounds
		local FocusBounds = p3.focusBounds
		
		local function _(Value: number): boolean
			return Value == Value and math.abs(Value) < 1e999
		end
		
		local _ = function(Vector)
			local X: number = Vector.X
			local IsMagnitudeBelow: boolean = X == X and math.abs(X) < 1e999
			
			if IsMagnitudeBelow then
				local Y: number = Vector.Y
				IsMagnitudeBelow = Y == Y and (math.abs(Y) < 1e999 and Vector.X <= Vector.Y)
			end
			assert(IsMagnitudeBelow, "cameraRig requires finite ordered bounds")
		end
		
		local X: number = YawBounds.X
		local IsMagnitudeBelow: boolean = X == X and math.abs(X) < 1e999
		
		if IsMagnitudeBelow then
			local Y: number = YawBounds.Y
			IsMagnitudeBelow = Y == Y and (math.abs(Y) < 1e999 and YawBounds.X <= YawBounds.Y)
		end
		assert(IsMagnitudeBelow, "cameraRig requires finite ordered bounds")
		local X1: number = PitchBounds.X
		local IsMagnitudeBelow1: boolean = X1 == X1 and math.abs(X1) < 1e999
		
		if IsMagnitudeBelow1 then
			local Y: number = PitchBounds.Y
			IsMagnitudeBelow1 = Y == Y and (math.abs(Y) < 1e999 and PitchBounds.X <= PitchBounds.Y)
		end
		assert(IsMagnitudeBelow1, "cameraRig requires finite ordered bounds")
		local X2: number = DistanceBounds.X
		local IsMagnitudeBelow2: boolean = X2 == X2 and math.abs(X2) < 1e999
		
		if IsMagnitudeBelow2 then
			local Y: number = DistanceBounds.Y
			IsMagnitudeBelow2 = Y == Y and (math.abs(Y) < 1e999 and DistanceBounds.X <= DistanceBounds.Y)
		end
		assert(IsMagnitudeBelow2, "cameraRig requires finite ordered bounds")
		assert(DistanceBounds.X > 0, "cameraRig distance must be positive")
		assert(PitchBounds.X > -1.5707963267948966 and PitchBounds.Y < 1.5707963267948966, "cameraRig pitch must avoid the poles")
		
		for _, Vector in {
			TypesVector2.new(FocusBounds.min.X, FocusBounds.max.X),
			TypesVector2.new(FocusBounds.min.Y, FocusBounds.max.Y),
			TypesVector2.new(FocusBounds.min.Z, FocusBounds.max.Z)
		} do
			local X3: number = Vector.X
			local IsMagnitudeBelow3: boolean = X3 == X3 and math.abs(X3) < 1e999
			
			if IsMagnitudeBelow3 then
				local Y: number = Vector.Y
				IsMagnitudeBelow3 = Y == Y and (math.abs(Y) < 1e999 and Vector.X <= Vector.Y)
			end
			assert(IsMagnitudeBelow3, "cameraRig requires finite ordered bounds")
		end
		local function clampFocus(Vector)
			-- upvalues: TypesVector3 (upval), FocusBounds (copy)
			local X: number = Vector.X
			local IsMagnitudeBelow: boolean = X == X and math.abs(X) < 1e999
			
			if IsMagnitudeBelow then
				local Y: number = Vector.Y
				IsMagnitudeBelow = Y == Y and math.abs(Y) < 1e999
				
				if IsMagnitudeBelow then
					local Z: number = Vector.Z
					IsMagnitudeBelow = Z == Z and math.abs(Z) < 1e999
				end
			end
			assert(IsMagnitudeBelow, "cameraRig focus must be finite")
			
			return TypesVector3.new(math.clamp(Vector.X, FocusBounds.min.X, FocusBounds.max.X), math.clamp(Vector.Y, FocusBounds.min.Y, FocusBounds.max.Y), (math.clamp(Vector.Z, FocusBounds.min.Z, FocusBounds.max.Z)))
		end
		
		local function clampOrbit(NewResult)
			-- upvalues: TypesVector3 (upval), YawBounds (copy), PitchBounds (copy), DistanceBounds (copy)
			local X: number = NewResult.X
			local IsMagnitudeBelow: boolean = X == X and math.abs(X) < 1e999
			
			if IsMagnitudeBelow then
				local Y: number = NewResult.Y
				IsMagnitudeBelow = Y == Y and math.abs(Y) < 1e999
				
				if IsMagnitudeBelow then
					local Z: number = NewResult.Z
					IsMagnitudeBelow = Z == Z and math.abs(Z) < 1e999
				end
			end
			assert(IsMagnitudeBelow, "cameraRig orbit must be finite")
			
			return TypesVector3.new(math.clamp(NewResult.X, YawBounds.X, YawBounds.Y), math.clamp(NewResult.Y, PitchBounds.X, PitchBounds.Y), (math.clamp(NewResult.Z, DistanceBounds.X, DistanceBounds.Y)))
		end
		
		local function orbitOf(PeekResult)
			-- upvalues: clampOrbit (copy), TypesVector3 (upval)
			return clampOrbit(TypesVector3.new(PeekResult.yaw, PeekResult.pitch, PeekResult.distance))
		end
		
		local ClampFocusResult = clampFocus(p3.initial.focus)
		local Initial = p3.initial
		local ClampOrbitResult = clampOrbit(TypesVector3.new(Initial.yaw, Initial.pitch, Initial.distance))
		local t = {}
		local Presets = p3.presets or {}
		for i, preset in Presets do
			local ClampOrbitResult1 = clampOrbit(TypesVector3.new(preset.yaw, preset.pitch, preset.distance))
			t[i] = {
				focus = clampFocus(preset.focus),
				yaw = ClampOrbitResult1.X,
				pitch = ClampOrbitResult1.Y,
				distance = ClampOrbitResult1.Z
			}
		end
		local OrbitSensitivity = p3.orbitSensitivity or 0.005
		local PanSensitivity = p3.panSensitivity or 0.01
		local OrbitSpeed = p3.orbitSpeed or 1.5
		local ZoomSpeed = p3.zoomSpeed or 8
		
		for _, value in { OrbitSensitivity, PanSensitivity, OrbitSpeed, ZoomSpeed } do
			assert(value == value and (math.abs(value) < 1e999 and value > 0), "cameraRig input speeds must be finite and positive")
		end
		local CellResult = Compose.cell(ClampFocusResult)
		local CellResult1 = Compose.cell(nil)
		local RampResult = ForValueResult.ramp(ClampFocusResult, { ease = p1.motionEase("travel") })
		local RampResult1 = ForValueResult.ramp(ClampOrbitResult, { ease = p1.motionEase("travel") })
		local ClampFocusResult1 = ClampFocusResult
		local Vector1 = ClampOrbitResult
		local Flag = false
		local Flag1 = false
		local CellResult2 = Compose.cell(false)
		local CellResult3 = Compose.cell(false)
		local Key = nil
		local Zero = TypesVector2.zero
		local Tbl = {}
		local Tbl1 = {}
		local t1 = {}
		local Flag2 = true
		local Flag3 = false
		local Flag4 = false
		local Count = 0
		local Zero1 = TypesVector2.zero
		local Z = ClampOrbitResult.Z
		local Zero2 = TypesVector3.zero
		local Zero3 = TypesVector3.zero
		local NowResult = 0
		local Tbl2 = {}
		local Zero4 = TypesVector2.zero
		
		local _ = function()
			-- upvalues: Runtime (upval)
			local Frames = Runtime.host.frames
			
			return if Frames then Frames.now() else os.clock()
		end
		
		local function available(): boolean
			-- upvalues: p1 (upval), Flag2 (ref), p3 (copy), CameraRigRequiresUserInputService (copy), GestureServiceModuleResult (copy), DragSessionModuleResult (copy), t1 (copy), Tbl1 (copy)
			local GuiService = p1.config.guiService
			
			return Flag2 and (p1.read(p3.enabled) ~= false and (p1.read(p3.blocked) ~= true and (not CameraRigRequiresUserInputService:GetFocusedTextBox() and (not (GuiService and p1.selection.get()) and (not GestureServiceModuleResult.busy() and (DragSessionModuleResult.state:peek() == nil and next(t1) == nil and next(Tbl1) == nil))))))
		end
		
		local _ = function()
			-- upvalues: p1 (upval), TypesVector2 (upval)
			local GuiService = p1.config.guiService
			
			return if GuiService then GuiService:GetGuiInset() else TypesVector2.zero
		end
		
		local function empty(NewResult): boolean
			-- upvalues: p3 (copy)
			for _, Object in p3.inputRoot:GetGuiObjectsAtPosition(NewResult.X, NewResult.Y) do
				if Object.Active or Object:IsA("GuiButton") or Object:IsA("TextBox") or Object:FindFirstAncestorWhichIsA("SurfaceGui") ~= nil then
					return false
				end
			end
			return true
		end
		
		local function clear()
			-- upvalues: Key (ref), Flag3 (ref), Flag4 (ref), Count (ref), CellResult2 (copy), Tbl (copy), Zero2 (ref), Zero3 (ref), TypesVector3 (upval)
			Key = nil
			Flag3 = false
			Flag4 = false
			Count = 0
			CellResult2:set(false)
			table.clear(Tbl)
			Zero2 = TypesVector3.zero
			Zero3 = TypesVector3.zero
		end
		
		local CellResult4 = Compose.cell(false)
		
		local function request(Focus, Vector, MotionDurationsCameraTravel: number)
			-- upvalues: CellResult4 (copy), ClampFocusResult1 (ref), clampFocus (copy), Vector1 (ref), clampOrbit (copy), RampResult (copy), ReducedResult (copy), RampResult1 (copy), Flag (ref), CellResult (copy)
			CellResult4:set(MotionDurationsCameraTravel > 0)
			ClampFocusResult1 = clampFocus(Focus)
			Vector1 = clampOrbit(Vector)
			RampResult.retarget(ClampFocusResult1, if ReducedResult() then 0 else MotionDurationsCameraTravel)
			RampResult1.retarget(Vector1, if ReducedResult() then 0 else MotionDurationsCameraTravel)
			Flag = true
			CellResult:set(ClampFocusResult1)
			Flag = false
		end
		
		local function v85()
			-- upvalues: RampResult (copy), RampResult1 (copy)
			return RampResult.value:peek(), RampResult1.value:peek()
		end
		
		local function haltInput()
			-- upvalues: Flag1 (ref), v85 (ref), request (copy), CellResult3 (copy), Key (ref), Flag3 (ref), Flag4 (ref), Count (ref), CellResult2 (copy), Tbl (copy), Zero2 (ref), Zero3 (ref), TypesVector3 (upval), Tbl2 (copy), Zero4 (ref), TypesVector2 (upval)
			if Flag1 then
				local v1, v2 = v85()
				request(v1, v2, 0)
				CellResult3:set(true)
				Flag1 = false
			end
			Key = nil
			Flag3 = false
			Flag4 = false
			Count = 0
			CellResult2:set(false)
			table.clear(Tbl)
			Zero2 = TypesVector3.zero
			Zero3 = TypesVector3.zero
			table.clear(Tbl2)
			Zero4 = TypesVector2.zero
		end
		
		local _ = function()
			-- upvalues: Flag1 (ref), CellResult3 (copy), v85 (ref), request (copy), CellResult1 (copy), Zero2 (ref), Zero3 (ref), TypesVector3 (upval), NowResult (ref), Runtime (upval)
			Flag1 = true
			CellResult3:set(false)
			local v1, v2 = v85()
			request(v1, v2, 0)
			CellResult1:set(nil)
			Zero2 = TypesVector3.zero
			Zero3 = TypesVector3.zero
			local Frames = Runtime.host.frames
			NowResult = if Frames then Frames.now() else os.clock()
		end
		
		local _ = function(p4, p5)
			-- upvalues: Key (ref), Flag3 (ref), Flag4 (ref), Count (ref), CellResult2 (copy), Tbl (copy), Zero2 (ref), Zero3 (ref), TypesVector3 (upval), Flag1 (ref), CellResult3 (copy), request (copy), p1 (upval)
			Key = nil
			Flag3 = false
			Flag4 = false
			Count = 0
			CellResult2:set(false)
			table.clear(Tbl)
			Zero2 = TypesVector3.zero
			Zero3 = TypesVector3.zero
			Flag1 = false
			CellResult3:set(false)
			request(p4, p5, p1.metric("motion.durations.cameraTravel"))
		end
		
		Compose.watch(function(Callback)
			-- upvalues: CellResult1 (copy), t (copy), clampOrbit (copy), TypesVector3 (upval), Key (ref), Flag3 (ref), Flag4 (ref), Count (ref), CellResult2 (copy), Tbl (copy), Zero2 (ref), Zero3 (ref), Flag1 (ref), CellResult3 (copy), request (copy), p1 (upval)
			local CallbackResult = Callback(CellResult1)
			
			if CallbackResult then
				local v1 = assert(t[CallbackResult], "cameraRig preset does not exist: " .. CallbackResult)
				local Focus = v1.focus
				local ClampOrbitResult = clampOrbit(TypesVector3.new(v1.yaw, v1.pitch, v1.distance))
				Key = nil
				Flag3 = false
				Flag4 = false
				Count = 0
				CellResult2:set(false)
				table.clear(Tbl)
				Zero2 = TypesVector3.zero
				Zero3 = TypesVector3.zero
				Flag1 = false
				CellResult3:set(false)
				request(Focus, ClampOrbitResult, p1.metric("motion.durations.cameraTravel"))
			end
		end)
		Compose.watch(function(Callback)
			-- upvalues: CellResult (copy), Flag (ref), ClampFocusResult1 (ref), CellResult1 (copy), Vector1 (ref), Key (ref), Flag3 (ref), Flag4 (ref), Count (ref), CellResult2 (copy), Tbl (copy), Zero2 (ref), Zero3 (ref), TypesVector3 (upval), Flag1 (ref), CellResult3 (copy), request (copy), p1 (upval)
			local CallbackResult = Callback(CellResult)
			
			if not Flag and CallbackResult ~= ClampFocusResult1 then
				CellResult1:set(nil)
				local Vector = Vector1
				Key = nil
				Flag3 = false
				Flag4 = false
				Count = 0
				CellResult2:set(false)
				table.clear(Tbl)
				Zero2 = TypesVector3.zero
				Zero3 = TypesVector3.zero
				Flag1 = false
				CellResult3:set(false)
				request(CallbackResult, Vector, p1.metric("motion.durations.cameraTravel"))
			end
		end)
		
		local function settle()
			-- upvalues: p3 (copy), ReducedResult (copy), available (copy), Runtime (upval), NowResult (ref), p1 (upval), request (copy), ClampFocusResult1 (ref), Zero3 (ref), Vector1 (ref), Zero2 (ref), TypesVector3 (upval)
			if p3.inertia and not ReducedResult() and available() then
				local Frames = Runtime.host.frames
				
				if (if Frames then Frames.now() else os.clock()) - NowResult <= p1.metric("motion.durations.cameraInertia") then
					local MotionDurationsCameraInertia = p1.metric("motion.durations.cameraInertia")
					request(ClampFocusResult1 + Zero3 * MotionDurationsCameraInertia, Vector1 + Zero2 * MotionDurationsCameraInertia, MotionDurationsCameraInertia)
				end
			end
			Zero2 = TypesVector3.zero
			Zero3 = TypesVector3.zero
		end
		
		local function move(Vector, p4, p5)
			-- upvalues: TypesVector3 (upval), OrbitSensitivity (copy), Vector1 (ref), PanSensitivity (copy), Runtime (upval), NowResult (ref), TypesVector2 (upval), Zero2 (ref), Zero3 (ref), request (copy), ClampFocusResult1 (ref)
			local X: number = Vector1.X
			
			local function _(Vector)
				-- upvalues: TypesVector3 (upval), X (copy), PanSensitivity (upval)
				return (TypesVector3.new(math.cos(X), 0, -math.sin(X)) * -Vector.X + TypesVector3.new(0, 1, 0) * Vector.Y) * PanSensitivity
			end
			
			local Frames = Runtime.host.frames
			local v1 = (if Frames then Frames.now() else os.clock()) - NowResult
			local P15 = p5 or (if v1 > 0 then Vector / v1 else TypesVector2.zero)
			Zero2 = if p4 then TypesVector3.zero else TypesVector3.new(-P15.X * OrbitSensitivity, P15.Y * OrbitSensitivity, 0)
			Zero3 = if p4 then (TypesVector3.new(math.cos(X), 0, -math.sin(X)) * -P15.X + TypesVector3.new(0, 1, 0) * P15.Y) * PanSensitivity else TypesVector3.zero
			local Frames1 = Runtime.host.frames
			NowResult = if Frames1 then Frames1.now() else os.clock()
			request(ClampFocusResult1 + (if p4 then (TypesVector3.new(math.cos(X), 0, -math.sin(X)) * -Vector.X + TypesVector3.new(0, 1, 0) * Vector.Y) * PanSensitivity else TypesVector3.zero), Vector1 + (if p4 then TypesVector3.zero else TypesVector3.new(-Vector.X * OrbitSensitivity, Vector.Y * OrbitSensitivity, 0)), 0)
		end
		
		local Children = {}
		
		local function observeDetector(DragDetector)
			-- upvalues: Children (copy), Compose (upval), CameraRigRequiresAComposeOwner (copy), Runtime (upval), t1 (copy), Flag1 (ref), v85 (ref), request (copy), CellResult3 (copy), Key (ref), Flag3 (ref), Flag4 (ref), Count (ref), CellResult2 (copy), Tbl (copy), Zero2 (ref), Zero3 (ref), TypesVector3 (upval), Tbl2 (copy), Zero4 (ref), TypesVector2 (upval)
			if DragDetector:IsA("DragDetector") and not Children[DragDetector] then
				local Child = Compose.owner.createChild(CameraRigRequiresAComposeOwner)
				Children[DragDetector] = Child
				Compose.withOwner(Child, function()
					-- upvalues: Runtime (upval), DragDetector (copy), t1 (upval), Flag1 (upval), v85 (upval), request (upval), CellResult3 (upval), Key (upval), Flag3 (upval), Flag4 (upval), Count (upval), CellResult2 (upval), Tbl (upval), Zero2 (upval), Zero3 (upval), TypesVector3 (upval), Tbl2 (upval), Zero4 (upval), TypesVector2 (upval), Compose (upval), Children (upval)
					Runtime.connect(DragDetector, "DragStart", function()
						-- upvalues: t1 (upval), DragDetector (upval), Flag1 (upval), v85 (upval), request (upval), CellResult3 (upval), Key (upval), Flag3 (upval), Flag4 (upval), Count (upval), CellResult2 (upval), Tbl (upval), Zero2 (upval), Zero3 (upval), TypesVector3 (upval), Tbl2 (upval), Zero4 (upval), TypesVector2 (upval)
						t1[DragDetector] = true
						
						if Flag1 then
							local v1, v2 = v85()
							request(v1, v2, 0)
							CellResult3:set(true)
							Flag1 = false
						end
						Key = nil
						Flag3 = false
						Flag4 = false
						Count = 0
						CellResult2:set(false)
						table.clear(Tbl)
						Zero2 = TypesVector3.zero
						Zero3 = TypesVector3.zero
						table.clear(Tbl2)
						Zero4 = TypesVector2.zero
					end)
					Runtime.connect(DragDetector, "DragEnd", function()
						-- upvalues: t1 (upval), DragDetector (upval)
						t1[DragDetector] = nil
					end)
					Compose.cleanup(function()
						-- upvalues: t1 (upval), DragDetector (upval), Children (upval)
						t1[DragDetector] = nil
						Children[DragDetector] = nil
					end)
				end)
				
				return
			end
		end
		
		for _, descendant in CameraRigRequiresWorkspace:GetDescendants() do
			observeDetector(descendant)
		end
		Runtime.connect(CameraRigRequiresWorkspace, "DescendantAdded", observeDetector)
		Runtime.connect(CameraRigRequiresWorkspace, "DescendantRemoving", function(p4)
			-- upvalues: Children (copy), Compose (upval)
			local Child = Children[p4]
			
			if Child then
				Compose.owner.dispose(Child)
			end
		end)
		Runtime.connect(CameraRigRequiresUserInputService, "InputBegan", function(Input, p4)
			-- upvalues: TypesEnum (upval), TypesVector2 (upval), empty (copy), Tbl1 (copy), Flag1 (ref), v85 (ref), request (copy), CellResult3 (copy), Key (ref), Flag3 (ref), Flag4 (ref), Count (ref), CellResult2 (copy), Tbl (copy), Zero2 (ref), Zero3 (ref), TypesVector3 (upval), Tbl2 (copy), Zero4 (ref), available (copy), CellResult1 (copy), NowResult (ref), Runtime (upval), Zero (ref)
			local UserInputType = Input.UserInputType
			
			if UserInputType ~= TypesEnum.UserInputType.Touch and UserInputType ~= TypesEnum.UserInputType.MouseButton1 and UserInputType ~= TypesEnum.UserInputType.MouseButton2 then return end
			local NewTypesVector = TypesVector2.new(Input.Position.X, Input.Position.Y)
			
			if p4 or not empty(NewTypesVector) then
				Tbl1[Input] = true
				
				if Flag1 then
					local v1, v2 = v85()
					request(v1, v2, 0)
					CellResult3:set(true)
					Flag1 = false
				end
				Key = nil
				Flag3 = false
				Flag4 = false
				Count = 0
				CellResult2:set(false)
				table.clear(Tbl)
				Zero2 = TypesVector3.zero
				Zero3 = TypesVector3.zero
				table.clear(Tbl2)
				Zero4 = TypesVector2.zero
				
				return
			elseif not available() then return end
			if Input.UserInputType == TypesEnum.UserInputType.Touch then
				Tbl[Input] = true
				
				return
			end
			if Input.UserInputType == TypesEnum.UserInputType.MouseButton1 or Input.UserInputType == TypesEnum.UserInputType.MouseButton2 then
				Flag1 = true
				CellResult3:set(false)
				local v3, v4 = v85()
				request(v3, v4, 0)
				CellResult1:set(nil)
				Zero2 = TypesVector3.zero
				Zero3 = TypesVector3.zero
				local Frames = Runtime.host.frames
				NowResult = if Frames then Frames.now() else os.clock()
				Key = Input
				Zero = NewTypesVector
				CellResult2:set(true)
			end
		end)
		Runtime.connect(CameraRigRequiresUserInputService, "InputChanged", function(Input, p4)
			-- upvalues: TypesEnum (upval), available (copy), Flag1 (ref), v85 (ref), request (copy), CellResult3 (copy), Key (ref), Flag3 (ref), Flag4 (ref), Count (ref), CellResult2 (copy), Tbl (copy), Zero2 (ref), Zero3 (ref), TypesVector3 (upval), Tbl2 (copy), Zero4 (ref), TypesVector2 (upval), empty (copy), move (copy), Zero (ref), CameraRigRequiresUserInputService (copy), p1 (upval), CellResult1 (copy), NowResult (ref), Runtime (upval), ClampFocusResult1 (ref), Vector1 (ref), ZoomSpeed (copy)
			if Input.UserInputType ~= TypesEnum.UserInputType.MouseMovement and Input.UserInputType ~= TypesEnum.UserInputType.MouseWheel then return end
			if p4 or not available() then
				if Flag1 then
					local v1, v2 = v85()
					request(v1, v2, 0)
					CellResult3:set(true)
					Flag1 = false
				end
				Key = nil
				Flag3 = false
				Flag4 = false
				Count = 0
				CellResult2:set(false)
				table.clear(Tbl)
				Zero2 = TypesVector3.zero
				Zero3 = TypesVector3.zero
				table.clear(Tbl2)
				Zero4 = TypesVector2.zero
				
				return
			elseif Input.UserInputType == TypesEnum.UserInputType.MouseMovement and Key then
				local NewTypesVector = TypesVector2.new(Input.Position.X, Input.Position.Y)
				
				if empty(NewTypesVector) then
					move(NewTypesVector - Zero, false)
					Zero = NewTypesVector
					
					return
				else
					Key = nil
					Flag3 = false
					Flag4 = false
					Count = 0
					CellResult2:set(false)
					table.clear(Tbl)
					Zero2 = TypesVector3.zero
					Zero3 = TypesVector3.zero
					
					return
				end
			elseif Input.UserInputType == TypesEnum.UserInputType.MouseWheel then
				local GuiService = p1.config.guiService
				
				if empty(CameraRigRequiresUserInputService:GetMouseLocation() - (if GuiService then GuiService:GetGuiInset() else TypesVector2.zero)) then
					Flag1 = true
					CellResult3:set(false)
					local v3, v4 = v85()
					request(v3, v4, 0)
					CellResult1:set(nil)
					Zero2 = TypesVector3.zero
					Zero3 = TypesVector3.zero
					local Frames = Runtime.host.frames
					NowResult = if Frames then Frames.now() else os.clock()
					request(ClampFocusResult1, Vector1 - TypesVector3.new(0, 0, Input.Position.Z * ZoomSpeed), 0)
				end
			end
		end)
		Runtime.connect(CameraRigRequiresUserInputService, "InputEnded", function(Key1)
			-- upvalues: Tbl1 (copy), Tbl (copy), Key (ref), settle (copy), CellResult2 (copy), Flag3 (ref), Flag4 (ref)
			Tbl1[Key1] = nil
			Tbl[Key1] = nil
			
			if Key1 == Key then
				Key = nil
				settle()
				CellResult2:set(Flag3 or Flag4)
			end
		end)
		
		local function ownsTouches(List, p4): boolean
			-- upvalues: available (copy), Tbl (copy), empty (copy), p1 (upval), TypesVector2 (upval)
			if p4 or not available() or #List == 0 then
				return false
			end
			local Count = 0
			
			for _ in Tbl do
				Count += 1
			end
			if Count ~= #List then
				return false
			end
			for _, value in List do
				local GuiService = p1.config.guiService
				
				if not empty(value - (if GuiService then GuiService:GetGuiInset() else TypesVector2.zero)) then
					return false
				end
			end
			return true
		end
		
		Runtime.connect(CameraRigRequiresUserInputService, "TouchPan", function(p5, p6, p7, End, p8)
			-- upvalues: TypesEnum (upval), Flag3 (ref), settle (copy), CellResult2 (copy), Key (ref), Flag4 (ref), ownsTouches (copy), Count (ref), Tbl (copy), Zero2 (ref), Zero3 (ref), TypesVector3 (upval), Flag1 (ref), CellResult3 (copy), v85 (ref), request (copy), CellResult1 (copy), NowResult (ref), Runtime (upval), Zero1 (ref), move (copy)
			if End == TypesEnum.UserInputState.End or End == TypesEnum.UserInputState.Cancel then
				if Flag3 and End == TypesEnum.UserInputState.End then
					settle()
				end
				Flag3 = false
				CellResult2:set(Key ~= nil or Flag4)
				
				return
			elseif not ownsTouches(p5, p8) then
				Key = nil
				Flag3 = false
				Flag4 = false
				Count = 0
				CellResult2:set(false)
				table.clear(Tbl)
				Zero2 = TypesVector3.zero
				Zero3 = TypesVector3.zero
				
				return
			else
				if End == TypesEnum.UserInputState.Begin or Count ~= #p5 then
					Flag1 = true
					CellResult3:set(false)
					local v1, v2 = v85()
					request(v1, v2, 0)
					CellResult1:set(nil)
					Zero2 = TypesVector3.zero
					Zero3 = TypesVector3.zero
					local Frames = Runtime.host.frames
					NowResult = if Frames then Frames.now() else os.clock()
					Zero1 = p6
					Flag3 = true
					Count = #p5
					CellResult2:set(true)
					
					return
				elseif Flag3 then
					move(p6 - Zero1, #p5 >= 2, p7)
					Zero1 = p6
				end
			end
		end)
		Runtime.connect(CameraRigRequiresUserInputService, "TouchPinch", function(p5, Value: number, _, Begin, p6)
			-- upvalues: TypesEnum (upval), Flag4 (ref), CellResult2 (copy), Key (ref), Flag3 (ref), ownsTouches (copy), Count (ref), Tbl (copy), Zero2 (ref), Zero3 (ref), TypesVector3 (upval), Flag1 (ref), CellResult3 (copy), v85 (ref), request (copy), CellResult1 (copy), NowResult (ref), Runtime (upval), Z (ref), Vector1 (ref), ClampFocusResult1 (ref)
			if Begin == TypesEnum.UserInputState.End or Begin == TypesEnum.UserInputState.Cancel then
				Flag4 = false
				CellResult2:set(Key ~= nil or Flag3)
				
				return
			end
			if #p5 < 2 or not ownsTouches(p5, p6) then
				Key = nil
				Flag3 = false
				Flag4 = false
				Count = 0
				CellResult2:set(false)
				table.clear(Tbl)
				Zero2 = TypesVector3.zero
				Zero3 = TypesVector3.zero
				
				return
			end
			if Begin == TypesEnum.UserInputState.Begin then
				Flag1 = true
				CellResult3:set(false)
				local v1, v2 = v85()
				request(v1, v2, 0)
				CellResult1:set(nil)
				Zero2 = TypesVector3.zero
				Zero3 = TypesVector3.zero
				local Frames = Runtime.host.frames
				NowResult = if Frames then Frames.now() else os.clock()
				Z = Vector1.Z
				Flag4 = true
				CellResult2:set(true)
				
				return
			elseif Flag4 and (Value == Value and math.abs(Value) < 1e999 and Value > 0) then
				request(ClampFocusResult1, TypesVector3.new(Vector1.X, Vector1.Y, Z / Value), 0)
			end
		end)
		local CellResult5 = Compose.cell((available()))
		local v1 = Host.InputContext("FacetCameraRig")({
			Priority = 250,
			Sink = true,
			Parent = Compose.static(p3.inputRoot),
			Enabled = CellResult5
		})
		
		for _, value1 in {
			{
				name = "CameraLeft",
				keys = { TypesEnum.KeyCode.Left, TypesEnum.KeyCode.A }
			},
			{
				name = "CameraRight",
				keys = { TypesEnum.KeyCode.Right, TypesEnum.KeyCode.D }
			},
			{
				name = "CameraUp",
				keys = { TypesEnum.KeyCode.Up, TypesEnum.KeyCode.W }
			},
			{
				name = "CameraDown",
				keys = { TypesEnum.KeyCode.Down, TypesEnum.KeyCode.S }
			},
			{
				name = "CameraIn",
				keys = {
					TypesEnum.KeyCode.Equals,
					TypesEnum.KeyCode.KeypadPlus,
					TypesEnum.KeyCode.ButtonR2
				}
			},
			{
				name = "CameraOut",
				keys = {
					TypesEnum.KeyCode.Minus,
					TypesEnum.KeyCode.KeypadMinus,
					TypesEnum.KeyCode.ButtonL2
				}
			}
		} do
			local config = {
				Name = value1.name,
				Parent = Compose.static(v1),
				Type = TypesEnum.InputActionType.Bool,
				Pressed = function()
					-- upvalues: available (copy), Flag1 (ref), CellResult3 (copy), v85 (ref), request (copy), CellResult1 (copy), Zero2 (ref), Zero3 (ref), TypesVector3 (upval), NowResult (ref), Runtime (upval), Tbl2 (copy), value1 (copy)
					if available() then
						Flag1 = true
						CellResult3:set(false)
						local v2, v3 = v85()
						request(v2, v3, 0)
						CellResult1:set(nil)
						Zero2 = TypesVector3.zero
						Zero3 = TypesVector3.zero
						local Frames = Runtime.host.frames
						NowResult = if Frames then Frames.now() else os.clock()
						Tbl2[value1.name] = true
					end
				end,
				Released = function()
					-- upvalues: Tbl2 (copy), value1 (copy)
					Tbl2[value1.name] = nil
				end
			}
			
			for _, key in value1.keys do
				config[#config + 1] = Host.InputBinding({ KeyCode = key })
			end
			Host.InputAction(config)
		end
		Host.InputAction("CameraOrbit")({
			Parent = Compose.static(v1),
			Type = TypesEnum.InputActionType.Direction2D,
			StateChanged = function(p5)
				-- upvalues: Zero4 (ref), available (copy), TypesVector2 (upval)
				if typeof(p5) == "Vector2" then
					Zero4 = if available() then p5 else TypesVector2.zero
				end
			end,
			Released = function()
				-- upvalues: Zero4 (ref), TypesVector2 (upval)
				Zero4 = TypesVector2.zero
			end,
			Host.InputBinding({ KeyCode = TypesEnum.KeyCode.Thumbstick2 })
		})
		local Camera = p1.motionSpring("camera")
		local SpringResult = ForValueResult.spring(function(Callback)
			-- upvalues: RampResult (copy)
			return Callback(RampResult.value)
		end, {
			period = Camera.period,
			damping = Camera.damping,
			reducedMotion = function(Callback)
				-- upvalues: ReducedResult (copy), p3 (copy), CellResult2 (copy), CellResult3 (copy), CellResult4 (copy)
				return ReducedResult(Callback) or (p3.smoothing ~= true or (Callback(CellResult2) or (Callback(CellResult3) or Callback(CellResult4))))
			end
		})
		local SpringResult1 = ForValueResult.spring(function(Callback)
			-- upvalues: RampResult1 (copy)
			return Callback(RampResult1.value)
		end, {
			period = Camera.period,
			damping = Camera.damping,
			reducedMotion = function(Callback)
				-- upvalues: ReducedResult (copy), p3 (copy), CellResult2 (copy), CellResult3 (copy), CellResult4 (copy)
				return ReducedResult(Callback) or (p3.smoothing ~= true or (Callback(CellResult2) or (Callback(CellResult3) or Callback(CellResult4))))
			end
		})
		local FormulaResult = Compose.formula(function(Callback)
			-- upvalues: clampOrbit (copy), ReducedResult (copy), RampResult1 (copy), SpringResult1 (copy), clampFocus (copy), RampResult (copy), SpringResult (copy)
			local ClampOrbitResult = clampOrbit(if ReducedResult(Callback) then Callback(RampResult1.value) else Callback(SpringResult1))
			
			return {
				focus = clampFocus(if ReducedResult(Callback) then Callback(RampResult.value) else Callback(SpringResult)),
				yaw = ClampOrbitResult.X,
				pitch = ClampOrbitResult.Y,
				distance = ClampOrbitResult.Z
			}
		end)
		
		v85 = function()
			-- upvalues: FormulaResult (copy), orbitOf (copy)
			local PeekResult = FormulaResult:peek()
			
			return PeekResult.focus, orbitOf(PeekResult)
		end
		
		local ObserveResult = if p1.config.guiService then p1.selection.observe() else nil
		Compose.watch(function(Callback)
			-- upvalues: p1 (upval), p3 (copy), DragSessionModuleResult (copy), ObserveResult (copy), Flag1 (ref), v85 (ref), request (copy), CellResult3 (copy), Key (ref), Flag3 (ref), Flag4 (ref), Count (ref), CellResult2 (copy), Tbl (copy), Zero2 (ref), Zero3 (ref), TypesVector3 (upval), Tbl2 (copy), Zero4 (ref), TypesVector2 (upval)
			if p1.read(p3.enabled, Callback) == false or p1.read(p3.blocked, Callback) == true or Callback(DragSessionModuleResult.state) ~= nil or ObserveResult and Callback(ObserveResult) ~= nil then
				if Flag1 then
					local v2, v3 = v85()
					request(v2, v3, 0)
					CellResult3:set(true)
					Flag1 = false
				end
				Key = nil
				Flag3 = false
				Flag4 = false
				Count = 0
				CellResult2:set(false)
				table.clear(Tbl)
				Zero2 = TypesVector3.zero
				Zero3 = TypesVector3.zero
				table.clear(Tbl2)
				Zero4 = TypesVector2.zero
			end
		end)
		Compose.watch(function(p5)
			-- upvalues: ReducedResult (copy), Flag1 (ref), v85 (ref), request (copy), CellResult3 (copy), Key (ref), Flag3 (ref), Flag4 (ref), Count (ref), CellResult2 (copy), Tbl (copy), Zero2 (ref), Zero3 (ref), TypesVector3 (upval), Tbl2 (copy), Zero4 (ref), TypesVector2 (upval), ClampFocusResult1 (ref), Vector1 (ref)
			if ReducedResult(p5) then
				if Flag1 then
					if Flag1 then
						local v2, v3 = v85()
						request(v2, v3, 0)
						CellResult3:set(true)
						Flag1 = false
					end
					Key = nil
					Flag3 = false
					Flag4 = false
					Count = 0
					CellResult2:set(false)
					table.clear(Tbl)
					Zero2 = TypesVector3.zero
					Zero3 = TypesVector3.zero
					table.clear(Tbl2)
					Zero4 = TypesVector2.zero
					
					return
				else
					request(ClampFocusResult1, Vector1, 0)
				end
			end
		end)
		Runtime.connect(CameraRigRequiresUserInputService, "TextBoxFocused", haltInput)
		local FormulaResult1 = Compose.formula(function(Callback)
			-- upvalues: FormulaResult (copy), TypesVector3 (upval), TypesCFrame (upval)
			local CallbackResult = Callback(FormulaResult)
			
			return TypesCFrame.lookAt(CallbackResult.focus + TypesVector3.new(math.sin(CallbackResult.yaw) * math.cos(CallbackResult.pitch), math.sin(CallbackResult.pitch), math.cos(CallbackResult.yaw) * math.cos(CallbackResult.pitch)) * CallbackResult.distance, CallbackResult.focus)
		end)
		
		local function render(p5)
			-- upvalues: available (copy), CellResult5 (copy), Flag1 (ref), v85 (ref), request (copy), CellResult3 (copy), Key (ref), Flag3 (ref), Flag4 (ref), Count (ref), CellResult2 (copy), Tbl (copy), Zero2 (ref), Zero3 (ref), TypesVector3 (upval), Tbl2 (copy), Zero4 (ref), TypesVector2 (upval), ReducedResult (copy), ClampFocusResult1 (ref), Vector1 (ref), CellResult1 (copy), OrbitSpeed (copy), ZoomSpeed (copy)
			local AvailableResult = available()
			CellResult5:set(AvailableResult)
			
			if AvailableResult then
				if ReducedResult() then
					request(ClampFocusResult1, Vector1, 0)
				end
				local function _(p6): number
					-- upvalues: Tbl2 (upval)
					return if Tbl2[p6] then 1 else 0
				end
				
				local v2 = (if Tbl2.CameraRight then 1 else 0) - (if Tbl2.CameraLeft then 1 else 0)
				local v3 = (if Tbl2.CameraUp then 1 else 0) - (if Tbl2.CameraDown then 1 else 0)
				local v4 = (if Tbl2.CameraOut then 1 else 0) - (if Tbl2.CameraIn then 1 else 0)
				local Zero = if Zero4.Magnitude > 0.15 then Zero4 else TypesVector2.zero
				
				if v2 ~= 0 or v3 ~= 0 or v4 ~= 0 or Zero.Magnitude > 0 then
					Flag1 = true
					CellResult3:set(false)
					CellResult1:set(nil)
					request(ClampFocusResult1, Vector1 + TypesVector3.new(-(v2 + Zero.X) * OrbitSpeed, (v3 + Zero.Y) * OrbitSpeed, v4 * ZoomSpeed) * p5, 0)
				end
				return
			else
				if Flag1 then
					local v5, v6 = v85()
					request(v5, v6, 0)
					CellResult3:set(true)
					Flag1 = false
				end
				Key = nil
				Flag3 = false
				Flag4 = false
				Count = 0
				CellResult2:set(false)
				table.clear(Tbl)
				Zero2 = TypesVector3.zero
				Zero3 = TypesVector3.zero
				table.clear(Tbl2)
				Zero4 = TypesVector2.zero
			end
		end
		
		Runtime.connect(CameraRigRequiresUserInputService, "WindowFocusReleased", function()
			-- upvalues: Flag2 (ref), Flag1 (ref), v85 (ref), request (copy), CellResult3 (copy), Key (ref), Flag3 (ref), Flag4 (ref), Count (ref), CellResult2 (copy), Tbl (copy), Zero2 (ref), Zero3 (ref), TypesVector3 (upval), Tbl2 (copy), Zero4 (ref), TypesVector2 (upval), Tbl1 (copy)
			Flag2 = false
			
			if Flag1 then
				local v2, v3 = v85()
				request(v2, v3, 0)
				CellResult3:set(true)
				Flag1 = false
			end
			Key = nil
			Flag3 = false
			Flag4 = false
			Count = 0
			CellResult2:set(false)
			table.clear(Tbl)
			Zero2 = TypesVector3.zero
			Zero3 = TypesVector3.zero
			table.clear(Tbl2)
			Zero4 = TypesVector2.zero
			table.clear(Tbl1)
		end)
		Runtime.connect(CameraRigRequiresUserInputService, "WindowFocused", function()
			-- upvalues: Flag2 (ref)
			Flag2 = true
		end)
		Runtime.connect(CameraRigRequiresUserInputService, "GamepadDisconnected", function()
			-- upvalues: Zero4 (ref), TypesVector2 (upval), Tbl2 (copy)
			Zero4 = TypesVector2.zero
			table.clear(Tbl2)
		end)
		local RunService = p1.config.services.RunService
		
		if RunService then
			Runtime.connect(RunService, "PreRender", render)
		elseif Runtime.host.frames then
			Compose.cleanup(Runtime.host.frames.onFrame(render))
		end
		Compose.cleanup(clear)
		
		return {
			camera = FormulaResult1,
			state = FormulaResult,
			focus = CellResult,
			preset = CellResult1,
			reset = function()
				-- upvalues: CellResult1 (copy), ClampFocusResult (copy), ClampOrbitResult (copy), Key (ref), Flag3 (ref), Flag4 (ref), Count (ref), CellResult2 (copy), Tbl (copy), Zero2 (ref), Zero3 (ref), TypesVector3 (upval), Flag1 (ref), CellResult3 (copy), request (copy), p1 (upval)
				CellResult1:set(nil)
				Key = nil
				Flag3 = false
				Flag4 = false
				Count = 0
				CellResult2:set(false)
				table.clear(Tbl)
				Zero2 = TypesVector3.zero
				Zero3 = TypesVector3.zero
				Flag1 = false
				CellResult3:set(false)
				request(ClampFocusResult, ClampOrbitResult, p1.metric("motion.durations.cameraTravel"))
			end
		}
	end
end