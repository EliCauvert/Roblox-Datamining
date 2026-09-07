local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local responsibilityCatalogModule = require(script.Parent.ResponsibilityCatalog)
local signalsModule = require(viewRecycler.Parent.Signals)
local buildPlacementPlanModule = require(viewRecycler.Core.PinnedItems.buildPlacementPlan)
local list = { 1000, 100000 }

local function createItems(p1)
	local list = table.create(p1)
	
	for i = 1, p1 do
		list[i] = { id = i, kind = if i % 20 == 0 then "header" else "row" }
	end
	return list
end

local function createOffsets(value, p2, p3)
	local maxValue = math.max(0, value * 40 - 480)
	local list = table.create(p2)
	
	for i = 1, p2 - 1 do
		if p3 == "short" then
			list[i] = math.min(maxValue, i * 40)
		else
			list[i] = math.floor(i * 7919 % 104729 / 104729 * maxValue)
		end
	end
	list[p2] = 0
	
	return list
end

local function snapshotPlacementChecksum(p4)
	local var1 = 0
	
	for i, v in p4.entries do
		var1 = var1 + v.itemLayout.startOffset + (v.canvasPlacement.mainAxisOffset or 0) + (if v.viewportPlacement == nil then 0 else v.viewportPlacement.mainAxisOffset or 0)
	end
	return var1
end

local function _()
	return {
		synchronizations = 0,
		reassignedAssignments = 0,
		acquiredAssignments = 0,
		releasedAssignments = 0,
		acceptedMeasurements = 0
	}
end

local _ = function(value)
	value.synchronizations = 0
	value.reassignedAssignments = 0
	value.acquiredAssignments = 0
	value.releasedAssignments = 0
	value.acceptedMeasurements = 0
end

local function createVirtualizer(p5, p6, p7)
	-- upvalues: createItems (ref)
	local var2 = 0
	local t = {
		synchronizations = 0,
		reassignedAssignments = 0,
		acquiredAssignments = 0,
		releasedAssignments = 0,
		acceptedMeasurements = 0
	}
	local var3 = if p7 then p5.Layout.measured({ estimatedItemLength = 40 }) else p5.Layout.uniform({ itemLength = 40 })
	local var4 = p5.Adapter.createRecyclingScope({
		maxPoolSize = 4,
		adapter = {
			create = function()
				-- upvalues: var2 (write)
				var2 += 1
				
				return var2
			end,
			destroy = function() end
		}
	})
	local var5 = p5.Adapter.createVirtualizer({
		overscan = 2,
		dataSource = p5.DataSource.snapshot(createItems(p6), function(p8)
			return tostring(p8.id)
		end),
		layout = var3,
		recyclingScope = var4,
		getItemViewType = function(p8)
			return p8.kind
		end,
		diagnostics = function(p8)
			-- upvalues: t (ref)
			if p8.kind == "itemViewsSynchronized" then
				t.synchronizations += 1
				t.reassignedAssignments += p8.reassigned
				t.acquiredAssignments += p8.acquired
				t.releasedAssignments += p8.released
				
				return
			elseif p8.kind == "measurementsProcessed" then
				t.acceptedMeasurements += p8.accepted
			end
		end
	})
	var5.dispatch({ type = p5.VirtualizerCommandType.Activate })
	var5.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p5.VirtualizerCommandType.SetViewportSize
	})
	
	return var5, var3, t, var4
end

local function measureTraversal(p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16)
	-- upvalues: createVirtualizer (ref), createOffsets (ref), snapshotPlacementChecksum (ref)
	local var2, var3, var4, var5 = createVirtualizer(p5, p8, p10)
	local var6 = createOffsets(p8, p9, p12)
	local var7 = 0
	local var8 = 0
	local var9 = 0
	local var10 = 0
	local var11 = p6.measure(function()
		-- upvalues: var4 (ref), var10 (write), var9 (write), var7 (write), var6 (ref), var2 (ref), p5 (ref), snapshotPlacementChecksum (copy), p11 (ref), var8 (write)
		var4.synchronizations = 0
		var4.reassignedAssignments = 0
		var4.acquiredAssignments = 0
		var4.releasedAssignments = 0
		var4.acceptedMeasurements = 0
		var10 = 0
		var9 = 0
		var7 = (var7 + 1) % 5
		
		for i, v in var6 do
			var9 += snapshotPlacementChecksum(var2.dispatch({
				type = p5.VirtualizerCommandType.SetScrollOffset,
				offset = v
			}).snapshot)
			
			if p11 then
				local t = {}
				
				for i_1, v_1 in var2.query({ type = p5.VirtualizerQueryType.GetItemViews }) do
					local var12 = var2.query({
						type = p5.VirtualizerQueryType.GetPlacementIntent,
						itemView = v_1
					})
					local var13 = if var12 == nil then nil else var12.measurementIdentity
					
					if var13 ~= nil then
						table.insert(t, {
							itemIndex = var13.itemIndex,
							itemKey = var13.itemKey,
							assignmentGeneration = var13.assignmentGeneration,
							itemRevision = var13.itemRevision,
							length = 36 + (var13.itemIndex + var7) % 5 * 2
						})
					end
				end
				var10 += #t
				var9 += snapshotPlacementChecksum(var2.dispatch({
					type = p5.VirtualizerCommandType.SubmitMeasurements,
					measurements = t
				}).snapshot)
				var8 += #t
			end
		end
		local visibleRange = var2.getSnapshot().visibleRange
		var8 += visibleRange.firstIndex + visibleRange.lastIndex
	end, p16)
	local count = #var2.query({ type = p5.VirtualizerQueryType.GetItemViews })
	local var14 = p9 * (if p11 then 2 else 1)
	var2.dispatch({ type = p5.VirtualizerCommandType.Destroy })
	var5.destroy()
	var3.destroy()
	assert(var8 > 0 and var9 > 0, `{p13} benchmark did not expose mounted placements`)
	assert(var4.synchronizations <= var14, `{p13} synchronized more than once per accepted scroll or measurement mutation`)
	
	return p7.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		responsibility = p15,
		workload = p13,
		description = p14,
		scale = {
			items = p8,
			scrollSteps = p9,
			scrollPattern = p12,
			layout = if p10 then "measured" else "uniform",
			submitsMeasurements = p11
		},
		timing = {
			unit = "ms",
			basis = "scrollTraversal",
			includesSchedulerWaits = false,
			operationsPerSample = p9
		},
		arms = { viewRecycler = var11 },
		evidence = {
			mountedItemViews = count,
			synchronizations = var4.synchronizations,
			settlementSynchronizationBudget = var14,
			reassignedAssignments = var4.reassignedAssignments,
			acquiredAssignments = var4.acquiredAssignments,
			releasedAssignments = var4.releasedAssignments,
			submittedMeasurements = var10,
			acceptedMeasurements = var4.acceptedMeasurements,
			observablePlacementChecksum = var9
		}
	})
