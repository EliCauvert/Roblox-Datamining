local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local ViewRecyclerModule = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local MeasurementBatcherModule = require(ViewRecyclerRoblox.RobloxAdapter.MeasurementBatcher)
local ReparentableHostModule = require(ViewRecyclerRoblox.RobloxAdapter.ReparentableHost)
local ResponsibilityCatalogModule = require(ViewRecyclerRoblox.Parent.Parent.ViewRecycler.ViewRecycler.Core.Diagnostics.__benchmarks__.ResponsibilityCatalog)
local CreateFunction = require(ViewRecyclerRoblox.RobloxAdapter.createRecyclingScope).create
local CreateVirtualizerModule = require(ViewRecyclerRoblox.RobloxAdapter.createVirtualizer)

local function record(p1, MeasurementScheduling, TimingClass, Workload, Description, Basis, IncludesSchedulerWaits, Operations, MeasureResult, Evidence) --[[ Line: 53 ]]
	return p1.create({
		suite = "view-recycler-roblox",
		layer = "robloxHost",
		owner = "roblox",
		responsibility = MeasurementScheduling,
		timingClass = TimingClass,
		workload = Workload,
		description = Description,
		scale = { operations = Operations },
		timing = {
			unit = "ms",
			basis = Basis,
			operationsPerSample = Operations,
			includesSchedulerWaits = IncludesSchedulerWaits
		},
		arms = { viewRecycler = MeasureResult },
		evidence = Evidence
	})
end

local function placementWorkload(p1, p2, p3, OperationCount: number, p4) --[[ Line: 89 ]]
	-- upvalues: record (copy), ResponsibilityCatalogModule (copy)
	local Folder = Instance.new("Folder")
	local Folder1 = Instance.new("Folder")
	local Frame = Instance.new("Frame")
	local State = p1.CanvasItemPlacer.createState()
	local config = {
		position = UDim2.fromOffset(0, 40),
		size = UDim2.new(1, 0, 0, 40),
		automaticSize = Enum.AutomaticSize.None
	}
	local config1 = {
		position = UDim2.fromOffset(0, 80),
		size = config.size,
		automaticSize = config.automaticSize
	}
	p1.CanvasItemPlacer.place(Frame, Folder, config, State, true)
	local NewPlaceResult = 0
	local NewPlaceResult1 = 0
	local NewPlaceResult2 = 0
	local HostBoundary = record(p3, ResponsibilityCatalogModule.Roblox.GeometryPlacement, "hostBoundary", "geometry-placement-paths", "Groups changed, unchanged, and reparented CanvasItemPlacer paths.", "placementPathBatch", false, OperationCount, p2.measure(function() --[[ Line: 114 ]]
		-- upvalues: NewPlaceResult (ref), NewPlaceResult1 (ref), NewPlaceResult2 (ref), OperationCount (copy), p1 (copy), Frame (copy), Folder (copy), config1 (copy), State (copy), Folder1 (copy), config (copy)
		NewPlaceResult = 0
		NewPlaceResult1 = 0
		NewPlaceResult2 = 0
		
		for _ = 1, OperationCount do
			NewPlaceResult += p1.CanvasItemPlacer.place(Frame, Folder, config1, State, true)
			NewPlaceResult1 += p1.CanvasItemPlacer.place(Frame, Folder, config1, State, true)
			NewPlaceResult2 += p1.CanvasItemPlacer.place(Frame, Folder1, config1, State, true)
			NewPlaceResult2 += p1.CanvasItemPlacer.place(Frame, Folder, config, State, true)
		end
	end, p4), {
		placementCalls = OperationCount * 4,
		changedPropertyWrites = NewPlaceResult,
		unchangedPropertyWrites = NewPlaceResult1,
		reparentPropertyWrites = NewPlaceResult2
	})
	p1.CanvasItemPlacer.detach(Frame, State)
	Frame:Destroy()
	Folder:Destroy()
	Folder1:Destroy()
	
	return HostBoundary
end

local function createPlacementRoutingFixture(p5, p6, Placement) --[[ Line: 149 ]]
	local ScrollFrame = Instance.new("ScrollingFrame")
	local Frame = Instance.new("Frame")
	local Frame1 = Instance.new("Frame")
	local Placement1 = Placement
	local Placement2 = 0
	local Assignment = { key = "row", value = "row" }
	local NewResult = p5.HostPlacement.new({
		selfSizing = false,
		container = ScrollFrame,
		viewportContainer = if p6 then Frame else nil,
		axis = p5.Axis.Y,
		onItemMeasurements = function() --[[ Line: 168 ]] end,
		onItemViewPresentationChanged = function() --[[ Line: 169 ]] end
	})
	
	local function placementIntent() --[[ Line: 171 ]]
		-- upvalues: Assignment (copy), Placement2 (ref), Placement1 (ref)
		return {
			index = 1,
			contentStartOffset = 0,
			assignment = Assignment,
			itemLayout = { startOffset = 0, length = 40 },
			canvasPlacement = { mainAxisLength = 40, mainAxisOffset = Placement2 },
			viewportPlacement = if Placement1 then {
				mainAxisLength = 40,
				viewportRelative = true,
				mainAxisOffset = Placement2
			} else nil
		}
	end
	
	NewResult.apply(Frame1, {
		phase = "presented",
		host = Frame1,
		state = placementIntent()
	})
	
	return {
		canvas = ScrollFrame,
		overlay = Frame,
		host = Frame1,
		hostPlacement = NewResult,
		setPlacement = function(Value, Value1) --[[ Line: 203 ]]
			-- upvalues: Placement2 (ref), Placement1 (ref)
			Placement2 = Value
			Placement1 = Value1
		end,
		publishPlacementGeometry = function() --[[ Line: 207 ]]
			-- upvalues: NewResult (copy), Frame1 (copy), placementIntent (copy)
			NewResult.apply(Frame1, {
				phase = "presented",
				host = Frame1,
				state = placementIntent()
			})
		end
	}
