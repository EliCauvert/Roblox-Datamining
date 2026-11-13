local _ = require("./types")
local _ = require("./engine_types")
local CoreModule = require("../vendor/compose/core")
local MediaReadinessModule = require("./media_readiness")
local _ = require("./control_types")
local _ = require("./media_props")
local _ = require("./media_shared")

return function(p1, p2, p3)
	-- upvalues: CoreModule (copy), MediaReadinessModule (copy)
	local Host = p1.Host
	local Runtime = p1.runtime
	local Compose = p1.Compose
	local Types = p1.types
	local TypesUDim2 = Types.UDim2
	local BindFunction = p3.bind
	local Frames = Runtime.host.frames
	local List = {}
	local OnFrameResult = nil
	
	local function enqueue(Value, p4)
		-- upvalues: List (copy), Compose (copy), OnFrameResult (ref), Frames (copy)
		table.insert(List, Value)
		Compose.withOwner(p4, function()
			-- upvalues: Compose (upval), List (upval), Value (copy), OnFrameResult (upval)
			Compose.cleanup(function()
				-- upvalues: List (upval), Value (upval), OnFrameResult (upval)
				local FoundIndex: number? = table.find(List, Value)
				
				if FoundIndex then
					table.remove(List, FoundIndex)
				end
				if #List == 0 and OnFrameResult then
					OnFrameResult()
					OnFrameResult = nil
				end
			end)
		end)
		
		if OnFrameResult == nil and Frames then
			OnFrameResult = Frames.onFrame(function()
				-- upvalues: List (upval), OnFrameResult (upval)
				local Removed: () -> () = table.remove(List, 1)
				
				if Removed then
					Removed()
				end
				if #List == 0 and OnFrameResult then
					OnFrameResult()
					OnFrameResult = nil
				end
			end)
		end
	end
	
	local function stageLive(Panel, CellResult)
		-- upvalues: Compose (copy), p1 (copy), Frames (copy), CoreModule (upval), Runtime (copy)
		local v1 = assert(Compose.currentOwner())
		local CellResult1 = Compose.cell(false)
		local CellResult2 = Compose.cell(true)
		local CellResult3 = Compose.cell(true)
		local AbsolutePositionResult = p1.observe.AbsolutePosition(Panel)
		local AbsoluteSizeResult = p1.observe.AbsoluteSize(Panel)
		local v2 = nil
		local v3 = nil
		
		local function track(p4)
			-- upvalues: p1 (upval), Compose (upval), Frames (upval), CellResult1 (copy), AbsolutePositionResult (copy), AbsoluteSizeResult (copy), CellResult2 (copy), CellResult3 (copy)
			local CanvasPositionResult = p1.observe.CanvasPosition(p4)
			local AbsolutePositionResult1 = p1.observe.AbsolutePosition(p4)
			local AbsoluteWindowSizeResult = p1.observe.AbsoluteWindowSize(p4)
			local PeekResult = CanvasPositionResult:peek()
			local NowResult = -1e999
			local OnFrameResult: (() -> ())? = nil
			
			local function halt()
				-- upvalues: OnFrameResult (ref)
				if OnFrameResult then
					OnFrameResult()
					OnFrameResult = nil
				end
			end
			
			Compose.watch(function(Callback)
				-- upvalues: CanvasPositionResult (copy), Frames (upval), PeekResult (ref), NowResult (ref), CellResult1 (upval), OnFrameResult (ref)
				local CallbackResult = Callback(CanvasPositionResult)
				
				if CallbackResult == PeekResult or Frames == nil then return end
				PeekResult = CallbackResult
				NowResult = Frames.now()
				CellResult1:set(true)
				
				if OnFrameResult == nil then
					OnFrameResult = Frames.onFrame(function()
						-- upvalues: Frames (copy), NowResult (upval), OnFrameResult (upval), CellResult1 (upval)
						if Frames.now() - NowResult >= 0.15 then
							if OnFrameResult then
								OnFrameResult()
								OnFrameResult = nil
							end
							CellResult1:set(false)
						end
					end)
				end
			end)
			Compose.cleanup(halt)
			Compose.watch(function(Callback)
				-- upvalues: AbsolutePositionResult (upval), AbsoluteSizeResult (upval), AbsolutePositionResult1 (copy), AbsoluteWindowSizeResult (copy), CellResult2 (upval), CellResult3 (upval)
				local CallbackResult = Callback(AbsolutePositionResult)
				local CallbackResult1 = Callback(AbsoluteSizeResult)
				local CallbackResult2 = Callback(AbsolutePositionResult1)
				local CallbackResult3 = Callback(AbsoluteWindowSizeResult)
				
				if CallbackResult1.X <= 0 or CallbackResult1.Y <= 0 or CallbackResult3.X <= 0 or CallbackResult3.Y <= 0 then
					CellResult2:set(false)
					CellResult3:set(false)
					
					return
				end
				local XRatio = CallbackResult3.X / 2
				local YRatio = CallbackResult3.Y / 2
				CellResult3:set(CallbackResult2.X - XRatio < CallbackResult.X + CallbackResult1.X and (CallbackResult.X < CallbackResult2.X + CallbackResult3.X + XRatio and CallbackResult2.Y - YRatio < CallbackResult.Y + CallbackResult1.Y) and CallbackResult.Y < CallbackResult2.Y + CallbackResult3.Y + YRatio)
				local SmallestDelta = math.min(CallbackResult.X + CallbackResult1.X, CallbackResult2.X + CallbackResult3.X) - math.max(CallbackResult.X, CallbackResult2.X)
				local SmallestDelta1 = math.min(CallbackResult.Y + CallbackResult1.Y, CallbackResult2.Y + CallbackResult3.Y) - math.max(CallbackResult.Y, CallbackResult2.Y)
				
				if SmallestDelta <= 0 or SmallestDelta1 <= 0 then
					CellResult2:set(false)
					
					return
				else
					CellResult2:set(SmallestDelta * SmallestDelta1 / (CallbackResult1.X * CallbackResult1.Y) >= 0.5 or CallbackResult3.Y * 0.5 <= SmallestDelta1)
				end
			end)
		end
		
		local function locate()
			-- upvalues: CoreModule (upval), v1 (copy), Panel (copy), v2 (ref), v3 (ref), CellResult1 (copy), CellResult2 (copy), CellResult3 (copy), Compose (upval), track (copy)
			if CoreModule.owner.isDisposed(v1) then return end
			local v4 = nil
			local Parent = Panel.Parent
			while Parent do
				if Parent:IsA("ScrollingFrame") then
					v4 = Parent
					break
				end
				if Parent:IsA("LayerCollector") then break end
				Parent = Parent.Parent
			end
			if v4 == v2 and v3 ~= nil then return end
			v2 = v4
			
			if v3 then
				CoreModule.owner.dispose(v3)
				v3 = nil
			end
			CellResult1:set(false)
			CellResult2:set(true)
			CellResult3:set(true)
			
			if v4 then
				local Child = CoreModule.owner.createChild(v1)
				v3 = Child
				Compose.withOwner(Child, function()
					-- upvalues: track (upval), v4 (ref)
					track(v4)
				end)
			end
		end
		
		Runtime.connect(Panel, "AncestryChanged", locate)
		locate()
		
		return Compose.formula(function(Callback): boolean
			-- upvalues: CellResult (copy), CellResult2 (copy), CellResult1 (copy)
			return Callback(CellResult) and (Callback(CellResult2) and not Callback(CellResult1))
		end), Compose.formula(function(Callback)
			-- upvalues: CellResult (copy), CellResult3 (copy)
			return Callback(CellResult) and Callback(CellResult3)
		end)
	end
	
	p2.Stage = p1.construct("Stage", function(Image)
		-- upvalues: Host (copy), BindFunction (copy), Types (copy), p1 (copy), TypesUDim2 (copy), Compose (copy), Runtime (copy), stageLive (copy), CoreModule (upval), Frames (copy), enqueue (copy), MediaReadinessModule (upval)
		local v4 = Host.WorldModel("World")({})
		local IsInstance = Image.camera and (typeof(Image.camera) == "Instance" or type(Image.camera) == "table" and (type(Image.camera.IsA) == "function" and Image.camera:IsA("Camera")))
		local Camera = if IsInstance then Image.camera else Host.Camera("Camera")({
			FieldOfView = BindFunction(Image.fieldOfView, 45),
			CFrame = Image.camera or Types.CFrame.lookAt(Types.Vector3.new(0, 2, 8), Types.Vector3.new(0, 0, 0))
		})
		local PropsResult = p1.props(Image, { "content", "camera", "fieldOfView", "lazy" }, {
			Size = TypesUDim2.fromOffset(240, 180),
			Ambient = Types.Color3.new(1, 1, 1),
			LightColor = Types.Color3.new(1, 1, 1),
			CurrentCamera = Compose.static(Camera),
			v4,
			if IsInstance then nil else Camera
		})
		local Panel = p1.styled(Host.ViewportFrame(PropsResult), "panel")
		local CurrentCamera = Panel.CurrentCamera
		local CurrentCamera1 = if Compose.isValue(PropsResult.CurrentCamera) or type(PropsResult.CurrentCamera) == "function" then PropsResult.CurrentCamera else function()
			-- upvalues: CurrentCamera (copy)
			return CurrentCamera
		end
		local CellResult = Compose.cell(0)
		local CellResult1 = Compose.cell(true)
		Runtime.connect(Panel, "AncestryChanged", function()
			-- upvalues: CellResult (copy)
			CellResult:set(CellResult:peek() + 1)
		end)
		Compose.watch(function(Callback: (any) -> ())
			-- upvalues: CellResult (copy), Panel (copy), p1 (upval), Compose (upval), CellResult1 (copy)
			Callback(CellResult)
			local List = {}
			local Parent = Panel
			while Parent do
				if Parent:IsA("GuiObject") then
					table.insert(List, p1.observe.Visible(Parent))
				elseif Parent:IsA("LayerCollector") then
					table.insert(List, p1.observe.Enabled(Parent))
					break
				end
				Parent = Parent.Parent
			end
			Compose.watch(function(Callback)
				-- upvalues: List (copy), CellResult1 (upval)
				for _, value in List do
					if not Callback(value) then
						CellResult1:set(false)
						
						return
					end
				end
				CellResult1:set(true)
			end)
		end)
		Runtime.decorate(Panel, {
			CurrentCamera = function(Callback)
				-- upvalues: CellResult1 (copy), p1 (upval), CurrentCamera1 (copy)
				return if Callback(CellResult1) then p1.read(CurrentCamera1, Callback) else nil
			end
		})
		local StageLiveResult, StageLiveResult2 = stageLive(Panel, CellResult1)
		Panel:SetAttribute("FacetLive", StageLiveResult:peek())
		Compose.watch(function(Callback)
			-- upvalues: Panel (copy), StageLiveResult (copy)
			Panel:SetAttribute("FacetLive", Callback(StageLiveResult))
		end)
		
		if Image.content then
			local ContentFunction = Image.content
			local v5 = assert(Compose.currentOwner())
			local Flag = false
			
			local function build()
				-- upvalues: Flag (ref), CoreModule (upval), v5 (copy), Compose (upval), ContentFunction (copy), Runtime (upval), v4 (copy), StageLiveResult (copy), Panel (copy)
				if not Flag and not CoreModule.owner.isDisposed(v5) then
					Flag = true
					Compose.withOwner(v5, function()
						-- upvalues: ContentFunction (upval), Runtime (upval), v4 (upval), StageLiveResult (upval), Compose (upval)
						local ContentResult = ContentFunction(Runtime, v4, StageLiveResult)
						
						if type(ContentResult) == "function" then
							Compose.cleanup(ContentResult)
						end
					end)
					Panel:SetAttribute("FacetBuilt", true)
					
					return
				end
			end
			
			Panel:SetAttribute("FacetBuilt", false)
			
			if Image.lazy == true and Frames ~= nil then
				local Flag1 = false
				
				local function attempt()
					-- upvalues: Flag1 (ref), CoreModule (upval), v5 (copy), StageLiveResult2 (copy), build (copy)
					Flag1 = false
					
					if not CoreModule.owner.isDisposed(v5) and StageLiveResult2:peek() then
						build()
					end
				end
				
				Compose.watch(function(Callback)
					-- upvalues: StageLiveResult2 (copy), Flag (ref), Flag1 (ref), enqueue (upval), attempt (copy), v5 (copy)
					if Callback(StageLiveResult2) and not Flag and not Flag1 then
						Flag1 = true
						enqueue(attempt, v5)
					end
				end)
			else
				build()
			end
		end
		if Image.LightDirection == nil then
			local CurrentCamera2 = Runtime.observe(Panel, "CurrentCamera")
			Compose.watch(function(Callback)
				-- upvalues: CurrentCamera2 (copy), Camera (copy), p1 (upval), Runtime (upval), Panel (copy), Types (upval)
				local v6 = p1.observe.CFrame(Callback(CurrentCamera2) or Camera)
				Runtime.decorate(Panel, {
					LightDirection = function(Callback)
						-- upvalues: v6 (copy), Types (upval)
						return (Callback(v6).LookVector + Types.Vector3.new(0, -0.6, 0)).Unit
					end
				})
			end)
		end
		MediaReadinessModule(p1, Panel, Image.ImageTransparency)
		
		return Panel
	end)
end