end

local function measureCoordinator(p17, p18, p19, p20, p21, p22, p23)
	-- upvalues: responsibilityCatalogModule (ref)
	local function createFixture(p24)
		-- upvalues: p17 (ref), p20 (ref), p22 (ref), p21 (ref)
		local var15 = 0
		local var16 = 0
		local var17 = 0
		local var18 = p17.Adapter.createRecyclingScope({
			adapter = {
				create = function()
					-- upvalues: var15 (write)
					var15 += 1
					
					return var15
				end,
				destroy = function() end
			},
			onPoolChanged = if p24 then function()
				-- upvalues: var16 (write)
				var16 += 1
			end else nil
		})
		local list = table.create(p20)
		local list_1 = table.create(p20)
		
		for i = 1, p20 do
			list[i] = { key = `a{i}`, index = i, value = i }
			list_1[i] = if p22 == "retained" then list[i] else { key = `b{i}`, index = i, value = i }
		end
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		local function synchronize(p25)
			-- upvalues: t_1 (write), var18 (ref), t_2 (ref), var17 (write), t (write)
			local t_3 = {}
			local t_4 = {}
			local t_5 = {}
			local t_6 = {}
			
			for i, v in p25 do
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
			local var19 = var18.exchange(t_2, t_3, t_4)
			var17 += #var19.acquired
			
			for i_2, v_2 in var19.acquired do
				t_6[t_5[i_2].key] = v_2
			end
			t_1 = t_6
			t = table.create(#p25)
			
			for i_3, v_3 in p25 do
				t[i_3] = t_1[v_3.key]
			end
		end
		
		synchronize(list)
		local var20 = false
		
		return {
			run = function()
				-- upvalues: p21 (copy), var20 (write), synchronize (ref), list_1 (ref), list (ref)
				for _ = 1, p21 do
					var20 = not var20
					synchronize(if var20 then list_1 else list)
				end
			end,
			getDiagnosticEvents = function()
				-- upvalues: var16 (write)
				return var16
			end,
			getLeaseTokensObserved = function()
				-- upvalues: var17 (write)
				return var17
			end,
			getScopeInventory = var18.getScopeInventory,
			destroy = function()
				-- upvalues: var18 (ref), t_2 (ref), t (write), t_1 (write)
				var18.exchange(t_2, t, {})
				t = {}
				t_1 = {}
				var18.destroy()
			end
		}
	end
	
	local var21 = createFixture(false)
	local var22 = createFixture(true)
	local var23 = p18.measure(var21.run, p23)
	local var24 = p18.measure(var22.run, p23)
	local count = #var21.getScopeInventory()
	local diagnosticEvents = var22.getDiagnosticEvents()
	local leaseTokensObserved = var21.getLeaseTokensObserved()
	var21.destroy()
	var22.destroy()
	
	return p19.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "integrated",
		workload = "recycling-scope-sync",
		description = "Synchronizes a Recycling scope with retained or fully replaced desired keys.",
		responsibility = responsibilityCatalogModule.Core.Diagnostics,
		scale = { items = p20, synchronizations = p21, pattern = p22 },
		timing = {
			unit = "ms",
			basis = "coordinatorSynchronizationBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p21
		},
		arms = { diagnosticsDisabled = var23, diagnosticsEnabled = var24 },
		evidence = {
			resources = count,
			diagnosticEvents = diagnosticEvents,
			leaseTokensObserved = leaseTokensObserved
		}
	})
end

local function measureWithinBand(p26, p27, p28, p29, p30, p31)
	-- upvalues: createVirtualizer (ref), snapshotPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local function createArm(p32)
		-- upvalues: createVirtualizer (copy), p26 (ref), p29 (ref), p30 (ref), snapshotPlacementChecksum (copy)
		local var25, var26, var27, var28 = createVirtualizer(p26, p29, p32)
		local var29 = 1
		local var30 = 0
		
		return {
			run = function()
				-- upvalues: var27 (ref), var30 (write), p30 (copy), var25 (ref), p26 (copy), var29 (write), snapshotPlacementChecksum (copy)
				var27.synchronizations = 0
				var27.reassignedAssignments = 0
				var27.acquiredAssignments = 0
				var27.releasedAssignments = 0
				var27.acceptedMeasurements = 0
				var30 = 0
				
				for i = 1, p30 do
					var30 += snapshotPlacementChecksum(var25.dispatch({
						type = p26.VirtualizerCommandType.SetScrollOffset,
						offset = if var29 == 1 then i else p30 - i
					}).snapshot)
				end
				var29 = -var29
			end,
			counters = var27,
			getObservablePlacementChecksum = function()
				-- upvalues: var30 (write)
				return var30
			end,
			prepareCanonicalEvidence = function()
				-- upvalues: var29 (write)
				var29 = 1
			end,
			destroy = function()
				-- upvalues: var25 (ref), p26 (copy), var28 (ref), var26 (ref)
				var25.dispatch({ type = p26.VirtualizerCommandType.Destroy })
				var28.destroy()
				var26.destroy()
			end
		}
	end
	
	local var31 = createArm(false)
	local var32 = createArm(true)
	local var33 = p27.measure(var31.run, p31)
	local var34 = p27.measure(var32.run, p31)
	var31.prepareCanonicalEvidence()
	var32.prepareCanonicalEvidence()
	var31.run()
	var32.run()
	local t = {
		uniformSynchronizations = var31.counters.synchronizations,
		measuredSynchronizations = var32.counters.synchronizations,
		uniformObservablePlacementChecksum = var31.getObservablePlacementChecksum(),
		measuredObservablePlacementChecksum = var32.getObservablePlacementChecksum()
	}
	assert(t.uniformObservablePlacementChecksum > 0 and t.measuredObservablePlacementChecksum > 0, "within-Band benchmark did not consume committed mounted placements")
	var31.destroy()
	var32.destroy()
	
	return p28.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "within-band-scrolling",
		description = "Scrolls by sub-item increments inside one render-window band without sticky or pinned items.",
		responsibility = responsibilityCatalogModule.Core.ViewportRange,
		scale = { stickyOrPinned = false, items = p29, scrollSteps = p30 },
		timing = {
			unit = "ms",
			basis = "withinBandScrollBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p30
		},
		arms = { uniform = var33, measured = var34 },
		evidence = t
	})
