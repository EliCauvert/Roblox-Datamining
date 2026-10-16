local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local ResponsibilityCatalogModule = require(script.Parent.ResponsibilityCatalog)
local SignalsModule = require(ViewRecycler.Parent.Signals)
local BuildPlacementPlanModule = require(ViewRecycler.Core.PinnedItems.buildPlacementPlan)
local list = { 1000, 100000 }

local function createItems(Items) --[[ Line: 54 ]]
	local Buffer = table.create(Items)
	
	for i = 1, Items do
		Buffer[i] = { id = i, kind = if i % 20 == 0 then "header" else "row" }
	end
	return Buffer
end

local function createOffsets(Items: number, OperationsPerSample: number, ScrollPattern) --[[ Line: 65 ]]
	local Largest = math.max(0, Items * 40 - 480)
	local Buffer = table.create(OperationsPerSample)
	
	for i = 1, OperationsPerSample - 1 do
		if ScrollPattern == "short" then
			Buffer[i] = math.min(Largest, i * 40)
		else
			Buffer[i] = math.floor(i * 7919 % 104729 / 104729 * Largest)
		end
	end
	Buffer[OperationsPerSample] = 0
	
	return Buffer
end

local function snapshotPlacementChecksum(Snapshot): number --[[ Line: 80 ]]
	local NewStartOffset = 0
	
	for _, entry in Snapshot.entries do
		NewStartOffset = NewStartOffset + entry.itemLayout.startOffset + (entry.canvasPlacement.mainAxisOffset or 0) + (if entry.viewportPlacement == nil then 0 else entry.viewportPlacement.mainAxisOffset or 0)
	end
	return NewStartOffset
end

local function _(p1): number --[[ Line: 90 | Named "consumeCommittedSnapshot" ]]
	return p1.version + #p1.entries
end

local _ = function() --[[ Line: 94 | Named "createCounters" ]]
	return {
		synchronizations = 0,
		reassignedAssignments = 0,
		acquiredAssignments = 0,
		releasedAssignments = 0,
		acceptedMeasurements = 0
	}
end

local _ = function(Counters) --[[ Line: 104 | Named "resetCounters" ]]
	Counters.synchronizations = 0
	Counters.reassignedAssignments = 0
	Counters.acquiredAssignments = 0
	Counters.releasedAssignments = 0
	Counters.acceptedMeasurements = 0
end

local function createVirtualizer(p1, Items, p2) --[[ Line: 112 ]]
	-- upvalues: createItems (copy)
	local Count = 0
	local config = {
		synchronizations = 0,
		reassignedAssignments = 0,
		acquiredAssignments = 0,
		releasedAssignments = 0,
		acceptedMeasurements = 0
	}
	local MeasuredResult = if p2 then p1.Layout.measured({ estimatedItemLength = 40 }) else p1.Layout.uniform({ itemLength = 40 })
	local RecyclingScope = p1.Adapter.createRecyclingScope({
		maxPoolSize = 4,
		adapter = {
			create = function(): number --[[ Line: 120 ]]
				-- upvalues: Count (ref)
				Count += 1
				
				return Count
			end,
			destroy = function() --[[ Line: 124 ]] end
		}
	})
	local Virtualizer = p1.Adapter.createVirtualizer({
		overscan = 2,
		dataSource = p1.DataSource.snapshot(createItems(Items), function(p3): string --[[ Line: 129 ]]
			return (tostring(p3.id))
		end),
		layout = MeasuredResult,
		recyclingScope = RecyclingScope,
		getItemViewType = function(p3) --[[ Line: 134 ]]
			return p3.kind
		end,
		diagnostics = function(p3) --[[ Line: 138 ]]
			-- upvalues: config (copy)
			if p3.kind == "itemViewsSynchronized" then
				config.synchronizations += 1
				config.reassignedAssignments += p3.reassigned
				config.acquiredAssignments += p3.acquired
				config.releasedAssignments += p3.released
				
				return
			elseif p3.kind == "measurementsProcessed" then
				config.acceptedMeasurements += p3.accepted
			end
		end
	})
	Virtualizer.dispatch({ type = p1.VirtualizerCommandType.Activate })
	Virtualizer.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p1.VirtualizerCommandType.SetViewportSize
	})
	
	return Virtualizer, MeasuredResult, config, RecyclingScope
end

local function measureTraversal(p1, p2, p3, Items, ScrollStepCount, p4, SubmitsMeasurements, ScrollPattern, Workload, Description, LayoutGeometry, p5) --[[ Line: 158 ]]
	-- upvalues: createVirtualizer (copy), createOffsets (copy), snapshotPlacementChecksum (copy)
	local Virtualizer, Virtualizer2, Virtualizer3, Virtualizer4 = createVirtualizer(p1, Items, p4)
	local Offsets = createOffsets(Items, ScrollStepCount, ScrollPattern)
	local v1 = 0
	local NewFirstIndex = 0
	local ObservablePlacementChecksum = 0
	local SubmittedMeasurements = 0
	local NewVersion = 0
	
	local function runTraversal(p6) --[[ Line: 180 ]]
		-- upvalues: Virtualizer3 (copy), SubmittedMeasurements (ref), ObservablePlacementChecksum (ref), NewVersion (ref), NewFirstIndex (ref), v1 (ref), Offsets (copy), Virtualizer (copy), p1 (copy), snapshotPlacementChecksum (upval), SubmitsMeasurements (copy)
		Virtualizer3.synchronizations = 0
		Virtualizer3.reassignedAssignments = 0
		Virtualizer3.acquiredAssignments = 0
		Virtualizer3.releasedAssignments = 0
		Virtualizer3.acceptedMeasurements = 0
		SubmittedMeasurements = 0
		ObservablePlacementChecksum = 0
		NewVersion = 0
		NewFirstIndex = 0
		v1 = (v1 + 1) % 5
		
		for _, offset in Offsets do
			local DispatchResult = Virtualizer.dispatch({
				type = p1.VirtualizerCommandType.SetScrollOffset,
				offset = offset
			})
			local Snapshot = DispatchResult.snapshot
			NewVersion += Snapshot.version + #Snapshot.entries
			
			if p6 then
				ObservablePlacementChecksum += snapshotPlacementChecksum(DispatchResult.snapshot)
			end
			if SubmitsMeasurements then
				local Measurements = {}
				
				for _, ItemView in Virtualizer.query({ type = p1.VirtualizerQueryType.GetItemViews }) do
					local QueryResult = Virtualizer.query({
						type = p1.VirtualizerQueryType.GetPlacementIntent,
						itemView = ItemView
					})
					local MeasurementIdentity = if QueryResult == nil then nil else QueryResult.measurementIdentity
					
					if MeasurementIdentity ~= nil then
						table.insert(Measurements, {
							itemIndex = MeasurementIdentity.itemIndex,
							itemKey = MeasurementIdentity.itemKey,
							assignmentGeneration = MeasurementIdentity.assignmentGeneration,
							itemRevision = MeasurementIdentity.itemRevision,
							length = 36 + (MeasurementIdentity.itemIndex + v1) % 5 * 2
						})
					end
				end
				SubmittedMeasurements += #Measurements
				local DispatchResult1 = Virtualizer.dispatch({
					type = p1.VirtualizerCommandType.SubmitMeasurements,
					measurements = Measurements
				})
				local Snapshot1 = DispatchResult1.snapshot
				NewVersion += Snapshot1.version + #Snapshot1.entries
				
				if p6 then
					ObservablePlacementChecksum += snapshotPlacementChecksum(DispatchResult1.snapshot)
				end
				NewFirstIndex += #Measurements
			end
		end
		local VisibleRange = Virtualizer.getSnapshot().visibleRange
		NewFirstIndex += VisibleRange.firstIndex + VisibleRange.lastIndex
	end
	
	local MeasureResult = p2.measure(function() --[[ Line: 226 ]]
		-- upvalues: runTraversal (copy)
		runTraversal(false)
	end, p5)
	runTraversal(true)
	local Count = #Virtualizer.query({ type = p1.VirtualizerQueryType.GetItemViews })
	local ScaledScrollStepCount = ScrollStepCount * (if SubmitsMeasurements then 2 else 1)
	Virtualizer.dispatch({ type = p1.VirtualizerCommandType.Destroy })
	Virtualizer4.destroy()
	Virtualizer2.destroy()
	assert(NewFirstIndex > 0 and NewVersion > 0 and ObservablePlacementChecksum > 0, `{Workload} benchmark did not expose mounted placements`)
	assert(Virtualizer3.synchronizations <= ScaledScrollStepCount, `{Workload} synchronized more than once per accepted scroll or measurement mutation`)
	
	return p3.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		responsibility = LayoutGeometry,
		workload = Workload,
		description = Description,
		scale = {
			items = Items,
			scrollSteps = ScrollStepCount,
			scrollPattern = ScrollPattern,
			layout = if p4 then "measured" else "uniform",
			submitsMeasurements = SubmitsMeasurements
		},
		timing = {
			unit = "ms",
			basis = "scrollTraversal",
			includesSchedulerWaits = false,
			operationsPerSample = ScrollStepCount
		},
		arms = { viewRecycler = MeasureResult },
		evidence = {
			mountedItemViews = Count,
			synchronizations = Virtualizer3.synchronizations,
			settlementSynchronizationBudget = ScaledScrollStepCount,
			reassignedAssignments = Virtualizer3.reassignedAssignments,
			acquiredAssignments = Virtualizer3.acquiredAssignments,
			releasedAssignments = Virtualizer3.releasedAssignments,
			submittedMeasurements = SubmittedMeasurements,
			acceptedMeasurements = Virtualizer3.acceptedMeasurements,
			observablePlacementChecksum = ObservablePlacementChecksum
		}
	})