end

local function _(PlacementRoutingFixture) --[[ Line: 217 | Named "destroyPlacementRoutingFixture" ]]
	PlacementRoutingFixture.hostPlacement.destroy()
	PlacementRoutingFixture.host:Destroy()
	PlacementRoutingFixture.overlay:Destroy()
	PlacementRoutingFixture.canvas:Destroy()
end

local function placementRoutingWorkload(p5, p6, p7, CanvasFallbackGeometryPublications, p8) --[[ Line: 224 ]]
	-- upvalues: createPlacementRoutingFixture (copy), ResponsibilityCatalogModule (copy)
	local PlacementRoutingFixture = createPlacementRoutingFixture(p5, false, true)
	local PlacementRoutingFixture1 = createPlacementRoutingFixture(p5, true, true)
	local PlacementRoutingFixture2 = createPlacementRoutingFixture(p5, true, true)
	local CreateResult = p7.create({
		suite = "view-recycler-roblox",
		layer = "robloxHost",
		owner = "roblox",
		timingClass = "integrated",
		workload = "viewport-overlay-placement-routing",
		description = "Compares retained overlay and canvas-fallback geometry with canvas-to-overlay routing transitions.",
		responsibility = ResponsibilityCatalogModule.Roblox.GeometryPlacement,
		scale = { operations = CanvasFallbackGeometryPublications },
		timing = {
			unit = "ms",
			basis = "placementPublicationBatch",
			includesSchedulerWaits = false,
			operationsPerSample = CanvasFallbackGeometryPublications
		},
		arms = {
			canvasFallback = p6.measure(function() --[[ Line: 235 ]]
				-- upvalues: CanvasFallbackGeometryPublications (copy), PlacementRoutingFixture (copy)
				for i = 1, CanvasFallbackGeometryPublications do
					PlacementRoutingFixture.setPlacement(i, true)
					PlacementRoutingFixture.publishPlacementGeometry(i)
				end
			end, p8),
			viewportOverlay = p6.measure(function() --[[ Line: 241 ]]
				-- upvalues: CanvasFallbackGeometryPublications (copy), PlacementRoutingFixture1 (copy)
				for i = 1, CanvasFallbackGeometryPublications do
					PlacementRoutingFixture1.setPlacement(i, true)
					PlacementRoutingFixture1.publishPlacementGeometry(i)
				end
			end, p8),
			routingTransitions = p6.measure(function() --[[ Line: 247 ]]
				-- upvalues: CanvasFallbackGeometryPublications (copy), PlacementRoutingFixture2 (copy)
				for i = 1, CanvasFallbackGeometryPublications do
					PlacementRoutingFixture2.setPlacement(i, i % 2 == 0)
					PlacementRoutingFixture2.publishPlacementGeometry(i)
				end
			end, p8)
		},
		evidence = {
			canvasFallbackGeometryPublications = CanvasFallbackGeometryPublications,
			overlayGeometryPublications = CanvasFallbackGeometryPublications,
			routingPublications = CanvasFallbackGeometryPublications,
			routingReparents = CanvasFallbackGeometryPublications,
			canvasFallbackHostParent = PlacementRoutingFixture.host.Parent == PlacementRoutingFixture.canvas,
			overlayHostParent = PlacementRoutingFixture1.host.Parent == PlacementRoutingFixture1.overlay,
			routedHostInOverlay = PlacementRoutingFixture2.host.Parent == PlacementRoutingFixture2.overlay,
			canvasFallbackHostOffset = PlacementRoutingFixture.host.Position.Y.Offset,
			overlayHostOffset = PlacementRoutingFixture1.host.Position.Y.Offset
		}
	})
	PlacementRoutingFixture.hostPlacement.destroy()
	PlacementRoutingFixture.host:Destroy()
	PlacementRoutingFixture.overlay:Destroy()
	PlacementRoutingFixture.canvas:Destroy()
	PlacementRoutingFixture1.hostPlacement.destroy()
	PlacementRoutingFixture1.host:Destroy()
	PlacementRoutingFixture1.overlay:Destroy()
	PlacementRoutingFixture1.canvas:Destroy()
	PlacementRoutingFixture2.hostPlacement.destroy()
	PlacementRoutingFixture2.host:Destroy()
	PlacementRoutingFixture2.overlay:Destroy()
	PlacementRoutingFixture2.canvas:Destroy()
	
	return CreateResult
end

