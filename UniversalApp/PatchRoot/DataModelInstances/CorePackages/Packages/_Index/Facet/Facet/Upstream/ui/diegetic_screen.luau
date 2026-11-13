local _ = require("./types")
local _ = require("../vendor/compose/core")
local _ = require("./control_types")
local _ = require("./diegetic_types")
local DiegeticGeometryModule = require("./diegetic_geometry")
local MotionModule = require("./motion")

return function(p1, p2)
	-- upvalues: MotionModule (copy), DiegeticGeometryModule (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesVector3 = p1.types.Vector3
	local TypesEnum = p1.types.Enum
	p2.DiegeticScreen = p1.construct("DiegeticScreen", function(p3)
		-- upvalues: p1 (copy), MotionModule (upval), Compose (copy), Runtime (copy), TypesVector2 (copy), Host (copy), TypesUDim2 (copy), DiegeticGeometryModule (upval), TypesVector3 (copy), TypesEnum (copy), p2 (copy)
		assert(#p3.layers > 0, "DiegeticScreen.layers must contain the application ScreenGui")
		local DiegeticScreenRequiresWorkspace = assert(p1.config.services.Workspace, "DiegeticScreen requires Workspace")
		local DiegeticScreenRequiresGuiService = assert(p1.config.services.GuiService, "DiegeticScreen requires GuiService")
		local ReducedResult = MotionModule.reduced(p1)
		local CellResult = Compose.cell(false)
		local CellResult1 = Compose.cell(false)
		local CellResult2 = Compose.cell(0)
		local SchedulerResult = Runtime.scheduler()
		local MotionSpringResult = p1.motionSpring(p3.motion or "move")
		local SpringResult = Runtime.spring(function(Callback)
			-- upvalues: CellResult2 (copy)
			return Callback(CellResult2)
		end, {
			period = MotionSpringResult.period,
			damping = MotionSpringResult.damping,
			reducedMotion = ReducedResult
		})
		local CellResult3 = Compose.cell(nil)
		local CellResult4 = Compose.cell(nil)
		local CellResult5 = Compose.cell(nil)
		local Flag = false
		local Flag1 = false
		local v1 = 0
		local v2 = 1e999
		local CurrentCamera = nil
		local Cameras = {}
		local Parent = nil
		local v3 = nil
		local List = {}
		local Tbl = {}
		local NewTypesVector = TypesVector2.new(1, 1)
		local NewResult = p1.types.Rect.new(0, 0, 1, 1)
		local Object = nil
		local FieldOfView = p3.fieldOfView or 48
		assert(FieldOfView > 0 and FieldOfView < 180, "DiegeticScreen.fieldOfView must be between zero and 180")
		
		local function ownedLayer(Value): boolean
			-- upvalues: p3 (copy), p1 (upval)
			if not Value:IsA("ScreenGui") then
				return false
			elseif table.find(p3.layers, Value) then
				return true
			else
				local OverlayHost = p1.overlayHosts[Value]
				
				return if OverlayHost and OverlayHost:IsA("ScreenGui") then table.find(p3.layers, OverlayHost) ~= nil else false
			end
		end
		
		local function restore()
			-- upvalues: Flag (ref), CellResult4 (copy), List (copy), p3 (copy)
			if not Flag then return end
			Flag = false
			local PeekResult = CellResult4:peek()
			
			if PeekResult then
				PeekResult.Enabled = false
			end
			for _, value in List do
				for _, child in value.children do
					if child.Parent == value.slot then
						child.Parent = value.source
					end
				end
			end
			if PeekResult then
				for _, InputContext in PeekResult:GetChildren() do
					if InputContext:IsA("InputContext") then
						InputContext.Parent = p3.layers[1]
					end
				end
			end
		end
		
		local function restoreCameras()
			-- upvalues: Flag1 (ref), CurrentCamera (ref), DiegeticScreenRequiresWorkspace (copy), CellResult3 (copy), Cameras (copy), Parent (ref)
			Flag1 = false
			
			if CurrentCamera and DiegeticScreenRequiresWorkspace.CurrentCamera == CellResult3:peek() then
				DiegeticScreenRequiresWorkspace.CurrentCamera = CurrentCamera
			end
			for _, camera in Cameras do
				if camera.Parent == Parent then
					camera.Parent = DiegeticScreenRequiresWorkspace
				end
			end
			table.clear(Cameras)
		end
		
		local function release()
			-- upvalues: restore (copy), restoreCameras (copy), CurrentCamera (ref), CellResult1 (copy), CellResult (copy), List (copy), Tbl (copy)
			restore()
			restoreCameras()
			CurrentCamera = nil
			CellResult1:set(false)
			CellResult:set(false)
			table.clear(List)
			table.clear(Tbl)
		end
		
		local function _(p4)
			-- upvalues: release (copy), p3 (copy)
			release()
			p3.isPresented:set(false)
			
			if p3.onUnavailable then
				p3.onUnavailable(p4)
			end
		end
		
		local function addLayer(Parent)
			-- upvalues: Tbl (copy), CellResult4 (copy), Compose (upval), v3 (ref), DiegeticScreenRequiresGuiService (copy), Host (upval), TypesUDim2 (upval), NewResult (ref), p1 (upval), restore (copy), List (copy), Flag (ref), Runtime (upval)
			if Tbl[Parent] then return end
			local v4 = assert(CellResult4:peek())
			Compose.withOwner(assert(v3), function()
				-- upvalues: DiegeticScreenRequiresGuiService (upval), Parent (copy), Host (upval), Compose (upval), v4 (copy), TypesUDim2 (upval), NewResult (upval), p1 (upval), restore (upval), Tbl (upval), List (upval), Flag (upval), Runtime (upval)
				local InsetArea = DiegeticScreenRequiresGuiService:GetInsetArea(Parent.ScreenInsets)
				local Parent1 = Host.Frame("LogicalCanvas")({
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Parent = Compose.static(v4),
					Position = TypesUDim2.fromOffset(InsetArea.Min.X - NewResult.Min.X, InsetArea.Min.Y - NewResult.Min.Y),
					Size = TypesUDim2.fromOffset(InsetArea.Width, InsetArea.Height),
					Visible = p1.observe.Enabled(Parent)
				})
				Compose.cleanup(restore)
				local config = { source = Parent, slot = Parent1, children = {} }
				Tbl[Parent] = config
				table.insert(List, config)
				
				local function _(Value)
					-- upvalues: Flag (upval), Parent (upval), config (copy), Parent1 (copy)
					if Flag and Value.Parent == Parent then
						if not table.find(config.children, Value) then
							table.insert(config.children, Value)
						end
						Value.Parent = Parent1
					end
				end
				
				local SchedulerResult = Runtime.scheduler()
				Runtime.connect(Parent, "ChildAdded", function(Value)
					-- upvalues: SchedulerResult (copy), Flag (upval), Parent (upval), config (copy), Parent1 (copy)
					SchedulerResult.replace(Value, 0, function()
						-- upvalues: Value (copy), Flag (upval), Parent (upval), config (upval), Parent1 (upval)
						if Flag and Value.Parent == Parent then
							if not table.find(config.children, Value) then
								table.insert(config.children, Value)
							end
							Value.Parent = Parent1
						end
					end)
				end)
				
				if Flag then
					for _, child in Parent:GetChildren() do
						if Flag and child.Parent == Parent then
							if not table.find(config.children, child) then
								table.insert(config.children, child)
							end
							child.Parent = Parent1
						end
					end
				end
			end)
			local Copy = table.clone(List)
			table.sort(Copy, function(Value, Value1): boolean
				-- upvalues: List (upval)
				return if Value.source.DisplayOrder == Value1.source.DisplayOrder then assert(table.find(List, Value)) < assert(table.find(List, Value1)) else Value.source.DisplayOrder < Value1.source.DisplayOrder
			end)
			
			for ZIndex, value in Copy do
				value.slot.ZIndex = ZIndex
			end
		end
		
		local function transfer()
			-- upvalues: Flag (ref), List (copy), CellResult4 (copy), CellResult1 (copy), Compose (upval), v3 (ref), Runtime (upval), v1 (ref), v2 (ref), p1 (upval), p3 (copy), CellResult2 (copy)
			Flag = true
			
			for _, value in List do
				for _, child in value.source:GetChildren() do
					table.insert(value.children, child)
					child.Parent = value.slot
				end
			end
			assert(CellResult4:peek()).Enabled = true
			CellResult1:set(true)
			Compose.withOwner(assert(v3), function()
				-- upvalues: Runtime (upval), List (upval), v1 (upval), v2 (upval), p1 (upval), Compose (upval), CellResult1 (upval), p3 (upval), CellResult2 (upval)
				local SettledResult = Runtime.settled({
					sample = function(): string
						-- upvalues: List (upval)
						local Buffer = table.create(#List)
						
						for i, value in List do
							Buffer[i] = tostring(value.slot.AbsoluteSize)
						end
						return table.concat(Buffer, ";")
					end,
					ready = function(): boolean
						-- upvalues: v1 (upval), v2 (upval)
						return v1 <= v2 * 2
					end,
					timeout = p1.metric("motion.restLimit")
				})
				Compose.watch(function(Callback)
					-- upvalues: SettledResult (copy), CellResult1 (upval), p3 (upval), CellResult2 (upval)
					if Callback(SettledResult) and CellResult1:peek() and p3.isPresented:peek() then
						CellResult2:set(1)
					end
				end)
			end)
		end
		
		local ReadFunction = p1.read
		
		local function SessionNodes()
			-- upvalues: v3 (ref), Compose (upval), v1 (ref), v2 (ref), DiegeticGeometryModule (upval), p1 (upval), p3 (copy), NewTypesVector (ref), Host (upval), TypesVector3 (upval), ReadFunction (copy), ReducedResult (copy), CellResult2 (copy), SpringResult (copy), FieldOfView (copy), TypesEnum (upval), Runtime (upval), Flag1 (ref), DiegeticScreenRequiresWorkspace (copy), Parent (ref), p2 (upval), TypesUDim2 (upval), Object (ref), CellResult4 (copy), CellResult3 (copy), CellResult1 (copy), release (copy), CellResult5 (copy), restoreCameras (copy)
			v3 = assert(Compose.currentOwner())
			v1 = 0
			v2 = 1e999
			local FitResult = DiegeticGeometryModule.fit(p1.read(p3.bounds), NewTypesVector)
			local v5 = Host.Part("Display")({
				Anchored = true,
				CanCollide = false,
				CanTouch = false,
				CanQuery = true,
				Transparency = 1,
				Size = TypesVector3.new(FitResult.X, FitResult.Y, 0.01),
				CFrame = function(p4)
					-- upvalues: ReadFunction (upval), p3 (upval), p1 (upval)
					return ReadFunction(p3.surface, p4) * p1.types.CFrame.new(0, 0, 0.005)
				end
			})
			local FormulaResult = Compose.formula(function(Callback)
				-- upvalues: ReducedResult (upval), CellResult2 (upval), SpringResult (upval), DiegeticGeometryModule (upval), ReadFunction (upval), p3 (upval), FitResult (copy), FieldOfView (upval), p1 (upval)
				return DiegeticGeometryModule.match(ReadFunction(p3.surface, Callback), FitResult, FieldOfView, p1.types.CFrame):Lerp(ReadFunction(p3.camera, Callback), if ReducedResult(Callback) then Callback(CellResult2) else math.clamp(Callback(SpringResult), 0, 1))
			end)
			local Camera = Host.Camera("DiegeticCamera")({
				CameraType = TypesEnum.CameraType.Scriptable,
				FieldOfViewMode = TypesEnum.FieldOfViewMode.Vertical,
				FieldOfView = FieldOfView,
				CFrame = FormulaResult
			})
			Compose.cleanup(assert(Runtime.host.frames).onFrame(function(p4)
				-- upvalues: v2 (upval), v1 (upval), Flag1 (upval), DiegeticScreenRequiresWorkspace (upval), Camera (copy), TypesEnum (upval), FormulaResult (copy)
				v2 = v1
				v1 = p4
				
				if Flag1 and DiegeticScreenRequiresWorkspace.CurrentCamera == Camera then
					Camera.CameraType = TypesEnum.CameraType.Scriptable
					Camera.CFrame = FormulaResult:peek()
				end
			end))
			local v6 = Host.Folder("Cameras")({ Camera })
			Parent = v6
			local IsInteractive = p3.interactive == true
			local v7 = Host.SurfaceGui("DiegeticCanvas")({
				Parent = Compose.static(if IsInteractive then assert(p3.layers[1].Parent, "An interactive screen needs a mounted layer") else Object),
				Adornee = Compose.static(v5),
				Face = TypesEnum.NormalId.Front,
				SizingMode = TypesEnum.SurfaceGuiSizingMode.FixedSize,
				CanvasSize = NewTypesVector,
				LightInfluence = 0,
				Enabled = false,
				ZIndexBehavior = TypesEnum.ZIndexBehavior.Sibling,
				if IsInteractive then nil else p2.Button("ReturnToScreen")({
					label = "",
					name = "Return to screen",
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ZIndex = 1000,
					Selectable = false,
					Size = TypesUDim2.fromScale(1, 1),
					onActivate = function()
						-- upvalues: p3 (upval)
						p3.isPresented:set(false)
					end
				})
			})
			p1.overlayHosts[v7] = p3.layers[1]
			CellResult4:set(v7)
			CellResult3:set(Camera)
			local SettledResult = Runtime.settled({
				ready = function(): boolean
					-- upvalues: DiegeticScreenRequiresWorkspace (upval), Camera (copy)
					return DiegeticScreenRequiresWorkspace.CurrentCamera == Camera and Camera.ViewportSize.X > 1 and Camera.ViewportSize.Y > 1
				end,
				sample = function(): string
					-- upvalues: Camera (copy)
					return (tostring(Camera.ViewportSize))
				end
			})
			local ViewportSize = Runtime.observe(Camera, "ViewportSize")
			local ViewportSize1 = nil
			Compose.watch(function(Callback: (any) -> ())
				-- upvalues: ViewportSize (copy), Camera (copy), CellResult1 (upval), ViewportSize1 (ref), release (upval), p3 (upval)
				Callback(ViewportSize)
				local ViewportSize2 = Camera.ViewportSize
				
				if not CellResult1:peek() then
					ViewportSize1 = ViewportSize2
					
					return
				end
				if ViewportSize1 and ViewportSize2 ~= ViewportSize1 then
					release()
					p3.isPresented:set(false)
					
					if p3.onUnavailable then
						p3.onUnavailable("The viewport changed; enter the room again")
					end
				end
			end)
			CellResult5:set(SettledResult)
			Compose.cleanup(function()
				-- upvalues: p1 (upval), v7 (copy), restoreCameras (upval), CellResult5 (upval), CellResult4 (upval), CellResult3 (upval), v3 (upval), Parent (upval)
				p1.overlayHosts[v7] = nil
				restoreCameras()
				CellResult5:set(nil)
				CellResult4:set(nil)
				CellResult3:set(nil)
				v3 = nil
				Parent = nil
			end)
			
			return { v6, v5 }
		end
		
		local function SceneNodes()
			-- upvalues: p3 (copy)
			return { p3.scene() }
		end
		
		local function Session()
			-- upvalues: Host (upval), Compose (upval), DiegeticScreenRequiresWorkspace (copy), SessionNodes (copy)
			return Host.Folder("OwnedSession")({
				Compose.portal(DiegeticScreenRequiresWorkspace, SessionNodes)
			})
		end
		
		local IsRetainScene = p3.retainScene == true
		Object = Host.Folder("DiegeticScreen")({
			Compose.show(Compose.formula(function(Callback)
				-- upvalues: IsRetainScene (copy), CellResult (copy)
				return IsRetainScene or Callback(CellResult)
			end), function()
				-- upvalues: Host (upval), Compose (upval), DiegeticScreenRequiresWorkspace (copy), SceneNodes (copy), CellResult (copy), Session (copy)
				return Host.Folder("OwnedWorld")({
					Compose.portal(DiegeticScreenRequiresWorkspace, SceneNodes),
					Compose.show(CellResult, Session)
				})
			end)
		})
		Compose.watch(function(Callback)
			-- upvalues: p3 (copy), CellResult2 (copy), CellResult (copy), CellResult1 (copy), release (copy), p1 (upval), CurrentCamera (ref), DiegeticScreenRequiresWorkspace (copy), NewResult (ref), DiegeticScreenRequiresGuiService (copy), TypesEnum (upval), NewTypesVector (ref), TypesVector2 (upval)
			if not Callback(p3.isPresented) then
				CellResult2:set(0)
				
				if CellResult:peek() and not CellResult1:peek() then
					release()
				end
				return
			elseif not CellResult:peek() then
				local UserInputService = p1.config.services.UserInputService
				
				if UserInputService and UserInputService.VREnabled then
					release()
					p3.isPresented:set(false)
					
					if p3.onUnavailable then
						p3.onUnavailable("The spatial transition is not available in VR yet")
					end
					return
				else
					CurrentCamera = DiegeticScreenRequiresWorkspace.CurrentCamera
					
					if CurrentCamera then
						NewResult = DiegeticScreenRequiresGuiService:GetInsetArea(TypesEnum.ScreenInsets.None)
						NewTypesVector = TypesVector2.new(NewResult.Width, NewResult.Height)
						
						if NewTypesVector.X > 1 and NewTypesVector.Y > 1 then
							CellResult:set(true)
							
							return
						end
						release()
						p3.isPresented:set(false)
						
						if p3.onUnavailable then
							p3.onUnavailable("The viewport is not ready")
						end
						return
					else
						release()
						p3.isPresented:set(false)
						
						if p3.onUnavailable then
							p3.onUnavailable("The current camera is unavailable")
						end
						return
					end
				end
			elseif CellResult1:peek() then
				CellResult2:set(1)
			end
		end)
		Compose.watch(function(Callback)
			-- upvalues: CellResult3 (copy), CellResult5 (copy), CellResult (copy), CellResult1 (copy), Flag1 (ref), Parent (ref), DiegeticScreenRequiresWorkspace (copy), Cameras (copy), p3 (copy), addLayer (copy), p1 (upval), ownedLayer (copy), Compose (upval), v3 (ref), Runtime (upval), SchedulerResult (copy), Flag (ref), transfer (copy)
			local CallbackResult = Callback(CellResult3)
			local CallbackResult1 = Callback(CellResult5)
			
			if not Callback(CellResult) or not CallbackResult or not CallbackResult1 or CellResult1:peek() then return end
			if not Flag1 then
				local Parent1 = assert(Parent)
				
				for _, Camera in DiegeticScreenRequiresWorkspace:GetChildren() do
					if Camera:IsA("Camera") then
						table.insert(Cameras, Camera)
						Camera.Parent = Parent1
					end
				end
				Flag1 = true
			end
			DiegeticScreenRequiresWorkspace.CurrentCamera = CallbackResult
			
			if not Callback(CallbackResult1) then return end
			for ScreenGui, layer in p3.layers do
				addLayer(layer)
			end
			local List = {}
			
			for ScreenGui in p1.overlayHosts do
				if ownedLayer(ScreenGui) and ScreenGui:IsA("ScreenGui") then
					table.insert(List, ScreenGui)
				end
			end
			for _, value in List do
				addLayer(value)
			end
			local t = {}
			
			for _, layer1 in p3.layers do
				local Parent2 = layer1.Parent
				
				if Parent2 and not t[Parent2] then
					t[Parent2] = true
					Compose.withOwner(assert(v3), function()
						-- upvalues: Runtime (upval), Parent2 (copy), SchedulerResult (upval), Flag (upval), ownedLayer (upval), addLayer (upval)
						Runtime.connect(Parent2, "ChildAdded", function(ScreenGui)
							-- upvalues: SchedulerResult (upval), Flag (upval), ownedLayer (upval), addLayer (upval)
							if ScreenGui:IsA("ScreenGui") then
								SchedulerResult.after(0, function()
									-- upvalues: Flag (upval), ownedLayer (upval), ScreenGui (copy), addLayer (upval)
									if Flag and ownedLayer(ScreenGui) then
										addLayer(ScreenGui)
									end
								end)
							end
						end)
					end)
				end
			end
			transfer()
		end)
		Compose.watch(function(Callback)
			-- upvalues: ReducedResult (copy), CellResult2 (copy), SpringResult (copy), Object (ref), p3 (copy), CellResult1 (copy), release (copy)
			local CallbackResult = if ReducedResult(Callback) then Callback(CellResult2) else Callback(SpringResult)
			Object:SetAttribute("FacetDiegeticProgress", CallbackResult)
			
			if not Callback(p3.isPresented) and Callback(CellResult1) and CallbackResult == 0 then
				release()
			end
		end)
		local CurrentCamera1 = Runtime.observe(DiegeticScreenRequiresWorkspace, "CurrentCamera")
		Compose.watch(function(Callback)
			-- upvalues: CurrentCamera1 (copy), Flag1 (ref), CellResult3 (copy), release (copy), p3 (copy)
			local CallbackResult = Callback(CurrentCamera1)
			
			if Flag1 and CallbackResult ~= CellResult3:peek() then
				release()
				p3.isPresented:set(false)
				
				if p3.onUnavailable then
					p3.onUnavailable("The camera owner changed")
				end
			end
		end)
		Compose.cleanup(release)
		
		return Object
	end)
end