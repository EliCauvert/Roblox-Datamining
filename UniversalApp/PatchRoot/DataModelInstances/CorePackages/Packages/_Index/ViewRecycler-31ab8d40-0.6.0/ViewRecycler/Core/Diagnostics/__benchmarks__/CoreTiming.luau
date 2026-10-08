local responsibilityCatalogModule = require(script.Parent.ResponsibilityCatalog)
local scrollPolicyModule = require(script:FindFirstAncestor("ViewRecycler").Core.ViewportBehavior.ScrollPolicy)
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
	
	if p3 == "slide" then
		for i = 1, p2 do
			list[i] = math.min(maxValue, i * 40)
		end
		return list
	else
		for i_1 = 1, p2 - 1 do
			if p3 == "short" then
				list[i_1] = math.min(maxValue, i_1 * 40)
			else
				list[i_1] = math.floor(i_1 * 7919 % 104729 / 104729 * maxValue)
			end
		end
		list[p2] = 0
		
		return list
	end
end

local function recordPlacementChecksum(p4)
	local var1 = 0
	
	for i, v in p4.mountedViews do
		local state = v.state
		var1 = var1 + state.itemLayout.startOffset + (state.canvasPlacement.mainAxisOffset or 0) + (if state.viewportPlacement == nil then 0 else state.viewportPlacement.mainAxisOffset or 0)
	end
	return var1
end

local function _(p5)
	return p5.contentLength + #p5.mountedViews
end

local _ = function()
	return {
		synchronizations = 0,
		reassignedAssignments = 0,
		acquiredAssignments = 0,
		releasedAssignments = 0,
		acceptedMeasurements = 0,
		touchedKeys = 0,
		logicalKeyReads = 0,
		layoutItemReads = 0,
		payloadReads = 0,
		viewTypeReads = 0,
		publicationCallbacks = 0
	}
end

local _ = function(value, p5)
	value.synchronizations = 0
	value.reassignedAssignments = 0
	value.acquiredAssignments = 0
	value.releasedAssignments = 0
	value.acceptedMeasurements = 0
	
	if p5 then
		value.touchedKeys = 0
		value.logicalKeyReads = 0
		value.layoutItemReads = 0
		value.payloadReads = 0
		value.viewTypeReads = 0
		value.publicationCallbacks = 0
	end
end

local function createBoundedRecyclingScope(p5, p6, p7)
	local var2 = p5.Adapter.createRecyclingScope(p6)
	
	return {
		bind = function(p8)
			-- upvalues: p7 (ref), var2 (ref)
			local cloned = table.clone(p8)
			cloned.capacity = p7
			
			return var2.bind(cloned)
		end,
		dispose = var2.dispose
	}
end

local function createVirtualizer(p5, p6, p7, p8)
	-- upvalues: createBoundedRecyclingScope (ref), createItems (ref)
	local var2
	local var3 = 0
	local t = {
		synchronizations = 0,
		reassignedAssignments = 0,
		acquiredAssignments = 0,
		releasedAssignments = 0,
		acceptedMeasurements = 0,
		touchedKeys = 0,
		logicalKeyReads = 0,
		layoutItemReads = 0,
		payloadReads = 0,
		viewTypeReads = 0,
		publicationCallbacks = 0
	}
	local var4 = if p7 then p5.Layout.measured({ estimatedItemLength = 40 }) else p5.Layout.uniform({ itemLength = 40 })
	
	if p7 and p8 then
		local cloned = table.clone(var4)
		
		function cloned.getItemLayout(p9)
			-- upvalues: t (ref), var4 (ref)
			t.layoutItemReads += 1
			
			return var4.getItemLayout(p9)
		end
		
		function cloned.getItemLayouts(p9, p10, p11)
			-- upvalues: t (ref), var4 (ref)
			t.layoutItemReads += math.max(0, p10 - p9 + 1)
			
			return var4.getItemLayouts(p9, p10, p11)
		end
		
		var2 = cloned
	else
		var2 = var4
	end
	local var5
	local var6 = createBoundedRecyclingScope(p5, {
		adapter = {
			create = function()
				-- upvalues: var3 (write)
				var3 += 1
				
				return var3
			end,
			destroy = function() end
		}
	}, 4)
	local var7 = p5.DataSource.snapshot(createItems(p6), function(p9)
		return tostring(p9.id)
	end)
	
	if p8 then
		local cloned = table.clone(var7)
		
		function cloned.getItemKey(p9)
			-- upvalues: t (ref), var7 (ref)
			t.logicalKeyReads += 1
			
			return var7.getItemKey(p9)
		end
		
		function cloned.getItem(p9)
			-- upvalues: t (ref), var7 (ref)
			t.payloadReads += 1
			
			return var7.getItem(p9)
		end
		
		var5 = cloned
	else
		var5 = var7
	end
	local var8 = p5.Adapter.createVirtualizer({
		overscan = 2,
		dataSource = var5,
		layout = var2,
		recyclingScope = var6,
		getItemViewType = if p8 then function(p9)
			-- upvalues: t (ref)
			t.viewTypeReads += 1
			
			return p9.kind
		end else function(p9)
			return p9.kind
		end,
		diagnostics = function(p9)
			-- upvalues: t (ref), p8 (ref)
			if p9.kind == "itemViewsSynchronized" then
				t.synchronizations += 1
				t.reassignedAssignments += p9.reassigned
				t.acquiredAssignments += p9.acquired
				t.releasedAssignments += p9.released
				
				if p8 then
					t.touchedKeys += p9.touched
					t.publicationCallbacks += p9.reassigned + p9.acquired + p9.released
					
					return
				end
			elseif p9.kind == "measurementsProcessed" then
				t.acceptedMeasurements += p9.accepted
			end
		end
	})
	var8.activate()
	var8.setViewportSize(480, 800)
	
	return var8, var2, t, var6
end

