local CollectionTreeModule = require("./collection_tree")
local _ = require("./collections")
local LayoutKitModule = require("./layout_kit")
local CollectionReorderModule = require("./collection_reorder")
local CollectionTableMetricsModule = require("./collection_table_metrics")
local CollectionTableColumnsModule = require("./collection_table_columns")
local CollectionTableHeaderModule = require("./collection_table_header")
local CollectionTableRowsModule = require("./collection_table_rows")
local CollectionTableToolbarModule = require("./collection_table_toolbar")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./collection_types")
local CollectionTableEditorsModule = require("./collection_table_editors")
local _ = require("./collection_props")
local _ = require("./control_types")
local CollectionPaintModule = require("./collection_paint")

return function(p1, p2, Callback)
	-- upvalues: LayoutKitModule (copy), CollectionTableEditorsModule (copy), CollectionTableMetricsModule (copy), CollectionTreeModule (copy), CollectionTableColumnsModule (copy), CollectionTableHeaderModule (copy), CollectionReorderModule (copy), CollectionTableRowsModule (copy), CollectionTableToolbarModule (copy), CollectionPaintModule (copy)
	local OfResult = LayoutKitModule.of(p1)
	local CollectionTableEditorsModuleResult = CollectionTableEditorsModule(p1, p2)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local list = {
		"children", "expanded", "onExpansionChange", "indent", "from", "selectionFrom",
		"selectionIndicator", "focusPolicy", "restoreFocus", "initialFocus",
		"autoFocus", "wrapFocus", "maxRetained", "onReachEnd", "key", "columns",
		"itemSize", "gap", "overscan", "sort", "onSortChange", "widths",
		"onWidthsChange", "selection", "selectionMode", "onSelectionChange",
		"onActivate", "rowActions", "headerHeight", "status", "controls", "focus",
		"disabled", "measure", "measured", "follow", "followThreshold",
		"reducedMotion", "reorderable", "collectionId", "drag", "drop", "rowDrop",
		"onReorder", "movable", "selectable", "editing", "scrolls", "mode", "snap",
		"recycle", "header", "dragLabel", "autoscroll", "direction", "onCellChange",
		"alternatingRows", "deletable", "rowDeletable", "onDelete"
	}
	
	local function create(Tbl, Callback1)
		-- upvalues: Compose (copy), CollectionTableEditorsModuleResult (copy), ReadFunction (copy), CollectionTableMetricsModule (upval), p1 (copy), CollectionTreeModule (upval), p2 (copy), CollectionTableColumnsModule (upval), CollectionTableHeaderModule (upval), TypesVector2 (copy), OfResult (copy), TypesEnum (copy), TypesUDim2 (copy), Host (copy), CollectionReorderModule (upval), CollectionTableRowsModule (upval), Callback (copy), Runtime (copy), list (copy), CollectionTableToolbarModule (upval), CollectionPaintModule (upval)
		assert(Tbl.columns ~= nil, "Facet.Table requires columns")
		assert(Tbl.direction == nil or Tbl.direction == "vertical", "Facet.Table rows run vertically")
		local IsReorderable: boolean = Tbl.reorderable == true or Tbl.deletable == true
		local IsHeader: boolean = IsReorderable and (Tbl.editing == nil and Tbl.header ~= false)
		local CellResult = if IsHeader then Compose.cell(false) else Tbl.editing
		local Copy = table.clone(Tbl)
		Copy.editing = CellResult
		Compose.watch(function(p3)
			-- upvalues: CollectionTableEditorsModuleResult (upval), ReadFunction (upval), Tbl (copy)
			CollectionTableEditorsModuleResult.check(ReadFunction(Tbl.columns, p3), Tbl.onCellChange)
		end)
		local Sort = Tbl.sort or Compose.cell(nil)
		local Widths = Tbl.widths or Compose.cell({})
		local Selection = Tbl.selection or Compose.cell({})
		local config = {
			mode = "windowed",
			direction = "vertical",
			total = 0,
			retained = 0,
			first = 0,
			last = 0,
			firstRow = 0,
			lastRow = 0,
			rowCount = 0,
			extent = 0,
			following = false,
			measured = 0
		}
		local Status = Tbl.status or Compose.cell(config)
		
		if Status:peek() == nil then
			Status:set(config)
		end
		local FormulaResult = Compose.formula(function(Callback)
			-- upvalues: Status (copy)
			local CallbackResult = Callback(Status)
			
			return if CallbackResult then CallbackResult.extent else 0
		end)
		local CellResult1 = Compose.cell(nil)
		local Controls = Tbl.controls or {}
		local ScrollFrame = nil
		local CellResult2 = Compose.cell(1)
		local CellResult3 = Compose.cell({})
		local CellResult4 = Compose.cell({})
		local CellResult5 = Compose.cell({})
		local CellResult6 = Compose.cell({})
		local MountedRows = {}
		local CollectionTableMetricsModuleResult = CollectionTableMetricsModule(p1, Tbl, IsHeader, CellResult2, CellResult5)
		local MinimumRow = CollectionTableMetricsModuleResult.minimumRow
		local ToolbarHeight = CollectionTableMetricsModuleResult.toolbarHeight
		local HeaderHeight = CollectionTableMetricsModuleResult.headerHeight
		local TopHeight = CollectionTableMetricsModuleResult.topHeight
		local TextInsets = CollectionTableMetricsModuleResult.textInsets
		
		local function field(p3, p4)
			return if p4.value then p4.value(p3) elseif type(p3) == "table" then p3[p4.id] else nil
		end
		
		local Config = nil
		
		local function sortRows(Rows, Callback)
			-- upvalues: Sort (copy), ReadFunction (upval), Tbl (copy), Config (ref)
			local CallbackResult = Callback(Sort)
			
			if CallbackResult == nil then
				return Rows
			end
			local Column = nil
			
			for _, value in ReadFunction(Tbl.columns, Callback) do
				if value.id == CallbackResult.column then
					Column = value
					break
				end
			end
			if Column == nil then
				return Rows
			end
			local Config1 = Config
			local Values = nil
			local Items = nil
			
			if Config1 == nil or Config1.rows ~= Rows or Config1.column ~= Column then
				local Buffer = table.create(#Rows)
				
				for Index, row in Rows do
					local ValueResult = if Column.value then Column.value(row) elseif type(row) == "table" then row[Column.id] else nil
					Buffer[Index] = {
						item = row,
						index = Index,
						value = ValueResult,
						number = if type(ValueResult) == "number" then ValueResult else nil,
						text = if ValueResult == nil then nil else tostring(ValueResult)
					}
				end
				table.sort(Buffer, function(A, B): boolean
					if A.value == B.value then
						return A.index < B.index
					else
						local Text = A.text
						local Text1 = B.text
						
						return Text == nil or Text1 ~= nil and (if A.number == nil or B.number == nil then Text < Text1 else assert(A.number) < assert(B.number))
					end
				end)
				Items = table.create(#Rows)
				Values = table.create(#Rows)
				
				for i, value1 in Buffer do
					local Value = value1.value
					Items[i] = value1.item
					Values[i] = Value
				end
				Config = {
					rows = Rows,
					column = Column,
					items = Items,
					values = Values
				}
			else
				Items = Config1.items
				Values = Config1.values
			end
			if CallbackResult.direction ~= "descending" then
				return table.clone(Items)
			end
			local Buffer = table.create(#Items)
			local CountItems = #Items
			while CountItems >= 1 do
				local Count: number = CountItems
				while Count > 1 and Values[Count - 1] == Values[CountItems] do
					Count -= 1
				end
				table.move(Items, Count, CountItems, #Buffer + 1, Buffer)
				CountItems = Count - 1
			end
			return Buffer
		end
		
		local CollectionTreeModuleResult = if Tbl.children then CollectionTreeModule(p1, p2, Tbl, Callback1, sortRows) else nil
		
		if CollectionTreeModuleResult then
			CollectionTreeModuleResult.columnar = true
		end
		local From = if CollectionTreeModuleResult then CollectionTreeModuleResult.from else Compose.formula(function(p3)
			-- upvalues: sortRows (copy), ReadFunction (upval), Tbl (copy)
			return sortRows(ReadFunction(Tbl.from, p3), p3)
		end)
		local CollectionTableColumnsModuleResult = CollectionTableColumnsModule(p1, Tbl, Widths, CellResult6, CollectionTableMetricsModuleResult, From, Callback1, field, CellResult2)
		Compose.watch(function(Callback: (any) -> ())
			-- upvalues: CollectionTableColumnsModuleResult (copy), Widths (copy), ReadFunction (upval), CollectionTreeModuleResult (copy), Tbl (copy), CellResult6 (copy), MountedRows (copy)
			Callback(CollectionTableColumnsModuleResult.viewportWidth)
			Callback(CollectionTableColumnsModuleResult.fillWidth)
			Callback(CollectionTableColumnsModuleResult.collapsed)
			Callback(Widths)
			ReadFunction(if CollectionTreeModuleResult then CollectionTreeModuleResult.all else Tbl.from, Callback)
			local t = {}
			local Flag = false
			
			for i, value in CellResult6:peek() do
				if MountedRows[i] then
					t[i] = value
				else
					Flag = true
				end
			end
			if Flag then
				CellResult6:set(t)
			end
		end)
		Compose.watch(function(p3)
			-- upvalues: ReadFunction (upval), CollectionTreeModuleResult (copy), Tbl (copy), CellResult3 (copy), Callback1 (copy)
			local ReadResult = ReadFunction(if CollectionTreeModuleResult then CollectionTreeModuleResult.all else Tbl.from, p3)
			
			if next(CellResult3:peek()) == nil then return end
			local t = {}
			
			for i, value in ReadResult do
				t[Callback1(value, i)] = true
			end
			local t1 = {}
			local Flag = false
			
			for i1, value1 in CellResult3:peek() do
				if t[i1] then
					t1[i1] = value1
				else
					Flag = true
				end
			end
			if Flag then
				CellResult3:set(t1)
			end
		end)
		local ViewportWidth = CollectionTableColumnsModuleResult.viewportWidth
		local Narrowest = CollectionTableColumnsModuleResult.narrowest
		local DisclosureWidth = CollectionTableColumnsModuleResult.disclosureWidth
		local CollectionTableHeaderModuleResult = CollectionTableHeaderModule(p1, p2, Tbl, Sort, Widths, CellResult5, CollectionTableMetricsModuleResult, CollectionTableColumnsModuleResult)
		local Editor = nil
		
		local function _(Callback)
			-- upvalues: Editor (ref)
			return if Editor then Callback(Editor.leading) else 0
		end
		
		local _ = function(Callback): number
			-- upvalues: CellResult4 (copy), Editor (ref)
			local Largest = 0
			
			for _, value in Callback(CellResult4) do
				Largest = math.max(Largest, value)
			end
			return (if Editor then Callback(Editor.trailing) else 0) + Largest
		end
		
		local CellResult7 = Compose.cell(TypesVector2.zero)
		local CellResult8 = Compose.cell(0)
		
		local function laneWidth(Callback)
			-- upvalues: CollectionTableColumnsModuleResult (copy), Narrowest (copy), DisclosureWidth (copy)
			local CallbackResult: number = Callback(CollectionTableColumnsModuleResult.fillWidth)
			
			return if CallbackResult > 0 then math.max(Callback(Narrowest), CallbackResult - Callback(DisclosureWidth)) else nil
		end
		
		local ListResult = OfResult.list({}, false)
		local Header = Host.ScrollingFrame({
			Name = "Header",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			ScrollingDirection = TypesEnum.ScrollingDirection.X,
			ScrollBarThickness = 0,
			CanvasSize = TypesUDim2.fromOffset(0, 0),
			Visible = Tbl.header ~= false,
			Size = function(Callback)
				-- upvalues: TypesUDim2 (upval), HeaderHeight (copy)
				return TypesUDim2.new(1, 0, 0, Callback(HeaderHeight))
			end,
			ListResult,
			CollectionTableHeaderModuleResult
		})
		local AbsoluteContentSizeResult = p1.observe.AbsoluteContentSize(ListResult)
		local SelectionMode = Tbl.selectionMode or (if Tbl.selection or Tbl.onSelectionChange then "single" else "none")
		
		if Tbl.drag or Tbl.drop or IsReorderable or Tbl.editing ~= nil and SelectionMode ~= "none" then
			Editor = CollectionReorderModule(p1, p2, Tbl, From, Callback1, Controls, function()
				-- upvalues: ScrollFrame (ref)
				return ScrollFrame
			end, Selection, Sort, CellResult, false, if CollectionTreeModuleResult then CollectionTreeModuleResult.location else nil, true)
		end
		local config1 = {
			Name = "Body",
			Position = function(Callback)
				-- upvalues: TypesUDim2 (upval), TopHeight (copy)
				return TypesUDim2.fromOffset(0, Callback(TopHeight))
			end,
			Size = function(Callback)
				-- upvalues: Tbl (copy), TypesUDim2 (upval), FormulaResult (copy), TopHeight (copy)
				return if Tbl.scrolls == false then TypesUDim2.new(1, 0, 0, Callback(FormulaResult)) else TypesUDim2.new(1, 0, 1, -Callback(TopHeight))
			end,
			ScrollingEnabled = Tbl.scrolls ~= false,
			ClipsDescendants = Tbl.scrolls ~= false,
			mode = if Tbl.scrolls == false then "all" else Tbl.mode,
			ScrollingDirection = TypesEnum.ScrollingDirection.XY,
			VerticalScrollBarInset = if Tbl.scrolls == false then TypesEnum.ScrollBarInset.None else TypesEnum.ScrollBarInset.Always,
			CanvasSize = function(Callback)
				-- upvalues: TypesUDim2 (upval), AbsoluteContentSizeResult (copy), CellResult2 (copy), Editor (ref), CellResult4 (copy), DisclosureWidth (copy), FormulaResult (copy)
				local FromOffsetFunction = TypesUDim2.fromOffset
				local NewX = Callback(AbsoluteContentSizeResult).X / Callback(CellResult2) + (if Editor then Callback(Editor.leading) else 0)
				local Largest = 0
				
				for _, value in Callback(CellResult4) do
					Largest = math.max(Largest, value)
				end
				return FromOffsetFunction(NewX + ((if Editor then Callback(Editor.trailing) else 0) + Largest) + Callback(DisclosureWidth), Callback(FormulaResult))
			end,
			from = From,
			key = Callback1,
			itemSize = MinimumRow,
			gap = Tbl.gap,
			overscan = Tbl.overscan,
			status = Status,
			controls = Controls,
			focus = Tbl.focus,
			focusPolicy = Tbl.focusPolicy,
			restoreFocus = Tbl.restoreFocus,
			initialFocus = Tbl.initialFocus,
			autoFocus = Tbl.autoFocus,
			wrapFocus = Tbl.wrapFocus,
			maxRetained = Tbl.maxRetained,
			onReachEnd = Tbl.onReachEnd,
			selectionFrom = Tbl.selectionFrom or (if CollectionTreeModuleResult then CollectionTreeModuleResult.all else nil),
			selectionIndicator = false,
			rowDrop = Tbl.rowDrop,
			disabled = Tbl.disabled,
			measure = Tbl.measure,
			measured = function(Callback)
				-- upvalues: CellResult3 (copy), MinimumRow (copy), ReadFunction (upval), Tbl (copy)
				local Copy = table.clone(Callback(CellResult3))
				
				for i, value in Copy do
					Copy[i] = math.max(value, Callback(MinimumRow))
				end
				local Measured = Tbl.measured or {}
				for i1, value1 in ReadFunction(Measured, Callback) do
					Copy[i1] = value1
				end
				return Copy
			end,
			follow = Tbl.follow,
			snap = Tbl.snap,
			recycle = Tbl.recycle,
			reducedMotion = Tbl.reducedMotion,
			followThreshold = Tbl.followThreshold,
			selection = Selection,
			selectionMode = Tbl.selectionMode,
			selectable = Tbl.selectable,
			onSelectionChange = Tbl.onSelectionChange,
			onActivate = function(p4, p5, p6, p7)
				-- upvalues: Editor (ref), Tbl (copy), ReadFunction (upval), CellResult (copy), CollectionTreeModuleResult (copy)
				if Editor and Tbl.onActivate == nil and ReadFunction(CellResult) ~= true and Editor.pickUp(p5, p6) then return end
				if Tbl.onActivate then
					Tbl.onActivate(p4, p5, p6, p7)
					
					return
				end
				if CollectionTreeModuleResult then
					CollectionTreeModuleResult.toggle(p5)
				end
			end,
			editing = CellResult,
			render = CollectionTableRowsModule(p1, p2, {
				spec = Tbl,
				rowPolicySpec = Copy,
				selection = Selection,
				coordinator = CellResult1,
				rowMeasures = CellResult3,
				actionGutters = CellResult4,
				truncatedRows = CellResult6,
				mountedRows = MountedRows,
				unitScale = CellResult2,
				scrolledX = CellResult8,
				editors = CollectionTableEditorsModuleResult,
				field = field,
				tree = CollectionTreeModuleResult,
				editor = Editor,
				laneWidth = laneWidth,
				metrics = CollectionTableMetricsModuleResult,
				layout = CollectionTableColumnsModuleResult
			})
		}
		local PeekResult = Sort:peek()
		ScrollFrame = Callback(config1, CollectionTreeModuleResult, true, function(Callback, p4)
			-- upvalues: ReadFunction (upval), From (copy), Sort (copy), PeekResult (ref), Controls (copy), Callback1 (copy), Selection (copy)
			local ReadResult = ReadFunction(From, Callback)
			local CallbackResult = Callback(Sort)
			
			if CallbackResult == PeekResult then
				return nil
			end
			for i, value in ReadResult do
				if assert(Controls.indexOfKey)(Callback1(value, i)) ~= i then
					return nil
				end
			end
			PeekResult = CallbackResult
			local PeekResult1 = Selection:peek()
			
			for i1, value1 in ReadResult do
				if PeekResult1[Callback1(value1, i1)] then
					local v1 = assert(Controls.placementOf)(i1)
					
					return if v1.offset < p4.offset then assert(Controls.offsetOf)(i1, "start", p4.size) elseif p4.offset + p4.size < v1.offset + v1.size then assert(Controls.offsetOf)(i1, "end", p4.size) else p4.offset
				end
			end
			return 0
		end, if Tbl.reorderable or Tbl.drag or Tbl.drop then Editor else nil)
		local LayoutUnit = Host.Frame({
			Name = "LayoutUnit",
			BackgroundTransparency = 1,
			Visible = false,
			Size = TypesUDim2.fromOffset(1, 1)
		})
		local CanvasPositionResult = p1.observe.CanvasPosition(ScrollFrame)
		local AbsoluteWindowSizeResult = p1.observe.AbsoluteWindowSize(ScrollFrame)
		local AbsoluteSizeResult = p1.observe.AbsoluteSize(ScrollFrame)
		local ScrollBarThickness = Runtime.observe(ScrollFrame, "ScrollBarThickness")
		local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(LayoutUnit)
		Compose.watch(function(Callback)
			-- upvalues: AbsoluteSizeResult1 (copy), CellResult2 (copy), AbsoluteWindowSizeResult (copy), AbsoluteSizeResult (copy), Tbl (copy), TypesVector2 (upval), ScrollBarThickness (copy), CellResult7 (copy)
			local X: number = Callback(AbsoluteSizeResult1).X
			CellResult2:set(if X > 0 then X else 1)
			local CallbackResult = Callback(AbsoluteWindowSizeResult)
			local CallbackResultRatio = if X > 0 then CallbackResult / X else CallbackResult
			local X1: number = Callback(AbsoluteSizeResult).X
			
			if Tbl.scrolls ~= false and X1 > 0 then
				CallbackResultRatio = TypesVector2.new(math.min(CallbackResultRatio.X, (math.max(0, X1 / Callback(CellResult2) - Callback(ScrollBarThickness)))), CallbackResultRatio.Y)
			end
			CellResult7:set(CallbackResultRatio)
		end)
		Compose.watch(function(Callback)
			-- upvalues: CanvasPositionResult (copy), ViewportWidth (copy), CellResult7 (copy), Editor (ref), CellResult4 (copy), CellResult1 (copy)
			Callback(CanvasPositionResult)
			local v2 = 0
			local XDelta = Callback(CellResult7).X - (if Editor then Callback(Editor.leading) else 0)
			local Largest = 0
			
			for _, value in Callback(CellResult4) do
				Largest = math.max(Largest, value)
			end
			ViewportWidth:set((math.max(v2, XDelta - ((if Editor then Callback(Editor.trailing) else 0) + Largest))))
			CellResult1:set(nil)
		end)
		Compose.watch(function(Callback)
			-- upvalues: CollectionTableColumnsModuleResult (copy), AbsoluteWindowSizeResult (copy), CellResult2 (copy), Editor (ref), CellResult4 (copy)
			local FillWidth = CollectionTableColumnsModuleResult.fillWidth
			local v3 = 0
			local XDelta = (Callback(AbsoluteWindowSizeResult) / Callback(CellResult2)).X - (if Editor then Callback(Editor.leading) else 0)
			local Largest = 0
			
			for _, value in Callback(CellResult4) do
				Largest = math.max(Largest, value)
			end
			FillWidth:set((math.max(v3, XDelta - ((if Editor then Callback(Editor.trailing) else 0) + Largest))))
		end)
		Compose.watch(function(Callback)
			-- upvalues: CellResult8 (copy), CanvasPositionResult (copy), CellResult2 (copy)
			CellResult8:set(Callback(CanvasPositionResult).X / Callback(CellResult2))
		end)
		local AbsoluteCanvasSizeResult = p1.observe.AbsoluteCanvasSize(Header)
		Runtime.connect(Header, "Changed", function(p5)
			-- upvalues: Header (copy), ScrollFrame (ref), TypesVector2 (upval)
			if p5 == "CanvasPosition" and Header.CanvasPosition.X ~= ScrollFrame.CanvasPosition.X then
				ScrollFrame.CanvasPosition = TypesVector2.new(Header.CanvasPosition.X, ScrollFrame.CanvasPosition.Y)
			end
		end)
		Runtime.decorate(Header, {
			Position = function(Callback)
				-- upvalues: TypesUDim2 (upval), Editor (ref), ToolbarHeight (copy)
				return TypesUDim2.fromOffset(if Editor then Callback(Editor.leading) else 0, Callback(ToolbarHeight))
			end,
			CanvasSize = function(Callback)
				-- upvalues: TypesUDim2 (upval), AbsoluteContentSizeResult (copy), CellResult2 (copy), HeaderHeight (copy)
				return TypesUDim2.fromOffset(Callback(AbsoluteContentSizeResult).X / Callback(CellResult2), Callback(HeaderHeight))
			end,
			CanvasPosition = function(Callback)
				-- upvalues: AbsoluteCanvasSizeResult (copy), TypesVector2 (upval), CanvasPositionResult (copy)
				Callback(AbsoluteCanvasSizeResult)
				
				return TypesVector2.new(Callback(CanvasPositionResult).X, 0)
			end,
			Size = function(Callback)
				-- upvalues: AbsoluteWindowSizeResult (copy), CellResult2 (copy), TypesUDim2 (upval), Editor (ref), CellResult4 (copy), DisclosureWidth (copy), HeaderHeight (copy)
				local X: number = (Callback(AbsoluteWindowSizeResult) / Callback(CellResult2)).X
				
				if X > 0 then
					local FromOffsetFunction = TypesUDim2.fromOffset
					local v4 = 0
					local XDelta = X - (if Editor then Callback(Editor.leading) else 0)
					local Largest = 0
					
					for _, value in Callback(CellResult4) do
						Largest = math.max(Largest, value)
					end
					return (FromOffsetFunction(math.max(v4, XDelta - ((if Editor then Callback(Editor.trailing) else 0) + Largest) - Callback(DisclosureWidth)), Callback(HeaderHeight)))
				else
					local NewFunction = TypesUDim2.new
					local v5 = 1
					local Negated = -(if Editor then Callback(Editor.leading) else 0)
					local Largest1 = 0
					
					for _, value1 in Callback(CellResult4) do
						Largest1 = math.max(Largest1, value1)
					end
					return (NewFunction(v5, Negated - ((if Editor then Callback(Editor.trailing) else 0) + Largest1) - Callback(DisclosureWidth), 0, Callback(HeaderHeight)))
				end
			end
		})
		local HasRunService = p1.config.services.RunService ~= nil
		local CellResult9 = Compose.cell(not HasRunService)
		local PropsResult = p1.props(Tbl, list, {
			Size = function(Callback)
				-- upvalues: Tbl (copy), TypesUDim2 (upval), FormulaResult (copy), TopHeight (copy)
				return if Tbl.scrolls == false then TypesUDim2.new(1, 0, 0, Callback(FormulaResult) + Callback(TopHeight)) else TypesUDim2.fromScale(1, 1)
			end,
			BackgroundTransparency = 1,
			ClipsDescendants = Tbl.scrolls ~= false,
			LayoutUnit,
			TextInsets,
			p1.styled(Host.Frame({
				Name = "HeaderBand",
				Visible = Tbl.header ~= false,
				Position = function(Callback)
					-- upvalues: TypesUDim2 (upval), ToolbarHeight (copy)
					return TypesUDim2.fromOffset(0, Callback(ToolbarHeight))
				end,
				Size = function(Callback)
					-- upvalues: TypesUDim2 (upval), HeaderHeight (copy)
					return TypesUDim2.new(1, 0, 0, Callback(HeaderHeight))
				end
			}), "TableHead"),
			Header,
			CollectionTableToolbarModule(p1, p2, Tbl, CellResult, Editor, CollectionTableMetricsModuleResult),
			ScrollFrame,
			if Editor then Editor.overlay() else nil
		})
		
		if HasRunService then
			function PropsResult.GroupTransparency(Callback): number
				-- upvalues: CellResult9 (copy)
				return if Callback(CellResult9) then 0 else 1
			end
		end
		local Table1 = p1.styled(if HasRunService then p1.fade(PropsResult) else Host.Frame(PropsResult), "Table")
		
		local function seedWindow()
			-- upvalues: ScrollFrame (ref), Table1 (copy), CellResult2 (copy), CellResult7 (copy), TypesVector2 (upval), TopHeight (copy)
			if ScrollFrame.AbsoluteWindowSize.X > 0 and ScrollFrame.AbsoluteWindowSize.Y > 0 then return end
			local Parent = Table1.Parent
			local ScaledScale = 1
			local Parent1 = Table1
			while Parent1 do
				local UIScale = Parent1:FindFirstChildWhichIsA("UIScale")
				
				if UIScale then
					ScaledScale *= UIScale.Scale
				end
				Parent1 = Parent1.Parent
			end
			while Parent do
				if not Parent:IsA("GuiObject") or Parent.AbsoluteSize.X <= 0 or Parent.AbsoluteSize.Y <= 0 then
					Parent = Parent.Parent
					continue
				end
				local AbsoluteSizeRatio = Parent.AbsoluteSize / math.max(ScaledScale, 0.001)
				local Size = Table1.Size
				CellResult2:set(ScaledScale)
				CellResult7:set(TypesVector2.new(AbsoluteSizeRatio.X * Size.X.Scale + Size.X.Offset, (math.max(0, AbsoluteSizeRatio.Y * Size.Y.Scale + Size.Y.Offset - TopHeight:peek()))))
				break
			end
		end
		
		Runtime.connect(Table1, "AncestryChanged", seedWindow)
		seedWindow()
		
		if HasRunService then
			local CollectionPaintModuleResult = CollectionPaintModule(p1, Table1, nil, true)
			Compose.watch(function(Callback)
				-- upvalues: CellResult9 (copy), CollectionPaintModuleResult (copy)
				CellResult9:set(Callback(CollectionPaintModuleResult))
			end)
		end
		return Table1
	end
	
	p2.Table = p1.construct("Table", function(Spec)
		-- upvalues: create (copy)
		if Spec.key == nil then
			return (create(Spec, function(p5, _)
				return p5
			end))
		end
		local KeyFunction = Spec.key
		
		if type(KeyFunction) == "string" then
			assert(KeyFunction ~= "", "Facet UI.Table: key field must not be empty")
			
			return (create(Spec, function(p5, _): string
				-- upvalues: KeyFunction (copy)
				return (tostring(p5[KeyFunction]))
			end))
		else
			assert(type(KeyFunction) == "function", "Facet UI.Table: key must be a function or a field name")
			
			return (create(Spec, KeyFunction))
		end
	end)
end