local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local responsibilityCatalogModule = require(script.Parent.ResponsibilityCatalog)
local signalsModule = require(viewRecycler.Parent.Signals)
local buildPlacementPlanModule = require(viewRecycler.Core.PinnedItems.buildPlacementPlan)
local list = { 1000, 100000 }

local function createItems(p0) --[[ line: 54 ]]
	local list = table.create(p0)
	
	for i = 1, p0 do
		list[i] = { id = i, kind = if i % 20 == 0 then "header" else "row" }
	end
	return list
end

local function createOffsets(value, p1, p2) --[[ line: 65 ]]
	local maxValue = math.max(0, value * 40 - 480)
	local list = table.create(p1)
	
	for i = 1, p1 - 1 do
		if p2 == "short" then
			list[i] = math.min(maxValue, i * 40)
		else
			list[i] = math.floor(i * 7919 % 104729 / 104729 * maxValue)
		end
	end
	list[p1] = 0
	
	return list
end

local function snapshotPlacementChecksum(p3) --[[ line: 80 ]]
	local var25 = 0
	
	for i, v in p3.entries do
		var25 = var25 + v.itemLayout.startOffset + (v.canvasPlacement.mainAxisOffset or 0) + (if v.viewportPlacement == nil then 0 else v.viewportPlacement.mainAxisOffset or 0)
	end
	return var25
end

local function _() --[[ line: 90 | named "createCounters" ]]
	return {
		synchronizations = 0,
		reassignedAssignments = 0,
		acquiredAssignments = 0,
		releasedAssignments = 0,
		acceptedMeasurements = 0
	}
end

local _ = function(value) --[[ line: 100 | named "resetCounters" ]]
	value.synchronizations = 0
	value.reassignedAssignments = 0
	value.acquiredAssignments = 0
	value.releasedAssignments = 0
	value.acceptedMeasurements = 0
end

local function createVirtualizer(p4, p5, p6) --[[ line: 108 ]]
	-- upvalues: createItems (ref)
	local var26 = 0
	local t = {
		synchronizations = 0,
		reassignedAssignments = 0,
		acquiredAssignments = 0,
		releasedAssignments = 0,
		acceptedMeasurements = 0
	}
	local var28 = if p6 then p4.Layout.measured({ estimatedItemLength = 40 }) else p4.Layout.uniform({ itemLength = 40 })
	local var29 = p4.Adapter.createRecyclingScope({
		maxPoolSize = 4,
		adapter = {
			create = function() --[[ line: 116 ]]
				-- upvalues: var26 (write)
				var26 += 1
				
				return var26
			end,
			destroy = function() --[[ line: 120 ]] end
		}
	})
	local var30 = p4.Adapter.createVirtualizer({
		overscan = 2,
		dataSource = p4.DataSource.snapshot(createItems(p5), function(p7) --[[ line: 125 ]]
			return tostring(p7.id)
		end),
		layout = var28,
		recyclingScope = var29,
		getItemViewType = function(p8) --[[ line: 130 ]]
			return p8.kind
		end,
		diagnostics = function(p9) --[[ line: 134 ]]
			-- upvalues: t (ref)
			if p9.kind == "itemViewsSynchronized" then
				t.synchronizations += 1
				t.reassignedAssignments += p9.reassigned
				t.acquiredAssignments += p9.acquired
				t.releasedAssignments += p9.released
				
				return
			elseif p9.kind == "measurementsProcessed" then
				t.acceptedMeasurements += p9.accepted
			end
		end
	})
	var30.dispatch({ type = p4.VirtualizerCommandType.Activate })
	var30.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p4.VirtualizerCommandType.SetViewportSize
	})
	
	return var30, var28, t, var29
end

local function measureTraversal(p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21) --[[ line: 154 ]]
	-- upvalues: createVirtualizer (ref), createOffsets (ref), snapshotPlacementChecksum (ref)
	local var31, var32, var33, var34 = createVirtualizer(p10, p13, p15)
	local var35 = createOffsets(p13, p14, p17)
	local var36 = 0
	local var37 = 0
	local var38 = 0
	local var39 = 0
	local var40 = p11.measure(function() --[[ line: 175 ]]
		-- upvalues: var33 (ref), var39 (write), var38 (write), var36 (write), var35 (ref), var31 (ref), p10 (ref), snapshotPlacementChecksum (copy), p16 (ref), var37 (write)
		var33.synchronizations = 0
		var33.reassignedAssignments = 0
		var33.acquiredAssignments = 0
		var33.releasedAssignments = 0
		var33.acceptedMeasurements = 0
		var39 = 0
		var38 = 0
		var36 = (var36 + 1) % 5
		
		for i, v in var35 do
			var38 += snapshotPlacementChecksum(var31.dispatch({
				type = p10.VirtualizerCommandType.SetScrollOffset,
				offset = v
			}).snapshot)
			
			if p16 then
				local t = {}
				
				for i_1, v_1 in var31.query({ type = p10.VirtualizerQueryType.GetItemViews }) do
					local var44 = var31.query({
						type = p10.VirtualizerQueryType.GetPlacementIntent,
						itemView = v_1
					})
					local var45 = if var44 == nil then nil else var44.measurementIdentity
					
					if var45 ~= nil then
						table.insert(t, {
							itemIndex = var45.itemIndex,
							itemKey = var45.itemKey,
							assignmentGeneration = var45.assignmentGeneration,
							itemRevision = var45.itemRevision,
							length = 36 + (var45.itemIndex + var36) % 5 * 2
						})
					end
				end
				var39 += #t
				var38 += snapshotPlacementChecksum(var31.dispatch({
					type = p10.VirtualizerCommandType.SubmitMeasurements,
					measurements = t
				}).snapshot)
				var37 += #t
			end
		end
		local visibleRange = var31.getSnapshot().visibleRange
		var37 += visibleRange.firstIndex + visibleRange.lastIndex
	end, p21)
	local count = #var31.query({ type = p10.VirtualizerQueryType.GetItemViews })
	local var42 = p14 * (if p16 then 2 else 1)
	var31.dispatch({ type = p10.VirtualizerCommandType.Destroy })
	var34.destroy()
	var32.destroy()
	assert(var37 > 0 and var38 > 0, `{p18} benchmark did not expose mounted placements`)
	assert(var33.synchronizations <= var42, `{p18} synchronized more than once per accepted scroll or measurement mutation`)
	
	return p12.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		responsibility = p20,
		workload = p18,
		description = p19,
		scale = {
			items = p13,
			scrollSteps = p14,
			scrollPattern = p17,
			layout = if p15 then "measured" else "uniform",
			submitsMeasurements = p16
		},
		timing = {
			unit = "ms",
			basis = "scrollTraversal",
			includesSchedulerWaits = false,
			operationsPerSample = p14
		},
		arms = { viewRecycler = var40 },
		evidence = {
			mountedItemViews = count,
			synchronizations = var33.synchronizations,
			settlementSynchronizationBudget = var42,
			reassignedAssignments = var33.reassignedAssignments,
			acquiredAssignments = var33.acquiredAssignments,
			releasedAssignments = var33.releasedAssignments,
			submittedMeasurements = var39,
			acceptedMeasurements = var33.acceptedMeasurements,
			observablePlacementChecksum = var38
		}
	})
