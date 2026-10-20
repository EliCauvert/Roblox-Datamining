local ResponsibilityCatalogModule = require(script.Parent.ResponsibilityCatalog)
local ScrollPolicyModule = require(script:FindFirstAncestor("ViewRecycler").Core.ViewportBehavior.ScrollPolicy)
local list = { 1000, 100000 }

local function createItems(Items)
	local Buffer = table.create(Items)
	
	for i = 1, Items do
		Buffer[i] = { id = i, kind = if i % 20 == 0 then "header" else "row" }
	end
	return Buffer
end

local function createOffsets(Items: number, OperationsPerSample: number, ScrollPattern)
	local Largest = math.max(0, Items * 40 - 480)
	local Buffer = table.create(OperationsPerSample)
	
	if ScrollPattern == "slide" then
		for i = 1, OperationsPerSample do
			Buffer[i] = math.min(Largest, i * 40)
		end
		return Buffer
	else
		for i1 = 1, OperationsPerSample - 1 do
			if ScrollPattern == "short" then
				Buffer[i1] = math.min(Largest, i1 * 40)
			else
				Buffer[i1] = math.floor(i1 * 7919 % 104729 / 104729 * Largest)
			end
		end
		Buffer[OperationsPerSample] = 0
		
		return Buffer
	end
end

local function recordPlacementChecksum(SetScrollOffsetResult): number
	local NewStartOffset = 0
	
	for _, mountedView in SetScrollOffsetResult.mountedViews do
		local State = mountedView.state
		NewStartOffset = NewStartOffset + State.itemLayout.startOffset + (State.canvasPlacement.mainAxisOffset or 0) + (if State.viewportPlacement == nil then 0 else State.viewportPlacement.mainAxisOffset or 0)
	end
	return NewStartOffset
end

local function _(p1): number
	return p1.contentLength + #p1.mountedViews
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

local _ = function(Counters, p1)
	Counters.synchronizations = 0
	Counters.reassignedAssignments = 0
	Counters.acquiredAssignments = 0
	Counters.releasedAssignments = 0
	Counters.acceptedMeasurements = 0
	
	if p1 then
		Counters.touchedKeys = 0
		Counters.logicalKeyReads = 0
		Counters.layoutItemReads = 0
		Counters.payloadReads = 0
		Counters.viewTypeReads = 0
		Counters.publicationCallbacks = 0
	end
end

local function createBoundedRecyclingScope(p1, p2, Items)
	local RecyclingScope = p1.Adapter.createRecyclingScope(p2)
	
	return {
		bind = function(Tbl)
			-- upvalues: Items (copy), RecyclingScope (copy)
			local Copy = table.clone(Tbl)
			Copy.capacity = Items
			
			return RecyclingScope.bind(Copy)
		end,
		dispose = RecyclingScope.dispose
	}
end

local function createVirtualizer(p1, Items, p2, p3)
	-- upvalues: createBoundedRecyclingScope (copy), createItems (copy)
	local Count = 0
	local config = {
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
	local MeasuredResult = if p2 then p1.Layout.measured({ estimatedItemLength = 40 }) else p1.Layout.uniform({ itemLength = 40 })
	local Layout = nil
	
	if p2 and p3 then
		local Copy = table.clone(MeasuredResult)
		
		function Copy.getItemLayout(FirstIndex)
			-- upvalues: config (copy), MeasuredResult (copy)
			local v1 = config
			v1.layoutItemReads += 1
			
			return MeasuredResult.getItemLayout(FirstIndex)
		end
		
		function Copy.getItemLayouts(p4, p5, p6)
			-- upvalues: config (copy), MeasuredResult (copy)
			local v1 = config
			v1.layoutItemReads += math.max(0, p5 - p4 + 1)
			
			return MeasuredResult.getItemLayouts(p4, p5, p6)
		end
		
		Layout = Copy
	else
		Layout = MeasuredResult
	end
	local BoundedRecyclingScope = createBoundedRecyclingScope(p1, {
		adapter = {
			create = function(): number
				-- upvalues: Count (ref)
				Count += 1
				
				return Count
			end,
			destroy = function() end
		}
	}, 4)
	local SnapshotResult = p1.DataSource.snapshot(createItems(Items), function(p4): string
		return (tostring(p4.id))
	end)
	local DataSource = nil
	
	if p3 then
		local Copy = table.clone(SnapshotResult)
		
		function Copy.getItemKey(p4)
			-- upvalues: config (copy), SnapshotResult (copy)
			local v1 = config
			v1.logicalKeyReads += 1
			
			return SnapshotResult.getItemKey(p4)
		end
		
		function Copy.getItem(p4)
			-- upvalues: config (copy), SnapshotResult (copy)
			local v1 = config
			v1.payloadReads += 1
			
			return SnapshotResult.getItem(p4)
		end
		
		DataSource = Copy
	else
		DataSource = SnapshotResult
	end
	local Virtualizer = p1.Adapter.createVirtualizer({
		overscan = 2,
		dataSource = DataSource,
		layout = Layout,
		recyclingScope = BoundedRecyclingScope,
		getItemViewType = if p3 then function(p4)
			-- upvalues: config (copy)
			config.viewTypeReads += 1
			
			return p4.kind
		end else function(p4)
			return p4.kind
		end,
		diagnostics = function(p4)
			-- upvalues: config (copy), p3 (copy)
			if p4.kind == "itemViewsSynchronized" then
				config.synchronizations += 1
				config.reassignedAssignments += p4.reassigned
				config.acquiredAssignments += p4.acquired
				config.releasedAssignments += p4.released
				
				if p3 then
					config.touchedKeys += p4.touched
					config.publicationCallbacks += p4.reassigned + p4.acquired + p4.released
					
					return
				end
			elseif p4.kind == "measurementsProcessed" then
				config.acceptedMeasurements += p4.accepted
			end
		end
	})
	Virtualizer.activate()
	Virtualizer.setViewportSize(480, 800)
	
	return Virtualizer, Layout, config, BoundedRecyclingScope
end

local function measureTraversal(p1, p2, p3, Items, ScrollStepCount: number, p4, SubmitsMeasurements, ScrollPattern, Workload, Description, ListRows, p5)
	-- upvalues: createVirtualizer (copy), createOffsets (copy), recordPlacementChecksum (copy)
	local Virtualizer, Virtualizer2, Virtualizer3, Virtualizer4 = createVirtualizer(p1, Items, p4)
	local Offsets = createOffsets(Items, ScrollStepCount, ScrollPattern)
	local v1 = 0
	local NewFirstIndex = 0
	local ObservablePlacementChecksum = 0
	local SubmittedMeasurements = 0
	local NewContentLength = 0
	local Largest = 0
	
	local function runTraversal(p6)
		-- upvalues: Virtualizer3 (ref), SubmittedMeasurements (ref), ObservablePlacementChecksum (ref), NewContentLength (ref), NewFirstIndex (ref), Largest (ref), v1 (ref), Offsets (copy), Virtualizer (ref), recordPlacementChecksum (upval), SubmitsMeasurements (copy)
		local Counters = Virtualizer3
		Counters.synchronizations = 0
		Counters.reassignedAssignments = 0
		Counters.acquiredAssignments = 0
		Counters.releasedAssignments = 0
		Counters.acceptedMeasurements = 0
		
		if p6 then
			Counters.touchedKeys = 0
			Counters.logicalKeyReads = 0
			Counters.layoutItemReads = 0
			Counters.payloadReads = 0
			Counters.viewTypeReads = 0
			Counters.publicationCallbacks = 0
		end
		SubmittedMeasurements = 0
		ObservablePlacementChecksum = 0
		NewContentLength = 0
		NewFirstIndex = 0
		Largest = 0
		v1 = (v1 + 1) % 5
		
		for _, offset in Offsets do
			local SetScrollOffsetResult = Virtualizer.setScrollOffset(offset)
			NewContentLength += SetScrollOffsetResult.contentLength + #SetScrollOffsetResult.mountedViews
			
			if p6 then
				ObservablePlacementChecksum += recordPlacementChecksum(SetScrollOffsetResult)
				Largest = math.max(Largest, #SetScrollOffsetResult.mountedViews)
			end
			if SubmitsMeasurements then
				local List = {}
				
				for _, mountedView in SetScrollOffsetResult.mountedViews do
					local ItemView = mountedView.itemView
					local State = mountedView.state
					
					if State ~= nil and State.index ~= nil then
						table.insert(List, {
							itemView = ItemView,
							state = State,
							length = 36 + (State.index + v1) % 5 * 2
						})
					end
				end
				SubmittedMeasurements += #List
				local SubmitMeasurementsResult = Virtualizer.submitMeasurements(List)
				NewContentLength += SubmitMeasurementsResult.contentLength + #SubmitMeasurementsResult.mountedViews
				
				if p6 then
					ObservablePlacementChecksum += recordPlacementChecksum(SubmitMeasurementsResult)
					Largest = math.max(Largest, #SubmitMeasurementsResult.mountedViews)
				end
				NewFirstIndex += #List
			end
		end
		local VisibleRange = Virtualizer.getCurrent().visibleRange
		NewFirstIndex += VisibleRange.firstIndex + VisibleRange.lastIndex
	end
	
	local MeasureResult = p2.measure(function()
		-- upvalues: runTraversal (copy)
		runTraversal(false)
	end, p5)
	Virtualizer.destroy()
	Virtualizer4.dispose()
	Virtualizer2.destroy()
	local Virtualizer1, Virtualizer2_1, Virtualizer3_1, Virtualizer4_1 = createVirtualizer(p1, Items, p4, true)
	runTraversal(true)
	local MountedItemViews: number = Largest
	local ScaledScrollStepCount = ScrollStepCount * (if SubmitsMeasurements then 2 else 1)
	local ScaledScrollStepCount1 = if ScrollPattern == "slide" then ScrollStepCount * 2 else Virtualizer3_1.synchronizations * MountedItemViews * 2
	local NewScrollStepCount = if p4 and ScrollPattern == "slide" then ScrollStepCount * 3 + 2 else nil
	local TouchedKeys = Virtualizer3_1.touchedKeys
	local ScaledSynchronizations = Virtualizer3_1.synchronizations * MountedItemViews * (if ScrollPattern == "jump" then 2 else 1)
	local ScaledTouchedKeys = Virtualizer3_1.touchedKeys * 2
	Virtualizer1.destroy()
	Virtualizer4_1.dispose()
	Virtualizer2_1.destroy()
	assert(NewFirstIndex > 0 and NewContentLength > 0 and ObservablePlacementChecksum > 0, `{Workload} benchmark did not expose mounted placements`)
	assert(Virtualizer3_1.synchronizations <= ScaledScrollStepCount, `{Workload} synchronized more than once per accepted scroll or measurement mutation`)
	
	if Workload == "one-row-window-slide" or Workload == "measured-one-row-window-slide" or Workload == "disjoint-window-jump" then
		if Workload == "one-row-window-slide" or Workload == "measured-one-row-window-slide" then
			assert(Virtualizer3_1.logicalKeyReads <= ScaledScrollStepCount1, `{Workload} exceeded its two-key-reads-per-row budget ({Virtualizer3_1.logicalKeyReads} > {ScaledScrollStepCount1})`)
			
			if p4 then
				assert(Virtualizer3_1.layoutItemReads <= NewScrollStepCount, `{Workload} exceeded its edge-and-band Layout-read budget ({Virtualizer3_1.layoutItemReads} > {NewScrollStepCount})`)
			end
		else
			assert(Virtualizer3_1.logicalKeyReads <= ScaledScrollStepCount1, `{Workload} exceeded its logical-key read budget ({Virtualizer3_1.logicalKeyReads} > {ScaledScrollStepCount1})`)
		end
		assert(Virtualizer3_1.payloadReads <= TouchedKeys, `{Workload} exceeded its payload-read budget`)
		assert(Virtualizer3_1.viewTypeReads <= TouchedKeys, `{Workload} exceeded its view-type read budget`)
		assert(Virtualizer3_1.touchedKeys <= ScaledSynchronizations, `{Workload} exceeded its reconciler touch budget ({Virtualizer3_1.touchedKeys} > {ScaledSynchronizations})`)
		assert(Virtualizer3_1.publicationCallbacks <= ScaledTouchedKeys, `{Workload} exceeded its publication callback budget`)
	end
	return p3.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		responsibility = ListRows,
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
			mountedItemViews = MountedItemViews,
			synchronizations = Virtualizer3_1.synchronizations,
			settlementSynchronizationBudget = ScaledScrollStepCount,
			logicalKeyReadBudget = ScaledScrollStepCount1,
			layoutItemReadBudget = NewScrollStepCount,
			enrichmentReadBudget = TouchedKeys,
			touchedKeyBudget = ScaledSynchronizations,
			publicationCallbackBudget = ScaledTouchedKeys,
			reassignedAssignments = Virtualizer3_1.reassignedAssignments,
			acquiredAssignments = Virtualizer3_1.acquiredAssignments,
			releasedAssignments = Virtualizer3_1.releasedAssignments,
			touchedKeys = Virtualizer3_1.touchedKeys,
			logicalKeyReads = Virtualizer3_1.logicalKeyReads,
			layoutItemReads = Virtualizer3_1.layoutItemReads,
			payloadReads = Virtualizer3_1.payloadReads,
			viewTypeReads = Virtualizer3_1.viewTypeReads,
			publicationCallbacks = Virtualizer3_1.publicationCallbacks,
			submittedMeasurements = SubmittedMeasurements,
			acceptedMeasurements = Virtualizer3_1.acceptedMeasurements,
			observablePlacementChecksum = ObservablePlacementChecksum
		}
	})