end

local function measureProgrammaticScroll(p32, p33, p34, p35, p36, p37)
	-- upvalues: createVirtualizer (ref), snapshotPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local var25, var26, _, var27 = createVirtualizer(p32, p35, false)
	local var28 = 0
	local var29 = 0
	local var30 = 0
	local var31 = p33.measure(function()
		-- upvalues: var28 (write), var29 (write), var30 (write), p36 (ref), p35 (ref), var25 (ref), p32 (ref), snapshotPlacementChecksum (copy)
		var28 = 0
		var29 = 0
		var30 = 0
		
		for i = 1, p36 do
			var30 += snapshotPlacementChecksum(var25.dispatch({
				type = p32.VirtualizerCommandType.ScrollToOffset,
				offset = var25.query({
					type = p32.VirtualizerQueryType.GetScrollOffsetForItem,
					index = i * 17 % p35 + 1,
					alignment = p32.ScrollAlignment.Center
				})
			}).snapshot)
			local var32 = var25.query({ type = p32.VirtualizerQueryType.CaptureScrollSnapshot })
			var28 += 1
			var30 += snapshotPlacementChecksum(var25.dispatch({ delta = 40, type = p32.VirtualizerCommandType.ScrollBy }).snapshot)
			local var33 = var25.dispatch({
				type = p32.VirtualizerCommandType.RestoreScrollSnapshot,
				snapshot = var32
			})
			var30 += snapshotPlacementChecksum(var33.snapshot)
			var29 += var33.result
		end
	end, p37)
	local var34 = var25.query({ type = p32.VirtualizerQueryType.GetScrollState })
	var25.dispatch({ type = p32.VirtualizerCommandType.Destroy })
	var27.destroy()
	var26.destroy()
	assert(var28 == p36 and (var29 > 0 and var30 > 0), "programmatic scroll benchmark did not restore snapshots")
	
	return p34.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "programmatic-scroll-snapshot",
		description = "Resolves item targets, scrolls by offset and delta, and captures and restores stable-key snapshots.",
		responsibility = responsibilityCatalogModule.Core.ProgrammaticScroll,
		scale = { items = p35, scrollCycles = p36 },
		timing = {
			unit = "ms",
			basis = "programmaticScrollSnapshotCycle",
			includesSchedulerWaits = false,
			operationsPerSample = p36
		},
		arms = { viewRecycler = var31 },
		evidence = {
			snapshotsCaptured = var28,
			restoredOffsetChecksum = var29,
			finalScrollOffset = var34.scrollOffset,
			observablePlacementChecksum = var30
		}
	})
end

local function measureMeasurementAnchoring(p38, p39, p40, p41, p42, p43)
	-- upvalues: createVirtualizer (ref), snapshotPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local scrollOffset
	local var32, var33, _, var34 = createVirtualizer(p38, p41, true)
	var32.dispatch({
		offset = 400,
		type = p38.VirtualizerCommandType.SetScrollOffset
	})
	local visibleRange = var32.getSnapshot().visibleRange
	local var35 = nil
	
	for i, v in var32.query({ type = p38.VirtualizerQueryType.GetItemViews }) do
		local var36 = var32.query({
			type = p38.VirtualizerQueryType.GetPlacementIntent,
			itemView = v
		})
		scrollOffset = if var36 == nil then nil else var36.measurementIdentity
		
		if scrollOffset ~= nil and scrollOffset.itemIndex < visibleRange.firstIndex then
			var35 = scrollOffset
			break
		end
	end
	assert(var35 ~= nil, "measurement anchoring benchmark requires an overscanned item above the visible anchor")
	local var37 = 0
	local var38 = 0
	local var39 = 0
	
	local function runMeasurementAnchoring()
		-- upvalues: var37 (write), var38 (write), var39 (write), p42 (ref), var32 (ref), p38 (ref), var35 (write)
		var37 = 0
		var38 = 0
		var39 = 0
		
		for i_2 = 1, p42 do
			local var40 = var32.dispatch({
				type = p38.VirtualizerCommandType.SubmitMeasurements,
				measurements = {
					{
						itemIndex = var35.itemIndex,
						itemKey = var35.itemKey,
						assignmentGeneration = var35.assignmentGeneration,
						itemRevision = var35.itemRevision,
						length = if i_2 % 2 == 0 then 40 else 80
					}
				}
			})
			
			for i, v in var40.effects do
				if v.type == p38.VirtualizerEffectType.ScrollCorrection then
					var37 += 1
					var38 += math.abs(v.delta)
				end
			end
			for i, v in var40.snapshot.entries do
				var39 += v.itemLayout.startOffset
			end
		end
	end
	
	local cloned = table.clone(p43)
	cloned.iterationsPerSample = 1
	local var41 = p39.measure(runMeasurementAnchoring, cloned)
	var32.dispatch({
		type = p38.VirtualizerCommandType.SubmitMeasurements,
		measurements = {
			{
				length = 40,
				itemIndex = var35.itemIndex,
				itemKey = var35.itemKey,
				assignmentGeneration = var35.assignmentGeneration,
				itemRevision = var35.itemRevision
			}
		}
	})
	var32.dispatch({
		offset = 400,
		type = p38.VirtualizerCommandType.SetScrollOffset
	})
	runMeasurementAnchoring()
	var39 = snapshotPlacementChecksum(var32.getSnapshot())
	scrollOffset = var32.query({ type = p38.VirtualizerQueryType.GetScrollState }).scrollOffset
	var32.dispatch({ type = p38.VirtualizerCommandType.Destroy })
	var34.destroy()
	var33.destroy()
	assert(var37 > 0 and (var38 > 0 and var39 > 0), "measurement anchoring benchmark did not expose corrected mounted placements")
	
	return p40.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "measurement-anchor-preservation",
		description = "Changes a measured overscan item above the visible anchor and preserves the visible position.",
		responsibility = responsibilityCatalogModule.Core.MeasurementAnchoring,
		scale = { items = p41, measurementUpdates = p42 },
		timing = {
			unit = "ms",
			basis = "measurementAnchorUpdateBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p42
		},
		arms = { viewRecycler = var41 },
		evidence = {
			scrollCorrections = var37,
			correctionMagnitude = var38,
			finalScrollOffset = scrollOffset,
			observablePlacementChecksum = var39,
			measuredItemIndex = var35.itemIndex,
			visibleAnchorIndex = visibleRange.firstIndex
		}
	})