end

local function measureCoordinator(p22, p23, p24, p25, p26, p27, p28) --[[ line: 261 ]]
	-- upvalues: responsibilityCatalogModule (ref)
	local function createFixture(p29) --[[ line: 270 ]]
		-- upvalues: p22 (ref), p25 (ref), p27 (ref), p26 (ref)
		local var54 = 0
		local var55 = 0
		local var56 = 0
		local var57 = p22.Adapter.createRecyclingScope({
			adapter = {
				create = function() --[[ line: 276 ]]
					-- upvalues: var54 (write)
					var54 += 1
					
					return var54
				end,
				destroy = function() --[[ line: 280 ]] end
			},
			onPoolChanged = if p29 then function() --[[ line: 283 ]]
				-- upvalues: var55 (write)
				var55 += 1
			end else nil
		})
		local list = table.create(p25)
		local list_1 = table.create(p25)
		
		for i = 1, p25 do
			list[i] = { key = `a{i}`, index = i, value = i }
			list_1[i] = if p27 == "retained" then list[i] else { key = `b{i}`, index = i, value = i }
		end
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		local function synchronize(p30) --[[ line: 307 ]]
			-- upvalues: t_1 (write), var57 (ref), t_2 (ref), var56 (write), t (write)
			local t_3 = {}
			local t_4 = {}
			local t_5 = {}
			local t_6 = {}
			
			for i, v in p30 do
				local key = t_1[v.key]
				
				if key == nil then
					table.insert(t_4, { viewType = "row" })
					table.insert(t_5, v)
				else
					t_6[v.key] = key
				end
			end
			for i_1, v_1 in t_1 do
				if t_6[i_1] == nil then
					table.insert(t_3, { record = v_1.record, leaseToken = v_1.leaseToken })
				end
			end
			local var69 = var57.exchange(t_2, t_3, t_4)
			var56 += #var69.acquired
			
			for i_2, v_2 in var69.acquired do
				t_6[t_5[i_2].key] = v_2
			end
			t_1 = t_6
			t = table.create(#p30)
			
			for i_3, v_3 in p30 do
				t[i_3] = t_1[v_3.key]
			end
		end
		
		synchronize(list)
		local var64 = false
		
		return {
			run = function() --[[ line: 340 ]]
				-- upvalues: p26 (copy), var64 (write), synchronize (ref), list_1 (ref), list (ref)
				for _ = 1, p26 do
					var64 = not var64
					synchronize(if var64 then list_1 else list)
				end
			end,
			getDiagnosticEvents = function() --[[ line: 346 ]]
				-- upvalues: var55 (write)
				return var55
			end,
			getLeaseTokensObserved = function() --[[ line: 349 ]]
				-- upvalues: var56 (write)
				return var56
			end,
			getScopeInventory = var57.getScopeInventory,
			destroy = function() --[[ line: 353 ]]
				-- upvalues: var57 (ref), t_2 (ref), t (write), t_1 (write)
				var57.exchange(t_2, t, {})
				t = {}
				t_1 = {}
				var57.destroy()
			end
		}
	end
	
	local var47 = createFixture(false)
	local var48 = createFixture(true)
	local var49 = p23.measure(var47.run, p28)
	local var50 = p23.measure(var48.run, p28)
	local count = #var47.getScopeInventory()
	local diagnosticEvents = var48.getDiagnosticEvents()
	local leaseTokensObserved = var47.getLeaseTokensObserved()
	var47.destroy()
	var48.destroy()
	
	return p24.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "integrated",
		workload = "recycling-scope-sync",
		description = "Synchronizes a Recycling scope with retained or fully replaced desired keys.",
		responsibility = responsibilityCatalogModule.Core.Diagnostics,
		scale = { items = p25, synchronizations = p26, pattern = p27 },
		timing = {
			unit = "ms",
			basis = "coordinatorSynchronizationBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p26
		},
		arms = { diagnosticsDisabled = var49, diagnosticsEnabled = var50 },
		evidence = {
			resources = count,
			diagnosticEvents = diagnosticEvents,
			leaseTokensObserved = leaseTokensObserved
		}
	})
end

local function measureWithinBand(p31, p32, p33, p34, p35, p36) --[[ line: 403 ]]
	-- upvalues: createVirtualizer (ref), snapshotPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local function createArm(p37) --[[ line: 411 ]]
		-- upvalues: createVirtualizer (copy), p31 (ref), p34 (ref), p35 (ref), snapshotPlacementChecksum (copy)
		local var76, var77, var78, var79 = createVirtualizer(p31, p34, p37)
		local var80 = 1
		local var81 = 0
		
		return {
			run = function() --[[ line: 415 ]]
				-- upvalues: var78 (ref), var81 (write), p35 (copy), var76 (ref), p31 (copy), var80 (write), snapshotPlacementChecksum (copy)
				var78.synchronizations = 0
				var78.reassignedAssignments = 0
				var78.acquiredAssignments = 0
				var78.releasedAssignments = 0
				var78.acceptedMeasurements = 0
				var81 = 0
				
				for i = 1, p35 do
					var81 += snapshotPlacementChecksum(var76.dispatch({
						type = p31.VirtualizerCommandType.SetScrollOffset,
						offset = if var80 == 1 then i else p35 - i
					}).snapshot)
				end
				var80 = -var80
			end,
			counters = var78,
			getObservablePlacementChecksum = function() --[[ line: 430 ]]
				-- upvalues: var81 (write)
				return var81
			end,
			prepareCanonicalEvidence = function() --[[ line: 433 ]]
				-- upvalues: var80 (write)
				var80 = 1
			end,
			destroy = function() --[[ line: 436 ]]
				-- upvalues: var76 (ref), p31 (copy), var79 (ref), var77 (ref)
				var76.dispatch({ type = p31.VirtualizerCommandType.Destroy })
				var79.destroy()
				var77.destroy()
			end
		}
	end
	
	local var71 = createArm(false)
	local var72 = createArm(true)
	local var73 = p32.measure(var71.run, p36)
	local var74 = p32.measure(var72.run, p36)
	var71.prepareCanonicalEvidence()
	var72.prepareCanonicalEvidence()
	var71.run()
	var72.run()
	local t = {
		uniformSynchronizations = var71.counters.synchronizations,
		measuredSynchronizations = var72.counters.synchronizations,
		uniformObservablePlacementChecksum = var71.getObservablePlacementChecksum(),
		measuredObservablePlacementChecksum = var72.getObservablePlacementChecksum()
	}
	assert(t.uniformObservablePlacementChecksum > 0 and t.measuredObservablePlacementChecksum > 0, "within-Band benchmark did not consume committed mounted placements")
	var71.destroy()
	var72.destroy()
	
	return p33.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "within-band-scrolling",
		description = "Scrolls by sub-item increments inside one render-window band without sticky or pinned items.",
		responsibility = responsibilityCatalogModule.Core.ViewportRange,
		scale = { stickyOrPinned = false, items = p34, scrollSteps = p35 },
		timing = {
			unit = "ms",
			basis = "withinBandScrollBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p35
		},
		arms = { uniform = var73, measured = var74 },
		evidence = t
	})