end

local function measureCoordinator(p7, p8, p9, Items, OperationsPerSample, Pattern, p10) --[[ Line: 282 ]]
	-- upvalues: ResponsibilityCatalogModule (copy)
	local function createFixture(p11) --[[ Line: 291 ]]
		-- upvalues: p7 (copy), Items (copy), Pattern (copy), OperationsPerSample (copy)
		local Count = 0
		local Count1 = 0
		local Total = 0
		local RecyclingScope = p7.Adapter.createRecyclingScope({
			adapter = {
				create = function(): number --[[ Line: 297 ]]
					-- upvalues: Count (ref)
					Count += 1
					
					return Count
				end,
				destroy = function() --[[ Line: 301 ]] end
			},
			onPoolChanged = if p11 then function() --[[ Line: 304 ]]
				-- upvalues: Count1 (ref)
				Count1 += 1
			end else nil
		})
		local Buffer = table.create(Items)
		local Buffer1 = table.create(Items)
		
		for i = 1, Items do
			Buffer[i] = { key = `a{i}`, index = i, value = i }
			Buffer1[i] = if Pattern == "retained" then Buffer[i] else { key = `b{i}`, index = i, value = i }
		end
		local t = {}
		local t1 = {}
		local t2 = {}
		
		local function synchronize(List) --[[ Line: 328 ]]
			-- upvalues: t1 (ref), RecyclingScope (copy), t2 (copy), Total (ref), t (ref)
			local List1 = {}
			local List2 = {}
			local List3 = {}
			local t3 = {}
			
			for _, value in List do
				local Entry = t1[value.key]
				
				if Entry == nil then
					table.insert(List2, { viewType = "row" })
					table.insert(List3, value)
				else
					t3[value.key] = Entry
				end
			end
			for i, value1 in t1 do
				if t3[i] == nil then
					table.insert(List1, { view = value1.view, leaseToken = value1.leaseToken })
				end
			end
			local ExchangeResult = RecyclingScope.exchange(t2, List1, List2)
			Total += #ExchangeResult.acquired
			
			for i1, value2 in ExchangeResult.acquired do
				t3[List3[i1].key] = value2
			end
			t1 = t3
			t = table.create(#List)
			
			for i2, value3 in List do
				t[i2] = t1[value3.key]
			end
		end
		
		synchronize(Buffer)
		local Inverted = false
		
		return {
			run = function() --[[ Line: 361 ]]
				-- upvalues: OperationsPerSample (upval), Inverted (ref), synchronize (copy), Buffer1 (copy), Buffer (copy)
				for _ = 1, OperationsPerSample do
					Inverted = not Inverted
					synchronize(if Inverted then Buffer1 else Buffer)
				end
			end,
			getDiagnosticEvents = function() --[[ Line: 367 ]]
				-- upvalues: Count1 (ref)
				return Count1
			end,
			getLeaseTokensObserved = function() --[[ Line: 370 ]]
				-- upvalues: Total (ref)
				return Total
			end,
			getScopeInventory = RecyclingScope.getScopeInventory,
			destroy = function() --[[ Line: 374 ]]
				-- upvalues: RecyclingScope (copy), t2 (copy), t (ref), t1 (ref)
				RecyclingScope.exchange(t2, t, {})
				t = {}
				t1 = {}
				RecyclingScope.destroy()
			end
		}
	end
	
	local Fixture = createFixture(false)
	local Fixture1 = createFixture(true)
	local MeasureResult = p8.measure(Fixture.run, p10)
	local MeasureResult1 = p8.measure(Fixture1.run, p10)
	local Count = #Fixture.getScopeInventory()
	local DiagnosticEvents = Fixture1.getDiagnosticEvents()
	local LeaseTokensObserved = Fixture.getLeaseTokensObserved()
	Fixture.destroy()
	Fixture1.destroy()
	
	return p9.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "integrated",
		workload = "recycling-scope-sync",
		description = "Synchronizes a Recycling scope with retained or fully replaced desired keys.",
		responsibility = ResponsibilityCatalogModule.Core.Diagnostics,
		scale = {
			items = Items,
			synchronizations = OperationsPerSample,
			pattern = Pattern
		},
		timing = {
			unit = "ms",
			basis = "coordinatorSynchronizationBatch",
			includesSchedulerWaits = false,
			operationsPerSample = OperationsPerSample
		},
		arms = {
			diagnosticsDisabled = MeasureResult,
			diagnosticsEnabled = MeasureResult1
		},
		evidence = {
			resources = Count,
			diagnosticEvents = DiagnosticEvents,
			leaseTokensObserved = LeaseTokensObserved
		}
	})
end