local function reparentSelectionWorkload(p9, p10, OperationCount, p11) --[[ Line: 295 ]]
	-- upvalues: ReparentableHostModule (copy), GuiService (copy), record (copy), ResponsibilityCatalogModule (copy)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = game:GetService("CoreGui")
	local Frame = Instance.new("Frame")
	Frame.Parent = ScreenGui
	local Frame1 = Instance.new("Frame")
	Frame1.Parent = ScreenGui
	local BenchmarkHost = ReparentableHostModule.create("BenchmarkHost")
	local Button = Instance.new("TextButton")
	Button.Selectable = true
	Button.Parent = BenchmarkHost
	local Placements = 0
	local SelectionClears = 0
	local Detachments = 0
	local HostBoundary = record(p10, ResponsibilityCatalogModule.Roblox.ReparentSelection, "hostBoundary", "reparent-selection-cleanup", "Places ReparentableHost instances and clears descendant selection while detaching.", "reparentSelectionBatch", false, OperationCount, p9.measure(function() --[[ Line: 314 ]]
		-- upvalues: Placements (ref), SelectionClears (ref), Detachments (ref), OperationCount (copy), ReparentableHostModule (upval), BenchmarkHost (copy), Frame (copy), Frame1 (copy), GuiService (upval), Button (copy)
		Placements = 0
		SelectionClears = 0
		Detachments = 0
		
		for i = 1, OperationCount do
			ReparentableHostModule.place(BenchmarkHost, {
				placeholder = if i % 2 == 0 then Frame else Frame1,
				automaticSize = Enum.AutomaticSize.Y
			})
			Placements += 1
			
			if i == 1 then
				GuiService.SelectedObject = Button
			end
			ReparentableHostModule.detach(BenchmarkHost)
			Detachments += 1
			
			if i == 1 and GuiService.SelectedObject == nil then
				SelectionClears += 1
			end
		end
	end, p11), {
		placements = Placements,
		selectionClears = SelectionClears,
		detachments = Detachments,
		finalParentIsNil = BenchmarkHost.Parent == nil
	})
	ReparentableHostModule.destroy(BenchmarkHost)
	ScreenGui:Destroy()
	
	return HostBoundary
end

local function physicalLifecycleWorkload(p12, p13, p14, OperationCount, p15) --[[ Line: 356 ]]
	-- upvalues: record (copy), ResponsibilityCatalogModule (copy)
	local Folder = Instance.new("Folder")
	local Frame = Instance.new("Frame")
	local NewResult = p12.HostPlacement.new({
		selfSizing = false,
		container = Folder,
		axis = p12.Axis.Y,
		onItemMeasurements = function() --[[ Line: 369 ]] end,
		onItemViewPresentationChanged = function() --[[ Line: 370 ]] end
	})
	local Attachments = 0
	local Detachments = 0
	local Integrated = record(p14, ResponsibilityCatalogModule.Roblox.PhysicalLifecycle, "integrated", "canvas-item-view-physical-lifecycle", "Transitions one HostPlacement view through attachment and detachment without measurement work.", "physicalAttachDetachBatch", false, OperationCount, p13.measure(function() --[[ Line: 374 ]]
		-- upvalues: Attachments (ref), Detachments (ref), OperationCount (copy), NewResult (copy), Frame (copy), Folder (copy)
		Attachments = 0
		Detachments = 0
		
		for _ = 1, OperationCount do
			NewResult.apply(Frame, {
				phase = "presented",
				host = Frame,
				state = {
					index = 1,
					viewportPlacement = nil,
					contentStartOffset = 0,
					assignment = { key = "row", value = "row" },
					itemLayout = { startOffset = 0, length = 40 },
					canvasPlacement = {}
				}
			})
			
			if Frame.Parent == Folder then
				Attachments += 1
			end
			NewResult.apply(Frame, nil)
			
			if Frame.Parent == nil and not Frame.Visible then
				Detachments += 1
			end
		end
	end, p15), {
		attachments = Attachments,
		detachments = Detachments,
		finalParentIsNil = Frame.Parent == nil
	})
	NewResult.destroy()
	Frame:Destroy()
	Folder:Destroy()
	
	return Integrated
end

local function createScrollHost(p16, ScrollFrame) --[[ Line: 425 ]]
	-- upvalues: ViewRecyclerModule (copy)
	local Offset = ScrollFrame.CanvasSize.Y.Offset
	local Count = 0
	local Count1 = 0
	local SnapshotResult = ViewRecyclerModule.DataSource.snapshot({}, function(p17) --[[ Line: 429 ]]
		return p17
	end)
	local v1 = nil
	v1 = {
		setViewportSize = function() --[[ Line: 434 ]]
			-- upvalues: Count (ref), v1 (ref)
			Count += 1
			
			return v1.getCurrent()
		end,
		observeScrollOffset = function() --[[ Line: 438 ]]
			-- upvalues: Count1 (ref), v1 (ref)
			Count1 += 1
			
			return v1.getCurrent()
		end,
		getCurrent = function() --[[ Line: 442 ]]
			-- upvalues: ScrollFrame (copy), Offset (ref)
			return {
				contentStartOffset = 0,
				requiresItemMeasurement = false,
				scrollCorrection = 0,
				scrollPositionChanged = false,
				contentLengthChanged = false,
				startReached = false,
				endReached = false,
				mountedViews = {},
				visibleRange = { firstIndex = 0, lastIndex = 0 },
				mountedRange = { firstIndex = 0, lastIndex = 0 },
				scrollState = {
					atStart = true,
					atEnd = false,
					scrollOffset = ScrollFrame.CanvasPosition.Y,
					viewportLength = ScrollFrame.AbsoluteWindowSize.Y,
					contentLength = Offset,
					distanceFromEnd = Offset
				},
				contentLength = Offset,
				dataPrefetchRequests = {},
				diagnostics = {}
			}
		end
	}
	local NewResult = p16.ScrollHost.new({
		observeScrollOffset = v1.observeScrollOffset,
		setViewportSize = v1.setViewportSize,
		getCurrent = v1.getCurrent,
		getInstance = function() --[[ Line: 472 ]]
			-- upvalues: ScrollFrame (copy)
			return ScrollFrame
		end,
		getConfiguration = function() --[[ Line: 475 ]]
			-- upvalues: p16 (copy), SnapshotResult (copy)
			return {
				initialScrollAlignment = nil,
				autoScrollOnChange = nil,
				startReachedThreshold = nil,
				onStartReached = nil,
				onEndReached = nil,
				onViewportChanged = nil,
				onScrollOffsetChanged = nil,
				onContentLengthChanged = nil,
				axis = p16.Axis.Y,
				dataSource = SnapshotResult
			}
		end
	})
	Count = 0
	Count1 = 0
	
	return NewResult, function() --[[ Line: 494 ]]
		-- upvalues: Count (ref), Count1 (ref)
		return Count, Count1
	end, function(ScrollOffset) --[[ Line: 497 ]]
		-- upvalues: v1 (ref), NewResult (copy)
		local Current = v1.getCurrent()
		Current.scrollPositionChanged = true
		Current.scrollState.scrollOffset = ScrollOffset
		NewResult.applyRecord(Current, function() --[[ Line: 501 ]] end)
	end, function(p17) --[[ Line: 503 ]]
		-- upvalues: Offset (ref)
		Offset = p17
	end, (NewResult.connect())