end

local function measureCoordinator(p7, p8, p9, Capacity, OperationsPerSample, Pattern, p10)
	-- upvalues: ResponsibilityCatalogModule (copy)
	local function createFixture(p11)
		-- upvalues: p7 (copy), Capacity (copy), Pattern (copy), OperationsPerSample (copy)
		local Count = 0
		local Count1 = 0
		local Total = 0
		local Count2 = 0
		local RecyclingScope = p7.Adapter.createRecyclingScope({
			adapter = {
				create = function(): number
					-- upvalues: Count (ref)
					Count += 1
					
					return Count
				end,
				destroy = function() end
			},
			onPoolChanged = if p11 then function()
				-- upvalues: Count1 (ref)
				Count1 += 1
			end else nil
		})
		local Buffer = table.create(Capacity)
		local Buffer1 = table.create(Capacity)
		
		for i = 1, Capacity do
			Buffer[i] = { key = `a{i}`, index = i, value = i }
			Buffer1[i] = if Pattern == "retained" then Buffer[i] else { key = `b{i}`, index = i, value = i }
		end
		local Releases = {}
		local t = {}
		
		local function synchronize(List)
			-- upvalues: t (ref), RecyclingScope (copy), Capacity (upval), Count2 (ref), Total (ref), Releases (ref)
			local Releases1 = {}
			local Requests = {}
			local List1 = {}
			local t1 = {}
			
			for _, value in List do
				local Entry = t[value.key]
				
				if Entry == nil then
					table.insert(Requests, { viewType = "row" })
					table.insert(List1, value)
				else
					t1[value.key] = Entry
				end
			end
			for i, value1 in t do
				if t1[i] == nil then
					table.insert(Releases1, value1)
				end
			end
			local BindResult = RecyclingScope.bind({
				releases = Releases1,
				requests = Requests,
				capacity = Capacity
			})
			Count2 += 1
			Total += #BindResult.acquired
			
			for i1, value2 in BindResult.acquired do
				t1[List1[i1].key] = value2
			end
			t = t1
			Releases = table.create(#List)
			
			for i2, value3 in List do
				Releases[i2] = t[value3.key]
			end
		end
		
		synchronize(Buffer)
		local Inverted = false
		
		return {
			run = function()
				-- upvalues: OperationsPerSample (upval), Inverted (ref), synchronize (copy), Buffer1 (copy), Buffer (copy)
				for _ = 1, OperationsPerSample do
					Inverted = not Inverted
					synchronize(if Inverted then Buffer1 else Buffer)
				end
			end,
			getDiagnosticEvents = function()
				-- upvalues: Count1 (ref)
				return Count1
			end,
			getAcquiredViews = function()
				-- upvalues: Total (ref)
				return Total
			end,
			getCreatedViews = function()
				-- upvalues: Count (ref)
				return Count
			end,
			getSubmissions = function()
				-- upvalues: Count2 (ref)
				return Count2
			end,
			destroy = function()
				-- upvalues: RecyclingScope (copy), Releases (ref), Capacity (upval), t (ref)
				RecyclingScope.bind({ releases = Releases, requests = {}, capacity = Capacity })
				Releases = {}
				t = {}
				RecyclingScope.dispose()
			end
		}
	end
	
	local Fixture = createFixture(false)
	local Fixture1 = createFixture(true)
	local MeasureResult = p8.measure(Fixture.run, p10)
	local MeasureResult1 = p8.measure(Fixture1.run, p10)
	local DiagnosticEvents = Fixture1.getDiagnosticEvents()
	local AcquiredViews = Fixture.getAcquiredViews()
	local CreatedViews = Fixture.getCreatedViews()
	local Submissions = Fixture.getSubmissions()
	Fixture.destroy()
	Fixture1.destroy()
	
	return p9.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "integrated",
		workload = "typed-pool-submission-sync",
		description = "Submits retained or fully replaced desired keys through one typed Recycling pool.",
		responsibility = ResponsibilityCatalogModule.Core.Diagnostics,
		scale = {
			items = Capacity,
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
			createdViews = CreatedViews,
			acquiredViews = AcquiredViews,
			submissions = Submissions,
			diagnosticEvents = DiagnosticEvents
		}
	})
end

