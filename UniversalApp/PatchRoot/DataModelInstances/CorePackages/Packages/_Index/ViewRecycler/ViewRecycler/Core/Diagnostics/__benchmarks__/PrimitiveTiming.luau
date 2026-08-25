local responsibilityCatalogModule = require(script.Parent.ResponsibilityCatalog)
local list = { 1000, 100000 }

local function _(p0, p1)
	local var5 = p0.new(40)
	var5.buildFromArray(table.create(p1, 40))
	
	return var5
end

local function measureOffsetQueries(value, p2, p3, p4, p5, p6)
	-- upvalues: responsibilityCatalogModule (ref)
	local var6 = value.OrderStatisticTree.new(40)
	var6.buildFromArray(table.create(p4, 40))
	local var7 = var6.totalSum()
	local var8 = 0
	var6 = p2.measure(function()
		-- upvalues: p5 (ref), p4 (ref), var8 (write), var6 (ref), var7 (ref)
		for i = 1, p5 do
			var8 += var6.prefixSum(i * 7919 % p4 + 1)
			var8 += var6.indexAtPrefixSum(i * 104729 % var7)
		end
	end, p6)
	assert(var8 > 0, "offset query benchmark did not complete")
	
	return p3.create({
		suite = "view-recycler-core",
		layer = "primitive",
		owner = "core",
		timingClass = "isolated",
		workload = "size-tree-offset-queries",
		description = "Resolves item offsets and indices against the measured-layout size tree.",
		responsibility = responsibilityCatalogModule.Core.ViewportRange,
		scale = { items = p4, queries = p5 * 2 },
		timing = {
			unit = "ms",
			basis = "offsetQueryBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p5 * 2
		},
		arms = { viewRecycler = var6 },
		evidence = { treeItems = p4 }
	})
end

local function measureTreeUpdates(p7, p8, p9, p10, p11, p12)
	-- upvalues: responsibilityCatalogModule (ref)
	local var9 = p7.OrderStatisticTree.new(40)
	var9.buildFromArray(table.create(p10, 40))
	local var10 = 0
	local var11 = 0
	var9 = p8.measure(function()
		-- upvalues: var10 (write), p11 (ref), p10 (ref), var9 (ref), var11 (write)
		var10 = (var10 + 1) % 5
		
		for i = 1, p11 do
			local var12 = i * 7919 % p10 + 1
			var9.update(var12, (var12 + var10) % 5 * 2 + 36)
			var11 += var9.getSize(var12)
		end
	end, p12)
	assert(var11 > 0, "size-tree update benchmark did not complete")
	
	return p9.create({
		suite = "view-recycler-core",
		layer = "primitive",
		owner = "core",
		timingClass = "isolated",
		workload = "size-tree-measured-updates",
		description = "Updates measured sizes and refreshes aggregate offsets along each tree path.",
		responsibility = responsibilityCatalogModule.Core.Measurement,
		scale = { items = p10, measurements = p11 },
		timing = {
			unit = "ms",
			basis = "sizeUpdateBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p11
		},
		arms = { viewRecycler = var9 },
		evidence = { treeItems = p10 }
	})
end

local function measureLayoutBatch(p13, p14, p15, p16, p17, p18)
	-- upvalues: responsibilityCatalogModule (ref)
	local list = table.create(p16)
	
	for i = 1, p16 do
		list[i] = `item{i}`
	end
	local var14 = p13.Layout.measured({ estimatedItemLength = 40 })
	var14.applyDataSourceChange({ type = "reset", keys = list })
	local var15 = 0
	local var16 = 0
	local var17 = p14.measure(function()
		-- upvalues: var15 (write), p17 (ref), p16 (ref), var14 (ref), list (ref), var16 (write)
		var15 = (var15 + 1) % 5
		
		for i = 1, p17 do
			local var18 = i * 7919 % p16 + 1
			
			if var14.updateItemMeasurement({
				itemRevision = 0,
				itemIndex = var18,
				itemKey = list[var18],
				length = (var18 + var15) % 5 * 2 + 36
			}).accepted then
				var16 += 1
			end
		end
	end, p18)
	var14.destroy()
	assert(var16 > 0, "measured-layout benchmark did not accept measurements")
	
	return p15.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "integrated",
		workload = "measured-layout-batch",
		description = "Validates item identities, updates measured-size state, and propagates the running estimate.",
		responsibility = responsibilityCatalogModule.Core.Measurement,
		scale = { items = p16, measurements = p17 },
		timing = {
			unit = "ms",
			basis = "measurementBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p17
		},
		arms = { viewRecycler = var17 },
		evidence = { measurementsPerBatch = p17 }
	})
end

return {
	run = function(p19, p20, p21, p22)
		-- upvalues: list (ref), measureOffsetQueries (ref), measureTreeUpdates (ref), measureLayoutBatch (ref)
		p22 = p22 or {}
		local itemCounts = p22.itemCounts or list
		local queryCount = p22.queryCount or 1000
		local measurementBatchSize = p22.measurementBatchSize or 20
		assert(queryCount >= 1 and queryCount % 1 == 0, "queryCount must be a positive integer")
		assert(measurementBatchSize >= 1 and measurementBatchSize % 1 == 0, "measurementBatchSize must be a positive integer")
		local t = {}
		
		for i, v in itemCounts do
			assert(measurementBatchSize <= v, "item count must cover the measurement batch")
			table.insert(t, measureOffsetQueries(p19, p20, p21, v, queryCount, p22))
			table.insert(t, measureTreeUpdates(p19, p20, p21, v, measurementBatchSize, p22))
			table.insert(t, measureLayoutBatch(p19, p20, p21, v, measurementBatchSize, p22))
		end
		return t
	end
}