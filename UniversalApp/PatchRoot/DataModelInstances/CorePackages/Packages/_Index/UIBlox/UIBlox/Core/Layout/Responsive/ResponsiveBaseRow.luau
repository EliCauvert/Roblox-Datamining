local Parent = script.Parent
local Parent1 = Parent.Parent.Parent.Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local Object = require(Parent1.LuauPolyfill).Object
local ResponsiveLayoutContextModule = require(Parent.ResponsiveLayoutContext)
local ResponsiveLayoutConfigReaderModule = require(Parent.ResponsiveLayoutConfigReader)
local ResponsiveBaseRow = RoactModule.PureComponent:extend("ResponsiveBaseRow")

local function multilineScrollingValidator(DefaultProps) --[[ Line: 16 ]]
	if DefaultProps.multiLine and DefaultProps.scrollable then
		return false, "multiLine can't be scrollable"
	else
		return true
	end
end

ResponsiveBaseRow.validateProps = TModule.strictInterface({
	kind = TModule.optional(TModule.string),
	layoutOrder = TModule.optional(TModule.integer),
	zIndex = TModule.optional(TModule.number),
	scrollable = TModule.optional(TModule.boolean),
	clipsDescendants = TModule.optional(TModule.boolean),
	selectable = TModule.optional(TModule.boolean),
	pages = TModule.optional(TModule.numberPositive),
	multiLine = TModule.optional(TModule.boolean),
	lines = TModule.optional(TModule.intersection(TModule.integer, TModule.numberMin(0))),
	paddingTopLines = TModule.optional(TModule.intersection(TModule.integer, TModule.numberMin(0))),
	relativeHeight = TModule.optional(TModule.UDim),
	scrollingFrameRef = TModule.optional(TModule.table),
	[RoactModule.Children] = TModule.optional(TModule.table),
	gridBasicRowRef = TModule.optional(TModule.union(TModule.table, TModule.callback))
})
ResponsiveBaseRow.defaultProps = {
	kind = "default",
	scrollable = false,
	selectable = false,
	clipsDescendants = true,
	multiLine = false
}

function ResponsiveBaseRow.renderChildrenWithPadding(p1, Offset, YOffset) --[[ Line: 64 ]]
	-- upvalues: Object (copy), RoactModule (copy)
	local Lines = p1.props.lines or 1
	local PaddingTopLines = p1.props.paddingTopLines or 0
	
	return Object.assign({
		_uiblox_grid_padding_ = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Offset),
			PaddingRight = UDim.new(0, Offset),
			PaddingTop = if p1.props.multiLine and PaddingTopLines > 0 and Lines > 0 then UDim.new(PaddingTopLines / Lines, PaddingTopLines / Lines * YOffset) else nil
		})
	}, p1.props[RoactModule.Children])
end

function ResponsiveBaseRow.renderChildrenMultiline(p1, FillDirectionMaxCells: number, MarginValue, XOffset, YOffset) --[[ Line: 80 ]]
	-- upvalues: Object (copy), RoactModule (copy)
	local Lines = p1.props.lines or 1
	
	if p1.props.paddingTopLines then
		Lines -= p1.props.paddingTopLines
	end
	local Largest = math.max(Lines, 1)
	
	return Object.assign({
		_uiblox_grid_layout_ = RoactModule.createElement("UIGridLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirectionMaxCells = FillDirectionMaxCells,
			CellSize = UDim2.new(1 / FillDirectionMaxCells, math.floor((1 - FillDirectionMaxCells) / FillDirectionMaxCells * XOffset), 1 / Largest, (math.floor((1 - Largest) / Largest * YOffset))),
			CellPadding = UDim2.fromOffset(XOffset, YOffset)
		})
	}, p1:renderChildrenWithPadding(MarginValue, YOffset))
end

function ResponsiveBaseRow.renderChildren(p1, Scrollable, MarginValue: number, Offset, VerticalGutterValue) --[[ Line: 102 ]]
	-- upvalues: Object (copy), RoactModule (copy)
	local AssignResult = Object.assign({
		_uiblox_grid_layout_ = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, Offset)
		})
	}, p1:renderChildrenWithPadding(MarginValue, VerticalGutterValue))
	
	if Scrollable then
		local Pages = p1.props.pages or 1
		
		return {
			ResponsiveRowScroller = RoactModule.createElement("ScrollingFrame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				ScrollingDirection = Enum.ScrollingDirection.X,
				ScrollBarThickness = 0,
				CanvasSize = UDim2.new(Pages, (Pages - 1) * (Offset - 2 * MarginValue), 1, 0),
				AutomaticCanvasSize = p1.props.pages and Enum.AutomaticSize.None or Enum.AutomaticSize.X,
				Selectable = p1.props.selectable,
				ClipsDescendants = p1.props.clipsDescendants,
				[RoactModule.Ref] = p1.props.scrollingFrameRef
			}, AssignResult)
		}
	else
		return AssignResult
	end
end

local function _(p1, p2) --[[ Line: 136 | Named "applyUDim" ]]
	return p1.Scale * p2 + p1.Offset
end