end

local function scrollSynchronizationWorkload(p16, p17, p18, OperationCount, p19) --[[ Line: 509 ]]
	-- upvalues: createScrollHost (copy), record (copy), ResponsibilityCatalogModule (copy)
	local ScrollFrame = Instance.new("ScrollingFrame")
	ScrollFrame.Size = UDim2.fromOffset(400, 400)
	ScrollFrame.CanvasSize = UDim2.fromOffset(400, 4000)
	local ScrollHost, ScrollHost2, ScrollHost3, _, ScrollHost5 = createScrollHost(p16, ScrollFrame)
	local MeasureResult = p17.measure(function() --[[ Line: 520 ]]
		-- upvalues: OperationCount (copy), ScrollHost (copy), ScrollHost3 (copy), ScrollFrame (copy)
		for i = 1, OperationCount do
			ScrollHost.scrollingFrameChanged()
			ScrollHost3(i)
			ScrollFrame.CanvasPosition = ScrollFrame.CanvasPosition
		end
	end, p19)
	local ScrollHostResult, ScrollHostResult2 = ScrollHost2()
	local HostBoundary = record(p18, ResponsibilityCatalogModule.Roblox.ScrollViewportSync, "hostBoundary", "scroll-viewport-offset-correction-sync", "Synchronizes viewport geometry and attributes host-reported offsets to Programmatic or User scroll.", "scrollSynchronizationBatch", false, OperationCount, MeasureResult, {
		viewportUpdates = ScrollHostResult,
		runtimeUpdates = ScrollHostResult2,
		finalScrollOffset = ScrollFrame.CanvasPosition.Y
	})
	ScrollHost5()
	ScrollFrame:Destroy()
	
	return HostBoundary
end

local function canvasPublicationWorkload(p20, p21, p22, OperationCount, p23) --[[ Line: 549 ]]
	-- upvalues: createScrollHost (copy), record (copy), ResponsibilityCatalogModule (copy)
	local ScrollFrame = Instance.new("ScrollingFrame")
	local _, _, ScrollHost3, ScrollHost4, ScrollHost5 = createScrollHost(p20, ScrollFrame)
	local CanvasPublications = 0
	local HostBoundary = record(p22, ResponsibilityCatalogModule.Roblox.CanvasPublication, "hostBoundary", "canvas-size-publication", "Computes and publishes adapter canvas sizes to a ScrollingFrame.", "canvasPublicationBatch", false, OperationCount, p21.measure(function() --[[ Line: 559 ]]
		-- upvalues: CanvasPublications (ref), OperationCount (copy), ScrollHost4 (copy), ScrollHost3 (copy)
		CanvasPublications = 0
		
		for i = 1, OperationCount do
			ScrollHost4(i * 40)
			ScrollHost3(0)
			CanvasPublications += 1
		end
	end, p23), {
		canvasPublications = CanvasPublications,
		finalCanvasLength = ScrollFrame.CanvasSize.Y.Offset
	})
	ScrollHost5()
	ScrollFrame:Destroy()
	
	return HostBoundary
end

local function measurementSchedulingWorkload(p24, p25, p26, OperationCount, p27) --[[ Line: 587 ]]
	-- upvalues: MeasurementBatcherModule (copy), record (copy), ResponsibilityCatalogModule (copy)
	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.fromOffset(100, 40)
	local State = { key = "row", index = 1, itemRevision = 0 }
	local Evidence = {}
	local MeasureResult = p25.measure(function() --[[ Line: 602 ]]
		-- upvalues: p24 (copy), Frame (copy), State (ref), MeasurementBatcherModule (upval), OperationCount (copy), Evidence (ref)
		local List = {}
		local BatchFlushes = 0
		local BatchedMeasurements = 0
		local Cancellations = 0
		local AttachResult = p24.Measurer.attach({
			instance = Frame,
			axis = p24.Axis.Y,
			getState = function() --[[ Line: 610 ]]
				-- upvalues: State (upval)
				return State
			end,
			onItemMeasured = function() --[[ Line: 613 ]] end
		})
		local NewMeasurementBatcher = MeasurementBatcherModule.new(function(p28) --[[ Line: 615 ]]
			-- upvalues: BatchFlushes (ref), BatchedMeasurements (ref)
			BatchFlushes += 1
			BatchedMeasurements += #p28
		end, function(p28) --[[ Line: 618 ]]
			-- upvalues: List (copy)
			table.insert(List, p28)
		end)
		
		for i = 1, OperationCount do
			State = { key = "row", index = 1, itemRevision = i }
			AttachResult.scheduleSettle()
			AttachResult.scheduleSettle()
			NewMeasurementBatcher.add({ length = 40, itemView = Frame, state = State })
			NewMeasurementBatcher.add({ length = 41, itemView = Frame, state = State })
			table.remove(List, 1)()
			NewMeasurementBatcher.add({ length = 0, itemView = Frame, state = State })
			NewMeasurementBatcher.cancelPending()
			table.remove(List, 1)()
			Cancellations += 1
		end
		Evidence = {
			settleRequests = OperationCount * 2,
			uniquePendingHeartbeats = AttachResult.getPendingCount(),
			batchFlushes = BatchFlushes,
			batchedMeasurements = BatchedMeasurements,
			cancellations = Cancellations,
			deferredCallbacksRemaining = #List
		}
		NewMeasurementBatcher.destroy()
		AttachResult.disconnect()
	end, p27)
	Frame:Destroy()
	
	return record(p26, ResponsibilityCatalogModule.Roblox.MeasurementScheduling, "phased", "measurement-adapter-scheduling", "Schedules deduplicated settles, flushes measurement batches, and cancels stale batches without yielding.", "adapterMeasurementSchedulingBatch", false, OperationCount, MeasureResult, Evidence)