local function measureWithinBand(p12, p13, p14, Items, OperationsPerSample, p15) --[[ Line: 424 ]]
	-- upvalues: createVirtualizer (copy), snapshotPlacementChecksum (copy), ResponsibilityCatalogModule (copy)
	local function createArm(p16) --[[ Line: 432 ]]
		-- upvalues: createVirtualizer (upval), p12 (copy), Items (copy), OperationsPerSample (copy), snapshotPlacementChecksum (upval)
		local Virtualizer, Virtualizer2, Virtualizer3, Virtualizer4 = createVirtualizer(p12, Items, p16)
		local Negated = 1
		local Total = 0
		local NewVersion = 0
		
		return {
			run = function(p17) --[[ Line: 437 ]]
				-- upvalues: Virtualizer3 (copy), Total (ref), NewVersion (ref), OperationsPerSample (upval), Virtualizer (copy), p12 (upval), Negated (ref), snapshotPlacementChecksum (upval)
				Virtualizer3.synchronizations = 0
				Virtualizer3.reassignedAssignments = 0
				Virtualizer3.acquiredAssignments = 0
				Virtualizer3.releasedAssignments = 0
				Virtualizer3.acceptedMeasurements = 0
				Total = 0
				NewVersion = 0
				
				for i = 1, OperationsPerSample do
					local DispatchResult = Virtualizer.dispatch({
						type = p12.VirtualizerCommandType.SetScrollOffset,
						offset = if Negated == 1 then i else OperationsPerSample - i
					})
					local Snapshot = DispatchResult.snapshot
					NewVersion += Snapshot.version + #Snapshot.entries
					
					if p17 then
						Total += snapshotPlacementChecksum(DispatchResult.snapshot)
					end
				end
				Negated = -Negated
			end,
			counters = Virtualizer3,
			getObservablePlacementChecksum = function() --[[ Line: 456 ]]
				-- upvalues: Total (ref)
				return Total
			end,
			getCommittedSnapshotTouch = function() --[[ Line: 459 ]]
				-- upvalues: NewVersion (ref)
				return NewVersion
			end,
			prepareCanonicalEvidence = function() --[[ Line: 462 ]]
				-- upvalues: Negated (ref)
				Negated = 1
			end,
			destroy = function() --[[ Line: 465 ]]
				-- upvalues: Virtualizer (copy), p12 (upval), Virtualizer4 (copy), Virtualizer2 (copy)
				Virtualizer.dispatch({ type = p12.VirtualizerCommandType.Destroy })
				Virtualizer4.destroy()
				Virtualizer2.destroy()
			end
		}
	end
	
	local Arm = createArm(false)
	local Arm1 = createArm(true)
	local MeasureResult = p13.measure(function() --[[ Line: 475 ]]
		-- upvalues: Arm (copy)
		Arm.run(false)
	end, p15)
	local MeasureResult1 = p13.measure(function() --[[ Line: 478 ]]
		-- upvalues: Arm1 (copy)
		Arm1.run(false)
	end, p15)
	Arm.prepareCanonicalEvidence()
	Arm1.prepareCanonicalEvidence()
	Arm.run(true)
	Arm1.run(true)
	local Evidence = {
		uniformSynchronizations = Arm.counters.synchronizations,
		measuredSynchronizations = Arm1.counters.synchronizations,
		uniformObservablePlacementChecksum = Arm.getObservablePlacementChecksum(),
		measuredObservablePlacementChecksum = Arm1.getObservablePlacementChecksum()
	}
	assert(Arm.getCommittedSnapshotTouch() > 0 and (Arm1.getCommittedSnapshotTouch() > 0 and Evidence.uniformObservablePlacementChecksum > 0) and Evidence.measuredObservablePlacementChecksum > 0, "within-Band benchmark did not consume committed mounted placements")
	Arm.destroy()
	Arm1.destroy()
	
	return p14.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "within-band-scrolling",
		description = "Scrolls by sub-item increments inside one render-window band without sticky or pinned items.",
		responsibility = ResponsibilityCatalogModule.Core.ViewportRange,
		scale = {
			stickyOrPinned = false,
			items = Items,
			scrollSteps = OperationsPerSample
		},
		timing = {
			unit = "ms",
			basis = "withinBandScrollBatch",
			includesSchedulerWaits = false,
			operationsPerSample = OperationsPerSample
		},
		arms = { uniform = MeasureResult, measured = MeasureResult1 },
		evidence = Evidence
	})
end

local function measureProgrammaticScroll(p16, p17, p18, Items, OperationsPerSample, p19) --[[ Line: 528 ]]
	-- upvalues: createVirtualizer (copy), snapshotPlacementChecksum (copy), ResponsibilityCatalogModule (copy)
	local Virtualizer, Virtualizer2, _, Virtualizer4 = createVirtualizer(p16, Items, false)
	local SnapshotsCaptured = 0
	local NewResult = 0
	local Total = 0
	local NewVersion = 0
	
	local function runProgrammaticScroll(p20) --[[ Line: 541 ]]
		-- upvalues: SnapshotsCaptured (ref), NewResult (ref), Total (ref), NewVersion (ref), OperationsPerSample (copy), Items (copy), Virtualizer (copy), p16 (copy), snapshotPlacementChecksum (upval)
		SnapshotsCaptured = 0
		NewResult = 0
		Total = 0
		NewVersion = 0
		
		for i = 1, OperationsPerSample do
			local DispatchResult = Virtualizer.dispatch({
				type = p16.VirtualizerCommandType.ScrollToOffset,
				offset = Virtualizer.query({
					type = p16.VirtualizerQueryType.GetScrollOffsetForItem,
					index = i * 17 % Items + 1,
					alignment = p16.ScrollAlignment.Center
				})
			})
			local Snapshot = DispatchResult.snapshot
			NewVersion += Snapshot.version + #Snapshot.entries
			
			if p20 then
				Total += snapshotPlacementChecksum(DispatchResult.snapshot)
			end
			local QueryResult = Virtualizer.query({
				type = p16.VirtualizerQueryType.CaptureScrollAnchorSnapshot
			})
			SnapshotsCaptured += 1
			local DispatchResult1 = Virtualizer.dispatch({ delta = 40, type = p16.VirtualizerCommandType.ScrollBy })
			local Snapshot1 = DispatchResult1.snapshot
			NewVersion += Snapshot1.version + #Snapshot1.entries
			
			if p20 then
				Total += snapshotPlacementChecksum(DispatchResult1.snapshot)
			end
			local DispatchResult2 = Virtualizer.dispatch({
				type = p16.VirtualizerCommandType.RestoreScrollAnchorSnapshot,
				snapshot = QueryResult
			})
			local Snapshot2 = DispatchResult2.snapshot
			NewVersion += Snapshot2.version + #Snapshot2.entries
			
			if p20 then
				Total += snapshotPlacementChecksum(DispatchResult2.snapshot)
			end
			NewResult += DispatchResult2.result
		end
	end
	
	local MeasureResult = p17.measure(function() --[[ Line: 576 ]]
		-- upvalues: runProgrammaticScroll (copy)
		runProgrammaticScroll(false)
	end, p19)
	runProgrammaticScroll(true)
	local QueryResult = Virtualizer.query({ type = p16.VirtualizerQueryType.GetScrollState })
	Virtualizer.dispatch({ type = p16.VirtualizerCommandType.Destroy })
	Virtualizer4.destroy()
	Virtualizer2.destroy()
	assert(SnapshotsCaptured == OperationsPerSample and (NewResult > 0 and NewVersion > 0) and Total > 0, "programmatic scroll benchmark did not restore snapshots")
	
	return p18.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "programmatic-scroll-snapshot",
		description = "Resolves item targets, scrolls by offset and delta, and captures and restores stable-key snapshots.",
		responsibility = ResponsibilityCatalogModule.Core.ProgrammaticScroll,
		scale = { items = Items, scrollCycles = OperationsPerSample },
		timing = {
			unit = "ms",
			basis = "programmaticScrollAnchorSnapshotCycle",
			includesSchedulerWaits = false,
			operationsPerSample = OperationsPerSample
		},
		arms = { viewRecycler = MeasureResult },
		evidence = {
			snapshotsCaptured = SnapshotsCaptured,
			restoredOffsetChecksum = NewResult,
			finalScrollOffset = QueryResult.scrollOffset,
			observablePlacementChecksum = Total
		}
	})
end

