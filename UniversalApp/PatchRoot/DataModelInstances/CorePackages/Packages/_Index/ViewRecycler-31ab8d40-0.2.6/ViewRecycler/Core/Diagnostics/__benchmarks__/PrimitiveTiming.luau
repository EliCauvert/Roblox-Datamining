local ResponsibilityCatalogModule = require(script.Parent.ResponsibilityCatalog)
local list = { 1000, 100000 }

local function _(p1, p2)
	local NewResult = p1.new(40)
	NewResult.buildFromArray((table.create(p2, 40)))
	
	return NewResult
end

local function measureOffsetQueries(p1, p2, p3, Items, QueryCount: number, p4)
	-- upvalues: ResponsibilityCatalogModule (copy)
	local NewResult = p1.OrderStatisticTree.new(40)
	NewResult.buildFromArray((table.create(Items, 40)))
	local TalSum = NewResult.totalSum()
	local NewIndexAtPrefixSumResult = 0
	local MeasureResult = p2.measure(function()
		-- upvalues: QueryCount (copy), Items (copy), NewIndexAtPrefixSumResult (ref), NewResult (copy), TalSum (copy)
		for i = 1, QueryCount do
			NewIndexAtPrefixSumResult += NewResult.prefixSum(i * 7919 % Items + 1)
			NewIndexAtPrefixSumResult += NewResult.indexAtPrefixSum(i * 104729 % TalSum)
		end
	end, p4)
	assert(NewIndexAtPrefixSumResult > 0, "offset query benchmark did not complete")
	
	return p3.create({
		suite = "view-recycler-core",
		layer = "primitive",
		owner = "core",
		timingClass = "isolated",
		workload = "size-tree-offset-queries",
		description = "Resolves item offsets and indices against the measured-layout size tree.",
		responsibility = ResponsibilityCatalogModule.Core.ViewportRange,
		scale = { items = Items, queries = QueryCount * 2 },
		timing = {
			unit = "ms",
			basis = "offsetQueryBatch",
			includesSchedulerWaits = false,
			operationsPerSample = QueryCount * 2
		},
		arms = { viewRecycler = MeasureResult },
		evidence = { treeItems = Items }
	})
end

local function measureCollapsedEstimateQueries(p5, p6, p7, Items, QueryCount: number, p8)
	-- upvalues: ResponsibilityCatalogModule (copy)
	local NewResult = p5.CollapsedEstimatedTree.new(40)
	NewResult.buildFromMeasurements(Items, function()
		return nil
	end)
	local TalSum = NewResult.totalSum()
	local NewIndexAtPrefixSumResult = 0
	local MeasureResult = p6.measure(function()
		-- upvalues: QueryCount (copy), Items (copy), NewIndexAtPrefixSumResult (ref), NewResult (copy), TalSum (copy)
		for i = 1, QueryCount do
			NewIndexAtPrefixSumResult += NewResult.prefixSum(i * 7919 % Items + 1)
			NewIndexAtPrefixSumResult += NewResult.indexAtPrefixSum(i * 104729 % TalSum)
		end
	end, p8)
	assert(NewIndexAtPrefixSumResult > 0 and NewResult.getNodeCount() == 1, "collapsed estimate query benchmark did not complete")
	
	return p7.create({
		suite = "view-recycler-core",
		layer = "primitive",
		owner = "core",
		timingClass = "isolated",
		workload = "collapsed-estimate-offset-queries",
		description = "Resolves offsets against one collapsed run of estimated items.",
		responsibility = ResponsibilityCatalogModule.Core.ViewportRange,
		scale = {
			items = Items,
			queries = QueryCount * 2,
			treeNodes = NewResult.getNodeCount()
		},
		timing = {
			unit = "ms",
			basis = "offsetQueryBatch",
			includesSchedulerWaits = false,
			operationsPerSample = QueryCount * 2
		},
		arms = { viewRecycler = MeasureResult },
		evidence = { treeItems = Items, treeNodes = NewResult.getNodeCount() }
	})
end

