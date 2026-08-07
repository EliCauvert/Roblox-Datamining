local tModule = require(script.Parent.Parent.Parent.Parent.t)
local t = { minimumItemsPerRow = 2, minimumItemWidth = 160 }
local t_1 = { minimumItemsPerRow = 1, minimumItemWidth = 332 }

local function _(p0, p1, p2) --[[ line: 24 | named "getItemMetrics" ]]
	local maxValue = math.max(p2.minimumItemsPerRow, math.floor((p0 + p1) / (p2.minimumItemWidth + p1)))
	
	return {
		itemsPerRow = maxValue,
		itemWidth = math.floor((p0 - (maxValue - 1) * p1) / maxValue)
	}
end

local t_2 = {}
local var4 = tModule.strictInterface({
	minimumItemsPerRow = tModule.intersection(tModule.integer, tModule.numberMin(1)),
	minimumItemWidth = tModule.numberMin(0)
})
local var5 = tModule.tuple(tModule.numberMin(0), tModule.number)

function t_2.makeCustomMetricsGetter(p3) --[[ line: 48 ]]
	-- upvalues: var4 (ref), var5 (ref)
	assert(var4(p3))
	
	return function(p4, p5) --[[ line: 51 ]]
		-- upvalues: var5 (copy), p3 (ref)
		assert(var5(p4, p5))
		local maxValue = math.max(p3.minimumItemsPerRow, math.floor((p4 + p5) / (p3.minimumItemWidth + p5)))
		
		return {
			itemsPerRow = maxValue,
			itemWidth = math.floor((p4 - (maxValue - 1) * p5) / maxValue)
		}
	end
end

t_2.getLargeMetrics = t_2.makeCustomMetricsGetter(t_1)
t_2.getMediumMetrics = t_2.makeCustomMetricsGetter(t)

function t_2.getSmallMetrics(p6, p7) --[[ line: 60 ]]
	-- upvalues: t_2 (ref)
	local var8 = t_2.getMediumMetrics(p6, p7).itemsPerRow + 1
	
	return {
		itemsPerRow = var8,
		itemWidth = math.floor((p6 - (var8 - 1) * p7) / var8)
	}
end

function t_2.getMetricsForFixedColumns(p8, p9, p10) --[[ line: 73 ]]
	return {
		itemsPerRow = p10,
		itemWidth = math.floor((p8 - (p10 - 1) * p9) / p10)
	}
end

return t_2