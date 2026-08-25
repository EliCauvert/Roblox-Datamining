local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.Breakpoint)
local dashModule = require(foundation.Parent.Dash)
local _ = require(foundation.Providers.Responsive.ResponsiveContext)
local _ = require(foundation.Components.Types)

local function getColumnMetrics(p0, p1, p2)
	local var3 = p0.grid.columns[p1]
	local var4 = var3
	
	if p2 then
		if type(p2) == "table" then
			p2 = p2[p0.breakpoint.shortNames[p1]] or var3
		end
		var4 = math.clamp(p2, 0, var3)
	end
	return { colCount = var4, gutterCount = math.max(0, var4 - 1) }
end

return function(p3, p4, p5, p6)
	-- upvalues: getColumnMetrics (ref), dashModule (ref)
	local var5 = getColumnMetrics(p3, p4)
	local var6 = if p6 then getColumnMetrics(p3, p4, p6) else var5
	local grid = p3.grid
	local var7 = grid.gaps[p4]
	local var8 = grid.gutters[p4]
	local var9 = grid.margins[p4]
	local maxValue = math.max(0, p5 - var9 * 2)
	local var11 = var5.gutterCount * var8
	local maxValue_1 = math.max(0, (maxValue - var11) / var5.colCount)
	local var13 = if var11 < maxValue then math.floor(maxValue_1 * var6.colCount + var6.gutterCount * var8) else 0
	
	return dashModule.assign({
		full = dashModule.assign(var5, { margin = var9 }),
		margin = var9,
		colWidth = maxValue_1,
		gapHeight = var7,
		gutterWidth = var8,
		gridWidth = maxValue,
		cellSize = UDim2.fromOffset(var13, 0),
		cellWidth = var13
	}, var6)
end