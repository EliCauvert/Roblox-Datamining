local TModule = require(script.Parent.Parent.Parent.Parent.t)
local config = { minimumItemsPerRow = 2, minimumItemWidth = 160 }

local function _(p1, p2, p3) --[[ Line: 24 | Named "getItemMetrics" ]]
	local Largest = math.max(p3.minimumItemsPerRow, (math.floor((p1 + p2) / (p3.minimumItemWidth + p2))))
	
	return {
		itemsPerRow = Largest,
		itemWidth = math.floor((p1 - (Largest - 1) * p2) / Largest)
	}
end

local StrictInterfaceResult = TModule.strictInterface({
	minimumItemsPerRow = TModule.intersection(TModule.integer, TModule.numberMin(1)),
	minimumItemWidth = TModule.numberMin(0)
})
local TupleResult = TModule.tuple(TModule.numberMin(0), TModule.number)
local GridMetricsModule = {
	makeCustomMetricsGetter = function(p1) --[[ Line: 48 ]]
		-- upvalues: StrictInterfaceResult (copy), TupleResult (copy)
		assert(StrictInterfaceResult(p1))
		
		return function(p2, p3) --[[ Line: 51 ]]
			-- upvalues: TupleResult (upval), p1 (copy)
			assert(TupleResult(p2, p3))
			local Largest = math.max(p1.minimumItemsPerRow, (math.floor((p2 + p3) / (p1.minimumItemWidth + p3))))
			
			return {
				itemsPerRow = Largest,
				itemWidth = math.floor((p2 - (Largest - 1) * p3) / Largest)
			}
		end
	end
}
GridMetricsModule.getLargeMetrics = GridMetricsModule.makeCustomMetricsGetter({ minimumItemsPerRow = 1, minimumItemWidth = 332 })
GridMetricsModule.getMediumMetrics = GridMetricsModule.makeCustomMetricsGetter(config)

function GridMetricsModule.getSmallMetrics(p1, p2) --[[ Line: 60 ]]
	-- upvalues: GridMetricsModule (copy)
	local NewItemsPerRow = GridMetricsModule.getMediumMetrics(p1, p2).itemsPerRow + 1
	
	return {
		itemsPerRow = NewItemsPerRow,
		itemWidth = math.floor((p1 - (NewItemsPerRow - 1) * p2) / NewItemsPerRow)
	}
end

function GridMetricsModule.getMetricsForFixedColumns(p1, p2, ItemsPerRow: number) --[[ Line: 73 ]]
	return {
		itemsPerRow = ItemsPerRow,
		itemWidth = math.floor((p1 - (ItemsPerRow - 1) * p2) / ItemsPerRow)
	}
end

return GridMetricsModule