end

local function measureCrossAxisTraversal(vectorA, vectorB, p44, p45, p46, p47, p48)
	-- upvalues: createItems (ref), snapshotPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local list = table.create(p45)
	
	for i = 1, p45 do
		list[i] = i % 5 * 8 + 32
	end
	local var42 = if p47 == "grid" then vectorA.Layout.grid({ itemLength = 40, crossAxisCount = 3 }) else vectorA.Layout.masonry({
		crossAxisCount = 3,
		spacing = 4,
		getItemLength = function(p49)
			-- upvalues: list (ref)
			return list[p49]
		end
	})
	local var43 = vectorA.Adapter.createRecyclingScope({
		adapter = {
			create = function()
				return {}
			end,
			destroy = function() end
		}
	})
	local var44 = vectorA.Adapter.createVirtualizer({
		overscan = 1,
		dataSource = vectorA.DataSource.snapshot(createItems(p45), function(p49)
			return tostring(p49.id)
		end),
		layout = var42,
		recyclingScope = var43,
		getItemViewType = function()
			return "row"
		end
	})
	var44.dispatch({ type = vectorA.VirtualizerCommandType.Activate })
	var44.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = vectorA.VirtualizerCommandType.SetViewportSize
	})
	local var45 = 0
	local var46 = 0
	local var47 = vectorB.measure(function()
		-- upvalues: var46 (write), p46 (ref), var44 (ref), vectorA (ref), snapshotPlacementChecksum (copy), var45 (write)
		var46 = 0
		
		for i = 1, p46 do
			local var48 = var44.dispatch({
				type = vectorA.VirtualizerCommandType.SetScrollOffset,
				offset = i * 40
			})
			var46 += snapshotPlacementChecksum(var48.snapshot)
			local visibleRange = var48.snapshot.visibleRange
			var45 += visibleRange.firstIndex + visibleRange.lastIndex
			var45 += var44.query({
				type = vectorA.VirtualizerQueryType.GetItemLayout,
				index = visibleRange.firstIndex
			}).crossAxisCount
		end
	end, p48)
	local visibleRange = var44.getSnapshot().visibleRange
	local crossAxisCount = var44.query({
		type = vectorA.VirtualizerQueryType.GetItemLayout,
		index = visibleRange.firstIndex
	}).crossAxisCount
	var44.dispatch({ type = vectorA.VirtualizerCommandType.Destroy })
	var43.destroy()
	var42.destroy()
	assert(var45 > 0 and var46 > 0, `{p47} traversal benchmark did not expose mounted placements`)
	
	return p44.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		responsibility = responsibilityCatalogModule.Core.LayoutGeometry,
		workload = `{p47}-traversal`,
		description = `Traverses representative {p47} geometry through the complete Virtualizer path.`,
		scale = { items = p45, scrollSteps = p46, layout = p47 },
		timing = {
			unit = "ms",
			basis = "scrollTraversal",
			includesSchedulerWaits = false,
			operationsPerSample = p46
		},
		arms = { viewRecycler = var47 },
		evidence = {
			queries = p46,
			crossAxisCount = crossAxisCount,
			finalVisibleFirst = visibleRange.firstIndex,
			finalVisibleLast = visibleRange.lastIndex,
			observablePlacementChecksum = var46
		}
	})
end

