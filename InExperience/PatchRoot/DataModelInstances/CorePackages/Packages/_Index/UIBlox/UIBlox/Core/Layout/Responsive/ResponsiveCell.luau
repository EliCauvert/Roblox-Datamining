local Parent = script.Parent
local Parent1 = Parent.Parent.Parent.Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local Object = require(Parent1.LuauPolyfill).Object
local ResponsiveLayoutContextModule = require(Parent.ResponsiveLayoutContext)
local ResponsiveLayoutConfigReaderModule = require(Parent.ResponsiveLayoutConfigReader)
local ResponsiveCell = RoactModule.PureComponent:extend("ResponsiveCell")
ResponsiveCell.validateProps = TModule.interface({
	layoutOrder = TModule.optional(TModule.integer),
	zIndex = TModule.optional(TModule.integer),
	colspan = TModule.optional(TModule.union(TModule.integer, TModule.table)),
	rowspan = TModule.optional(TModule.union(TModule.integer, TModule.table)),
	order = TModule.optional(TModule.union(TModule.integer, TModule.table)),
	[RoactModule.Children] = TModule.optional(TModule.table),
	gridCellRef = TModule.optional(TModule.union(TModule.table, TModule.callback))
})

local function findProp(Props, Text, Text1: string)
	if Text1 == nil then
		Text1 = "default"
	end
	return if Props[Text .. "_" .. Text1] == nil then if Props[Text] == nil then nil elseif type(Props[Text]) == "table" then if Props[Text][Text1] == nil then Props[Text].default else Props[Text][Text1] else Props[Text] else Props[Text .. "_" .. Text1]
end

function ResponsiveCell.getColspan(p1, Breakpoint)
	-- upvalues: findProp (copy)
	local Colspan = findProp(p1.props, "colspan", Breakpoint)
	
	return if Colspan == nil then 1 else Colspan
end

function ResponsiveCell.getRowspan(p1, Breakpoint)
	-- upvalues: findProp (copy)
	local Rowspan = findProp(p1.props, "rowspan", Breakpoint)
	
	return if Rowspan == nil then 1 else Rowspan
end

function ResponsiveCell.getOrder(p1, Breakpoint)
	-- upvalues: findProp (copy)
	return if p1.props.layoutOrder then p1.props.layoutOrder else findProp(p1.props, "order", Breakpoint)
end

local function _(Value: number, p1): number
	local Floored = math.floor(Value)
	p1.subPixelOffset += Value - Floored
	local Floored1 = math.floor(p1.subPixelOffset + 0.5)
	p1.subPixelOffset -= Floored1
	
	return Floored + Floored1
end

function ResponsiveCell:getSize(XScale: number, YScale: number, p1)
	-- upvalues: ResponsiveLayoutConfigReaderModule (copy)
	local GutterValue = ResponsiveLayoutConfigReaderModule.getValue(p1, "gutter") or 0
	
	if p1.multiLine then
		return UDim2.new(XScale, (XScale - 1) * GutterValue, YScale, (YScale - 1) * (ResponsiveLayoutConfigReaderModule.getValue(p1, "verticalGutter") or GutterValue))
	end
	local ColumnsValue = ResponsiveLayoutConfigReaderModule.getValue(p1, "columns") or 1
	
	if p1.scrollable then
		ColumnsValue *= math.max(p1.pages, 1)
	end
	local NewFunction = UDim2.new
	local XScaleRatio = XScale / ColumnsValue
	local ScaledXScale = (XScale / ColumnsValue - 1) * GutterValue
	local Floored = math.floor(ScaledXScale)
	p1.subPixelOffset += ScaledXScale - Floored
	local Floored1 = math.floor(p1.subPixelOffset + 0.5)
	p1.subPixelOffset -= Floored1
	
	return NewFunction(XScaleRatio, Floored + Floored1, 1, 0)
end

function ResponsiveCell.render(p1)
	-- upvalues: RoactModule (copy), ResponsiveLayoutContextModule (copy)
	return RoactModule.createElement(ResponsiveLayoutContextModule.Consumer, {
		render = function(p2)
			-- upvalues: p1 (copy), RoactModule (upval)
			local Colspan: number = p1:getColspan(p2.breakpoint)
			local Rowspan = if p2.multiLine then p1:getRowspan(p2.breakpoint) else 1
			
			if Colspan > 0 and Rowspan > 0 then
				local Order = p1:getOrder(p2.breakpoint)
				local Formatted: string = if Order then string.format("ResponsiveCell%02d", Order) else "ResponsiveCell"
				local IsColspanAbove: boolean = p2.multiLine and (Colspan > 1 or Rowspan > 1)
				local Frame = RoactModule.createElement("Frame", {
					Name = if IsColspanAbove then nil else Formatted,
					Size = p1:getSize(Colspan, Rowspan, p2),
					AutomaticSize = if p2.relativeHeight then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					LayoutOrder = Order,
					ZIndex = p1.props.zIndex,
					[RoactModule.Ref] = p1.props.gridCellRef
				}, p1.props[RoactModule.Children])
				
				return if IsColspanAbove then RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Name = Formatted,
					LayoutOrder = Order
				}, { ResponsiveCellInner = Frame }) else Frame
			else
				return nil
			end
		end
	})
end

return RoactModule.forwardRef(function(p1, GridCellRef)
	-- upvalues: RoactModule (copy), ResponsiveCell (copy), Object (copy)
	return RoactModule.createElement(ResponsiveCell, Object.assign({}, p1, { gridCellRef = GridCellRef }))
end)