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

local function measureCollapsedEstimateQueries(p6, p7, p8, p9, p10, p11)
	-- upvalues: responsibilityCatalogModule (ref)
	local var4 = p6.CollapsedEstimatedTree.new(40)
	var4.buildFromMeasurements(p9, function()
		return nil
	end)
	local var5 = var4.totalSum()
	local var6 = 0
	local var7 = p7.measure(function()
		-- upvalues: p10 (ref), p9 (ref), var6 (write), var4 (ref), var5 (ref)
		for i = 1, p10 do
			var6 += var4.prefixSum(i * 7919 % p9 + 1)
			var6 += var4.indexAtPrefixSum(i * 104729 % var5)
		end
	end, p11)
	assert(var6 > 0 and var4.getNodeCount() == 1, "collapsed estimate query benchmark did not complete")
	
	return p8.create({
		suite = "view-recycler-core",
		layer = "primitive",
		owner = "core",
		timingClass = "isolated",
		workload = "collapsed-estimate-offset-queries",
		description = "Resolves offsets against one collapsed run of estimated items.",
		responsibility = responsibilityCatalogModule.Core.ViewportRange,
		scale = {
			items = p9,
			queries = p10 * 2,
			treeNodes = var4.getNodeCount()
		},
		timing = {
			unit = "ms",
			basis = "offsetQueryBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p10 * 2
		},
		arms = { viewRecycler = var7 },
		evidence = { treeItems = p9, treeNodes = var4.getNodeCount() }
	})
end

local function measureTreeUpdates(p12, p13, p14, p15, p16, p17)
	-- upvalues: responsibilityCatalogModule (ref)
	local var8 = p12.OrderStatisticTree.new(40)
	var8.buildFromArray(table.create(p15, 40))
	local var9 = 0
	local var10 = 0
	var8 = p13.measure(function()
		-- upvalues: var9 (write), p16 (ref), p15 (ref), var8 (ref), var10 (write)
		var9 = (var9 + 1) % 5
		
		for i = 1, p16 do
			local var11 = i * 7919 % p15 + 1
			var8.update(var11, (var11 + var9) % 5 * 2 + 36)
			var10 += var8.getSize(var11)
		end
	end, p17)
	assert(var10 > 0, "size-tree update benchmark did not complete")
	
	return p14.create({
		suite = "view-recycler-core",
		layer = "primitive",
		owner = "core",
		timingClass = "isolated",
		workload = "size-tree-measured-updates",
		description = "Updates measured sizes and refreshes aggregate offsets along each tree path.",
		responsibility = responsibilityCatalogModule.Core.Measurement,
		scale = { items = p15, measurements = p16 },
		timing = {
			unit = "ms",
			basis = "sizeUpdateBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p16
		},
		arms = { viewRecycler = var8 },
		evidence = { treeItems = p15 }
	})
end

local function measureLayoutBatch(p18, p19, p20, p21, p22, p23)
	-- upvalues: responsibilityCatalogModule (ref)
	local list = table.create(p21)
	
	for i = 1, p21 do
		list[i] = `item{i}`
	end
	local var11 = p18.Layout.measured({ estimatedItemLength = 40 })
	var11.applyDataSourceChange({ type = "reset", keys = list })
	local var12 = 0
	local var13 = 0
	local var14 = p19.measure(function()
		-- upvalues: var12 (write), p22 (ref), p21 (ref), var11 (ref), list (ref), var13 (write)
		var12 = (var12 + 1) % 5
		
		for i = 1, p22 do
			local var15 = i * 7919 % p21 + 1
			
			if var11.updateItemMeasurement({
				itemRevision = 0,
				itemIndex = var15,
				itemKey = list[var15],
				length = (var15 + var12) % 5 * 2 + 36
			}).accepted then
				var13 += 1
			end
		end
	end, p23)
	var11.destroy()
	assert(var13 > 0, "measured-layout benchmark did not accept measurements")
	
	return p20.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "integrated",
		workload = "measured-layout-batch",
		description = "Validates item identities, updates measured-size state, and propagates the running estimate.",
		responsibility = responsibilityCatalogModule.Core.Measurement,
		scale = { items = p21, measurements = p22 },
		timing = {
			unit = "ms",
			basis = "measurementBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p22
		},
		arms = { viewRecycler = var14 },
		evidence = { measurementsPerBatch = p22 }
	})
end

return {
	run = function(p24, p25, p26, p27)
		-- upvalues: list (ref), measureOffsetQueries (ref), measureCollapsedEstimateQueries (ref), measureTreeUpdates (ref), measureLayoutBatch (ref)
		p27 = p27 or {}
		local itemCounts = p27.itemCounts or list
		local queryCount = p27.queryCount or 1000
		local measurementBatchSize = p27.measurementBatchSize or 20
		assert(queryCount >= 1 and queryCount % 1 == 0, "queryCount must be a positive integer")
		assert(measurementBatchSize >= 1 and measurementBatchSize % 1 == 0, "measurementBatchSize must be a positive integer")
		local t = {}
		
		for i, v in itemCounts do
			assert(measurementBatchSize <= v, "item count must cover the measurement batch")
			table.insert(t, measureOffsetQueries(p24, p25, p26, v, queryCount, p27))
			table.insert(t, measureCollapsedEstimateQueries(p24, p25, p26, v, queryCount, p27))
			table.insert(t, measureTreeUpdates(p24, p25, p26, v, measurementBatchSize, p27))
			table.insert(t, measureLayoutBatch(p24, p25, p26, v, measurementBatchSize, p27))
		end
		return t
	end
}