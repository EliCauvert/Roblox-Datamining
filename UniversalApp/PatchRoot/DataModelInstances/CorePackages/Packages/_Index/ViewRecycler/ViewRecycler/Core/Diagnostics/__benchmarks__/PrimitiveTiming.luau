local responsibilityCatalogModule = require(script.Parent.ResponsibilityCatalog)
local list = { 1000, 100000 }

local function _(p1, p2)
	local var1 = p1.new(40)
	var1.buildFromArray(table.create(p2, 40))
	
	return var1
end

local function measureOffsetQueries(value, p1, p2, p3, p4, p5)
	-- upvalues: responsibilityCatalogModule (ref)
	local var1 = value.OrderStatisticTree.new(40)
	var1.buildFromArray(table.create(p3, 40))
	local var2 = var1.totalSum()
	local var3 = 0
	var1 = p1.measure(function()
		-- upvalues: p4 (ref), p3 (ref), var3 (write), var1 (ref), var2 (ref)
		for i = 1, p4 do
			var3 += var1.prefixSum(i * 7919 % p3 + 1)
			var3 += var1.indexAtPrefixSum(i * 104729 % var2)
		end
	end, p5)
	assert(var3 > 0, "offset query benchmark did not complete")
	
	return p2.create({
		suite = "view-recycler-core",
		layer = "primitive",
		owner = "core",
		timingClass = "isolated",
		workload = "size-tree-offset-queries",
		description = "Resolves item offsets and indices against the measured-layout size tree.",
		responsibility = responsibilityCatalogModule.Core.ViewportRange,
		scale = { items = p3, queries = p4 * 2 },
		timing = {
			unit = "ms",
			basis = "offsetQueryBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p4 * 2
		},
		arms = { viewRecycler = var1 },
		evidence = { treeItems = p3 }
	})
end

local function measureTreeUpdates(p6, p7, p8, p9, p10, p11)
	-- upvalues: responsibilityCatalogModule (ref)
	local var4 = p6.OrderStatisticTree.new(40)
	var4.buildFromArray(table.create(p9, 40))
	local var5 = 0
	local var6 = 0
	var4 = p7.measure(function()
		-- upvalues: var5 (write), p10 (ref), p9 (ref), var4 (ref), var6 (write)
		var5 = (var5 + 1) % 5
		
		for i = 1, p10 do
			local var7 = i * 7919 % p9 + 1
			var4.update(var7, (var7 + var5) % 5 * 2 + 36)
			var6 += var4.getSize(var7)
		end
	end, p11)
	assert(var6 > 0, "size-tree update benchmark did not complete")
	
	return p8.create({
		suite = "view-recycler-core",
		layer = "primitive",
		owner = "core",
		timingClass = "isolated",
		workload = "size-tree-measured-updates",
		description = "Updates measured sizes and refreshes aggregate offsets along each tree path.",
		responsibility = responsibilityCatalogModule.Core.Measurement,
		scale = { items = p9, measurements = p10 },
		timing = {
			unit = "ms",
			basis = "sizeUpdateBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p10
		},
		arms = { viewRecycler = var4 },
		evidence = { treeItems = p9 }
	})
end

local function measureLayoutBatch(p12, p13, p14, p15, p16, p17)
	-- upvalues: responsibilityCatalogModule (ref)
	local list = table.create(p15)
	
	for i = 1, p15 do
		list[i] = `item{i}`
	end
	local var7 = p12.Layout.measured({ estimatedItemLength = 40 })
	var7.applyDataSourceChange({ type = "reset", keys = list })
	local var8 = 0
	local var9 = 0
	local var10 = p13.measure(function()
		-- upvalues: var8 (write), p16 (ref), p15 (ref), var7 (ref), list (ref), var9 (write)
		var8 = (var8 + 1) % 5
		
		for i = 1, p16 do
			local var11 = i * 7919 % p15 + 1
			
			if var7.updateItemMeasurement({
				itemRevision = 0,
				itemIndex = var11,
				itemKey = list[var11],
				length = (var11 + var8) % 5 * 2 + 36
			}).accepted then
				var9 += 1
			end
		end
	end, p17)
	var7.destroy()
	assert(var9 > 0, "measured-layout benchmark did not accept measurements")
	
	return p14.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "integrated",
		workload = "measured-layout-batch",
		description = "Validates item identities, updates measured-size state, and propagates the running estimate.",
		responsibility = responsibilityCatalogModule.Core.Measurement,
		scale = { items = p15, measurements = p16 },
		timing = {
			unit = "ms",
			basis = "measurementBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p16
		},
		arms = { viewRecycler = var10 },
		evidence = { measurementsPerBatch = p16 }
	})
end

return {
	run = function(p18, p19, p20, p21)
		-- upvalues: list (ref), measureOffsetQueries (ref), measureTreeUpdates (ref), measureLayoutBatch (ref)
		p21 = p21 or {}
		local itemCounts = p21.itemCounts or list
		local queryCount = p21.queryCount or 1000
		local measurementBatchSize = p21.measurementBatchSize or 20
		assert(queryCount >= 1 and queryCount % 1 == 0, "queryCount must be a positive integer")
		assert(measurementBatchSize >= 1 and measurementBatchSize % 1 == 0, "measurementBatchSize must be a positive integer")
		local t = {}
		
		for i, v in itemCounts do
			assert(measurementBatchSize <= v, "item count must cover the measurement batch")
			table.insert(t, measureOffsetQueries(p18, p19, p20, v, queryCount, p21))
			table.insert(t, measureTreeUpdates(p18, p19, p20, v, measurementBatchSize, p21))
			table.insert(t, measureLayoutBatch(p18, p19, p20, v, measurementBatchSize, p21))
		end
		return t
	end
}