local function measureSubItemScrolling(p12, p13, p14, Items, ScrollStepCount, p15)
	-- upvalues: createVirtualizer (copy), recordPlacementChecksum (copy), ResponsibilityCatalogModule (copy)
	local function createArm(p16, p17)
		-- upvalues: createVirtualizer (upval), p12 (copy), Items (copy), ScrollStepCount (copy), recordPlacementChecksum (upval)
		local Virtualizer, Virtualizer2, Virtualizer3, Virtualizer4 = createVirtualizer(p12, Items, p16, p17)
		local Negated = 1
		local Total = 0
		local NewContentLength = 0
		
		return {
			run = function(p18)
				-- upvalues: Virtualizer3 (copy), p17 (copy), Total (ref), NewContentLength (ref), ScrollStepCount (upval), Virtualizer (copy), Negated (ref), recordPlacementChecksum (upval)
				Virtualizer3.synchronizations = 0
				Virtualizer3.reassignedAssignments = 0
				Virtualizer3.acquiredAssignments = 0
				Virtualizer3.releasedAssignments = 0
				Virtualizer3.acceptedMeasurements = 0
				
				if p17 then
					Virtualizer3.touchedKeys = 0
					Virtualizer3.logicalKeyReads = 0
					Virtualizer3.layoutItemReads = 0
					Virtualizer3.payloadReads = 0
					Virtualizer3.viewTypeReads = 0
					Virtualizer3.publicationCallbacks = 0
				end
				Total = 0
				NewContentLength = 0
				
				for i = 1, ScrollStepCount do
					local NewI = (i - 1) % 20 + 1
					local SetScrollOffsetResult = Virtualizer.setScrollOffset(if Negated == 1 then NewI else 20 - NewI)
					NewContentLength += SetScrollOffsetResult.contentLength + #SetScrollOffsetResult.mountedViews
					
					if p18 then
						Total += recordPlacementChecksum(SetScrollOffsetResult)
					end
				end
				Negated = -Negated
			end,
			counters = Virtualizer3,
			getObservablePlacementChecksum = function()
				-- upvalues: Total (ref)
				return Total
			end,
			getCommittedSnapshotTouch = function()
				-- upvalues: NewContentLength (ref)
				return NewContentLength
			end,
			prepareCanonicalEvidence = function()
				-- upvalues: Negated (ref)
				Negated = 1
			end,
			destroy = function()
				-- upvalues: Virtualizer (copy), Virtualizer4 (copy), Virtualizer2 (copy)
				Virtualizer.destroy()
				Virtualizer4.dispose()
				Virtualizer2.destroy()
			end
		}
	end
	
	local Arm = createArm(false)
	local Arm1 = createArm(true)
	local MeasureResult = p13.measure(function()
		-- upvalues: Arm (ref)
		Arm.run(false)
	end, p15)
	local MeasureResult1 = p13.measure(function()
		-- upvalues: Arm1 (ref)
		Arm1.run(false)
	end, p15)
	Arm.prepareCanonicalEvidence()
	Arm1.prepareCanonicalEvidence()
	Arm.destroy()
	Arm1.destroy()
	Arm = createArm(false, true)
	Arm1 = createArm(true, true)
	Arm.run(true)
	Arm1.run(true)
	local Evidence = {
		uniformSynchronizations = Arm.counters.synchronizations,
		measuredSynchronizations = Arm1.counters.synchronizations,
		payloadReads = Arm.counters.payloadReads + Arm1.counters.payloadReads,
		viewTypeReads = Arm.counters.viewTypeReads + Arm1.counters.viewTypeReads,
		uniformObservablePlacementChecksum = Arm.getObservablePlacementChecksum(),
		measuredObservablePlacementChecksum = Arm1.getObservablePlacementChecksum()
	}
	assert(Arm.getCommittedSnapshotTouch() > 0 and (Arm1.getCommittedSnapshotTouch() > 0 and Evidence.uniformObservablePlacementChecksum > 0) and Evidence.measuredObservablePlacementChecksum > 0, "sub-item scrolling benchmark did not consume committed mounted placements")
	assert(Evidence.uniformSynchronizations == 1 and Evidence.measuredSynchronizations == 1, "sub-item scrolling benchmark did not reconcile exactly one range boundary")
	Arm.destroy()
	Arm1.destroy()
	
	return p14.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "sub-item-scrolling",
		description = "Scrolls within one item while reconciling each crossed visible-range boundary.",
		responsibility = ResponsibilityCatalogModule.Core.ViewportRange,
		scale = {
			stickyOrPinned = false,
			items = Items,
			scrollSteps = ScrollStepCount
		},
		timing = {
			unit = "ms",
			basis = "subItemScrollBatch",
			includesSchedulerWaits = false,
			operationsPerSample = ScrollStepCount
		},
		arms = { uniform = MeasureResult, measured = MeasureResult1 },
		evidence = Evidence
	})
end

local function measureProgrammaticScroll(p16, p17, p18, Items, OperationsPerSample, p19)
	-- upvalues: createVirtualizer (copy), recordPlacementChecksum (copy), ResponsibilityCatalogModule (copy)
	local Virtualizer, Virtualizer2, _, Virtualizer4 = createVirtualizer(p16, Items, false)
	local SnapshotsCaptured = 0
	local NewScrollOffset = 0
	local Total = 0
	local NewContentLength = 0
	
	local function runProgrammaticScroll(p20)
		-- upvalues: SnapshotsCaptured (ref), NewScrollOffset (ref), Total (ref), NewContentLength (ref), OperationsPerSample (copy), Items (copy), Virtualizer (copy), p16 (copy), recordPlacementChecksum (upval)
		SnapshotsCaptured = 0
		NewScrollOffset = 0
		Total = 0
		NewContentLength = 0
		
		for i = 1, OperationsPerSample do
			local ScrollToOffsetResult = Virtualizer.scrollToOffset((Virtualizer.getScrollOffsetForItem(i * 17 % Items + 1, p16.ScrollAlignment.Center)))
			NewContentLength += ScrollToOffsetResult.contentLength + #ScrollToOffsetResult.mountedViews
			
			if p20 then
				Total += recordPlacementChecksum(ScrollToOffsetResult)
			end
			local CaptureScrollAnchorSnapshotResult = Virtualizer.captureScrollAnchorSnapshot()
			SnapshotsCaptured += 1
			local ScrollByResult = Virtualizer.scrollBy(40)
			NewContentLength += ScrollByResult.contentLength + #ScrollByResult.mountedViews
			
			if p20 then
				Total += recordPlacementChecksum(ScrollByResult)
			end
			local RestoreScrollAnchorSnapshotResult = Virtualizer.restoreScrollAnchorSnapshot(CaptureScrollAnchorSnapshotResult)
			NewContentLength += RestoreScrollAnchorSnapshotResult.contentLength + #RestoreScrollAnchorSnapshotResult.mountedViews
			
			if p20 then
				Total += recordPlacementChecksum(RestoreScrollAnchorSnapshotResult)
			end
			NewScrollOffset += RestoreScrollAnchorSnapshotResult.scrollState.scrollOffset
		end
	end
	
	local MeasureResult = p17.measure(function()
		-- upvalues: runProgrammaticScroll (copy)
		runProgrammaticScroll(false)
	end, p19)
	runProgrammaticScroll(true)
	local ScrollState = Virtualizer.getCurrent().scrollState
	Virtualizer.destroy()
	Virtualizer4.dispose()
	Virtualizer2.destroy()
	assert(SnapshotsCaptured == OperationsPerSample and (NewScrollOffset > 0 and NewContentLength > 0) and Total > 0, "programmatic scroll benchmark did not restore snapshots")
	
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
			restoredOffsetChecksum = NewScrollOffset,
			finalScrollOffset = ScrollState.scrollOffset,
			observablePlacementChecksum = Total
		}
	})
end

