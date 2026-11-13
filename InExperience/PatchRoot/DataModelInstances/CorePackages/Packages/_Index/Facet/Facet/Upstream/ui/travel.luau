local _ = require("./types")
local _ = require("./navigation_types")
local TravelEngineModule = require("./travel_engine")
local _ = require("./control_types")
local _ = require("./zoom_travel_props")
local ReducedFunction = require("./motion").reduced

return function(p1, p2, p3)
	-- upvalues: ReducedFunction (copy), TravelEngineModule (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	
	local function build(p4)
		-- upvalues: Host (copy), p1 (copy), TypesUDim2 (copy), Runtime (copy), Compose (copy), ReducedFunction (upval), ReadFunction (copy), TypesVector2 (copy), TravelEngineModule (upval), p3 (copy)
		assert(type(p4.content) == "function", "Facet UI.Travel: content is required")
		local FrameResult = Host.Frame(p1.props(p4, {
			"destination", "content", "path", "onLanded", "motion", "transparency",
			"stagger", "lift", "onStarted"
		}, {
			Name = "Travel",
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromOffset(0, 0)
		}))
		local ContentResult = p4.content()
		Runtime.decorate(ContentResult, { AutomaticSize = p1.types.Enum.AutomaticSize.None })
		local ZIndex = ContentResult.ZIndex
		local UIScale = if p4.lift then ContentResult:FindFirstChildWhichIsA("UIScale") or Host.UIScale({
			Name = "TravelLift",
			Parent = Compose.static(ContentResult)
		}) else nil
		local Scale = if UIScale then UIScale.Scale else 1
		local v1 = 1
		local NewMotionScalesTravelLift = 1
		local StyleLinkResult = Host.StyleLink({})
		StyleLinkResult.Parent = ContentResult
		local ReducedResult = ReducedFunction(p1)
		local v2 = assert(Compose.currentOwner())
		local ReadResult = ReadFunction(p4.destination)
		local Gui = nil
		local Callback = nil
		Compose.cleanup(function()
			-- upvalues: Callback (ref)
			if Callback then
				Callback()
			end
		end)
		
		local function retire()
			-- upvalues: Compose (upval), v2 (copy)
			if task and task.defer then
				task.defer(Compose.owner.dispose, v2)
				
				return
			else
				Compose.owner.dispose(v2)
			end
		end
		
		Runtime.connect(ContentResult, "Destroying", retire)
		Runtime.connect(FrameResult, "Destroying", retire)
		local v3 = nil
		local Gui1 = nil
		local ParentResult = nil
		local Initial = {
			0,
			0,
			0,
			0,
			1
		}
		local Copy = table.clone(Initial)
		local Flag = false
		local Flag1 = false
		local v4 = nil
		local LayoutUnitResults = {}
		
		local function contentInsets(Frame)
			-- upvalues: p1 (upval)
			local ScaledScaleStyled = 1
			local Parent = Frame
			while Parent do
				local UIScale = Parent:FindFirstChildWhichIsA("UIScale")
				
				if UIScale then
					ScaledScaleStyled *= UIScale:GetStyled("Scale")
				end
				Parent = Parent.Parent
			end
			local ScaledBorderSizePixelStyled = if Frame:GetStyled("BorderMode") == p1.types.Enum.BorderMode.Inset then Frame:GetStyled("BorderSizePixel") * ScaledScaleStyled else 0
			local NewScale: number = ScaledBorderSizePixelStyled
			local NewScale1: number = ScaledBorderSizePixelStyled
			local NewScale2: number = ScaledBorderSizePixelStyled
			local NewScale3: number = ScaledBorderSizePixelStyled
			local UIPadding = Frame:FindFirstChildWhichIsA("UIPadding")
			
			if UIPadding then
				local AbsoluteSize = Frame.AbsoluteSize
				
				local function _(Name, p5)
					-- upvalues: UIPadding (copy), ScaledBorderSizePixelStyled (copy), ScaledScaleStyled (ref)
					local Styled = UIPadding:GetStyled(Name)
					
					return Styled.Scale * math.max(0, p5 - ScaledBorderSizePixelStyled * 2) + Styled.Offset * ScaledScaleStyled
				end
				
				local PaddingLeftStyled = UIPadding:GetStyled("PaddingLeft")
				NewScale += PaddingLeftStyled.Scale * math.max(0, AbsoluteSize.X - ScaledBorderSizePixelStyled * 2) + PaddingLeftStyled.Offset * ScaledScaleStyled
				local PaddingRightStyled = UIPadding:GetStyled("PaddingRight")
				NewScale2 += PaddingRightStyled.Scale * math.max(0, AbsoluteSize.X - ScaledBorderSizePixelStyled * 2) + PaddingRightStyled.Offset * ScaledScaleStyled
				local PaddingTopStyled = UIPadding:GetStyled("PaddingTop")
				NewScale1 += PaddingTopStyled.Scale * math.max(0, AbsoluteSize.Y - ScaledBorderSizePixelStyled * 2) + PaddingTopStyled.Offset * ScaledScaleStyled
				local PaddingBottomStyled = UIPadding:GetStyled("PaddingBottom")
				NewScale3 += PaddingBottomStyled.Scale * math.max(0, AbsoluteSize.Y - ScaledBorderSizePixelStyled * 2) + PaddingBottomStyled.Offset * ScaledScaleStyled
			end
			return NewScale, NewScale1, NewScale2, NewScale3
		end
		
		local function bounds(Frame: Frame)
			-- upvalues: TypesVector2 (upval), contentInsets (copy)
			local AbsolutePosition = Frame.AbsolutePosition
			local AbsoluteSize = Frame.AbsoluteSize
			
			if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then
				AbsolutePosition = TypesVector2.new(Frame.Position.X.Offset, Frame.Position.Y.Offset)
				AbsoluteSize = TypesVector2.new(Frame.Size.X.Offset, Frame.Size.Y.Offset)
			end
			local ContentInsetsResult, ContentInsetsResult2, ContentInsetsResult3, ContentInsetsResult4 = contentInsets(Frame)
			
			return {
				AbsolutePosition.X + ContentInsetsResult,
				AbsolutePosition.Y + ContentInsetsResult2,
				math.max(0, AbsoluteSize.X - ContentInsetsResult - ContentInsetsResult3),
				math.max(0, AbsoluteSize.Y - ContentInsetsResult2 - ContentInsetsResult4),
				1
			}
		end
		
		local function common(Frame, Frame1)
			local List = {}
			local Parent = Frame.Parent
			while Parent do
				table.insert(List, Parent)
				Parent = Parent.Parent
			end
			local Parent1 = Frame1.Parent
			while Parent1 and not table.find(List, Parent1) do
				Parent1 = Parent1.Parent
			end
			local function clear(Frame): boolean
				local Frame1 = Frame
				while Frame1 do
					if Frame1:FindFirstChildWhichIsA("UIScale") or Frame1:IsA("GuiObject") and Frame1.ClipsDescendants then
						return false
					end
					Frame1 = Frame1.Parent
				end
				return true
			end
			
			return if Parent1 and Parent1:IsA("GuiBase2d") and not Parent1:FindFirstChildWhichIsA("UILayout") and clear(Frame) and clear(Frame1) then Parent1 else nil
		end
		
		local function paint(Entry)
			-- upvalues: Compose (upval), v2 (copy), v3 (ref), ReadResult (ref), ContentResult (copy), Initial (ref), Gui1 (ref), LayoutUnitResults (copy), NewMotionScalesTravelLift (ref), Flag1 (ref), p4 (copy), v1 (ref), p1 (upval), UIScale (ref), Scale (copy), contentInsets (copy), TypesVector2 (upval), TypesUDim2 (upval)
			if Compose.owner.isDisposed(v2) then return end
			if v3 and (ReadResult.Parent == nil or ContentResult.Parent == nil) then
				Compose.owner.dispose(v2)
				
				return
			end
			Initial = table.clone(Entry)
			local Frame = Gui1
			
			if not Frame then return end
			local Largest = math.max(LayoutUnitResults[Frame]:peek(), 0.001)
			local ClampedValue = math.clamp(Entry[5], 0, 1)
			NewMotionScalesTravelLift = if Flag1 and p4.lift then v1 + (1 - v1) * ClampedValue + (p1.metric("motion.scales.travelLift") - 1) * 4 * ClampedValue * (1 - ClampedValue) else 1
			
			if UIScale then
				UIScale.Scale = Scale * NewMotionScalesTravelLift
			end
			local ScaledMotionDistancesTravelArc = if p4.path == "arc" and p4.motion ~= "spring" then -4 * p1.metric("motion.distances.travelArc") * Entry[5] * (1 - Entry[5]) else 0
			local Initial1 = Initial
			Initial1[2] += ScaledMotionDistancesTravelArc * Largest
			local AbsolutePosition = Frame.AbsolutePosition
			
			if Frame:IsA("ScrollingFrame") then
				AbsolutePosition -= Frame.CanvasPosition
			end
			if Frame:IsA("GuiObject") then
				local ContentInsetsResult, ContentInsetsResult2 = contentInsets(Frame)
				AbsolutePosition += TypesVector2.new(ContentInsetsResult, ContentInsetsResult2)
			end
			ContentResult.Position = TypesUDim2.fromOffset((Entry[1] - AbsolutePosition.X - Entry[3] * (NewMotionScalesTravelLift - 1) / 2) / Largest, (Entry[2] - AbsolutePosition.Y - Entry[4] * (NewMotionScalesTravelLift - 1) / 2) / Largest + ScaledMotionDistancesTravelArc)
			ContentResult.Size = TypesUDim2.fromOffset(Entry[3] / Largest, Entry[4] / Largest)
			ContentResult.Visible = true
			
			if ContentResult.Parent ~= Frame then
				ContentResult.Parent = Frame
			end
		end
		
		local function land()
			-- upvalues: Compose (upval), v2 (copy), ReadResult (ref), Flag1 (ref), ZIndex (copy), ContentResult (copy), v1 (ref), NewMotionScalesTravelLift (ref), Flag (ref), Gui1 (ref), LayoutUnitResults (copy), p1 (upval), v4 (ref), Copy (ref), v3 (ref), FrameResult (copy), p4 (copy)
			if Compose.owner.isDisposed(v2) or ReadResult.Parent == nil then
				Compose.owner.dispose(v2)
				
				return
			end
			Flag1 = false
			local Largest: number = ZIndex
			local ZIndexStyled: number = ReadResult:GetStyled("ZIndex")
			
			if ZIndex < ZIndexStyled or ReadResult:IsA("GuiButton") then
				Largest = math.max(Largest, ZIndexStyled + 1)
			end
			for _, Gui in ReadResult:GetDescendants() do
				if Gui:IsA("GuiObject") and Gui ~= ContentResult and not Gui:IsDescendantOf(ContentResult) then
					local ZIndexStyled1: number = Gui:GetStyled("ZIndex")
					
					if ZIndex <= ZIndexStyled1 then
						Largest = math.max(Largest, ZIndexStyled1 + 1)
					end
				end
			end
			ContentResult.ZIndex = Largest
			v1 = 1
			NewMotionScalesTravelLift = 1
			
			if not Flag then
				Gui1 = ReadResult
				
				if not LayoutUnitResults[ReadResult] then
					Compose.withOwner(v2, function()
						-- upvalues: LayoutUnitResults (upval), ReadResult (upval), p1 (upval)
						LayoutUnitResults[ReadResult] = p1.layoutUnit(ReadResult)
					end)
				end
			end
			v4.snap(Copy)
			v3 = ReadResult
			FrameResult:SetAttribute("FacetTravelMoving", false)
			
			if p4.onLanded then
				p4.onLanded(ReadResult)
			end
		end
		
		local function raise()
			-- upvalues: ZIndex (copy), Gui1 (ref), ContentResult (copy), v4 (ref)
			local Largest: number = ZIndex
			local Object = Gui1
			
			if Object then
				for _, Gui in Object:GetChildren() do
					if Gui:IsA("GuiObject") and Gui ~= ContentResult then
						Largest = math.max(Largest, Gui.ZIndex)
					end
				end
			end
			ContentResult.ZIndex = Largest + v4.depth
		end
		
		v4 = TravelEngineModule(p1, {
			initial = Initial,
			carrier = ContentResult,
			target = function()
				-- upvalues: bounds (copy), ReadResult (ref), p4 (copy), Gui1 (ref), LayoutUnitResults (copy), p1 (upval), Initial (ref)
				local BoundsResult = bounds(ReadResult)
				
				if p4.path == "arc" and p4.motion == "spring" then
					BoundsResult[2] -= 4 * p1.metric("motion.distances.travelArc") * (if Gui1 and LayoutUnitResults[Gui1] then LayoutUnitResults[Gui1]:peek() else 1) * Initial[5] * (1 - Initial[5])
				end
				return BoundsResult
			end,
			sample = paint,
			complete = land,
			start = function()
				-- upvalues: p4 (copy), ReadResult (ref)
				if p4.onStarted then
					p4.onStarted(ReadResult)
				end
			end,
			delay = function()
				-- upvalues: p4 (copy), p1 (upval)
				local StaggerResult = if type(p4.stagger) == "function" then p4.stagger() else p4.stagger or 0
				assert(StaggerResult >= 0 and StaggerResult < 1e999, "Facet UI.Travel: stagger must be finite and nonnegative")
				
				return StaggerResult * p1.metric("motion.durations.travelStagger")
			end,
			reduced = function()
				-- upvalues: ReducedResult (copy)
				return ReducedResult()
			end,
			motion = p4.motion or "ease",
			duration = p1.metric("motion.durations.travel"),
			ease = p1.motionEase("travel"),
			spring = p1.motionSpring("travel")
		})
		v4.snap(Initial)
		
		local function retarget()
			-- upvalues: Compose (upval), v2 (copy), v3 (ref), ContentResult (copy), ReadResult (ref), Copy (ref), bounds (copy), Flag1 (ref), v4 (ref), Initial (ref), Flag (ref), land (copy), common (copy), Gui1 (ref), ParentResult (ref), LayoutUnitResults (copy), p1 (upval), v1 (ref), NewMotionScalesTravelLift (ref), raise (copy), paint (copy), FrameResult (copy)
			if Compose.owner.isDisposed(v2) then return end
			if v3 and ContentResult.Parent == nil then
				Compose.owner.dispose(v2)
				
				return
			end
			if ReadResult.Parent then
				Copy = bounds(ReadResult)
				
				if v3 == ReadResult and not Flag1 then
					v4.snap(Copy)
					
					return
				end
				if not Flag1 and v3 and ContentResult.AbsoluteSize.X > 0 and ContentResult.AbsoluteSize.Y > 0 then
					Initial = {
						ContentResult.AbsolutePosition.X,
						ContentResult.AbsolutePosition.Y,
						ContentResult.AbsoluteSize.X,
						ContentResult.AbsoluteSize.Y,
						1
					}
				end
				if Copy[3] <= 0 or Copy[4] <= 0 then return end
				if not Flag1 and v3 and v3 ~= ReadResult and (math.abs(Initial[1] - Copy[1]) < 0.5 and math.abs(Initial[2] - Copy[2]) < 0.5 and math.abs(Initial[3] - Copy[3]) < 0.5 and math.abs(Initial[4] - Copy[4]) < 0.5) then
					Flag = false
					land()
					
					return
				end
				local CommonResult = if v3 then common(v3, ReadResult) else common(ReadResult, ReadResult)
				Flag = CommonResult ~= nil
				Gui1 = CommonResult or ParentResult
				
				if Gui1 then
					if not LayoutUnitResults[Gui1] then
						local Gui = Gui1
						Compose.withOwner(v2, function()
							-- upvalues: LayoutUnitResults (upval), Gui (copy), p1 (upval)
							LayoutUnitResults[Gui] = p1.layoutUnit(Gui)
						end)
					end
					if v3 == nil and not Flag1 then
						land()
						
						return
					else
						v1 = NewMotionScalesTravelLift
						Flag1 = true
						Initial[5] = 0
						raise()
						paint(Initial)
						v4.rebase(Initial)
						FrameResult:SetAttribute("FacetTravelMoving", true)
						v4.retarget()
						
						return
					end
				elseif v3 == nil and not Flag1 then
					land()
				end
				return
			elseif v3 then
				Compose.owner.dispose(v2)
				
				return
			else
				ContentResult.Visible = false
			end
		end
		
		local OverlayResult = p3.overlay(FrameResult, true, function()
			-- upvalues: ParentResult (ref), p3 (upval), FrameResult (copy), LayoutUnitResults (copy), Compose (upval), v2 (copy), p1 (upval), Host (upval), Runtime (upval), StyleLinkResult (copy), retarget (copy)
			ParentResult = p3.parent(FrameResult)
			
			if ParentResult and not LayoutUnitResults[ParentResult] then
				local ParentResult1 = ParentResult
				Compose.withOwner(v2, function()
					-- upvalues: LayoutUnitResults (upval), ParentResult1 (copy), p1 (upval)
					LayoutUnitResults[ParentResult1] = p1.layoutUnit(ParentResult1)
				end)
			end
			local TravelPortal = Host.Folder({ Name = "TravelPortal" })
			Runtime.connect(TravelPortal, "ChildAdded", Compose.bindOwner(function(StyleLink)
				-- upvalues: StyleLinkResult (upval), Runtime (upval), Compose (upval), v2 (upval)
				if StyleLink:IsA("StyleLink") then
					StyleLinkResult.StyleSheet = StyleLink.StyleSheet
					Runtime.connect(StyleLink, "Changed", function(p5)
						-- upvalues: Compose (upval), v2 (upval), StyleLinkResult (upval), StyleLink (copy)
						if p5 == "StyleSheet" and not Compose.owner.isDisposed(v2) then
							StyleLinkResult.StyleSheet = StyleLink.StyleSheet
						end
					end)
				end
			end))
			retarget()
			
			return TravelPortal
		end)
		Runtime.mountFragment(function()
			-- upvalues: OverlayResult (copy)
			return { OverlayResult }
		end, FrameResult)
		Compose.watch(function(p5)
			-- upvalues: ReadFunction (upval), p4 (copy), p1 (upval), Gui (ref), Callback (ref), Compose (upval), v2 (copy), Runtime (upval), retire (copy), ReadResult (ref), Flag1 (ref), Gui1 (ref), Copy (ref), bounds (copy), retarget (copy)
			local ReadResult1 = ReadFunction(p4.destination, p5)
			assert(ReadResult1:IsA("GuiObject"), "Facet UI.Travel: destination must be a GuiObject")
			p1.read(p1.observe.AbsolutePosition(ReadResult1), p5)
			p1.read(p1.observe.AbsoluteSize(ReadResult1), p5)
			p1.read(p1.observe.Position(ReadResult1), p5)
			
			if Gui ~= ReadResult1 then
				if Callback then
					Callback()
				end
				Gui = ReadResult1
				Compose.withOwner(v2, function()
					-- upvalues: Callback (upval), Runtime (upval), ReadResult1 (copy), retire (upval)
					Callback = Runtime.connect(ReadResult1, "Destroying", retire)
				end)
			end
			local IsNotReadResultMatch = ReadResult ~= ReadResult1
			
			if not IsNotReadResultMatch and not Flag1 and Gui1 == ReadResult1 then
				local Parent = ReadResult1
				while Parent do
					local FacetTransitionZoomAttribute = Parent:GetAttribute("FacetTransitionZoom")
					
					if type(FacetTransitionZoomAttribute) == "number" and FacetTransitionZoomAttribute ~= 1 then return end
					Parent = Parent.Parent
				end
			end
			ReadResult = ReadResult1
			
			if Flag1 and not IsNotReadResultMatch then
				Copy = bounds(ReadResult)
				
				return
			else
				retarget()
			end
		end)
		Runtime.connect(FrameResult, "AncestryChanged", retarget)
		Compose.watch(function(p6)
			-- upvalues: ReducedResult (copy), Flag1 (ref), v4 (ref)
			if ReducedResult(p6) and Flag1 then
				v4.retarget()
			end
		end)
		
		if p4.transparency then
			assert(ContentResult:IsA("CanvasGroup"), "Facet UI.Travel: transparency requires CanvasGroup content")
			local TweenResult = Runtime.tween(function(p6)
				-- upvalues: p1 (upval), p4 (copy)
				return p1.read(p4.transparency, p6)
			end, {
				seconds = p1.metric("motion.durations.travelFade"),
				ease = p1.motionEase("travel"),
				reducedMotion = ReducedResult
			})
			Compose.watch(function(Callback)
				-- upvalues: ContentResult (copy), TweenResult (copy)
				ContentResult.GroupTransparency = Callback(TweenResult)
			end)
		end
		return FrameResult
	end
	
	p2.Travel = p1.construct("Travel", function(p5)
		-- upvalues: Compose (copy), build (copy)
		return Compose.withOwner(Compose.owner.createChild(assert(Compose.currentOwner())), function()
			-- upvalues: build (upval), p5 (copy)
			return (build(p5))
		end)
	end)
end