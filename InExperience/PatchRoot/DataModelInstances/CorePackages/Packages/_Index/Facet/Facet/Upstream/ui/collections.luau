local CollectionTreeModule = require("./collection_tree")
local _ = require("./collection_tree")
local CollectionStateModule = require("./collection_state")
local CollectionSlotsModule = require("./collection_slots")
local CollectionRowsModule = require("./collection_rows")
local CollectionFlingModule = require("./collection_fling")
local CollectionFocusModule = require("./collection_focus")
local CollectionNavigationModule = require("./collection_navigation")
local ScrollLockModule = require("./scroll_lock")
local ScrollInitialModule = require("./scroll_initial")
local CollectionReorderModule = require("./collection_reorder")
local CollectionSnapModule = require("./collection_snap")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./engine_types")
local _ = require("./collection_types")
local _ = require("./collection_props")
local _ = require("./control_types")

return function(p1, p2)
	-- upvalues: CollectionTreeModule (copy), CollectionStateModule (copy), CollectionReorderModule (copy), CollectionSlotsModule (copy), CollectionRowsModule (copy), ScrollLockModule (copy), CollectionFlingModule (copy), CollectionFocusModule (copy), CollectionNavigationModule (copy), CollectionSnapModule (copy), ScrollInitialModule (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local Observe = p1.observe
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local list = {
		"children", "expanded", "onExpansionChange", "indent", "from", "slots",
		"slotControls", "selectionFrom", "selectionIndicator", "minColumnWidth",
		"minColumns", "hug", "rowActions", "key", "render", "contentOverflow", "mode",
		"snap", "recycle", "reducedMotion", "arrival", "direction", "itemSize",
		"cards", "gap", "crossGap", "columns", "overscan", "measured", "measure",
		"status", "controls", "follow", "followThreshold", "scrollReset",
		"maxRetained", "focus", "initialFocus", "focusPolicy", "restoreFocus",
		"autoFocus", "wrapFocus", "disabled", "selection", "selectionMode",
		"selectable", "reorderable", "collectionId", "drag", "drop", "rowDrop",
		"onReorder", "movable", "deletable", "rowDeletable", "onDelete", "editing",
		"dragLabel", "autoscroll", "onSelectionChange", "onActivate", "onReachEnd"
	}
	
	local function collection(Tbl, p3, Callback1, p4, p5, Callback, p6)
		-- upvalues: ReadFunction (copy), CollectionTreeModule (upval), p1 (copy), p2 (copy), CollectionStateModule (upval), TypesVector2 (copy), CollectionReorderModule (upval), Compose (copy), CollectionSlotsModule (upval), CollectionRowsModule (upval), list (copy), TypesUDim2 (copy), TypesEnum (copy), Host (copy), Runtime (copy), ScrollLockModule (upval), CollectionFlingModule (upval), Observe (copy), CollectionFocusModule (upval), CollectionNavigationModule (upval), CollectionSnapModule (upval), ScrollInitialModule (upval)
		assert(Tbl.contentOverflow == nil or table.find({ "visible", "clip", "grow" }, ReadFunction(assert(Tbl.contentOverflow))), "Facet collection contentOverflow must be visible, clip or grow")
		assert(Tbl.snap == nil or (Tbl.snap == "none" or Tbl.snap == "item"), "Facet collection snap must be none or item")
		assert(type(Tbl.render) == "function", "Facet collection requires render(current, placement, key)")
		assert(Tbl.hug == nil or type(Tbl.hug) == "boolean", "Facet collection hug must be a boolean")
		assert(not Tbl.hug or Tbl.mode == "all", "Facet collection hug needs mode = \"all\": it sizes to every row")
		assert(not Tbl.hug or Tbl.itemSize ~= "cards", "Facet collection hug cannot size \"cards\" from its own extent")
		local P3 = p4 or (if Tbl.children then CollectionTreeModule(p1, p2, Tbl, Callback1) else nil)
		
		if P3 then
			assert(p3 == "list" and Tbl.direction ~= "horizontal", "Facet hierarchy needs a vertical list")
			Tbl = table.clone(Tbl)
			Tbl.selectionFrom = Tbl.selectionFrom or P3.all
			Tbl.focus = Tbl.focus or {}
			local P = P3
			Tbl.onActivate = Tbl.onActivate or function(_, p7)
				-- upvalues: P (copy)
				P.toggle(p7)
			end
		end
		local function v32(p7)
			-- upvalues: ReadFunction (upval), P3 (ref), Tbl (ref)
			return ReadFunction(if P3 then P3.from else Tbl.from, p7)
		end
		
		local NewCollectionState = CollectionStateModule.create(p1, Tbl, p3, Callback1, P3, p5, v32)
		local Viewport = NewCollectionState.viewport
		local Cross = NewCollectionState.cross
		local Status = NewCollectionState.status
		local Controls = NewCollectionState.controls
		local Measured = NewCollectionState.measured
		local Horizontal = NewCollectionState.horizontal
		local Retiring = NewCollectionState.retiring
		local MainEdgeFunction = NewCollectionState.mainEdge
		local CrossEdgeFunction = NewCollectionState.crossEdge
		local ScrollFrame = nil
		local Flag = false
		
		local function setOffset(DesiredOffset: number)
			-- upvalues: MainEdgeFunction (copy), Status (copy), Viewport (copy), ScrollFrame (ref), Horizontal (copy), TypesVector2 (upval), Flag (ref)
			local MainEdgeResult: number = MainEdgeFunction()
			local Largest: number = DesiredOffset
			
			if MainEdgeResult > 0 then
				local PeekResult = Status:peek()
				local PeekResult1 = Viewport:peek()
				local ExtentDelta = if PeekResult and PeekResult.extent then PeekResult.extent - PeekResult1.size else 1e999
				Largest = if DesiredOffset <= 0 then 0 elseif ExtentDelta <= DesiredOffset then math.max(0, ExtentDelta) else DesiredOffset + MainEdgeResult
			end
			local CanvasPosition = ScrollFrame.CanvasPosition
			local NewTypesVector = if Horizontal then TypesVector2.new(Largest, CanvasPosition.Y) else TypesVector2.new(CanvasPosition.X, Largest)
			
			if CanvasPosition ~= NewTypesVector then
				Flag = true
				ScrollFrame.CanvasPosition = NewTypesVector
				Flag = false
			end
		end
		
		local CollectionReorderModuleResult = if Tbl.drag or Tbl.drop or Tbl.reorderable or Tbl.deletable or Tbl.editing ~= nil and NewCollectionState.selectionMode ~= "none" and Tbl.selectionIndicator ~= false then CollectionReorderModule(p1, p2, Tbl, v32, Callback1, Controls, function()
			-- upvalues: ScrollFrame (ref)
			return ScrollFrame
		end, NewCollectionState.selection, Compose.cell(nil), Tbl.editing, p3 == "grid", if P3 then P3.location else nil, nil, Tbl.slots) else nil
		local Overlay = if CollectionReorderModuleResult then CollectionReorderModuleResult.overlay else nil
		local CollectionRowsModuleResult = CollectionRowsModule(p1, p2, NewCollectionState, CollectionReorderModuleResult, CollectionSlotsModule(p1, NewCollectionState), p6)
		
		local function followOf(p7): string
			-- upvalues: ReadFunction (upval), Tbl (ref)
			local ReadResult = ReadFunction(Tbl.follow, p7)
			assert(ReadResult == nil or (ReadResult == "end" or ReadResult == "none"), "Facet collection follow must be none or end")
			
			return if ReadResult == "end" then "end" else "none"
		end
		local SwitchResult = nil
		
		if Compose.isValue(Tbl.follow) or type(Tbl.follow) == "function" then
			SwitchResult = Compose.switch(followOf, {
				none = function()
					-- upvalues: CollectionRowsModuleResult (copy)
					return CollectionRowsModuleResult("none")
				end,
				["end"] = function()
					-- upvalues: CollectionRowsModuleResult (copy)
					return CollectionRowsModuleResult("end")
				end
			})
		else
			local ReadResult = ReadFunction(Tbl.follow, nil)
			assert(ReadResult == nil or (ReadResult == "end" or ReadResult == "none"), "Facet collection follow must be none or end")
			SwitchResult = CollectionRowsModuleResult(if ReadResult == "end" then "end" else "none")
		end
		local FormulaResult = Compose.formula(function(Callback)
			-- upvalues: Status (copy), MainEdgeFunction (copy)
			local CallbackResult = Callback(Status)
			local Extent = if CallbackResult and CallbackResult.extent then CallbackResult.extent else 0
			
			return if Extent > 0 then Extent + 2 * MainEdgeFunction(Callback) else 0
		end)
		local PropsResult = p1.props(Tbl, list, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 6,
			SelectionGroup = true,
			Size = if Tbl.hug then function(Callback)
				-- upvalues: FormulaResult (copy), Horizontal (copy), TypesUDim2 (upval)
				local CallbackResult = Callback(FormulaResult)
				
				return if Horizontal then TypesUDim2.new(0, CallbackResult, 1, 0) else TypesUDim2.new(1, 0, 0, CallbackResult)
			end else TypesUDim2.fromScale(1, 1),
			AutomaticCanvasSize = TypesEnum.AutomaticSize.None,
			ScrollingDirection = if Horizontal then TypesEnum.ScrollingDirection.X else TypesEnum.ScrollingDirection.Y,
			VerticalScrollBarInset = if Horizontal then TypesEnum.ScrollBarInset.ScrollBar else nil,
			CanvasSize = function(Callback)
				-- upvalues: FormulaResult (copy), Horizontal (copy), TypesUDim2 (upval)
				local CallbackResult = Callback(FormulaResult)
				
				return if Horizontal then TypesUDim2.fromOffset(CallbackResult, 0) else TypesUDim2.fromOffset(0, CallbackResult)
			end
		})
		PropsResult[#PropsResult + 1] = Compose.show(function(Callback): boolean
			-- upvalues: Tbl (ref), Viewport (copy)
			return Tbl.mode == "all" or Callback(Viewport).size > 0
		end, function()
			-- upvalues: TypesUDim2 (upval), SwitchResult (copy), Host (upval), p1 (upval), Horizontal (copy), MainEdgeFunction (copy), CrossEdgeFunction (copy), p3 (copy), Compose (upval), NewCollectionState (copy), Runtime (upval)
			local config = {
				Name = "Items",
				BackgroundTransparency = 1,
				Size = TypesUDim2.fromScale(1, 1),
				Attributes = { FacetDocumentOrder = true },
				SwitchResult
			}
			
			local function padding()
				-- upvalues: Host (upval), p1 (upval), Horizontal (upval), MainEdgeFunction (upval), CrossEdgeFunction (upval)
				return Host.UIPadding({
					PaddingLeft = function(p7)
						-- upvalues: p1 (upval), Horizontal (upval), MainEdgeFunction (upval), CrossEdgeFunction (upval)
						return p1.types.UDim.new(0, if Horizontal then MainEdgeFunction(p7) else CrossEdgeFunction(p7))
					end,
					PaddingRight = function(p7)
						-- upvalues: p1 (upval), Horizontal (upval), CrossEdgeFunction (upval)
						return p1.types.UDim.new(0, if Horizontal then 0 else CrossEdgeFunction(p7))
					end,
					PaddingTop = function(p7)
						-- upvalues: p1 (upval), Horizontal (upval), CrossEdgeFunction (upval), MainEdgeFunction (upval)
						return p1.types.UDim.new(0, if Horizontal then CrossEdgeFunction(p7) else MainEdgeFunction(p7))
					end,
					PaddingBottom = function(p7)
						-- upvalues: p1 (upval), Horizontal (upval), CrossEdgeFunction (upval)
						return p1.types.UDim.new(0, if Horizontal then CrossEdgeFunction(p7) else 0)
					end
				})
			end
			
			config[#config + 1] = if p3 == "grid" then padding() else Compose.show(function(Callback)
				-- upvalues: NewCollectionState (upval)
				return Callback(NewCollectionState.containsCards)
			end, padding)
			local FrameResult = Host.Frame(config)
			NewCollectionState.rowParent = FrameResult
			
			if not NewCollectionState.rowSignals then
				local AfterLayoutResult = p1.afterLayout(function()
					-- upvalues: NewCollectionState (upval)
					NewCollectionState.mountedVersion:update(function(p7: number): number
						return p7 + 1
					end)
				end)
				Runtime.connect(FrameResult, "ChildAdded", function(Frame: Frame)
					-- upvalues: NewCollectionState (upval), AfterLayoutResult (copy)
					if Frame:IsA("Frame") and NewCollectionState.slotKeys[Frame] ~= nil then
						AfterLayoutResult()
					end
				end)
			end
			Compose.cleanup(function()
				-- upvalues: NewCollectionState (upval), FrameResult (copy)
				if NewCollectionState.rowParent == FrameResult then
					NewCollectionState.rowParent = nil
				end
			end)
			
			return FrameResult
		end)
		PropsResult[#PropsResult + 1] = NewCollectionState.unit
		ScrollFrame = p1.styled(Host.ScrollingFrame(PropsResult), "Collection")
		Compose.cleanup(function()
			-- upvalues: Retiring (copy)
			for i, value in Retiring do
				Retiring[i] = nil
				value()
			end
		end)
		ScrollLockModule.own(ScrollFrame, p1)
		ScrollFrame:SetAttribute("FacetSelectionOwner", true)
		CollectionFlingModule(p1, NewCollectionState, ScrollFrame)
		
		if Overlay then
			Runtime.mount(function()
				-- upvalues: Overlay (copy)
				return Overlay(true)
			end, ScrollFrame)
		end
		local AbsoluteWindowSizeResult = p1.observe.AbsoluteWindowSize(ScrollFrame)
		local AbsoluteSizeResult = p1.observe.AbsoluteSize(ScrollFrame)
		local Zero = TypesVector2.zero
		local Flag1 = false
		local CanvasPositionResult = Observe.CanvasPosition(ScrollFrame)
		local ParentResult = Observe.Parent(ScrollFrame)
		local CellResult = Compose.cell(0)
		Runtime.connect(ScrollFrame, "AncestryChanged", function()
			-- upvalues: CellResult (copy)
			CellResult:update(function(p7: number): number
				return p7 + 1
			end)
		end)
		Compose.watch(function(Callback)
			-- upvalues: NewCollectionState (copy), AbsoluteWindowSizeResult (copy), CanvasPositionResult (copy), ScrollFrame (ref), CellResult (copy), ParentResult (copy), TypesVector2 (upval), Horizontal (copy), MainEdgeFunction (copy), AbsoluteSizeResult (copy), Zero (ref), Flag1 (ref), Cross (copy), Viewport (copy)
			local X: number = Callback(NewCollectionState.unitSize).X
			Callback(AbsoluteWindowSizeResult)
			Callback(CanvasPositionResult)
			local AbsoluteWindowSize = ScrollFrame.AbsoluteWindowSize
			local CanvasPosition = ScrollFrame.CanvasPosition
			Callback(CellResult)
			local CallbackResult = Callback(ParentResult)
			
			if AbsoluteWindowSize.X <= 0 or AbsoluteWindowSize.Y <= 0 then
				while CallbackResult do
					if not CallbackResult:IsA("GuiObject") or CallbackResult.AbsoluteSize.X <= 0 or CallbackResult.AbsoluteSize.Y <= 0 then
						CallbackResult = CallbackResult.Parent
						continue
					end
					local AbsoluteSize = CallbackResult.AbsoluteSize
					local Size = ScrollFrame.Size
					local X1: number = if X > 0 then X else 1
					AbsoluteWindowSize = TypesVector2.new(AbsoluteSize.X * Size.X.Scale + Size.X.Offset * X1, AbsoluteSize.Y * Size.Y.Scale + Size.Y.Offset * X1)
					break
				end
			end
			if X > 0 then
				AbsoluteWindowSize /= X
			end
			local Largest = math.max(0, (if Horizontal then CanvasPosition.X else CanvasPosition.Y) - MainEdgeFunction(Callback))
			local Largest1 = math.max(0, (if Horizontal then AbsoluteWindowSize.X else AbsoluteWindowSize.Y) - 2 * MainEdgeFunction(Callback))
			local CallbackResult1 = Callback(AbsoluteSizeResult)
			
			if CallbackResult1 ~= Zero then
				Zero = CallbackResult1
				Flag1 = false
			end
			local Y = if Horizontal then AbsoluteWindowSize.Y else AbsoluteWindowSize.X
			local v1 = (if Horizontal then CallbackResult1.Y else CallbackResult1.X) / (if X > 0 then X else 1)
			
			if CallbackResult1.X > 0 and CallbackResult1.Y > 0 and math.abs(v1 - Y - ScrollFrame.ScrollBarThickness) < 0.5 then
				Flag1 = true
			end
			Cross:set(if Flag1 then v1 - ScrollFrame.ScrollBarThickness else Y)
			local PeekResult = Viewport:peek()
			
			if PeekResult.offset ~= Largest or PeekResult.size ~= Largest1 then
				Viewport:set({
					offset = Largest,
					size = Largest1,
					offsetRevision = PeekResult.offsetRevision
				})
			end
		end)
		local v2 = nil
		Compose.watch(function(Callback1)
			-- upvalues: Tbl (ref), ReadFunction (upval), v2 (ref), Status (copy), Viewport (copy), NewCollectionState (copy), Callback (copy), setOffset (copy), ScrollFrame (ref), Horizontal (copy), MainEdgeFunction (copy)
			local ReadResult = if Tbl.scrollReset == nil then nil else ReadFunction(Tbl.scrollReset, Callback1)
			local IsNotReadResultMatch: boolean = v2 ~= nil and ReadResult ~= v2
			v2 = ReadResult
			local CallbackResult = Callback1(Status)
			local DesiredOffset = if CallbackResult then CallbackResult.desiredOffset else nil
			local PeekResult = Viewport:peek()
			
			if NewCollectionState.initialFollow and CallbackResult and CallbackResult.total ~= nil and PeekResult.size > 0 then
				NewCollectionState.initialFollow = false
				DesiredOffset = math.max(0, CallbackResult.extent - PeekResult.size)
			end
			local CallbackResult1 = if Callback then Callback(Callback1, PeekResult) else nil
			
			if CallbackResult1 ~= nil then
				DesiredOffset = CallbackResult1
			end
			if IsNotReadResultMatch then
				DesiredOffset = 0
			end
			if DesiredOffset ~= nil then
				setOffset(DesiredOffset)
			end
			if CallbackResult1 ~= nil or IsNotReadResultMatch then
				local PeekResult1 = Viewport:peek()
				local CanvasPosition = ScrollFrame.CanvasPosition
				Viewport:set({
					offset = math.max(0, (if Horizontal then CanvasPosition.X else CanvasPosition.Y) - MainEdgeFunction()),
					size = PeekResult1.size,
					offsetRevision = (PeekResult1.offsetRevision or 0) + 1
				})
			end
		end)
		local CollectionFocusModuleResult, CollectionFocusModuleResult2 = CollectionFocusModule(p1, NewCollectionState, CollectionReorderModuleResult, ScrollFrame, setOffset)
		
		if Tbl.measure then
			Compose.watch(function(p7)
				-- upvalues: ReadFunction (upval), P3 (ref), Tbl (ref), Measured (copy), Callback1 (copy)
				local ReadResult = ReadFunction(if P3 then P3.from else Tbl.from, p7)
				
				if next(Measured:peek()) == nil then return end
				local t = {}
				local t1 = {}
				local Flag = false
				
				for i, value in ReadResult do
					t[Callback1(value, i)] = true
				end
				for i1, value1 in Measured:peek() do
					if t[i1] then
						t1[i1] = value1
					else
						Flag = true
					end
				end
				if Flag then
					Measured:set(t1)
				end
			end)
		end
		CollectionNavigationModule(p1, NewCollectionState, ScrollFrame, CollectionFocusModuleResult, CollectionFocusModuleResult2)
		local OnReachEndFunction = Tbl.onReachEnd
		
		if OnReachEndFunction then
			local Total = -1
			Compose.watch(function(Callback)
				-- upvalues: Status (copy), Total (ref), OnReachEndFunction (copy)
				local CallbackResult = Callback(Status)
				
				if CallbackResult and CallbackResult.total > 0 and CallbackResult.last == CallbackResult.total and CallbackResult.total ~= Total then
					Total = CallbackResult.total
					OnReachEndFunction()
				end
			end)
		end
		if Tbl.snap == "item" or NewCollectionState.cardsMode then
			CollectionSnapModule(p1, Tbl, ScrollFrame, Controls, Status, Viewport, setOffset, function()
				-- upvalues: Flag (ref)
				return Flag
			end, function(): boolean
				-- upvalues: NewCollectionState (copy), Tbl (ref)
				local _, CardLayoutResult2 = NewCollectionState.cardLayout()
				
				return Tbl.snap == "item" or CardLayoutResult2 == 1
			end)
		end
		ScrollInitialModule(p1, ScrollFrame, Tbl.CanvasPosition)
		
		return ScrollFrame
	end
	
	local function construct(ScrollFrame, p7, p8, p9, p10, p11)
		-- upvalues: collection (copy)
		if ScrollFrame.key == nil then
			return (collection(ScrollFrame, p7, function(p12, _)
				return p12
			end))
		end
		local KeyFunction = ScrollFrame.key
		
		if type(KeyFunction) == "string" then
			assert(KeyFunction ~= "", "Facet collection: key field must not be empty")
			
			return (collection(ScrollFrame, p7, function(p12, _): string
				-- upvalues: KeyFunction (copy)
				return (tostring(p12[KeyFunction]))
			end))
		else
			assert(type(KeyFunction) == "function", "Facet collection: key must be a function or a field name")
			
			return (collection(ScrollFrame, p7, KeyFunction, p8, p9, p10, p11))
		end
	end
	
	local function list1(ScrollFrame)
		-- upvalues: construct (copy)
		return (construct(ScrollFrame, "list"))
	end
	
	local function grid(ScrollFrame)
		-- upvalues: construct (copy)
		return (construct(ScrollFrame, "grid"))
	end
	
	p2.Outline = p1.construct("Outline", function(ScrollFrame)
		-- upvalues: construct (copy)
		assert(ScrollFrame.children ~= nil, "Facet Outline requires children")
		
		return (construct(ScrollFrame, "list"))
	end)
	p2.VirtualList = p1.construct("VirtualList", list1)
	p2.VirtualGrid = p1.construct("VirtualGrid", grid)
	
	return function(ScrollFrame, p7, p8, p9, p10)
		-- upvalues: construct (copy)
		return (construct(ScrollFrame, "list", p7, p8, p9, p10))
	end
end