end

local function measurementHeartbeatWorkload(p28, p29, p30, p31) --[[ Line: 663 ]]
	-- upvalues: RunService (copy), record (copy), ResponsibilityCatalogModule (copy)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = game:GetService("CoreGui")
	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.fromOffset(100, 40)
	Frame.Parent = ScreenGui
	RunService.Heartbeat:Wait()
	local config = { key = "row", index = 1, itemRevision = 0 }
	local Count = 0
	local ObservedMeasurements = 0
	local LastMeasuredLength = -1
	local BindableEvent = Instance.new("BindableEvent")
	local AttachResult = p28.Measurer.attach({
		instance = Frame,
		axis = p28.Axis.Y,
		getState = function() --[[ Line: 687 ]]
			-- upvalues: config (ref)
			return config
		end,
		onItemMeasured = function(_, p32) --[[ Line: 690 ]]
			-- upvalues: Count (ref), LastMeasuredLength (ref), BindableEvent (copy)
			Count += 1
			LastMeasuredLength = p32
			BindableEvent:Fire()
		end
	})
	local Clock = p31.clock or os.clock
	local HostBoundary = record(p30, ResponsibilityCatalogModule.Roblox.MeasurementScheduling, "hostBoundary", "measurement-heartbeat-observation", "Observes one scheduled Roblox measurement after its required Heartbeat boundary.", "heartbeatMeasurementObservation", true, 1, p29.run(function() --[[ Line: 697 ]]
		-- upvalues: config (ref), Count (ref), AttachResult (copy), Clock (copy), BindableEvent (copy), ObservedMeasurements (ref)
		config = {
			key = "row",
			index = 1,
			itemRevision = config.itemRevision + 1
		}
		local Count1 = Count
		AttachResult.scheduleSettle()
		local ClockResult = Clock()
		BindableEvent.Event:Wait()
		local ScaledClockResult = (Clock() - ClockResult) * 1000
		ObservedMeasurements = Count - Count1
		assert(ObservedMeasurements == 1, "scheduled measurement did not settle on Heartbeat")
		
		return ScaledClockResult
	end, p31), {
		completionBarrier = "RunService.Heartbeat",
		observedMeasurements = ObservedMeasurements,
		lastMeasuredLength = LastMeasuredLength,
		pendingHeartbeats = AttachResult.getPendingCount()
	})
	AttachResult.disconnect()
	BindableEvent:Destroy()
	ScreenGui:Destroy()
	
	return HostBoundary
end

local function createFakeGui(p28) --[[ Line: 731 ]]
	local BindableEvents = {}
	local List = {}
	local BindableEvent = Instance.new("BindableEvent")
	table.insert(List, BindableEvent)
	
	return {
		AbsolutePosition = p28.position or Vector2.zero,
		AbsoluteSize = p28.size or Vector2.zero,
		AbsoluteWindowSize = p28.windowSize or Vector2.zero,
		CanvasPosition = p28.canvasPosition or Vector2.zero,
		Parent = p28.parent,
		Destroying = BindableEvent.Event,
		GetPropertyChangedSignal = function(_, Key) --[[ Line: 744 ]]
			-- upvalues: BindableEvents (copy), List (copy)
			local BindableEvent = BindableEvents[Key]
			
			if BindableEvent == nil then
				BindableEvent = Instance.new("BindableEvent")
				BindableEvents[Key] = BindableEvent
				table.insert(List, BindableEvent)
			end
			return BindableEvent.Event
		end,
		IsDescendantOf = function(p29, Parent): boolean --[[ Line: 753 ]]
			local Parent1 = p29.Parent
			while Parent1 ~= nil do
				if Parent1 == Parent then
					return true
				end
				Parent1 = Parent1.Parent
			end
			return false
		end,
		fire = function(_, p30) --[[ Line: 763 ]]
			-- upvalues: BindableEvents (copy)
			local BindableEvent = BindableEvents[p30]
			
			if BindableEvent ~= nil then
				BindableEvent:Fire()
			end
		end,
		destroy = function(_) --[[ Line: 769 ]]
			-- upvalues: List (copy)
			for _, value in List do
				value:Destroy()
			end
		end
	}
end