local function measureMeasurementAnchoring(p20, p21, p22, Items, MeasurementUpdates, Tbl)
	-- upvalues: createVirtualizer (copy), recordPlacementChecksum (copy), ResponsibilityCatalogModule (copy)
	local Virtualizer, Virtualizer2, _, Virtualizer4 = createVirtualizer(p20, Items, true)
	local SetScrollOffsetResult = Virtualizer.setScrollOffset(400)
	local VisibleRange = SetScrollOffsetResult.visibleRange
	local ItemView = nil
	local v2 = nil
	local ItemView1 = nil
	local State = nil
	
	for _, mountedView in SetScrollOffsetResult.mountedViews do
		ItemView1 = mountedView.itemView
		State = mountedView.state
		
		if State ~= nil and State.index ~= nil and State.index < VisibleRange.firstIndex then
			ItemView = ItemView1
			v2 = State
			break
		end
	end
	local NewMagnitude: boolean = ItemView ~= nil and v2 ~= nil
	assert(NewMagnitude, "measurement anchoring benchmark requires an overscanned item above the visible anchor")
	local ScrollCorrections = 0
	NewMagnitude = 0
	local NewContentLength = 0
	
	local function _(ItemView)
		-- upvalues: Virtualizer (copy)
		for _, mountedView in Virtualizer.getCurrent().mountedViews do
			if mountedView.itemView == ItemView then
				return mountedView.state
			end
		end
		return nil
	end
	
	local function runMeasurementAnchoring()
		-- upvalues: ScrollCorrections (ref), NewMagnitude (ref), NewContentLength (ref), MeasurementUpdates (copy), ItemView (ref), Virtualizer (copy)
		ScrollCorrections = 0
		NewMagnitude = 0
		NewContentLength = 0
		local State = nil
		
		for i = 1, MeasurementUpdates do
			local ItemView1 = ItemView
			State = nil
			
			for _, mountedView in Virtualizer.getCurrent().mountedViews do
				if mountedView.itemView == ItemView1 then
					State = mountedView.state
					break
				end
			end
			assert(State ~= nil, "measurement anchoring view must remain occupied")
			local SubmitMeasurementsResult = Virtualizer.submitMeasurements({
				{
					itemView = ItemView,
					state = State,
					length = if i % 2 == 0 then 40 else 80
				}
			})
			
			if SubmitMeasurementsResult.scrollCorrection ~= 0 then
				ScrollCorrections += 1
				NewMagnitude += math.abs(SubmitMeasurementsResult.scrollCorrection)
			end
			NewContentLength += SubmitMeasurementsResult.contentLength + #SubmitMeasurementsResult.mountedViews
		end
	end
	
	local Copy = table.clone(Tbl)
	Copy.iterationsPerSample = 1
	local MeasureResult = p21.measure(runMeasurementAnchoring, Copy)
	local ItemView2 = ItemView
	local State1 = nil
	
	for _, mountedView1 in Virtualizer.getCurrent().mountedViews do
		if mountedView1.itemView == ItemView2 then
			State1 = mountedView1.state
			break
		end
	end
	assert(State1 ~= nil, "measurement anchoring view must remain occupied")
	Virtualizer.submitMeasurements({ { length = 40, itemView = ItemView, state = State1 } })
	Virtualizer.setScrollOffset(400)
	runMeasurementAnchoring()
	NewContentLength = recordPlacementChecksum(Virtualizer.getCurrent())
	local ScrollOffset = Virtualizer.getCurrent().scrollState.scrollOffset
	Virtualizer.destroy()
	Virtualizer4.dispose()
	Virtualizer2.destroy()
	assert(ScrollCorrections > 0 and NewMagnitude > 0 and NewContentLength > 0, "measurement anchoring benchmark did not expose corrected mounted placements")
	
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
			observablePlacementChecksum = NewContentLength,
			measuredItemIndex = v2.index,
			visibleAnchorIndex = VisibleRange.firstIndex
		}
	})
end

local function measureCrossAxisTraversal(p23, p24, p25, Items, ScrollStepCount, Layout, p26)
	-- upvalues: createBoundedRecyclingScope (copy), createItems (copy), recordPlacementChecksum (copy), ResponsibilityCatalogModule (copy)
	local Buffer = table.create(Items)
	
	for i = 1, Items do
		Buffer[i] = i % 5 * 8 + 32
	end
	local GridResult = if Layout == "grid" then p23.Layout.grid({ itemLength = 40, crossAxisCount = 3 }) else p23.Layout.masonry({
		crossAxisCount = 3,
		spacing = 4,
		getItemLength = function(p27)
			-- upvalues: Buffer (copy)
			return Buffer[p27]
		end
	})
	local BoundedRecyclingScope = createBoundedRecyclingScope(p23, {
		adapter = {
			create = function()
				return {}
			end,
			destroy = function() end
		}
	}, Items)
	local Virtualizer = p23.Adapter.createVirtualizer({
		overscan = 1,
		dataSource = p23.DataSource.snapshot(createItems(Items), function(p27): string
			return (tostring(p27.id))
		end),
		layout = GridResult,
		recyclingScope = BoundedRecyclingScope,
		getItemViewType = function(): string
			return "row"
		end
	})
	Virtualizer.activate()
	Virtualizer.setViewportSize(480, 800)
	local NewCrossAxisCount = 0
	local ObservablePlacementChecksum = 0
	local NewContentLength = 0
	
	local function runCrossAxisTraversal(p27)
		-- upvalues: ObservablePlacementChecksum (ref), NewContentLength (ref), NewCrossAxisCount (ref), ScrollStepCount (copy), Virtualizer (copy), recordPlacementChecksum (upval)
		ObservablePlacementChecksum = 0
		NewContentLength = 0
		NewCrossAxisCount = 0
		
		for i = 1, ScrollStepCount do
			local SetScrollOffsetResult = Virtualizer.setScrollOffset(i * 40)
			NewContentLength += SetScrollOffsetResult.contentLength + #SetScrollOffsetResult.mountedViews
			
			if p27 then
				ObservablePlacementChecksum += recordPlacementChecksum(SetScrollOffsetResult)
			end
			local VisibleRange = SetScrollOffsetResult.visibleRange
			NewCrossAxisCount += VisibleRange.firstIndex + VisibleRange.lastIndex
			NewCrossAxisCount += Virtualizer.getItemLayout(VisibleRange.firstIndex).crossAxisCount
		end
	end
	
	local MeasureResult = p24.measure(function()
		-- upvalues: runCrossAxisTraversal (copy)
		runCrossAxisTraversal(false)
	end, p26)
	runCrossAxisTraversal(true)
	local VisibleRange = Virtualizer.getCurrent().visibleRange
	local CrossAxisCount = Virtualizer.getItemLayout(VisibleRange.firstIndex).crossAxisCount
	Virtualizer.destroy()
	BoundedRecyclingScope.dispose()
	GridResult.destroy()
	assert(NewCrossAxisCount > 0 and NewContentLength > 0 and ObservablePlacementChecksum > 0, `{Layout} traversal benchmark did not expose mounted placements`)
	
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

