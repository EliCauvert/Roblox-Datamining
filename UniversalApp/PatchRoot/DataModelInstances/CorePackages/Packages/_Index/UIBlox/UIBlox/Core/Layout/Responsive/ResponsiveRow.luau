local Parent = script.Parent
local Parent1 = Parent.Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local LuauPolyfillModule = require(Parent2.LuauPolyfill)
local Object = LuauPolyfillModule.Object
local Array = LuauPolyfillModule.Array
local UIBloxConfigModule = require(Parent1.UIBloxConfig)
local ResponsiveLayoutContextModule = require(Parent.ResponsiveLayoutContext)
local ResponsiveLayoutConfigReaderModule = require(Parent.ResponsiveLayoutConfigReader)
local ResponsiveBaseRowModule = require(Parent.ResponsiveBaseRow)
local ResponsiveCellModule = require(Parent.ResponsiveCell)
local ResponsiveRow = RoactModule.PureComponent:extend("ResponsiveRow")
ResponsiveRow.validateProps = TModule.strictInterface({
	kind = TModule.optional(TModule.string),
	layoutOrder = TModule.optional(TModule.integer),
	zIndex = TModule.optional(TModule.number),
	scrollable = TModule.optional(TModule.boolean),
	clipsDescendants = TModule.optional(TModule.boolean),
	selectable = TModule.optional(TModule.boolean),
	multiLine = TModule.optional(TModule.boolean),
	displayLines = TModule.optional(TModule.NumberRange),
	relativeHeight = TModule.optional(TModule.UDim),
	data = TModule.optional(TModule.any),
	getItem = TModule.optional(TModule.callback),
	getItemCount = TModule.optional(TModule.callback),
	renderItem = TModule.optional(TModule.callback),
	keyExtractor = TModule.optional(TModule.callback),
	getCellColspan = TModule.optional(TModule.callback),
	getCellRowspan = TModule.optional(TModule.callback),
	getCellOrder = TModule.optional(TModule.callback),
	scrollingFrameRef = TModule.optional(TModule.table),
	forwardedRef = TModule.optional(TModule.union(TModule.table, TModule.callback))
})
ResponsiveRow.defaultProps = {
	kind = "default",
	multiLine = false,
	data = {},
	getItem = function(p1, p2, _)
		return if type(p1) == "table" then p1[p2] else nil
	end,
	renderItem = function(p1, _)
		return p1
	end,
	getCellColspan = function(_, _)
		return nil
	end,
	getCellRowspan = function(_, _)
		return nil
	end,
	getCellOrder = function(_, _)
		return nil
	end
}

local function countItems(DefaultProps, p1)
	-- upvalues: ResponsiveRow (copy)
	if DefaultProps.getItemCount then
		return DefaultProps.getItemCount(DefaultProps.data, p1)
	end
	if DefaultProps.getItem == ResponsiveRow.defaultProps.getItem then
		return #DefaultProps.data
	end
	for i = 1, p1.columns do
		if DefaultProps.getItem(DefaultProps.data, i, p1) == nil then
			return i - 1
		end
	end
	return p1.columns
end

local function _(Callback, p2, p3, p4)
	if Callback then
		local CallbackResult = Callback(p2, p3)
		
		if CallbackResult ~= nil then
			if type(CallbackResult) ~= table then
				return CallbackResult
			end
			local Breakpoint = p3.breakpoint or "default"
			
			if CallbackResult[Breakpoint] ~= nil then
				return CallbackResult[Breakpoint]
			elseif CallbackResult.default ~= nil then
				return CallbackResult.default
			end
		end
	end
	return p4
end