local function viewportActivationWorkload(p30, p31, p32, OperationCount: number, p33) --[[ Line: 777 ]]
	-- upvalues: createFakeGui (copy), RunService (copy), record (copy), ResponsibilityCatalogModule (copy)
	local Smallest = math.min(OperationCount, 10)
	local FakeGui = createFakeGui({
		position = Vector2.new(0, 0),
		windowSize = Vector2.new(100, 100)
	})
	local FakeGui1 = createFakeGui({
		position = Vector2.new(0, 150),
		size = Vector2.new(10, 10),
		parent = FakeGui
	})
	local Count = 0
	local NewResult = p30.ViewportCoordinator.new({ axis = p30.Axis.Y })
	NewResult.setViewport(FakeGui)
	local RegisterResult: () -> () = NewResult.register(FakeGui1, function() --[[ Line: 797 ]]
		-- upvalues: Count (ref)
		Count += 1
	end)
	local Integrated = record(p32, ResponsibilityCatalogModule.Roblox.ViewportActivation, "integrated", "viewport-activation-transitions", "Coalesces repeated layout geometry and evaluates each settled activation transition at Heartbeat.", "viewportActivationBatch", true, Smallest, p31.measure(function() --[[ Line: 801 ]]
		-- upvalues: Smallest (ref), FakeGui1 (copy), RunService (upval)
		for _ = 1, Smallest do
			FakeGui1.AbsolutePosition = Vector2.new(0, 50)
			FakeGui1:fire("AbsolutePosition")
			FakeGui1:fire("AbsolutePosition")
			RunService.Heartbeat:Wait()
			task.wait()
			FakeGui1.AbsolutePosition = Vector2.new(0, 150)
			FakeGui1:fire("AbsolutePosition")
			RunService.Heartbeat:Wait()
			task.wait()
		end
	end, p33), {
		noOpEvaluations = 0,
		completionBarrier = "RunService.Heartbeat",
		evaluations = Smallest * 2,
		transitions = Count - Count
	})
	RegisterResult()
	NewResult.destroy()
	FakeGui1:destroy()
	FakeGui:destroy()
	
	return Integrated
end

local _ = function(p34: number): number --[[ Line: 844 | Named "frameWorkItemLength" ]]
	return p34 * 7 % 41 + 40
end

local function createFrameWorkList(p34, p35) --[[ Line: 848 ]]
	-- upvalues: RunService (copy), ViewRecyclerModule (copy), CreateFunction (copy), CreateVirtualizerModule (copy)
	local ClockFunction = os.clock
	local Flag = false
	local v1 = 0
	local Count = 0
	local Total = 0
	local Callback = nil
	local BindableEvent = Instance.new("BindableEvent")
	
	local function closeWindow() --[[ Line: 862 ]]
		-- upvalues: Total (ref), ClockFunction (copy), v1 (ref)
		Total += (ClockFunction() - v1) * 1000
	end
	
	local HeartbeatConnection = RunService.Heartbeat:Connect(function() --[[ Line: 865 ]]
		-- upvalues: Flag (ref), closeWindow (copy)
		if Flag then
			task.defer(closeWindow)
		end
	end)
	local PreRenderConnection = RunService.PreRender:Connect(function() --[[ Line: 870 ]]
		-- upvalues: Flag (ref), Total (ref), ClockFunction (copy), v1 (ref), Count (ref), BindableEvent (copy)
		if Flag then
			task.defer(function() --[[ Line: 874 ]]
				-- upvalues: Total (upval), ClockFunction (upval), v1 (upval), Flag (upval), Count (upval), BindableEvent (upval)
				Total += (ClockFunction() - v1) * 1000
				Flag = false
				Count -= 1
				
				if Count == 0 then
					BindableEvent:Fire()
				end
			end)
			
			return
		end
	end)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = game:GetService("CoreGui")
	local ScrollFrame = Instance.new("ScrollingFrame")
	ScrollFrame.Size = UDim2.fromOffset(300, 600)
	ScrollFrame.Parent = ScreenGui
	local Buffer = table.create(1000)
	
	for i = 1, 1000 do
		table.insert(Buffer, { id = `row-{i}`, length = i * 7 % 41 + 40 })
	end
	local MeasuredResult = if p35 == "measured" then ViewRecyclerModule.Layout.measured({ estimatedItemLength = 60 }) else ViewRecyclerModule.Layout.uniform({ itemLength = 60 })
	local CreateResult = CreateFunction({
		itemViewAdapter = {
			create = function() --[[ Line: 898 ]]
				local Frame = Instance.new("Frame")
				Frame.BackgroundTransparency = 1
				local Content = Instance.new("Frame")
				Content.Name = "Content"
				Content.Parent = Frame
				
				return Frame
			end
		}
	})
	local VirtualizerModule = CreateVirtualizerModule({
		scrollingFrame = ScrollFrame,
		axis = p34.Axis.Y,
		dataSource = ViewRecyclerModule.DataSource.sequence(Buffer, function(p36) --[[ Line: 911 ]]
			return p36.id
		end),
		layout = MeasuredResult,
		recyclingScope = CreateResult,
		getItemViewType = function(): string --[[ Line: 916 ]]
			return "row"
		end,
		transition = function(Object, p36) --[[ Line: 919 ]]
			if p36 ~= nil then
				Object:FindFirstChild("Content").Size = UDim2.new(1, 0, 0, p36.value.length)
			end
		end
	})
	local PreAnimationConnection = RunService.PreAnimation:Connect(function() --[[ Line: 928 ]]
		-- upvalues: Count (ref), Flag (ref), v1 (ref), ClockFunction (copy), Callback (ref)
		if Count <= 0 then return end
		Flag = true
		v1 = ClockFunction()
		
		if Callback ~= nil then
			Callback()
		end
	end)
	local RenderSteppedConnection = RunService.RenderStepped:Connect(function() --[[ Line: 938 ]]
		-- upvalues: Flag (ref), v1 (ref), ClockFunction (copy)
		if Flag then
			v1 = ClockFunction()
		end
	end)
	
	local function _(): number --[[ Line: 944 | Named "mountedHosts" ]]
		-- upvalues: ScrollFrame (copy)
		local Count = 0
		
		for _, descendant in ScrollFrame:GetDescendants() do
			if descendant.Name == "Content" then
				Count += 1
			end
		end
		return Count
	end
	
	for _ = 1, 15 do
		RunService.Heartbeat:Wait()
	end
	return {
		scrollingFrame = ScrollFrame,
		sample = function(Smallest, p36): number --[[ Line: 960 ]]
			-- upvalues: Total (ref), Callback (ref), Flag (ref), Count (ref), BindableEvent (copy)
			Total = 0
			Callback = p36
			Flag = false
			Count = Smallest
			BindableEvent.Event:Wait()
			Callback = nil
			
			return Total
		end,
		visibleContent = function() --[[ Line: 969 ]]
			-- upvalues: ScrollFrame (copy)
			local Y = ScrollFrame.AbsolutePosition.Y
			local NewY = Y + ScrollFrame.AbsoluteWindowSize.Y
			
			for _, descendant in ScrollFrame:GetDescendants() do
				if descendant.Name == "Content" and descendant.Parent.Visible then
					local Y1 = descendant.AbsolutePosition.Y
					
					if Y <= Y1 and Y1 < NewY then
						return descendant
					end
				end
			end
			return nil
		end,
		evidence = function() --[[ Line: 982 ]]
			-- upvalues: ScrollFrame (copy)
			local config = {
				stacked = ScrollFrame:FindFirstChild("ViewRecyclerStack") ~= nil
			}
			local MountedHosts = 0
			
			for _, descendant in ScrollFrame:GetDescendants() do
				if descendant.Name == "Content" then
					MountedHosts += 1
				end
			end
			config.mountedHosts = MountedHosts
			
			return config
		end,
		destroy = function() --[[ Line: 988 ]]
			-- upvalues: PreAnimationConnection (copy), RenderSteppedConnection (copy), HeartbeatConnection (copy), PreRenderConnection (copy), VirtualizerModule (copy), CreateResult (copy), MeasuredResult (copy), ScreenGui (copy), BindableEvent (copy)
			PreAnimationConnection:Disconnect()
			RenderSteppedConnection:Disconnect()
			HeartbeatConnection:Disconnect()
			PreRenderConnection:Disconnect()
			VirtualizerModule.destroy()
			CreateResult.dispose()
			MeasuredResult.destroy()
			ScreenGui:Destroy()
			BindableEvent:Destroy()
		end
	}
