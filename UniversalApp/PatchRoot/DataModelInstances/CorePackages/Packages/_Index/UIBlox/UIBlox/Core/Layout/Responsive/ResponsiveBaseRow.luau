local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local object = require(parent_1.LuauPolyfill).Object
local responsiveLayoutContextModule = require(parent.ResponsiveLayoutContext)
local responsiveLayoutConfigReaderModule = require(parent.ResponsiveLayoutConfigReader)
local responsiveBaseRow = roactModule.PureComponent:extend("ResponsiveBaseRow")

local function multilineScrollingValidator(p1)
	if p1.multiLine and p1.scrollable then
		return false, "multiLine can't be scrollable"
	end
	return true
end

responsiveBaseRow.validateProps = tModule.strictInterface({
	kind = tModule.optional(tModule.string),
	layoutOrder = tModule.optional(tModule.integer),
	zIndex = tModule.optional(tModule.number),
	scrollable = tModule.optional(tModule.boolean),
	clipsDescendants = tModule.optional(tModule.boolean),
	selectable = tModule.optional(tModule.boolean),
	pages = tModule.optional(tModule.numberPositive),
	multiLine = tModule.optional(tModule.boolean),
	lines = tModule.optional(tModule.intersection(tModule.integer, tModule.numberMin(0))),
	paddingTopLines = tModule.optional(tModule.intersection(tModule.integer, tModule.numberMin(0))),
	relativeHeight = tModule.optional(tModule.UDim),
	scrollingFrameRef = tModule.optional(tModule.table),
	[roactModule.Children] = tModule.optional(tModule.table),
	gridBasicRowRef = tModule.optional(tModule.union(tModule.table, tModule.callback))
})
responsiveBaseRow.defaultProps = {
	kind = "default",
	scrollable = false,
	selectable = false,
	clipsDescendants = true,
	multiLine = false
}

function responsiveBaseRow.renderChildrenWithPadding(p1, p2, p3)
	-- upvalues: object (ref), roactModule (ref)
	local lines = p1.props.lines or 1
	local paddingTopLines = p1.props.paddingTopLines or 0
	
	return object.assign({
		_uiblox_grid_padding_ = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p2),
			PaddingRight = UDim.new(0, p2),
			PaddingTop = if p1.props.multiLine and paddingTopLines > 0 and lines > 0 then UDim.new(paddingTopLines / lines, paddingTopLines / lines * p3) else nil
		})
	}, p1.props[roactModule.Children])
end

function responsiveBaseRow.renderChildrenMultiline(p1, p2, p3, p4, p5)
	-- upvalues: object (ref), roactModule (ref)
	local lines = p1.props.lines or 1
	
	if p1.props.paddingTopLines then
		lines -= p1.props.paddingTopLines
	end
	local maxValue = math.max(lines, 1)
	
	return object.assign({
		_uiblox_grid_layout_ = roactModule.createElement("UIGridLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirectionMaxCells = p2,
			CellSize = UDim2.new(1 / p2, math.floor((1 - p2) / p2 * p4), 1 / maxValue, math.floor((1 - maxValue) / maxValue * p5)),
			CellPadding = UDim2.fromOffset(p4, p5)
		})
	}, p1:renderChildrenWithPadding(p3, p5))
end

function responsiveBaseRow.renderChildren(p1, p2, p3, p4, p5)
	-- upvalues: object (ref), roactModule (ref)
	local var1 = object.assign({
		_uiblox_grid_layout_ = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, p4)
		})
	}, p1:renderChildrenWithPadding(p3, p5))
	
	if p2 then
		local pages = p1.props.pages or 1
		
		return {
			ResponsiveRowScroller = roactModule.createElement("ScrollingFrame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				ScrollingDirection = Enum.ScrollingDirection.X,
				ScrollBarThickness = 0,
				CanvasSize = UDim2.new(pages, (pages - 1) * (p4 - 2 * p3), 1, 0),
				AutomaticCanvasSize = if p1.props.pages then Enum.AutomaticSize.None else Enum.AutomaticSize.X,
				Selectable = p1.props.selectable,
				ClipsDescendants = p1.props.clipsDescendants,
				[roactModule.Ref] = p1.props.scrollingFrameRef
			}, var1)
		}
	end
	return var1
end