end

local function measureProgrammaticScroll(p38, p39, p40, p41, p42, p43) --[[ line: 492 ]]
	-- upvalues: createVirtualizer (ref), snapshotPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local var82, var83, _, var84 = createVirtualizer(p38, p41, false)
	local var85 = 0
	local var86 = 0
	local var87 = 0
	local var88 = p39.measure(function() --[[ line: 504 ]]
		-- upvalues: var85 (write), var86 (write), var87 (write), p42 (ref), p41 (ref), var82 (ref), p38 (ref), snapshotPlacementChecksum (copy)
		var85 = 0
		var86 = 0
		var87 = 0
		
		for i = 1, p42 do
			var87 += snapshotPlacementChecksum(var82.dispatch({
				type = p38.VirtualizerCommandType.ScrollToOffset,
				offset = var82.query({
					type = p38.VirtualizerQueryType.GetScrollOffsetForItem,
					index = i * 17 % p41 + 1,
					alignment = p38.ScrollAlignment.Center
				})
			}).snapshot)
			local var90 = var82.query({ type = p38.VirtualizerQueryType.CaptureScrollSnapshot })
			var85 += 1
			var87 += snapshotPlacementChecksum(var82.dispatch({ delta = 40, type = p38.VirtualizerCommandType.ScrollBy }).snapshot)
			local var91 = var82.dispatch({
				type = p38.VirtualizerCommandType.RestoreScrollSnapshot,
				snapshot = var90
			})
			var87 += snapshotPlacementChecksum(var91.snapshot)
			var86 += var91.result
		end
	end, p43)
	local var89 = var82.query({ type = p38.VirtualizerQueryType.GetScrollState })
	var82.dispatch({ type = p38.VirtualizerCommandType.Destroy })
	var84.destroy()
	var83.destroy()
	assert(var85 == p42 and (var86 > 0 and var87 > 0), "programmatic scroll benchmark did not restore snapshots")
	
	return p40.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "programmatic-scroll-snapshot",
		description = "Resolves item targets, scrolls by offset and delta, and captures and restores stable-key snapshots.",
		responsibility = responsibilityCatalogModule.Core.ProgrammaticScroll,
		scale = { items = p41, scrollCycles = p42 },
		timing = {
			unit = "ms",
			basis = "programmaticScrollSnapshotCycle",
			includesSchedulerWaits = false,
			operationsPerSample = p42
		},
		arms = { viewRecycler = var88 },
		evidence = {
			snapshotsCaptured = var85,
			restoredOffsetChecksum = var86,
			finalScrollOffset = var89.scrollOffset,
			observablePlacementChecksum = var87
		}
	})
end

local function measureMeasurementAnchoring(p44, p45, p46, p47, p48, p49) --[[ line: 567 ]]
	-- upvalues: createVirtualizer (ref), snapshotPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local scrollOffset
	local var92, var93, _, var94 = createVirtualizer(p44, p47, true)
	var92.dispatch({
		offset = 400,
		type = p44.VirtualizerCommandType.SetScrollOffset
	})
	local visibleRange = var92.getSnapshot().visibleRange
	local var95 = nil
	
	for i, v in var92.query({ type = p44.VirtualizerQueryType.GetItemViews }) do
		local var102 = var92.query({
			type = p44.VirtualizerQueryType.GetPlacementIntent,
			itemView = v
		})
		scrollOffset = if var102 == nil then nil else var102.measurementIdentity
		
		if scrollOffset ~= nil and scrollOffset.itemIndex < visibleRange.firstIndex then
			var95 = scrollOffset
			break
		end
	end
	assert(var95 ~= nil, "measurement anchoring benchmark requires an overscanned item above the visible anchor")
	local var96 = 0
	local var97 = 0
	local var98 = 0
	
	local function runMeasurementAnchoring() --[[ line: 591 ]]
		-- upvalues: var96 (write), var97 (write), var98 (write), p48 (ref), var92 (ref), p44 (ref), var95 (write)
		var96 = 0
		var97 = 0
		var98 = 0
		
		for i_2 = 1, p48 do
			local var103 = var92.dispatch({
				type = p44.VirtualizerCommandType.SubmitMeasurements,
				measurements = {
					{
						itemIndex = var95.itemIndex,
						itemKey = var95.itemKey,
						assignmentGeneration = var95.assignmentGeneration,
						itemRevision = var95.itemRevision,
						length = if i_2 % 2 == 0 then 40 else 80
					}
				}
			})
			
			for i, v in var103.effects do
				if v.type == p44.VirtualizerEffectType.ScrollCorrection then
					var96 += 1
					var97 += math.abs(v.delta)
				end
			end
			for i, v in var103.snapshot.entries do
				var98 += v.itemLayout.startOffset
			end
		end
	end
	
	local cloned = table.clone(p49)
	cloned.iterationsPerSample = 1
	local var101 = p45.measure(runMeasurementAnchoring, cloned)
	var92.dispatch({
		type = p44.VirtualizerCommandType.SubmitMeasurements,
		measurements = {
			{
				length = 40,
				itemIndex = var95.itemIndex,
				itemKey = var95.itemKey,
				assignmentGeneration = var95.assignmentGeneration,
				itemRevision = var95.itemRevision
			}
		}
	})
	var92.dispatch({
		offset = 400,
		type = p44.VirtualizerCommandType.SetScrollOffset
	})
	runMeasurementAnchoring()
	var98 = snapshotPlacementChecksum(var92.getSnapshot())
	scrollOffset = var92.query({ type = p44.VirtualizerQueryType.GetScrollState }).scrollOffset
	var92.dispatch({ type = p44.VirtualizerCommandType.Destroy })
	var94.destroy()
	var93.destroy()
	assert(var96 > 0 and (var97 > 0 and var98 > 0), "measurement anchoring benchmark did not expose corrected mounted placements")
	
	return p46.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "measurement-anchor-preservation",
		description = "Changes a measured overscan item above the visible anchor and preserves the visible position.",
		responsibility = responsibilityCatalogModule.Core.MeasurementAnchoring,
		scale = { items = p47, measurementUpdates = p48 },
		timing = {
			unit = "ms",
			basis = "measurementAnchorUpdateBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p48
		},
		arms = { viewRecycler = var101 },
		evidence = {
			scrollCorrections = var96,
			correctionMagnitude = var97,
			finalScrollOffset = scrollOffset,
			observablePlacementChecksum = var98,
			measuredItemIndex = var95.itemIndex,
			visibleAnchorIndex = visibleRange.firstIndex
		}
	})