local function measureMeasurementAnchoring(p20, p21, p22, Items, MeasurementUpdates, Tbl) --[[ Line: 621 ]]
	-- upvalues: createVirtualizer (copy), snapshotPlacementChecksum (copy), ResponsibilityCatalogModule (copy)
	local Virtualizer, Virtualizer2, _, Virtualizer4 = createVirtualizer(p20, Items, true)
	Virtualizer.dispatch({
		offset = 400,
		type = p20.VirtualizerCommandType.SetScrollOffset
	})
	local VisibleRange = Virtualizer.getSnapshot().visibleRange
	local v2 = nil
	local MeasurementIdentity = nil
	
	for _, ItemView in Virtualizer.query({ type = p20.VirtualizerQueryType.GetItemViews }) do
		local QueryResult = Virtualizer.query({
			type = p20.VirtualizerQueryType.GetPlacementIntent,
			itemView = ItemView
		})
		MeasurementIdentity = if QueryResult == nil then nil else QueryResult.measurementIdentity
		
		if MeasurementIdentity ~= nil and MeasurementIdentity.itemIndex < VisibleRange.firstIndex then
			v2 = MeasurementIdentity
			break
		end
	end
	assert(v2 ~= nil, "measurement anchoring benchmark requires an overscanned item above the visible anchor")
	local ScrollCorrections = 0
	local NewMagnitude = 0
	local NewVersion = 0
	
	local function runMeasurementAnchoring() --[[ Line: 645 ]]
		-- upvalues: ScrollCorrections (ref), NewMagnitude (ref), NewVersion (ref), MeasurementUpdates (copy), Virtualizer (copy), p20 (copy), v2 (ref)
		ScrollCorrections = 0
		NewMagnitude = 0
		NewVersion = 0
		
		for i = 1, MeasurementUpdates do
			local DispatchResult = Virtualizer.dispatch({
				type = p20.VirtualizerCommandType.SubmitMeasurements,
				measurements = {
					{
						itemIndex = v2.itemIndex,
						itemKey = v2.itemKey,
						assignmentGeneration = v2.assignmentGeneration,
						itemRevision = v2.itemRevision,
						length = if i % 2 == 0 then 40 else 80
					}
				}
			})
			
			for _, effect in DispatchResult.effects do
				if effect.type == p20.VirtualizerEffectType.ScrollCorrection then
					ScrollCorrections += 1
					NewMagnitude += math.abs(effect.delta)
				end
			end
			local Snapshot = DispatchResult.snapshot
			NewVersion += Snapshot.version + #Snapshot.entries
		end
	end
	
	local Copy = table.clone(Tbl)
	Copy.iterationsPerSample = 1
	local MeasureResult = p21.measure(runMeasurementAnchoring, Copy)
	Virtualizer.dispatch({
		type = p20.VirtualizerCommandType.SubmitMeasurements,
		measurements = {
			{
				length = 40,
				itemIndex = v2.itemIndex,
				itemKey = v2.itemKey,
				assignmentGeneration = v2.assignmentGeneration,
				itemRevision = v2.itemRevision
			}
		}
	})
	Virtualizer.dispatch({
		offset = 400,
		type = p20.VirtualizerCommandType.SetScrollOffset
	})
	runMeasurementAnchoring()
	NewVersion = snapshotPlacementChecksum(Virtualizer.getSnapshot())
	local ScrollOffset = Virtualizer.query({ type = p20.VirtualizerQueryType.GetScrollState }).scrollOffset
	Virtualizer.dispatch({ type = p20.VirtualizerCommandType.Destroy })
	Virtualizer4.destroy()
	Virtualizer2.destroy()
	assert(ScrollCorrections > 0 and NewMagnitude > 0 and NewVersion > 0, "measurement anchoring benchmark did not expose corrected mounted placements")
	
	return p22.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "measurement-anchor-preservation",
		description = "Changes a measured overscan item above the visible anchor and preserves the visible position.",
		responsibility = ResponsibilityCatalogModule.Core.MeasurementAnchoring,
		scale = { items = Items, measurementUpdates = MeasurementUpdates },
		timing = {
			unit = "ms",
			basis = "measurementAnchorUpdateBatch",
			includesSchedulerWaits = false,
			operationsPerSample = MeasurementUpdates
		},
		arms = { viewRecycler = MeasureResult },
		evidence = {
			scrollCorrections = ScrollCorrections,
			correctionMagnitude = NewMagnitude,
			finalScrollOffset = ScrollOffset,
			observablePlacementChecksum = NewVersion,
			measuredItemIndex = v2.itemIndex,
			visibleAnchorIndex = VisibleRange.firstIndex
		}
	})
end

local function measureCrossAxisTraversal(p23, p24, p25, Items, ScrollStepCount, Layout, p26) --[[ Line: 729 ]]
	-- upvalues: createItems (copy), snapshotPlacementChecksum (copy), ResponsibilityCatalogModule (copy)
	local Buffer = table.create(Items)
	
	for i = 1, Items do
		Buffer[i] = i % 5 * 8 + 32
	end
	local GridResult = if Layout == "grid" then p23.Layout.grid({ itemLength = 40, crossAxisCount = 3 }) else p23.Layout.masonry({
		crossAxisCount = 3,
		spacing = 4,
		getItemLength = function(p27) --[[ Line: 745 ]]
			-- upvalues: Buffer (copy)
			return Buffer[p27]
		end
	})
	local RecyclingScope = p23.Adapter.createRecyclingScope({
		adapter = {
			create = function() --[[ Line: 753 ]]
				return {}
			end,
			destroy = function() --[[ Line: 756 ]] end
		}
	})
	local Virtualizer = p23.Adapter.createVirtualizer({
		overscan = 1,
		dataSource = p23.DataSource.snapshot(createItems(Items), function(p27): string --[[ Line: 760 ]]
			return (tostring(p27.id))
		end),
		layout = GridResult,
		recyclingScope = RecyclingScope,
		getItemViewType = function(): string --[[ Line: 765 ]]
			return "row"
		end
	})
	Virtualizer.dispatch({ type = p23.VirtualizerCommandType.Activate })
	Virtualizer.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p23.VirtualizerCommandType.SetViewportSize
	})
	local NewCrossAxisCount = 0
	local ObservablePlacementChecksum = 0
	local NewVersion = 0
	
	local function runCrossAxisTraversal(p27) --[[ Line: 779 ]]
		-- upvalues: ObservablePlacementChecksum (ref), NewVersion (ref), NewCrossAxisCount (ref), ScrollStepCount (copy), Virtualizer (copy), p23 (copy), snapshotPlacementChecksum (upval)
		ObservablePlacementChecksum = 0
		NewVersion = 0
		NewCrossAxisCount = 0
		
		for i = 1, ScrollStepCount do
			local DispatchResult = Virtualizer.dispatch({
				type = p23.VirtualizerCommandType.SetScrollOffset,
				offset = i * 40
			})
			local Snapshot = DispatchResult.snapshot
			NewVersion += Snapshot.version + #Snapshot.entries
			
			if p27 then
				ObservablePlacementChecksum += snapshotPlacementChecksum(DispatchResult.snapshot)
			end
			local VisibleRange = DispatchResult.snapshot.visibleRange
			NewCrossAxisCount += VisibleRange.firstIndex + VisibleRange.lastIndex
			NewCrossAxisCount += Virtualizer.query({
				type = p23.VirtualizerQueryType.GetItemLayout,
				index = VisibleRange.firstIndex
			}).crossAxisCount
		end
	end
	
	local MeasureResult = p24.measure(function() --[[ Line: 797 ]]
		-- upvalues: runCrossAxisTraversal (copy)
		runCrossAxisTraversal(false)
	end, p26)
	runCrossAxisTraversal(true)
	local VisibleRange = Virtualizer.getSnapshot().visibleRange
	local CrossAxisCount = Virtualizer.query({
		type = p23.VirtualizerQueryType.GetItemLayout,
		index = VisibleRange.firstIndex
	}).crossAxisCount
	Virtualizer.dispatch({ type = p23.VirtualizerCommandType.Destroy })
	RecyclingScope.destroy()
	GridResult.destroy()
	assert(NewCrossAxisCount > 0 and NewVersion > 0 and ObservablePlacementChecksum > 0, `{Layout} traversal benchmark did not expose mounted placements`)
	
	return p25.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		responsibility = ResponsibilityCatalogModule.Core.LayoutGeometry,
		workload = `{Layout}-traversal`,
		description = `Traverses representative {Layout} geometry through the complete Virtualizer path.`,
		scale = {
			items = Items,
			scrollSteps = ScrollStepCount,
			layout = Layout
		},
		timing = {
			unit = "ms",
			basis = "scrollTraversal",
			includesSchedulerWaits = false,
			operationsPerSample = ScrollStepCount
		},
		arms = { viewRecycler = MeasureResult },
		evidence = {
			queries = ScrollStepCount,
			crossAxisCount = CrossAxisCount,
			finalVisibleFirst = VisibleRange.firstIndex,
			finalVisibleLast = VisibleRange.lastIndex,
			observablePlacementChecksum = ObservablePlacementChecksum
		}
	})
end

