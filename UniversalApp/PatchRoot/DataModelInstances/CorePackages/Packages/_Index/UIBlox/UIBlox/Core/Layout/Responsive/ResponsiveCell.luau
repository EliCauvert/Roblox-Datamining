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

local function findProp(p0, p1, p2)
	if p2 == nil then
		p2 = "default"
	end
	return if p0[p1 .. "_" .. p2] == nil then if p0[p1] == nil then nil elseif type(p0[p1]) == "table" then if p0[p1][p2] == nil then p0[p1].default else p0[p1][p2] else p0[p1] else p0[p1 .. "_" .. p2]
end

function responsiveCell.getColspan(p3, p4)
	-- upvalues: findProp (ref)
	local var6 = findProp(p3.props, "colspan", p4)
	
	return if var6 == nil then 1 else var6
end

function responsiveCell.getRowspan(p5, p6)
	-- upvalues: findProp (ref)
	local var7 = findProp(p5.props, "rowspan", p6)
	
	return if var7 == nil then 1 else var7
end

function responsiveCell.getOrder(p7, p8)
	-- upvalues: findProp (ref)
	return if p7.props.layoutOrder then p7.props.layoutOrder else findProp(p7.props, "order", p8)
end

local function _(value, p9)
	local floored = math.floor(value)
	p9.subPixelOffset += value - floored
	local floored_1 = math.floor(p9.subPixelOffset + 0.5)
	p9.subPixelOffset -= floored_1
	
	return floored + floored_1
end

function responsiveCell.getSize(_, p10, p11, p12)
	-- upvalues: responsiveLayoutConfigReaderModule (ref)
	local var10 = responsiveLayoutConfigReaderModule.getValue(p12, "gutter") or 0
	
	if p12.multiLine then
		return UDim2.new(p10, (p10 - 1) * var10, p11, (p11 - 1) * (responsiveLayoutConfigReaderModule.getValue(p12, "verticalGutter") or var10))
	end
	local var11 = responsiveLayoutConfigReaderModule.getValue(p12, "columns") or 1
	
	if p12.scrollable then
		var11 *= math.max(p12.pages, 1)
	end
	local new = UDim2.new
	local var12 = p10 / var11
	local var13 = (p10 / var11 - 1) * var10
	local floored = math.floor(var13)
	p12.subPixelOffset += var13 - floored
	local floored_1 = math.floor(p12.subPixelOffset + 0.5)
	p12.subPixelOffset -= floored_1
	
	return new(var12, floored + floored_1, 1, 0)
end

function responsiveCell.render(p13)
	-- upvalues: roactModule (ref), responsiveLayoutContextModule (ref)
	return roactModule.createElement(responsiveLayoutContextModule.Consumer, {
		render = function(p14)
			-- upvalues: p13 (ref), roactModule (copy)
			local breakpointColspan = p13:getColspan(p14.breakpoint)
			local var17 = if p14.multiLine then p13:getRowspan(p14.breakpoint) else 1
			
			if breakpointColspan <= 0 or var17 <= 0 then
				return nil
			end
			local breakpointOrder = p13:getOrder(p14.breakpoint)
			local var19 = if breakpointOrder then string.format("ResponsiveCell%02d", breakpointOrder) else "ResponsiveCell"
			local var20 = p14.multiLine and (if breakpointColspan <= 1 then var17 > 1 else true)
			local frame = roactModule.createElement("Frame", {
				Name = if var20 then nil else var19,
				Size = p13:getSize(breakpointColspan, var17, p14),
				AutomaticSize = if p14.relativeHeight then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = breakpointOrder,
				ZIndex = p13.props.zIndex,
				[roactModule.Ref] = p13.props.gridCellRef
			}, p13.props[roactModule.Children])
			
			return if var20 then roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Name = var19,
				LayoutOrder = breakpointOrder
			}, { ResponsiveCellInner = frame }) else frame
		end
	})
end

return roactModule.forwardRef(function(p15, p16)
	-- upvalues: roactModule (ref), responsiveCell (ref), object (ref)
	return roactModule.createElement(responsiveCell, object.assign({}, p15, { gridCellRef = p16 }))
end)