end

local function measureCrossAxisTraversal(vectorA, vectorB, p50, p51, p52, p53, p54) --[[ line: 677 ]]
	-- upvalues: createItems (ref), snapshotPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local list = table.create(p51)
	
	for i = 1, p51 do
		list[i] = i % 5 * 8 + 32
	end
	local var105 = if p53 == "grid" then vectorA.Layout.grid({ itemLength = 40, crossAxisCount = 3 }) else vectorA.Layout.masonry({
		crossAxisCount = 3,
		spacing = 4,
		getItemLength = function(p55) --[[ line: 693 ]]
			-- upvalues: list (ref)
			return list[p55]
		end
	})
	local var106 = vectorA.Adapter.createRecyclingScope({
		adapter = {
			create = function() --[[ line: 701 ]]
				return {}
			end,
			destroy = function() --[[ line: 704 ]] end
		}
	})
	local var107 = vectorA.Adapter.createVirtualizer({
		overscan = 1,
		dataSource = vectorA.DataSource.snapshot(createItems(p51), function(p56) --[[ line: 708 ]]
			return tostring(p56.id)
		end),
		layout = var105,
		recyclingScope = var106,
		getItemViewType = function() --[[ line: 713 ]]
			return "row"
		end
	})
	var107.dispatch({ type = vectorA.VirtualizerCommandType.Activate })
	var107.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = vectorA.VirtualizerCommandType.SetViewportSize
	})
	local var108 = 0
	local var109 = 0
	local var110 = vectorB.measure(function() --[[ line: 726 ]]
		-- upvalues: var109 (write), p52 (ref), var107 (ref), vectorA (ref), snapshotPlacementChecksum (copy), var108 (write)
		var109 = 0
		
		for i = 1, p52 do
			local var111 = var107.dispatch({
				type = vectorA.VirtualizerCommandType.SetScrollOffset,
				offset = i * 40
			})
			var109 += snapshotPlacementChecksum(var111.snapshot)
			local visibleRange = var111.snapshot.visibleRange
			var108 += visibleRange.firstIndex + visibleRange.lastIndex
			var108 += var107.query({
				type = vectorA.VirtualizerQueryType.GetItemLayout,
				index = visibleRange.firstIndex
			}).crossAxisCount
		end
	end, p54)
	local visibleRange = var107.getSnapshot().visibleRange
	local crossAxisCount = var107.query({
		type = vectorA.VirtualizerQueryType.GetItemLayout,
		index = visibleRange.firstIndex
	}).crossAxisCount
	var107.dispatch({ type = vectorA.VirtualizerCommandType.Destroy })
	var106.destroy()
	var105.destroy()
	assert(var108 > 0 and var109 > 0, `{p53} traversal benchmark did not expose mounted placements`)
	
	return p50.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		responsibility = responsibilityCatalogModule.Core.LayoutGeometry,
		workload = `{p53}-traversal`,
		description = `Traverses representative {p53} geometry through the complete Virtualizer path.`,
		scale = { items = p51, scrollSteps = p52, layout = p53 },
		timing = {
			unit = "ms",
			basis = "scrollTraversal",
			includesSchedulerWaits = false,
			operationsPerSample = p52
		},
		arms = { viewRecycler = var110 },
		evidence = {
			queries = p52,
			crossAxisCount = crossAxisCount,
			finalVisibleFirst = visibleRange.firstIndex,
			finalVisibleLast = visibleRange.lastIndex,
			observablePlacementChecksum = var109
		}
	})
end

local function measureAtomicMutation(p57, p58, p59, p60, p61, p62, p63) --[[ line: 781 ]]
	-- upvalues: createItems (ref), snapshotPlacementChecksum (ref)
	local var112 = p57.DataSource.sequence(createItems(p60), function(p64) --[[ line: 790 ]]
		return tostring(p64.id)
	end)
	local var113 = p57.Layout.uniform({ itemLength = 40 })
	local var114 = 0
	local var115 = 0
	local var116 = 0
	local var117 = 0
	local var118 = 0
	var112.subscribe(function(p65) --[[ line: 799 ]]
		-- upvalues: var114 (write), var115 (write)
		var114 += 1
		var115 += #p65.changes
	end)
	local var119 = p57.Adapter.createRecyclingScope({
		adapter = {
			create = function() --[[ line: 805 ]]
				-- upvalues: var118 (write)
				var118 += 1
				
				return var118
			end,
			destroy = function() --[[ line: 809 ]] end
		}
	})
	local var120 = p57.Adapter.createVirtualizer({
		overscan = 1,
		preserveScrollPositionOnChange = true,
		dataSource = var112,
		layout = var113,
		recyclingScope = var119,
		getItemViewType = function(p66) --[[ line: 816 ]]
			return p66.kind
		end,
		onUpdate = function(_, p67) --[[ line: 821 ]]
			-- upvalues: p57 (ref), var116 (write), var117 (write)
			for i, v in p67.effects do
				if v.type == p57.VirtualizerEffectType.ScrollCorrection then
					var116 += 1
					var117 += math.abs(v.delta)
				end
			end
		end
	})
	var120.dispatch({ type = p57.VirtualizerCommandType.Activate })
	var120.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p57.VirtualizerCommandType.SetViewportSize
	})
	var120.dispatch({
		offset = 400,
		type = p57.VirtualizerCommandType.SetScrollOffset
	})
	local var121 = 0
	local var122 = 0
	local var123 = p58.measure(function() --[[ line: 839 ]]
		-- upvalues: var121 (write), var122 (write), var120 (ref), var112 (ref), snapshotPlacementChecksum (copy)
		var121 += 1
		var122 = 0
		local firstIndex = var120.getSnapshot().visibleRange.firstIndex
		local item = var112.getItem(firstIndex)
		var112.transaction(function() --[[ line: 844 ]]
			-- upvalues: var112 (copy), firstIndex (ref), item (ref), var121 (copy)
			var112.setItem(firstIndex, { id = item.id, kind = item.kind })
			var112.prepend({ kind = "row", id = -var121 })
			var112.remove(var112.getItemCount())
		end)
		var122 += snapshotPlacementChecksum(var120.getSnapshot())
	end, p63)
	local var124 = 0
	
	for i, v in var120.query({ type = p57.VirtualizerQueryType.GetItemViews }) do
		local var125 = var120.query({
			type = p57.VirtualizerQueryType.GetPlacementIntent,
			itemView = v
		})
		local var126 = if var125 == nil then nil else var125.measurementIdentity
		
		if var126 ~= nil then
			var124 = math.max(var124, var126.itemRevision)
		end
	end
	local scrollOffset = var120.query({ type = p57.VirtualizerQueryType.GetScrollState }).scrollOffset
	var120.dispatch({ type = p57.VirtualizerCommandType.Destroy })
	var119.destroy()
	var113.destroy()
	assert(var114 > 0 and var115 == var114 * 3, "atomic mutation benchmark did not emit grouped changes")
	assert(var124 > 0 and var122 > 0, "atomic mutation benchmark did not expose revised placements")
	assert(var116 > 0, "atomic mutation benchmark did not preserve its anchor")
	
	return p59.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		description = "Applies one atomic update/prepend/remove batch while preserving the visible anchor and item revisions.",
		responsibility = p61,
		workload = p62,
		scale = { changesPerTransaction = 3, items = p60 },
		timing = {
			unit = "ms",
			basis = "atomicMutation",
			operationsPerSample = 1,
			includesSchedulerWaits = false
		},
		arms = { viewRecycler = var123 },
		evidence = {
			batches = var114,
			changes = var115,
			highestItemRevision = var124,
			scrollCorrections = var116,
			correctionMagnitude = var117,
			finalScrollOffset = scrollOffset,
			observablePlacementChecksum = var122
		}
	})