local function measureTreeUpdates(p9, p10, p11, Items, Measurements, p12)
	-- upvalues: ResponsibilityCatalogModule (copy)
	local NewResult = p9.OrderStatisticTree.new(40)
	NewResult.buildFromArray((table.create(Items, 40)))
	local v1 = 0
	local NewSize = 0
	local MeasureResult = p10.measure(function()
		-- upvalues: v1 (ref), Measurements (copy), Items (copy), NewResult (copy), NewSize (ref)
		v1 = (v1 + 1) % 5
		
		for i = 1, Measurements do
			local NewI = i * 7919 % Items + 1
			NewResult.update(NewI, (NewI + v1) % 5 * 2 + 36)
			NewSize += NewResult.getSize(NewI)
		end
	end, p12)
	assert(NewSize > 0, "size-tree update benchmark did not complete")
	
	return p11.create({
		suite = "view-recycler-core",
		layer = "primitive",
		owner = "core",
		timingClass = "isolated",
		workload = "size-tree-measured-updates",
		description = "Updates measured sizes and refreshes aggregate offsets along each tree path.",
		responsibility = ResponsibilityCatalogModule.Core.Measurement,
		scale = { items = Items, measurements = Measurements },
		timing = {
			unit = "ms",
			basis = "sizeUpdateBatch",
			includesSchedulerWaits = false,
			operationsPerSample = Measurements
		},
		arms = { viewRecycler = MeasureResult },
		evidence = { treeItems = Items }
	})
end

local function measureLayoutBatch(p13, p14, p15, Items, Measurements, p16)
	-- upvalues: ResponsibilityCatalogModule (copy)
	local Buffer = table.create(Items)
	
	for i = 1, Items do
		Buffer[i] = `item{i}`
	end
	local MeasuredResult = p13.Layout.measured({ estimatedItemLength = 40 })
	MeasuredResult.applyDataSourceChange({ type = "reset", keys = Buffer })
	local v2 = 0
	local Count = 0
	local MeasureResult = p14.measure(function()
		-- upvalues: v2 (ref), Measurements (copy), Items (copy), MeasuredResult (copy), Buffer (copy), Count (ref)
		v2 = (v2 + 1) % 5
		
		for i = 1, Measurements do
			local NewI = i * 7919 % Items + 1
			
			if MeasuredResult.updateItemMeasurement({
				itemRevision = 0,
				itemIndex = NewI,
				itemKey = Buffer[NewI],
				length = (NewI + v2) % 5 * 2 + 36
			}).accepted then
				Count += 1
			end
		end
	end, p16)
	MeasuredResult.destroy()
	assert(Count > 0, "measured-layout benchmark did not accept measurements")
	
	return p15.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "integrated",
		workload = "measured-layout-batch",
		description = "Validates item identities, updates measured-size state, and propagates the running estimate.",
		responsibility = ResponsibilityCatalogModule.Core.Measurement,
		scale = { items = Items, measurements = Measurements },
		timing = {
			unit = "ms",
			basis = "measurementBatch",
			includesSchedulerWaits = false,
			operationsPerSample = Measurements
		},
		arms = { viewRecycler = MeasureResult },
		evidence = { measurementsPerBatch = Measurements }
	})
end

return {
	run = function(p17, p18, p19, p20)
		-- upvalues: list (copy), measureOffsetQueries (copy), measureCollapsedEstimateQueries (copy), measureTreeUpdates (copy), measureLayoutBatch (copy)
		local P29 = p20 or {}
		local ItemCounts = P29.itemCounts or list
		local QueryCount = P29.queryCount or 1000
		local MeasurementBatchSize = P29.measurementBatchSize or 20
		assert(QueryCount >= 1 and QueryCount % 1 == 0, "queryCount must be a positive integer")
		assert(MeasurementBatchSize >= 1 and MeasurementBatchSize % 1 == 0, "measurementBatchSize must be a positive integer")
		local List = {}
		
		for _, itemCount in ItemCounts do
			assert(MeasurementBatchSize <= itemCount, "item count must cover the measurement batch")
			table.insert(List, measureOffsetQueries(p17, p18, p19, itemCount, QueryCount, P29))
			table.insert(List, measureCollapsedEstimateQueries(p17, p18, p19, itemCount, QueryCount, P29))
			table.insert(List, measureTreeUpdates(p17, p18, p19, itemCount, MeasurementBatchSize, P29))
			table.insert(List, measureLayoutBatch(p17, p18, p19, itemCount, MeasurementBatchSize, P29))
		end
		return List
	end
}