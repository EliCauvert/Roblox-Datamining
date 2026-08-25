local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local object = require(parent_1.LuauPolyfill).Object
local responsiveLayoutContextModule = require(parent.ResponsiveLayoutContext)
local responsiveLayoutConfigReaderModule = require(parent.ResponsiveLayoutConfigReader)
local responsiveBaseRow = roactModule.PureComponent:extend("ResponsiveBaseRow")

local function multilineScrollingValidator(p0)
	if p0.multiLine and p0.scrollable then
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

function responsiveBaseRow.renderChildrenMultiline(p4, p5, p6, p7, p8)
	-- upvalues: object (ref), roactModule (ref)
	local lines = p4.props.lines or 1
	
	if p4.props.paddingTopLines then
		lines -= p4.props.paddingTopLines
	end
	local maxValue = math.max(lines, 1)
	
	return object.assign({
		_uiblox_grid_layout_ = roactModule.createElement("UIGridLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirectionMaxCells = p5,
			CellSize = UDim2.new(1 / p5, math.floor((1 - p5) / p5 * p7), 1 / maxValue, math.floor((1 - maxValue) / maxValue * p8)),
			CellPadding = UDim2.fromOffset(p7, p8)
		})
	}, p4:renderChildrenWithPadding(p6, p8))
end

function responsiveBaseRow.renderChildren(p9, p10, p11, p12, p13)
	-- upvalues: object (ref), roactModule (ref)
	local var10 = object.assign({
		_uiblox_grid_layout_ = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, p12)
		})
	}, p9:renderChildrenWithPadding(p11, p13))
	
	if p10 then
		local pages = p9.props.pages or 1
		
		return {
			ResponsiveRowScroller = roactModule.createElement("ScrollingFrame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				ScrollingDirection = Enum.ScrollingDirection.X,
				ScrollBarThickness = 0,
				CanvasSize = UDim2.new(pages, (pages - 1) * (p12 - 2 * p11), 1, 0),
				AutomaticCanvasSize = if p9.props.pages then Enum.AutomaticSize.None else Enum.AutomaticSize.X,
				Selectable = p9.props.selectable,
				ClipsDescendants = p9.props.clipsDescendants,
				[roactModule.Ref] = p9.props.scrollingFrameRef
			}, var10)
		}
	end
	return var10
end

local function _(p14, p15)
	return p14.Scale * p15 + p14.Offset
end

function responsiveBaseRow.getSize(p16, p17, p18, p19, p20, p21)
	if p17 == nil then
		return UDim2.fromScale(1, 0)
	end
	local var12 = p17.Scale / p21
	local var13 = p17.Scale * ((p18 - 2 * p20) / p21 - p18) + p17.Offset
	
	if p16.props.multiLine and p16.props.lines then
		if p16.props.lines == 0 then
			return UDim2.fromScale(1, 0)
		end
		var12 *= p16.props.lines
		var13 = var13 * p16.props.lines + (p16.props.lines - 1) * p19
	end
	return UDim2.new(1, 0, var12, var13)
end

function responsiveBaseRow.render(p22)
	-- upvalues: multilineScrollingValidator (ref), roactModule (ref), responsiveLayoutContextModule (ref), object (ref), responsiveLayoutConfigReaderModule (ref)
	assert(multilineScrollingValidator(p22.props))
	local relativeHeight = p22.props.relativeHeight
	local scrollable = p22.props.scrollable
	local multiLine = p22.props.multiLine
	local var14 = if p22.props.layoutOrder then string.format("ResponsiveRow%02d", p22.props.layoutOrder) else "ResponsiveRow"
	
	return roactModule.createElement(responsiveLayoutContextModule.Consumer, {
		render = function(p23)
			-- upvalues: object (copy), p22 (ref), scrollable (ref), multiLine (ref), relativeHeight (write), responsiveLayoutConfigReaderModule (copy), roactModule (copy), responsiveLayoutContextModule (copy), var14 (ref)
			local var15 = object.assign({}, p23, {
				subPixelOffset = 0,
				kind = p22.props.kind or object.None,
				scrollable = scrollable,
				pages = p22.props.pages or 1,
				multiLine = multiLine,
				relativeHeight = relativeHeight
			})
			
			if not relativeHeight then
				relativeHeight = responsiveLayoutConfigReaderModule.getValue(var15, "relativeHeight")
				var15.relativeHeight = relativeHeight
			end
			local var28
			local width = responsiveLayoutConfigReaderModule.getValue(var15, "width")
			local var17 = responsiveLayoutConfigReaderModule.getValue(var15, "gutter") or 0
			local var18 = responsiveLayoutConfigReaderModule.getValue(var15, "verticalGutter") or var17
			local var19 = responsiveLayoutConfigReaderModule.getValue(var15, "margin") or 0
			local var20 = responsiveLayoutConfigReaderModule.getValue(var15, "columns") or 1
			local var21 = relativeHeight and (if multiLine then p22.props.lines else true)
			local var22 = p22:getSize(relativeHeight, var17, var18, var19, var20)
			local createElement = roactModule.createElement
			local provider = responsiveLayoutContextModule.Provider
			local t = { value = var15 }
			local t_1 = {}
			local createElement_1 = roactModule.createElement
			local var25 = "Frame"
			local t_2 = {
				Size = var22,
				SizeConstraint = Enum.SizeConstraint.RelativeXX,
				AutomaticSize = if var21 then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = p22.props.layoutOrder,
				ZIndex = p22.props.zIndex,
				[roactModule.Ref] = p22.props.gridBasicRowRef
			}
			local assign = object.assign
			local t_3 = {}
			
			if width then
				local var32
				var28 = roactModule.createElement
				local var29 = "UISizeConstraint"
				local t_4 = {}
				local new = Vector2.new
				local var31 = width
				
				if relativeHeight then
					local y = var22.Y
					var32 = y.Scale * width + y.Offset
				else
					var32 = 1e999
				end
				t_4.MaxSize = new(var31, var32)
				var28 = var28(var29, t_4)
			else
				var28 = nil
			end
			t_3._uiblox_grid_maxwidth_ = var28
			t_1[var14] = createElement_1(var25, t_2, assign(t_3, if multiLine then p22:renderChildrenMultiline(var20, var19, var17, var18) else p22:renderChildren(scrollable, var19, var17, var18)))
			
			return createElement(provider, t, t_1)
		end
	})
end

return roactModule.forwardRef(function(p24, p25)
	-- upvalues: roactModule (ref), responsiveBaseRow (ref), object (ref)
	return roactModule.createElement(responsiveBaseRow, object.assign({}, p24, { gridBasicRowRef = p25 }))
end)