local function measureAtomicMutation(p27, p28, p29, Items, Responsibility, Workload, p30) --[[ Line: 843 ]]
	-- upvalues: createItems (copy), snapshotPlacementChecksum (copy)
	local SequenceResult = p27.DataSource.sequence(createItems(Items), function(p31): string --[[ Line: 852 ]]
		return (tostring(p31.id))
	end)
	local UniformResult = p27.Layout.uniform({ itemLength = 40 })
	local Batches = 0
	local Changes = 0
	local ScrollCorrections = 0
	local NewMagnitude = 0
	local Count = 0
	SequenceResult.subscribe(function(p31) --[[ Line: 861 ]]
		-- upvalues: Batches (ref), Changes (ref)
		Batches += 1
		Changes += #p31.changes
	end)
	local RecyclingScope = p27.Adapter.createRecyclingScope({
		adapter = {
			create = function(): number --[[ Line: 867 ]]
				-- upvalues: Count (ref)
				Count += 1
				
				return Count
			end,
			destroy = function() --[[ Line: 871 ]] end
		}
	})
	local Virtualizer = p27.Adapter.createVirtualizer({
		overscan = 1,
		preserveScrollPositionOnChange = true,
		dataSource = SequenceResult,
		layout = UniformResult,
		recyclingScope = RecyclingScope,
		getItemViewType = function(p31) --[[ Line: 878 ]]
			return p31.kind
		end,
		onUpdate = function(_, p31) --[[ Line: 883 ]]
			-- upvalues: p27 (copy), ScrollCorrections (ref), NewMagnitude (ref)
			for _, effect in p31.effects do
				if effect.type == p27.VirtualizerEffectType.ScrollCorrection then
					ScrollCorrections += 1
					NewMagnitude += math.abs(effect.delta)
				end
			end
		end
	})
	Virtualizer.dispatch({ type = p27.VirtualizerCommandType.Activate })
	Virtualizer.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p27.VirtualizerCommandType.SetViewportSize
	})
	Virtualizer.dispatch({
		offset = 400,
		type = p27.VirtualizerCommandType.SetScrollOffset
	})
	local Count1 = 0
	local NewVersion = 0
	local MeasureResult = p28.measure(function() --[[ Line: 902 ]]
		-- upvalues: Count1 (ref), NewVersion (ref), Virtualizer (copy), SequenceResult (copy)
		Count1 += 1
		NewVersion = 0
		local FirstIndex = Virtualizer.getSnapshot().visibleRange.firstIndex
		local Item = SequenceResult.getItem(FirstIndex)
		SequenceResult.transaction(function() --[[ Line: 907 ]]
			-- upvalues: SequenceResult (upval), FirstIndex (copy), Item (copy), Count1 (upval)
			SequenceResult.setItem(FirstIndex, { id = Item.id, kind = Item.kind })
			SequenceResult.prepend({ kind = "row", id = -Count1 })
			SequenceResult.remove(SequenceResult.getItemCount())
		end)
		local Snapshot = Virtualizer.getSnapshot()
		NewVersion += Snapshot.version + #Snapshot.entries
	end, p30)
	local SnapshotPlacementChecksumResult: number = snapshotPlacementChecksum(Virtualizer.getSnapshot())
	local Largest = 0
	
	for _, ItemView in Virtualizer.query({ type = p27.VirtualizerQueryType.GetItemViews }) do
		local QueryResult = Virtualizer.query({
			type = p27.VirtualizerQueryType.GetPlacementIntent,
			itemView = ItemView
		})
		local MeasurementIdentity = if QueryResult == nil then nil else QueryResult.measurementIdentity
		
		if MeasurementIdentity ~= nil then
			Largest = math.max(Largest, MeasurementIdentity.itemRevision)
		end
	end
	local ScrollOffset = Virtualizer.query({ type = p27.VirtualizerQueryType.GetScrollState }).scrollOffset
	Virtualizer.dispatch({ type = p27.VirtualizerCommandType.Destroy })
	RecyclingScope.destroy()
	UniformResult.destroy()
	assert(Batches > 0 and Changes == Batches * 3, "atomic mutation benchmark did not emit grouped changes")
	assert(Largest > 0 and NewVersion > 0 and SnapshotPlacementChecksumResult > 0, "atomic mutation benchmark did not expose revised placements")
	assert(ScrollCorrections > 0, "atomic mutation benchmark did not preserve its anchor")
	
	return p29.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		description = "Applies one atomic update/prepend/remove batch while preserving the visible anchor and item revisions.",
		responsibility = Responsibility,
		workload = Workload,
		scale = { changesPerTransaction = 3, items = Items },
		timing = {
			unit = "ms",
			basis = "atomicMutation",
			operationsPerSample = 1,
			includesSchedulerWaits = false
		},
		arms = { viewRecycler = MeasureResult },
		evidence = {
			batches = Batches,
			changes = Changes,
			highestItemRevision = Largest,
			scrollCorrections = ScrollCorrections,
			correctionMagnitude = NewMagnitude,
			finalScrollOffset = ScrollOffset,
			observablePlacementChecksum = SnapshotPlacementChecksumResult
		}
	})
end

local function measureOverscanPrefetch(p32, p33, p34, Items, ScrollStepCount: number, p35) --[[ Line: 972 ]]
	-- upvalues: createItems (copy), ResponsibilityCatalogModule (copy)
	local PolicyCalls = 0
	local PrefetchRequests = 0
	local CurrentRequestsObserved = 0
	local UniformResult = p32.Layout.uniform({ itemLength = 40 })
	local RecyclingScope = p32.Adapter.createRecyclingScope({
		adapter = {
			create = function() --[[ Line: 986 ]]
				return {}
			end,
			destroy = function() --[[ Line: 989 ]] end
		}
	})
	local Virtualizer = p32.Adapter.createVirtualizer({
		dataSource = p32.DataSource.snapshot(createItems(Items), function(p36): string --[[ Line: 993 ]]
			return (tostring(p36.id))
		end),
		layout = UniformResult,
		recyclingScope = RecyclingScope,
		getItemViewType = function(): string --[[ Line: 998 ]]
			return "row"
		end,
		overscanPolicy = {
			compute = function(p36) --[[ Line: 1002 ]]
				-- upvalues: PolicyCalls (ref)
				PolicyCalls += 1
				
				return if p36.scrollDirection == "backward" then { before = 3, after = 1 } else { before = 1, after = 3 }
			end
		},
		dataPrefetch = { startItems = 2, endItems = 4 }
	})
	Virtualizer.dispatch({ type = p32.VirtualizerCommandType.Activate })
	Virtualizer.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p32.VirtualizerCommandType.SetViewportSize
	})
	local MeasureResult = p33.measure(function() --[[ Line: 1020 ]]
		-- upvalues: ScrollStepCount (copy), Virtualizer (copy), p32 (copy), PrefetchRequests (ref), CurrentRequestsObserved (ref)
		for i = 1, ScrollStepCount do
			for _, effect in Virtualizer.dispatch({
				type = p32.VirtualizerCommandType.SetScrollOffset,
				offset = i * 40 * 2
			}).effects do
				if effect.type == p32.VirtualizerEffectType.DataPrefetchRequested then
					PrefetchRequests += 1
					
					if effect.request.isCurrent() then
						CurrentRequestsObserved += 1
					end
				end
			end
		end
		Virtualizer.dispatch({
			offset = 40,
			type = p32.VirtualizerCommandType.SetScrollOffset
		})
	end, p35)
	local VisibleRange = Virtualizer.getSnapshot().visibleRange
	local MountedRange = Virtualizer.getSnapshot().mountedRange
	Virtualizer.dispatch({ type = p32.VirtualizerCommandType.Destroy })
	RecyclingScope.destroy()
	UniformResult.destroy()
	assert(PolicyCalls > 0 and PrefetchRequests > 0, "overscan/prefetch benchmark did not exercise both policies")
	local Scale = {
		prefetchStartItems = 2,
		prefetchEndItems = 4,
		items = Items,
		scrollSteps = ScrollStepCount + 1
	}
	local Timing = {
		unit = "ms",
		basis = "overscanPrefetchTraversal",
		includesSchedulerWaits = false,
		operationsPerSample = ScrollStepCount + 1
	}
	local Arms = { viewRecycler = MeasureResult }
	local Evidence = {
		policyCalls = PolicyCalls,
		prefetchRequests = PrefetchRequests,
		currentRequestsObserved = CurrentRequestsObserved,
		visibleItems = VisibleRange.lastIndex - VisibleRange.firstIndex + 1,
		mountedItems = MountedRange.lastIndex - MountedRange.firstIndex + 1
	}
	
	return {
		p34.create({
			suite = "view-recycler-core",
			layer = "core",
			owner = "core",
			timingClass = "integrated",
			workload = "custom-overscan-hysteresis",
			description = "Computes directional custom overscan and maintains the mounted render band.",
			responsibility = ResponsibilityCatalogModule.Core.OverscanHysteresis,
			scale = Scale,
			timing = Timing,
			arms = Arms,
			evidence = Evidence
		}),
		p34.create({
			suite = "view-recycler-core",
			layer = "core",
			owner = "core",
			timingClass = "integrated",
			workload = "edge-data-prefetch",
			description = "Publishes edge-scoped prefetch requests during the same representative traversal.",
			responsibility = ResponsibilityCatalogModule.Core.Prefetch,
			scale = Scale,
			timing = Timing,
			arms = Arms,
			evidence = Evidence
		})
	}
