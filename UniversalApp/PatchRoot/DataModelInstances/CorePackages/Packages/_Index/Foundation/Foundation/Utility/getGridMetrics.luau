local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.Breakpoint)
local DashModule = require(Foundation.Parent.Dash)
local _ = require(Foundation.Providers.Responsive.ResponsiveContext)
local _ = require(Foundation.Components.Types)

local function getColumnMetrics(p1, p2, Value) --[[ Line: 29 ]]
	local Column: number = p1.grid.columns[p2]
	local ClampedValue: number = Column
	
	if Value then
		if type(Value) == "table" then
			Value = Value[p1.breakpoint.shortNames[p2]] or Column
		end
		ClampedValue = math.clamp(Value, 0, Column)
	end
	return {
		colCount = ClampedValue,
		gutterCount = math.max(0, ClampedValue - 1)
	}
end

return function(p1, p2, p3, p4) --[[ Line: 53 | Named "getGridMetrics" ]]
	-- upvalues: getColumnMetrics (copy), DashModule (copy)
	local ColumnMetrics = getColumnMetrics(p1, p2)
	local ColumnMetrics1 = if p4 then getColumnMetrics(p1, p2, p4) else ColumnMetrics
	local Grid = p1.grid
	local Gutter = Grid.gutters[p2]
	local Margin: number = Grid.margins[p2]
	local Largest = math.max(0, p3 - Margin * 2)
	local ScaledGutterCount = ColumnMetrics.gutterCount * Gutter
	local ScaledGutterCount1 = ColumnMetrics1.gutterCount * Gutter
	local Largest1 = math.max(0, (Largest - ScaledGutterCount) / ColumnMetrics.colCount)
	local Floored: number = if ScaledGutterCount < Largest then math.floor(Largest1 * ColumnMetrics1.colCount + ScaledGutterCount1) else 0
	
	return DashModule.assign({
		full = DashModule.assign(ColumnMetrics, { margin = Margin }),
		margin = Margin,
		colWidth = Largest1,
		gapHeight = Grid.gaps[p2],
		gutterWidth = Gutter,
		gridWidth = Largest,
		cellSize = UDim2.fromOffset(Floored, 0),
		cellWidth = Floored
	}, ColumnMetrics1)
end