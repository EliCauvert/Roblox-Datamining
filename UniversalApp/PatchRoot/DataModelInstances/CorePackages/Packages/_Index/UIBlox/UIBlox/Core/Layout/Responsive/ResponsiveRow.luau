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
	getItem = function(p0, p1, _)
		return if type(p0) == "table" then p0[p1] else nil
	end,
	renderItem = function(p2, _)
		return p2
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

local function countItems(p3, p4)
	-- upvalues: responsiveRow (ref)
	if p3.getItemCount then
		return p3.getItemCount(p3.data, p4)
	elseif p3.getItem == responsiveRow.defaultProps.getItem then
		return #p3.data
	end
	for i = 1, p4.columns do
		if p3.getItem(p3.data, i, p4) ~= nil then
			continue
		end
		return i - 1
	end
	return p4.columns
end

local function _(p5, p6, p7, p8)
	if p5 then
		local var11 = p5(p6, p7)
		
		if var11 ~= nil then
			if type(var11) ~= table then
				return var11
			end
			local breakpoint = p7.breakpoint or "default"
			
			return if var11[breakpoint] == nil then if var11.default == nil then p8 else var11.default else var11[breakpoint]
		end
	end
end

local function addPaddingCells(p9, p10)
	-- upvalues: array (ref), object (ref)
	local t = {}
	
	local function _(p11)
		-- upvalues: p10 (ref), t (ref)
		local floored = math.floor(p11 / p10.columns)
		
		return t[string.format("%d,%d", p11 - floored * p10.columns, floored)]
	end
	
	local function setSkip(value, p12, p13)
		-- upvalues: p10 (ref), t (ref)
		local floored = math.floor(value / p10.columns)
		local var17 = value - floored * p10.columns
		
		for i_1 = var17, var17 + p12 - 1 do
			for i = floored, floored + p13 - 1 do
				t[string.format("%d,%d", i_1, i)] = true
			end
		end
	end
	
	return array.reduce(p9, function(p14, p15)
		-- upvalues: p10 (ref), t (ref), setSkip (ref), object (copy)
		while true do
			local p14Count = #p14
			local floored = math.floor(p14Count / p10.columns)
			if not t[string.format("%d,%d", p14Count - floored * p10.columns, floored)] then break end
			table.insert(p14, { order = #p14 + 1 })
		end
		if p15.colspan > 1 or p15.rowspan > 1 then
			setSkip(#p14, p15.colspan, p15.rowspan)
		end
		table.insert(p14, object.assign({}, p15, { order = #p14 + 1 }))
		
		return p14
	end, {})
end

local _ = function(p16, p17)
	return string.format("ResponsiveRowCell%0" .. math.floor(math.log10(p17) + 1) .. "d", p16)
end

function filterDisplayedCells(p18, p19, p20)
	-- upvalues: array (ref), object (ref)
	local var20 = (p20.Min - 1) * p19.columns + 1
	local var21 = p20.Max * p19.columns
	local var22 = (p20.Max - p20.Min + 1) * p19.columns
	
	return array.map(array.filter(p18, function(_, p21)
		-- upvalues: var20 (ref), var21 (ref)
		return var20 <= p21 and p21 <= var21
	end), function(p22, _)
		-- upvalues: object (copy), var22 (ref)
		return object.assign({}, p22, {
			key = string.format("ResponsiveRowCell%0" .. math.floor(math.log10(var22) + 1) .. "d", (p22.order - 1) % var22 + 1)
		})
	end)
end

function responsiveRow.init(p23)
	p23.itemCache = {}
end

function responsiveRow.renderChildren(p24, p25)
	-- upvalues: countItems (ref), array (ref), addPaddingCells (ref), UIBloxConfigModule (ref), roactModule (ref), responsiveCellModule (ref)
	local t = {}
	local t_1 = {}
	local var25 = 1
	local var26 = 1
	
	for i = 1, countItems(p24.props, p25) do
		local item = p24.props.getItem(p24.props.data, i, p25)
		local var28 = nil
		local var29 = nil
		
		if p24.props.keyExtractor then
			var28 = p24.props.keyExtractor(item, i, p25)
		end
		if var28 and p24.itemCache[var28] then
			var29 = p24.itemCache[var28]
		end
		var29 = var29 or p24.props.renderItem(item, p25)
		
		if var28 then
			t_1[var28] = var29
		end
		local var31, var33
		local t_2 = {}
		local getCellColspan = p24.props.getCellColspan
		
		if getCellColspan then
			var31 = getCellColspan(item, p25)
			
			if var31 ~= nil then
				if type(var31) == table then
					local breakpoint = p25.breakpoint or "default"
					var33 = if var31[breakpoint] ~= nil then if var31.default == nil then 1 else var31.default else var31[breakpoint]
				else
					var33 = var31
				end
			end
		end
		local var35
		t_2.colspan = var33
		getCellColspan = p24.props.getCellRowspan
		
		if getCellColspan then
			var31 = getCellColspan(item, p25)
			
			if var31 ~= nil then
				if type(var31) == table then
					local breakpoint = p25.breakpoint or "default"
					var35 = if var31[breakpoint] ~= nil then if var31.default == nil then 1 else var31.default else var31[breakpoint]
				else
					var35 = var31
				end
			end
		end
		local var37
		t_2.rowspan = var35
		getCellColspan = p24.props.getCellOrder
		
		if getCellColspan then
			var31 = getCellColspan(item, p25)
			
			if var31 ~= nil then
				if type(var31) == table then
					local breakpoint = p25.breakpoint or "default"
					var37 = if var31[breakpoint] ~= nil then if var31.default == nil then i else var31.default else var31[breakpoint]
				else
					var37 = var31
				end
			end
		end
		t_2.order = var37
		t_2.cell = var29
		table.insert(t, t_2)
	end
	p24.itemCache = t_1
	
	if p24.props.multiLine then
		array.sort(t, function(p26, p27)
			return p26.order - p27.order
		end)
		t = addPaddingCells(t, p25)
		var25 = math.ceil(#t / p25.columns)
		
		if p24.props.displayLines then
			t = filterDisplayedCells(t, p25, p24.props.displayLines)
		end
	elseif p24.props.scrollable then
		var26 = array.reduce(t, function(p28, p29)
			return p28 + p29.colspan
		end, 0) / p25.columns
	end
	if UIBloxConfigModule.setZIndexOnGridCells then
		for i_1 = 1, #t do
			t[i_1].zIndex = #t + 2 - i_1
		end
	end
	return array.map(t, function(p30, p31)
		-- upvalues: roactModule (copy), responsiveCellModule (copy), t (write)
		return roactModule.createElement(responsiveCellModule, {
			key = p30.key or string.format("ResponsiveRowCell%0" .. math.floor(math.log10(#t) + 1) .. "d", p31),
			colspan = p30.colspan,
			rowspan = p30.rowspan,
			order = p30.order,
			zIndex = p30.zIndex
		}, { ResponsiveItem = p30.cell })
	end), var26, var25
end

function responsiveRow.render(p32)
	-- upvalues: roactModule (ref), responsiveLayoutContextModule (ref), object (ref), responsiveLayoutConfigReaderModule (ref), responsiveBaseRowModule (ref)
	return roactModule.createElement(responsiveLayoutContextModule.Consumer, {
		render = function(p33)
			-- upvalues: object (copy), p32 (ref), responsiveLayoutConfigReaderModule (copy), roactModule (copy), responsiveBaseRowModule (copy)
			local var38 = object.assign({}, p33, { kind = p32.props.kind or object.None })
			local var39, var40, var41 = p32:renderChildren({
				breakpoint = var38.breakpoint,
				kind = var38.kind,
				width = responsiveLayoutConfigReaderModule.getValue(var38, "width") or 1,
				columns = responsiveLayoutConfigReaderModule.getValue(var38, "columns") or 1,
				margin = responsiveLayoutConfigReaderModule.getValue(var38, "margin") or 1,
				gutter = responsiveLayoutConfigReaderModule.getValue(var38, "gutter") or 1,
				verticalGutter = responsiveLayoutConfigReaderModule.getValue(var38, "verticalGutter")
			})
			
			return roactModule.createElement(responsiveBaseRowModule, {
				kind = p32.props.kind,
				layoutOrder = p32.props.layoutOrder,
				zIndex = p32.props.zIndex,
				scrollable = p32.props.scrollable,
				clipsDescendants = p32.props.clipsDescendants,
				selectable = p32.props.selectable,
				pages = var40,
				multiLine = p32.props.multiLine,
				lines = var41,
				paddingTopLines = if p32.props.multiLine and p32.props.displayLines then math.max(p32.props.displayLines.Min - 1, 0) else nil,
				relativeHeight = p32.props.relativeHeight,
				scrollingFrameRef = p32.props.scrollingFrameRef,
				[roactModule.Ref] = p32.props.forwardedRef
			}, var39)
		end
	})
end

return roactModule.forwardRef(function(p34, p35)
	-- upvalues: roactModule (ref), responsiveRow (ref), object (ref)
	return roactModule.createElement(responsiveRow, object.assign({}, p34, { forwardedRef = p35 }))
end)