end

local function measurePinnedSticky(p36, p37, p38, Items, OperationsPerSample, p39) --[[ Line: 1095 ]]
	-- upvalues: createItems (copy), BuildPlacementPlanModule (copy), snapshotPlacementChecksum (copy), ResponsibilityCatalogModule (copy)
	local UniformResult = p36.Layout.uniform({ itemLength = 40 })
	local PinnedItems = {
		isItemStickyHeader = function(p40): boolean --[[ Line: 1105 ]]
			return p40.kind == "header"
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
	local SnapshotResult = p36.DataSource.snapshot(createItems(Items), function(p40): string --[[ Line: 1125 ]]
		return (tostring(p40.id))
	end)
	local RecyclingScope = p36.Adapter.createRecyclingScope({
		adapter = {
			create = function() --[[ Line: 1130 ]]
				return {}
			end,
			destroy = function() --[[ Line: 1133 ]] end
		}
	})
	local Virtualizer = p36.Adapter.createVirtualizer({
		overscan = 0,
		dataSource = SnapshotResult,
		layout = UniformResult,
		recyclingScope = RecyclingScope,
		getItemViewType = function(p40) --[[ Line: 1140 ]]
			return p40.kind
		end,
		isItemStickyHeader = PinnedItems.isItemStickyHeader,
		pinnedStartItem = PinnedItems.pinnedStartItem,
		pinnedEndItem = PinnedItems.pinnedEndItem
	})
	Virtualizer.dispatch({ type = p36.VirtualizerCommandType.Activate })
	Virtualizer.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p36.VirtualizerCommandType.SetViewportSize
	})
	Virtualizer.dispatch({
		type = p36.VirtualizerCommandType.SetPolicy,
		policy = {
			overscan = 0,
			overscanPolicy = nil,
			dataPrefetch = nil,
			contentAlignment = nil,
			endThreshold = nil,
			preserveScrollPositionOnChange = true,
			pinnedItems = PinnedItems
		}
	})
	local v3 = nil
	local v4 = nil
	
	for _, ItemView in Virtualizer.query({ type = p36.VirtualizerQueryType.GetItemViews }) do
		local QueryResult = Virtualizer.query({
			type = p36.VirtualizerQueryType.GetPlacementIntent,
			itemView = ItemView
		})
		local MeasurementIdentity = if QueryResult == nil then nil else QueryResult.measurementIdentity
		
		if MeasurementIdentity ~= nil then
			if MeasurementIdentity.itemKey == "$pinned-start" then
				v3 = MeasurementIdentity
			elseif MeasurementIdentity.itemKey == "$pinned-end" then
				v4 = MeasurementIdentity
			end
		end
	end
	assert(v3 ~= nil and v4 ~= nil, "pinned benchmark requires active pinned assignment identities")
	Virtualizer.dispatch({
		type = p36.VirtualizerCommandType.SubmitMeasurements,
		measurements = {
			{
				itemIndex = nil,
				itemKey = "$pinned-start",
				pinnedPosition = "start",
				length = 24,
				assignmentGeneration = v3.assignmentGeneration,
				itemRevision = v3.itemRevision
			},
			{
				itemIndex = nil,
				itemKey = "$pinned-end",
				pinnedPosition = "finish",
				length = 32,
				assignmentGeneration = v4.assignmentGeneration,
				itemRevision = v4.itemRevision
			}
		}
	})
	local NewMainAxisLength = 0
	local NewVersion = 0
	local v5 = nil
	local Snapshot = nil
	local MeasureResult = p37.measure(function() --[[ Line: 1206 ]]
		-- upvalues: NewVersion (ref), OperationsPerSample (copy), Virtualizer (copy), p36 (copy), Snapshot (ref), v5 (ref), BuildPlacementPlanModule (upval), SnapshotResult (copy), UniformResult (copy), PinnedItems (copy), NewMainAxisLength (ref)
		NewVersion = 0
		
		for i = 1, OperationsPerSample do
			local DispatchResult = Virtualizer.dispatch({
				type = p36.VirtualizerCommandType.SetScrollOffset,
				offset = (i + 20) * 40
			})
			Snapshot = DispatchResult.snapshot
			local Snapshot1 = DispatchResult.snapshot
			NewVersion += Snapshot1.version + #Snapshot1.entries
			v5 = BuildPlacementPlanModule({
				viewportLength = 480,
				dataSource = SnapshotResult,
				layout = UniformResult,
				stickyIndices = { 20, 40 },
				scrollOffset = Virtualizer.query({ type = p36.VirtualizerQueryType.GetScrollState }).scrollOffset,
				contentStartOffset = Virtualizer.getSnapshot().contentStartOffset,
				pinnedStartItem = PinnedItems.pinnedStartItem,
				pinnedEndItem = PinnedItems.pinnedEndItem
			})
			NewMainAxisLength += v5.placements["$pinned-start"].mainAxisLength
			NewMainAxisLength += v5.placements["$pinned-end"].mainAxisLength
		end
	end, p39)
	assert(Snapshot ~= nil, "pinned/sticky benchmark did not retain a committed snapshot")
	local SnapshotPlacementChecksumResult: number = snapshotPlacementChecksum(Snapshot)
	local v6 = v5
	local _20 = v6.placements["20"]
	local _40 = v6.placements["40"]
	local ViewportRelative = if _20 == nil then _40 ~= nil and _40.viewportRelative else _20.viewportRelative or _40 ~= nil and _40.viewportRelative
	local PinnedStart = v6.placements["$pinned-start"]
	local PinnedEnd = v6.placements["$pinned-end"]
	local ContentStartOffset = Virtualizer.getSnapshot().contentStartOffset
	Virtualizer.dispatch({ type = p36.VirtualizerCommandType.Destroy })
	RecyclingScope.destroy()
	UniformResult.destroy()
	assert(NewMainAxisLength > 0 and (NewVersion > 0 and SnapshotPlacementChecksumResult > 0) and ViewportRelative, "pinned/sticky benchmark did not expose viewport placements")
	
	return p38.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "sticky-pinned-placement",
		description = "Plans sticky retention, synthetic pinned assignments, and pinned content insets.",
		responsibility = ResponsibilityCatalogModule.Core.PinnedSticky,
		scale = {
			pinnedItems = 2,
			items = Items,
			scrollSteps = OperationsPerSample
		},
		timing = {
			unit = "ms",
			basis = "pinnedStickyTraversal",
			includesSchedulerWaits = false,
			operationsPerSample = OperationsPerSample
		},
		arms = { viewRecycler = MeasureResult },
		evidence = {
			stickyViewportRelative = ViewportRelative,
			pinnedStartOffset = PinnedStart.mainAxisOffset,
			pinnedEndOffset = PinnedEnd.mainAxisOffset,
			contentStartOffset = ContentStartOffset,
			observablePlacementChecksum = SnapshotPlacementChecksumResult
		}
	})
end