end

local list = {
	{
		name = "scroll",
		workload = "layout-scroll-frame-work",
		description = "Main-thread adapter work per frame, before render, while scrolling 37 px per frame through 1,000 Items: a uniform list placed absolutely beside a measured list stacked.",
		layouts = { "uniform", "measured" }
	},
	{
		name = "resize",
		workload = "measured-resize-frame-work",
		description = "Main-thread adapter work per frame, before render, while one visible measured Item changes length every frame.",
		layouts = { "measured" }
	},
	{
		name = "idle",
		workload = "layout-idle-frame-work",
		description = "Main-thread adapter work per frame, before render, for a settled list with no scroll or content change: a uniform list placed absolutely beside a measured list stacked.",
		layouts = { "uniform", "measured" }
	}
}

local function frameWorkWorkloads(p36, p37, p38, OperationCount: number, p39) --[[ Line: 1023 ]]
	-- upvalues: list (copy), createFrameWorkList (copy), ResponsibilityCatalogModule (copy)
	local Smallest = math.min(OperationCount, 10)
	local CreateResults = {}
	
	for _, value in list do
		local Arms = {}
		local Evidence = { items = 1000, framesPerSample = Smallest }
		
		for _, layout in value.layouts do
			local FrameWorkList = createFrameWorkList(p36, layout)
			local Inverted = false
			local v2: (() -> ())? = nil
			
			if value.name == "scroll" then
				v2 = function() --[[ Line: 1040 ]]
					-- upvalues: FrameWorkList (copy)
					FrameWorkList.scrollingFrame.CanvasPosition += Vector2.new(0, 37)
				end
			elseif value.name == "resize" then
				local VisibleContentResult = FrameWorkList.visibleContent()
				assert(VisibleContentResult ~= nil, "frame-work benchmark found no visible Item")
				local Offset = VisibleContentResult.Size.Y.Offset
				
				v2 = function() --[[ Line: 1048 ]]
					-- upvalues: Inverted (ref), VisibleContentResult (copy), Offset (copy)
					Inverted = not Inverted
					VisibleContentResult.Size = UDim2.new(1, 0, 0, if Inverted then Offset + 20 else Offset)
				end
			end
			local Text: string = `{layout}{if layout == "measured" then "Stacked" else "Absolute"}`
			Arms[Text] = p37.run(function() --[[ Line: 1055 ]]
				-- upvalues: FrameWorkList (copy), Smallest (copy), v2 (ref)
				return FrameWorkList.sample(Smallest, v2)
			end, p39)
			Evidence[Text] = FrameWorkList.evidence()
			FrameWorkList.destroy()
		end
		table.insert(CreateResults, p38.create({
			suite = "view-recycler-roblox",
			layer = "robloxHost",
			owner = "roblox",
			timingClass = "integrated",
			responsibility = ResponsibilityCatalogModule.Roblox.GeometryPlacement,
			workload = value.workload,
			description = value.description,
			scale = { items = 1000, frames = Smallest },
			timing = {
				unit = "ms",
				basis = "mainThreadFrameWorkBeforeRender",
				includesSchedulerWaits = false,
				operationsPerSample = Smallest
			},
			arms = Arms,
			evidence = Evidence
		}))
	end
	return CreateResults
