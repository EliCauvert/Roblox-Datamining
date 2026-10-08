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

local function _(p5)
	return p5.version + #p5.entries
end

local _ = function()
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
	local var11 = 0
	
	local function runTraversal(p17)
		-- upvalues: var4 (ref), var10 (write), var9 (write), var11 (write), var8 (write), var7 (write), var6 (ref), var2 (ref), p5 (ref), snapshotPlacementChecksum (copy), p11 (ref)
		var4.synchronizations = 0
		var4.reassignedAssignments = 0
		var4.acquiredAssignments = 0
		var4.releasedAssignments = 0
		var4.acceptedMeasurements = 0
		var10 = 0
		var9 = 0
		var11 = 0
		var8 = 0
		var7 = (var7 + 1) % 5
		
		for i, v in var6 do
			local var12 = var2.dispatch({
				type = p5.VirtualizerCommandType.SetScrollOffset,
				offset = v
			})
			local snapshot = var12.snapshot
			var11 += snapshot.version + #snapshot.entries
			
			if p17 then
				var9 += snapshotPlacementChecksum(var12.snapshot)
			end
			if p11 then
				local t = {}
				
				for i_1, v_1 in var2.query({ type = p5.VirtualizerQueryType.GetItemViews }) do
					local var13 = var2.query({
						type = p5.VirtualizerQueryType.GetPlacementIntent,
						itemView = v_1
					})
					local var14 = if var13 == nil then nil else var13.measurementIdentity
					
					if var14 ~= nil then
						table.insert(t, {
							itemIndex = var14.itemIndex,
							itemKey = var14.itemKey,
							assignmentGeneration = var14.assignmentGeneration,
							itemRevision = var14.itemRevision,
							length = 36 + (var14.itemIndex + var7) % 5 * 2
						})
					end
				end
				var10 += #t
				local var15 = var2.dispatch({
					type = p5.VirtualizerCommandType.SubmitMeasurements,
					measurements = t
				})
				i_1 = var15.snapshot
				var11 += i_1.version + #i_1.entries
				
				if p17 then
					var9 += snapshotPlacementChecksum(var15.snapshot)
				end
				var8 += #t
			end
		end
		local visibleRange = var2.getSnapshot().visibleRange
		var8 += visibleRange.firstIndex + visibleRange.lastIndex
	end
	
	local var16 = p6.measure(function()
		-- upvalues: runTraversal (ref)
		runTraversal(false)
	end, p16)
	runTraversal(true)
	local count = #var2.query({ type = p5.VirtualizerQueryType.GetItemViews })
	local var17 = p9 * (if p11 then 2 else 1)
	var2.dispatch({ type = p5.VirtualizerCommandType.Destroy })
	var5.destroy()
	var3.destroy()
	assert(var8 > 0 and (var11 > 0 and var9 > 0), `{p13} benchmark did not expose mounted placements`)
	assert(var4.synchronizations <= var17, `{p13} synchronized more than once per accepted scroll or measurement mutation`)
	
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
		arms = { viewRecycler = var16 },
		evidence = {
			mountedItemViews = count,
			synchronizations = var4.synchronizations,
			settlementSynchronizationBudget = var17,
			reassignedAssignments = var4.reassignedAssignments,
			acquiredAssignments = var4.acquiredAssignments,
			releasedAssignments = var4.releasedAssignments,
			submittedMeasurements = var10,
			acceptedMeasurements = var4.acceptedMeasurements,
			observablePlacementChecksum = var9
		}
	})
end

local function measureCoordinator(p18, p19, p20, p21, p22, p23, p24)
	-- upvalues: responsibilityCatalogModule (ref)
	local function createFixture(p25)
		-- upvalues: p18 (ref), p21 (ref), p23 (ref), p22 (ref)
		local var18 = 0
		local var19 = 0
		local var20 = 0
		local var21 = p18.Adapter.createRecyclingScope({
			adapter = {
				create = function()
					-- upvalues: var18 (write)
					var18 += 1
					
					return var18
				end,
				destroy = function() end
			},
			onPoolChanged = if p25 then function()
				-- upvalues: var19 (write)
				var19 += 1
			end else nil
		})
		local list = table.create(p21)
		local list_1 = table.create(p21)
		
		for i = 1, p21 do
			list[i] = { key = `a{i}`, index = i, value = i }
			list_1[i] = if p23 == "retained" then list[i] else { key = `b{i}`, index = i, value = i }
		end
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		local function synchronize(p26)
			-- upvalues: t_1 (write), var21 (ref), t_2 (ref), var20 (write), t (write)
			local t_3 = {}
			local t_4 = {}
			local t_5 = {}
			local t_6 = {}
			
			for i, v in p26 do
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
					table.insert(t_3, { view = v_1.view, leaseToken = v_1.leaseToken })
				end
			end
			local var22 = var21.exchange(t_2, t_3, t_4)
			var20 += #var22.acquired
			
			for i_2, v_2 in var22.acquired do
				t_6[t_5[i_2].key] = v_2
			end
			t_1 = t_6
			t = table.create(#p26)
			
			for i_3, v_3 in p26 do
				t[i_3] = t_1[v_3.key]
			end
		end
		
		synchronize(list)
		local var23 = false
		
		return {
			run = function()
				-- upvalues: p22 (copy), var23 (write), synchronize (ref), list_1 (ref), list (ref)
				for _ = 1, p22 do
					var23 = not var23
					synchronize(if var23 then list_1 else list)
				end
			end,
			getDiagnosticEvents = function()
				-- upvalues: var19 (write)
				return var19
			end,
			getLeaseTokensObserved = function()
				-- upvalues: var20 (write)
				return var20
			end,
			getScopeInventory = var21.getScopeInventory,
			destroy = function()
				-- upvalues: var21 (ref), t_2 (ref), t (write), t_1 (write)
				var21.exchange(t_2, t, {})
				t = {}
				t_1 = {}
				var21.destroy()
			end
		}
	end
	
	local var24 = createFixture(false)
	local var25 = createFixture(true)
	local var26 = p19.measure(var24.run, p24)
	local var27 = p19.measure(var25.run, p24)
	local count = #var24.getScopeInventory()
	local diagnosticEvents = var25.getDiagnosticEvents()
	local leaseTokensObserved = var24.getLeaseTokensObserved()
	var24.destroy()
	var25.destroy()
	
	return p20.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "integrated",
		workload = "recycling-scope-sync",
		description = "Synchronizes a Recycling scope with retained or fully replaced desired keys.",
		responsibility = responsibilityCatalogModule.Core.Diagnostics,
		scale = { items = p21, synchronizations = p22, pattern = p23 },
		timing = {
			unit = "ms",
			basis = "coordinatorSynchronizationBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p22
		},
		arms = { diagnosticsDisabled = var26, diagnosticsEnabled = var27 },
		evidence = {
			resources = count,
			diagnosticEvents = diagnosticEvents,
			leaseTokensObserved = leaseTokensObserved
		}
	})
