local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.Breakpoint)
local dashModule = require(foundation.Parent.Dash)
local _ = require(foundation.Providers.Responsive.ResponsiveContext)
local _ = require(foundation.Components.Types)

local function getColumnMetrics(p1, p2, p3)
	local var1 = p1.grid.columns[p2]
	local var2 = var1
	
	if p3 then
		if type(p3) == "table" then
			p3 = p3[p1.breakpoint.shortNames[p2]] or var1
		end
		var2 = math.clamp(p3, 0, var1)
	end
	return { colCount = var2, gutterCount = math.max(0, var2 - 1) }
end

return function(p1, p2, p3, p4)
	-- upvalues: getColumnMetrics (ref), dashModule (ref)
	local var1 = getColumnMetrics(p1, p2)
	local var2 = if p4 then getColumnMetrics(p1, p2, p4) else var1
	local grid = p1.grid
	local var3 = grid.gaps[p2]
	local var4 = grid.gutters[p2]
	local var5 = grid.margins[p2]
	local maxValue = math.max(0, p3 - var5 * 2)
	local var6 = var1.gutterCount * var4
	local maxValue_1 = math.max(0, (maxValue - var6) / var1.colCount)
	local var7 = if var6 < maxValue then math.floor(maxValue_1 * var2.colCount + var2.gutterCount * var4) else 0
	
	return dashModule.assign({
		full = dashModule.assign(var1, { margin = var5 }),
		margin = var5,
		colWidth = maxValue_1,
		gapHeight = var3,
		gutterWidth = var4,
		gridWidth = maxValue,
		cellSize = UDim2.fromOffset(var7, 0),
		cellWidth = var7
	}, var2)
end