local function measureTraversal(p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16)
	-- upvalues: createVirtualizer (ref), createOffsets (ref), recordPlacementChecksum (ref)
	local var2, var3, var4, var5 = createVirtualizer(p5, p8, p10)
	local var6 = createOffsets(p8, p9, p12)
	local var7 = 0
	local var8 = 0
	local var9 = 0
	local var10 = 0
	local var11 = 0
	local var12 = 0
	
	local function runTraversal(p17)
		-- upvalues: var4 (write), var10 (write), var9 (write), var11 (write), var8 (write), var12 (write), var7 (write), var6 (ref), var2 (write), recordPlacementChecksum (copy), p11 (ref)
		var4.synchronizations = 0
		var4.reassignedAssignments = 0
		var4.acquiredAssignments = 0
		var4.releasedAssignments = 0
		var4.acceptedMeasurements = 0
		
		if p17 then
			var4.touchedKeys = 0
			var4.logicalKeyReads = 0
			var4.layoutItemReads = 0
			var4.payloadReads = 0
			var4.viewTypeReads = 0
			var4.publicationCallbacks = 0
		end
		var10 = 0
		var9 = 0
		var11 = 0
		var8 = 0
		var12 = 0
		var7 = (var7 + 1) % 5
		
		for i, v in var6 do
			local var13 = var2.setScrollOffset(v)
			var11 += var13.contentLength + #var13.mountedViews
			
			if p17 then
				var9 += recordPlacementChecksum(var13)
				var12 = math.max(var12, #var13.mountedViews)
			end
			if p11 then
				local t = {}
				
				for i_1, v_1 in var13.mountedViews do
					local itemView = v_1.itemView
					local state = v_1.state
					
					if state ~= nil and state.index ~= nil then
						table.insert(t, {
							itemView = itemView,
							state = state,
							length = 36 + (state.index + var7) % 5 * 2
						})
					end
				end
				var10 += #t
				local var14 = var2.submitMeasurements(t)
				var11 += var14.contentLength + #var14.mountedViews
				
				if p17 then
					var9 += recordPlacementChecksum(var14)
					var12 = math.max(var12, #var14.mountedViews)
				end
				var8 += #t
			end
		end
		local visibleRange = var2.getCurrent().visibleRange
		var8 += visibleRange.firstIndex + visibleRange.lastIndex
	end
	
	local var15 = p6.measure(function()
		-- upvalues: runTraversal (ref)
		runTraversal(false)
	end, p16)
	var2.destroy()
	var5.dispose()
	var3.destroy()
	local var16, var17, var18, var19 = createVirtualizer(p5, p8, p10, true)
	var2 = var16
	var4 = var18
	runTraversal(true)
	local var20 = var12
	local var21 = p9 * (if p11 then 2 else 1)
	local var22 = if p12 == "slide" then p9 * 2 else var4.synchronizations * var20 * 2
	local var23 = if p10 and p12 == "slide" then p9 * 3 + 2 else nil
	local touchedKeys = var4.touchedKeys
	local var24 = var4.synchronizations * var20 * (if p12 == "jump" then 2 else 1)
	local var25 = var4.touchedKeys * 2
	var2.destroy()
	var19.dispose()
	var17.destroy()
	assert(var8 > 0 and (var11 > 0 and var9 > 0), `{p13} benchmark did not expose mounted placements`)
	assert(var4.synchronizations <= var21, `{p13} synchronized more than once per accepted scroll or measurement mutation`)
	
	if p13 == "one-row-window-slide" or p13 == "measured-one-row-window-slide" or p13 == "disjoint-window-jump" then
		if p13 == "one-row-window-slide" or p13 == "measured-one-row-window-slide" then
			assert(var4.logicalKeyReads <= var22, `{p13} exceeded its two-key-reads-per-row budget ({var4.logicalKeyReads} > {var22})`)
			
			if p10 then
				assert(var4.layoutItemReads <= var23, `{p13} exceeded its edge-and-band Layout-read budget ({var4.layoutItemReads} > {var23})`)
			end
		else
			assert(var4.logicalKeyReads <= var22, `{p13} exceeded its logical-key read budget ({var4.logicalKeyReads} > {var22})`)
		end
		assert(var4.payloadReads <= touchedKeys, `{p13} exceeded its payload-read budget`)
		assert(var4.viewTypeReads <= touchedKeys, `{p13} exceeded its view-type read budget`)
		assert(var4.touchedKeys <= var24, `{p13} exceeded its reconciler touch budget ({var4.touchedKeys} > {var24})`)
		assert(var4.publicationCallbacks <= var25, `{p13} exceeded its publication callback budget`)
	end
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
		arms = { viewRecycler = var15 },
		evidence = {
			mountedItemViews = var20,
			synchronizations = var4.synchronizations,
			settlementSynchronizationBudget = var21,
			logicalKeyReadBudget = var22,
			layoutItemReadBudget = var23,
			enrichmentReadBudget = touchedKeys,
			touchedKeyBudget = var24,
			publicationCallbackBudget = var25,
			reassignedAssignments = var4.reassignedAssignments,
			acquiredAssignments = var4.acquiredAssignments,
			releasedAssignments = var4.releasedAssignments,
			touchedKeys = var4.touchedKeys,
			logicalKeyReads = var4.logicalKeyReads,
			layoutItemReads = var4.layoutItemReads,
			payloadReads = var4.payloadReads,
			viewTypeReads = var4.viewTypeReads,
			publicationCallbacks = var4.publicationCallbacks,
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
		local var26 = 0
		local var27 = 0
		local var28 = 0
		local var29 = 0
		local var30 = p18.Adapter.createRecyclingScope({
			adapter = {
				create = function()
					-- upvalues: var26 (write)
					var26 += 1
					
					return var26
				end,
				destroy = function() end
			},
			onPoolChanged = if p25 then function()
				-- upvalues: var27 (write)
				var27 += 1
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
		
		local function synchronize(p26)
			-- upvalues: t_1 (write), var30 (ref), p21 (copy), var29 (write), var28 (write), t (write)
			local t_2 = {}
			local t_3 = {}
			local t_4 = {}
			local t_5 = {}
			
			for i, v in p26 do
				local key = t_1[v.key]
				
				if key == nil then
					table.insert(t_3, { viewType = "row" })
					table.insert(t_4, v)
				else
					t_5[v.key] = key
				end
			end
			for i_1, v_1 in t_1 do
				if t_5[i_1] == nil then
					table.insert(t_2, v_1)
				end
			end
			local var31 = var30.bind({ releases = t_2, requests = t_3, capacity = p21 })
			var29 += 1
			var28 += #var31.acquired
			
			for i_2, v_2 in var31.acquired do
				t_5[t_4[i_2].key] = v_2
			end
			t_1 = t_5
			t = table.create(#p26)
			
			for i_3, v_3 in p26 do
				t[i_3] = t_1[v_3.key]
			end
		end
		
		synchronize(list)
		local var32 = false
		
		return {
			run = function()
				-- upvalues: p22 (copy), var32 (write), synchronize (ref), list_1 (ref), list (ref)
				for _ = 1, p22 do
					var32 = not var32
					synchronize(if var32 then list_1 else list)
				end
			end,
			getDiagnosticEvents = function()
				-- upvalues: var27 (write)
				return var27
			end,
			getAcquiredViews = function()
				-- upvalues: var28 (write)
				return var28
			end,
			getCreatedViews = function()
				-- upvalues: var26 (write)
				return var26
			end,
			getSubmissions = function()
				-- upvalues: var29 (write)
				return var29
			end,
			destroy = function()
				-- upvalues: var30 (ref), t (write), p21 (copy), t_1 (write)
				var30.bind({ releases = t, requests = {}, capacity = p21 })
				t = {}
				t_1 = {}
				var30.dispose()
			end
		}
	end
	
	local var33 = createFixture(false)
	local var34 = createFixture(true)
	local var35 = p19.measure(var33.run, p24)
	local var36 = p19.measure(var34.run, p24)
	local diagnosticEvents = var34.getDiagnosticEvents()
	local acquiredViews = var33.getAcquiredViews()
	local createdViews = var33.getCreatedViews()
	local submissions = var33.getSubmissions()
	var33.destroy()
	var34.destroy()
	
	return p20.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "integrated",
		workload = "typed-pool-submission-sync",
		description = "Submits retained or fully replaced desired keys through one typed Recycling pool.",
		responsibility = responsibilityCatalogModule.Core.Diagnostics,
		scale = { items = p21, synchronizations = p22, pattern = p23 },
		timing = {
			unit = "ms",
			basis = "coordinatorSynchronizationBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p22
		},
		arms = { diagnosticsDisabled = var35, diagnosticsEnabled = var36 },
		evidence = {
			createdViews = createdViews,
			acquiredViews = acquiredViews,
			submissions = submissions,
			diagnosticEvents = diagnosticEvents
		}
	})
end

local function measureSubItemScrolling(p27, p28, p29, p30, p31, p32)
	-- upvalues: createVirtualizer (ref), recordPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local function createArm(p33, p34)
		-- upvalues: createVirtualizer (copy), p27 (ref), p30 (ref), p31 (ref), recordPlacementChecksum (copy)
		local var37, var38, var39, var40 = createVirtualizer(p27, p30, p33, p34)
		local var41 = 1
		local var42 = 0
		local var43 = 0
		
		return {
			run = function(p35)
				-- upvalues: var39 (ref), p34 (ref), var42 (write), var43 (write), p31 (copy), var37 (ref), var41 (write), recordPlacementChecksum (copy)
				var39.synchronizations = 0
				var39.reassignedAssignments = 0
				var39.acquiredAssignments = 0
				var39.releasedAssignments = 0
				var39.acceptedMeasurements = 0
				
				if p34 then
					var39.touchedKeys = 0
					var39.logicalKeyReads = 0
					var39.layoutItemReads = 0
					var39.payloadReads = 0
					var39.viewTypeReads = 0
					var39.publicationCallbacks = 0
				end
				var42 = 0
				var43 = 0
				
				for i = 1, p31 do
					local var44 = (i - 1) % 20 + 1
					local var45 = var37.setScrollOffset(if var41 == 1 then var44 else 20 - var44)
					var43 += var45.contentLength + #var45.mountedViews
					
					if p35 then
						var42 += recordPlacementChecksum(var45)
					end
				end
				var41 = -var41
			end,
			counters = var39,
			getObservablePlacementChecksum = function()
				-- upvalues: var42 (write)
				return var42
			end,
			getCommittedSnapshotTouch = function()
				-- upvalues: var43 (write)
				return var43
			end,
			prepareCanonicalEvidence = function()
				-- upvalues: var41 (write)
				var41 = 1
			end,
			destroy = function()
				-- upvalues: var37 (ref), var40 (ref), var38 (ref)
				var37.destroy()
				var40.dispose()
				var38.destroy()
			end
		}
	end
	
	local var44 = createArm(false)
	local var45 = createArm(true)
	local var46 = p28.measure(function()
		-- upvalues: var44 (write)
		var44.run(false)
	end, p32)
	local var47 = p28.measure(function()
		-- upvalues: var45 (write)
		var45.run(false)
	end, p32)
	var44.prepareCanonicalEvidence()
	var45.prepareCanonicalEvidence()
	var44.destroy()
	var45.destroy()
	var44 = createArm(false, true)
	var45 = createArm(true, true)
	var44.run(true)
	var45.run(true)
	local t = {
		uniformSynchronizations = var44.counters.synchronizations,
		measuredSynchronizations = var45.counters.synchronizations,
		payloadReads = var44.counters.payloadReads + var45.counters.payloadReads,
		viewTypeReads = var44.counters.viewTypeReads + var45.counters.viewTypeReads,
		uniformObservablePlacementChecksum = var44.getObservablePlacementChecksum(),
		measuredObservablePlacementChecksum = var45.getObservablePlacementChecksum()
	}
	assert(var44.getCommittedSnapshotTouch() > 0 and (var45.getCommittedSnapshotTouch() > 0 and (t.uniformObservablePlacementChecksum > 0 and t.measuredObservablePlacementChecksum > 0)), "sub-item scrolling benchmark did not consume committed mounted placements")
	assert(t.uniformSynchronizations == 1 and t.measuredSynchronizations == 1, "sub-item scrolling benchmark did not reconcile exactly one range boundary")
	var44.destroy()
	var45.destroy()
	
	return p29.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "sub-item-scrolling",
		description = "Scrolls within one item while reconciling each crossed visible-range boundary.",
		responsibility = responsibilityCatalogModule.Core.ViewportRange,
		scale = { stickyOrPinned = false, items = p30, scrollSteps = p31 },
		timing = {
			unit = "ms",
			basis = "subItemScrollBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p31
		},
		arms = { uniform = var46, measured = var47 },
		evidence = t
	})
end

local function measureProgrammaticScroll(p33, p34, p35, p36, p37, p38)
	-- upvalues: createVirtualizer (ref), recordPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local var37, var38, _, var39 = createVirtualizer(p33, p36, false)
	local var40 = 0
	local var41 = 0
	local var42 = 0
	local var43 = 0
	
	local function runProgrammaticScroll(p39)
		-- upvalues: var40 (write), var41 (write), var42 (write), var43 (write), p37 (ref), p36 (ref), var37 (ref), p33 (ref), recordPlacementChecksum (copy)
		var40 = 0
		var41 = 0
		var42 = 0
		var43 = 0
		
		for i = 1, p37 do
			local var44 = var37.scrollToOffset(var37.getScrollOffsetForItem(i * 17 % p36 + 1, p33.ScrollAlignment.Center))
			var43 += var44.contentLength + #var44.mountedViews
			
			if p39 then
				var42 += recordPlacementChecksum(var44)
			end
			local var45 = var37.captureScrollAnchorSnapshot()
			var40 += 1
			local var46 = var37.scrollBy(40)
			var43 += var46.contentLength + #var46.mountedViews
			
			if p39 then
				var42 += recordPlacementChecksum(var46)
			end
			local var47 = var37.restoreScrollAnchorSnapshot(var45)
			var43 += var47.contentLength + #var47.mountedViews
			
			if p39 then
				var42 += recordPlacementChecksum(var47)
			end
			var41 += var47.scrollState.scrollOffset
		end
	end
	
	local var48 = p34.measure(function()
		-- upvalues: runProgrammaticScroll (ref)
		runProgrammaticScroll(false)
	end, p38)
	runProgrammaticScroll(true)
	local scrollState = var37.getCurrent().scrollState
	var37.destroy()
	var39.dispose()
	var38.destroy()
	assert(var40 == p37 and (var41 > 0 and (var43 > 0 and var42 > 0)), "programmatic scroll benchmark did not restore snapshots")
	
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
		arms = { viewRecycler = var48 },
		evidence = {
			snapshotsCaptured = var40,
			restoredOffsetChecksum = var41,
			finalScrollOffset = scrollState.scrollOffset,
			observablePlacementChecksum = var42
		}
	})