end

local function measureOverscanPrefetch(p68, p69, p70, p71, p72, p73) --[[ line: 908 ]]
	-- upvalues: createItems (ref), responsibilityCatalogModule (ref)
	local var128 = 0
	local var129 = 0
	local var130 = 0
	local var131 = p68.Layout.uniform({ itemLength = 40 })
	local var132 = p68.Adapter.createRecyclingScope({
		adapter = {
			create = function() --[[ line: 922 ]]
				return {}
			end,
			destroy = function() --[[ line: 925 ]] end
		}
	})
	local var133 = p68.Adapter.createVirtualizer({
		dataSource = p68.DataSource.snapshot(createItems(p71), function(p74) --[[ line: 929 ]]
			return tostring(p74.id)
		end),
		layout = var131,
		recyclingScope = var132,
		getItemViewType = function() --[[ line: 934 ]]
			return "row"
		end,
		overscanPolicy = {
			compute = function(p75) --[[ line: 938 ]]
				-- upvalues: var128 (write)
				var128 += 1
				
				return if p75.scrollDirection == "backward" then { before = 3, after = 1 } else { before = 1, after = 3 }
			end
		},
		dataPrefetch = { startItems = 2, endItems = 4 }
	})
	var133.dispatch({ type = p68.VirtualizerCommandType.Activate })
	var133.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p68.VirtualizerCommandType.SetViewportSize
	})
	local var134 = p69.measure(function() --[[ line: 956 ]]
		-- upvalues: p72 (ref), var133 (ref), p68 (ref), var129 (write), var130 (write)
		for i_1 = 1, p72 do
			for i, v in var133.dispatch({
				type = p68.VirtualizerCommandType.SetScrollOffset,
				offset = i_1 * 40 * 2
			}).effects do
				if v.type == p68.VirtualizerEffectType.DataPrefetchRequested then
					var129 += 1
					
					if v.request.isCurrent() then
						var130 += 1
					end
				end
			end
		end
		var133.dispatch({
			offset = 40,
			type = p68.VirtualizerCommandType.SetScrollOffset
		})
	end, p73)
	local visibleRange = var133.getSnapshot().visibleRange
	local mountedRange = var133.getSnapshot().mountedRange
	var133.dispatch({ type = p68.VirtualizerCommandType.Destroy })
	var132.destroy()
	var131.destroy()
	assert(var128 > 0 and var129 > 0, "overscan/prefetch benchmark did not exercise both policies")
	local t = {
		prefetchStartItems = 2,
		prefetchEndItems = 4,
		items = p71,
		scrollSteps = p72 + 1
	}
	local t_1 = {
		unit = "ms",
		basis = "overscanPrefetchTraversal",
		includesSchedulerWaits = false,
		operationsPerSample = p72 + 1
	}
	local t_2 = { viewRecycler = var134 }
	local t_3 = {
		policyCalls = var128,
		prefetchRequests = var129,
		currentRequestsObserved = var130,
		visibleItems = visibleRange.lastIndex - visibleRange.firstIndex + 1,
		mountedItems = mountedRange.lastIndex - mountedRange.firstIndex + 1
	}
	
	return {
		p70.create({
			suite = "view-recycler-core",
			layer = "core",
			owner = "core",
			timingClass = "integrated",
			workload = "custom-overscan-hysteresis",
			description = "Computes directional custom overscan and maintains the mounted render band.",
			responsibility = responsibilityCatalogModule.Core.OverscanHysteresis,
			scale = t,
			timing = t_1,
			arms = t_2,
			evidence = t_3
		}),
		p70.create({
			suite = "view-recycler-core",
			layer = "core",
			owner = "core",
			timingClass = "integrated",
			workload = "edge-data-prefetch",
			description = "Publishes edge-scoped prefetch requests during the same representative traversal.",
			responsibility = responsibilityCatalogModule.Core.Prefetch,
			scale = t,
			timing = t_1,
			arms = t_2,
			evidence = t_3
		})
	}
end

