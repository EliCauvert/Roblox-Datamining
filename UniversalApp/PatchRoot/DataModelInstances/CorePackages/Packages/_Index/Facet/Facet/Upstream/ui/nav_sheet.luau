local _ = require("./control_types")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local FontReadinessModule = require("./font_readiness")
local _ = require("./navigation_props")
local NavSheetDetentsModule = require("./nav_sheet_detents")
local NavSheetGestureModule = require("./nav_sheet_gesture")
local NavSheetContentModule = require("./nav_sheet_content")
local TransitionModule = require("./transition")
local OverlayArrivalModule = require("./overlay_arrival")
local GlassModule = require("./glass")
local VisualTargetModule = require("./visual_target")
local list = {
	"title", "content", "detent", "detents", "isPresented", "onPresentedChange",
	"interactiveDismissDisabled", "dragIndicator", "placement", "edge", "width",
	"closeButton", "header", "hero", "actions", "actionLayout", "contentInset",
	"scrollPolicy", "transition", "initialFocus", "guide", "guideAlignment"
}

return function(p1, p2, p3)
	-- upvalues: NavSheetDetentsModule (copy), NavSheetGestureModule (copy), NavSheetContentModule (copy), TransitionModule (copy), OverlayArrivalModule (copy), VisualTargetModule (copy), GlassModule (copy), FontReadinessModule (copy), list (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadSourceFunction = p1.readSource
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local Frames = Runtime.host.frames
	local NavSheetDetentsModuleResult = NavSheetDetentsModule(p1)
	local PrepareFunction = NavSheetDetentsModuleResult.prepare
	local WritableDetentFunction = NavSheetDetentsModuleResult.writableDetent
	local NavSheetGestureModuleResult = NavSheetGestureModule(p1, p2, p3, NavSheetDetentsModuleResult.word)
	local NavSheetContentModuleResult = NavSheetContentModule(p1, p2, p3)
	
	local function modalFor(p4, p5, p6, p7, p8, FrameResult)
		-- upvalues: TransitionModule (upval), NavSheetGestureModuleResult (copy), NavSheetContentModuleResult (copy), OverlayArrivalModule (upval), p1 (copy), Compose (copy), p3 (copy), Runtime (copy), TypesUDim2 (copy), TypesVector2 (copy), TypesEnum (copy), VisualTargetModule (upval), ReadSourceFunction (copy), GlassModule (upval), Frames (copy), FontReadinessModule (upval)
		TransitionModule.check(p4.transition)
		assert(p4.initialFocus == nil or (type(p4.initialFocus) == "string" or type(p4.initialFocus) == "function"), "Facet.Sheet: initialFocus must be a name or a function that returns one")
		local NavSheetGestureModuleResultResult = NavSheetGestureModuleResult(p4, p5, p6, p7, p8, FrameResult)
		local Placed = NavSheetGestureModuleResultResult.placed
		local Edge = NavSheetGestureModuleResultResult.edge
		local Ready = NavSheetGestureModuleResultResult.ready
		local TowardFunction = NavSheetGestureModuleResultResult.toward
		local PulledFunction = NavSheetGestureModuleResultResult.pulled
		local PaintedFunction = NavSheetGestureModuleResultResult.painted
		local KeyboardFunction = NavSheetGestureModuleResultResult.keyboard
		local StandingFunction = NavSheetGestureModuleResultResult.standing
		local LevelFunction = NavSheetGestureModuleResultResult.level
		local Handle = NavSheetGestureModuleResultResult.handle
		local DetectorFunction = NavSheetGestureModuleResultResult.detector
		local PadFunction = NavSheetGestureModuleResultResult.pad
		local CanDismissFunction = NavSheetGestureModuleResultResult.canDismiss
		local InteractiveFunction = NavSheetGestureModuleResultResult.interactive
		local LowestFunction = NavSheetGestureModuleResultResult.lowest
		local Unit = NavSheetGestureModuleResultResult.unit
		local Extent = NavSheetGestureModuleResultResult.extent
		local OutsetFunction = NavSheetGestureModuleResultResult.outset
		local NavSheetContentModuleResultResult = NavSheetContentModuleResult(p4, NavSheetGestureModuleResultResult)
		local Room = NavSheetContentModuleResultResult.room
		local Plaqued = NavSheetContentModuleResultResult.plaqued
		local UsableFunction = NavSheetContentModuleResultResult.usable
		local PressFunction = NavSheetContentModuleResultResult.press
		local PanelWidth = NavSheetContentModuleResultResult.panelWidth
		local ContentSize = NavSheetContentModuleResultResult.contentSize
		
		local function _(Callback)
			-- upvalues: Placed (copy), Edge (copy)
			local CallbackResult = Callback(Placed)
			local v1: number = if CallbackResult == "side" then if Edge == "left" then 0 else 1 else 0.5
			
			if CallbackResult == "center" then
				return v1, 0.5
			else
				return v1, 1
			end
		end
		
		local AppearanceResult = nil
		local CreateResult = nil
		
		if p4.transition == nil then
			AppearanceResult = p3.appearance(p8, p1.motionTiming("sheet"), Ready)
		else
			local ReadyResult = OverlayArrivalModule.ready(p8)
			CreateResult = TransitionModule.create(p1, if p4.transition == false then {} else p4.transition, Compose.formula(function(Callback): boolean
				-- upvalues: p8 (copy)
				return p8 == nil or not Callback(p8.exiting)
			end), false, Compose.formula(function(Callback)
				-- upvalues: Ready (copy), ReadyResult (copy)
				return Callback(Ready) and (ReadyResult == nil or Callback(ReadyResult))
			end), p4.transition == false)
			local v1 = assert(CreateResult)
			
			if p8 then
				TransitionModule.completions[p8] = v1.completed
				Compose.cleanup(function()
					-- upvalues: TransitionModule (upval), p8 (copy)
					TransitionModule.completions[p8] = nil
				end)
			end
			AppearanceResult = {
				travel = function(): number
					return 1
				end,
				opacity = function(p9)
					-- upvalues: p1 (upval), v1 (copy)
					return p1.readSource(v1.opacity, p9)
				end
			}
		end
		local function travel(Callback)
			-- upvalues: AppearanceResult (ref), Placed (copy), TowardFunction (copy), PulledFunction (copy), PanelWidth (copy), PaintedFunction (copy), OutsetFunction (copy)
			local v2 = 1 - AppearanceResult.travel(Callback)
			
			if v2 <= 0 then
				return if Callback(Placed) == "side" then TowardFunction() * PulledFunction(Callback) else 0, 0
			end
			local CallbackResult = Callback(Placed)
			
			if CallbackResult == "side" then
				local PulledResult = PulledFunction(Callback)
				
				return TowardFunction() * (PulledResult + (Callback(PanelWidth) - PulledResult) * v2), 0
			elseif CallbackResult == "center" then
				return 0, 0
			else
				return 0, (math.ceil((PaintedFunction(Callback) + OutsetFunction("bottom", Callback)) * v2))
			end
		end
		
		Runtime.decorate(Room.frame, {
			[Compose.group({ "Position", "Size" })] = function(p9)
				-- upvalues: PadFunction (copy), StandingFunction (copy), NavSheetContentModuleResultResult (copy), TypesUDim2 (upval)
				local Left = PadFunction("left", p9)
				local Top = PadFunction("top", p9)
				
				return TypesUDim2.fromOffset(Left, Top), TypesUDim2.new(1, -Left - PadFunction("right", p9), 0, (math.max(0, StandingFunction(p9) - Top - PadFunction("bottom", p9) - NavSheetContentModuleResultResult.guideReserve(p9))))
			end
		})
		local Frame = {
			Name = "SheetPanel",
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			AnchorPoint = function(Callback)
				-- upvalues: Placed (copy), Edge (copy), TypesVector2 (upval)
				local CallbackResult = Callback(Placed)
				
				return TypesVector2.new(if CallbackResult == "side" then if Edge == "left" then 0 else 1 else 0.5, if CallbackResult == "center" then 0.5 else 1)
			end,
			Position = function(Callback)
				-- upvalues: Placed (copy), Edge (copy), KeyboardFunction (copy), StandingFunction (copy), PaintedFunction (copy), travel (copy), OutsetFunction (copy), TypesUDim2 (upval)
				local CallbackResult = Callback(Placed)
				local v2: number = if CallbackResult == "side" then if Edge == "left" then 0 else 1 else 0.5
				local v3: number = if CallbackResult == "center" then 0.5 else 1
				local StandingResultDelta = (if v3 == 1 then -KeyboardFunction(Callback) else -KeyboardFunction(Callback) / 2) + StandingFunction(Callback) - PaintedFunction(Callback)
				local TravelResult, TravelResult2 = travel(Callback)
				
				return TypesUDim2.new(v2, TravelResult + (OutsetFunction("right", Callback) - OutsetFunction("left", Callback)) / 2, v3, StandingResultDelta + TravelResult2 + OutsetFunction("bottom", Callback))
			end,
			AutomaticSize = TypesEnum.AutomaticSize.None,
			Size = function(Callback)
				-- upvalues: TypesUDim2 (upval), PanelWidth (copy), StandingFunction (copy), OutsetFunction (copy)
				return TypesUDim2.fromOffset(Callback(PanelWidth), StandingFunction(Callback) + OutsetFunction("bottom", Callback))
			end,
			GroupTransparency = function(Callback): number
				-- upvalues: CreateResult (ref), Ready (copy), LevelFunction (copy), AppearanceResult (ref)
				return if CreateResult then 0 elseif Callback(Ready) then if LevelFunction(Callback) == "limited" then 1 - AppearanceResult.opacity(Callback) else 0 else 1
			end
		}
		
		for _, value in {
			Handle,
			Room.frame,
			p1.corner(),
			DetectorFunction("PanelDrag", "panel")
		} do
			Frame[#Frame + 1] = value
		end
		if NavSheetContentModuleResultResult.guide then
			Frame[#Frame + 1] = NavSheetContentModuleResultResult.guide
		end
		local FadeResult = p1.fade(Frame, true)
		local SheetTransition = FadeResult
		
		if CreateResult then
			local CreateResult1 = CreateResult
			SheetTransition = p1.fade({
				Name = "SheetTransition",
				BackgroundTransparency = 1,
				AnchorPoint = Frame.AnchorPoint,
				Position = Frame.Position,
				Size = Frame.Size,
				GroupTransparency = function(Callback)
					-- upvalues: CreateResult1 (copy)
					return Callback(CreateResult1.transparency)
				end,
				Interactable = function(Callback): boolean
					-- upvalues: CreateResult1 (copy), p8 (copy)
					return not Callback(CreateResult1.interacting) and (Callback(CreateResult1.opacity) == 1 and (p8 == nil or not Callback(p8.exiting)))
				end,
				FadeResult
			}, nil, false)
			Runtime.decorate(FadeResult, {
				AnchorPoint = TypesVector2.zero,
				Position = TypesUDim2.fromScale(0, 0),
				Size = TypesUDim2.fromScale(1, 1)
			})
			CreateResult1.apply(FadeResult)
		end
		VisualTargetModule.bind(Compose, FrameResult, SheetTransition)
		p1.styled(FadeResult, "sheet")
		Runtime.decorate(FadeResult, {
			Attributes = {
				FacetPlacement = function(Callback)
					-- upvalues: Placed (copy)
					return Callback(Placed)
				end
			}
		})
		p3.skin(FadeResult, nil, {
			padding = false,
			title = if p4.header == nil then p4.title else nil,
			onCaption = function(p9)
				-- upvalues: Plaqued (copy)
				Plaqued:set(p9)
			end
		})
		local ModalResult = p3.modal(function()
			-- upvalues: SheetTransition (ref)
			return SheetTransition
		end, function()
			-- upvalues: CanDismissFunction (copy), p6 (copy), UsableFunction (copy), PressFunction (copy), InteractiveFunction (copy)
			if not CanDismissFunction() then return end
			if p6.cancel and UsableFunction(p6.cancel) then
				PressFunction(p6.cancel)
				
				return
			else
				InteractiveFunction("cancel")
			end
		end, {
			entry = NavSheetContentModuleResultResult.entry,
			canDismiss = function(p9)
				-- upvalues: CanDismissFunction (copy)
				return CanDismissFunction(p9)
			end,
			onOutside = function()
				-- upvalues: InteractiveFunction (copy)
				InteractiveFunction("outside")
			end,
			exiting = if p8 then p8.exiting else nil,
			appearance = function(p9)
				-- upvalues: AppearanceResult (ref), CanDismissFunction (copy), ReadSourceFunction (upval), Placed (copy), PanelWidth (copy), PulledFunction (copy), LowestFunction (copy), PaintedFunction (copy)
				local OpacityResult = AppearanceResult.opacity(p9)
				
				if not CanDismissFunction(p9) then
					return OpacityResult
				elseif ReadSourceFunction(Placed, p9) == "side" then
					local Source: number = ReadSourceFunction(PanelWidth, p9)
					
					return if Source > 0 then OpacityResult * math.clamp(1 - PulledFunction(p9) / Source, 0, 1) else OpacityResult
				else
					local LowestResult: number = LowestFunction(p9)
					
					return if LowestResult > 0 then OpacityResult * math.clamp(PaintedFunction(p9) / LowestResult, 0, 1) else OpacityResult
				end
			end
		})
		local LayoutUnitResult = p1.layoutUnit(ModalResult)
		Compose.watch(function(Callback)
			-- upvalues: Unit (copy), LayoutUnitResult (copy)
			Unit:set(Callback(LayoutUnitResult))
		end)
		local Reached = NavSheetGestureModuleResultResult.reached
		
		if Reached then
			local ReachResult = GlassModule.reach(p1, ModalResult, false)
			Compose.watch(function(Callback)
				-- upvalues: Reached (copy), ReachResult (copy)
				Reached:set(Callback(ReachResult))
			end)
			GlassModule.hold(p1, FadeResult, (Compose.formula(function(p9): boolean
				-- upvalues: OutsetFunction (copy)
				return OutsetFunction("left", p9) + OutsetFunction("right", p9) + OutsetFunction("bottom", p9) > 0
			end)))
		end
		local LayoutSizeResult = p1.layoutSize(ModalResult, Unit)
		local CellResult = Compose.cell(false)
		Compose.watch(function(Callback)
			-- upvalues: LayoutSizeResult (copy), Extent (copy), CellResult (copy)
			local CallbackResult = Callback(LayoutSizeResult)
			
			if CallbackResult.Y > 0 then
				Extent:set(CallbackResult)
				CellResult:set(true)
			end
		end)
		
		if Frames and not Ready:peek() then
			local function contentGeometry(): string
				-- upvalues: FadeResult (copy)
				local AbsolutePosition = FadeResult.AbsolutePosition
				local List = {}
				
				for _, descendant in FadeResult:GetDescendants() do
					if descendant:IsA("GuiObject") then
						local Text: string = `{descendant.AbsolutePosition - AbsolutePosition}:{descendant.AbsoluteSize}:{descendant.Visible}`
						
						if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
							Text ..= `:{descendant.TextBounds}`
						end
						table.insert(List, Text)
					end
				end
				return table.concat(List, ";")
			end
			
			local FontReadinessModuleResult = FontReadinessModule(p1, { FadeResult })
			local SettledResult = Runtime.settled({
				ready = function()
					-- upvalues: FontReadinessModuleResult (copy)
					return FontReadinessModuleResult()
				end,
				sample = function(): string
					-- upvalues: Extent (copy), FadeResult (copy), ContentSize (copy), Room (copy), contentGeometry (copy)
					return string.format("%d %d %d %d %d %s", Extent:peek().X, Extent:peek().Y, FadeResult.AbsoluteSize.X, ContentSize:peek().Y, Room.pinned:peek(), contentGeometry())
				end,
				equals = function(p9, p10): boolean
					-- upvalues: CellResult (copy)
					return CellResult:peek() and p9 == p10
				end,
				timeout = p1.metric("motion.restLimit")
			})
			Compose.watch(function(Callback)
				-- upvalues: SettledResult (copy), Ready (copy)
				if Callback(SettledResult) then
					Ready:set(true)
				end
			end)
		end
		p3.keep(p4.content, p4.header, p4.hero and p4.hero.content)
		
		return ModalResult
	end
	
	p2.Sheet = p1.construct("Sheet", function(p9)
		-- upvalues: PrepareFunction (copy), WritableDetentFunction (copy), Host (copy), p1 (copy), list (upval), TypesUDim2 (copy), VisualTargetModule (upval), Compose (copy), Runtime (copy), p3 (copy), modalFor (copy)
		assert(p9.onPresentedChange == nil or type(p9.onPresentedChange) == "function", "Sheet.onPresentedChange must be a function")
		local PrepareResult = PrepareFunction(p9)
		local WritableDetentResult = WritableDetentFunction(p9, PrepareResult)
		assert(type(p9.isPresented) == "table" and p9.isPresented.set, "Sheet.isPresented requires a writable Compose cell")
		local FrameResult = Host.Frame(p1.props(p9, list, {
			Name = "Sheet",
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromOffset(0, 0)
		}))
		FrameResult:SetAttribute("FacetSheet", true)
		VisualTargetModule.create(Compose, FrameResult)
		Runtime.connect(FrameResult, "AttributeChanged", function(p10)
			-- upvalues: FrameResult (copy), p9 (copy)
			local FacetPresentAttribute = FrameResult:GetAttribute("FacetPresent")
			
			if p10 == "FacetPresent" and type(FacetPresentAttribute) == "boolean" then
				p9.isPresented:set(FacetPresentAttribute)
			end
		end)
		p3.attach(FrameResult, {
			p3.overlay(FrameResult, p9.isPresented, function(p10)
				-- upvalues: modalFor (upval), p9 (copy), WritableDetentResult (copy), PrepareResult (copy), FrameResult (copy)
				return (modalFor(p9, WritableDetentResult, PrepareResult, nil, p10, FrameResult))
			end, {
				motion = p1.motionTiming("sheet"),
				failure = function(p10)
					-- upvalues: FrameResult (copy), p9 (copy), p1 (upval), Host (upval)
					FrameResult:SetAttribute("FacetError", (tostring(p10)))
					p9.isPresented:set(false)
					
					if p1.config.onError then
						p1.config.onError(p10)
					elseif task and task.spawn then
						task.spawn(error, "Facet Sheet did not open because its content failed to build: " .. tostring(p10), 0)
					end
					return Host.Folder("FailedSheet")({})
				end
			})
		})
		
		return FrameResult
	end)
	
	function p3.sheetModal(p9, p10, p11)
		-- upvalues: PrepareFunction (copy), modalFor (copy), WritableDetentFunction (copy)
		local PrepareResult = PrepareFunction(p9)
		
		return (modalFor(p9, WritableDetentFunction(p9, PrepareResult), PrepareResult, p10, p11, nil))
	end
end