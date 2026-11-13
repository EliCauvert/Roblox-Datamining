local _ = require("./types")
local _ = require("./zoom_travel_types")
local ZoomGeometryModule = require("./zoom_geometry")
local MotionModule = require("./motion")
local ReducedFunction = MotionModule.reduced
local DragSessionModule = require("./drag_session")
local GestureServiceModule = require("./gesture_service")
local ScrollLockModule = require("./scroll_lock")
local ActivationModule = require("./activation")
local _ = require("./control_types")
local _ = require("./zoom_travel_props")

return function(p1, p2)
	-- upvalues: ReducedFunction (copy), MotionModule (copy), DragSessionModule (copy), GestureServiceModule (copy), ZoomGeometryModule (copy), ScrollLockModule (copy), ActivationModule (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	p2.ZoomView = p1.construct("ZoomView", function(p3)
		-- upvalues: Compose (copy), ReducedFunction (upval), p1 (copy), Runtime (copy), MotionModule (upval), TypesVector2 (copy), DragSessionModule (upval), GestureServiceModule (upval), Host (copy), TypesUDim2 (copy), TypesEnum (copy), ZoomGeometryModule (upval), ScrollLockModule (upval), ActivationModule (upval)
		assert(type(p3.content) == "function", "Facet UI.ZoomView: content is required")
		
		local function positive(X: number): boolean
			return X > 0 and X < 1e999
		end
		
		local MaxZoom = p3.maxZoom or 4
		assert(MaxZoom > 0 and MaxZoom < 1e999, "Facet UI.ZoomView: maxZoom must be positive and finite")
		local v1 = true
		
		if p3.minZoom ~= nil then
			local MinZoom: number = p3.minZoom
			v1 = MinZoom > 0 and MinZoom < 1e999
		end
		assert(v1, "Facet UI.ZoomView: minZoom must be positive and finite")
		assert(p3.minZoom == nil or p3.minZoom <= MaxZoom, "Facet UI.ZoomView: minZoom exceeds maxZoom")
		local v2 = true
		
		if p3.doubleTapZoom ~= nil then
			local DoubleTapZoom: number = p3.doubleTapZoom
			v2 = DoubleTapZoom > 0 and DoubleTapZoom < 1e999
		end
		assert(v2, "Facet UI.ZoomView: doubleTapZoom must be positive and finite")
		local Zoom = p3.zoom or Compose.cell(1)
		local PeekResult: number = Zoom:peek()
		assert(PeekResult > 0 and PeekResult < 1e999, "Facet UI.ZoomView: zoom must be positive and finite")
		local ReducedResult = ReducedFunction(p1)
		local RampResult = Runtime.ramp(Zoom:peek(), { ease = p1.motionEase("zoom") })
		local RampResult1 = MotionModule.forValue(p1, TypesVector2.zero).ramp(TypesVector2.zero, { ease = p1.motionEase("zoom") })
		local DragSessionModuleResult = DragSessionModule(p1)
		local GestureServiceModuleResult = GestureServiceModule(p1)
		local Tbl = {}
		local Tbl1 = {}
		local Source = nil
		local ScrollingFrameResult = nil
		local Zero = TypesVector2.zero
		local Zero1 = TypesVector2.zero
		local PeekResult1 = Zoom:peek()
		local PeekResult11 = nil
		local Flag = false
		local Zero2 = TypesVector2.zero
		local Flag1 = false
		local v3 = nil
		local Flag2 = false
		local Flag3 = false
		local v4 = nil
		local Zero3 = TypesVector2.zero
		local UserInputService = p1.config.userInputService
		local GuiService = p1.config.guiService
		local EffectiveInputResult = p1.effectiveInput()
		
		local function _()
			-- upvalues: p1 (upval), p3 (copy)
			local ReadResult = p1.read(p3.contentSize)
			local X: number = ReadResult.X
			local IsXBelow: boolean = X > 0 and X < 1e999
			
			if IsXBelow then
				local Y: number = ReadResult.Y
				IsXBelow = Y > 0 and Y < 1e999
			end
			assert(IsXBelow, "Facet UI.ZoomView: contentSize must have positive finite axes")
			
			return ReadResult
		end
		
		local ReadResult = p1.read(p3.contentSize)
		local X: number = ReadResult.X
		local IsXBelow: boolean = X > 0 and X < 1e999
		
		if IsXBelow then
			local Y: number = ReadResult.Y
			IsXBelow = Y > 0 and Y < 1e999
		end
		assert(IsXBelow, "Facet UI.ZoomView: contentSize must have positive finite axes")
		local ZoomScale = Host.UIScale({ Name = "ZoomScale", Scale = PeekResult1 })
		local ZoomContent = Host.Frame({
			Name = "ZoomContent",
			BackgroundTransparency = 1,
			Size = function(p4)
				-- upvalues: p1 (upval), p3 (copy), TypesUDim2 (upval)
				local ReadResult = p1.read(p3.contentSize, p4)
				
				return TypesUDim2.fromOffset(ReadResult.X, ReadResult.Y)
			end,
			ZoomScale,
			(p3.content())
		})
		local PropsResult = p1.props(p3, {
			"contentSize", "content", "zoom", "focus", "preferredSelection", "minZoom",
			"maxZoom", "doubleTapZoom", "enabled", "controls", "followTransition"
		}, {
			Name = "ZoomView",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			Selectable = true,
			Active = true,
			ClipsDescendants = true,
			Size = TypesUDim2.fromScale(1, 1),
			AutomaticCanvasSize = TypesEnum.AutomaticSize.None,
			ScrollingDirection = TypesEnum.ScrollingDirection.XY,
			ElasticBehavior = TypesEnum.ElasticBehavior.Never
		})
		
		function PropsResult.ScrollingEnabled(p4): boolean
			-- upvalues: p1 (upval), p3 (copy)
			return p1.read(p3.enabled, p4) ~= false and p1.read(p3.ScrollingEnabled, p4) ~= false
		end
		
		PropsResult[#PropsResult + 1] = ZoomContent
		ScrollingFrameResult = Host.ScrollingFrame(PropsResult)
		ScrollingFrameResult:SetAttribute("FacetSelectionOwner", true)
		local LayoutUnitResult = p1.layoutUnit(ScrollingFrameResult)
		
		local _ = function()
			-- upvalues: ScrollingFrameResult (ref), LayoutUnitResult (copy)
			return ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
		end
		
		local function blocked(): boolean
			-- upvalues: Tbl (copy), GestureServiceModuleResult (copy), ScrollingFrameResult (ref), Tbl1 (copy), DragSessionModuleResult (copy), Source (ref)
			for i in Tbl do
				local GetResult = GestureServiceModuleResult.get(i)
				
				if GetResult and GetResult.owner ~= ScrollingFrameResult and GetResult.owner:IsDescendantOf(ScrollingFrameResult) then
					Tbl1[i] = true
				end
				if GetResult and Tbl1[i] and (GetResult.kind == "pending" or GetResult.kind == "drag") then
					return true
				end
			end
			local PeekResult = DragSessionModuleResult.state:peek()
			
			if PeekResult and (PeekResult.source == ScrollingFrameResult or PeekResult.source:IsDescendantOf(ScrollingFrameResult)) then
				Source = PeekResult.source
			end
			if not PeekResult then
				Source = nil
			end
			return PeekResult ~= nil and PeekResult.source == Source
		end
		
		local _ = function(): boolean
			-- upvalues: p1 (upval), p3 (copy), ScrollingFrameResult (ref), blocked (copy)
			return p1.read(p3.enabled) ~= false and (ScrollingFrameResult.Visible and not blocked())
		end
		
		local _ = function()
			-- upvalues: p1 (upval), p3 (copy), ScrollingFrameResult (ref), LayoutUnitResult (copy), ZoomGeometryModule (upval), MaxZoom (copy)
			local ReadResult = p1.read(p3.contentSize)
			local X: number = ReadResult.X
			local IsXBelow: boolean = X > 0 and X < 1e999
			
			if IsXBelow then
				local Y: number = ReadResult.Y
				IsXBelow = Y > 0 and Y < 1e999
			end
			assert(IsXBelow, "Facet UI.ZoomView: contentSize must have positive finite axes")
			local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
			
			return math.min(p3.minZoom or ZoomGeometryModule.fit(AbsoluteWindowSizeRatio.X, AbsoluteWindowSizeRatio.Y, ReadResult.X, ReadResult.Y), MaxZoom), MaxZoom
		end
		
		local _ = function(Value: number): number
			-- upvalues: p1 (upval), p3 (copy), ScrollingFrameResult (ref), LayoutUnitResult (copy), ZoomGeometryModule (upval), MaxZoom (copy)
			local ReadResult = p1.read(p3.contentSize)
			local X: number = ReadResult.X
			local IsXBelow: boolean = X > 0 and X < 1e999
			
			if IsXBelow then
				local Y: number = ReadResult.Y
				IsXBelow = Y > 0 and Y < 1e999
			end
			assert(IsXBelow, "Facet UI.ZoomView: contentSize must have positive finite axes")
			local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
			
			return (math.clamp(Value, math.max(math.min(p3.minZoom or ZoomGeometryModule.fit(AbsoluteWindowSizeRatio.X, AbsoluteWindowSizeRatio.Y, ReadResult.X, ReadResult.Y), MaxZoom), 0.001), MaxZoom))
		end
		
		local function capture(AbsolutePositionRatio)
			-- upvalues: RampResult1 (copy), TypesVector2 (upval), ScrollingFrameResult (ref), LayoutUnitResult (copy), p1 (upval), p3 (copy), Zero1 (ref), Zero (ref), ZoomGeometryModule (upval), PeekResult1 (ref)
			RampResult1.retarget(TypesVector2.zero, 0)
			local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
			local ReadResult = p1.read(p3.contentSize)
			local X: number = ReadResult.X
			local IsXBelow: boolean = X > 0 and X < 1e999
			
			if IsXBelow then
				local Y: number = ReadResult.Y
				IsXBelow = Y > 0 and Y < 1e999
			end
			assert(IsXBelow, "Facet UI.ZoomView: contentSize must have positive finite axes")
			Zero1 = AbsolutePositionRatio or AbsoluteWindowSizeRatio / 2
			Zero = TypesVector2.new(ZoomGeometryModule.point(PeekResult1, ScrollingFrameResult.CanvasPosition.X, math.max(0, (AbsoluteWindowSizeRatio.X - ReadResult.X * PeekResult1) / 2), Zero1.X), ZoomGeometryModule.point(PeekResult1, ScrollingFrameResult.CanvasPosition.Y, math.max(0, (AbsoluteWindowSizeRatio.Y - ReadResult.Y * PeekResult1) / 2), Zero1.Y))
		end
		
		local function focusAt(NewResult)
			-- upvalues: ScrollingFrameResult (ref), LayoutUnitResult (copy), p1 (upval), p3 (copy), Zero (ref), Zero1 (ref), ZoomGeometryModule (upval), PeekResult1 (ref), RampResult1 (copy), TypesVector2 (upval)
			local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
			local ReadResult = p1.read(p3.contentSize)
			local X: number = ReadResult.X
			local IsXBelow: boolean = X > 0 and X < 1e999
			
			if IsXBelow then
				local Y: number = ReadResult.Y
				IsXBelow = Y > 0 and Y < 1e999
			end
			assert(IsXBelow, "Facet UI.ZoomView: contentSize must have positive finite axes")
			Zero = NewResult
			Zero1 = AbsoluteWindowSizeRatio / 2
			RampResult1.retarget(TypesVector2.new(ZoomGeometryModule.axis(AbsoluteWindowSizeRatio.X, ReadResult.X, PeekResult1, Zero.X, Zero1.X), (ZoomGeometryModule.axis(AbsoluteWindowSizeRatio.Y, ReadResult.Y, PeekResult1, Zero.Y, Zero1.Y))) - ScrollingFrameResult.CanvasPosition, 0)
		end
		
		local Input = nil
		local Zero4 = TypesVector2.zero
		local Zero5 = TypesVector2.zero
		local Flag4 = false
		
		local function moveMouse(NewResult)
			-- upvalues: p1 (upval), p3 (copy), ScrollingFrameResult (ref), blocked (copy), Zero4 (ref), LayoutUnitResult (copy), Flag4 (ref), RampResult (copy), PeekResult1 (ref), Zero5 (ref), TypesVector2 (upval), capture (copy)
			if p1.read(p3.enabled) == false or (not ScrollingFrameResult.Visible or blocked()) then return end
			local NewResultRatio = (NewResult - Zero4) / math.max(LayoutUnitResult:peek(), 0.001)
			
			if not Flag4 and NewResultRatio.Magnitude < 6 then return end
			Flag4 = true
			RampResult.retarget(PeekResult1, 0)
			local ReadResult = p1.read(p3.contentSize)
			local X: number = ReadResult.X
			local IsXBelow: boolean = X > 0 and X < 1e999
			
			if IsXBelow then
				local Y: number = ReadResult.Y
				IsXBelow = Y > 0 and Y < 1e999
			end
			assert(IsXBelow, "Facet UI.ZoomView: contentSize must have positive finite axes")
			local ScaledReadResult = ReadResult * PeekResult1
			local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
			local ZeroDelta = Zero5 - NewResultRatio
			ScrollingFrameResult.CanvasPosition = TypesVector2.new(math.clamp(ZeroDelta.X, 0, (math.max(0, ScaledReadResult.X - AbsoluteWindowSizeRatio.X))), (math.clamp(ZeroDelta.Y, 0, (math.max(0, ScaledReadResult.Y - AbsoluteWindowSizeRatio.Y)))))
			capture()
		end
		
		Host.UIDragDetector({
			Name = "ZoomPanDetector",
			DragStyle = TypesEnum.UIDragDetectorDragStyle.TranslatePlane,
			ResponseStyle = TypesEnum.UIDragDetectorResponseStyle.CustomOffset,
			Enabled = function(p4): boolean
				-- upvalues: p1 (upval), p3 (copy), EffectiveInputResult (copy)
				return p1.read(p3.enabled, p4) ~= false and EffectiveInputResult(p4) == "KeyboardAndMouse"
			end,
			DragStart = function(p4)
				-- upvalues: Input (ref), Zero4 (ref), Zero5 (ref), Flag4 (ref), ScrollingFrameResult (ref)
				if Input == nil then
					Zero4 = p4
					Zero5 = ScrollingFrameResult.CanvasPosition
					Flag4 = false
				end
			end,
			DragContinue = function(p4)
				-- upvalues: Input (ref), moveMouse (copy)
				if Input == nil then
					moveMouse(p4)
				end
			end,
			DragEnd = function()
				-- upvalues: Flag4 (ref)
				Flag4 = false
			end
		}).Parent = ScrollingFrameResult
		
		local _ = function()
			-- upvalues: GuiService (copy), TypesVector2 (upval)
			return if GuiService then GuiService:GetGuiInset() else TypesVector2.zero
		end
		
		local _ = function()
			-- upvalues: UserInputService (copy), GuiService (copy), TypesVector2 (upval)
			return if UserInputService then UserInputService:GetMouseLocation() - (if GuiService then GuiService:GetGuiInset() else TypesVector2.zero) else TypesVector2.zero
		end
		
		local HoldAncestorsResult: (() -> ())? = nil
		local NewResult = nil
		local Flag5 = true
		
		local function v75() end
		
		Compose.cleanup(function()
			-- upvalues: HoldAncestorsResult (ref), p1 (upval), p3 (copy), ScrollingFrameResult (ref)
			if HoldAncestorsResult then
				HoldAncestorsResult()
				HoldAncestorsResult = nil
				
				if p1.read(p3.enabled) == false or p1.read(p3.ScrollingEnabled) == false then
					ScrollingFrameResult.ScrollingEnabled = false
				end
			end
		end)
		
		local _ = function(): boolean
			-- upvalues: p1 (upval), p3 (copy), ScrollingFrameResult (ref), GestureServiceModuleResult (copy), DragSessionModuleResult (copy), Source (ref), blocked (copy)
			if p1.read(p3.enabled) == false or not ScrollingFrameResult.Visible then
				return false
			end
			if not GestureServiceModuleResult.claimCamera(ScrollingFrameResult) then
				return not blocked()
			end
			local PeekResult = DragSessionModuleResult.state:peek()
			
			if PeekResult then
				Source = PeekResult.source
			end
			return true
		end
		
		local function request(Value: number, p4, p5): boolean
			-- upvalues: p1 (upval), p3 (copy), ScrollingFrameResult (ref), GestureServiceModuleResult (copy), DragSessionModuleResult (copy), Source (ref), blocked (copy), LayoutUnitResult (copy), ZoomGeometryModule (upval), MaxZoom (copy), v4 (ref), Flag (ref), PeekResult11 (ref), Flag2 (ref), Zoom (copy), RampResult (copy), ReducedResult (copy), RampResult1 (copy), TypesVector2 (upval)
			assert(Value > 0 and Value < 1e999, "Facet UI.ZoomView: zoom must be positive and finite")
			
			if not p5 then
				local Flag1 = nil
				if p1.read(p3.enabled) == false or not ScrollingFrameResult.Visible then
					Flag1 = false
				elseif GestureServiceModuleResult.claimCamera(ScrollingFrameResult) then
					local PeekResult = DragSessionModuleResult.state:peek()
					
					if PeekResult then
						Source = PeekResult.source
					end
					Flag1 = true
				else
					Flag1 = not blocked()
				end
				if not Flag1 then
					return false
				end
			end
			local ReadResult = p1.read(p3.contentSize)
			local X: number = ReadResult.X
			local IsXBelow: boolean = X > 0 and X < 1e999
			
			if IsXBelow then
				local Y: number = ReadResult.Y
				IsXBelow = Y > 0 and Y < 1e999
			end
			assert(IsXBelow, "Facet UI.ZoomView: contentSize must have positive finite axes")
			local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
			local ClampedValue = math.clamp(Value, math.max(math.min(p3.minZoom or ZoomGeometryModule.fit(AbsoluteWindowSizeRatio.X, AbsoluteWindowSizeRatio.Y, ReadResult.X, ReadResult.Y), MaxZoom), 0.001), MaxZoom)
			
			if blocked() then
				v4 = ClampedValue
				Flag = false
				PeekResult11 = nil
				ScrollingFrameResult:ResetScrollVelocity()
			end
			Flag2 = true
			Zoom:set(ClampedValue)
			Flag2 = false
			RampResult.retarget(ClampedValue, if p4 or ReducedResult() then 0 else p1.metric("motion.durations.zoom"))
			RampResult1.retarget(TypesVector2.zero, if p4 or ReducedResult() then 0 else p1.metric("motion.durations.zoom"))
			
			return true
		end
		
		local function fit()
			-- upvalues: p1 (upval), p3 (copy), ScrollingFrameResult (ref), GestureServiceModuleResult (copy), DragSessionModuleResult (copy), Source (ref), blocked (copy), LayoutUnitResult (copy), focusAt (copy), request (copy), ZoomGeometryModule (upval)
			local Flag = nil
			if p1.read(p3.enabled) == false or not ScrollingFrameResult.Visible then
				Flag = false
			elseif GestureServiceModuleResult.claimCamera(ScrollingFrameResult) then
				local PeekResult = DragSessionModuleResult.state:peek()
				
				if PeekResult then
					Source = PeekResult.source
				end
				Flag = true
			else
				Flag = not blocked()
			end
			if not Flag then
				return false
			end
			local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
			local ReadResult: number = p1.read(p3.contentSize)
			local X: number = ReadResult.X
			local IsXBelow: boolean = X > 0 and X < 1e999
			
			if IsXBelow then
				local Y: number = ReadResult.Y
				IsXBelow = Y > 0 and Y < 1e999
			end
			assert(IsXBelow, "Facet UI.ZoomView: contentSize must have positive finite axes")
			
			if AbsoluteWindowSizeRatio.X <= 0 or AbsoluteWindowSizeRatio.Y <= 0 then
				return false
			else
				focusAt(ReadResult / 2)
				
				return (request(ZoomGeometryModule.fit(AbsoluteWindowSizeRatio.X, AbsoluteWindowSizeRatio.Y, ReadResult.X, ReadResult.Y), nil, true))
			end
		end
		
		local function zoomTo(Vector)
			-- upvalues: p1 (upval), p3 (copy), ScrollingFrameResult (ref), GestureServiceModuleResult (copy), DragSessionModuleResult (copy), Source (ref), blocked (copy), LayoutUnitResult (copy), ZoomGeometryModule (upval), focusAt (copy), TypesVector2 (upval), request (copy)
			local Flag = nil
			if p1.read(p3.enabled) == false or not ScrollingFrameResult.Visible then
				Flag = false
			elseif GestureServiceModuleResult.claimCamera(ScrollingFrameResult) then
				local PeekResult = DragSessionModuleResult.state:peek()
				
				if PeekResult then
					Source = PeekResult.source
				end
				Flag = true
			else
				Flag = not blocked()
			end
			if not Flag then
				return false
			end
			local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
			
			if AbsoluteWindowSizeRatio.X <= 0 or AbsoluteWindowSizeRatio.Y <= 0 then
				return false
			else
				local RectangleResult = ZoomGeometryModule.rectangle(AbsoluteWindowSizeRatio.X, AbsoluteWindowSizeRatio.Y, Vector)
				focusAt(TypesVector2.new(Vector.x + Vector.w / 2, Vector.y + Vector.h / 2))
				
				return (request(RectangleResult, nil, true))
			end
		end
		
		local function zoomAt(p4, p5)
			-- upvalues: p1 (upval), p3 (copy), ScrollingFrameResult (ref), GestureServiceModuleResult (copy), DragSessionModuleResult (copy), Source (ref), blocked (copy), capture (copy), LayoutUnitResult (copy), request (copy)
			local Flag = nil
			if p1.read(p3.enabled) == false or not ScrollingFrameResult.Visible then
				Flag = false
			elseif GestureServiceModuleResult.claimCamera(ScrollingFrameResult) then
				local PeekResult = DragSessionModuleResult.state:peek()
				
				if PeekResult then
					Source = PeekResult.source
				end
				Flag = true
			else
				Flag = not blocked()
			end
			if Flag then
				local PeekResult = DragSessionModuleResult.state:peek()
				local P16 = p5 or PeekResult and (PeekResult.position or (if PeekResult.source:IsA("GuiObject") then PeekResult.source.AbsolutePosition + PeekResult.source.AbsoluteSize / 2 else nil))
				capture(if P16 then (P16 - ScrollingFrameResult.AbsolutePosition) / math.max(LayoutUnitResult:peek(), 0.001) else nil)
				
				return (request(p4, nil, true))
			else
				return false
			end
		end
		
		local _ = function(Amount)
			-- upvalues: p1 (upval), p3 (copy), ScrollingFrameResult (ref), blocked (copy), capture (copy), Zero1 (ref)
			if p1.read(p3.enabled) ~= false and (ScrollingFrameResult.Visible and not blocked()) then
				capture()
				Zero1 -= Amount
				
				return
			end
		end
		
		local _ = function(p4: number)
			-- upvalues: p1 (upval), p3 (copy), ScrollingFrameResult (ref), GestureServiceModuleResult (copy), DragSessionModuleResult (copy), Source (ref), blocked (copy), capture (copy), request (copy), Zoom (copy)
			local Flag = nil
			if p1.read(p3.enabled) == false or not ScrollingFrameResult.Visible then
				Flag = false
			elseif GestureServiceModuleResult.claimCamera(ScrollingFrameResult) then
				local PeekResult = DragSessionModuleResult.state:peek()
				
				if PeekResult then
					Source = PeekResult.source
				end
				Flag = true
			else
				Flag = not blocked()
			end
			if Flag then
				capture()
				request(Zoom:peek() * p1.metric("controls.zoom.stepRatio") ^ p4, nil, true)
				
				return
			end
		end
		
		local Flag6 = false
		local HoldAncestorsResult1: (() -> ())? = nil
		Compose.cleanup(function()
			-- upvalues: HoldAncestorsResult1 (ref), p1 (upval), p3 (copy), ScrollingFrameResult (ref)
			if HoldAncestorsResult1 then
				HoldAncestorsResult1()
				HoldAncestorsResult1 = nil
				
				if p1.read(p3.enabled) == false or p1.read(p3.ScrollingEnabled) == false then
					ScrollingFrameResult.ScrollingEnabled = false
				end
			end
		end)
		local Tbl2 = {}
		local Flag7 = false
		local Flag8 = false
		
		local function restoreButtons()
			-- upvalues: Flag7 (ref), Flag8 (ref), Tbl2 (copy)
			Flag7 = false
			Flag8 = false
			
			for i in Tbl2 do
				i.Active = true
			end
			table.clear(Tbl2)
		end
		
		Runtime.connect(ScrollingFrameResult, "DescendantAdded", function(Button)
			-- upvalues: Flag7 (ref), Tbl2 (copy)
			if Flag7 and Button:IsA("GuiButton") and Button.Active then
				Tbl2[Button] = true
				Button.Active = false
			end
		end)
		Runtime.connect(ScrollingFrameResult, "DescendantRemoving", function(Button)
			-- upvalues: Tbl2 (copy)
			if Button:IsA("GuiButton") and Tbl2[Button] then
				Tbl2[Button] = nil
				Button.Active = true
			end
		end)
		Compose.cleanup(restoreButtons)
		
		local function presentation(): number
			-- upvalues: p3 (copy), ScrollingFrameResult (ref)
			if p3.followTransition ~= true then
				return 1
			end
			local v5 = 1
			local Parent = ScrollingFrameResult.Parent
			while Parent do
				local FacetTransitionZoomAttribute: number = Parent:GetAttribute("FacetTransitionZoom")
				
				if type(FacetTransitionZoomAttribute) == "number" and FacetTransitionZoomAttribute > 0 then
					v5 *= FacetTransitionZoomAttribute
				end
				Parent = Parent.Parent
			end
			return v5
		end
		
		local function render(p4)
			-- upvalues: Flag8 (ref), Flag7 (ref), Tbl2 (copy), v75 (ref), p1 (upval), p3 (copy), Flag6 (ref), HoldAncestorsResult1 (ref), ScrollingFrameResult (ref), v4 (ref), blocked (copy), PeekResult11 (ref), capture (copy), request (copy), Flag (ref), Zero2 (ref), Zoom (copy), RampResult (copy), PeekResult1 (ref), Zero3 (ref), Zero1 (ref), LayoutUnitResult (copy), ZoomGeometryModule (upval), MaxZoom (copy), ReducedResult (copy), Flag1 (ref), Zero (ref), GestureServiceModuleResult (copy), DragSessionModuleResult (copy), Source (ref), Flag2 (ref), RampResult1 (copy), TypesVector2 (upval), v3 (ref), presentation (copy), Flag3 (ref), ZoomScale (copy), ZoomContent (copy), TypesUDim2 (upval)
			if Flag8 then
				Flag7 = false
				Flag8 = false
				
				for i in Tbl2 do
					i.Active = true
				end
				table.clear(Tbl2)
			end
			v75()
			
			if p1.read(p3.enabled) == false then
				Flag6 = false
				
				if HoldAncestorsResult1 then
					HoldAncestorsResult1()
					HoldAncestorsResult1 = nil
					
					if p1.read(p3.enabled) == false or p1.read(p3.ScrollingEnabled) == false then
						ScrollingFrameResult.ScrollingEnabled = false
					end
				end
			end
			if v4 and not blocked() then
				v4 = nil
				local PeekResult2 = PeekResult11
				PeekResult11 = nil
				
				if PeekResult2 then
					capture()
					request(PeekResult2)
				end
			end
			if blocked() and v4 == nil then
				if not Flag then
					Flag = true
					Zero2 = ScrollingFrameResult.CanvasPosition
					PeekResult11 = Zoom:peek()
					RampResult.retarget(PeekResult1, 0)
					ScrollingFrameResult:ResetScrollVelocity()
				end
				ScrollingFrameResult.CanvasPosition = Zero2
				
				return
			else
				if Flag then
					Flag = false
					local PeekResult3 = PeekResult11
					PeekResult11 = nil
					
					if PeekResult3 then
						capture()
						request(PeekResult3)
					end
				end
				if Zero3.Magnitude > 0 then
					local ScaledZero = Zero3 * p1.metric("controls.zoom.panSpeed") * p4
					
					if p1.read(p3.enabled) ~= false and (ScrollingFrameResult.Visible and not blocked()) then
						capture()
						Zero1 -= ScaledZero
					end
				end
				local PeekResult4: number = RampResult.value:peek()
				local ReadResult = p1.read(p3.contentSize)
				local X: number = ReadResult.X
				local IsXBelow: boolean = X > 0 and X < 1e999
				
				if IsXBelow then
					local Y: number = ReadResult.Y
					IsXBelow = Y > 0 and Y < 1e999
				end
				assert(IsXBelow, "Facet UI.ZoomView: contentSize must have positive finite axes")
				local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
				local ClampedValue = math.clamp(PeekResult4, math.max(math.min(p3.minZoom or ZoomGeometryModule.fit(AbsoluteWindowSizeRatio.X, AbsoluteWindowSizeRatio.Y, ReadResult.X, ReadResult.Y), MaxZoom), 0.001), MaxZoom)
				
				if ReducedResult() then
					local V43 = v4 or Zoom:peek()
					local ReadResult1 = p1.read(p3.contentSize)
					local X1: number = ReadResult1.X
					local IsXBelow1: boolean = X1 > 0 and X1 < 1e999
					
					if IsXBelow1 then
						local Y: number = ReadResult1.Y
						IsXBelow1 = Y > 0 and Y < 1e999
					end
					assert(IsXBelow1, "Facet UI.ZoomView: contentSize must have positive finite axes")
					local AbsoluteWindowSizeRatio2 = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
					ClampedValue = math.clamp(V43, math.max(math.min(p3.minZoom or ZoomGeometryModule.fit(AbsoluteWindowSizeRatio2.X, AbsoluteWindowSizeRatio2.Y, ReadResult1.X, ReadResult1.Y), MaxZoom), 0.001), MaxZoom)
				end
				local AbsoluteWindowSizeRatio1 = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
				local ReadResult2: number = p1.read(p3.contentSize)
				local X2: number = ReadResult2.X
				local IsXBelow2: boolean = X2 > 0 and X2 < 1e999
				
				if IsXBelow2 then
					local Y: number = ReadResult2.Y
					IsXBelow2 = Y > 0 and Y < 1e999
				end
				assert(IsXBelow2, "Facet UI.ZoomView: contentSize must have positive finite axes")
				
				if AbsoluteWindowSizeRatio1.X <= 0 or AbsoluteWindowSizeRatio1.Y <= 0 then return end
				if not Flag1 then
					Flag1 = true
					Zero = p1.read(p3.focus) or ReadResult2 / 2
					Zero1 = AbsoluteWindowSizeRatio1 / 2
					local FitResult: number = ZoomGeometryModule.fit(AbsoluteWindowSizeRatio1.X, AbsoluteWindowSizeRatio1.Y, ReadResult2.X, ReadResult2.Y)
					
					if p3.zoom == nil or Zoom:peek() <= FitResult then
						local ReadResult3 = p1.read(p3.contentSize)
						local X3: number = ReadResult3.X
						local IsXBelow3: boolean = X3 > 0 and X3 < 1e999
						
						if IsXBelow3 then
							local Y: number = ReadResult3.Y
							IsXBelow3 = Y > 0 and Y < 1e999
						end
						assert(IsXBelow3, "Facet UI.ZoomView: contentSize must have positive finite axes")
						local AbsoluteWindowSizeRatio3 = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
						ClampedValue = math.clamp(FitResult, math.max(math.min(p3.minZoom or ZoomGeometryModule.fit(AbsoluteWindowSizeRatio3.X, AbsoluteWindowSizeRatio3.Y, ReadResult3.X, ReadResult3.Y), MaxZoom), 0.001), MaxZoom)
						assert(ClampedValue > 0 and ClampedValue < 1e999, "Facet UI.ZoomView: zoom must be positive and finite")
						local Flag4 = nil
						
						if p1.read(p3.enabled) == false or not ScrollingFrameResult.Visible then
							Flag4 = false
						elseif GestureServiceModuleResult.claimCamera(ScrollingFrameResult) then
							local PeekResult6 = DragSessionModuleResult.state:peek()
							
							if PeekResult6 then
								Source = PeekResult6.source
							end
							Flag4 = true
						else
							Flag4 = not blocked()
						end
						if Flag4 then
							local ReadResult4 = p1.read(p3.contentSize)
							local X4: number = ReadResult4.X
							local IsXBelow4: boolean = X4 > 0 and X4 < 1e999
							
							if IsXBelow4 then
								local Y: number = ReadResult4.Y
								IsXBelow4 = Y > 0 and Y < 1e999
							end
							assert(IsXBelow4, "Facet UI.ZoomView: contentSize must have positive finite axes")
							local AbsoluteWindowSizeRatio11 = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
							local ClampedValue1 = math.clamp(ClampedValue, math.max(math.min(p3.minZoom or ZoomGeometryModule.fit(AbsoluteWindowSizeRatio11.X, AbsoluteWindowSizeRatio11.Y, ReadResult4.X, ReadResult4.Y), MaxZoom), 0.001), MaxZoom)
							
							if blocked() then
								v4 = ClampedValue1
								Flag = false
								PeekResult11 = nil
								ScrollingFrameResult:ResetScrollVelocity()
							end
							Flag2 = true
							Zoom:set(ClampedValue1)
							Flag2 = false
							RampResult.retarget(ClampedValue1, 0)
							RampResult1.retarget(TypesVector2.zero, 0)
						end
					end
				end
				local AbsoluteWindowSizeRatio4: number = v3
				
				if AbsoluteWindowSizeRatio4 and AbsoluteWindowSizeRatio4 ~= AbsoluteWindowSizeRatio1 and not Flag6 and Zoom:peek() <= math.min(ZoomGeometryModule.fit(AbsoluteWindowSizeRatio4.X, AbsoluteWindowSizeRatio4.Y, ReadResult2.X, ReadResult2.Y), MaxZoom) * 1.001 then
					Zero = ReadResult2 / 2
					Zero1 = AbsoluteWindowSizeRatio1 / 2
					local FitResult: number = ZoomGeometryModule.fit(AbsoluteWindowSizeRatio1.X, AbsoluteWindowSizeRatio1.Y, ReadResult2.X, ReadResult2.Y)
					assert(FitResult > 0 and FitResult < 1e999, "Facet UI.ZoomView: zoom must be positive and finite")
					local ReadResult5 = p1.read(p3.contentSize)
					local X5: number = ReadResult5.X
					local IsXBelow5: boolean = X5 > 0 and X5 < 1e999
					
					if IsXBelow5 then
						local Y: number = ReadResult5.Y
						IsXBelow5 = Y > 0 and Y < 1e999
					end
					assert(IsXBelow5, "Facet UI.ZoomView: contentSize must have positive finite axes")
					local AbsoluteWindowSizeRatio5 = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
					local ClampedValue2 = math.clamp(FitResult, math.max(math.min(p3.minZoom or ZoomGeometryModule.fit(AbsoluteWindowSizeRatio5.X, AbsoluteWindowSizeRatio5.Y, ReadResult5.X, ReadResult5.Y), MaxZoom), 0.001), MaxZoom)
					
					if blocked() then
						v4 = ClampedValue2
						Flag = false
						PeekResult11 = nil
						ScrollingFrameResult:ResetScrollVelocity()
					end
					Flag2 = true
					Zoom:set(ClampedValue2)
					Flag2 = false
					RampResult.retarget(ClampedValue2, 0)
					RampResult1.retarget(TypesVector2.zero, 0)
					local PeekResult7: number = RampResult.value:peek()
					local ReadResult6 = p1.read(p3.contentSize)
					local X6: number = ReadResult6.X
					local IsXBelow6: boolean = X6 > 0 and X6 < 1e999
					
					if IsXBelow6 then
						local Y: number = ReadResult6.Y
						IsXBelow6 = Y > 0 and Y < 1e999
					end
					assert(IsXBelow6, "Facet UI.ZoomView: contentSize must have positive finite axes")
					local AbsoluteWindowSizeRatio6 = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
					ClampedValue = math.clamp(PeekResult7, math.max(math.min(p3.minZoom or ZoomGeometryModule.fit(AbsoluteWindowSizeRatio6.X, AbsoluteWindowSizeRatio6.Y, ReadResult6.X, ReadResult6.Y), MaxZoom), 0.001), MaxZoom)
				end
				v3 = AbsoluteWindowSizeRatio1
				local ScaledClampedValue = ClampedValue * presentation()
				local AxisResult, AxisResult2 = ZoomGeometryModule.axis(AbsoluteWindowSizeRatio1.X, ReadResult2.X, ScaledClampedValue, Zero.X, Zero1.X)
				local AxisResult1, AxisResult2_1 = ZoomGeometryModule.axis(AbsoluteWindowSizeRatio1.Y, ReadResult2.Y, ScaledClampedValue, Zero.Y, Zero1.Y)
				local Zero4 = if ReducedResult() then TypesVector2.zero else RampResult1.value:peek()
				Flag3 = true
				ZoomScale.Scale = ScaledClampedValue
				ZoomContent.Position = TypesUDim2.fromOffset(AxisResult2, AxisResult2_1)
				ScrollingFrameResult.CanvasSize = TypesUDim2.fromOffset(math.max(AbsoluteWindowSizeRatio1.X, ReadResult2.X * ScaledClampedValue), (math.max(AbsoluteWindowSizeRatio1.Y, ReadResult2.Y * ScaledClampedValue)))
				ScrollingFrameResult.CanvasPosition = TypesVector2.new(math.clamp(AxisResult - Zero4.X, 0, (math.max(0, ReadResult2.X * ScaledClampedValue - AbsoluteWindowSizeRatio1.X))), (math.clamp(AxisResult1 - Zero4.Y, 0, (math.max(0, ReadResult2.Y * ScaledClampedValue - AbsoluteWindowSizeRatio1.Y)))))
				PeekResult1 = ClampedValue
				ScrollingFrameResult:SetAttribute("FacetZoom", ClampedValue)
				Flag3 = false
				local PeekResult5 = DragSessionModuleResult.state:peek()
				
				if PeekResult5 and PeekResult5.mode == "pointer" and (not PeekResult5.pending and PeekResult5.position) then
					DragSessionModuleResult.update(PeekResult5.position)
				end
			end
		end
		
		Runtime.connect(ScrollingFrameResult, "Changed", function(p5)
			-- upvalues: Flag3 (ref), Flag (ref), blocked (copy), capture (copy)
			if p5 == "CanvasPosition" and not Flag3 and not Flag and not blocked() then
				capture()
			end
		end)
		local PeekResult2 = Zoom:peek()
		local ReadResult1 = p1.read(p3.focus)
		Compose.watch(function(Callback)
			-- upvalues: Zoom (copy), p1 (upval), p3 (copy), PeekResult2 (ref), ReadResult1 (ref), blocked (copy), Flag2 (ref), v4 (ref), PeekResult11 (ref), capture (copy), focusAt (copy), RampResult (copy), ScrollingFrameResult (ref), LayoutUnitResult (copy), ZoomGeometryModule (upval), MaxZoom (copy), ReducedResult (copy), RampResult1 (copy), TypesVector2 (upval)
			local CallbackResult: number = Callback(Zoom)
			assert(CallbackResult > 0 and CallbackResult < 1e999, "Facet UI.ZoomView: zoom must be positive and finite")
			local ReadResult1 = p1.read(p3.focus, Callback)
			
			if CallbackResult ~= PeekResult2 or ReadResult1 ~= ReadResult1 then
				if blocked() and (not Flag2 or v4 == nil) then
					PeekResult11 = CallbackResult
				else
					if not Flag2 then
						capture()
					end
					if ReadResult1 and (ReadResult1 ~= ReadResult1 or not Flag2) then
						focusAt(ReadResult1)
					end
					local RetargetFunction: (any, any) -> () = RampResult.retarget
					local ReadResult2 = p1.read(p3.contentSize)
					local X: number = ReadResult2.X
					local IsXBelow: boolean = X > 0 and X < 1e999
					
					if IsXBelow then
						local Y: number = ReadResult2.Y
						IsXBelow = Y > 0 and Y < 1e999
					end
					assert(IsXBelow, "Facet UI.ZoomView: contentSize must have positive finite axes")
					local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
					RetargetFunction(math.clamp(CallbackResult, math.max(math.min(p3.minZoom or ZoomGeometryModule.fit(AbsoluteWindowSizeRatio.X, AbsoluteWindowSizeRatio.Y, ReadResult2.X, ReadResult2.Y), MaxZoom), 0.001), MaxZoom), if ReducedResult(Callback) then 0 else p1.metric("motion.durations.zoom", Callback))
					RampResult1.retarget(TypesVector2.zero, if ReducedResult(Callback) then 0 else p1.metric("motion.durations.zoom", Callback))
				end
				PeekResult2 = CallbackResult
				ReadResult1 = ReadResult1
			end
		end)
		local v6 = 1
		local Config = nil
		local Zero6 = TypesVector2.zero
		local Flag9 = false
		local v7 = false
		
		local _ = function(p5)
			-- upvalues: ScrollingFrameResult (ref), LayoutUnitResult (copy)
			return (p5 - ScrollingFrameResult.AbsolutePosition) / math.max(LayoutUnitResult:peek(), 0.001)
		end
		
		local _ = function(p5): boolean
			-- upvalues: ScrollingFrameResult (ref), LayoutUnitResult (copy)
			local AbsolutePositionRatio = (p5 - ScrollingFrameResult.AbsolutePosition) / math.max(LayoutUnitResult:peek(), 0.001)
			local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
			
			return AbsolutePositionRatio.X >= 0 and (AbsolutePositionRatio.Y >= 0 and AbsolutePositionRatio.X < AbsoluteWindowSizeRatio.X) and AbsolutePositionRatio.Y < AbsoluteWindowSizeRatio.Y
		end
		
		local function ownsPoint(Vector, p5): boolean
			-- upvalues: ScrollingFrameResult (ref)
			local PlayerGui = ScrollingFrameResult:FindFirstAncestorWhichIsA("PlayerGui")
			
			if not PlayerGui then
				return true
			end
			for _, Object in PlayerGui:GetGuiObjectsAtPosition(Vector.X, Vector.Y) do
				if Object == ScrollingFrameResult or Object:IsDescendantOf(ScrollingFrameResult) then
					local Object1 = Object
					while Object1 and Object1 ~= ScrollingFrameResult do
						if Object1:IsA("GuiObject") and (Object1:IsA("ScrollingFrame") or p5 and (Object1:IsA("TextBox") or Object1:GetAttribute("FacetOwnsTaps") == true or Object1.Active and not Object1:IsA("GuiButton"))) then
							return false
						end
						Object1 = Object1.Parent
					end
					return true
				elseif Object.Active or Object:IsA("GuiButton") or Object:IsA("TextBox") then
					return false
				end
			end
			return false
		end
		
		local function overPoint(MouseLocationDelta)
			-- upvalues: Flag6 (ref), Flag5 (ref), UserInputService (copy), p1 (upval), p3 (copy), ScrollingFrameResult (ref), LayoutUnitResult (copy), ownsPoint (copy)
			if Flag6 then
				return false
			end
			if not Flag5 or not UserInputService or p1.read(p3.enabled) == false or not ScrollingFrameResult.Visible or not ScrollingFrameResult.Interactable then
				return false
			end
			local MouseLocationDeltaRatio = (MouseLocationDelta - ScrollingFrameResult.AbsolutePosition) / math.max(LayoutUnitResult:peek(), 0.001)
			local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
			
			if MouseLocationDeltaRatio.X < 0 or (MouseLocationDeltaRatio.Y < 0 or (MouseLocationDeltaRatio.X >= AbsoluteWindowSizeRatio.X or MouseLocationDeltaRatio.Y >= AbsoluteWindowSizeRatio.Y)) then
				return false
			end
			local Parent = ScrollingFrameResult.Parent
			while Parent do
				if Parent:IsA("GuiObject") then
					if not Parent.Visible or not Parent.Interactable then
						return false
					end
					if Parent.ClipsDescendants then
						local AbsolutePosition = Parent.AbsolutePosition
						local AbsoluteSize = Parent.AbsoluteSize
						
						if MouseLocationDelta.X < AbsolutePosition.X or MouseLocationDelta.Y < AbsolutePosition.Y or AbsolutePosition.X + AbsoluteSize.X <= MouseLocationDelta.X or AbsolutePosition.Y + AbsoluteSize.Y <= MouseLocationDelta.Y then
							return false
						end
					end
				elseif Parent:IsA("LayerCollector") and not Parent.Enabled then
					return false
				end
				Parent = Parent.Parent
			end
			return (ownsPoint(MouseLocationDelta, false))
		end
		
		local _ = function()
			-- upvalues: EffectiveInputResult (copy), overPoint (copy), UserInputService (copy), GuiService (copy), TypesVector2 (upval)
			return EffectiveInputResult() == "KeyboardAndMouse" and overPoint(if UserInputService then UserInputService:GetMouseLocation() - (if GuiService then GuiService:GetGuiInset() else TypesVector2.zero) else TypesVector2.zero)
		end
		
		local function canWheelPan(Vector): boolean
			-- upvalues: p1 (upval), p3 (copy), PeekResult1 (ref), ScrollingFrameResult (ref), LayoutUnitResult (copy), TypesVector2 (upval)
			local ReadResult = p1.read(p3.contentSize)
			local X: number = ReadResult.X
			local IsXBelow: boolean = X > 0 and X < 1e999
			
			if IsXBelow then
				local Y: number = ReadResult.Y
				IsXBelow = Y > 0 and Y < 1e999
			end
			assert(IsXBelow, "Facet UI.ZoomView: contentSize must have positive finite axes")
			local ScaledReadResult = ReadResult * PeekResult1
			local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
			local CanvasPosition = ScrollingFrameResult.CanvasPosition
			local NewTypesVector = TypesVector2.new(math.max(0, ScaledReadResult.X - AbsoluteWindowSizeRatio.X), (math.max(0, ScaledReadResult.Y - AbsoluteWindowSizeRatio.Y)))
			
			return Vector.X < 0 and CanvasPosition.X > 0.5 or (Vector.X > 0 and CanvasPosition.X < NewTypesVector.X - 0.5 or (Vector.Y < 0 and CanvasPosition.Y > 0.5 or Vector.Y > 0 and CanvasPosition.Y < NewTypesVector.Y - 0.5))
		end
		
		v75 = function()
			-- upvalues: EffectiveInputResult (copy), overPoint (copy), UserInputService (copy), GuiService (copy), TypesVector2 (upval), NewResult (ref), canWheelPan (copy), HoldAncestorsResult (ref), ScrollLockModule (upval), ZoomContent (copy), ScrollingFrameResult (ref), p1 (upval), p3 (copy)
			if EffectiveInputResult() == "KeyboardAndMouse" and overPoint(if UserInputService then UserInputService:GetMouseLocation() - (if GuiService then GuiService:GetGuiInset() else TypesVector2.zero) else TypesVector2.zero) and (NewResult == nil or canWheelPan(NewResult)) then
				if not HoldAncestorsResult then
					HoldAncestorsResult = ScrollLockModule.holdAncestors(ZoomContent)
					ScrollingFrameResult:ResetScrollVelocity()
					
					return
				end
			elseif HoldAncestorsResult then
				HoldAncestorsResult()
				HoldAncestorsResult = nil
				
				if p1.read(p3.enabled) == false or p1.read(p3.ScrollingEnabled) == false then
					ScrollingFrameResult.ScrollingEnabled = false
				end
			end
		end
		
		local function beginPointer(Input1)
			-- upvalues: TypesEnum (upval), Input (ref), Flag8 (ref), Flag7 (ref), Tbl2 (copy), Zero6 (ref), Flag9 (ref), TypesVector2 (upval), v7 (ref), ownsPoint (copy), Runtime (upval), Config (ref), p1 (upval), p3 (copy), ScrollingFrameResult (ref), blocked (copy), ActivationModule (upval), Tbl (copy), GestureServiceModuleResult (copy), Zero4 (ref), Zero5 (ref), Flag4 (ref)
			if Input1.UserInputType == TypesEnum.UserInputType.Touch or Input1.UserInputType == TypesEnum.UserInputType.MouseButton1 then
				if Input1 == Input then return end
				if Flag8 then
					Flag7 = false
					Flag8 = false
					
					for i in Tbl2 do
						i.Active = true
					end
					table.clear(Tbl2)
				end
				Input = Input1
				Zero6 = TypesVector2.new(Input1.Position.X, Input1.Position.Y)
				Flag9 = false
				v7 = ownsPoint(Zero6, true)
				local Frames = Runtime.host.frames
				local NowResult = if Frames then Frames.now() else os.clock()
				local Config1 = Config
				
				if v7 and (p1.read(p3.enabled) ~= false and (ScrollingFrameResult.Visible and not blocked()) and Config1 and NowResult - Config1.at <= p1.metric("controls.zoom.doubleTapSeconds") and (Zero6 - Config1.point).Magnitude <= p1.metric("controls.zoom.doubleTapDistance")) then
					ActivationModule.consume(Input1)
					Flag7 = true
					Flag8 = false
					
					for _, Button in ScrollingFrameResult:GetDescendants() do
						if Flag7 and Button:IsA("GuiButton") and Button.Active then
							Tbl2[Button] = true
							Button.Active = false
						end
					end
				end
				Tbl[Input1] = true
				GestureServiceModuleResult.begin(Input1, ScrollingFrameResult, Zero6, {
					scroll = Input1.UserInputType == TypesEnum.UserInputType.Touch
				})
				
				if Input1.UserInputType == TypesEnum.UserInputType.MouseButton1 then
					Zero4 = Zero6
					Zero5 = ScrollingFrameResult.CanvasPosition
					Flag4 = false
				end
			end
		end
		
		Runtime.connect(ScrollingFrameResult, "InputBegan", beginPointer)
		
		if UserInputService then
			Runtime.connect(UserInputService, "TouchPinch", function(Entry, p6: number, _, Begin)
				-- upvalues: p1 (upval), p3 (copy), ScrollingFrameResult (ref), blocked (copy), Flag6 (ref), HoldAncestorsResult1 (ref), GuiService (copy), TypesVector2 (upval), TypesEnum (upval), LayoutUnitResult (copy), v6 (ref), PeekResult1 (ref), capture (copy), HoldAncestorsResult (ref), ScrollLockModule (upval), ZoomContent (copy), Zero1 (ref), GestureServiceModuleResult (copy), DragSessionModuleResult (copy), Source (ref), ZoomGeometryModule (upval), MaxZoom (copy), v4 (ref), Flag (ref), PeekResult11 (ref), Flag2 (ref), Zoom (copy), RampResult (copy), RampResult1 (copy), render (copy), Flag9 (ref), Config (ref)
				if p1.read(p3.enabled) ~= false and (ScrollingFrameResult.Visible and not blocked()) and #Entry >= 2 then
					local EntryDelta = (Entry[1] + Entry[2]) / 2 - (if GuiService then GuiService:GetGuiInset() else TypesVector2.zero)
					
					if Begin == TypesEnum.UserInputState.Begin then
						local EntryRatio = (Entry[1] - (if GuiService then GuiService:GetGuiInset() else TypesVector2.zero) - ScrollingFrameResult.AbsolutePosition) / math.max(LayoutUnitResult:peek(), 0.001)
						local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
						local IsYBelow: boolean = EntryRatio.X >= 0 and (EntryRatio.Y >= 0 and (EntryRatio.X < AbsoluteWindowSizeRatio.X and EntryRatio.Y < AbsoluteWindowSizeRatio.Y))
						
						if IsYBelow then
							local EntryRatio1 = (Entry[2] - (if GuiService then GuiService:GetGuiInset() else TypesVector2.zero) - ScrollingFrameResult.AbsolutePosition) / math.max(LayoutUnitResult:peek(), 0.001)
							local AbsoluteWindowSizeRatio1 = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
							IsYBelow = EntryRatio1.X >= 0 and (EntryRatio1.Y >= 0 and EntryRatio1.X < AbsoluteWindowSizeRatio1.X) and EntryRatio1.Y < AbsoluteWindowSizeRatio1.Y
						end
						Flag6 = IsYBelow
						v6 = PeekResult1
						capture((EntryDelta - ScrollingFrameResult.AbsolutePosition) / math.max(LayoutUnitResult:peek(), 0.001))
						
						if Flag6 then
							if HoldAncestorsResult then
								HoldAncestorsResult()
								HoldAncestorsResult = nil
								
								if p1.read(p3.enabled) == false or p1.read(p3.ScrollingEnabled) == false then
									ScrollingFrameResult.ScrollingEnabled = false
								end
							end
							if not HoldAncestorsResult1 then
								HoldAncestorsResult1 = ScrollLockModule.holdAncestors(ZoomContent)
							end
							ScrollingFrameResult:ResetScrollVelocity()
						end
						return
					else
						if Flag6 and (p6 > 0 and p6 < 1e999) then
							Zero1 = (EntryDelta - ScrollingFrameResult.AbsolutePosition) / math.max(LayoutUnitResult:peek(), 0.001)
							local Value = v6 * p6
							assert(Value > 0 and Value < 1e999, "Facet UI.ZoomView: zoom must be positive and finite")
							local Flag1 = nil
							
							if p1.read(p3.enabled) == false or not ScrollingFrameResult.Visible then
								Flag1 = false
							elseif GestureServiceModuleResult.claimCamera(ScrollingFrameResult) then
								local PeekResult2 = DragSessionModuleResult.state:peek()
								
								if PeekResult2 then
									Source = PeekResult2.source
								end
								Flag1 = true
							else
								Flag1 = not blocked()
							end
							local Flag3 = nil
							if Flag1 then
								local ReadResult = p1.read(p3.contentSize)
								local X: number = ReadResult.X
								local IsXBelow: boolean = X > 0 and X < 1e999
								
								if IsXBelow then
									local Y: number = ReadResult.Y
									IsXBelow = Y > 0 and Y < 1e999
								end
								assert(IsXBelow, "Facet UI.ZoomView: contentSize must have positive finite axes")
								local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
								local ClampedValue = math.clamp(Value, math.max(math.min(p3.minZoom or ZoomGeometryModule.fit(AbsoluteWindowSizeRatio.X, AbsoluteWindowSizeRatio.Y, ReadResult.X, ReadResult.Y), MaxZoom), 0.001), MaxZoom)
								
								if blocked() then
									v4 = ClampedValue
									Flag = false
									PeekResult11 = nil
									ScrollingFrameResult:ResetScrollVelocity()
								end
								Flag2 = true
								Zoom:set(ClampedValue)
								Flag2 = false
								RampResult.retarget(ClampedValue, 0)
								RampResult1.retarget(TypesVector2.zero, 0)
								Flag3 = true
							else
								Flag3 = false
							end
							if Flag3 then
								render(0)
							end
							Flag9 = true
							Config = nil
						end
						if Begin == TypesEnum.UserInputState.End or Begin == TypesEnum.UserInputState.Cancel then
							Flag6 = false
							
							if HoldAncestorsResult1 then
								HoldAncestorsResult1()
								HoldAncestorsResult1 = nil
								
								if p1.read(p3.enabled) == false or p1.read(p3.ScrollingEnabled) == false then
									ScrollingFrameResult.ScrollingEnabled = false
								end
							end
						end
						return
					end
				else
					Flag6 = false
					
					if HoldAncestorsResult1 then
						HoldAncestorsResult1()
						HoldAncestorsResult1 = nil
						
						if p1.read(p3.enabled) == false or p1.read(p3.ScrollingEnabled) == false then
							ScrollingFrameResult.ScrollingEnabled = false
						end
					end
				end
			end)
		end
		if UserInputService then
			Runtime.connect(UserInputService, "InputBegan", function(Input)
				-- upvalues: TypesEnum (upval), Tbl (copy), overPoint (copy), TypesVector2 (upval), beginPointer (copy)
				if Input.UserInputType == TypesEnum.UserInputType.Touch or Input.UserInputType == TypesEnum.UserInputType.MouseButton1 then
					Tbl[Input] = true
					
					if overPoint(TypesVector2.new(Input.Position.X, Input.Position.Y)) then
						beginPointer(Input)
					end
				end
			end)
			Runtime.connect(UserInputService, "InputChanged", function(Input1)
				-- upvalues: Input (ref), TypesVector2 (upval), Zero6 (ref), GestureServiceModuleResult (copy), Flag9 (ref), Config (ref), TypesEnum (upval), NewResult (ref), v75 (ref), ScrollingFrameResult (ref), moveMouse (copy), UserInputService (copy), p1 (upval), EffectiveInputResult (copy), overPoint (copy), GuiService (copy), p3 (copy), blocked (copy), capture (copy), LayoutUnitResult (copy), Zoom (copy), DragSessionModuleResult (copy), Source (ref), ZoomGeometryModule (upval), MaxZoom (copy), v4 (ref), Flag (ref), PeekResult11 (ref), Flag2 (ref), RampResult (copy), ReducedResult (copy), RampResult1 (copy), canWheelPan (copy), PeekResult1 (ref), Zero1 (ref), render (copy)
				if Input1 == Input and (TypesVector2.new(Input1.Position.X, Input1.Position.Y) - Zero6).Magnitude >= 6 then
					GestureServiceModuleResult.move(Input1, TypesVector2.new(Input1.Position.X, Input1.Position.Y))
					Flag9 = true
					Config = nil
				end
				if Input1.UserInputType == TypesEnum.UserInputType.MouseMovement then
					NewResult = nil
					v75()
					local Input2 = Input
					
					if Input2 and Input2.UserInputType == TypesEnum.UserInputType.MouseButton1 then
						local NewTypesVector = TypesVector2.new(Input1.Position.X, Input1.Position.Y)
						local GetResult = GestureServiceModuleResult.get(Input2)
						
						if GestureServiceModuleResult.move(Input2, NewTypesVector) == "pan" and GetResult and GetResult.owner == ScrollingFrameResult then
							Flag9 = true
							Config = nil
							moveMouse(NewTypesVector)
							
							return
						end
					end
				elseif Input1.UserInputType == TypesEnum.UserInputType.MouseWheel then
					local IsKeyDown = UserInputService:IsKeyDown(TypesEnum.KeyCode.LeftControl) or UserInputService:IsKeyDown(TypesEnum.KeyCode.RightControl)
					local ScaledControlsZoomPanStep = -Input1.Position.Z * p1.metric("controls.zoom.panStep")
					local IsKeyDown1 = UserInputService:IsKeyDown(TypesEnum.KeyCode.LeftShift) or UserInputService:IsKeyDown(TypesEnum.KeyCode.RightShift)
					NewResult = if IsKeyDown then nil elseif IsKeyDown1 then TypesVector2.new(ScaledControlsZoomPanStep, 0) else TypesVector2.new(0, ScaledControlsZoomPanStep)
					v75()
					
					if EffectiveInputResult() == "KeyboardAndMouse" and overPoint(if UserInputService then UserInputService:GetMouseLocation() - (if GuiService then GuiService:GetGuiInset() else TypesVector2.zero) else TypesVector2.zero) and (p1.read(p3.enabled) ~= false and (ScrollingFrameResult.Visible and not blocked())) then
						if IsKeyDown then
							capture(((if UserInputService then UserInputService:GetMouseLocation() - (if GuiService then GuiService:GetGuiInset() else TypesVector2.zero) else TypesVector2.zero) - ScrollingFrameResult.AbsolutePosition) / math.max(LayoutUnitResult:peek(), 0.001))
							local ScaledPeekResult = Zoom:peek() * p1.metric("controls.zoom.stepRatio") ^ Input1.Position.Z
							assert(ScaledPeekResult > 0 and ScaledPeekResult < 1e999, "Facet UI.ZoomView: zoom must be positive and finite")
							local Flag1 = nil
							
							if p1.read(p3.enabled) == false or not ScrollingFrameResult.Visible then
								Flag1 = false
							elseif GestureServiceModuleResult.claimCamera(ScrollingFrameResult) then
								local PeekResult2 = DragSessionModuleResult.state:peek()
								
								if PeekResult2 then
									Source = PeekResult2.source
								end
								Flag1 = true
							else
								Flag1 = not blocked()
							end
							if not Flag1 then return end
							local ReadResult = p1.read(p3.contentSize)
							local X: number = ReadResult.X
							local IsXBelow: boolean = X > 0 and X < 1e999
							
							if IsXBelow then
								local Y: number = ReadResult.Y
								IsXBelow = Y > 0 and Y < 1e999
							end
							assert(IsXBelow, "Facet UI.ZoomView: contentSize must have positive finite axes")
							local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
							local ClampedValue = math.clamp(ScaledPeekResult, math.max(math.min(p3.minZoom or ZoomGeometryModule.fit(AbsoluteWindowSizeRatio.X, AbsoluteWindowSizeRatio.Y, ReadResult.X, ReadResult.Y), MaxZoom), 0.001), MaxZoom)
							
							if blocked() then
								v4 = ClampedValue
								Flag = false
								PeekResult11 = nil
								ScrollingFrameResult:ResetScrollVelocity()
							end
							Flag2 = true
							Zoom:set(ClampedValue)
							Flag2 = false
							RampResult.retarget(ClampedValue, if ReducedResult() then 0 else p1.metric("motion.durations.zoom"))
							RampResult1.retarget(TypesVector2.zero, if ReducedResult() then 0 else p1.metric("motion.durations.zoom"))
							
							return
						else
							if NewResult and canWheelPan(NewResult) then
								RampResult.retarget(PeekResult1, 0)
								local Amount = NewResult
								
								if p1.read(p3.enabled) ~= false and (ScrollingFrameResult.Visible and not blocked()) then
									capture()
									Zero1 -= Amount
								end
								render(0)
							end
						end
					end
				end
			end)
			Runtime.connect(UserInputService, "InputEnded", function(Input1)
				-- upvalues: Tbl (copy), Tbl1 (copy), Input (ref), Flag4 (ref), Flag8 (ref), Flag7 (ref), GestureServiceModuleResult (copy), ScrollingFrameResult (ref), TypesEnum (upval), Config (ref), Flag9 (ref), v7 (ref), TypesVector2 (upval), LayoutUnitResult (copy), p1 (upval), p3 (copy), blocked (copy), Runtime (upval), Zero6 (ref), capture (copy), ZoomGeometryModule (upval), MaxZoom (copy), PeekResult1 (ref), DragSessionModuleResult (copy), Source (ref), v4 (ref), Flag (ref), PeekResult11 (ref), Flag2 (ref), Zoom (copy), RampResult (copy), ReducedResult (copy), RampResult1 (copy)
				Tbl[Input1] = nil
				Tbl1[Input1] = nil
				
				if Input1 ~= Input then return end
				Input = nil
				Flag4 = false
				Flag8 = Flag7
				local GetResult = GestureServiceModuleResult.get(Input1)
				local FinishResult = GestureServiceModuleResult.finish(Input1, ScrollingFrameResult, Input1.UserInputState == TypesEnum.UserInputState.Cancel)
				
				if GetResult and GetResult.owner ~= ScrollingFrameResult then
					Config = nil
					
					return
				end
				if not Flag9 and v7 then
					local NewTypesVectorRatio = (TypesVector2.new(Input1.Position.X, Input1.Position.Y) - ScrollingFrameResult.AbsolutePosition) / math.max(LayoutUnitResult:peek(), 0.001)
					local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
					
					if NewTypesVectorRatio.X >= 0 and (NewTypesVectorRatio.Y >= 0 and (NewTypesVectorRatio.X < AbsoluteWindowSizeRatio.X and NewTypesVectorRatio.Y < AbsoluteWindowSizeRatio.Y)) and FinishResult ~= "scroll" and FinishResult ~= "pan" and Input1.UserInputState ~= TypesEnum.UserInputState.Cancel and (p1.read(p3.enabled) ~= false and (ScrollingFrameResult.Visible and not blocked())) then
						local Frames = Runtime.host.frames
						local NowResult = if Frames then Frames.now() else os.clock()
						local Config1 = Config
						
						if not Config1 or NowResult - Config1.at > p1.metric("controls.zoom.doubleTapSeconds") or (Zero6 - Config1.point).Magnitude > p1.metric("controls.zoom.doubleTapDistance") then
							Config = { at = NowResult, point = Zero6 }
							
							return
						end
						capture((Zero6 - ScrollingFrameResult.AbsolutePosition) / math.max(LayoutUnitResult:peek(), 0.001))
						local ReadResult = p1.read(p3.contentSize)
						local X: number = ReadResult.X
						local IsXBelow: boolean = X > 0 and X < 1e999
						
						if IsXBelow then
							local Y: number = ReadResult.Y
							IsXBelow = Y > 0 and Y < 1e999
						end
						assert(IsXBelow, "Facet UI.ZoomView: contentSize must have positive finite axes")
						local AbsoluteWindowSizeRatio1 = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
						local Smallest = math.min(p3.minZoom or ZoomGeometryModule.fit(AbsoluteWindowSizeRatio1.X, AbsoluteWindowSizeRatio1.Y, ReadResult.X, ReadResult.Y), MaxZoom)
						local Smallest1 = if Smallest + 0.001 < PeekResult1 then Smallest else p3.doubleTapZoom or math.min(MaxZoom, Smallest * 2)
						assert(Smallest1 > 0 and Smallest1 < 1e999, "Facet UI.ZoomView: zoom must be positive and finite")
						local Flag1 = nil
						
						if p1.read(p3.enabled) == false or not ScrollingFrameResult.Visible then
							Flag1 = false
						elseif GestureServiceModuleResult.claimCamera(ScrollingFrameResult) then
							local PeekResult2 = DragSessionModuleResult.state:peek()
							
							if PeekResult2 then
								Source = PeekResult2.source
							end
							Flag1 = true
						else
							Flag1 = not blocked()
						end
						if Flag1 then
							local ReadResult1 = p1.read(p3.contentSize)
							local X1: number = ReadResult1.X
							local IsXBelow1: boolean = X1 > 0 and X1 < 1e999
							
							if IsXBelow1 then
								local Y: number = ReadResult1.Y
								IsXBelow1 = Y > 0 and Y < 1e999
							end
							assert(IsXBelow1, "Facet UI.ZoomView: contentSize must have positive finite axes")
							local AbsoluteWindowSizeRatio2 = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
							local ClampedValue = math.clamp(Smallest1, math.max(math.min(p3.minZoom or ZoomGeometryModule.fit(AbsoluteWindowSizeRatio2.X, AbsoluteWindowSizeRatio2.Y, ReadResult1.X, ReadResult1.Y), MaxZoom), 0.001), MaxZoom)
							
							if blocked() then
								v4 = ClampedValue
								Flag = false
								PeekResult11 = nil
								ScrollingFrameResult:ResetScrollVelocity()
							end
							Flag2 = true
							Zoom:set(ClampedValue)
							Flag2 = false
							RampResult.retarget(ClampedValue, if ReducedResult() then 0 else p1.metric("motion.durations.zoom"))
							RampResult1.retarget(TypesVector2.zero, if ReducedResult() then 0 else p1.metric("motion.durations.zoom"))
						end
						Config = nil
						
						return
					end
				end
				Config = nil
			end)
			Runtime.connect(UserInputService, "WindowFocused", function()
				-- upvalues: Flag5 (ref)
				Flag5 = true
			end)
			Runtime.connect(UserInputService, "WindowFocusReleased", function()
				-- upvalues: Flag5 (ref), Flag7 (ref), Flag8 (ref), Tbl2 (copy), HoldAncestorsResult (ref), p1 (upval), p3 (copy), ScrollingFrameResult (ref), HoldAncestorsResult1 (ref), GestureServiceModuleResult (copy), Tbl (copy), Tbl1 (copy), Input (ref), Config (ref), Flag6 (ref), Zero3 (ref), TypesVector2 (upval)
				Flag5 = false
				Flag7 = false
				Flag8 = false
				
				for i in Tbl2 do
					i.Active = true
				end
				table.clear(Tbl2)
				
				if HoldAncestorsResult then
					HoldAncestorsResult()
					HoldAncestorsResult = nil
					
					if p1.read(p3.enabled) == false or p1.read(p3.ScrollingEnabled) == false then
						ScrollingFrameResult.ScrollingEnabled = false
					end
				end
				if HoldAncestorsResult1 then
					HoldAncestorsResult1()
					HoldAncestorsResult1 = nil
					
					if p1.read(p3.enabled) == false or p1.read(p3.ScrollingEnabled) == false then
						ScrollingFrameResult.ScrollingEnabled = false
					end
				end
				GestureServiceModuleResult.cancelOwner(ScrollingFrameResult)
				table.clear(Tbl)
				table.clear(Tbl1)
				Input = nil
				Config = nil
				Flag6 = false
				Zero3 = TypesVector2.zero
			end)
		end
		Compose.cleanup(function()
			-- upvalues: GestureServiceModuleResult (copy), ScrollingFrameResult (ref)
			GestureServiceModuleResult.cancelOwner(ScrollingFrameResult)
		end)
		local ObserveResult = if GuiService then p1.selection.observe() else Compose.cell(nil)
		
		local function active(Callback): boolean
			-- upvalues: ObserveResult (copy), ScrollingFrameResult (ref), p1 (upval), p3 (copy), blocked (copy)
			return Callback(ObserveResult) == ScrollingFrameResult and (p1.read(p3.enabled, Callback) ~= false and not blocked())
		end
		
		local function visibleTarget(Frame: Frame): boolean
			-- upvalues: ZoomContent (copy), p1 (upval), ScrollingFrameResult (ref), TypesVector2 (upval)
			if not Frame.Selectable or not Frame:IsDescendantOf(ZoomContent) or not p1.available(Frame) then
				return false
			end
			local AbsolutePosition = Frame.AbsolutePosition
			local NewAbsolutePosition = Frame.AbsolutePosition + Frame.AbsoluteSize
			local Parent = Frame.Parent
			while Parent do
				if Parent:IsA("GuiObject") and (Parent == ScrollingFrameResult or Parent.ClipsDescendants) then
					local AbsolutePosition1 = Parent.AbsolutePosition
					local AbsoluteWindowSize = if Parent == ScrollingFrameResult then ScrollingFrameResult.AbsoluteWindowSize else Parent.AbsoluteSize
					AbsolutePosition = TypesVector2.new(math.max(AbsolutePosition.X, AbsolutePosition1.X), (math.max(AbsolutePosition.Y, AbsolutePosition1.Y)))
					NewAbsolutePosition = TypesVector2.new(math.min(NewAbsolutePosition.X, AbsolutePosition1.X + AbsoluteWindowSize.X), (math.min(NewAbsolutePosition.Y, AbsolutePosition1.Y + AbsoluteWindowSize.Y)))
				end
				Parent = Parent.Parent
			end
			return AbsolutePosition.X < NewAbsolutePosition.X and AbsolutePosition.Y < NewAbsolutePosition.Y
		end
		
		p1.action(ScrollingFrameResult, "ZoomEnter", {
			TypesEnum.KeyCode.DPadUp,
			TypesEnum.KeyCode.DPadDown,
			TypesEnum.KeyCode.DPadLeft,
			TypesEnum.KeyCode.DPadRight,
			TypesEnum.KeyCode.ButtonA
		}, active, function()
			-- upvalues: GuiService (copy), p1 (upval), ScrollingFrameResult (ref), p3 (copy), blocked (copy), visibleTarget (copy), ZoomContent (copy)
			if not GuiService or p1.selection.get() ~= ScrollingFrameResult or (p1.read(p3.enabled) == false or (not ScrollingFrameResult.Visible or blocked())) then return end
			local ReadResult = p1.read(p3.preferredSelection)
			
			if ReadResult and visibleTarget(ReadResult) then
				p1.selection.set(ReadResult)
				
				return
			end
			local NewAbsolutePosition = ScrollingFrameResult.AbsolutePosition + ScrollingFrameResult.AbsoluteWindowSize / 2
			local v8 = 1e999
			local v9 = nil
			
			for _, Gui in ZoomContent:GetDescendants() do
				if Gui:IsA("GuiObject") and visibleTarget(Gui) then
					local Distance = (Gui.AbsolutePosition + Gui.AbsoluteSize / 2 - NewAbsolutePosition).Magnitude
					
					if Distance < v8 then
						v8 = Distance
						v9 = Gui
					end
				end
			end
			if v9 then
				p1.selection.set(v9)
			end
		end, { sink = true, priority = 250 })
		
		for _, value in {
			{
				name = "ZoomIn",
				direction = 1,
				key = TypesEnum.KeyCode.Equals,
				pad = TypesEnum.KeyCode.ButtonR1
			},
			{
				name = "ZoomOut",
				direction = -1,
				key = TypesEnum.KeyCode.Minus,
				pad = TypesEnum.KeyCode.ButtonL1
			}
		} do
			p1.action(ScrollingFrameResult, value.name, { value.key, value.pad }, active, function()
				-- upvalues: value (copy), p1 (upval), p3 (copy), ScrollingFrameResult (ref), GestureServiceModuleResult (copy), DragSessionModuleResult (copy), Source (ref), blocked (copy), capture (copy), Zoom (copy), positive (copy), LayoutUnitResult (copy), ZoomGeometryModule (upval), MaxZoom (copy), v4 (ref), Flag (ref), PeekResult11 (ref), Flag2 (ref), RampResult (copy), ReducedResult (copy), RampResult1 (copy), TypesVector2 (upval)
				local Direction: number = value.direction
				local Flag1 = nil
				
				if p1.read(p3.enabled) == false or not ScrollingFrameResult.Visible then
					Flag1 = false
				elseif GestureServiceModuleResult.claimCamera(ScrollingFrameResult) then
					local PeekResult = DragSessionModuleResult.state:peek()
					
					if PeekResult then
						Source = PeekResult.source
					end
					Flag1 = true
				else
					Flag1 = not blocked()
				end
				if not Flag1 then return end
				capture()
				local ScaledPeekResult = Zoom:peek() * p1.metric("controls.zoom.stepRatio") ^ Direction
				assert(ScaledPeekResult > 0 and ScaledPeekResult < 1e999, "Facet UI.ZoomView: zoom must be positive and finite")
				local ReadResult = p1.read(p3.contentSize)
				assert(positive(ReadResult.X) and positive(ReadResult.Y), "Facet UI.ZoomView: contentSize must have positive finite axes")
				local AbsoluteWindowSizeRatio = ScrollingFrameResult.AbsoluteWindowSize / math.max(LayoutUnitResult:peek(), 0.001)
				local ClampedValue = math.clamp(ScaledPeekResult, math.max(math.min(p3.minZoom or ZoomGeometryModule.fit(AbsoluteWindowSizeRatio.X, AbsoluteWindowSizeRatio.Y, ReadResult.X, ReadResult.Y), MaxZoom), 0.001), MaxZoom)
				
				if blocked() then
					v4 = ClampedValue
					Flag = false
					PeekResult11 = nil
					ScrollingFrameResult:ResetScrollVelocity()
				end
				Flag2 = true
				Zoom:set(ClampedValue)
				Flag2 = false
				RampResult.retarget(ClampedValue, if ReducedResult() then 0 else p1.metric("motion.durations.zoom"))
				RampResult1.retarget(TypesVector2.zero, if ReducedResult() then 0 else p1.metric("motion.durations.zoom"))
			end, { sink = true, priority = 250 })
		end
		p1.action(ScrollingFrameResult, "ZoomFit", { TypesEnum.KeyCode.Home, TypesEnum.KeyCode.ButtonY }, active, function()
			-- upvalues: fit (copy)
			fit()
		end, { sink = true, priority = 250 })
		
		for _, value1 in {
			{
				name = "PanLeft",
				x = -1,
				y = 0,
				key = TypesEnum.KeyCode.A
			},
			{
				name = "PanRight",
				x = 1,
				y = 0,
				key = TypesEnum.KeyCode.D
			},
			{ name = "PanUp", x = 0, y = -1, key = TypesEnum.KeyCode.W },
			{
				name = "PanDown",
				x = 0,
				y = 1,
				key = TypesEnum.KeyCode.S
			}
		} do
			p1.action(ScrollingFrameResult, value1.name, { value1.key }, active, function()
				-- upvalues: TypesVector2 (upval), value1 (copy), p1 (upval), p3 (copy), ScrollingFrameResult (ref), blocked (copy), capture (copy), Zero1 (ref)
				local ScaledNewTypesVector = TypesVector2.new(value1.x, value1.y) * p1.metric("controls.zoom.panStep")
				
				if p1.read(p3.enabled) ~= false and (ScrollingFrameResult.Visible and not blocked()) then
					capture()
					Zero1 -= ScaledNewTypesVector
					
					return
				end
			end, { sink = true, priority = 250 })
		end
		p1.action(ScrollingFrameResult, "ZoomPan", { TypesEnum.KeyCode.Thumbstick2 }, active, function() end, {
			sink = true,
			priority = 250,
			direction2D = function(Vector)
				-- upvalues: Zero3 (ref), TypesVector2 (upval)
				Zero3 = TypesVector2.new(Vector.X, -Vector.Y)
			end,
			onReleased = function()
				-- upvalues: Zero3 (ref), TypesVector2 (upval)
				Zero3 = TypesVector2.zero
			end
		})
		local RunService = p1.config.services.RunService
		
		if RunService then
			Runtime.connect(RunService, "PreRender", render)
		elseif Runtime.host.frames then
			Compose.cleanup(Runtime.host.frames.onFrame(render))
		end
		capture()
		
		if p3.focus then
			Zero = p1.read(p3.focus)
		end
		render(0)
		
		if p3.controls then
			p3.controls.fit = fit
			p3.controls.zoomTo = zoomTo
			p3.controls.zoomAt = zoomAt
			Compose.cleanup(function()
				-- upvalues: p3 (copy)
				if p3.controls then
					p3.controls.fit = nil
					p3.controls.zoomTo = nil
					p3.controls.zoomAt = nil
				end
			end)
		end
		return p1.styled(ScrollingFrameResult, "facet-zoom-view")
	end)
end