end

local function measureWithinBand(p27, p28, p29, p30, p31, p32)
	-- upvalues: createVirtualizer (ref), snapshotPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local function createArm(p33)
		-- upvalues: createVirtualizer (copy), p27 (ref), p30 (ref), p31 (ref), snapshotPlacementChecksum (copy)
		local var28, var29, var30, var31 = createVirtualizer(p27, p30, p33)
		local var32 = 1
		local var33 = 0
		local var34 = 0
		
		return {
			run = function(p34)
				-- upvalues: var30 (ref), var33 (write), var34 (write), p31 (copy), var28 (ref), p27 (copy), var32 (write), snapshotPlacementChecksum (copy)
				var30.synchronizations = 0
				var30.reassignedAssignments = 0
				var30.acquiredAssignments = 0
				var30.releasedAssignments = 0
				var30.acceptedMeasurements = 0
				var33 = 0
				var34 = 0
				
				for i = 1, p31 do
					local var35 = var28.dispatch({
						type = p27.VirtualizerCommandType.SetScrollOffset,
						offset = if var32 == 1 then i else p31 - i
					})
					local snapshot = var35.snapshot
					var34 += snapshot.version + #snapshot.entries
					
					if p34 then
						var33 += snapshotPlacementChecksum(var35.snapshot)
					end
				end
				var32 = -var32
			end,
			counters = var30,
			getObservablePlacementChecksum = function()
				-- upvalues: var33 (write)
				return var33
			end,
			getCommittedSnapshotTouch = function()
				-- upvalues: var34 (write)
				return var34
			end,
			prepareCanonicalEvidence = function()
				-- upvalues: var32 (write)
				var32 = 1
			end,
			destroy = function()
				-- upvalues: var28 (ref), p27 (copy), var31 (ref), var29 (ref)
				var28.dispatch({ type = p27.VirtualizerCommandType.Destroy })
				var31.destroy()
				var29.destroy()
			end
		}
	end
	
	local var35 = createArm(false)
	local var36 = createArm(true)
	local var37 = p28.measure(function()
		-- upvalues: var35 (ref)
		var35.run(false)
	end, p32)
	local var38 = p28.measure(function()
		-- upvalues: var36 (ref)
		var36.run(false)
	end, p32)
	var35.prepareCanonicalEvidence()
	var36.prepareCanonicalEvidence()
	var35.run(true)
	var36.run(true)
	local t = {
		uniformSynchronizations = var35.counters.synchronizations,
		measuredSynchronizations = var36.counters.synchronizations,
		uniformObservablePlacementChecksum = var35.getObservablePlacementChecksum(),
		measuredObservablePlacementChecksum = var36.getObservablePlacementChecksum()
	}
	assert(var35.getCommittedSnapshotTouch() > 0 and (var36.getCommittedSnapshotTouch() > 0 and (t.uniformObservablePlacementChecksum > 0 and t.measuredObservablePlacementChecksum > 0)), "within-Band benchmark did not consume committed mounted placements")
	var35.destroy()
	var36.destroy()
	
	return p29.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "within-band-scrolling",
		description = "Scrolls by sub-item increments inside one render-window band without sticky or pinned items.",
		responsibility = responsibilityCatalogModule.Core.ViewportRange,
		scale = { stickyOrPinned = false, items = p30, scrollSteps = p31 },
		timing = {
			unit = "ms",
			basis = "withinBandScrollBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p31
		},
		arms = { uniform = var37, measured = var38 },
		evidence = t
	})
end