local function measureAtomicMutation(p27, p28, p29, Items, DataAnchoring, Workload, PreserveScrollPositionOnChange, p30)
	-- upvalues: createItems (copy), createBoundedRecyclingScope (copy), recordPlacementChecksum (copy)
	local ChangesPerTransaction: number = if PreserveScrollPositionOnChange then 2 else 3
	
	local function createFixture(p31)
		-- upvalues: p27 (copy), createItems (upval), Items (copy), createBoundedRecyclingScope (upval), PreserveScrollPositionOnChange (copy), recordPlacementChecksum (upval)
		local SequenceResult = p27.DataSource.sequence(createItems(Items), function(p32): string
			return (tostring(p32.id))
		end)
		local Counters = {
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
		local DataSource = nil
		
		if p31 then
			local Copy = table.clone(SequenceResult)
			
			function Copy.getItemKey(p32)
				-- upvalues: Counters (copy), SequenceResult (copy)
				local v3 = Counters
				v3.logicalKeyReads += 1
				
				return SequenceResult.getItemKey(p32)
			end
			
			function Copy.getItem(p32)
				-- upvalues: Counters (copy), SequenceResult (copy)
				local v3 = Counters
				v3.payloadReads += 1
				
				return SequenceResult.getItem(p32)
			end
			
			DataSource = Copy
		else
			DataSource = SequenceResult
		end
		local UniformResult = p27.Layout.uniform({ itemLength = 40 })
		local Batches = 0
		local Changes = 0
		local ScrollCorrections = 0
		local NewMagnitude = 0
		local CountMountedViews = 0
		local NewContentLength = 0
		local Count = 0
		local Count1 = 0
		
		if p31 then
			DataSource.subscribe(function(p32)
				-- upvalues: Batches (ref), Changes (ref)
				Batches += 1
				Changes += #p32.changes
			end)
		end
		local BoundedRecyclingScope = createBoundedRecyclingScope(p27, {
			adapter = {
				create = function(): number
					-- upvalues: Count1 (ref)
					Count1 += 1
					
					return Count1
				end,
				destroy = function() end
			}
		}, Items)
		local Virtualizer = p27.Adapter.createVirtualizer({
			overscan = 1,
			dataSource = DataSource,
			layout = UniformResult,
			recyclingScope = BoundedRecyclingScope,
			getItemViewType = if p31 then function(p32)
				-- upvalues: Counters (copy)
				Counters.viewTypeReads += 1
				
				return p32.kind
			end else function(p32)
				return p32.kind
			end,
			preserveScrollPositionOnChange = PreserveScrollPositionOnChange,
			onTransaction = if p31 then function(_, p32)
				-- upvalues: ScrollCorrections (ref), NewMagnitude (ref)
				if p32.scrollCorrection ~= 0 then
					ScrollCorrections += 1
					NewMagnitude += math.abs(p32.scrollCorrection)
				end
			end else nil,
			diagnostics = if p31 then function(p32)
				-- upvalues: Counters (copy)
				if p32.kind == "itemViewsSynchronized" then
					Counters.synchronizations += 1
					Counters.reassignedAssignments += p32.reassigned
					Counters.acquiredAssignments += p32.acquired
					Counters.releasedAssignments += p32.released
					Counters.touchedKeys += p32.touched
					Counters.publicationCallbacks += p32.reassigned + p32.acquired + p32.released
				end
			end else nil
		})
		Virtualizer.activate()
		Virtualizer.setViewportSize(480, 800)
		Virtualizer.setScrollOffset(400)
		Counters.synchronizations = 0
		Counters.reassignedAssignments = 0
		Counters.acquiredAssignments = 0
		Counters.releasedAssignments = 0
		Counters.acceptedMeasurements = 0
		Counters.touchedKeys = 0
		Counters.logicalKeyReads = 0
		Counters.layoutItemReads = 0
		Counters.payloadReads = 0
		Counters.viewTypeReads = 0
		Counters.publicationCallbacks = 0
		CountMountedViews = #Virtualizer.getCurrent().mountedViews
		
		local function applyMutation()
			-- upvalues: Count (ref), NewContentLength (ref), Virtualizer (copy), SequenceResult (copy), PreserveScrollPositionOnChange (upval), Items (upval)
			Count += 1
			NewContentLength = 0
			local FirstIndex = Virtualizer.getCurrent().visibleRange.firstIndex
			local Item = SequenceResult.getItem(FirstIndex)
			SequenceResult.transaction(function()
				-- upvalues: PreserveScrollPositionOnChange (upval), SequenceResult (upval), Count (upval), FirstIndex (copy), Item (copy), Items (upval)
				if PreserveScrollPositionOnChange then
					SequenceResult.prepend({ kind = "row", id = -Count })
					SequenceResult.remove(SequenceResult.getItemCount())
					
					return
				else
					SequenceResult.setItem(FirstIndex, { id = Item.id, kind = Item.kind })
					SequenceResult.append({ kind = "row", id = Items + Count })
					SequenceResult.remove(SequenceResult.getItemCount())
				end
			end)
			local Current = Virtualizer.getCurrent()
			NewContentLength += Current.contentLength + #Current.mountedViews
		end
		
		return if p31 then function()
			-- upvalues: applyMutation (copy), CountMountedViews (ref), Virtualizer (copy)
			applyMutation()
			CountMountedViews = math.max(CountMountedViews, #Virtualizer.getCurrent().mountedViews)
		end else applyMutation, function()
			-- upvalues: Virtualizer (copy), Batches (ref), Changes (ref), ScrollCorrections (ref), NewMagnitude (ref), recordPlacementChecksum (upval), NewContentLength (ref), CountMountedViews (ref), Counters (copy)
			local Current = Virtualizer.getCurrent()
			
			return {
				batches = Batches,
				changes = Changes,
				revisedViews = #Current.entered + #Current.updated,
				scrollCorrections = ScrollCorrections,
				correctionMagnitude = NewMagnitude,
				finalScrollOffset = Virtualizer.getCurrent().scrollState.scrollOffset,
				observablePlacementChecksum = recordPlacementChecksum(Virtualizer.getCurrent()),
				committedSnapshotTouch = NewContentLength,
				maximumMountedItemViews = CountMountedViews,
				counters = Counters
			}
		end, function()
			-- upvalues: Virtualizer (copy), BoundedRecyclingScope (copy), UniformResult (copy)
			Virtualizer.destroy()
			BoundedRecyclingScope.dispose()
			UniformResult.destroy()
		end
	end
	
	local Fixture, _, Fixture3 = createFixture(false)
	local MeasureResult = p28.measure(Fixture, p30)
	Fixture3()
	local Fixture1, Fixture2, Fixture3_1 = createFixture(true)
	Fixture1()
	local FixtureResult = Fixture2()
	Fixture3_1()
	local Counters = FixtureResult.counters
	local ScaledChanges = FixtureResult.changes * FixtureResult.maximumMountedItemViews * 2
	local TouchedKeys = Counters.touchedKeys
	local ScaledSynchronizations = Counters.synchronizations * FixtureResult.maximumMountedItemViews
	local ScaledTouchedKeys = Counters.touchedKeys * 2
	assert(FixtureResult.batches == 1 and FixtureResult.changes == ChangesPerTransaction, "atomic mutation benchmark did not emit grouped changes")
	assert(FixtureResult.revisedViews > 0 and FixtureResult.committedSnapshotTouch > 0 and FixtureResult.observablePlacementChecksum > 0, "atomic mutation benchmark did not expose revised placements")
	assert(not PreserveScrollPositionOnChange or FixtureResult.scrollCorrections > 0, "atomic mutation benchmark did not preserve its anchor")
	
	if Workload == "prepend-remove-mutation" then
		assert(Counters.logicalKeyReads <= ScaledChanges, `atomic mutation exceeded its logical-key read budget ({Counters.logicalKeyReads} > {ScaledChanges})`)
		assert(Counters.payloadReads <= TouchedKeys, "atomic mutation exceeded its payload-read budget")
		assert(Counters.viewTypeReads <= TouchedKeys, "atomic mutation exceeded its view-type read budget")
		assert(Counters.touchedKeys <= ScaledSynchronizations, "atomic mutation exceeded its reconciler touch budget")
		assert(Counters.publicationCallbacks <= ScaledTouchedKeys, "atomic mutation exceeded its publication callback budget")
	end
	return p29.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		responsibility = DataAnchoring,
		workload = Workload,
		description = if PreserveScrollPositionOnChange then "Prepends and trims one atomic batch while preserving the visible anchor." else "Applies one atomic visible update and balanced tail mutation without anchor preservation.",
		scale = {
			items = Items,
			changesPerTransaction = ChangesPerTransaction
		},
		timing = {
			unit = "ms",
			basis = "atomicMutation",
			operationsPerSample = 1,
			includesSchedulerWaits = false
		},
		arms = { viewRecycler = MeasureResult },
		evidence = {
			batches = FixtureResult.batches,
			changes = FixtureResult.changes,
			revisedViews = FixtureResult.revisedViews,
			scrollCorrections = FixtureResult.scrollCorrections,
			correctionMagnitude = FixtureResult.correctionMagnitude,
			finalScrollOffset = FixtureResult.finalScrollOffset,
			observablePlacementChecksum = FixtureResult.observablePlacementChecksum,
			mountedItemViews = FixtureResult.maximumMountedItemViews,
			synchronizations = Counters.synchronizations,
			reassignedAssignments = Counters.reassignedAssignments,
			acquiredAssignments = Counters.acquiredAssignments,
			releasedAssignments = Counters.releasedAssignments,
			touchedKeys = Counters.touchedKeys,
			logicalKeyReads = Counters.logicalKeyReads,
			payloadReads = Counters.payloadReads,
			viewTypeReads = Counters.viewTypeReads,
			publicationCallbacks = Counters.publicationCallbacks,
			logicalKeyReadBudget = ScaledChanges,
			enrichmentReadBudget = TouchedKeys,
			touchedKeyBudget = ScaledSynchronizations,
			publicationCallbackBudget = ScaledTouchedKeys
		}
	})
end