local function measurePinnedSticky(p76, p77, p78, p79, p80, p81) --[[ line: 1031 ]]
	-- upvalues: createItems (ref), snapshotPlacementChecksum (ref), buildPlacementPlanModule (ref), responsibilityCatalogModule (ref)
	local var139 = p76.Layout.uniform({ itemLength = 40 })
	local t = {
		isItemStickyHeader = function(p82) --[[ line: 1041 ]]
			return p82.kind == "header"
		end,
		pinnedStartItem = {
			key = "$pinned-start",
			itemViewType = "pinned",
			revision = 1,
			length = 24,
			position = "start",
			value = { id = -1, kind = "pinned" }
		},
		pinnedEndItem = {
			key = "$pinned-end",
			itemViewType = "pinned",
			revision = 1,
			length = 32,
			position = "finish",
			value = { id = -2, kind = "pinned" }
		}
	}
	local var141 = p76.DataSource.snapshot(createItems(p79), function(p83) --[[ line: 1061 ]]
		return tostring(p83.id)
	end)
	local var142 = p76.Adapter.createRecyclingScope({
		adapter = {
			create = function() --[[ line: 1066 ]]
				return {}
			end,
			destroy = function() --[[ line: 1069 ]] end
		}
	})
	local var143 = p76.Adapter.createVirtualizer({
		overscan = 0,
		dataSource = var141,
		layout = var139,
		recyclingScope = var142,
		getItemViewType = function(p84) --[[ line: 1076 ]]
			return p84.kind
		end,
		isItemStickyHeader = t.isItemStickyHeader,
		pinnedStartItem = t.pinnedStartItem,
		pinnedEndItem = t.pinnedEndItem
	})
	var143.dispatch({ type = p76.VirtualizerCommandType.Activate })
	var143.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p76.VirtualizerCommandType.SetViewportSize
	})
	var143.dispatch({
		type = p76.VirtualizerCommandType.SetPolicy,
		policy = {
			overscan = 0,
			overscanPolicy = nil,
			dataPrefetch = nil,
			contentAlignment = nil,
			endThreshold = nil,
			preserveScrollPositionOnChange = true,
			pinnedItems = t
		}
	})
	local var144 = nil
	local var145 = nil
	
	for i, v in var143.query({ type = p76.VirtualizerQueryType.GetItemViews }) do
		local var153 = var143.query({
			type = p76.VirtualizerQueryType.GetPlacementIntent,
			itemView = v
		})
		local var154 = if var153 == nil then nil else var153.measurementIdentity
		
		if var154 ~= nil then
			if var154.itemKey == "$pinned-start" then
				var144 = var154
			elseif var154.itemKey == "$pinned-end" then
				var145 = var154
			end
		end
	end
	local viewportRelative
	assert(var144 ~= nil and var145 ~= nil, "pinned benchmark requires active pinned assignment identities")
	var143.dispatch({
		type = p76.VirtualizerCommandType.SubmitMeasurements,
		measurements = {
			{
				itemIndex = nil,
				itemKey = "$pinned-start",
				pinnedPosition = "start",
				length = 24,
				assignmentGeneration = var144.assignmentGeneration,
				itemRevision = var144.itemRevision
			},
			{
				itemIndex = nil,
				itemKey = "$pinned-end",
				pinnedPosition = "finish",
				length = 32,
				assignmentGeneration = var145.assignmentGeneration,
				itemRevision = var145.itemRevision
			}
		}
	})
	local var146 = 0
	local var147 = 0
	local var148 = nil
	local var149 = p77.measure(function() --[[ line: 1140 ]]
		-- upvalues: var147 (write), p80 (ref), var143 (ref), p76 (ref), snapshotPlacementChecksum (copy), var148 (write), buildPlacementPlanModule (copy), var141 (ref), var139 (ref), t (ref), var146 (write)
		var147 = 0
		
		for i = 1, p80 do
			var147 += snapshotPlacementChecksum(var143.dispatch({
				type = p76.VirtualizerCommandType.SetScrollOffset,
				offset = (i + 20) * 40
			}).snapshot)
			var148 = buildPlacementPlanModule({
				viewportLength = 480,
				dataSource = var141,
				layout = var139,
				stickyIndices = { 20, 40 },
				scrollOffset = var143.query({ type = p76.VirtualizerQueryType.GetScrollState }).scrollOffset,
				contentStartOffset = var143.getSnapshot().contentStartOffset,
				pinnedStartItem = t.pinnedStartItem,
				pinnedEndItem = t.pinnedEndItem
			})
			var146 += var148.placements["$pinned-start"].mainAxisLength
			var146 += var148.placements["$pinned-end"].mainAxisLength
		end
	end, p81)
	local var150 = var148
	local _20 = var150.placements["20"]
	local _40 = var150.placements["40"]
	
	if _20 ~= nil then
		viewportRelative = _20.viewportRelative
		
		if not viewportRelative then
			viewportRelative = _40 ~= nil and _40.viewportRelative
		end
		local var151 = var150.placements["$pinned-start"]
		local var152 = var150.placements["$pinned-end"]
		local contentStartOffset = var143.getSnapshot().contentStartOffset
		var143.dispatch({ type = p76.VirtualizerCommandType.Destroy })
		var142.destroy()
		var139.destroy()
		assert(var146 > 0 and (var147 > 0 and viewportRelative), "pinned/sticky benchmark did not expose viewport placements")
		
		return p78.create({
			suite = "view-recycler-core",
			layer = "core",
			owner = "core",
			timingClass = "integrated",
			workload = "sticky-pinned-placement",
			description = "Plans sticky retention, synthetic pinned assignments, and pinned content insets.",
			responsibility = responsibilityCatalogModule.Core.PinnedSticky,
			scale = { pinnedItems = 2, items = p79, scrollSteps = p80 },
			timing = {
				unit = "ms",
				basis = "pinnedStickyTraversal",
				includesSchedulerWaits = false,
				operationsPerSample = p80
			},
			arms = { viewRecycler = var149 },
			evidence = {
				stickyViewportRelative = viewportRelative,
				pinnedStartOffset = var151.mainAxisOffset,
				pinnedEndOffset = var152.mainAxisOffset,
				contentStartOffset = contentStartOffset,
				observablePlacementChecksum = var147
			}
		})
	end
end