end

local function measureMeasurementAnchoring(p39, p40, p41, p42, p43, p44)
	-- upvalues: createVirtualizer (ref), recordPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local itemView, var44
	local var45, var46, _, var47 = createVirtualizer(p39, p42, true)
	local var48 = var45.setScrollOffset(400)
	local visibleRange = var48.visibleRange
	local var49 = nil
	local var50 = nil
	
	for i, v in var48.mountedViews do
		itemView = v.itemView
		var44 = v.state
		
		if var44 ~= nil and var44.index ~= nil and var44.index < visibleRange.firstIndex then
			var49 = itemView
			var50 = var44
			break
		end
	end
	local state
	assert(var49 ~= nil and var50 ~= nil, "measurement anchoring benchmark requires an overscanned item above the visible anchor")
	local var51 = 0
	local var52 = 0
	local var53 = 0
	
	i = function(p45)
		-- upvalues: var45 (ref)
		for i, v in var45.getCurrent().mountedViews do
			if v.itemView == p45 then
				return v.state
			end
		end
		return nil
	end
	
	local function runMeasurementAnchoring()
		-- upvalues: var51 (write), var52 (write), var53 (write), p43 (ref), var49 (write), var45 (ref)
		var51 = 0
		var52 = 0
		var53 = 0
		
		for i_1 = 1, p43 do
			local state
			for i, v in var45.getCurrent().mountedViews do
				if v.itemView == var49 then
					state = v.state
					assert(state ~= nil, "measurement anchoring view must remain occupied")
					local var54 = var45.submitMeasurements({
						{
							itemView = var49,
							state = state,
							length = if i_1 % 2 == 0 then 40 else 80
						}
					})
					
					if var54.scrollCorrection ~= 0 then
						var51 += 1
						var52 += math.abs(var54.scrollCorrection)
					end
					var53 += var54.contentLength + #var54.mountedViews
				end
			end
			state = nil
		end
	end
	
	local cloned = table.clone(p44)
	cloned.iterationsPerSample = 1
	var44 = p40.measure(runMeasurementAnchoring, cloned)
	local var55 = var49
	
	for i_1, v_1 in var45.getCurrent().mountedViews do
		if v_1.itemView == var55 then
			state = v_1.state
			assert(state ~= nil, "measurement anchoring view must remain occupied")
			var45.submitMeasurements({ { length = 40, itemView = var49, state = state } })
			var45.setScrollOffset(400)
			runMeasurementAnchoring()
			var53 = recordPlacementChecksum(var45.getCurrent())
			var55 = var45.getCurrent().scrollState.scrollOffset
			var45.destroy()
			var47.dispose()
			var46.destroy()
			assert(var51 > 0 and (var52 > 0 and var53 > 0), "measurement anchoring benchmark did not expose corrected mounted placements")
			
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
					scrollCorrections = var51,
					correctionMagnitude = var52,
					finalScrollOffset = var55,
					observablePlacementChecksum = var53,
					measuredItemIndex = var50.index,
					visibleAnchorIndex = visibleRange.firstIndex
				}
			})
		end
	end
	state = nil
end