local function measureProgrammaticScroll(p33, p34, p35, p36, p37, p38)
	-- upvalues: createVirtualizer (ref), snapshotPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local var28, var29, _, var30 = createVirtualizer(p33, p36, false)
	local var31 = 0
	local var32 = 0
	local var33 = 0
	local var34 = 0
	
	local function runProgrammaticScroll(p39)
		-- upvalues: var31 (write), var32 (write), var33 (write), var34 (write), p37 (ref), p36 (ref), var28 (ref), p33 (ref), snapshotPlacementChecksum (copy)
		var31 = 0
		var32 = 0
		var33 = 0
		var34 = 0
		
		for i = 1, p37 do
			local var35 = var28.dispatch({
				type = p33.VirtualizerCommandType.ScrollToOffset,
				offset = var28.query({
					type = p33.VirtualizerQueryType.GetScrollOffsetForItem,
					index = i * 17 % p36 + 1,
					alignment = p33.ScrollAlignment.Center
				})
			})
			local snapshot = var35.snapshot
			var34 += snapshot.version + #snapshot.entries
			
			if p39 then
				var33 += snapshotPlacementChecksum(var35.snapshot)
			end
			local var36 = var28.query({
				type = p33.VirtualizerQueryType.CaptureScrollAnchorSnapshot
			})
			var31 += 1
			local var37 = var28.dispatch({ delta = 40, type = p33.VirtualizerCommandType.ScrollBy })
			local snapshot_1 = var37.snapshot
			var34 += snapshot_1.version + #snapshot_1.entries
			
			if p39 then
				var33 += snapshotPlacementChecksum(var37.snapshot)
			end
			local var38 = var28.dispatch({
				type = p33.VirtualizerCommandType.RestoreScrollAnchorSnapshot,
				snapshot = var36
			})
			local snapshot_2 = var38.snapshot
			var34 += snapshot_2.version + #snapshot_2.entries
			
			if p39 then
				var33 += snapshotPlacementChecksum(var38.snapshot)
			end
			var32 += var38.result
		end
	end
	
	local var39 = p34.measure(function()
		-- upvalues: runProgrammaticScroll (ref)
		runProgrammaticScroll(false)
	end, p38)
	runProgrammaticScroll(true)
	local var40 = var28.query({ type = p33.VirtualizerQueryType.GetScrollState })
	var28.dispatch({ type = p33.VirtualizerCommandType.Destroy })
	var30.destroy()
	var29.destroy()
	assert(var31 == p37 and (var32 > 0 and (var34 > 0 and var33 > 0)), "programmatic scroll benchmark did not restore snapshots")
	
	return p35.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "programmatic-scroll-snapshot",
		description = "Resolves item targets, scrolls by offset and delta, and captures and restores stable-key snapshots.",
		responsibility = responsibilityCatalogModule.Core.ProgrammaticScroll,
		scale = { items = p36, scrollCycles = p37 },
		timing = {
			unit = "ms",
			basis = "programmaticScrollAnchorSnapshotCycle",
			includesSchedulerWaits = false,
			operationsPerSample = p37
		},
		arms = { viewRecycler = var39 },
		evidence = {
			snapshotsCaptured = var31,
			restoredOffsetChecksum = var32,
			finalScrollOffset = var40.scrollOffset,
			observablePlacementChecksum = var33
		}
	})
end

local function measureMeasurementAnchoring(p39, p40, p41, p42, p43, p44)
	-- upvalues: createVirtualizer (ref), snapshotPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local scrollOffset
	local var35, var36, _, var37 = createVirtualizer(p39, p42, true)
	var35.dispatch({
		offset = 400,
		type = p39.VirtualizerCommandType.SetScrollOffset
	})
	local visibleRange = var35.getSnapshot().visibleRange
	local var38 = nil
	
	for i, v in var35.query({ type = p39.VirtualizerQueryType.GetItemViews }) do
		local var39 = var35.query({
			type = p39.VirtualizerQueryType.GetPlacementIntent,
			itemView = v
		})
		scrollOffset = if var39 == nil then nil else var39.measurementIdentity
		
		if scrollOffset ~= nil and scrollOffset.itemIndex < visibleRange.firstIndex then
			var38 = scrollOffset
			break
		end
	end
	assert(var38 ~= nil, "measurement anchoring benchmark requires an overscanned item above the visible anchor")
	local var40 = 0
	local var41 = 0
	local var42 = 0
	
	local function runMeasurementAnchoring()
		-- upvalues: var40 (write), var41 (write), var42 (write), p43 (ref), var35 (ref), p39 (ref), var38 (write)
		var40 = 0
		var41 = 0
		var42 = 0
		
		for i_1 = 1, p43 do
			local var43 = var35.dispatch({
				type = p39.VirtualizerCommandType.SubmitMeasurements,
				measurements = {
					{
						itemIndex = var38.itemIndex,
						itemKey = var38.itemKey,
						assignmentGeneration = var38.assignmentGeneration,
						itemRevision = var38.itemRevision,
						length = if i_1 % 2 == 0 then 40 else 80
					}
				}
			})
			
			for i, v in var43.effects do
				if v.type == p39.VirtualizerEffectType.ScrollCorrection then
					var40 += 1
					var41 += math.abs(v.delta)
				end
			end
			local snapshot = var43.snapshot
			var42 += snapshot.version + #snapshot.entries
		end
	end
	
	local cloned = table.clone(p44)
	cloned.iterationsPerSample = 1
	local var44 = p40.measure(runMeasurementAnchoring, cloned)
	var35.dispatch({
		type = p39.VirtualizerCommandType.SubmitMeasurements,
		measurements = {
			{
				length = 40,
				itemIndex = var38.itemIndex,
				itemKey = var38.itemKey,
				assignmentGeneration = var38.assignmentGeneration,
				itemRevision = var38.itemRevision
			}
		}
	})
	var35.dispatch({
		offset = 400,
		type = p39.VirtualizerCommandType.SetScrollOffset
	})
	runMeasurementAnchoring()
	var42 = snapshotPlacementChecksum(var35.getSnapshot())
	scrollOffset = var35.query({ type = p39.VirtualizerQueryType.GetScrollState }).scrollOffset
	var35.dispatch({ type = p39.VirtualizerCommandType.Destroy })
	var37.destroy()
	var36.destroy()
	assert(var40 > 0 and (var41 > 0 and var42 > 0), "measurement anchoring benchmark did not expose corrected mounted placements")
	
	return p41.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "measurement-anchor-preservation",
		description = "Changes a measured overscan item above the visible anchor and preserves the visible position.",
		responsibility = responsibilityCatalogModule.Core.MeasurementAnchoring,
		scale = { items = p42, measurementUpdates = p43 },
		timing = {
			unit = "ms",
			basis = "measurementAnchorUpdateBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p43
		},
		arms = { viewRecycler = var44 },
		evidence = {
			scrollCorrections = var40,
			correctionMagnitude = var41,
			finalScrollOffset = scrollOffset,
			observablePlacementChecksum = var42,
			measuredItemIndex = var38.itemIndex,
			visibleAnchorIndex = visibleRange.firstIndex
		}
	})
end