local function measureScrollPolicy(p85, p86, p87, p88, p89) --[[ line: 1209 ]]
	-- upvalues: responsibilityCatalogModule (ref)
	local var155 = 0
	local var156 = 0
	local var157 = 0
	local var158 = 0
	
	local function runScrollPolicy() --[[ line: 1220 ]]
		-- upvalues: p88 (ref), p85 (ref), var155 (write), var156 (write), var158 (write), var157 (write)
		for _ = 1, p88 do
			local var161 = 200
			local var162 = 170
			local var163 = true
			local var164 = p85.Adapter.ScrollPolicy.createCoordinator({
				getItemCount = function() --[[ line: 1226 ]]
					return 20
				end,
				getScrollState = function() --[[ line: 1229 ]]
					-- upvalues: var161 (write), var162 (write)
					local maxValue = math.max(0, var161 - 30 - var162)
					
					return {
						viewportLength = 30,
						scrollOffset = var162,
						contentLength = var161,
						distanceFromEnd = maxValue,
						atStart = var162 == 0,
						atEnd = maxValue <= 1
					}
				end,
				getScrollOffsetForItem = function(value) --[[ line: 1240 ]]
					return value * 10
				end,
				applyScrollAnchorOffset = function(value) --[[ line: 1243 ]]
					-- upvalues: var163 (write), var155 (copy), var156 (copy), var162 (write), var158 (copy)
					if var163 then
						var155 += 1
						var163 = false
					else
						var156 += 1
					end
					var162 = value
					var158 += value
					
					return value
				end,
				getViewportState = function() --[[ line: 1254 ]]
					-- upvalues: var162 (write)
					return { viewportLength = 30, scrollOffset = var162 }
				end,
				getInitialScrollAlignment = function() --[[ line: 1257 ]]
					-- upvalues: p85 (copy)
					return p85.ScrollAlignment.End
				end,
				getAutoScrollPolicy = function() --[[ line: 1260 ]]
					-- upvalues: p85 (copy)
					return p85.AutoScrollPolicy.WhenAtEnd
				end,
				getStartReachedThreshold = function() --[[ line: 1263 ]]
					return 0
				end,
				getOnStartReached = function() --[[ line: 1266 ]]
					return nil
				end,
				getOnEndReached = function() --[[ line: 1269 ]]
					-- upvalues: var157 (copy)
					return function() --[[ line: 1270 ]]
						-- upvalues: var157 (copy)
						var157 += 1
					end
				end
			})
			var164.onViewportChanged()
			var164.onDataSourceChanged({
				previousItemCount = 20,
				itemCount = 21,
				changes = {
					{
						index = 21,
						type = p85.DataSourceChangeType.Insert,
						keys = { "21" }
					}
				}
			}, {
				scrollOffset = 170,
				viewportLength = 30,
				contentLength = 200,
				distanceFromEnd = 0,
				atStart = false,
				atEnd = true
			})
			var164.onContentLengthChanged(220)
			var164.checkEdges()
		end
	end
	
	local var160 = p86.measure(runScrollPolicy, p89)
	var155 = 0
	var156 = 0
	var157 = 0
	var158 = 0
	runScrollPolicy()
	assert(var155 > 0 and (var156 > 0 and var157 > 0), "scroll policy benchmark missed a policy phase")
	
	return p87.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "phased",
		workload = "initial-follow-pagination-policy",
		description = "Coordinates initial end alignment, end-follow settlement, and pagination edge delivery.",
		responsibility = responsibilityCatalogModule.Core.ScrollPolicy,
		scale = {
			initialAlignment = "end",
			autoScroll = "whenAtEnd",
			policyCycles = p88
		},
		timing = {
			unit = "ms",
			basis = "scrollPolicyCycle",
			includesSchedulerWaits = false,
			operationsPerSample = p88
		},
		arms = { viewRecycler = var160 },
		evidence = {
			initialScrolls = var155,
			endFollowWrites = var156,
			paginationHits = var157,
			hostOffsetChecksum = var158
		}
	})
end

local function measureRecyclingScopeRetention(p90, p91, p92, p93, p94, p95) --[[ line: 1336 ]]
	-- upvalues: responsibilityCatalogModule (ref)
	local var166 = 0
	local var167 = 0
	local var168 = 0
	local var169 = p90.Adapter.createRecyclingScope({
		maxPoolSize = 4,
		adapter = {
			create = function() --[[ line: 1349 ]]
				-- upvalues: var166 (write)
				var166 += 1
				
				return { id = var166 }
			end,
			destroy = function() --[[ line: 1353 ]]
				-- upvalues: var167 (write)
				var167 += 1
			end
		}
	})
	local t = {}
	local var171 = p91.measure(function() --[[ line: 1360 ]]
		-- upvalues: p94 (ref), p93 (ref), var169 (ref), t (ref), var168 (write)
		for _ = 1, p94 do
			local list = table.create(p93)
			
			for i = 1, p93 do
				list[i] = { viewType = "row" }
			end
			local acquired = var169.exchange(t, {}, list).acquired
			var168 += #acquired
			var169.exchange(t, acquired, {})
		end
	end, p95)
	local count = #var169.getVacantRecords()
	var169.destroy()
	assert(count == 4 and (var167 > 0 and var168 > 0), "RecyclingScope retention benchmark did not apply retention pressure with Lease tokens")
	
	return p92.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "integrated",
		workload = "recycling-scope-retention-pressure",
		description = "Acquires and releases Lease batches above the RecyclingScope per-type vacancy limit.",
		responsibility = responsibilityCatalogModule.Core.RecyclingScope,
		scale = {
			maxVacanciesPerType = 4,
			itemsPerBatch = p93,
			batches = p94
		},
		timing = {
			unit = "ms",
			basis = "recyclingScopePressureBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p94
		},
		arms = { viewRecycler = var171 },
		evidence = {
			creations = var166,
			evictions = var167,
			retainedVacancies = count,
			leaseTokensObserved = var168
		}
	})
end

local function measureActiveToggle(p96, p97, p98, p99, p100, p101) --[[ line: 1410 ]]
	-- upvalues: signalsModule (ref), createItems (ref), responsibilityCatalogModule (ref)
	local var174, var175 = signalsModule.createSignal(true)
	local var176 = 0
	local var177 = p96.Layout.uniform({ itemLength = 40 })
	local var178 = p96.Adapter.createRecyclingScope({
		adapter = {
			create = function() --[[ line: 1423 ]]
				return {}
			end,
			destroy = function() --[[ line: 1426 ]] end
		}
	})
	local var179 = p96.Adapter.createVirtualizer({
		dataSource = p96.DataSource.snapshot(createItems(p99), function(p102) --[[ line: 1430 ]]
			return tostring(p102.id)
		end),
		layout = var177,
		recyclingScope = var178,
		getItemViewType = function() --[[ line: 1435 ]]
			return "row"
		end,
		postCommitItemViewAssignment = function(_, p103) --[[ line: 1438 ]]
			-- upvalues: var176 (write)
			if p103 == nil then
				var176 += 1
			end
		end,
		active = var174
	})
	var179.dispatch({ type = p96.VirtualizerCommandType.Activate })
	var179.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p96.VirtualizerCommandType.SetViewportSize
	})
	local var180 = p97.measure(function() --[[ line: 1451 | named "runActiveToggle" ]]
		-- upvalues: p100 (ref), var175 (ref)
		for _ = 1, p100 do
			var175(false)
			var175(true)
		end
	end, p101)
	var176 = 0
	
	for _ = 1, p100 do
		var175(false)
		var175(true)
	end
	local count = #var179.query({ type = p96.VirtualizerQueryType.GetItemViews })
	var179.dispatch({ type = p96.VirtualizerCommandType.Destroy })
	var178.destroy()
	var177.destroy()
	assert(var176 > 0 and count > 0, "active toggle benchmark did not release and reactivate")
	
	return p98.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "active-state-toggle",
		description = "Releases all assignments while inactive and synchronizes the latest desired window on reactivation.",
		responsibility = responsibilityCatalogModule.Core.ItemViewPresentation,
		scale = { items = p99, toggles = p100 },
		timing = {
			unit = "ms",
			basis = "deactivateReactivate",
			includesSchedulerWaits = false,
			operationsPerSample = p100
		},
		arms = { viewRecycler = var180 },
		evidence = {
			releasedAssignments = var176,
			mountedAfterReactivation = count
		}
	})
end