local function measureOverscanPrefetch(p27, p28, p29, Items, ScrollStepCount: number, p30)
	-- upvalues: createBoundedRecyclingScope (copy), createItems (copy), ResponsibilityCatalogModule (copy)
	local PrefetchRequests = 0
	local CurrentRequestsObserved = 0
	local UniformResult = p27.Layout.uniform({ itemLength = 40 })
	local BoundedRecyclingScope = createBoundedRecyclingScope(p27, {
		adapter = {
			create = function()
				return {}
			end,
			destroy = function() end
		}
	}, Items)
	local Virtualizer = p27.Adapter.createVirtualizer({
		overscan = 3,
		dataSource = p27.DataSource.snapshot(createItems(Items), function(p31): string
			return (tostring(p31.id))
		end),
		layout = UniformResult,
		recyclingScope = BoundedRecyclingScope,
		getItemViewType = function(): string
			return "row"
		end,
		dataPrefetch = { startItems = 2, endItems = 4 }
	})
	Virtualizer.activate()
	Virtualizer.setViewportSize(480, 800)
	local MeasureResult = p28.measure(function()
		-- upvalues: ScrollStepCount (copy), Virtualizer (copy), PrefetchRequests (ref), CurrentRequestsObserved (ref)
		for i = 1, ScrollStepCount do
			for _, dataPrefetchRequest in Virtualizer.setScrollOffset(i * 40 * 2).dataPrefetchRequests do
				PrefetchRequests += 1
				
				if dataPrefetchRequest.isCurrent() then
					CurrentRequestsObserved += 1
				end
			end
		end
		Virtualizer.setScrollOffset(40)
	end, p30)
	local VisibleRange = Virtualizer.getCurrent().visibleRange
	local MountedRange = Virtualizer.getCurrent().mountedRange
	Virtualizer.destroy()
	BoundedRecyclingScope.dispose()
	UniformResult.destroy()
	assert(PrefetchRequests > 0, "overscan/prefetch benchmark did not exercise prefetch")
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
		prefetchRequests = PrefetchRequests,
		currentRequestsObserved = CurrentRequestsObserved,
		visibleItems = VisibleRange.lastIndex - VisibleRange.firstIndex + 1,
		mountedItems = MountedRange.lastIndex - MountedRange.firstIndex + 1
	}
	
	return {
		p29.create({
			suite = "view-recycler-core",
			layer = "core",
			owner = "core",
			timingClass = "integrated",
			workload = "fixed-overscan",
			description = "Expands each current Visible range by a fixed number of Layout units.",
			responsibility = ResponsibilityCatalogModule.Core.Overscan,
			scale = Scale,
			timing = Timing,
			arms = Arms,
			evidence = Evidence
		}),
		p29.create({
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

local function measurePinnedSticky(p31, p32, p33, Items, OperationsPerSample, p34)
	-- upvalues: createItems (copy), createBoundedRecyclingScope (copy), recordPlacementChecksum (copy), ResponsibilityCatalogModule (copy)
	local UniformResult = p31.Layout.uniform({ itemLength = 40 })
	local PinnedItems = {
		isItemStickyHeader = function(p35): boolean
			return tonumber(p35) % 20 == 0
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
	local SnapshotResult = p31.DataSource.snapshot(createItems(Items), function(p35): string
		return (tostring(p35.id))
	end)
	local BoundedRecyclingScope = createBoundedRecyclingScope(p31, {
		adapter = {
			create = function()
				return {}
			end,
			destroy = function() end
		}
	}, Items)
	local Virtualizer = p31.Adapter.createVirtualizer({
		overscan = 0,
		dataSource = SnapshotResult,
		layout = UniformResult,
		recyclingScope = BoundedRecyclingScope,
		getItemViewType = function(p35)
			return p35.kind
		end,
		isItemStickyHeader = PinnedItems.isItemStickyHeader,
		pinnedStartItem = PinnedItems.pinnedStartItem,
		pinnedEndItem = PinnedItems.pinnedEndItem
	})
	Virtualizer.activate()
	Virtualizer.setViewportSize(480, 800)
	Virtualizer.setPolicy({
		overscan = 0,
		dataPrefetch = nil,
		contentAlignment = nil,
		endThreshold = nil,
		preserveScrollPositionOnChange = true,
		pinnedItems = PinnedItems
	})
	local ItemView = nil
	local State = nil
	local ItemView1 = nil
	local State1 = nil
	
	for _, mountedView in Virtualizer.getCurrent().mountedViews do
		local ItemView2 = mountedView.itemView
		local State2 = mountedView.state
		
		if State2 ~= nil then
			if State2.assignment.key == "$pinned-start" then
				ItemView = ItemView2
				State = State2
			elseif State2.assignment.key == "$pinned-end" then
				ItemView1 = ItemView2
				State1 = State2
			end
		end
	end
	local NewContentLength: boolean = ItemView ~= nil and (State ~= nil and (ItemView1 ~= nil and State1 ~= nil))
	assert(NewContentLength, "pinned benchmark requires active pinned View states")
	Virtualizer.submitMeasurements({
		{ length = 24, itemView = ItemView, state = State },
		{ length = 32, itemView = ItemView1, state = State1 }
	})
	NewContentLength = 0
	local v3 = nil
	local MeasureResult = p32.measure(function()
		-- upvalues: NewContentLength (ref), OperationsPerSample (copy), Virtualizer (copy), v3 (ref)
		NewContentLength = 0
		
		for i = 1, OperationsPerSample do
			local SetScrollOffsetResult = Virtualizer.setScrollOffset((i + 20) * 40)
			v3 = SetScrollOffsetResult
			NewContentLength += SetScrollOffsetResult.contentLength + #SetScrollOffsetResult.mountedViews
		end
	end, p34)
	assert(v3 ~= nil, "pinned/sticky benchmark did not retain a committed snapshot")
	local RecordPlacementChecksumResult: number = recordPlacementChecksum(v3)
	local StickyViewportRelative = false
	local ViewportPlacement = nil
	local ViewportPlacement1 = nil
	
	for _, mountedView1 in v3.mountedViews do
		local State3 = mountedView1.state
		
		if State3.index ~= nil and State3.viewportPlacement ~= nil then
			StickyViewportRelative = true
			continue
		end
		if State3.assignment.key == "$pinned-start" then
			ViewportPlacement = State3.viewportPlacement
		elseif State3.assignment.key == "$pinned-end" then
			ViewportPlacement1 = State3.viewportPlacement
		end
	end
	local ContentStartOffset = Virtualizer.getCurrent().contentStartOffset
	Virtualizer.destroy()
	BoundedRecyclingScope.dispose()
	UniformResult.destroy()
	assert(NewContentLength > 0 and RecordPlacementChecksumResult > 0 and (StickyViewportRelative and (ViewportPlacement ~= nil and ViewportPlacement1 ~= nil)), "pinned/sticky benchmark did not expose viewport placements")
	
	return p33.create({
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
			stickyViewportRelative = StickyViewportRelative,
			pinnedStartOffset = ViewportPlacement.mainAxisOffset,
			pinnedEndOffset = ViewportPlacement1.mainAxisOffset,
			contentStartOffset = ContentStartOffset,
			observablePlacementChecksum = RecordPlacementChecksumResult
		}
	})
end

local function measureScrollPolicy(p35, p36, p37, OperationsPerSample, p38)
	-- upvalues: ScrollPolicyModule (copy), ResponsibilityCatalogModule (copy)
	local Count = 0
	local Count1 = 0
	local Count2 = 0
	local Total = 0
	
	local function runScrollPolicy()
		-- upvalues: OperationsPerSample (copy), ScrollPolicyModule (upval), p35 (copy), Count (ref), Count1 (ref), Total (ref), Count2 (ref)
		for _ = 1, OperationsPerSample do
			local ContentLength = 200
			local ScrollOffset = 170
			local Flag = true
			local ScrollPolicyModuleResult = ScrollPolicyModule({
				startReachedThreshold = 0,
				startReachedEnabled = false,
				endReachedEnabled = true,
				initialScrollAlignment = p35.ScrollAlignment.End,
				autoScrollOnChange = p35.AutoScrollPolicy.WhenAtEnd
			})
			
			local function _()
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
			end
			
			local _ = function()
				-- upvalues: ContentLength (ref), ScrollOffset (ref)
				local Largest = math.max(0, ContentLength - 30 - ScrollOffset)
				
				return {
					itemCount = 20,
					scrollState = {
						viewportLength = 30,
						scrollOffset = ScrollOffset,
						contentLength = ContentLength,
						distanceFromEnd = Largest,
						atStart = ScrollOffset == 0,
						atEnd = Largest <= 1
					},
					getScrollOffsetForItem = function(p39: number): number
						return p39 * 10
					end
				}
			end
			
			local _ = function(Amount)
				-- upvalues: Flag (ref), Count (upval), Count1 (upval), ScrollOffset (ref), Total (upval)
				if Amount == nil then return end
				if Flag then
					Count += 1
					Flag = false
				else
					Count1 += 1
				end
				ScrollOffset = Amount
				Total += Amount
			end
			
			local _ = function(p39)
				-- upvalues: ScrollPolicyModuleResult (copy), ContentLength (ref), ScrollOffset (ref), Count2 (upval)
				local Largest = math.max(0, ContentLength - 30 - ScrollOffset)
				local _, CheckEdgesResult2 = ScrollPolicyModuleResult.checkEdges({
					viewportLength = 30,
					scrollOffset = ScrollOffset,
					contentLength = ContentLength,
					distanceFromEnd = Largest,
					atStart = ScrollOffset == 0,
					atEnd = Largest <= 1
				}, 20, p39)
				
				if CheckEdgesResult2 then
					Count2 += 1
				end
			end
			
			local Largest = math.max(0, ContentLength - 30 - ScrollOffset)
			local ViewportChangedResult = ScrollPolicyModuleResult.viewportChanged({
				itemCount = 20,
				scrollState = {
					viewportLength = 30,
					scrollOffset = ScrollOffset,
					contentLength = ContentLength,
					distanceFromEnd = Largest,
					atStart = ScrollOffset == 0,
					atEnd = Largest <= 1
				},
				getScrollOffsetForItem = function(p39: number): number
					return p39 * 10
				end
			})
			
			if ViewportChangedResult ~= nil then
				if Flag then
					Count += 1
					Flag = false
				else
					Count1 += 1
				end
				ScrollOffset = ViewportChangedResult
				Total += ViewportChangedResult
			end
			local Largest1 = math.max(0, ContentLength - 30 - ScrollOffset)
			ScrollPolicyModuleResult.observe({
				viewportLength = 30,
				scrollOffset = ScrollOffset,
				contentLength = ContentLength,
				distanceFromEnd = Largest1,
				atStart = ScrollOffset == 0,
				atEnd = Largest1 <= 1
			})
			local Largest2 = math.max(0, ContentLength - 30 - ScrollOffset)
			local DataChangedResult = ScrollPolicyModuleResult.dataChanged({
				itemCount = 20,
				scrollState = {
					viewportLength = 30,
					scrollOffset = ScrollOffset,
					contentLength = ContentLength,
					distanceFromEnd = Largest2,
					atStart = ScrollOffset == 0,
					atEnd = Largest2 <= 1
				},
				getScrollOffsetForItem = function(p39: number): number
					return p39 * 10
				end
			}, {
				previousItemCount = 20,
				itemCount = 21,
				changes = {
					{
						index = 21,
						type = p35.DataSourceChangeType.Insert,
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
			
			if DataChangedResult ~= nil then
				if Flag then
					Count += 1
					Flag = false
				else
					Count1 += 1
				end
				ScrollOffset = DataChangedResult
				Total += DataChangedResult
			end
			local Largest3 = math.max(0, ContentLength - 30 - ScrollOffset)
			local _, CheckEdgesResult2_1 = ScrollPolicyModuleResult.checkEdges({
				viewportLength = 30,
				scrollOffset = ScrollOffset,
				contentLength = ContentLength,
				distanceFromEnd = Largest3,
				atStart = ScrollOffset == 0,
				atEnd = Largest3 <= 1
			}, 20, true)
			
			if CheckEdgesResult2_1 then
				Count2 += 1
			end
			ContentLength = 220
			local Largest4 = math.max(0, ContentLength - 30 - ScrollOffset)
			local ContentLengthChangedResult = ScrollPolicyModuleResult.contentLengthChanged({
				viewportLength = 30,
				scrollOffset = ScrollOffset,
				contentLength = ContentLength,
				distanceFromEnd = Largest4,
				atStart = ScrollOffset == 0,
				atEnd = Largest4 <= 1
			})
			
			if ContentLengthChangedResult ~= nil then
				if Flag then
					Count += 1
					Flag = false
				else
					Count1 += 1
				end
				ScrollOffset = ContentLengthChangedResult
				Total += ContentLengthChangedResult
			end
			local Largest5 = math.max(0, ContentLength - 30 - ScrollOffset)
			local _, CheckEdgesResult2 = ScrollPolicyModuleResult.checkEdges({
				viewportLength = 30,
				scrollOffset = ScrollOffset,
				contentLength = ContentLength,
				distanceFromEnd = Largest5,
				atStart = ScrollOffset == 0,
				atEnd = Largest5 <= 1
			}, 20, false)
			
			if CheckEdgesResult2 then
				Count2 += 1
			end
		end
	end
	
	local MeasureResult = p36.measure(runScrollPolicy, p38)
	Count = 0
	Count1 = 0
	Count2 = 0
	Total = 0
	runScrollPolicy()
	assert(Count > 0 and Count1 > 0 and Count2 > 0, "scroll policy benchmark missed a policy phase")
	
	return p37.create({
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
			initialScrolls = Count,
			endFollowWrites = Count1,
			paginationHits = Count2,
			hostOffsetChecksum = Total
		}
	})
end

local function measureRecyclingScopeRetention(p39, p40, p41, ItemsPerBatch, Batches, p42)
	-- upvalues: ResponsibilityCatalogModule (copy)
	local Creations = 0
	local Evictions = 0
	local AcquiredViews = 0
	local Count = 0
	local RecyclingScope = p39.Adapter.createRecyclingScope({
		adapter = {
			create = function()
				-- upvalues: Creations (ref)
				Creations += 1
				
				return { id = Creations }
			end,
			destroy = function()
				-- upvalues: Evictions (ref)
				Evictions += 1
			end
		}
	})
	local MeasureResult = p40.measure(function()
		-- upvalues: Batches (copy), ItemsPerBatch (copy), RecyclingScope (copy), Count (ref), AcquiredViews (ref)
		for _ = 1, Batches do
			local Buffer = table.create(ItemsPerBatch)
			
			for i = 1, ItemsPerBatch do
				Buffer[i] = { viewType = "row" }
			end
			local Acquired = RecyclingScope.bind({ capacity = 4, releases = {}, requests = Buffer }).acquired
			Count += 1
			AcquiredViews += #Acquired
			RecyclingScope.bind({ capacity = 4, releases = Acquired, requests = {} })
			Count += 1
		end
	end, p42)
	local CreationsDelta = Creations - Evictions
	RecyclingScope.dispose()
	assert(CreationsDelta == 4 and (Evictions > 0 and AcquiredViews > 0) and Count > 0, "typed-pool retention benchmark did not apply view capacity pressure")
	
	return p41.create({
		suite = "view-recycler-core",
		layer = "subsystem",
		owner = "core",
		timingClass = "integrated",
		workload = "typed-pool-retention-pressure",
		description = "Submits and releases view batches above a typed Recycling pool's vacancy capacity.",
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
			retainedVacancies = CreationsDelta,
			acquiredViews = AcquiredViews,
			submissions = Count
		}
	})
end

local function measureActiveToggle(p43, p44, p45, Items, ScrollStepCount: number, p46)
	-- upvalues: createBoundedRecyclingScope (copy), createItems (copy), ResponsibilityCatalogModule (copy)
	local config = {
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
	local UniformResult = p43.Layout.uniform({ itemLength = 40 })
	local BoundedRecyclingScope = createBoundedRecyclingScope(p43, {
		adapter = {
			create = function()
				return {}
			end,
			destroy = function() end
		}
	}, Items)
	local SnapshotResult = p43.DataSource.snapshot(createItems(Items), function(p47): string
		return (tostring(p47.id))
	end)
	local Copy = table.clone(SnapshotResult)
	
	function Copy.getItemKey(p47)
		-- upvalues: config (copy), SnapshotResult (copy)
		config.logicalKeyReads += 1
		
		return SnapshotResult.getItemKey(p47)
	end
	
	function Copy.getItem(p47)
		-- upvalues: config (copy), SnapshotResult (copy)
		config.payloadReads += 1
		
		return SnapshotResult.getItem(p47)
	end
	
	local Virtualizer = p43.Adapter.createVirtualizer({
		dataSource = Copy,
		layout = UniformResult,
		recyclingScope = BoundedRecyclingScope,
		getItemViewType = function(): string
			-- upvalues: config (copy)
			config.viewTypeReads += 1
			
			return "row"
		end,
		diagnostics = function(p47)
			-- upvalues: config (copy)
			if p47.kind == "itemViewsSynchronized" then
				config.synchronizations += 1
				config.reassignedAssignments += p47.reassigned
				config.acquiredAssignments += p47.acquired
				config.releasedAssignments += p47.released
				config.touchedKeys += p47.touched
				config.publicationCallbacks += p47.reassigned + p47.acquired + p47.released
			end
		end
	})
	Virtualizer.activate()
	Virtualizer.setViewportSize(480, 800)
	
	local function runActiveToggle()
		-- upvalues: ScrollStepCount (copy), Virtualizer (copy)
		for _ = 1, ScrollStepCount do
			assert(#Virtualizer.setActive(false).mountedViews == 0, "active toggle must clear mounted Views")
			Virtualizer.setActive(true)
		end
	end
	
	local MeasureResult = p44.measure(runActiveToggle, p46)
	config.synchronizations = 0
	config.reassignedAssignments = 0
	config.acquiredAssignments = 0
	config.releasedAssignments = 0
	config.acceptedMeasurements = 0
	config.touchedKeys = 0
	config.logicalKeyReads = 0
	config.layoutItemReads = 0
	config.payloadReads = 0
	config.viewTypeReads = 0
	config.publicationCallbacks = 0
	runActiveToggle()
	local CountMountedViews = #Virtualizer.getCurrent().mountedViews
	local ScaledCountMountedViews = CountMountedViews * ScrollStepCount
	local ScaledScrollStepCount = ScrollStepCount * 2
	local ScaledCountMountedViews1 = CountMountedViews * ScaledScrollStepCount
	local ScaledCountMountedViews2 = CountMountedViews * ScrollStepCount
	local ScaledTouchedKeys = config.touchedKeys * 2
	Virtualizer.destroy()
	BoundedRecyclingScope.dispose()
	UniformResult.destroy()
	assert(ScaledCountMountedViews > 0 and CountMountedViews > 0, "active toggle benchmark did not release and reactivate")
	assert(config.logicalKeyReads == 0, "active toggle reread logical keys from its retained projection")
	assert(config.payloadReads <= ScaledCountMountedViews2, "active toggle exceeded its payload-read budget")
	assert(config.viewTypeReads <= ScaledCountMountedViews2, "active toggle exceeded its view-type read budget")
	assert(config.synchronizations <= ScaledScrollStepCount, "active toggle exceeded its synchronization budget")
	assert(config.touchedKeys <= ScaledCountMountedViews1, "active toggle exceeded its reconciler touch budget")
	assert(config.publicationCallbacks <= ScaledTouchedKeys, "active toggle exceeded its publication callback budget")
	
	return p45.create({
		suite = "view-recycler-core",
		layer = "core",
		owner = "core",
		timingClass = "integrated",
		workload = "active-state-toggle",
		description = "Releases all assignments while inactive and synchronizes the latest desired window on reactivation.",
		responsibility = ResponsibilityCatalogModule.Core.ListRows,
		scale = { items = Items, toggles = ScrollStepCount },
		timing = {
			unit = "ms",
			basis = "deactivateReactivate",
			includesSchedulerWaits = false,
			operationsPerSample = ScrollStepCount
		},
		arms = { viewRecycler = MeasureResult },
		evidence = {
			logicalKeyReadBudget = 0,
			releasedAssignments = ScaledCountMountedViews,
			mountedAfterReactivation = CountMountedViews,
			synchronizations = config.synchronizations,
			touchedKeys = config.touchedKeys,
			logicalKeyReads = config.logicalKeyReads,
			payloadReads = config.payloadReads,
			viewTypeReads = config.viewTypeReads,
			publicationCallbacks = config.publicationCallbacks,
			enrichmentReadBudget = ScaledCountMountedViews2,
			synchronizationBudget = ScaledScrollStepCount,
			touchedKeyBudget = ScaledCountMountedViews1,
			publicationCallbackBudget = ScaledTouchedKeys
		}
	})
end

local function measureLifecycle(p47, p48, p49, Items, Responsibility, Workload, p50)
	-- upvalues: createBoundedRecyclingScope (copy), createItems (copy)
	local Initialized = 0
	local Destroyed = 0
	local MountedAssignments = 0
	local ReleasedAssignments = 0
	
	local function runLifecycle()
		-- upvalues: p47 (copy), createBoundedRecyclingScope (upval), Items (copy), createItems (upval), Initialized (ref), MountedAssignments (ref), ReleasedAssignments (ref), Destroyed (ref)
		local UniformResult = p47.Layout.uniform({ itemLength = 40 })
		local BoundedRecyclingScope = createBoundedRecyclingScope(p47, {
			adapter = {
				create = function()
					return {}
				end,
				destroy = function() end
			}
		}, Items)
		local Virtualizer = p47.Adapter.createVirtualizer({
			dataSource = p47.DataSource.snapshot(createItems(Items), function(p51): string
				return (tostring(p51.id))
			end),
			layout = UniformResult,
			recyclingScope = BoundedRecyclingScope,
			getItemViewType = function(): string
				return "row"
			end
		})
		Virtualizer.activate()
		Virtualizer.setViewportSize(480, 800)
		Initialized += 1
		MountedAssignments += #Virtualizer.getCurrent().mountedViews
		local CountMountedViews = #Virtualizer.getCurrent().mountedViews
		Virtualizer.destroy()
		ReleasedAssignments += CountMountedViews
		BoundedRecyclingScope.dispose()
		UniformResult.destroy()
		Destroyed += 1
	end
	
	local MeasureResult = p48.measure(runLifecycle, p50)
	Initialized = 0
	Destroyed = 0
	MountedAssignments = 0
	ReleasedAssignments = 0
	runLifecycle()
	assert(Initialized > 0 and Initialized == Destroyed and ReleasedAssignments > 0, "lifecycle benchmark did not complete cleanup")
	
	return p49.create({
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
	run = function(p47, p48, p49, p50)
		-- upvalues: list (copy), measureTraversal (copy), ResponsibilityCatalogModule (copy), measureCrossAxisTraversal (copy), measureCoordinator (copy), measureSubItemScrolling (copy), measureLifecycle (copy), measureAtomicMutation (copy), measureOverscanPrefetch (copy), measureProgrammaticScroll (copy), measureMeasurementAnchoring (copy), measurePinnedSticky (copy), measureScrollPolicy (copy), measureRecyclingScopeRetention (copy), measureActiveToggle (copy)
		local P148 = p50 or {}
		local ItemCounts = P148.itemCounts or list
		local ScrollStepCount = P148.scrollStepCount or 100
		local CoordinatorItemCount = P148.coordinatorItemCount or 40
		local CoordinatorStepCount = P148.coordinatorStepCount or 100
		assert(ScrollStepCount >= 1 and ScrollStepCount % 1 == 0, "scrollStepCount must be a positive integer")
		assert(#ItemCounts > 0, "itemCounts must not be empty")
		local List = {}
		
		for _, itemCount in ItemCounts do
			assert(itemCount >= 1 and itemCount % 1 == 0, "item counts must be positive integers")
			table.insert(List, measureTraversal(p47, p48, p49, itemCount, ScrollStepCount, false, false, "jump", "uniform-traversal", "Runs the complete Virtualizer scroll, range, placement, and recycling path for a uniform layout.", ResponsibilityCatalogModule.Core.LayoutGeometry, P148))
			table.insert(List, measureTraversal(p47, p48, p49, itemCount, ScrollStepCount, true, false, "jump", "measured-offset-traversal", "Runs measured-layout offset lookup and propagation without submitting new item sizes.", ResponsibilityCatalogModule.Core.LayoutGeometry, P148))
			table.insert(List, measureTraversal(p47, p48, p49, itemCount, ScrollStepCount, true, true, "jump", "measured-update-traversal", "Runs the complete measured Virtualizer path and submits mounted-item size batches at every step.", ResponsibilityCatalogModule.Core.Measurement, P148))
			table.insert(List, measureCrossAxisTraversal(p47, p48, p49, itemCount, ScrollStepCount, "grid", P148))
			table.insert(List, measureCrossAxisTraversal(p47, p48, p49, itemCount, ScrollStepCount, "masonry", P148))
		end
		local ItemCount: number = ItemCounts[1]
		assert(ItemCount >= 40, "the smallest item count must cover sticky and mutation workloads")
		
		for _, value1 in { "short", "jump" } do
			table.insert(List, measureTraversal(p47, p48, p49, ItemCount, ScrollStepCount, false, false, value1, "recycling-assignment-churn", "Contrasts nearby scrolling with large jumps through the same uniform Virtualizer.", ResponsibilityCatalogModule.Core.ListRows, P148))
		end
		for _, value2 in { "retained", "churn" } do
			table.insert(List, measureCoordinator(p47, p48, p49, CoordinatorItemCount, CoordinatorStepCount, value2, P148))
		end
		table.insert(List, measureSubItemScrolling(p47, p48, p49, ItemCounts[1], ScrollStepCount, P148))
		table.insert(List, measureLifecycle(p47, p48, p49, ItemCount, ResponsibilityCatalogModule.Core.Initialization, "virtualizer-initialization", P148))
		table.insert(List, measureAtomicMutation(p47, p48, p49, ItemCount, ResponsibilityCatalogModule.Core.DataMutation, "atomic-data-mutation", false, P148))
		table.insert(List, measureAtomicMutation(p47, p48, p49, ItemCount, ResponsibilityCatalogModule.Core.DataAnchoring, "atomic-anchor-preservation", true, P148))
		
		for _, value in measureOverscanPrefetch(p47, p48, p49, ItemCount, ScrollStepCount, P148) do
			table.insert(List, value)
		end
		table.insert(List, measureProgrammaticScroll(p47, p48, p49, ItemCount, ScrollStepCount, P148))
		table.insert(List, measureMeasurementAnchoring(p47, p48, p49, ItemCount, ScrollStepCount, P148))
		table.insert(List, measurePinnedSticky(p47, p48, p49, ItemCount, ScrollStepCount, P148))
		table.insert(List, measureScrollPolicy(p47, p48, p49, ScrollStepCount, P148))
		table.insert(List, measureRecyclingScopeRetention(p47, p48, p49, CoordinatorItemCount, CoordinatorStepCount, P148))
		table.insert(List, measureActiveToggle(p47, p48, p49, ItemCount, ScrollStepCount, P148))
		table.insert(List, measureLifecycle(p47, p48, p49, ItemCount, ResponsibilityCatalogModule.Core.Teardown, "virtualizer-teardown", P148))
		
		return List
	end,
	runStructuralEvidence = function(p51, p52, p53, p54)
		-- upvalues: list (copy), measureTraversal (copy), ResponsibilityCatalogModule (copy), measureAtomicMutation (copy), measureActiveToggle (copy)
		local P156 = p54 or {}
		local ItemCounts = P156.itemCounts or list
		local ScrollStepCount = P156.scrollStepCount or 100
		assert(#ItemCounts > 0, "itemCounts must not be empty")
		assert(ItemCounts[1] >= 40, "the smallest item count must cover structural workloads")
		assert(ScrollStepCount >= 1 and ScrollStepCount % 1 == 0, "scrollStepCount must be a positive integer")
		local ItemCount = ItemCounts[1]
		
		return {
			measureTraversal(p51, p52, p53, ItemCount, ScrollStepCount, false, false, "slide", "one-row-window-slide", "Slides the mounted window by one row and budgets sparse projection work.", ResponsibilityCatalogModule.Core.ListRows, P156),
			measureTraversal(p51, p52, p53, ItemCount, ScrollStepCount, true, false, "slide", "measured-one-row-window-slide", "Slides a measured mounted window by one row and budgets edge-only Layout reads.", ResponsibilityCatalogModule.Core.ListRows, P156),
			measureTraversal(p51, p52, p53, ItemCount, ScrollStepCount, false, false, "jump", "disjoint-window-jump", "Jumps between disjoint mounted windows and budgets dense replacement work.", ResponsibilityCatalogModule.Core.ListRows, P156),
			measureAtomicMutation(p51, p52, p53, ItemCount, ResponsibilityCatalogModule.Core.DataAnchoring, "prepend-remove-mutation", true, P156),
			measureActiveToggle(p51, p52, p53, ItemCount, ScrollStepCount, P156)
		}
	end,
	runSubItemScrolling = function(p51, p52, p53, p54)
		-- upvalues: list (copy), measureSubItemScrolling (copy)
		local P152 = p54 or {}
		local ItemCounts = P152.itemCounts or list
		local ScrollStepCount = P152.scrollStepCount or 100
		assert(#ItemCounts > 0, "itemCounts must not be empty")
		assert(ScrollStepCount >= 1 and ScrollStepCount % 1 == 0, "scrollStepCount must be a positive integer")
		
		return measureSubItemScrolling(p51, p52, p53, ItemCounts[1], ScrollStepCount, P152)
	end
}