local function _(p1, p2)
	return p1.Scale * p2 + p1.Offset
end

function responsiveBaseRow.getSize(p1, p2, p3, p4, p5, p6)
	if p2 == nil then
		return UDim2.fromScale(1, 0)
	end
	local var1 = p2.Scale / p6
	local var2 = p2.Scale * ((p3 - 2 * p5) / p6 - p3) + p2.Offset
	
	if p1.props.multiLine and p1.props.lines then
		if p1.props.lines == 0 then
			return UDim2.fromScale(1, 0)
		end
		var1 *= p1.props.lines
		var2 = var2 * p1.props.lines + (p1.props.lines - 1) * p4
	end
	return UDim2.new(1, 0, var1, var2)
end

function responsiveBaseRow.render(p1)
	-- upvalues: multilineScrollingValidator (ref), roactModule (ref), responsiveLayoutContextModule (ref), object (ref), responsiveLayoutConfigReaderModule (ref)
	assert(multilineScrollingValidator(p1.props))
	local relativeHeight = p1.props.relativeHeight
	local scrollable = p1.props.scrollable
	local multiLine = p1.props.multiLine
	local var1 = if p1.props.layoutOrder then string.format("ResponsiveRow%02d", p1.props.layoutOrder) else "ResponsiveRow"
	
	return roactModule.createElement(responsiveLayoutContextModule.Consumer, {
		render = function(p2)
			-- upvalues: object (copy), p1 (ref), scrollable (ref), multiLine (ref), relativeHeight (write), responsiveLayoutConfigReaderModule (copy), roactModule (copy), responsiveLayoutContextModule (copy), var1 (ref)
			local var2 = object.assign({}, p2, {
				subPixelOffset = 0,
				kind = p1.props.kind or object.None,
				scrollable = scrollable,
				pages = p1.props.pages or 1,
				multiLine = multiLine,
				relativeHeight = relativeHeight
			})
			
			if not relativeHeight then
				relativeHeight = responsiveLayoutConfigReaderModule.getValue(var2, "relativeHeight")
				var2.relativeHeight = relativeHeight
			end
			local var3
			local width = responsiveLayoutConfigReaderModule.getValue(var2, "width")
			local var4 = responsiveLayoutConfigReaderModule.getValue(var2, "gutter") or 0
			local var5 = responsiveLayoutConfigReaderModule.getValue(var2, "verticalGutter") or var4
			local var6 = responsiveLayoutConfigReaderModule.getValue(var2, "margin") or 0
			local var7 = responsiveLayoutConfigReaderModule.getValue(var2, "columns") or 1
			local var8 = relativeHeight and (if multiLine then p1.props.lines else true)
			local var9 = p1:getSize(relativeHeight, var4, var5, var6, var7)
			local createElement = roactModule.createElement
			local provider = responsiveLayoutContextModule.Provider
			local t = { value = var2 }
			local t_1 = {}
			local createElement_1 = roactModule.createElement
			local var10 = "Frame"
			local t_2 = {
				Size = var9,
				SizeConstraint = Enum.SizeConstraint.RelativeXX,
				AutomaticSize = if var8 then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = p1.props.layoutOrder,
				ZIndex = p1.props.zIndex,
				[roactModule.Ref] = p1.props.gridBasicRowRef
			}
			local assign = object.assign
			local t_3 = {}
			
			if width then
				local var11
				var3 = roactModule.createElement
				local var12 = "UISizeConstraint"
				local t_4 = {}
				local new = Vector2.new
				local var13 = width
				
				if relativeHeight then
					local y = var9.Y
					var11 = y.Scale * width + y.Offset
				else
					var11 = 1e999
				end
				t_4.MaxSize = new(var13, var11)
				var3 = var3(var12, t_4)
			else
				var3 = nil
			end
			t_3._uiblox_grid_maxwidth_ = var3
			t_1[var1] = createElement_1(var10, t_2, assign(t_3, if multiLine then p1:renderChildrenMultiline(var7, var6, var4, var5) else p1:renderChildren(scrollable, var6, var4, var5)))
			
			return createElement(provider, t, t_1)
		end
	})
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: roactModule (ref), responsiveBaseRow (ref), object (ref)
	return roactModule.createElement(responsiveBaseRow, object.assign({}, p1, { gridBasicRowRef = p2 }))
end)