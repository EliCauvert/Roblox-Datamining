local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local luauPolyfillModule = require(parent_2.LuauPolyfill)
local object = luauPolyfillModule.Object
local array = luauPolyfillModule.Array
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
local responsiveLayoutContextModule = require(parent.ResponsiveLayoutContext)
local responsiveLayoutConfigReaderModule = require(parent.ResponsiveLayoutConfigReader)
local responsiveBaseRowModule = require(parent.ResponsiveBaseRow)
local responsiveCellModule = require(parent.ResponsiveCell)
local responsiveRow = roactModule.PureComponent:extend("ResponsiveRow")
responsiveRow.validateProps = tModule.strictInterface({
	kind = tModule.optional(tModule.string),
	layoutOrder = tModule.optional(tModule.integer),
	zIndex = tModule.optional(tModule.number),
	scrollable = tModule.optional(tModule.boolean),
	clipsDescendants = tModule.optional(tModule.boolean),
	selectable = tModule.optional(tModule.boolean),
	multiLine = tModule.optional(tModule.boolean),
	displayLines = tModule.optional(tModule.NumberRange),
	relativeHeight = tModule.optional(tModule.UDim),
	data = tModule.optional(tModule.any),
	getItem = tModule.optional(tModule.callback),
	getItemCount = tModule.optional(tModule.callback),
	renderItem = tModule.optional(tModule.callback),
	keyExtractor = tModule.optional(tModule.callback),
	getCellColspan = tModule.optional(tModule.callback),
	getCellRowspan = tModule.optional(tModule.callback),
	getCellOrder = tModule.optional(tModule.callback),
	scrollingFrameRef = tModule.optional(tModule.table),
	forwardedRef = tModule.optional(tModule.union(tModule.table, tModule.callback))
})
responsiveRow.defaultProps = {
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

local function countItems(p1, p2)
	-- upvalues: responsiveRow (ref)
	if p1.getItemCount then
		return p1.getItemCount(p1.data, p2)
	elseif p1.getItem == responsiveRow.defaultProps.getItem then
		return #p1.data
	end
	for i = 1, p2.columns do
		if p1.getItem(p1.data, i, p2) ~= nil then
			continue
		end
		return i - 1
	end
	return p2.columns
end

local function _(p3, p4, p5, p6)
	if p3 then
		local var1 = p3(p4, p5)
		
		if var1 ~= nil then
			if type(var1) ~= table then
				return var1
			end
			local breakpoint = p5.breakpoint or "default"
			
			return if var1[breakpoint] == nil then if var1.default == nil then p6 else var1.default else var1[breakpoint]
		end
	end
end

local function addPaddingCells(p3, p4)
	-- upvalues: array (ref), object (ref)
	local t = {}
	
	local function _(p5)
		-- upvalues: p4 (ref), t (ref)
		local floored = math.floor(p5 / p4.columns)
		
		return t[string.format("%d,%d", p5 - floored * p4.columns, floored)]
	end
	
	local function setSkip(value, p5, p6)
		-- upvalues: p4 (ref), t (ref)
		local floored = math.floor(value / p4.columns)
		local var1 = value - floored * p4.columns
		
		for i_1 = var1, var1 + p5 - 1 do
			for i = floored, floored + p6 - 1 do
				t[string.format("%d,%d", i_1, i)] = true
			end
		end
	end
	
	return array.reduce(p3, function(p7, p8)
		-- upvalues: p4 (ref), t (ref), setSkip (ref), object (copy)
		while true do
			local p14Count = #p7
			local floored = math.floor(p14Count / p4.columns)
			if not t[string.format("%d,%d", p14Count - floored * p4.columns, floored)] then break end
			table.insert(p7, { order = #p7 + 1 })
		end
		if p8.colspan > 1 or p8.rowspan > 1 then
			setSkip(#p7, p8.colspan, p8.rowspan)
		end
		table.insert(p7, object.assign({}, p8, { order = #p7 + 1 }))
		
		return p7
	end, {})
end

local _ = function(p7, p8)
	return string.format("ResponsiveRowCell%0" .. math.floor(math.log10(p8) + 1) .. "d", p7)
end

function filterDisplayedCells(p7, p8, p9)
	-- upvalues: array (ref), object (ref)
	local var2 = (p9.Min - 1) * p8.columns + 1
	local var3 = p9.Max * p8.columns
	local var4 = (p9.Max - p9.Min + 1) * p8.columns
	
	return array.map(array.filter(p7, function(_, p10)
		-- upvalues: var2 (ref), var3 (ref)
		return var2 <= p10 and p10 <= var3
	end), function(p10, _)
		-- upvalues: object (copy), var4 (ref)
		return object.assign({}, p10, {
			key = string.format("ResponsiveRowCell%0" .. math.floor(math.log10(var4) + 1) .. "d", (p10.order - 1) % var4 + 1)
		})
	end)
end

function responsiveRow.init(p7)
	p7.itemCache = {}
end

function responsiveRow.renderChildren(p7, p8)
	-- upvalues: countItems (ref), array (ref), addPaddingCells (ref), UIBloxConfigModule (ref), roactModule (ref), responsiveCellModule (ref)
	local t = {}
	local t_1 = {}
	local var2 = 1
	local var3 = 1
	
	for i = 1, countItems(p7.props, p8) do
		local item = p7.props.getItem(p7.props.data, i, p8)
		local var4 = nil
		local var5 = nil
		
		if p7.props.keyExtractor then
			var4 = p7.props.keyExtractor(item, i, p8)
		end
		if var4 and p7.itemCache[var4] then
			var5 = p7.itemCache[var4]
		end
		var5 = var5 or p7.props.renderItem(item, p8)
		
		if var4 then
			t_1[var4] = var5
		end
		local var6, var7
		local t_2 = {}
		local getCellColspan = p7.props.getCellColspan
		
		if getCellColspan then
			var6 = getCellColspan(item, p8)
			
			if var6 ~= nil then
				if type(var6) == table then
					local breakpoint = p8.breakpoint or "default"
					var7 = if var6[breakpoint] ~= nil then if var6.default == nil then 1 else var6.default else var6[breakpoint]
				else
					var7 = var6
				end
			end
		end
		local var8
		t_2.colspan = var7
		getCellColspan = p7.props.getCellRowspan
		
		if getCellColspan then
			var6 = getCellColspan(item, p8)
			
			if var6 ~= nil then
				if type(var6) == table then
					local breakpoint = p8.breakpoint or "default"
					var8 = if var6[breakpoint] ~= nil then if var6.default == nil then 1 else var6.default else var6[breakpoint]
				else
					var8 = var6
				end
			end
		end
		local var9
		t_2.rowspan = var8
		getCellColspan = p7.props.getCellOrder
		
		if getCellColspan then
			var6 = getCellColspan(item, p8)
			
			if var6 ~= nil then
				if type(var6) == table then
					local breakpoint = p8.breakpoint or "default"
					var9 = if var6[breakpoint] ~= nil then if var6.default == nil then i else var6.default else var6[breakpoint]
				else
					var9 = var6
				end
			end
		end
		t_2.order = var9
		t_2.cell = var5
		table.insert(t, t_2)
	end
	p7.itemCache = t_1
	
	if p7.props.multiLine then
		array.sort(t, function(p9, p10)
			return p9.order - p10.order
		end)
		t = addPaddingCells(t, p8)
		var2 = math.ceil(#t / p8.columns)
		
		if p7.props.displayLines then
			t = filterDisplayedCells(t, p8, p7.props.displayLines)
		end
	elseif p7.props.scrollable then
		var3 = array.reduce(t, function(p9, p10)
			return p9 + p10.colspan
		end, 0) / p8.columns
	end
	if UIBloxConfigModule.setZIndexOnGridCells then
		for i_1 = 1, #t do
			t[i_1].zIndex = #t + 2 - i_1
		end
	end
	return array.map(t, function(p9, p10)
		-- upvalues: roactModule (copy), responsiveCellModule (copy), t (write)
		return roactModule.createElement(responsiveCellModule, {
			key = p9.key or string.format("ResponsiveRowCell%0" .. math.floor(math.log10(#t) + 1) .. "d", p10),
			colspan = p9.colspan,
			rowspan = p9.rowspan,
			order = p9.order,
			zIndex = p9.zIndex
		}, { ResponsiveItem = p9.cell })
	end), var3, var2
end

function responsiveRow.render(p9)
	-- upvalues: roactModule (ref), responsiveLayoutContextModule (ref), object (ref), responsiveLayoutConfigReaderModule (ref), responsiveBaseRowModule (ref)
	return roactModule.createElement(responsiveLayoutContextModule.Consumer, {
		render = function(p10)
			-- upvalues: object (copy), p9 (ref), responsiveLayoutConfigReaderModule (copy), roactModule (copy), responsiveBaseRowModule (copy)
			local var10 = object.assign({}, p10, { kind = p9.props.kind or object.None })
			local var11, var12, var13 = p9:renderChildren({
				breakpoint = var10.breakpoint,
				kind = var10.kind,
				width = responsiveLayoutConfigReaderModule.getValue(var10, "width") or 1,
				columns = responsiveLayoutConfigReaderModule.getValue(var10, "columns") or 1,
				margin = responsiveLayoutConfigReaderModule.getValue(var10, "margin") or 1,
				gutter = responsiveLayoutConfigReaderModule.getValue(var10, "gutter") or 1,
				verticalGutter = responsiveLayoutConfigReaderModule.getValue(var10, "verticalGutter")
			})
			
			return roactModule.createElement(responsiveBaseRowModule, {
				kind = p9.props.kind,
				layoutOrder = p9.props.layoutOrder,
				zIndex = p9.props.zIndex,
				scrollable = p9.props.scrollable,
				clipsDescendants = p9.props.clipsDescendants,
				selectable = p9.props.selectable,
				pages = var12,
				multiLine = p9.props.multiLine,
				lines = var13,
				paddingTopLines = if p9.props.multiLine and p9.props.displayLines then math.max(p9.props.displayLines.Min - 1, 0) else nil,
				relativeHeight = p9.props.relativeHeight,
				scrollingFrameRef = p9.props.scrollingFrameRef,
				[roactModule.Ref] = p9.props.forwardedRef
			}, var11)
		end
	})
end

return roactModule.forwardRef(function(p9, p10)
	-- upvalues: roactModule (ref), responsiveRow (ref), object (ref)
	return roactModule.createElement(responsiveRow, object.assign({}, p9, { forwardedRef = p10 }))
end)