local function measureCrossAxisTraversal(vectorA, vectorB, p46, p47, p48, p49, p50)
	-- upvalues: createBoundedRecyclingScope (ref), createItems (ref), recordPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local list = table.create(p47)
	
	for i = 1, p47 do
		list[i] = i % 5 * 8 + 32
	end
	local var56 = if p49 == "grid" then vectorA.Layout.grid({ itemLength = 40, crossAxisCount = 3 }) else vectorA.Layout.masonry({
		crossAxisCount = 3,
		spacing = 4,
		getItemLength = function(p51)
			-- upvalues: list (ref)
			return list[p51]
		end
	})
	local var57 = createBoundedRecyclingScope(vectorA, {
		adapter = {
			create = function()
				return {}
			end,
			destroy = function() end
		}
	}, p47)
	local var58 = vectorA.Adapter.createVirtualizer({
		overscan = 1,
		dataSource = vectorA.DataSource.snapshot(createItems(p47), function(p51)
			return tostring(p51.id)
		end),
		layout = var56,
		recyclingScope = var57,
		getItemViewType = function()
			return "row"
		end
	})
	var58.activate()
	var58.setViewportSize(480, 800)
	local var59 = 0
	local var60 = 0
	local var61 = 0
	
	local function runCrossAxisTraversal(vectorA)
		-- upvalues: var60 (write), var61 (write), var59 (write), p48 (ref), var58 (ref), recordPlacementChecksum (copy)
		var60 = 0
		var61 = 0
		var59 = 0
		
		for i = 1, p48 do
			local var62 = var58.setScrollOffset(i * 40)
			var61 += var62.contentLength + #var62.mountedViews
			
			if vectorA then
				var60 += recordPlacementChecksum(var62)
			end
			local visibleRange = var62.visibleRange
			var59 += visibleRange.firstIndex + visibleRange.lastIndex
			var59 += var58.getItemLayout(visibleRange.firstIndex).crossAxisCount
		end
	end
	
	local var63 = vectorB.measure(function()
		-- upvalues: runCrossAxisTraversal (ref)
		runCrossAxisTraversal(false)
	end, p50)
	runCrossAxisTraversal(true)
	local visibleRange = var58.getCurrent().visibleRange
	local crossAxisCount = var58.getItemLayout(visibleRange.firstIndex).crossAxisCount
	var58.destroy()
	var57.dispose()
	var56.destroy()
	assert(var59 > 0 and (var61 > 0 and var60 > 0), `{p49} traversal benchmark did not expose mounted placements`)
	
	return p46.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		responsibility = responsibilityCatalogModule.Core.LayoutGeometry,
		workload = `{p49}-traversal`,
		description = `Traverses representative {p49} geometry through the complete Virtualizer path.`,
		scale = { items = p47, scrollSteps = p48, layout = p49 },
		timing = {
			unit = "ms",
			basis = "scrollTraversal",
			includesSchedulerWaits = false,
			operationsPerSample = p48
		},
		arms = { viewRecycler = var63 },
		evidence = {
			queries = p48,
			crossAxisCount = crossAxisCount,
			finalVisibleFirst = visibleRange.firstIndex,
			finalVisibleLast = visibleRange.lastIndex,
			observablePlacementChecksum = var60
		}
	})
end

local function measureAtomicMutation(p51, p52, p53, p54, p55, p56, p57, p58)
	-- upvalues: createItems (ref), createBoundedRecyclingScope (ref), recordPlacementChecksum (ref)
	local var62 = if p57 then 2 else 3
	
	local function createFixture(p59)
		-- upvalues: p51 (ref), createItems (copy), p54 (ref), createBoundedRecyclingScope (copy), p57 (ref), recordPlacementChecksum (copy)
		local var63
		local var64 = p51.DataSource.sequence(createItems(p54), function(p60)
			return tostring(p60.id)
		end)
		local t = {
			synchronizations = 0,
			reassignedAssignments = 0,
			acquiredAssignments = 0,
			releasedAssignments = 0,
			acceptedMeasurements = 0,
			touchedKeys = 0,
			logicalKeyReads = 0,
			layoutItemReads = 0,
			payloadReads = 0,
			viewTypeReads = 0,
			publicationCallbacks = 0
		}
		
		if p59 then
			local cloned = table.clone(var64)
			
			function cloned.getItemKey(p60)
				-- upvalues: t (ref), var64 (ref)
				t.logicalKeyReads += 1
				
				return var64.getItemKey(p60)
			end
			
			function cloned.getItem(p60)
				-- upvalues: t (ref), var64 (ref)
				t.payloadReads += 1
				
				return var64.getItem(p60)
			end
			
			var63 = cloned
		else
			var63 = var64
		end
		local var65 = p51.Layout.uniform({ itemLength = 40 })
		local var66 = 0
		local var67 = 0
		local var68 = 0
		local var69 = 0
		local _ = 0
		local var70 = 0
		local var71 = 0
		local var72 = 0
		
		if p59 then
			var63.subscribe(function(p60)
				-- upvalues: var66 (write), var67 (write)
				var66 += 1
				var67 += #p60.changes
			end)
		end
		local var73 = createBoundedRecyclingScope(p51, {
			adapter = {
				create = function()
					-- upvalues: var72 (write)
					var72 += 1
					
					return var72
				end,
				destroy = function() end
			}
		}, p54)
		local var74 = p51.Adapter.createVirtualizer({
			overscan = 1,
			dataSource = var63,
			layout = var65,
			recyclingScope = var73,
			getItemViewType = if p59 then function(p60)
				-- upvalues: t (ref)
				t.viewTypeReads += 1
				
				return p60.kind
			end else function(p60)
				return p60.kind
			end,
			preserveScrollPositionOnChange = p57,
			onTransaction = if p59 then function(_, p60)
				-- upvalues: var68 (write), var69 (write)
				if p60.scrollCorrection ~= 0 then
					var68 += 1
					var69 += math.abs(p60.scrollCorrection)
				end
			end else nil,
			diagnostics = if p59 then function(p60)
				-- upvalues: t (ref)
				if p60.kind == "itemViewsSynchronized" then
					t.synchronizations += 1
					t.reassignedAssignments += p60.reassigned
					t.acquiredAssignments += p60.acquired
					t.releasedAssignments += p60.released
					t.touchedKeys += p60.touched
					t.publicationCallbacks += p60.reassigned + p60.acquired + p60.released
				end
			end else nil
		})
		var74.activate()
		var74.setViewportSize(480, 800)
		var74.setScrollOffset(400)
		t.synchronizations = 0
		t.reassignedAssignments = 0
		t.acquiredAssignments = 0
		t.releasedAssignments = 0
		t.acceptedMeasurements = 0
		t.touchedKeys = 0
		t.logicalKeyReads = 0
		t.layoutItemReads = 0
		t.payloadReads = 0
		t.viewTypeReads = 0
		t.publicationCallbacks = 0
		local mountedViewsCount = #var74.getCurrent().mountedViews
		
		local function applyMutation()
			-- upvalues: var71 (write), var70 (write), var74 (ref), var64 (ref), p57 (copy), p54 (copy)
			var71 += 1
			var70 = 0
			local firstIndex = var74.getCurrent().visibleRange.firstIndex
			local item = var64.getItem(firstIndex)
			var64.transaction(function()
				-- upvalues: p57 (copy), var64 (copy), var71 (copy), firstIndex (ref), item (ref), p54 (copy)
				if p57 then
					var64.prepend({ kind = "row", id = -var71 })
					var64.remove(var64.getItemCount())
					
					return
				end
				var64.setItem(firstIndex, { id = item.id, kind = item.kind })
				var64.append({ kind = "row", id = p54 + var71 })
				var64.remove(var64.getItemCount())
			end)
			local current = var74.getCurrent()
			var70 += current.contentLength + #current.mountedViews
		end
		
		return if p59 then function()
			-- upvalues: applyMutation (ref), mountedViewsCount (write), var74 (ref)
			applyMutation()
			mountedViewsCount = math.max(mountedViewsCount, #var74.getCurrent().mountedViews)
		end else applyMutation, function()
			-- upvalues: var74 (ref), var66 (write), var67 (write), var68 (write), var69 (write), recordPlacementChecksum (copy), var70 (write), mountedViewsCount (write), t (ref)
			local current = var74.getCurrent()
			
			return {
				batches = var66,
				changes = var67,
				revisedViews = #current.entered + #current.updated,
				scrollCorrections = var68,
				correctionMagnitude = var69,
				finalScrollOffset = var74.getCurrent().scrollState.scrollOffset,
				observablePlacementChecksum = recordPlacementChecksum(var74.getCurrent()),
				committedSnapshotTouch = var70,
				maximumMountedItemViews = mountedViewsCount,
				counters = t
			}
		end, function()
			-- upvalues: var74 (ref), var73 (ref), var65 (ref)
			var74.destroy()
			var73.dispose()
			var65.destroy()
		end
	end
	
	local var63, _, var64 = createFixture(false)
	local var65 = p52.measure(var63, p58)
	var64()
	local var66, var67, var68 = createFixture(true)
	var66()
	local var69 = var67()
	var68()
	local counters = var69.counters
	local var70 = var69.changes * var69.maximumMountedItemViews * 2
	local touchedKeys = counters.touchedKeys
	local var71 = counters.synchronizations * var69.maximumMountedItemViews
	local var72 = counters.touchedKeys * 2
	assert(var69.batches == 1 and var69.changes == var62, "atomic mutation benchmark did not emit grouped changes")
	assert(var69.revisedViews > 0 and (var69.committedSnapshotTouch > 0 and var69.observablePlacementChecksum > 0), "atomic mutation benchmark did not expose revised placements")
	assert(not p57 or var69.scrollCorrections > 0, "atomic mutation benchmark did not preserve its anchor")
	
	if p56 == "prepend-remove-mutation" then
		assert(counters.logicalKeyReads <= var70, `atomic mutation exceeded its logical-key read budget ({counters.logicalKeyReads} > {var70})`)
		assert(counters.payloadReads <= touchedKeys, "atomic mutation exceeded its payload-read budget")
		assert(counters.viewTypeReads <= touchedKeys, "atomic mutation exceeded its view-type read budget")
		assert(counters.touchedKeys <= var71, "atomic mutation exceeded its reconciler touch budget")
		assert(counters.publicationCallbacks <= var72, "atomic mutation exceeded its publication callback budget")
	end
	return p53.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		responsibility = p55,
		workload = p56,
		description = if p57 then "Prepends and trims one atomic batch while preserving the visible anchor." else "Applies one atomic visible update and balanced tail mutation without anchor preservation.",
		scale = { items = p54, changesPerTransaction = var62 },
		timing = {
			unit = "ms",
			basis = "atomicMutation",
			operationsPerSample = 1,
			includesSchedulerWaits = false
		},
		arms = { viewRecycler = var65 },
		evidence = {
			batches = var69.batches,
			changes = var69.changes,
			revisedViews = var69.revisedViews,
			scrollCorrections = var69.scrollCorrections,
			correctionMagnitude = var69.correctionMagnitude,
			finalScrollOffset = var69.finalScrollOffset,
			observablePlacementChecksum = var69.observablePlacementChecksum,
			mountedItemViews = var69.maximumMountedItemViews,
			synchronizations = counters.synchronizations,
			reassignedAssignments = counters.reassignedAssignments,
			acquiredAssignments = counters.acquiredAssignments,
			releasedAssignments = counters.releasedAssignments,
			touchedKeys = counters.touchedKeys,
			logicalKeyReads = counters.logicalKeyReads,
			payloadReads = counters.payloadReads,
			viewTypeReads = counters.viewTypeReads,
			publicationCallbacks = counters.publicationCallbacks,
			logicalKeyReadBudget = var70,
			enrichmentReadBudget = touchedKeys,
			touchedKeyBudget = var71,
			publicationCallbackBudget = var72
		}
	})
