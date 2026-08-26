local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local object = require(parent_1.LuauPolyfill).Object
local responsiveLayoutContextModule = require(parent.ResponsiveLayoutContext)
local responsiveLayoutConfigReaderModule = require(parent.ResponsiveLayoutConfigReader)
local responsiveCell = roactModule.PureComponent:extend("ResponsiveCell")
responsiveCell.validateProps = tModule.interface({
	layoutOrder = tModule.optional(tModule.integer),
	zIndex = tModule.optional(tModule.integer),
	colspan = tModule.optional(tModule.union(tModule.integer, tModule.table)),
	rowspan = tModule.optional(tModule.union(tModule.integer, tModule.table)),
	order = tModule.optional(tModule.union(tModule.integer, tModule.table)),
	[roactModule.Children] = tModule.optional(tModule.table),
	gridCellRef = tModule.optional(tModule.union(tModule.table, tModule.callback))
})

local function findProp(p1, p2, p3)
	if p3 == nil then
		p3 = "default"
	end
	return if p1[p2 .. "_" .. p2] == nil then if p1[p2] == nil then nil elseif type(p1[p2]) == "table" then if p1[p2][p3] == nil then p1[p2].default else p1[p2][p3] else p1[p2] else p1[p2 .. "_" .. p2]
end

function responsiveCell.getColspan(p1, p2)
	-- upvalues: findProp (ref)
	local var1 = findProp(p1.props, "colspan", p2)
	
	return if var1 == nil then 1 else var1
end

function responsiveCell.getRowspan(p1, p2)
	-- upvalues: findProp (ref)
	local var1 = findProp(p1.props, "rowspan", p2)
	
	return if var1 == nil then 1 else var1
end

function responsiveCell.getOrder(p1, p2)
	-- upvalues: findProp (ref)
	return if p1.props.layoutOrder then p1.props.layoutOrder else findProp(p1.props, "order", p2)
end

local function _(value, p1)
	local floored = math.floor(value)
	p1.subPixelOffset += value - floored
	local floored_1 = math.floor(p1.subPixelOffset + 0.5)
	p1.subPixelOffset -= floored_1
	
	return floored + floored_1
end

function responsiveCell.getSize(_, p1, p2, p3)
	-- upvalues: responsiveLayoutConfigReaderModule (ref)
	local var1 = responsiveLayoutConfigReaderModule.getValue(p3, "gutter") or 0
	
	if p3.multiLine then
		return UDim2.new(p1, (p1 - 1) * var1, p2, (p2 - 1) * (responsiveLayoutConfigReaderModule.getValue(p3, "verticalGutter") or var1))
	end
	local var2 = responsiveLayoutConfigReaderModule.getValue(p3, "columns") or 1
	
	if p3.scrollable then
		var2 *= math.max(p3.pages, 1)
	end
	local new = UDim2.new
	local var3 = p1 / var2
	local var4 = (p1 / var2 - 1) * var1
	local floored = math.floor(var4)
	p3.subPixelOffset += var4 - floored
	local floored_1 = math.floor(p3.subPixelOffset + 0.5)
	p3.subPixelOffset -= floored_1
	
	return new(var3, floored + floored_1, 1, 0)
end

function responsiveCell.render(p1)
	-- upvalues: roactModule (ref), responsiveLayoutContextModule (ref)
	return roactModule.createElement(responsiveLayoutContextModule.Consumer, {
		render = function(p2)
			-- upvalues: p1 (ref), roactModule (copy)
			local breakpointColspan = p1:getColspan(p2.breakpoint)
			local var1 = if p2.multiLine then p1:getRowspan(p2.breakpoint) else 1
			
			if breakpointColspan <= 0 or var1 <= 0 then
				return nil
			end
			local breakpointOrder = p1:getOrder(p2.breakpoint)
			local var2 = if breakpointOrder then string.format("ResponsiveCell%02d", breakpointOrder) else "ResponsiveCell"
			local var3 = p2.multiLine and (if breakpointColspan <= 1 then var1 > 1 else true)
			local frame = roactModule.createElement("Frame", {
				Name = if var3 then nil else var2,
				Size = p1:getSize(breakpointColspan, var1, p2),
				AutomaticSize = if p2.relativeHeight then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = breakpointOrder,
				ZIndex = p1.props.zIndex,
				[roactModule.Ref] = p1.props.gridCellRef
			}, p1.props[roactModule.Children])
			
			return if var3 then roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Name = var2,
				LayoutOrder = breakpointOrder
			}, { ResponsiveCellInner = frame }) else frame
		end
	})
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: roactModule (ref), responsiveCell (ref), object (ref)
	return roactModule.createElement(responsiveCell, object.assign({}, p1, { gridCellRef = p2 }))
end)