local function measureAtomicMutation(p49, p50, p51, p52, p53, p54, p55)
	-- upvalues: createItems (ref), snapshotPlacementChecksum (ref)
	local var48 = p49.DataSource.sequence(createItems(p52), function(p56)
		return tostring(p56.id)
	end)
	local var49 = p49.Layout.uniform({ itemLength = 40 })
	local var50 = 0
	local var51 = 0
	local var52 = 0
	local var53 = 0
	local var54 = 0
	var48.subscribe(function(p56)
		-- upvalues: var50 (write), var51 (write)
		var50 += 1
		var51 += #p56.changes
	end)
	local var55 = p49.Adapter.createRecyclingScope({
		adapter = {
			create = function()
				-- upvalues: var54 (write)
				var54 += 1
				
				return var54
			end,
			destroy = function() end
		}
	})
	local var56 = p49.Adapter.createVirtualizer({
		overscan = 1,
		preserveScrollPositionOnChange = true,
		dataSource = var48,
		layout = var49,
		recyclingScope = var55,
		getItemViewType = function(p56)
			return p56.kind
		end,
		onUpdate = function(_, p56)
			-- upvalues: p49 (ref), var52 (write), var53 (write)
			for i, v in p56.effects do
				if v.type == p49.VirtualizerEffectType.ScrollCorrection then
					var52 += 1
					var53 += math.abs(v.delta)
				end
			end
		end
	})
	var56.dispatch({ type = p49.VirtualizerCommandType.Activate })
	var56.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p49.VirtualizerCommandType.SetViewportSize
	})
	var56.dispatch({
		offset = 400,
		type = p49.VirtualizerCommandType.SetScrollOffset
	})
	local var57 = 0
	local var58 = 0
	local var59 = p50.measure(function()
		-- upvalues: var57 (write), var58 (write), var56 (ref), var48 (ref), snapshotPlacementChecksum (copy)
		var57 += 1
		var58 = 0
		local firstIndex = var56.getSnapshot().visibleRange.firstIndex
		local item = var48.getItem(firstIndex)
		var48.transaction(function()
			-- upvalues: var48 (copy), firstIndex (ref), item (ref), var57 (copy)
			var48.setItem(firstIndex, { id = item.id, kind = item.kind })
			var48.prepend({ kind = "row", id = -var57 })
			var48.remove(var48.getItemCount())
		end)
		var58 += snapshotPlacementChecksum(var56.getSnapshot())
	end, p55)
	local var60 = 0
	
	for i, v in var56.query({ type = p49.VirtualizerQueryType.GetItemViews }) do
		local var61 = var56.query({
			type = p49.VirtualizerQueryType.GetPlacementIntent,
			itemView = v
		})
		local var62 = if var61 == nil then nil else var61.measurementIdentity
		
		if var62 ~= nil then
			var60 = math.max(var60, var62.itemRevision)
		end
	end
	local scrollOffset = var56.query({ type = p49.VirtualizerQueryType.GetScrollState }).scrollOffset
	var56.dispatch({ type = p49.VirtualizerCommandType.Destroy })
	var55.destroy()
	var49.destroy()
	assert(var50 > 0 and var51 == var50 * 3, "atomic mutation benchmark did not emit grouped changes")
	assert(var60 > 0 and var58 > 0, "atomic mutation benchmark did not expose revised placements")
	assert(var52 > 0, "atomic mutation benchmark did not preserve its anchor")
	
	return p51.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		description = "Applies one atomic update/prepend/remove batch while preserving the visible anchor and item revisions.",
		responsibility = p53,
		workload = p54,
		scale = { changesPerTransaction = 3, items = p52 },
		timing = {
			unit = "ms",
			basis = "atomicMutation",
			operationsPerSample = 1,
			includesSchedulerWaits = false
		},
		arms = { viewRecycler = var59 },
		evidence = {
			batches = var50,
			changes = var51,
			highestItemRevision = var60,
			scrollCorrections = var52,
			correctionMagnitude = var53,
			finalScrollOffset = scrollOffset,
			observablePlacementChecksum = var58
		}
	})
end