end

local function measureOverscanPrefetch(p51, p52, p53, p54, p55, p56)
	-- upvalues: createBoundedRecyclingScope (ref), createItems (ref), responsibilityCatalogModule (ref)
	local var62 = 0
	local var63 = 0
	local var64 = p51.Layout.uniform({ itemLength = 40 })
	local var65 = createBoundedRecyclingScope(p51, {
		adapter = {
			create = function()
				return {}
			end,
			destroy = function() end
		}
	}, p54)
	local var66 = p51.Adapter.createVirtualizer({
		overscan = 3,
		dataSource = p51.DataSource.snapshot(createItems(p54), function(p57)
			return tostring(p57.id)
		end),
		layout = var64,
		recyclingScope = var65,
		getItemViewType = function()
			return "row"
		end,
		dataPrefetch = { startItems = 2, endItems = 4 }
	})
	var66.activate()
	var66.setViewportSize(480, 800)
	local var67 = p52.measure(function()
		-- upvalues: p55 (ref), var66 (ref), var62 (write), var63 (write)
		for i_1 = 1, p55 do
			for i, v in var66.setScrollOffset(i_1 * 40 * 2).dataPrefetchRequests do
				var62 += 1
				
				if v.isCurrent() then
					var63 += 1
				end
			end
		end
		var66.setScrollOffset(40)
	end, p56)
	local visibleRange = var66.getCurrent().visibleRange
	local mountedRange = var66.getCurrent().mountedRange
	var66.destroy()
	var65.dispose()
	var64.destroy()
	assert(var62 > 0, "overscan/prefetch benchmark did not exercise prefetch")
	local t = {
		prefetchStartItems = 2,
		prefetchEndItems = 4,
		items = p54,
		scrollSteps = p55 + 1
	}
	local t_1 = {
		unit = "ms",
		basis = "overscanPrefetchTraversal",
		includesSchedulerWaits = false,
		operationsPerSample = p55 + 1
	}
	local t_2 = { viewRecycler = var67 }
	local t_3 = {
		prefetchRequests = var62,
		currentRequestsObserved = var63,
		visibleItems = visibleRange.lastIndex - visibleRange.firstIndex + 1,
		mountedItems = mountedRange.lastIndex - mountedRange.firstIndex + 1
	}
	
	return {
		p53.create({
			suite = "view-recycler-core",
			layer = "core",
			owner = "core",
			timingClass = "integrated",
			workload = "fixed-overscan",
			description = "Expands each current Visible range by a fixed number of Layout units.",
			responsibility = responsibilityCatalogModule.Core.Overscan,
			scale = t,
			timing = t_1,
			arms = t_2,
			evidence = t_3
		}),
		p53.create({
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

local function measurePinnedSticky(p57, p58, p59, p60, p61, p62)
	-- upvalues: createItems (ref), createBoundedRecyclingScope (ref), recordPlacementChecksum (ref), responsibilityCatalogModule (ref)
	local var68 = p57.Layout.uniform({ itemLength = 40 })
	local t = {
		isItemStickyHeader = function(p63)
			return tonumber(p63) % 20 == 0
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
	local var69 = createBoundedRecyclingScope(p57, {
		adapter = {
			create = function()
				return {}
			end,
			destroy = function() end
		}
	}, p60)
	local var70 = p57.Adapter.createVirtualizer({
		overscan = 0,
		dataSource = p57.DataSource.snapshot(createItems(p60), function(p63)
			return tostring(p63.id)
		end),
		layout = var68,
		recyclingScope = var69,
		getItemViewType = function(p63)
			return p63.kind
		end,
		isItemStickyHeader = t.isItemStickyHeader,
		pinnedStartItem = t.pinnedStartItem,
		pinnedEndItem = t.pinnedEndItem
	})
	var70.activate()
	var70.setViewportSize(480, 800)
	var70.setPolicy({
		overscan = 0,
		dataPrefetch = nil,
		contentAlignment = nil,
		endThreshold = nil,
		preserveScrollPositionOnChange = true,
		pinnedItems = t
	})
	local var71 = nil
	local var72 = nil
	local var73 = nil
	local var74 = nil
	
	for i, v in var70.getCurrent().mountedViews do
		local itemView = v.itemView
		local state = v.state
		
		if state ~= nil then
			if state.assignment.key == "$pinned-start" then
				var71 = itemView
				var72 = state
			elseif state.assignment.key == "$pinned-end" then
				var73 = itemView
				var74 = state
			end
		end
	end
	assert(var71 ~= nil and (var72 ~= nil and (var73 ~= nil and var74 ~= nil)), "pinned benchmark requires active pinned View states")
	var70.submitMeasurements({
		{ length = 24, itemView = var71, state = var72 },
		{ length = 32, itemView = var73, state = var74 }
	})
	local _ = 0
	local var75 = 0
	local var76 = nil
	local var77 = p58.measure(function()
		-- upvalues: var75 (write), p61 (ref), var70 (ref), var76 (write)
		var75 = 0
		
		for i = 1, p61 do
			local var78 = var70.setScrollOffset((i + 20) * 40)
			var76 = var78
			var75 += var78.contentLength + #var78.mountedViews
		end
	end, p62)
	assert(var76 ~= nil, "pinned/sticky benchmark did not retain a committed snapshot")
	local var79 = recordPlacementChecksum(var76)
	local var80 = false
	local viewportPlacement = nil
	local viewportPlacement_1 = nil
	
	for i_1, v_1 in var76.mountedViews do
		local state = v_1.state
		
		if state.index ~= nil and state.viewportPlacement ~= nil then
			var80 = true
		elseif state.assignment.key == "$pinned-start" then
			viewportPlacement = state.viewportPlacement
		elseif state.assignment.key == "$pinned-end" then
			viewportPlacement_1 = state.viewportPlacement
		end
	end
	local contentStartOffset = var70.getCurrent().contentStartOffset
	var70.destroy()
	var69.dispose()
	var68.destroy()
	assert(var75 > 0 and (var79 > 0 and (var80 and (viewportPlacement ~= nil and viewportPlacement_1 ~= nil))), "pinned/sticky benchmark did not expose viewport placements")
	
	return p59.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "sticky-pinned-placement",
		description = "Plans sticky retention, synthetic pinned assignments, and pinned content insets.",
		responsibility = responsibilityCatalogModule.Core.PinnedSticky,
		scale = { pinnedItems = 2, items = p60, scrollSteps = p61 },
		timing = {
			unit = "ms",
			basis = "pinnedStickyTraversal",
			includesSchedulerWaits = false,
			operationsPerSample = p61
		},
		arms = { viewRecycler = var77 },
		evidence = {
			stickyViewportRelative = var80,
			pinnedStartOffset = viewportPlacement.mainAxisOffset,
			pinnedEndOffset = viewportPlacement_1.mainAxisOffset,
			contentStartOffset = contentStartOffset,
			observablePlacementChecksum = var79
		}
	})
end

local function measureScrollPolicy(p63, p64, p65, p66, p67)
	-- upvalues: scrollPolicyModule (ref), responsibilityCatalogModule (ref)
	local var81 = 0
	local var82 = 0
	local var83 = 0
	local var84 = 0
	
	local function runScrollPolicy()
		-- upvalues: p66 (ref), scrollPolicyModule (copy), p63 (ref), var81 (write), var82 (write), var84 (write), var83 (write)
		for _ = 1, p66 do
			local var85 = 200
			local var86 = 170
			local var87 = true
			local var88 = scrollPolicyModule({
				startReachedThreshold = 0,
				startReachedEnabled = false,
				endReachedEnabled = true,
				initialScrollAlignment = p63.ScrollAlignment.End,
				autoScrollOnChange = p63.AutoScrollPolicy.WhenAtEnd
			})
			
			local function _()
				-- upvalues: var85 (write), var86 (write)
				local maxValue = math.max(0, var85 - 30 - var86)
				
				return {
					viewportLength = 30,
					scrollOffset = var86,
					contentLength = var85,
					distanceFromEnd = maxValue,
					atStart = var86 == 0,
					atEnd = maxValue <= 1
				}
			end
			
			local _ = function()
				-- upvalues: var85 (write), var86 (write)
				local t = { itemCount = 20 }
				local maxValue = math.max(0, var85 - 30 - var86)
				t.scrollState = {
					viewportLength = 30,
					scrollOffset = var86,
					contentLength = var85,
					distanceFromEnd = maxValue,
					atStart = var86 == 0,
					atEnd = maxValue <= 1
				}
				
				function t.getScrollOffsetForItem(value)
					return value * 10
				end
				
				return t
			end
			
			local _ = function(p68)
				-- upvalues: var87 (write), var81 (copy), var82 (copy), var86 (write), var84 (copy)
				if p68 == nil then return end
				if var87 then
					var81 += 1
					var87 = false
				else
					var82 += 1
				end
				var86 = p68
				var84 += p68
			end
			
			local _ = function(p68)
				-- upvalues: var88 (ref), var85 (write), var86 (write), var83 (copy)
				local maxValue = math.max(0, var85 - 30 - var86)
				local _, var89 = var88.checkEdges({
					viewportLength = 30,
					scrollOffset = var86,
					contentLength = var85,
					distanceFromEnd = maxValue,
					atStart = var86 == 0,
					atEnd = maxValue <= 1
				}, 20, p68)
				
				if var89 then
					var83 += 1
				end
			end
			
			local viewportChanged = var88.viewportChanged
			local t = { itemCount = 20 }
			local maxValue = math.max(0, var85 - 30 - var86)
			t.scrollState = {
				viewportLength = 30,
				scrollOffset = var86,
				contentLength = var85,
				distanceFromEnd = maxValue,
				atStart = var86 == 0,
				atEnd = maxValue <= 1
			}
			
			function t.getScrollOffsetForItem(value)
				return value * 10
			end
			
			viewportChanged = viewportChanged(t)
			
			if viewportChanged ~= nil then
				var81 += 1
				var87 = false
				var86 = viewportChanged
				var84 += viewportChanged
			end
			local maxValue_1 = math.max(0, var85 - 30 - var86)
			var88.observe({
				viewportLength = 30,
				scrollOffset = var86,
				contentLength = var85,
				distanceFromEnd = maxValue_1,
				atStart = var86 == 0,
				atEnd = maxValue_1 <= 1
			})
			local dataChanged = var88.dataChanged
			local t_1 = { itemCount = 20 }
			local maxValue_2 = math.max(0, var85 - 30 - var86)
			t_1.scrollState = {
				viewportLength = 30,
				scrollOffset = var86,
				contentLength = var85,
				distanceFromEnd = maxValue_2,
				atStart = var86 == 0,
				atEnd = maxValue_2 <= 1
			}
			
			function t_1.getScrollOffsetForItem(value)
				return value * 10
			end
			
			dataChanged = dataChanged(t_1, {
				previousItemCount = 20,
				itemCount = 21,
				changes = {
					{
						index = 21,
						type = p63.DataSourceChangeType.Insert,
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
			
			if dataChanged ~= nil then
				if var87 then
					var81 += 1
					var87 = false
				else
					var82 += 1
				end
				var86 = dataChanged
				var84 += dataChanged
			end
			local maxValue_3 = math.max(0, var85 - 30 - var86)
			local _, var89 = var88.checkEdges({
				viewportLength = 30,
				scrollOffset = var86,
				contentLength = var85,
				distanceFromEnd = maxValue_3,
				atStart = var86 == 0,
				atEnd = maxValue_3 <= 1
			}, 20, true)
			
			if var89 then
				var83 += 1
			end
			var85 = 220
			local maxValue_4 = math.max(0, var85 - 30 - var86)
			local var90 = var88.contentLengthChanged({
				viewportLength = 30,
				scrollOffset = var86,
				contentLength = var85,
				distanceFromEnd = maxValue_4,
				atStart = var86 == 0,
				atEnd = maxValue_4 <= 1
			})
			
			if var90 ~= nil then
				if var87 then
					var81 += 1
					var87 = false
				else
					var82 += 1
				end
				var86 = var90
				var84 += var90
			end
			local maxValue_5 = math.max(0, var85 - 30 - var86)
			local _, var91 = var88.checkEdges({
				viewportLength = 30,
				scrollOffset = var86,
				contentLength = var85,
				distanceFromEnd = maxValue_5,
				atStart = var86 == 0,
				atEnd = maxValue_5 <= 1
			}, 20, false)
			
			if var91 then
				var83 += 1
			end
		end
	end
	
	local var92 = p64.measure(runScrollPolicy, p67)
	var81 = 0
	var82 = 0
	var83 = 0
	var84 = 0
	runScrollPolicy()
	assert(var81 > 0 and (var82 > 0 and var83 > 0), "scroll policy benchmark missed a policy phase")
	
	return p65.create({
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
			policyCycles = p66
		},
		timing = {
			unit = "ms",
			basis = "scrollPolicyCycle",
			includesSchedulerWaits = false,
			operationsPerSample = p66
		},
		arms = { viewRecycler = var92 },
		evidence = {
			initialScrolls = var81,
			endFollowWrites = var82,
			paginationHits = var83,
			hostOffsetChecksum = var84
		}
	})
end

local function measureRecyclingScopeRetention(p68, p69, p70, p71, p72, p73)
	-- upvalues: responsibilityCatalogModule (ref)
	local var85 = 0
	local var86 = 0
	local var87 = 0
	local var88 = 0
	local var89 = p68.Adapter.createRecyclingScope({
		adapter = {
			create = function()
				-- upvalues: var85 (write)
				var85 += 1
				
				return { id = var85 }
			end,
			destroy = function()
				-- upvalues: var86 (write)
				var86 += 1
			end
		}
	})
	local var90 = p69.measure(function()
		-- upvalues: p72 (ref), p71 (ref), var89 (ref), var88 (write), var87 (write)
		for _ = 1, p72 do
			local list = table.create(p71)
			
			for i = 1, p71 do
				list[i] = { viewType = "row" }
			end
			local acquired = var89.bind({ capacity = 4, releases = {}, requests = list }).acquired
			var88 += 1
			var87 += #acquired
			var89.bind({ capacity = 4, releases = acquired, requests = {} })
			var88 += 1
		end
	end, p73)
	local var91 = var85 - var86
	var89.dispose()
	assert(var91 == 4 and (var86 > 0 and (var87 > 0 and var88 > 0)), "typed-pool retention benchmark did not apply view capacity pressure")
	
	return p70.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "integrated",
		workload = "typed-pool-retention-pressure",
		description = "Submits and releases view batches above a typed Recycling pool's vacancy capacity.",
		responsibility = responsibilityCatalogModule.Core.RecyclingScope,
		scale = {
			maxVacanciesPerType = 4,
			itemsPerBatch = p71,
			batches = p72
		},
		timing = {
			unit = "ms",
			basis = "recyclingScopePressureBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p72
		},
		arms = { viewRecycler = var90 },
		evidence = {
			creations = var85,
			evictions = var86,
			retainedVacancies = var91,
			acquiredViews = var87,
			submissions = var88
		}
	})
end

local function measureActiveToggle(p74, p75, p76, p77, p78, p79)
	-- upvalues: createBoundedRecyclingScope (ref), createItems (ref), responsibilityCatalogModule (ref)
	local t = {
		synchronizations = 0,
		reassignedAssignments = 0,
		acquiredAssignments = 0,
		releasedAssignments = 0,
		acceptedMeasurements = 0,
		touchedKeys = 0,
		logicalKeyReads = 0,
		layoutItemReads = 0,
		payloadReads = 0,
		viewTypeReads = 0,
		publicationCallbacks = 0
	}
	local var92 = p74.Layout.uniform({ itemLength = 40 })
	local var93 = createBoundedRecyclingScope(p74, {
		adapter = {
			create = function()
				return {}
			end,
			destroy = function() end
		}
	}, p77)
	local var94 = p74.DataSource.snapshot(createItems(p77), function(p80)
		return tostring(p80.id)
	end)
	local cloned = table.clone(var94)
	
	function cloned.getItemKey(p80)
		-- upvalues: t (ref), var94 (ref)
		t.logicalKeyReads += 1
		
		return var94.getItemKey(p80)
	end
	
	function cloned.getItem(p80)
		-- upvalues: t (ref), var94 (ref)
		t.payloadReads += 1
		
		return var94.getItem(p80)
	end
	
	local var95 = p74.Adapter.createVirtualizer({
		dataSource = cloned,
		layout = var92,
		recyclingScope = var93,
		getItemViewType = function()
			-- upvalues: t (ref)
			t.viewTypeReads += 1
			
			return "row"
		end,
		diagnostics = function(p80)
			-- upvalues: t (ref)
			if p80.kind == "itemViewsSynchronized" then
				t.synchronizations += 1
				t.reassignedAssignments += p80.reassigned
				t.acquiredAssignments += p80.acquired
				t.releasedAssignments += p80.released
				t.touchedKeys += p80.touched
				t.publicationCallbacks += p80.reassigned + p80.acquired + p80.released
			end
		end
	})
	var95.activate()
	var95.setViewportSize(480, 800)
	local _ = 0
	
	local function runActiveToggle()
		-- upvalues: p78 (ref), var95 (ref)
		for _ = 1, p78 do
			assert(#var95.setActive(false).mountedViews == 0, "active toggle must clear mounted Views")
			var95.setActive(true)
		end
	end
	
	local var96 = p75.measure(runActiveToggle, p79)
	t.synchronizations = 0
	t.reassignedAssignments = 0
	t.acquiredAssignments = 0
	t.releasedAssignments = 0
	t.acceptedMeasurements = 0
	t.touchedKeys = 0
	t.logicalKeyReads = 0
	t.layoutItemReads = 0
	t.payloadReads = 0
	t.viewTypeReads = 0
	t.publicationCallbacks = 0
	runActiveToggle()
	local mountedViewsCount = #var95.getCurrent().mountedViews
	local var97 = mountedViewsCount * p78
	local var98 = p78 * 2
	local var99 = mountedViewsCount * var98
	local var100 = mountedViewsCount * p78
	local var101 = t.touchedKeys * 2
	var95.destroy()
	var93.dispose()
	var92.destroy()
	assert(var97 > 0 and mountedViewsCount > 0, "active toggle benchmark did not release and reactivate")
	assert(t.logicalKeyReads == 0, "active toggle reread logical keys from its retained projection")
	assert(t.payloadReads <= var100, "active toggle exceeded its payload-read budget")
	assert(t.viewTypeReads <= var100, "active toggle exceeded its view-type read budget")
	assert(t.synchronizations <= var98, "active toggle exceeded its synchronization budget")
	assert(t.touchedKeys <= var99, "active toggle exceeded its reconciler touch budget")
	assert(t.publicationCallbacks <= var101, "active toggle exceeded its publication callback budget")
	
	return p76.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "active-state-toggle",
		description = "Releases all assignments while inactive and synchronizes the latest desired window on reactivation.",
		responsibility = responsibilityCatalogModule.Core.ListRows,
		scale = { items = p77, toggles = p78 },
		timing = {
			unit = "ms",
			basis = "deactivateReactivate",
			includesSchedulerWaits = false,
			operationsPerSample = p78
		},
		arms = { viewRecycler = var96 },
		evidence = {
			logicalKeyReadBudget = 0,
			releasedAssignments = var97,
			mountedAfterReactivation = mountedViewsCount,
			synchronizations = t.synchronizations,
			touchedKeys = t.touchedKeys,
			logicalKeyReads = t.logicalKeyReads,
			payloadReads = t.payloadReads,
			viewTypeReads = t.viewTypeReads,
			publicationCallbacks = t.publicationCallbacks,
			enrichmentReadBudget = var100,
			synchronizationBudget = var98,
			touchedKeyBudget = var99,
			publicationCallbackBudget = var101
		}
	})
end

local function measureLifecycle(p80, p81, p82, p83, p84, p85, p86)
	-- upvalues: createBoundedRecyclingScope (ref), createItems (ref)
	local var96 = 0
	local var97 = 0
	local var98 = 0
	local var99 = 0
	
	local function runLifecycle()
		-- upvalues: p80 (ref), createBoundedRecyclingScope (copy), p83 (ref), createItems (copy), var96 (write), var98 (write), var99 (write), var97 (write)
		local var100 = p80.Layout.uniform({ itemLength = 40 })
		local var101 = createBoundedRecyclingScope(p80, {
			adapter = {
				create = function()
					return {}
				end,
				destroy = function() end
			}
		}, p83)
		local var102 = p80.Adapter.createVirtualizer({
			dataSource = p80.DataSource.snapshot(createItems(p83), function(p87)
				return tostring(p87.id)
			end),
			layout = var100,
			recyclingScope = var101,
			getItemViewType = function()
				return "row"
			end
		})
		var102.activate()
		var102.setViewportSize(480, 800)
		var96 += 1
		var98 += #var102.getCurrent().mountedViews
		local mountedViewsCount = #var102.getCurrent().mountedViews
		var102.destroy()
		var99 += mountedViewsCount
		var101.dispose()
		var100.destroy()
		var97 += 1
	end
	
	local var100 = p81.measure(runLifecycle, p86)
	var96 = 0
	var97 = 0
	var98 = 0
	var99 = 0
	runLifecycle()
	assert(var96 > 0 and (var96 == var97 and var99 > 0), "lifecycle benchmark did not complete cleanup")
	
	return p82.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "phased",
		description = "Builds a populated Virtualizer lifecycle and synchronously releases all owned resources.",
		responsibility = p84,
		workload = p85,
		scale = { items = p83 },
		timing = {
			unit = "ms",
			basis = "virtualizerLifecycle",
			operationsPerSample = 1,
			includesSchedulerWaits = false
		},
		arms = { viewRecycler = var100 },
		evidence = {
			initialized = var96,
			destroyed = var97,
			mountedAssignments = var98,
			releasedAssignments = var99
		}
	})