local function measureScrollPolicy(p40, p41, p42, OperationsPerSample, p43) --[[ Line: 1278 ]]
	-- upvalues: ResponsibilityCatalogModule (copy)
	local InitialScrolls = 0
	local EndFollowWrites = 0
	local PaginationHits = 0
	local HostOffsetChecksum = 0
	
	local function runScrollPolicy() --[[ Line: 1289 ]]
		-- upvalues: OperationsPerSample (copy), p40 (copy), InitialScrolls (ref), EndFollowWrites (ref), HostOffsetChecksum (ref), PaginationHits (ref)
		for _ = 1, OperationsPerSample do
			local ContentLength = 200
			local ScrollOffset = 170
			local Flag = true
			local Coordinator = p40.Adapter.ScrollPolicy.createCoordinator({
				getItemCount = function(): number --[[ Line: 1295 ]]
					return 20
				end,
				getScrollState = function() --[[ Line: 1298 ]]
					-- upvalues: ContentLength (ref), ScrollOffset (ref)
					local Largest = math.max(0, ContentLength - 30 - ScrollOffset)
					
					return {
						viewportLength = 30,
						scrollOffset = ScrollOffset,
						contentLength = ContentLength,
						distanceFromEnd = Largest,
						atStart = ScrollOffset == 0,
						atEnd = Largest <= 1
					}
				end,
				getScrollOffsetForItem = function(p44: number): number --[[ Line: 1309 ]]
					return p44 * 10
				end,
				applyScrollAnchorOffset = function(Amount) --[[ Line: 1312 ]]
					-- upvalues: Flag (ref), InitialScrolls (upval), EndFollowWrites (upval), ScrollOffset (ref), HostOffsetChecksum (upval)
					if Flag then
						InitialScrolls += 1
						Flag = false
					else
						EndFollowWrites += 1
					end
					ScrollOffset = Amount
					HostOffsetChecksum += Amount
					
					return Amount
				end,
				getViewportState = function() --[[ Line: 1323 ]]
					-- upvalues: ScrollOffset (ref)
					return { viewportLength = 30, scrollOffset = ScrollOffset }
				end,
				getInitialScrollAlignment = function() --[[ Line: 1326 ]]
					-- upvalues: p40 (upval)
					return p40.ScrollAlignment.End
				end,
				getAutoScrollPolicy = function() --[[ Line: 1329 ]]
					-- upvalues: p40 (upval)
					return p40.AutoScrollPolicy.WhenAtEnd
				end,
				getStartReachedThreshold = function(): number --[[ Line: 1332 ]]
					return 0
				end,
				getOnStartReached = function() --[[ Line: 1335 ]]
					return nil
				end,
				getOnEndReached = function() --[[ Line: 1338 ]]
					-- upvalues: PaginationHits (upval)
					return function() --[[ Line: 1339 ]]
						-- upvalues: PaginationHits (upval)
						PaginationHits += 1
					end
				end
			})
			Coordinator.onViewportChanged()
			Coordinator.onDataSourceChanged({
				previousItemCount = 20,
				itemCount = 21,
				changes = {
					{
						index = 21,
						type = p40.DataSourceChangeType.Insert,
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
			ContentLength = 220
			Coordinator.onContentLengthChanged(ContentLength)
			Coordinator.checkEdges()
		end
	end
	
	local MeasureResult = p41.measure(runScrollPolicy, p43)
	InitialScrolls = 0
	EndFollowWrites = 0
	PaginationHits = 0
	HostOffsetChecksum = 0
	runScrollPolicy()
	assert(InitialScrolls > 0 and EndFollowWrites > 0 and PaginationHits > 0, "scroll policy benchmark missed a policy phase")
	
	return p42.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "phased",
		workload = "initial-follow-pagination-policy",
		description = "Coordinates initial end alignment, end-follow settlement, and pagination edge delivery.",
		responsibility = ResponsibilityCatalogModule.Core.ScrollPolicy,
		scale = {
			initialAlignment = "end",
			autoScroll = "whenAtEnd",
			policyCycles = OperationsPerSample
		},
		timing = {
			unit = "ms",
			basis = "scrollPolicyCycle",
			includesSchedulerWaits = false,
			operationsPerSample = OperationsPerSample
		},
		arms = { viewRecycler = MeasureResult },
		evidence = {
			initialScrolls = InitialScrolls,
			endFollowWrites = EndFollowWrites,
			paginationHits = PaginationHits,
			hostOffsetChecksum = HostOffsetChecksum
		}
	})
end

local function measureRecyclingScopeRetention(p44, p45, p46, ItemsPerBatch, Batches, p47) --[[ Line: 1405 ]]
	-- upvalues: ResponsibilityCatalogModule (copy)
	local Creations = 0
	local Evictions = 0
	local LeaseTokensObserved = 0
	local RecyclingScope = p44.Adapter.createRecyclingScope({
		maxPoolSize = 4,
		adapter = {
			create = function() --[[ Line: 1418 ]]
				-- upvalues: Creations (ref)
				Creations += 1
				
				return { id = Creations }
			end,
			destroy = function() --[[ Line: 1422 ]]
				-- upvalues: Evictions (ref)
				Evictions += 1
			end
		}
	})
	local t = {}
	local MeasureResult = p45.measure(function() --[[ Line: 1429 ]]
		-- upvalues: Batches (copy), ItemsPerBatch (copy), RecyclingScope (copy), t (copy), LeaseTokensObserved (ref)
		for _ = 1, Batches do
			local Buffer = table.create(ItemsPerBatch)
			
			for i = 1, ItemsPerBatch do
				Buffer[i] = { viewType = "row" }
			end
			local Acquired = RecyclingScope.exchange(t, {}, Buffer).acquired
			LeaseTokensObserved += #Acquired
			RecyclingScope.exchange(t, Acquired, {})
		end
	end, p47)
	local Count = #RecyclingScope.getVacantViews()
	RecyclingScope.destroy()
	assert(Count == 4 and Evictions > 0 and LeaseTokensObserved > 0, "RecyclingScope retention benchmark did not apply retention pressure with Lease tokens")
	
	return p46.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "integrated",
		workload = "recycling-scope-retention-pressure",
		description = "Acquires and releases Lease batches above the RecyclingScope per-type vacancy limit.",
		responsibility = ResponsibilityCatalogModule.Core.RecyclingScope,
		scale = {
			maxVacanciesPerType = 4,
			itemsPerBatch = ItemsPerBatch,
			batches = Batches
		},
		timing = {
			unit = "ms",
			basis = "recyclingScopePressureBatch",
			includesSchedulerWaits = false,
			operationsPerSample = Batches
		},
		arms = { viewRecycler = MeasureResult },
		evidence = {
			creations = Creations,
			evictions = Evictions,
			retainedVacancies = Count,
			leaseTokensObserved = LeaseTokensObserved
		}
	})
end

local function measureActiveToggle(p48, p49, p50, Items, OperationsPerSample, p51) --[[ Line: 1479 ]]
	-- upvalues: SignalsModule (copy), createItems (copy), ResponsibilityCatalogModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(true)
	local ReleasedAssignments = 0
	local UniformResult = p48.Layout.uniform({ itemLength = 40 })
	local RecyclingScope = p48.Adapter.createRecyclingScope({
		adapter = {
			create = function() --[[ Line: 1492 ]]
				return {}
			end,
			destroy = function() --[[ Line: 1495 ]] end
		}
	})
	local Virtualizer = p48.Adapter.createVirtualizer({
		dataSource = p48.DataSource.snapshot(createItems(Items), function(p52): string --[[ Line: 1499 ]]
			return (tostring(p52.id))
		end),
		layout = UniformResult,
		recyclingScope = RecyclingScope,
		getItemViewType = function(): string --[[ Line: 1504 ]]
			return "row"
		end,
		postCommitAssignment = function(_, p52) --[[ Line: 1507 ]]
			-- upvalues: ReleasedAssignments (ref)
			if p52 == nil then
				ReleasedAssignments += 1
			end
		end,
		active = Signal
	})
	Virtualizer.dispatch({ type = p48.VirtualizerCommandType.Activate })
	Virtualizer.dispatch({
		scrollAxisLength = 480,
		crossAxisLength = 800,
		type = p48.VirtualizerCommandType.SetViewportSize
	})
	local MeasureResult = p49.measure(function() --[[ Line: 1520 | Named "runActiveToggle" ]]
		-- upvalues: OperationsPerSample (copy), Signal2 (copy)
		for _ = 1, OperationsPerSample do
			Signal2(false)
			Signal2(true)
		end
	end, p51)
	ReleasedAssignments = 0
	
	for _ = 1, OperationsPerSample do
		Signal2(false)
		Signal2(true)
	end
	local Count = #Virtualizer.query({ type = p48.VirtualizerQueryType.GetItemViews })
	Virtualizer.dispatch({ type = p48.VirtualizerCommandType.Destroy })
	RecyclingScope.destroy()
	UniformResult.destroy()
	assert(ReleasedAssignments > 0 and Count > 0, "active toggle benchmark did not release and reactivate")
	
	return p50.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "active-state-toggle",
		description = "Releases all assignments while inactive and synchronizes the latest desired window on reactivation.",
		responsibility = ResponsibilityCatalogModule.Core.ListPresentation,
		scale = { items = Items, toggles = OperationsPerSample },
		timing = {
			unit = "ms",
			basis = "deactivateReactivate",
			includesSchedulerWaits = false,
			operationsPerSample = OperationsPerSample
		},
		arms = { viewRecycler = MeasureResult },
		evidence = {
			releasedAssignments = ReleasedAssignments,
			mountedAfterReactivation = Count
		}
	})