local function measureCrossAxisTraversal(vectorA, vectorB, p45, p46, p47, p48, p49)
	-- upvalues: createItems (ref), snapshotPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local list = table.create(p46)
	
	for i = 1, p46 do
		list[i] = i % 5 * 8 + 32
	end
	local var45 = if p48 == "grid" then vectorA.Layout.grid({ itemLength = 40, crossAxisCount = 3 }) else vectorA.Layout.masonry({
		crossAxisCount = 3,
		spacing = 4,
		getItemLength = function(p50)
			-- upvalues: list (ref)
			return list[p50]
		end
	})
	local var46 = vectorA.Adapter.createRecyclingScope({
		adapter = {
			create = function()
				return {}
			end,
			destroy = function() end
		}
	})
	local var47 = vectorA.Adapter.createVirtualizer({
		overscan = 1,
		dataSource = vectorA.DataSource.snapshot(createItems(p46), function(p50)
			return tostring(p50.id)
		end),
		layout = var45,
		recyclingScope = var46,
		getItemViewType = function()
			return "row"
		end
	})
	var47.dispatch({ type = vectorA.VirtualizerCommandType.Activate })
	var47.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = vectorA.VirtualizerCommandType.SetViewportSize
	})
	local var48 = 0
	local var49 = 0
	local var50 = 0
	
	local function runCrossAxisTraversal(vectorA_1)
		-- upvalues: var49 (write), var50 (write), var48 (write), p47 (ref), var47 (ref), vectorA (ref), snapshotPlacementChecksum (copy)
		var49 = 0
		var50 = 0
		var48 = 0
		
		for i = 1, p47 do
			local var51 = var47.dispatch({
				type = vectorA.VirtualizerCommandType.SetScrollOffset,
				offset = i * 40
			})
			local snapshot = var51.snapshot
			var50 += snapshot.version + #snapshot.entries
			
			if vectorA_1 then
				var49 += snapshotPlacementChecksum(var51.snapshot)
			end
			local visibleRange = var51.snapshot.visibleRange
			var48 += visibleRange.firstIndex + visibleRange.lastIndex
			var48 += var47.query({
				type = vectorA.VirtualizerQueryType.GetItemLayout,
				index = visibleRange.firstIndex
			}).crossAxisCount
		end
	end
	
	local var52 = vectorB.measure(function()
		-- upvalues: runCrossAxisTraversal (ref)
		runCrossAxisTraversal(false)
	end, p49)
	runCrossAxisTraversal(true)
	local visibleRange = var47.getSnapshot().visibleRange
	local crossAxisCount = var47.query({
		type = vectorA.VirtualizerQueryType.GetItemLayout,
		index = visibleRange.firstIndex
	}).crossAxisCount
	var47.dispatch({ type = vectorA.VirtualizerCommandType.Destroy })
	var46.destroy()
	var45.destroy()
	assert(var48 > 0 and (var50 > 0 and var49 > 0), `{p48} traversal benchmark did not expose mounted placements`)
	
	return p45.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		responsibility = responsibilityCatalogModule.Core.LayoutGeometry,
		workload = `{p48}-traversal`,
		description = `Traverses representative {p48} geometry through the complete Virtualizer path.`,
		scale = { items = p46, scrollSteps = p47, layout = p48 },
		timing = {
			unit = "ms",
			basis = "scrollTraversal",
			includesSchedulerWaits = false,
			operationsPerSample = p47
		},
		arms = { viewRecycler = var52 },
		evidence = {
			queries = p47,
			crossAxisCount = crossAxisCount,
			finalVisibleFirst = visibleRange.firstIndex,
			finalVisibleLast = visibleRange.lastIndex,
			observablePlacementChecksum = var49
		}
	})
end

local function measureAtomicMutation(p50, p51, p52, p53, p54, p55, p56)
	-- upvalues: createItems (ref), snapshotPlacementChecksum (ref)
	local var51 = p50.DataSource.sequence(createItems(p53), function(p57)
		return tostring(p57.id)
	end)
	local var52 = p50.Layout.uniform({ itemLength = 40 })
	local var53 = 0
	local var54 = 0
	local var55 = 0
	local var56 = 0
	local var57 = 0
	var51.subscribe(function(p57)
		-- upvalues: var53 (write), var54 (write)
		var53 += 1
		var54 += #p57.changes
	end)
	local var58 = p50.Adapter.createRecyclingScope({
		adapter = {
			create = function()
				-- upvalues: var57 (write)
				var57 += 1
				
				return var57
			end,
			destroy = function() end
		}
	})
	local var59 = p50.Adapter.createVirtualizer({
		overscan = 1,
		preserveScrollPositionOnChange = true,
		dataSource = var51,
		layout = var52,
		recyclingScope = var58,
		getItemViewType = function(p57)
			return p57.kind
		end,
		onUpdate = function(_, p57)
			-- upvalues: p50 (ref), var55 (write), var56 (write)
			for i, v in p57.effects do
				if v.type == p50.VirtualizerEffectType.ScrollCorrection then
					var55 += 1
					var56 += math.abs(v.delta)
				end
			end
		end
	})
	var59.dispatch({ type = p50.VirtualizerCommandType.Activate })
	var59.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p50.VirtualizerCommandType.SetViewportSize
	})
	var59.dispatch({
		offset = 400,
		type = p50.VirtualizerCommandType.SetScrollOffset
	})
	local var60 = 0
	local _ = 0
	local var61 = 0
	local var62 = p51.measure(function()
		-- upvalues: var60 (write), var61 (write), var59 (ref), var51 (ref)
		var60 += 1
		var61 = 0
		local firstIndex = var59.getSnapshot().visibleRange.firstIndex
		local item = var51.getItem(firstIndex)
		var51.transaction(function()
			-- upvalues: var51 (copy), firstIndex (ref), item (ref), var60 (copy)
			var51.setItem(firstIndex, { id = item.id, kind = item.kind })
			var51.prepend({ kind = "row", id = -var60 })
			var51.remove(var51.getItemCount())
		end)
		local snapshot = var59.getSnapshot()
		var61 += snapshot.version + #snapshot.entries
	end, p56)
	local var63 = snapshotPlacementChecksum(var59.getSnapshot())
	local var64 = 0
	
	for i, v in var59.query({ type = p50.VirtualizerQueryType.GetItemViews }) do
		local var65 = var59.query({
			type = p50.VirtualizerQueryType.GetPlacementIntent,
			itemView = v
		})
		local var66 = if var65 == nil then nil else var65.measurementIdentity
		
		if var66 ~= nil then
			var64 = math.max(var64, var66.itemRevision)
		end
	end
	local scrollOffset = var59.query({ type = p50.VirtualizerQueryType.GetScrollState }).scrollOffset
	var59.dispatch({ type = p50.VirtualizerCommandType.Destroy })
	var58.destroy()
	var52.destroy()
	assert(var53 > 0 and var54 == var53 * 3, "atomic mutation benchmark did not emit grouped changes")
	assert(var64 > 0 and (var61 > 0 and var63 > 0), "atomic mutation benchmark did not expose revised placements")
	assert(var55 > 0, "atomic mutation benchmark did not preserve its anchor")
	
	return p52.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		description = "Applies one atomic update/prepend/remove batch while preserving the visible anchor and item revisions.",
		responsibility = p54,
		workload = p55,
		scale = { changesPerTransaction = 3, items = p53 },
		timing = {
			unit = "ms",
			basis = "atomicMutation",
			operationsPerSample = 1,
			includesSchedulerWaits = false
		},
		arms = { viewRecycler = var62 },
		evidence = {
			batches = var53,
			changes = var54,
			highestItemRevision = var64,
			scrollCorrections = var55,
			correctionMagnitude = var56,
			finalScrollOffset = scrollOffset,
			observablePlacementChecksum = var63
		}
	})