local function addPaddingCells(FilterDisplayedCellsResult, p2)
	-- upvalues: Array (copy), Object (copy)
	local t = {}
	
	local function _(p3)
		-- upvalues: p2 (copy), t (copy)
		local Floored = math.floor(p3 / p2.columns)
		
		return t[string.format("%d,%d", p3 - Floored * p2.columns, Floored)]
	end
	
	local function setSkip(Count, Colspan, Rowspan: number)
		-- upvalues: p2 (copy), t (copy)
		local Floored = math.floor(Count / p2.columns)
		local CountDelta = Count - Floored * p2.columns
		
		for i = CountDelta, CountDelta + Colspan - 1 do
			for i1 = Floored, Floored + Rowspan - 1 do
				t[string.format("%d,%d", i, i1)] = true
			end
		end
	end
	
	return Array.reduce(FilterDisplayedCellsResult, function(List, p3)
		-- upvalues: p2 (copy), t (copy), setSkip (copy), Object (upval)
		while true do
			local CountList = #List
			local Floored = math.floor(CountList / p2.columns)
			if not t[string.format("%d,%d", CountList - Floored * p2.columns, Floored)] then break end
			table.insert(List, { order = #List + 1 })
		end
		if p3.colspan > 1 or p3.rowspan > 1 then
			setSkip(#List, p3.colspan, p3.rowspan)
		end
		table.insert(List, Object.assign({}, p3, { order = #List + 1 }))
		
		return List
	end, {})
end

local _ = function(p3, p4: number): string
	return string.format("ResponsiveRowCell%0" .. math.floor(math.log10(p4) + 1) .. "d", p3)
end

function filterDisplayedCells(p3, p4, p5)
	-- upvalues: Array (copy), Object (copy)
	local NewMin = (p5.Min - 1) * p4.columns + 1
	local ScaledMax = p5.Max * p4.columns
	local ScaledMax1 = (p5.Max - p5.Min + 1) * p4.columns
	
	return Array.map(Array.filter(p3, function(_, p6): boolean
		-- upvalues: NewMin (copy), ScaledMax (copy)
		return NewMin <= p6 and p6 <= ScaledMax
	end), function(p6, _)
		-- upvalues: Object (upval), ScaledMax1 (copy)
		return Object.assign({}, p6, {
			key = string.format("ResponsiveRowCell%0" .. math.floor(math.log10(ScaledMax1) + 1) .. "d", (p6.order - 1) % ScaledMax1 + 1)
		})
	end)
end

function ResponsiveRow.init(p3)
	p3.itemCache = {}
end

function ResponsiveRow.renderChildren(p3, p4)
	-- upvalues: countItems (copy), Array (copy), addPaddingCells (copy), UIBloxConfigModule (copy), RoactModule (copy), ResponsiveCellModule (copy)
	local FilterDisplayedCellsResult = {}
	local ItemCache = {}
	local Ceiled = 1
	local ReduceResultRatio = 1
	local Breakpoint = nil
	local CellRowspan = nil
	local Breakpoint1 = nil
	local CellColspan = nil
	
	for i = 1, countItems(p3.props, p4) do
		local Item = p3.props.getItem(p3.props.data, i, p4)
		local KeyExtractorResult = nil
		local Item1 = nil
		
		if p3.props.keyExtractor then
			KeyExtractorResult = p3.props.keyExtractor(Item, i, p4)
		end
		if KeyExtractorResult and p3.itemCache[KeyExtractorResult] then
			Item1 = p3.itemCache[KeyExtractorResult]
		end
		if not Item1 then
			Item1 = p3.props.renderItem(Item, p4)
		end
		if KeyExtractorResult then
			ItemCache[KeyExtractorResult] = Item1
		end
		local t = {}
		local GetCellColspanFunction = p3.props.getCellColspan
		local Default = nil
		repeat
			if GetCellColspanFunction then
				CellColspan = GetCellColspanFunction(Item, p4)
				
				if CellColspan ~= nil then
					if type(CellColspan) ~= table then
						Default = CellColspan
						break
					end
					Breakpoint = p4.breakpoint or "default"
					
					if CellColspan[Breakpoint] ~= nil then
						Default = CellColspan[Breakpoint]
						break
					end
					if CellColspan.default ~= nil then
						Default = CellColspan.default
						break
					end
				end
			end
			Default = 1
		until true
		t.colspan = Default
		local GetCellRowspanFunction = p3.props.getCellRowspan
		local Default1 = nil
		repeat
			if GetCellRowspanFunction then
				CellRowspan = GetCellRowspanFunction(Item, p4)
				
				if CellRowspan ~= nil then
					if type(CellRowspan) ~= table then
						Default1 = CellRowspan
						break
					end
					Breakpoint1 = p4.breakpoint or "default"
					
					if CellRowspan[Breakpoint1] ~= nil then
						Default1 = CellRowspan[Breakpoint1]
						break
					end
					if CellRowspan.default ~= nil then
						Default1 = CellRowspan.default
						break
					end
				end
			end
			Default1 = 1
		until true
		t.rowspan = Default1
		local GetCellOrderFunction = p3.props.getCellOrder
		local Default2 = nil
		
		if GetCellOrderFunction then
			local CellOrder = GetCellOrderFunction(Item, p4)
			
			if CellOrder ~= nil then
				if type(CellOrder) ~= table then
					Default2 = CellOrder
					t.order = Default2
					t.cell = Item1
					table.insert(FilterDisplayedCellsResult, t)
					continue
				else
					local Breakpoint2 = p4.breakpoint or "default"
					
					if CellOrder[Breakpoint2] ~= nil then
						Default2 = CellOrder[Breakpoint2]
					elseif CellOrder.default ~= nil then
						Default2 = CellOrder.default
					end
				end
			end
		end
		Default2 = i
	end
	p3.itemCache = ItemCache
	
	if p3.props.multiLine then
		Array.sort(FilterDisplayedCellsResult, function(p5, p6)
			return p5.order - p6.order
		end)
		FilterDisplayedCellsResult = addPaddingCells(FilterDisplayedCellsResult, p4)
		Ceiled = math.ceil(#FilterDisplayedCellsResult / p4.columns)
		
		if p3.props.displayLines then
			FilterDisplayedCellsResult = filterDisplayedCells(FilterDisplayedCellsResult, p4, p3.props.displayLines)
		end
	elseif p3.props.scrollable then
		ReduceResultRatio = Array.reduce(FilterDisplayedCellsResult, function(p5, p6)
			return p5 + p6.colspan
		end, 0) / p4.columns
	end
	if UIBloxConfigModule.setZIndexOnGridCells then
		for i1 = 1, #FilterDisplayedCellsResult do
			FilterDisplayedCellsResult[i1].zIndex = #FilterDisplayedCellsResult + 2 - i1
		end
	end
	return Array.map(FilterDisplayedCellsResult, function(p5, p6)
		-- upvalues: RoactModule (upval), ResponsiveCellModule (upval), FilterDisplayedCellsResult (ref)
		return RoactModule.createElement(ResponsiveCellModule, {
			key = p5.key or string.format("ResponsiveRowCell%0" .. math.floor(math.log10(#FilterDisplayedCellsResult) + 1) .. "d", p6),
			colspan = p5.colspan,
			rowspan = p5.rowspan,
			order = p5.order,
			zIndex = p5.zIndex
		}, { ResponsiveItem = p5.cell })
	end), ReduceResultRatio, Ceiled
end

function ResponsiveRow.render(p5)
	-- upvalues: RoactModule (copy), ResponsiveLayoutContextModule (copy), Object (copy), ResponsiveLayoutConfigReaderModule (copy), ResponsiveBaseRowModule (copy)
	return RoactModule.createElement(ResponsiveLayoutContextModule.Consumer, {
		render = function(p6)
			-- upvalues: Object (upval), p5 (copy), ResponsiveLayoutConfigReaderModule (upval), RoactModule (upval), ResponsiveBaseRowModule (upval)
			local AssignResult = Object.assign({}, p6, { kind = p5.props.kind or Object.None })
			local RenderChildrenResult, RenderChildrenResult2, RenderChildrenResult3 = p5:renderChildren({
				breakpoint = AssignResult.breakpoint,
				kind = AssignResult.kind,
				width = ResponsiveLayoutConfigReaderModule.getValue(AssignResult, "width") or 1,
				columns = ResponsiveLayoutConfigReaderModule.getValue(AssignResult, "columns") or 1,
				margin = ResponsiveLayoutConfigReaderModule.getValue(AssignResult, "margin") or 1,
				gutter = ResponsiveLayoutConfigReaderModule.getValue(AssignResult, "gutter") or 1,
				verticalGutter = ResponsiveLayoutConfigReaderModule.getValue(AssignResult, "verticalGutter")
			})
			
			return RoactModule.createElement(ResponsiveBaseRowModule, {
				kind = p5.props.kind,
				layoutOrder = p5.props.layoutOrder,
				zIndex = p5.props.zIndex,
				scrollable = p5.props.scrollable,
				clipsDescendants = p5.props.clipsDescendants,
				selectable = p5.props.selectable,
				pages = RenderChildrenResult2,
				multiLine = p5.props.multiLine,
				lines = RenderChildrenResult3,
				paddingTopLines = if p5.props.multiLine and p5.props.displayLines then math.max(p5.props.displayLines.Min - 1, 0) else nil,
				relativeHeight = p5.props.relativeHeight,
				scrollingFrameRef = p5.props.scrollingFrameRef,
				[RoactModule.Ref] = p5.props.forwardedRef
			}, RenderChildrenResult)
		end
	})
end

return RoactModule.forwardRef(function(p5, ForwardedRef)
	-- upvalues: RoactModule (copy), ResponsiveRow (copy), Object (copy)
	return RoactModule.createElement(ResponsiveRow, Object.assign({}, p5, { forwardedRef = ForwardedRef }))
end)