local function measureLifecycle(p104, p105, p106, p107, p108, p109, p110) --[[ line: 1493 ]]
	-- upvalues: createItems (ref)
	local var182 = 0
	local var183 = 0
	local var184 = 0
	local var185 = 0
	
	local function runLifecycle() --[[ line: 1506 ]]
		-- upvalues: p104 (ref), createItems (copy), p107 (ref), var185 (write), var182 (write), var184 (write), var183 (write)
		local var188 = p104.Layout.uniform({ itemLength = 40 })
		local var189 = p104.Adapter.createRecyclingScope({
			adapter = {
				create = function() --[[ line: 1510 ]]
					return {}
				end,
				destroy = function() --[[ line: 1513 ]] end
			}
		})
		local var190 = p104.Adapter.createVirtualizer({
			dataSource = p104.DataSource.snapshot(createItems(p107), function(p111) --[[ line: 1517 ]]
				return tostring(p111.id)
			end),
			layout = var188,
			recyclingScope = var189,
			getItemViewType = function() --[[ line: 1522 ]]
				return "row"
			end,
			postCommitItemViewAssignment = function(_, p112) --[[ line: 1525 ]]
				-- upvalues: var185 (copy)
				if p112 == nil then
					var185 += 1
				end
			end
		})
		var190.dispatch({ type = p104.VirtualizerCommandType.Activate })
		var190.dispatch({
			scrollAxisLength = 480,
			crossAxisLength = 800,
			type = p104.VirtualizerCommandType.SetViewportSize
		})
		var182 += 1
		var184 += #var190.query({ type = p104.VirtualizerQueryType.GetItemViews })
		var190.dispatch({ type = p104.VirtualizerCommandType.Destroy })
		var189.destroy()
		var188.destroy()
		var183 += 1
	end
	
	local var187 = p105.measure(runLifecycle, p110)
	var182 = 0
	var183 = 0
	var184 = 0
	var185 = 0
	runLifecycle()
	assert(var182 > 0 and (var182 == var183 and var185 > 0), "lifecycle benchmark did not complete cleanup")
	
	return p106.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "phased",
		description = "Builds a populated Virtualizer lifecycle and synchronously releases all owned resources.",
		responsibility = p108,
		workload = p109,
		scale = { items = p107 },
		timing = {
			unit = "ms",
			basis = "virtualizerLifecycle",
			operationsPerSample = 1,
			includesSchedulerWaits = false
		},
		arms = { viewRecycler = var187 },
		evidence = {
			initialized = var182,
			destroyed = var183,
			mountedAssignments = var184,
			releasedAssignments = var185
		}
	})
end

return {
	run = function(p113, p114, p115, p116) --[[ line: 1583 ]]
		-- upvalues: list (ref), measureTraversal (ref), responsibilityCatalogModule (ref), measureCrossAxisTraversal (ref), measureCoordinator (ref), measureWithinBand (ref), measureLifecycle (ref), measureAtomicMutation (ref), measureOverscanPrefetch (ref), measureProgrammaticScroll (ref), measureMeasurementAnchoring (ref), measurePinnedSticky (ref), measureScrollPolicy (ref), measureRecyclingScopeRetention (ref), measureActiveToggle (ref)
		p116 = p116 or {}
		local itemCounts = p116.itemCounts or list
		local scrollStepCount = p116.scrollStepCount or 100
		local coordinatorItemCount = p116.coordinatorItemCount or 40
		local coordinatorStepCount = p116.coordinatorStepCount or 100
		assert(scrollStepCount >= 1 and scrollStepCount % 1 == 0, "scrollStepCount must be a positive integer")
		assert(#itemCounts > 0, "itemCounts must not be empty")
		local t = {}
		
		for i, v in itemCounts do
			assert(v >= 1 and v % 1 == 0, "item counts must be positive integers")
			table.insert(t, measureTraversal(p113, p114, p115, v, scrollStepCount, false, false, "jump", "uniform-traversal", "Runs the complete Virtualizer scroll, range, placement, and recycling path for a uniform layout.", responsibilityCatalogModule.Core.LayoutGeometry, p116))
			table.insert(t, measureTraversal(p113, p114, p115, v, scrollStepCount, true, false, "jump", "measured-offset-traversal", "Runs measured-layout offset lookup and propagation without submitting new item sizes.", responsibilityCatalogModule.Core.LayoutGeometry, p116))
			table.insert(t, measureTraversal(p113, p114, p115, v, scrollStepCount, true, true, "jump", "measured-update-traversal", "Runs the complete measured Virtualizer path and submits mounted-item size batches at every step.", responsibilityCatalogModule.Core.Measurement, p116))
			table.insert(t, measureCrossAxisTraversal(p113, p114, p115, v, scrollStepCount, "grid", p116))
			table.insert(t, measureCrossAxisTraversal(p113, p114, p115, v, scrollStepCount, "masonry", p116))
		end
		local var197 = itemCounts[1]
		assert(var197 >= 40, "the smallest item count must cover sticky and mutation workloads")
		
		for i_1, v_1 in { "short", "jump" } do
			table.insert(t, measureTraversal(p113, p114, p115, var197, scrollStepCount, false, false, v_1, "recycling-assignment-churn", "Contrasts nearby scrolling with large jumps through the same uniform Virtualizer.", responsibilityCatalogModule.Core.ItemViewPresentation, p116))
		end
		for i_2, v_2 in { "retained", "churn" } do
			table.insert(t, measureCoordinator(p113, p114, p115, coordinatorItemCount, coordinatorStepCount, v_2, p116))
		end
		table.insert(t, measureWithinBand(p113, p114, p115, itemCounts[1], scrollStepCount, p116))
		table.insert(t, measureLifecycle(p113, p114, p115, var197, responsibilityCatalogModule.Core.Initialization, "virtualizer-initialization", p116))
		table.insert(t, measureAtomicMutation(p113, p114, p115, var197, responsibilityCatalogModule.Core.DataMutation, "atomic-data-mutation", p116))
		table.insert(t, measureAtomicMutation(p113, p114, p115, var197, responsibilityCatalogModule.Core.DataAnchoring, "atomic-anchor-preservation", p116))
		
		for i_3, v_3 in measureOverscanPrefetch(p113, p114, p115, var197, scrollStepCount, p116) do
			table.insert(t, v_3)
		end
		table.insert(t, measureProgrammaticScroll(p113, p114, p115, var197, scrollStepCount, p116))
		table.insert(t, measureMeasurementAnchoring(p113, p114, p115, var197, scrollStepCount, p116))
		table.insert(t, measurePinnedSticky(p113, p114, p115, var197, scrollStepCount, p116))
		table.insert(t, measureScrollPolicy(p113, p114, p115, scrollStepCount, p116))
		table.insert(t, measureRecyclingScopeRetention(p113, p114, p115, coordinatorItemCount, coordinatorStepCount, p116))
		table.insert(t, measureActiveToggle(p113, p114, p115, var197, scrollStepCount, p116))
		table.insert(t, measureLifecycle(p113, p114, p115, var197, responsibilityCatalogModule.Core.Teardown, "virtualizer-teardown", p116))
		
		return t
	end
}