end

local function measureOverscanPrefetch(p58, p59, p60, p61, p62, p63)
	-- upvalues: createItems (ref), responsibilityCatalogModule (ref)
	local var67 = 0
	local var68 = 0
	local var69 = 0
	local var70 = p58.Layout.uniform({ itemLength = 40 })
	local var71 = p58.Adapter.createRecyclingScope({
		adapter = {
			create = function()
				return {}
			end,
			destroy = function() end
		}
	})
	local var72 = p58.Adapter.createVirtualizer({
		dataSource = p58.DataSource.snapshot(createItems(p61), function(p64)
			return tostring(p64.id)
		end),
		layout = var70,
		recyclingScope = var71,
		getItemViewType = function()
			return "row"
		end,
		overscanPolicy = {
			compute = function(p64)
				-- upvalues: var67 (write)
				var67 += 1
				
				return if p64.scrollDirection == "backward" then { before = 3, after = 1 } else { before = 1, after = 3 }
			end
		},
		dataPrefetch = { startItems = 2, endItems = 4 }
	})
	var72.dispatch({ type = p58.VirtualizerCommandType.Activate })
	var72.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p58.VirtualizerCommandType.SetViewportSize
	})
	local var73 = p59.measure(function()
		-- upvalues: p62 (ref), var72 (ref), p58 (ref), var68 (write), var69 (write)
		for i_1 = 1, p62 do
			for i, v in var72.dispatch({
				type = p58.VirtualizerCommandType.SetScrollOffset,
				offset = i_1 * 40 * 2
			}).effects do
				if v.type == p58.VirtualizerEffectType.DataPrefetchRequested then
					var68 += 1
					
					if v.request.isCurrent() then
						var69 += 1
					end
				end
			end
		end
		var72.dispatch({
			offset = 40,
			type = p58.VirtualizerCommandType.SetScrollOffset
		})
	end, p63)
	local visibleRange = var72.getSnapshot().visibleRange
	local mountedRange = var72.getSnapshot().mountedRange
	var72.dispatch({ type = p58.VirtualizerCommandType.Destroy })
	var71.destroy()
	var70.destroy()
	assert(var67 > 0 and var68 > 0, "overscan/prefetch benchmark did not exercise both policies")
	local t = {
		prefetchStartItems = 2,
		prefetchEndItems = 4,
		items = p61,
		scrollSteps = p62 + 1
	}
	local t_1 = {
		unit = "ms",
		basis = "overscanPrefetchTraversal",
		includesSchedulerWaits = false,
		operationsPerSample = p62 + 1
	}
	local t_2 = { viewRecycler = var73 }
	local t_3 = {
		policyCalls = var67,
		prefetchRequests = var68,
		currentRequestsObserved = var69,
		visibleItems = visibleRange.lastIndex - visibleRange.firstIndex + 1,
		mountedItems = mountedRange.lastIndex - mountedRange.firstIndex + 1
	}
	
	return {
		p60.create({
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
		p60.create({
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

local function measurePinnedSticky(p64, p65, p66, p67, p68, p69)
	-- upvalues: createItems (ref), buildPlacementPlanModule (ref), snapshotPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local var74 = p64.Layout.uniform({ itemLength = 40 })
	local t = {
		isItemStickyHeader = function(p70)
			return p70.kind == "header"
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
	local var75 = p64.DataSource.snapshot(createItems(p67), function(p70)
		return tostring(p70.id)
	end)
	local var76 = p64.Adapter.createRecyclingScope({
		adapter = {
			create = function()
				return {}
			end,
			destroy = function() end
		}
	})
	local var77 = p64.Adapter.createVirtualizer({
		overscan = 0,
		dataSource = var75,
		layout = var74,
		recyclingScope = var76,
		getItemViewType = function(p70)
			return p70.kind
		end,
		isItemStickyHeader = t.isItemStickyHeader,
		pinnedStartItem = t.pinnedStartItem,
		pinnedEndItem = t.pinnedEndItem
	})
	var77.dispatch({ type = p64.VirtualizerCommandType.Activate })
	var77.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p64.VirtualizerCommandType.SetViewportSize
	})
	var77.dispatch({
		type = p64.VirtualizerCommandType.SetPolicy,
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
	local var78 = nil
	local var79 = nil
	
	for i, v in var77.query({ type = p64.VirtualizerQueryType.GetItemViews }) do
		local var80 = var77.query({
			type = p64.VirtualizerQueryType.GetPlacementIntent,
			itemView = v
		})
		local var81 = if var80 == nil then nil else var80.measurementIdentity
		
		if var81 ~= nil then
			if var81.itemKey == "$pinned-start" then
				var78 = var81
			elseif var81.itemKey == "$pinned-end" then
				var79 = var81
			end
		end
	end
	local viewportRelative
	assert(var78 ~= nil and var79 ~= nil, "pinned benchmark requires active pinned assignment identities")
	var77.dispatch({
		type = p64.VirtualizerCommandType.SubmitMeasurements,
		measurements = {
			{
				itemIndex = nil,
				itemKey = "$pinned-start",
				pinnedPosition = "start",
				length = 24,
				assignmentGeneration = var78.assignmentGeneration,
				itemRevision = var78.itemRevision
			},
			{
				itemIndex = nil,
				itemKey = "$pinned-end",
				pinnedPosition = "finish",
				length = 32,
				assignmentGeneration = var79.assignmentGeneration,
				itemRevision = var79.itemRevision
			}
		}
	})
	local var82 = 0
	local _ = 0
	local var83 = 0
	local var84 = nil
	local var85 = nil
	local var86 = p65.measure(function()
		-- upvalues: var83 (write), p68 (ref), var77 (ref), p64 (ref), var85 (write), var84 (write), buildPlacementPlanModule (copy), var75 (ref), var74 (ref), t (ref), var82 (write)
		var83 = 0
		
		for i = 1, p68 do
			local var87 = var77.dispatch({
				type = p64.VirtualizerCommandType.SetScrollOffset,
				offset = (i + 20) * 40
			})
			var85 = var87.snapshot
			local snapshot = var87.snapshot
			var83 += snapshot.version + #snapshot.entries
			var84 = buildPlacementPlanModule({
				viewportLength = 480,
				dataSource = var75,
				layout = var74,
				stickyIndices = { 20, 40 },
				scrollOffset = var77.query({ type = p64.VirtualizerQueryType.GetScrollState }).scrollOffset,
				contentStartOffset = var77.getSnapshot().contentStartOffset,
				pinnedStartItem = t.pinnedStartItem,
				pinnedEndItem = t.pinnedEndItem
			})
			var82 += var84.placements["$pinned-start"].mainAxisLength
			var82 += var84.placements["$pinned-end"].mainAxisLength
		end
	end, p69)
	assert(var85 ~= nil, "pinned/sticky benchmark did not retain a committed snapshot")
	local var88 = snapshotPlacementChecksum(var85)
	local var89 = var84
	local _20 = var89.placements["20"]
	local _40 = var89.placements["40"]
	
	if _20 ~= nil then
		viewportRelative = _20.viewportRelative
		
		if not viewportRelative then
			viewportRelative = _40 ~= nil and _40.viewportRelative
		end
		local var90 = var89.placements["$pinned-start"]
		local var91 = var89.placements["$pinned-end"]
		local contentStartOffset = var77.getSnapshot().contentStartOffset
		var77.dispatch({ type = p64.VirtualizerCommandType.Destroy })
		var76.destroy()
		var74.destroy()
		assert(var82 > 0 and (var83 > 0 and (var88 > 0 and viewportRelative)), "pinned/sticky benchmark did not expose viewport placements")
		
		return p66.create({
			suite = "view-recycler-core",
			layer = "core",
			owner = "core",
			timingClass = "integrated",
			workload = "sticky-pinned-placement",
			description = "Plans sticky retention, synthetic pinned assignments, and pinned content insets.",
			responsibility = responsibilityCatalogModule.Core.PinnedSticky,
			scale = { pinnedItems = 2, items = p67, scrollSteps = p68 },
			timing = {
				unit = "ms",
				basis = "pinnedStickyTraversal",
				includesSchedulerWaits = false,
				operationsPerSample = p68
			},
			arms = { viewRecycler = var86 },
			evidence = {
				stickyViewportRelative = viewportRelative,
				pinnedStartOffset = var90.mainAxisOffset,
				pinnedEndOffset = var91.mainAxisOffset,
				contentStartOffset = contentStartOffset,
				observablePlacementChecksum = var88
			}
		})
	end
end

local function measureScrollPolicy(p70, p71, p72, p73, p74)
	-- upvalues: responsibilityCatalogModule (ref)
	local var87 = 0
	local var88 = 0
	local var89 = 0
	local var90 = 0
	
	local function runScrollPolicy()
		-- upvalues: p73 (ref), p70 (ref), var87 (write), var88 (write), var90 (write), var89 (write)
		for _ = 1, p73 do
			local var91 = 200
			local var92 = 170
			local var93 = true
			local var94 = p70.Adapter.ScrollPolicy.createCoordinator({
				getItemCount = function()
					return 20
				end,
				getScrollState = function()
					-- upvalues: var91 (write), var92 (write)
					local maxValue = math.max(0, var91 - 30 - var92)
					
					return {
						viewportLength = 30,
						scrollOffset = var92,
						contentLength = var91,
						distanceFromEnd = maxValue,
						atStart = var92 == 0,
						atEnd = maxValue <= 1
					}
				end,
				getScrollOffsetForItem = function(value)
					return value * 10
				end,
				applyScrollAnchorOffset = function(value)
					-- upvalues: var93 (write), var87 (copy), var88 (copy), var92 (write), var90 (copy)
					if var93 then
						var87 += 1
						var93 = false
					else
						var88 += 1
					end
					var92 = value
					var90 += value
					
					return value
				end,
				getViewportState = function()
					-- upvalues: var92 (write)
					return { viewportLength = 30, scrollOffset = var92 }
				end,
				getInitialScrollAlignment = function()
					-- upvalues: p70 (copy)
					return p70.ScrollAlignment.End
				end,
				getAutoScrollPolicy = function()
					-- upvalues: p70 (copy)
					return p70.AutoScrollPolicy.WhenAtEnd
				end,
				getStartReachedThreshold = function()
					return 0
				end,
				getOnStartReached = function()
					return nil
				end,
				getOnEndReached = function()
					-- upvalues: var89 (copy)
					return function()
						-- upvalues: var89 (copy)
						var89 += 1
					end
				end
			})
			var94.onViewportChanged()
			var94.onDataSourceChanged({
				previousItemCount = 20,
				itemCount = 21,
				changes = {
					{
						index = 21,
						type = p70.DataSourceChangeType.Insert,
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
			var94.onContentLengthChanged(220)
			var94.checkEdges()
		end
	end
	
	local var95 = p71.measure(runScrollPolicy, p74)
	var87 = 0
	var88 = 0
	var89 = 0
	var90 = 0
	runScrollPolicy()
	assert(var87 > 0 and (var88 > 0 and var89 > 0), "scroll policy benchmark missed a policy phase")
	
	return p72.create({
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
			policyCycles = p73
		},
		timing = {
			unit = "ms",
			basis = "scrollPolicyCycle",
			includesSchedulerWaits = false,
			operationsPerSample = p73
		},
		arms = { viewRecycler = var95 },
		evidence = {
			initialScrolls = var87,
			endFollowWrites = var88,
			paginationHits = var89,
			hostOffsetChecksum = var90
		}
	})
end

local function measureRecyclingScopeRetention(p75, p76, p77, p78, p79, p80)
	-- upvalues: responsibilityCatalogModule (ref)
	local var91 = 0
	local var92 = 0
	local var93 = 0
	local var94 = p75.Adapter.createRecyclingScope({
		maxPoolSize = 4,
		adapter = {
			create = function()
				-- upvalues: var91 (write)
				var91 += 1
				
				return { id = var91 }
			end,
			destroy = function()
				-- upvalues: var92 (write)
				var92 += 1
			end
		}
	})
	local t = {}
	local var95 = p76.measure(function()
		-- upvalues: p79 (ref), p78 (ref), var94 (ref), t (ref), var93 (write)
		for _ = 1, p79 do
			local list = table.create(p78)
			
			for i = 1, p78 do
				list[i] = { viewType = "row" }
			end
			local acquired = var94.exchange(t, {}, list).acquired
			var93 += #acquired
			var94.exchange(t, acquired, {})
		end
	end, p80)
	local count = #var94.getVacantViews()
	var94.destroy()
	assert(count == 4 and (var92 > 0 and var93 > 0), "RecyclingScope retention benchmark did not apply retention pressure with Lease tokens")
	
	return p77.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "integrated",
		workload = "recycling-scope-retention-pressure",
		description = "Acquires and releases Lease batches above the RecyclingScope per-type vacancy limit.",
		responsibility = responsibilityCatalogModule.Core.RecyclingScope,
		scale = {
			maxVacanciesPerType = 4,
			itemsPerBatch = p78,
			batches = p79
		},
		timing = {
			unit = "ms",
			basis = "recyclingScopePressureBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p79
		},
		arms = { viewRecycler = var95 },
		evidence = {
			creations = var91,
			evictions = var92,
			retainedVacancies = count,
			leaseTokensObserved = var93
		}
	})
end

local function measureActiveToggle(p81, p82, p83, p84, p85, p86)
	-- upvalues: signalsModule (ref), createItems (ref), responsibilityCatalogModule (ref)
	local var96, var97 = signalsModule.createSignal(true)
	local var98 = 0
	local var99 = p81.Layout.uniform({ itemLength = 40 })
	local var100 = p81.Adapter.createRecyclingScope({
		adapter = {
			create = function()
				return {}
			end,
			destroy = function() end
		}
	})
	local var101 = p81.Adapter.createVirtualizer({
		dataSource = p81.DataSource.snapshot(createItems(p84), function(p87)
			return tostring(p87.id)
		end),
		layout = var99,
		recyclingScope = var100,
		getItemViewType = function()
			return "row"
		end,
		postCommitAssignment = function(_, p87)
			-- upvalues: var98 (write)
			if p87 == nil then
				var98 += 1
			end
		end,
		active = var96
	})
	var101.dispatch({ type = p81.VirtualizerCommandType.Activate })
	var101.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p81.VirtualizerCommandType.SetViewportSize
	})
	local var102 = p82.measure(function()
		-- upvalues: p85 (ref), var97 (ref)
		for _ = 1, p85 do
			var97(false)
			var97(true)
		end
	end, p86)
	var98 = 0
	
	for _ = 1, p85 do
		var97(false)
		var97(true)
	end
	local count = #var101.query({ type = p81.VirtualizerQueryType.GetItemViews })
	var101.dispatch({ type = p81.VirtualizerCommandType.Destroy })
	var100.destroy()
	var99.destroy()
	assert(var98 > 0 and count > 0, "active toggle benchmark did not release and reactivate")
	
	return p83.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "active-state-toggle",
		description = "Releases all assignments while inactive and synchronizes the latest desired window on reactivation.",
		responsibility = responsibilityCatalogModule.Core.ListPresentation,
		scale = { items = p84, toggles = p85 },
		timing = {
			unit = "ms",
			basis = "deactivateReactivate",
			includesSchedulerWaits = false,
			operationsPerSample = p85
		},
		arms = { viewRecycler = var102 },
		evidence = {
			releasedAssignments = var98,
			mountedAfterReactivation = count
		}
	})
end

local function measureLifecycle(p87, p88, p89, p90, p91, p92, p93)
	-- upvalues: createItems (ref)
	local var103 = 0
	local var104 = 0
	local var105 = 0
	local var106 = 0
	
	local function runLifecycle()
		-- upvalues: p87 (ref), createItems (copy), p90 (ref), var106 (write), var103 (write), var105 (write), var104 (write)
		local var107 = p87.Layout.uniform({ itemLength = 40 })
		local var108 = p87.Adapter.createRecyclingScope({
			adapter = {
				create = function()
					return {}
				end,
				destroy = function() end
			}
		})
		local var109 = p87.Adapter.createVirtualizer({
			dataSource = p87.DataSource.snapshot(createItems(p90), function(p94)
				return tostring(p94.id)
			end),
			layout = var107,
			recyclingScope = var108,
			getItemViewType = function()
				return "row"
			end,
			postCommitAssignment = function(_, p94)
				-- upvalues: var106 (copy)
				if p94 == nil then
					var106 += 1
				end
			end
		})
		var109.dispatch({ type = p87.VirtualizerCommandType.Activate })
		var109.dispatch({
			scrollAxisLength = 480,
			crossAxisLength = 800,
			type = p87.VirtualizerCommandType.SetViewportSize
		})
		var103 += 1
		var105 += #var109.query({ type = p87.VirtualizerQueryType.GetItemViews })
		var109.dispatch({ type = p87.VirtualizerCommandType.Destroy })
		var108.destroy()
		var107.destroy()
		var104 += 1
	end
	
	local var107 = p88.measure(runLifecycle, p93)
	var103 = 0
	var104 = 0
	var105 = 0
	var106 = 0
	runLifecycle()
	assert(var103 > 0 and (var103 == var104 and var106 > 0), "lifecycle benchmark did not complete cleanup")
	
	return p89.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "phased",
		description = "Builds a populated Virtualizer lifecycle and synchronously releases all owned resources.",
		responsibility = p91,
		workload = p92,
		scale = { items = p90 },
		timing = {
			unit = "ms",
			basis = "virtualizerLifecycle",
			operationsPerSample = 1,
			includesSchedulerWaits = false
		},
		arms = { viewRecycler = var107 },
		evidence = {
			initialized = var103,
			destroyed = var104,
			mountedAssignments = var105,
			releasedAssignments = var106
		}
	})
end

return {
	run = function(p87, p88, p89, p90)
		-- upvalues: list (ref), measureTraversal (ref), responsibilityCatalogModule (ref), measureCrossAxisTraversal (ref), measureCoordinator (ref), measureWithinBand (ref), measureLifecycle (ref), measureAtomicMutation (ref), measureOverscanPrefetch (ref), measureProgrammaticScroll (ref), measureMeasurementAnchoring (ref), measurePinnedSticky (ref), measureScrollPolicy (ref), measureRecyclingScopeRetention (ref), measureActiveToggle (ref)
		p90 = p90 or {}
		local itemCounts = p90.itemCounts or list
		local scrollStepCount = p90.scrollStepCount or 100
		local coordinatorItemCount = p90.coordinatorItemCount or 40
		local coordinatorStepCount = p90.coordinatorStepCount or 100
		assert(scrollStepCount >= 1 and scrollStepCount % 1 == 0, "scrollStepCount must be a positive integer")
		assert(#itemCounts > 0, "itemCounts must not be empty")
		local t = {}
		
		for i, v in itemCounts do
			assert(v >= 1 and v % 1 == 0, "item counts must be positive integers")
			table.insert(t, measureTraversal(p87, p88, p89, v, scrollStepCount, false, false, "jump", "uniform-traversal", "Runs the complete Virtualizer scroll, range, placement, and recycling path for a uniform layout.", responsibilityCatalogModule.Core.LayoutGeometry, p90))
			table.insert(t, measureTraversal(p87, p88, p89, v, scrollStepCount, true, false, "jump", "measured-offset-traversal", "Runs measured-layout offset lookup and propagation without submitting new item sizes.", responsibilityCatalogModule.Core.LayoutGeometry, p90))
			table.insert(t, measureTraversal(p87, p88, p89, v, scrollStepCount, true, true, "jump", "measured-update-traversal", "Runs the complete measured Virtualizer path and submits mounted-item size batches at every step.", responsibilityCatalogModule.Core.Measurement, p90))
			table.insert(t, measureCrossAxisTraversal(p87, p88, p89, v, scrollStepCount, "grid", p90))
			table.insert(t, measureCrossAxisTraversal(p87, p88, p89, v, scrollStepCount, "masonry", p90))
		end
		local var103 = itemCounts[1]
		assert(var103 >= 40, "the smallest item count must cover sticky and mutation workloads")
		
		for i_1, v_1 in { "short", "jump" } do
			table.insert(t, measureTraversal(p87, p88, p89, var103, scrollStepCount, false, false, v_1, "recycling-assignment-churn", "Contrasts nearby scrolling with large jumps through the same uniform Virtualizer.", responsibilityCatalogModule.Core.ListPresentation, p90))
		end
		for i_2, v_2 in { "retained", "churn" } do
			table.insert(t, measureCoordinator(p87, p88, p89, coordinatorItemCount, coordinatorStepCount, v_2, p90))
		end
		table.insert(t, measureWithinBand(p87, p88, p89, itemCounts[1], scrollStepCount, p90))
		table.insert(t, measureLifecycle(p87, p88, p89, var103, responsibilityCatalogModule.Core.Initialization, "virtualizer-initialization", p90))
		table.insert(t, measureAtomicMutation(p87, p88, p89, var103, responsibilityCatalogModule.Core.DataMutation, "atomic-data-mutation", p90))
		table.insert(t, measureAtomicMutation(p87, p88, p89, var103, responsibilityCatalogModule.Core.DataAnchoring, "atomic-anchor-preservation", p90))
		
		for i_3, v_3 in measureOverscanPrefetch(p87, p88, p89, var103, scrollStepCount, p90) do
			table.insert(t, v_3)
		end
		table.insert(t, measureProgrammaticScroll(p87, p88, p89, var103, scrollStepCount, p90))
		table.insert(t, measureMeasurementAnchoring(p87, p88, p89, var103, scrollStepCount, p90))
		table.insert(t, measurePinnedSticky(p87, p88, p89, var103, scrollStepCount, p90))
		table.insert(t, measureScrollPolicy(p87, p88, p89, scrollStepCount, p90))
		table.insert(t, measureRecyclingScopeRetention(p87, p88, p89, coordinatorItemCount, coordinatorStepCount, p90))
		table.insert(t, measureActiveToggle(p87, p88, p89, var103, scrollStepCount, p90))
		table.insert(t, measureLifecycle(p87, p88, p89, var103, responsibilityCatalogModule.Core.Teardown, "virtualizer-teardown", p90))
		
		return t
	end
}