function ResponsiveBaseRow.getSize(p1, RelativeHeight, GutterValue, VerticalGutterValue, MarginValue: number, ColumnsValue): UDim2 --[[ Line: 141 ]]
	if RelativeHeight == nil then
		return UDim2.fromScale(1, 0)
	end
	local ScaleRatio = RelativeHeight.Scale / ColumnsValue
	local NewScale = RelativeHeight.Scale * ((GutterValue - 2 * MarginValue) / ColumnsValue - GutterValue) + RelativeHeight.Offset
	
	if p1.props.multiLine and p1.props.lines then
		if p1.props.lines == 0 then
			return UDim2.fromScale(1, 0)
		end
		ScaleRatio *= p1.props.lines
		NewScale = NewScale * p1.props.lines + (p1.props.lines - 1) * VerticalGutterValue
	end
	return UDim2.new(1, 0, ScaleRatio, NewScale)
end

function ResponsiveBaseRow.render(p1) --[[ Line: 165 ]]
	-- upvalues: multilineScrollingValidator (copy), RoactModule (copy), ResponsiveLayoutContextModule (copy), Object (copy), ResponsiveLayoutConfigReaderModule (copy)
	assert(multilineScrollingValidator(p1.props))
	local RelativeHeight = p1.props.relativeHeight
	local Scrollable = p1.props.scrollable
	local MultiLine = p1.props.multiLine
	local Formatted: string = if p1.props.layoutOrder then string.format("ResponsiveRow%02d", p1.props.layoutOrder) else "ResponsiveRow"
	
	return RoactModule.createElement(ResponsiveLayoutContextModule.Consumer, {
		render = function(p2) --[[ Line: 174 ]]
			-- upvalues: Object (upval), p1 (copy), Scrollable (copy), MultiLine (copy), RelativeHeight (ref), ResponsiveLayoutConfigReaderModule (upval), RoactModule (upval), ResponsiveLayoutContextModule (upval), Formatted (copy)
			local AssignResult = Object.assign({}, p2, {
				subPixelOffset = 0,
				kind = p1.props.kind or Object.None,
				scrollable = Scrollable,
				pages = p1.props.pages or 1,
				multiLine = MultiLine,
				relativeHeight = RelativeHeight
			})
			
			if not RelativeHeight then
				RelativeHeight = ResponsiveLayoutConfigReaderModule.getValue(AssignResult, "relativeHeight")
				AssignResult.relativeHeight = RelativeHeight
			end
			local WidthValue = ResponsiveLayoutConfigReaderModule.getValue(AssignResult, "width")
			local GutterValue = ResponsiveLayoutConfigReaderModule.getValue(AssignResult, "gutter") or 0
			local VerticalGutterValue = ResponsiveLayoutConfigReaderModule.getValue(AssignResult, "verticalGutter") or GutterValue
			local MarginValue = ResponsiveLayoutConfigReaderModule.getValue(AssignResult, "margin") or 0
			local ColumnsValue = ResponsiveLayoutConfigReaderModule.getValue(AssignResult, "columns") or 1
			local NoMultiLine = RelativeHeight and (not MultiLine or p1.props.lines)
			local Size = p1:getSize(RelativeHeight, GutterValue, VerticalGutterValue, MarginValue, ColumnsValue)
			local CreateElementFunction1 = RoactModule.createElement
			local Provider = ResponsiveLayoutContextModule.Provider
			local config = { value = AssignResult }
			local t = {}
			local CreateElementFunction2 = RoactModule.createElement
			local v1 = "Frame"
			local config1 = {
				Size = Size,
				SizeConstraint = Enum.SizeConstraint.RelativeXX,
				AutomaticSize = if NoMultiLine then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = p1.props.layoutOrder,
				ZIndex = p1.props.zIndex,
				[RoactModule.Ref] = p1.props.gridBasicRowRef
			}
			local AssignFunction = Object.assign
			local t1 = {}
			local _uiblox_grid_maxwidth_ = nil
			
			if WidthValue then
				local CreateElementFunction = RoactModule.createElement
				local v2 = "UISizeConstraint"
				local t2 = {}
				local NewFunction = Vector2.new
				local NewScale = nil
				
				if RelativeHeight then
					local Y = Size.Y
					NewScale = Y.Scale * WidthValue + Y.Offset
				else
					NewScale = 1e999
				end
				t2.MaxSize = NewFunction(WidthValue, NewScale)
				_uiblox_grid_maxwidth_ = CreateElementFunction(v2, t2)
			else
				_uiblox_grid_maxwidth_ = nil
			end
			t1._uiblox_grid_maxwidth_ = _uiblox_grid_maxwidth_
			t[Formatted] = CreateElementFunction2(v1, config1, AssignFunction(t1, if MultiLine then p1:renderChildrenMultiline(ColumnsValue, MarginValue, GutterValue, VerticalGutterValue) else p1:renderChildren(Scrollable, MarginValue, GutterValue, VerticalGutterValue)))
			
			return CreateElementFunction1(Provider, config, t)
		end
	})
end

return RoactModule.forwardRef(function(p1, GridBasicRowRef) --[[ Line: 230 ]]
	-- upvalues: RoactModule (copy), ResponsiveBaseRow (copy), Object (copy)
	return RoactModule.createElement(ResponsiveBaseRow, Object.assign({}, p1, { gridBasicRowRef = GridBasicRowRef }))
end)