local function measureOverscanPrefetch(p57, p58, p59, p60, p61, p62)
	-- upvalues: createItems (ref), responsibilityCatalogModule (ref)
	local var63 = 0
	local var64 = 0
	local var65 = 0
	local var66 = p57.Layout.uniform({ itemLength = 40 })
	local var67 = p57.Adapter.createRecyclingScope({
		adapter = {
			create = function()
				return {}
			end,
			destroy = function() end
		}
	})
	local var68 = p57.Adapter.createVirtualizer({
		dataSource = p57.DataSource.snapshot(createItems(p60), function(p63)
			return tostring(p63.id)
		end),
		layout = var66,
		recyclingScope = var67,
		getItemViewType = function()
			return "row"
		end,
		overscanPolicy = {
			compute = function(p63)
				-- upvalues: var63 (write)
				var63 += 1
				
				return if p63.scrollDirection == "backward" then { before = 3, after = 1 } else { before = 1, after = 3 }
			end
		},
		dataPrefetch = { startItems = 2, endItems = 4 }
	})
	var68.dispatch({ type = p57.VirtualizerCommandType.Activate })
	var68.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p57.VirtualizerCommandType.SetViewportSize
	})
	local var69 = p58.measure(function()
		-- upvalues: p61 (ref), var68 (ref), p57 (ref), var64 (write), var65 (write)
		for i_1 = 1, p61 do
			for i, v in var68.dispatch({
				type = p57.VirtualizerCommandType.SetScrollOffset,
				offset = i_1 * 40 * 2
			}).effects do
				if v.type == p57.VirtualizerEffectType.DataPrefetchRequested then
					var64 += 1
					
					if v.request.isCurrent() then
						var65 += 1
					end
				end
			end
		end
		var68.dispatch({
			offset = 40,
			type = p57.VirtualizerCommandType.SetScrollOffset
		})
	end, p62)
	local visibleRange = var68.getSnapshot().visibleRange
	local mountedRange = var68.getSnapshot().mountedRange
	var68.dispatch({ type = p57.VirtualizerCommandType.Destroy })
	var67.destroy()
	var66.destroy()
	assert(var63 > 0 and var64 > 0, "overscan/prefetch benchmark did not exercise both policies")
	local t = {
		prefetchStartItems = 2,
		prefetchEndItems = 4,
		items = p60,
		scrollSteps = p61 + 1
	}
	local t_1 = {
		unit = "ms",
		basis = "overscanPrefetchTraversal",
		includesSchedulerWaits = false,
		operationsPerSample = p61 + 1
	}
	local t_2 = { viewRecycler = var69 }
	local t_3 = {
		policyCalls = var63,
		prefetchRequests = var64,
		currentRequestsObserved = var65,
		visibleItems = visibleRange.lastIndex - visibleRange.firstIndex + 1,
		mountedItems = mountedRange.lastIndex - mountedRange.firstIndex + 1
	}
	
	return {
		p59.create({
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
		p59.create({
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

local function measurePinnedSticky(p63, p64, p65, p66, p67, p68)
	-- upvalues: createItems (ref), snapshotPlacementChecksum (ref), buildPlacementPlanModule (ref), responsibilityCatalogModule (ref)
	local var70 = p63.Layout.uniform({ itemLength = 40 })
	local t = {
		isItemStickyHeader = function(p69)
			return p69.kind == "header"
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
	local var71 = p63.DataSource.snapshot(createItems(p66), function(p69)
		return tostring(p69.id)
	end)
	local var72 = p63.Adapter.createRecyclingScope({
		adapter = {
			create = function()
				return {}
			end,
			destroy = function() end
		}
	})
	local var73 = p63.Adapter.createVirtualizer({
		overscan = 0,
		dataSource = var71,
		layout = var70,
		recyclingScope = var72,
		getItemViewType = function(p69)
			return p69.kind
		end,
		isItemStickyHeader = t.isItemStickyHeader,
		pinnedStartItem = t.pinnedStartItem,
		pinnedEndItem = t.pinnedEndItem
	})
	var73.dispatch({ type = p63.VirtualizerCommandType.Activate })
	var73.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p63.VirtualizerCommandType.SetViewportSize
	})
	var73.dispatch({
		type = p63.VirtualizerCommandType.SetPolicy,
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
	local var74 = nil
	local var75 = nil
	
	for i, v in var73.query({ type = p63.VirtualizerQueryType.GetItemViews }) do
		local var76 = var73.query({
			type = p63.VirtualizerQueryType.GetPlacementIntent,
			itemView = v
		})
		local var77 = if var76 == nil then nil else var76.measurementIdentity
		
		if var77 ~= nil then
			if var77.itemKey == "$pinned-start" then
				var74 = var77
			elseif var77.itemKey == "$pinned-end" then
				var75 = var77
			end
		end
	end
	local viewportRelative
	assert(var74 ~= nil and var75 ~= nil, "pinned benchmark requires active pinned assignment identities")
	var73.dispatch({
		type = p63.VirtualizerCommandType.SubmitMeasurements,
		measurements = {
			{
				itemIndex = nil,
				itemKey = "$pinned-start",
				pinnedPosition = "start",
				length = 24,
				assignmentGeneration = var74.assignmentGeneration,
				itemRevision = var74.itemRevision
			},
			{
				itemIndex = nil,
				itemKey = "$pinned-end",
				pinnedPosition = "finish",
				length = 32,
				assignmentGeneration = var75.assignmentGeneration,
				itemRevision = var75.itemRevision
			}
		}
	})
	local var78 = 0
	local var79 = 0
	local var80 = nil
	local var81 = p64.measure(function()
		-- upvalues: var79 (write), p67 (ref), var73 (ref), p63 (ref), snapshotPlacementChecksum (copy), var80 (write), buildPlacementPlanModule (copy), var71 (ref), var70 (ref), t (ref), var78 (write)
		var79 = 0
		
		for i = 1, p67 do
			var79 += snapshotPlacementChecksum(var73.dispatch({
				type = p63.VirtualizerCommandType.SetScrollOffset,
				offset = (i + 20) * 40
			}).snapshot)
			var80 = buildPlacementPlanModule({
				viewportLength = 480,
				dataSource = var71,
				layout = var70,
				stickyIndices = { 20, 40 },
				scrollOffset = var73.query({ type = p63.VirtualizerQueryType.GetScrollState }).scrollOffset,
				contentStartOffset = var73.getSnapshot().contentStartOffset,
				pinnedStartItem = t.pinnedStartItem,
				pinnedEndItem = t.pinnedEndItem
			})
			var78 += var80.placements["$pinned-start"].mainAxisLength
			var78 += var80.placements["$pinned-end"].mainAxisLength
		end
	end, p68)
	local var82 = var80
	local _20 = var82.placements["20"]
	local _40 = var82.placements["40"]
	
	if _20 ~= nil then
		viewportRelative = _20.viewportRelative
		
		if not viewportRelative then
			viewportRelative = _40 ~= nil and _40.viewportRelative
		end
		local var83 = var82.placements["$pinned-start"]
		local var84 = var82.placements["$pinned-end"]
		local contentStartOffset = var73.getSnapshot().contentStartOffset
		var73.dispatch({ type = p63.VirtualizerCommandType.Destroy })
		var72.destroy()
		var70.destroy()
		assert(var78 > 0 and (var79 > 0 and viewportRelative), "pinned/sticky benchmark did not expose viewport placements")
		
		return p65.create({
			suite = "view-recycler-core",
			layer = "core",
			owner = "core",
			timingClass = "integrated",
			workload = "sticky-pinned-placement",
			description = "Plans sticky retention, synthetic pinned assignments, and pinned content insets.",
			responsibility = responsibilityCatalogModule.Core.PinnedSticky,
			scale = { pinnedItems = 2, items = p66, scrollSteps = p67 },
			timing = {
				unit = "ms",
				basis = "pinnedStickyTraversal",
				includesSchedulerWaits = false,
				operationsPerSample = p67
			},
			arms = { viewRecycler = var81 },
			evidence = {
				stickyViewportRelative = viewportRelative,
				pinnedStartOffset = var83.mainAxisOffset,
				pinnedEndOffset = var84.mainAxisOffset,
				contentStartOffset = contentStartOffset,
				observablePlacementChecksum = var79
			}
		})
	end
end

local function measureScrollPolicy(p69, p70, p71, p72, p73)
	-- upvalues: responsibilityCatalogModule (ref)
	local var82 = 0
	local var83 = 0
	local var84 = 0
	local var85 = 0
	
	local function runScrollPolicy()
		-- upvalues: p72 (ref), p69 (ref), var82 (write), var83 (write), var85 (write), var84 (write)
		for _ = 1, p72 do
			local var86 = 200
			local var87 = 170
			local var88 = true
			local var89 = p69.Adapter.ScrollPolicy.createCoordinator({
				getItemCount = function()
					return 20
				end,
				getScrollState = function()
					-- upvalues: var86 (write), var87 (write)
					local maxValue = math.max(0, var86 - 30 - var87)
					
					return {
						viewportLength = 30,
						scrollOffset = var87,
						contentLength = var86,
						distanceFromEnd = maxValue,
						atStart = var87 == 0,
						atEnd = maxValue <= 1
					}
				end,
				getScrollOffsetForItem = function(value)
					return value * 10
				end,
				applyScrollAnchorOffset = function(value)
					-- upvalues: var88 (write), var82 (copy), var83 (copy), var87 (write), var85 (copy)
					if var88 then
						var82 += 1
						var88 = false
					else
						var83 += 1
					end
					var87 = value
					var85 += value
					
					return value
				end,
				getViewportState = function()
					-- upvalues: var87 (write)
					return { viewportLength = 30, scrollOffset = var87 }
				end,
				getInitialScrollAlignment = function()
					-- upvalues: p69 (copy)
					return p69.ScrollAlignment.End
				end,
				getAutoScrollPolicy = function()
					-- upvalues: p69 (copy)
					return p69.AutoScrollPolicy.WhenAtEnd
				end,
				getStartReachedThreshold = function()
					return 0
				end,
				getOnStartReached = function()
					return nil
				end,
				getOnEndReached = function()
					-- upvalues: var84 (copy)
					return function()
						-- upvalues: var84 (copy)
						var84 += 1
					end
				end
			})
			var89.onViewportChanged()
			var89.onDataSourceChanged({
				previousItemCount = 20,
				itemCount = 21,
				changes = {
					{
						index = 21,
						type = p69.DataSourceChangeType.Insert,
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
			var89.onContentLengthChanged(220)
			var89.checkEdges()
		end
	end
	
	local var90 = p70.measure(runScrollPolicy, p73)
	var82 = 0
	var83 = 0
	var84 = 0
	var85 = 0
	runScrollPolicy()
	assert(var82 > 0 and (var83 > 0 and var84 > 0), "scroll policy benchmark missed a policy phase")
	
	return p71.create({
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
			policyCycles = p72
		},
		timing = {
			unit = "ms",
			basis = "scrollPolicyCycle",
			includesSchedulerWaits = false,
			operationsPerSample = p72
		},
		arms = { viewRecycler = var90 },
		evidence = {
			initialScrolls = var82,
			endFollowWrites = var83,
			paginationHits = var84,
			hostOffsetChecksum = var85
		}
	})
end

local function measureRecyclingScopeRetention(p74, p75, p76, p77, p78, p79)
	-- upvalues: responsibilityCatalogModule (ref)
	local var86 = 0
	local var87 = 0
	local var88 = 0
	local var89 = p74.Adapter.createRecyclingScope({
		maxPoolSize = 4,
		adapter = {
			create = function()
				-- upvalues: var86 (write)
				var86 += 1
				
				return { id = var86 }
			end,
			destroy = function()
				-- upvalues: var87 (write)
				var87 += 1
			end
		}
	})
	local t = {}
	local var90 = p75.measure(function()
		-- upvalues: p78 (ref), p77 (ref), var89 (ref), t (ref), var88 (write)
		for _ = 1, p78 do
			local list = table.create(p77)
			
			for i = 1, p77 do
				list[i] = { viewType = "row" }
			end
			local acquired = var89.exchange(t, {}, list).acquired
			var88 += #acquired
			var89.exchange(t, acquired, {})
		end
	end, p79)
	local count = #var89.getVacantRecords()
	var89.destroy()
	assert(count == 4 and (var87 > 0 and var88 > 0), "RecyclingScope retention benchmark did not apply retention pressure with Lease tokens")
	
	return p76.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "integrated",
		workload = "recycling-scope-retention-pressure",
		description = "Acquires and releases Lease batches above the RecyclingScope per-type vacancy limit.",
		responsibility = responsibilityCatalogModule.Core.RecyclingScope,
		scale = {
			maxVacanciesPerType = 4,
			itemsPerBatch = p77,
			batches = p78
		},
		timing = {
			unit = "ms",
			basis = "recyclingScopePressureBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p78
		},
		arms = { viewRecycler = var90 },
		evidence = {
			creations = var86,
			evictions = var87,
			retainedVacancies = count,
			leaseTokensObserved = var88
		}
	})
end

local function measureActiveToggle(p80, p81, p82, p83, p84, p85)
	-- upvalues: signalsModule (ref), createItems (ref), responsibilityCatalogModule (ref)
	local var91, var92 = signalsModule.createSignal(true)
	local var93 = 0
	local var94 = p80.Layout.uniform({ itemLength = 40 })
	local var95 = p80.Adapter.createRecyclingScope({
		adapter = {
			create = function()
				return {}
			end,
			destroy = function() end
		}
	})
	local var96 = p80.Adapter.createVirtualizer({
		dataSource = p80.DataSource.snapshot(createItems(p83), function(p86)
			return tostring(p86.id)
		end),
		layout = var94,
		recyclingScope = var95,
		getItemViewType = function()
			return "row"
		end,
		postCommitItemViewAssignment = function(_, p86)
			-- upvalues: var93 (write)
			if p86 == nil then
				var93 += 1
			end
		end,
		active = var91
	})
	var96.dispatch({ type = p80.VirtualizerCommandType.Activate })
	var96.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p80.VirtualizerCommandType.SetViewportSize
	})
	local var97 = p81.measure(function()
		-- upvalues: p84 (ref), var92 (ref)
		for _ = 1, p84 do
			var92(false)
			var92(true)
		end
	end, p85)
	var93 = 0
	
	for _ = 1, p84 do
		var92(false)
		var92(true)
	end
	local count = #var96.query({ type = p80.VirtualizerQueryType.GetItemViews })
	var96.dispatch({ type = p80.VirtualizerCommandType.Destroy })
	var95.destroy()
	var94.destroy()
	assert(var93 > 0 and count > 0, "active toggle benchmark did not release and reactivate")
	
	return p82.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "active-state-toggle",
		description = "Releases all assignments while inactive and synchronizes the latest desired window on reactivation.",
		responsibility = responsibilityCatalogModule.Core.ItemViewPresentation,
		scale = { items = p83, toggles = p84 },
		timing = {
			unit = "ms",
			basis = "deactivateReactivate",
			includesSchedulerWaits = false,
			operationsPerSample = p84
		},
		arms = { viewRecycler = var97 },
		evidence = {
			releasedAssignments = var93,
			mountedAfterReactivation = count
		}
	})
end

local function measureLifecycle(p86, p87, p88, p89, p90, p91, p92)
	-- upvalues: createItems (ref)
	local var98 = 0
	local var99 = 0
	local var100 = 0
	local var101 = 0
	
	local function runLifecycle()
		-- upvalues: p86 (ref), createItems (copy), p89 (ref), var101 (write), var98 (write), var100 (write), var99 (write)
		local var102 = p86.Layout.uniform({ itemLength = 40 })
		local var103 = p86.Adapter.createRecyclingScope({
			adapter = {
				create = function()
					return {}
				end,
				destroy = function() end
			}
		})
		local var104 = p86.Adapter.createVirtualizer({
			dataSource = p86.DataSource.snapshot(createItems(p89), function(p93)
				return tostring(p93.id)
			end),
			layout = var102,
			recyclingScope = var103,
			getItemViewType = function()
				return "row"
			end,
			postCommitItemViewAssignment = function(_, p93)
				-- upvalues: var101 (copy)
				if p93 == nil then
					var101 += 1
				end
			end
		})
		var104.dispatch({ type = p86.VirtualizerCommandType.Activate })
		var104.dispatch({
			scrollAxisLength = 480,
			crossAxisLength = 800,
			type = p86.VirtualizerCommandType.SetViewportSize
		})
		var98 += 1
		var100 += #var104.query({ type = p86.VirtualizerQueryType.GetItemViews })
		var104.dispatch({ type = p86.VirtualizerCommandType.Destroy })
		var103.destroy()
		var102.destroy()
		var99 += 1
	end
	
	local var102 = p87.measure(runLifecycle, p92)
	var98 = 0
	var99 = 0
	var100 = 0
	var101 = 0
	runLifecycle()
	assert(var98 > 0 and (var98 == var99 and var101 > 0), "lifecycle benchmark did not complete cleanup")
	
	return p88.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "phased",
		description = "Builds a populated Virtualizer lifecycle and synchronously releases all owned resources.",
		responsibility = p90,
		workload = p91,
		scale = { items = p89 },
		timing = {
			unit = "ms",
			basis = "virtualizerLifecycle",
			operationsPerSample = 1,
			includesSchedulerWaits = false
		},
		arms = { viewRecycler = var102 },
		evidence = {
			initialized = var98,
			destroyed = var99,
			mountedAssignments = var100,
			releasedAssignments = var101
		}
	})
end

return {
	run = function(p86, p87, p88, p89)
		-- upvalues: list (ref), measureTraversal (ref), responsibilityCatalogModule (ref), measureCrossAxisTraversal (ref), measureCoordinator (ref), measureWithinBand (ref), measureLifecycle (ref), measureAtomicMutation (ref), measureOverscanPrefetch (ref), measureProgrammaticScroll (ref), measureMeasurementAnchoring (ref), measurePinnedSticky (ref), measureScrollPolicy (ref), measureRecyclingScopeRetention (ref), measureActiveToggle (ref)
		p89 = p89 or {}
		local itemCounts = p89.itemCounts or list
		local scrollStepCount = p89.scrollStepCount or 100
		local coordinatorItemCount = p89.coordinatorItemCount or 40
		local coordinatorStepCount = p89.coordinatorStepCount or 100
		assert(scrollStepCount >= 1 and scrollStepCount % 1 == 0, "scrollStepCount must be a positive integer")
		assert(#itemCounts > 0, "itemCounts must not be empty")
		local t = {}
		
		for i, v in itemCounts do
			assert(v >= 1 and v % 1 == 0, "item counts must be positive integers")
			table.insert(t, measureTraversal(p86, p87, p88, v, scrollStepCount, false, false, "jump", "uniform-traversal", "Runs the complete Virtualizer scroll, range, placement, and recycling path for a uniform layout.", responsibilityCatalogModule.Core.LayoutGeometry, p89))
			table.insert(t, measureTraversal(p86, p87, p88, v, scrollStepCount, true, false, "jump", "measured-offset-traversal", "Runs measured-layout offset lookup and propagation without submitting new item sizes.", responsibilityCatalogModule.Core.LayoutGeometry, p89))
			table.insert(t, measureTraversal(p86, p87, p88, v, scrollStepCount, true, true, "jump", "measured-update-traversal", "Runs the complete measured Virtualizer path and submits mounted-item size batches at every step.", responsibilityCatalogModule.Core.Measurement, p89))
			table.insert(t, measureCrossAxisTraversal(p86, p87, p88, v, scrollStepCount, "grid", p89))
			table.insert(t, measureCrossAxisTraversal(p86, p87, p88, v, scrollStepCount, "masonry", p89))
		end
		local var98 = itemCounts[1]
		assert(var98 >= 40, "the smallest item count must cover sticky and mutation workloads")
		
		for i_1, v_1 in { "short", "jump" } do
			table.insert(t, measureTraversal(p86, p87, p88, var98, scrollStepCount, false, false, v_1, "recycling-assignment-churn", "Contrasts nearby scrolling with large jumps through the same uniform Virtualizer.", responsibilityCatalogModule.Core.ItemViewPresentation, p89))
		end
		for i_2, v_2 in { "retained", "churn" } do
			table.insert(t, measureCoordinator(p86, p87, p88, coordinatorItemCount, coordinatorStepCount, v_2, p89))
		end
		table.insert(t, measureWithinBand(p86, p87, p88, itemCounts[1], scrollStepCount, p89))
		table.insert(t, measureLifecycle(p86, p87, p88, var98, responsibilityCatalogModule.Core.Initialization, "virtualizer-initialization", p89))
		table.insert(t, measureAtomicMutation(p86, p87, p88, var98, responsibilityCatalogModule.Core.DataMutation, "atomic-data-mutation", p89))
		table.insert(t, measureAtomicMutation(p86, p87, p88, var98, responsibilityCatalogModule.Core.DataAnchoring, "atomic-anchor-preservation", p89))
		
		for i_3, v_3 in measureOverscanPrefetch(p86, p87, p88, var98, scrollStepCount, p89) do
			table.insert(t, v_3)
		end
		table.insert(t, measureProgrammaticScroll(p86, p87, p88, var98, scrollStepCount, p89))
		table.insert(t, measureMeasurementAnchoring(p86, p87, p88, var98, scrollStepCount, p89))
		table.insert(t, measurePinnedSticky(p86, p87, p88, var98, scrollStepCount, p89))
		table.insert(t, measureScrollPolicy(p86, p87, p88, scrollStepCount, p89))
		table.insert(t, measureRecyclingScopeRetention(p86, p87, p88, coordinatorItemCount, coordinatorStepCount, p89))
		table.insert(t, measureActiveToggle(p86, p87, p88, var98, scrollStepCount, p89))
		table.insert(t, measureLifecycle(p86, p87, p88, var98, responsibilityCatalogModule.Core.Teardown, "virtualizer-teardown", p89))
		
		return t
	end
}