end

local function teardownWorkload(p40, p41, p42, OperationCount, p43) --[[ Line: 1089 ]]
	-- upvalues: ViewRecyclerModule (copy), CreateFunction (copy), CreateVirtualizerModule (copy), record (copy), ResponsibilityCatalogModule (copy)
	local Clock = p43.clock or os.clock
	local AdaptersDestroyed = 0
	local ItemViewsDestroyed = 0
	local IdempotentDestroyCalls = 0
	local Count = 0
	local HostTeardownMs = 0
	local ScopeTeardownMs = 0
	
	return record(p42, ResponsibilityCatalogModule.Roblox.Teardown, "integrated", "full-adapter-teardown", "Destroys populated Roblox virtualizers, physical hosts, connections, measurement state, and owned RecyclingScopes.", "fullAdapterTeardownBatch", false, OperationCount, p41.run(function(): number --[[ Line: 1103 ]]
		-- upvalues: AdaptersDestroyed (ref), ItemViewsDestroyed (ref), IdempotentDestroyCalls (ref), HostTeardownMs (ref), ScopeTeardownMs (ref), OperationCount (copy), Count (ref), ViewRecyclerModule (upval), CreateFunction (upval), CreateVirtualizerModule (upval), p40 (copy), Clock (copy)
		AdaptersDestroyed = 0
		ItemViewsDestroyed = 0
		IdempotentDestroyCalls = 0
		HostTeardownMs = 0
		ScopeTeardownMs = 0
		local Total = 0
		
		for _ = 1, OperationCount do
			Count += 1
			local ScrollFrame = Instance.new("ScrollingFrame")
			ScrollFrame.Size = UDim2.fromOffset(100, 40)
			local UniformResult = ViewRecyclerModule.Layout.uniform({ itemLength = 20 })
			local CreateResult = CreateFunction({
				itemViewAdapter = {
					create = function() --[[ Line: 1117 ]]
						return Instance.new("Frame")
					end
				},
				destroyItemView = function(Object) --[[ Line: 1121 ]]
					-- upvalues: ItemViewsDestroyed (upval)
					ItemViewsDestroyed += 1
					Object:Destroy()
				end
			})
			local VirtualizerModule = CreateVirtualizerModule({
				scrollingFrame = ScrollFrame,
				axis = p40.Axis.Y,
				dataSource = ViewRecyclerModule.DataSource.snapshot({ `a-{Count}`, `b-{Count}` }, function(p44) --[[ Line: 1131 ]]
					return p44
				end),
				layout = UniformResult,
				recyclingScope = CreateResult,
				transition = function() --[[ Line: 1137 ]] end,
				getItemViewType = function(): string --[[ Line: 1138 ]]
					return "row"
				end
			})
			local ClockResult = Clock()
			VirtualizerModule.destroy()
			local ScaledClockResult = (Clock() - ClockResult) * 1000
			local ClockResult1 = Clock()
			CreateResult.dispose()
			local ScaledClockResult1 = (Clock() - ClockResult1) * 1000
			HostTeardownMs += ScaledClockResult
			ScopeTeardownMs += ScaledClockResult1
			Total += ScaledClockResult + ScaledClockResult1
			AdaptersDestroyed += 1
			VirtualizerModule.destroy()
			CreateResult.dispose()
			IdempotentDestroyCalls += 1
			UniformResult.destroy()
			ScrollFrame:Destroy()
		end
		return Total
	end, p43), {
		adaptersDestroyed = AdaptersDestroyed,
		itemViewsDestroyed = ItemViewsDestroyed,
		idempotentDestroyCalls = IdempotentDestroyCalls,
		milestones = {
			hostTeardownMs = HostTeardownMs,
			scopeTeardownMs = ScopeTeardownMs
		}
	})
end

return {
	run = function(p44, p45, p46, p47) --[[ Line: 1182 ]]
		-- upvalues: placementWorkload (copy), placementRoutingWorkload (copy), reparentSelectionWorkload (copy), physicalLifecycleWorkload (copy), scrollSynchronizationWorkload (copy), canvasPublicationWorkload (copy), measurementSchedulingWorkload (copy), measurementHeartbeatWorkload (copy), viewportActivationWorkload (copy), teardownWorkload (copy), frameWorkWorkloads (copy)
		local P99 = p47 or {}
		local OperationCount = P99.operationCount or 100
		assert(OperationCount >= 1 and OperationCount % 1 == 0, "operationCount must be a positive integer")
		local List = {
			placementWorkload(p44, p45, p46, OperationCount, P99),
			placementRoutingWorkload(p44, p45, p46, OperationCount, P99),
			reparentSelectionWorkload(p45, p46, OperationCount, P99),
			physicalLifecycleWorkload(p44, p45, p46, OperationCount, P99),
			scrollSynchronizationWorkload(p44, p45, p46, OperationCount, P99),
			canvasPublicationWorkload(p44, p45, p46, OperationCount, P99),
			measurementSchedulingWorkload(p44, p45, p46, OperationCount, P99),
			measurementHeartbeatWorkload(p44, p45, p46, P99),
			viewportActivationWorkload(p44, p45, p46, OperationCount, P99),
			teardownWorkload(p44, p45, p46, OperationCount, P99)
		}
		
		for _, value in frameWorkWorkloads(p44, p45, p46, OperationCount, P99) do
			table.insert(List, value)
		end
		return List
	end
}