end

return {
	run = function(p80, p81, p82, p83)
		-- upvalues: list (ref), measureTraversal (ref), responsibilityCatalogModule (ref), measureCrossAxisTraversal (ref), measureCoordinator (ref), measureSubItemScrolling (ref), measureLifecycle (ref), measureAtomicMutation (ref), measureOverscanPrefetch (ref), measureProgrammaticScroll (ref), measureMeasurementAnchoring (ref), measurePinnedSticky (ref), measureScrollPolicy (ref), measureRecyclingScopeRetention (ref), measureActiveToggle (ref)
		p83 = p83 or {}
		local itemCounts = p83.itemCounts or list
		local scrollStepCount = p83.scrollStepCount or 100
		local coordinatorItemCount = p83.coordinatorItemCount or 40
		local coordinatorStepCount = p83.coordinatorStepCount or 100
		assert(scrollStepCount >= 1 and scrollStepCount % 1 == 0, "scrollStepCount must be a positive integer")
		assert(#itemCounts > 0, "itemCounts must not be empty")
		local t = {}
		
		for i, v in itemCounts do
			assert(v >= 1 and v % 1 == 0, "item counts must be positive integers")
			table.insert(t, measureTraversal(p80, p81, p82, v, scrollStepCount, false, false, "jump", "uniform-traversal", "Runs the complete Virtualizer scroll, range, placement, and recycling path for a uniform layout.", responsibilityCatalogModule.Core.LayoutGeometry, p83))
			table.insert(t, measureTraversal(p80, p81, p82, v, scrollStepCount, true, false, "jump", "measured-offset-traversal", "Runs measured-layout offset lookup and propagation without submitting new item sizes.", responsibilityCatalogModule.Core.LayoutGeometry, p83))
			table.insert(t, measureTraversal(p80, p81, p82, v, scrollStepCount, true, true, "jump", "measured-update-traversal", "Runs the complete measured Virtualizer path and submits mounted-item size batches at every step.", responsibilityCatalogModule.Core.Measurement, p83))
			table.insert(t, measureCrossAxisTraversal(p80, p81, p82, v, scrollStepCount, "grid", p83))
			table.insert(t, measureCrossAxisTraversal(p80, p81, p82, v, scrollStepCount, "masonry", p83))
		end
		local var96 = itemCounts[1]
		assert(var96 >= 40, "the smallest item count must cover sticky and mutation workloads")
		
		for i_1, v_1 in { "short", "jump" } do
			table.insert(t, measureTraversal(p80, p81, p82, var96, scrollStepCount, false, false, v_1, "recycling-assignment-churn", "Contrasts nearby scrolling with large jumps through the same uniform Virtualizer.", responsibilityCatalogModule.Core.ListRows, p83))
		end
		for i_2, v_2 in { "retained", "churn" } do
			table.insert(t, measureCoordinator(p80, p81, p82, coordinatorItemCount, coordinatorStepCount, v_2, p83))
		end
		table.insert(t, measureSubItemScrolling(p80, p81, p82, itemCounts[1], scrollStepCount, p83))
		table.insert(t, measureLifecycle(p80, p81, p82, var96, responsibilityCatalogModule.Core.Initialization, "virtualizer-initialization", p83))
		table.insert(t, measureAtomicMutation(p80, p81, p82, var96, responsibilityCatalogModule.Core.DataMutation, "atomic-data-mutation", false, p83))
		table.insert(t, measureAtomicMutation(p80, p81, p82, var96, responsibilityCatalogModule.Core.DataAnchoring, "atomic-anchor-preservation", true, p83))
		
		for i_3, v_3 in measureOverscanPrefetch(p80, p81, p82, var96, scrollStepCount, p83) do
			table.insert(t, v_3)
		end
		table.insert(t, measureProgrammaticScroll(p80, p81, p82, var96, scrollStepCount, p83))
		table.insert(t, measureMeasurementAnchoring(p80, p81, p82, var96, scrollStepCount, p83))
		table.insert(t, measurePinnedSticky(p80, p81, p82, var96, scrollStepCount, p83))
		table.insert(t, measureScrollPolicy(p80, p81, p82, scrollStepCount, p83))
		table.insert(t, measureRecyclingScopeRetention(p80, p81, p82, coordinatorItemCount, coordinatorStepCount, p83))
		table.insert(t, measureActiveToggle(p80, p81, p82, var96, scrollStepCount, p83))
		table.insert(t, measureLifecycle(p80, p81, p82, var96, responsibilityCatalogModule.Core.Teardown, "virtualizer-teardown", p83))
		
		return t
	end,
	runStructuralEvidence = function(p84, p85, p86, p87)
		-- upvalues: list (ref), measureTraversal (ref), responsibilityCatalogModule (ref), measureAtomicMutation (ref), measureActiveToggle (ref)
		p87 = p87 or {}
		local itemCounts = p87.itemCounts or list
		local scrollStepCount = p87.scrollStepCount or 100
		assert(#itemCounts > 0, "itemCounts must not be empty")
		assert(itemCounts[1] >= 40, "the smallest item count must cover structural workloads")
		assert(scrollStepCount >= 1 and scrollStepCount % 1 == 0, "scrollStepCount must be a positive integer")
		local var97 = itemCounts[1]
		
		return {
			measureTraversal(p84, p85, p86, var97, scrollStepCount, false, false, "slide", "one-row-window-slide", "Slides the mounted window by one row and budgets sparse projection work.", responsibilityCatalogModule.Core.ListRows, p87),
			measureTraversal(p84, p85, p86, var97, scrollStepCount, true, false, "slide", "measured-one-row-window-slide", "Slides a measured mounted window by one row and budgets edge-only Layout reads.", responsibilityCatalogModule.Core.ListRows, p87),
			measureTraversal(p84, p85, p86, var97, scrollStepCount, false, false, "jump", "disjoint-window-jump", "Jumps between disjoint mounted windows and budgets dense replacement work.", responsibilityCatalogModule.Core.ListRows, p87),
			measureAtomicMutation(p84, p85, p86, var97, responsibilityCatalogModule.Core.DataAnchoring, "prepend-remove-mutation", true, p87),
			measureActiveToggle(p84, p85, p86, var97, scrollStepCount, p87)
		}
	end,
	runSubItemScrolling = function(p84, p85, p86, p87)
		-- upvalues: list (ref), measureSubItemScrolling (ref)
		p87 = p87 or {}
		local itemCounts = p87.itemCounts or list
		local scrollStepCount = p87.scrollStepCount or 100
		assert(#itemCounts > 0, "itemCounts must not be empty")
		assert(scrollStepCount >= 1 and scrollStepCount % 1 == 0, "scrollStepCount must be a positive integer")
		
		return measureSubItemScrolling(p84, p85, p86, itemCounts[1], scrollStepCount, p87)
	end
}