end

local function measureLifecycle(p52, p53, p54, Items, Responsibility, Workload, p55) --[[ Line: 1562 ]]
	-- upvalues: createItems (copy)
	local Initialized = 0
	local Destroyed = 0
	local MountedAssignments = 0
	local ReleasedAssignments = 0
	
	local function runLifecycle() --[[ Line: 1575 ]]
		-- upvalues: p52 (copy), createItems (upval), Items (copy), ReleasedAssignments (ref), Initialized (ref), MountedAssignments (ref), Destroyed (ref)
		local UniformResult = p52.Layout.uniform({ itemLength = 40 })
		local RecyclingScope = p52.Adapter.createRecyclingScope({
			adapter = {
				create = function() --[[ Line: 1579 ]]
					return {}
				end,
				destroy = function() --[[ Line: 1582 ]] end
			}
		})
		local Virtualizer = p52.Adapter.createVirtualizer({
			dataSource = p52.DataSource.snapshot(createItems(Items), function(p56): string --[[ Line: 1586 ]]
				return (tostring(p56.id))
			end),
			layout = UniformResult,
			recyclingScope = RecyclingScope,
			getItemViewType = function(): string --[[ Line: 1591 ]]
				return "row"
			end,
			postCommitAssignment = function(_, p56) --[[ Line: 1594 ]]
				-- upvalues: ReleasedAssignments (upval)
				if p56 == nil then
					ReleasedAssignments += 1
				end
			end
		})
		Virtualizer.dispatch({ type = p52.VirtualizerCommandType.Activate })
		Virtualizer.dispatch({
			scrollAxisLength = 480,
			crossAxisLength = 800,
			type = p52.VirtualizerCommandType.SetViewportSize
		})
		Initialized += 1
		MountedAssignments += #Virtualizer.query({ type = p52.VirtualizerQueryType.GetItemViews })
		Virtualizer.dispatch({ type = p52.VirtualizerCommandType.Destroy })
		RecyclingScope.destroy()
		UniformResult.destroy()
		Destroyed += 1
	end
	
	local MeasureResult = p53.measure(runLifecycle, p55)
	Initialized = 0
	Destroyed = 0
	MountedAssignments = 0
	ReleasedAssignments = 0
	runLifecycle()
	assert(Initialized > 0 and Initialized == Destroyed and ReleasedAssignments > 0, "lifecycle benchmark did not complete cleanup")
	
	return p54.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "phased",
		description = "Builds a populated Virtualizer lifecycle and synchronously releases all owned resources.",
		responsibility = Responsibility,
		workload = Workload,
		scale = { items = Items },
		timing = {
			unit = "ms",
			basis = "virtualizerLifecycle",
			operationsPerSample = 1,
			includesSchedulerWaits = false
		},
		arms = { viewRecycler = MeasureResult },
		evidence = {
			initialized = Initialized,
			destroyed = Destroyed,
			mountedAssignments = MountedAssignments,
			releasedAssignments = ReleasedAssignments
		}
	})
end

return {
	run = function(p52, p53, p54, p55) --[[ Line: 1652 ]]
		-- upvalues: list (copy), measureTraversal (copy), ResponsibilityCatalogModule (copy), measureCrossAxisTraversal (copy), measureCoordinator (copy), measureWithinBand (copy), measureLifecycle (copy), measureAtomicMutation (copy), measureOverscanPrefetch (copy), measureProgrammaticScroll (copy), measureMeasurementAnchoring (copy), measurePinnedSticky (copy), measureScrollPolicy (copy), measureRecyclingScopeRetention (copy), measureActiveToggle (copy)
		local P129 = p55 or {}
		local ItemCounts = P129.itemCounts or list
		local ScrollStepCount = P129.scrollStepCount or 100
		local CoordinatorItemCount = P129.coordinatorItemCount or 40
		local CoordinatorStepCount = P129.coordinatorStepCount or 100
		assert(ScrollStepCount >= 1 and ScrollStepCount % 1 == 0, "scrollStepCount must be a positive integer")
		assert(#ItemCounts > 0, "itemCounts must not be empty")
		local List = {}
		
		for _, itemCount in ItemCounts do
			assert(itemCount >= 1 and itemCount % 1 == 0, "item counts must be positive integers")
			table.insert(List, measureTraversal(p52, p53, p54, itemCount, ScrollStepCount, false, false, "jump", "uniform-traversal", "Runs the complete Virtualizer scroll, range, placement, and recycling path for a uniform layout.", ResponsibilityCatalogModule.Core.LayoutGeometry, P129))
			table.insert(List, measureTraversal(p52, p53, p54, itemCount, ScrollStepCount, true, false, "jump", "measured-offset-traversal", "Runs measured-layout offset lookup and propagation without submitting new item sizes.", ResponsibilityCatalogModule.Core.LayoutGeometry, P129))
			table.insert(List, measureTraversal(p52, p53, p54, itemCount, ScrollStepCount, true, true, "jump", "measured-update-traversal", "Runs the complete measured Virtualizer path and submits mounted-item size batches at every step.", ResponsibilityCatalogModule.Core.Measurement, P129))
			table.insert(List, measureCrossAxisTraversal(p52, p53, p54, itemCount, ScrollStepCount, "grid", P129))
			table.insert(List, measureCrossAxisTraversal(p52, p53, p54, itemCount, ScrollStepCount, "masonry", P129))
		end
		local ItemCount: number = ItemCounts[1]
		assert(ItemCount >= 40, "the smallest item count must cover sticky and mutation workloads")
		
		for _, value in { "short", "jump" } do
			table.insert(List, measureTraversal(p52, p53, p54, ItemCount, ScrollStepCount, false, false, value, "recycling-assignment-churn", "Contrasts nearby scrolling with large jumps through the same uniform Virtualizer.", ResponsibilityCatalogModule.Core.ListPresentation, P129))
		end
		for _, value2 in { "retained", "churn" } do
			table.insert(List, measureCoordinator(p52, p53, p54, CoordinatorItemCount, CoordinatorStepCount, value2, P129))
		end
		table.insert(List, measureWithinBand(p52, p53, p54, ItemCounts[1], ScrollStepCount, P129))
		table.insert(List, measureLifecycle(p52, p53, p54, ItemCount, ResponsibilityCatalogModule.Core.Initialization, "virtualizer-initialization", P129))
		table.insert(List, measureAtomicMutation(p52, p53, p54, ItemCount, ResponsibilityCatalogModule.Core.DataMutation, "atomic-data-mutation", P129))
		table.insert(List, measureAtomicMutation(p52, p53, p54, ItemCount, ResponsibilityCatalogModule.Core.DataAnchoring, "atomic-anchor-preservation", P129))
		
		for _, value1 in measureOverscanPrefetch(p52, p53, p54, ItemCount, ScrollStepCount, P129) do
			table.insert(List, value1)
		end
		table.insert(List, measureProgrammaticScroll(p52, p53, p54, ItemCount, ScrollStepCount, P129))
		table.insert(List, measureMeasurementAnchoring(p52, p53, p54, ItemCount, ScrollStepCount, P129))
		table.insert(List, measurePinnedSticky(p52, p53, p54, ItemCount, ScrollStepCount, P129))
		table.insert(List, measureScrollPolicy(p52, p53, p54, ScrollStepCount, P129))
		table.insert(List, measureRecyclingScopeRetention(p52, p53, p54, CoordinatorItemCount, CoordinatorStepCount, P129))
		table.insert(List, measureActiveToggle(p52, p53, p54, ItemCount, ScrollStepCount, P129))
		table.insert(List, measureLifecycle(p52, p53, p54, ItemCount, ResponsibilityCatalogModule.Core.Teardown, "virtualizer-teardown", P129))
		
		return List
	end
}