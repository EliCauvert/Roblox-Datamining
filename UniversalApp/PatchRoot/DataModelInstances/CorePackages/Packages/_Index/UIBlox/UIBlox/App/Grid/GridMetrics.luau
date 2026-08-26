local tModule = require(script.Parent.Parent.Parent.Parent.t)
local t = { minimumItemsPerRow = 2, minimumItemWidth = 160 }
local t_1 = { minimumItemsPerRow = 1, minimumItemWidth = 332 }

local function _(p1, p2, p3)
	local maxValue = math.max(p3.minimumItemsPerRow, math.floor((p1 + p2) / (p3.minimumItemWidth + p2)))
	
	return {
		itemsPerRow = maxValue,
		itemWidth = math.floor((p1 - (maxValue - 1) * p2) / maxValue)
	}
end

local t_2 = {}
local var1 = tModule.strictInterface({
	minimumItemsPerRow = tModule.intersection(tModule.integer, tModule.numberMin(1)),
	minimumItemWidth = tModule.numberMin(0)
})
local var2 = tModule.tuple(tModule.numberMin(0), tModule.number)

function t_2.makeCustomMetricsGetter(p1)
	-- upvalues: var1 (ref), var2 (ref)
	assert(var1(p1))
	
	return function(p2, p3)
		-- upvalues: var2 (copy), p1 (ref)
		assert(var2(p2, p3))
		local maxValue = math.max(p1.minimumItemsPerRow, math.floor((p2 + p3) / (p1.minimumItemWidth + p3)))
		
		return {
			itemsPerRow = maxValue,
			itemWidth = math.floor((p2 - (maxValue - 1) * p3) / maxValue)
		}
	end
end

t_2.getLargeMetrics = t_2.makeCustomMetricsGetter(t_1)
t_2.getMediumMetrics = t_2.makeCustomMetricsGetter(t)

function t_2.getSmallMetrics(p1, p2)
	-- upvalues: t_2 (ref)
	local var3 = t_2.getMediumMetrics(p1, p2).itemsPerRow + 1
	
	return {
		itemsPerRow = var3,
		itemWidth = math.floor((p1 - (var3 - 1) * p2) / var3)
	}
end

function t_2.getMetricsForFixedColumns(p1, p2, p3)
	return {
		itemsPerRow = p3,
		itemWidth = math.floor((p1 - (p3 - 1) * p2) / p3)
	}
end

return t_2