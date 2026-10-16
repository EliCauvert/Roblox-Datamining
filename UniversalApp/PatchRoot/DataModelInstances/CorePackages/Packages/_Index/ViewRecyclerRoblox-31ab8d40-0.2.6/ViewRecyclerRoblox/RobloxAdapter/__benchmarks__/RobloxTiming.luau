local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local ViewRecyclerModule = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local MeasurementBatcherModule = require(ViewRecyclerRoblox.RobloxAdapter.MeasurementBatcher)
local ReparentableHostModule = require(ViewRecyclerRoblox.RobloxAdapter.ReparentableHost)
local ResponsibilityCatalogModule = require(ViewRecyclerRoblox.Parent.Parent.ViewRecycler.ViewRecycler.Core.Diagnostics.__benchmarks__.ResponsibilityCatalog)
local CreateFunction = require(ViewRecyclerRoblox.RobloxAdapter.createRecyclingScope).create
local CreateVirtualizerModule = require(ViewRecyclerRoblox.RobloxAdapter.createVirtualizer)

local function record(p1, MeasurementScheduling, TimingClass, Workload, Description, Basis, IncludesSchedulerWaits, Operations, MeasureResult, Evidence) --[[ Line: 50 ]]
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

local function placementWorkload(p1, p2, p3, OperationCount: number, p4) --[[ Line: 86 ]]
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
	local HostBoundary = record(p3, ResponsibilityCatalogModule.Roblox.GeometryPlacement, "hostBoundary", "geometry-placement-paths", "Groups changed, unchanged, and reparented CanvasItemPlacer paths.", "placementPathBatch", false, OperationCount, p2.measure(function() --[[ Line: 111 ]]
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

local function createPlacementRoutingFixture(p5, p6, Placement) --[[ Line: 146 ]]
	local ScrollFrame = Instance.new("ScrollingFrame")
	local Frame = Instance.new("Frame")
	local Frame1 = Instance.new("Frame")
	local Placement1 = Placement
	local Placement2 = 0
	local Assignment = { key = "row", index = 1, value = "row", generation = 1 }
	local NewResult = p5.HostPlacement.new({
		selfSizing = false,
		container = ScrollFrame,
		viewportContainer = if p6 then Frame else nil,
		axis = p5.Axis.Y,
		onItemMeasurements = function() --[[ Line: 167 ]] end,
		onItemViewPresentationChanged = function() --[[ Line: 168 ]] end
	})
	
	local function placementIntent() --[[ Line: 170 ]]
		-- upvalues: Assignment (copy), Placement2 (ref), Placement1 (ref)
		return {
			contentStartOffset = 0,
			measurementIdentity = nil,
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
	
	NewResult.applyHostState(Frame1, {
		phase = "presented",
		visible = true,
		host = Frame1,
		assignment = Assignment
	})
	NewResult.applyPlacementIntent(Frame1, (placementIntent()))
	
	return {
		canvas = ScrollFrame,
		overlay = Frame,
		host = Frame1,
		hostPlacement = NewResult,
		setPlacement = function(Value, Value1) --[[ Line: 204 ]]
			-- upvalues: Placement2 (ref), Placement1 (ref)
			Placement2 = Value
			Placement1 = Value1
		end,
		publishPlacementGeometry = function() --[[ Line: 208 ]]
			-- upvalues: NewResult (copy), Frame1 (copy), placementIntent (copy)
			NewResult.applyPlacementIntent(Frame1, (placementIntent()))
		end
	}
end

local function _(PlacementRoutingFixture) --[[ Line: 214 | Named "destroyPlacementRoutingFixture" ]]
	PlacementRoutingFixture.hostPlacement.destroy()
	PlacementRoutingFixture.host:Destroy()
	PlacementRoutingFixture.overlay:Destroy()
	PlacementRoutingFixture.canvas:Destroy()
end

local function placementRoutingWorkload(p5, p6, p7, CanvasFallbackGeometryPublications, p8) --[[ Line: 221 ]]
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
			canvasFallback = p6.measure(function() --[[ Line: 232 ]]
				-- upvalues: CanvasFallbackGeometryPublications (copy), PlacementRoutingFixture (copy)
				for i = 1, CanvasFallbackGeometryPublications do
					PlacementRoutingFixture.setPlacement(i, true)
					PlacementRoutingFixture.publishPlacementGeometry(i)
				end
			end, p8),
			viewportOverlay = p6.measure(function() --[[ Line: 238 ]]
				-- upvalues: CanvasFallbackGeometryPublications (copy), PlacementRoutingFixture1 (copy)
				for i = 1, CanvasFallbackGeometryPublications do
					PlacementRoutingFixture1.setPlacement(i, true)
					PlacementRoutingFixture1.publishPlacementGeometry(i)
				end
			end, p8),
			routingTransitions = p6.measure(function() --[[ Line: 244 ]]
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

local function reparentSelectionWorkload(p9, p10, OperationCount, p11) --[[ Line: 292 ]]
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
	local HostBoundary = record(p10, ResponsibilityCatalogModule.Roblox.ReparentSelection, "hostBoundary", "reparent-selection-cleanup", "Places ReparentableHost instances and clears descendant selection while detaching.", "reparentSelectionBatch", false, OperationCount, p9.measure(function() --[[ Line: 311 ]]
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

local function leaseLifecycleWorkload(p12, p13, p14, OperationCount, p15) --[[ Line: 353 ]]
	-- upvalues: record (copy), ResponsibilityCatalogModule (copy)
	local Folder = Instance.new("Folder")
	local Frame = Instance.new("Frame")
	local NewResult = p12.HostPlacement.new({
		selfSizing = false,
		container = Folder,
		axis = p12.Axis.Y,
		onItemMeasurements = function() --[[ Line: 366 ]] end,
		onItemViewPresentationChanged = function() --[[ Line: 367 ]] end
	})
	local Config = nil
	local Attachments = 0
	local Detachments = 0
	local Integrated = record(p14, ResponsibilityCatalogModule.Roblox.LeaseLifecycle, "integrated", "canvas-item-view-runtime-lease-lifecycle", "Transitions one HostPlacement host Lease through attachment and detachment without measurement work.", "leaseAttachDetachBatch", false, OperationCount, p13.measure(function() --[[ Line: 372 ]]
		-- upvalues: Attachments (ref), Detachments (ref), OperationCount (copy), Config (ref), NewResult (copy), Frame (copy), Folder (copy)
		Attachments = 0
		Detachments = 0
		
		for i = 1, OperationCount do
			Config = { key = "row", index = 1, value = "row", generation = i }
			NewResult.applyPlacementIntent(Frame, {
				viewportPlacement = nil,
				contentStartOffset = 0,
				measurementIdentity = nil,
				assignment = Config,
				itemLayout = { startOffset = 0, length = 40 },
				canvasPlacement = {}
			})
			NewResult.applyHostState(Frame, {
				phase = "presented",
				visible = true,
				host = Frame,
				assignment = Config
			})
			
			if Frame.Parent == Folder then
				Attachments += 1
			end
			NewResult.applyHostState(Frame, nil)
			Config = nil
			
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

local function createScrollHost(p16, ScrollFrame) --[[ Line: 429 ]]
	-- upvalues: ViewRecyclerModule (copy)
	local Offset = ScrollFrame.CanvasSize.Y.Offset
	local Count = 0
	local Count1 = 0
	local SnapshotResult = ViewRecyclerModule.DataSource.snapshot({}, function(p17) --[[ Line: 433 ]]
		return p17
	end)
	local config = {
		dispatch = function(p17) --[[ Line: 437 ]]
			-- upvalues: ViewRecyclerModule (upval), Count (ref), Count1 (ref)
			if p17.type == ViewRecyclerModule.VirtualizerCommandType.SetViewportSize then
				Count += 1
			elseif p17.type == ViewRecyclerModule.VirtualizerCommandType.ObserveScrollOffset then
				Count1 += 1
			end
			return {
				snapshot = nil,
				effects = {},
				result = if p17.type == ViewRecyclerModule.VirtualizerCommandType.ApplyScrollAnchorOffset then p17.offset else nil
			}
		end,
		getSnapshot = function() --[[ Line: 451 ]]
			-- upvalues: Offset (ref)
			return { contentLength = Offset }
		end,
		query = function(p17) --[[ Line: 454 ]]
			-- upvalues: ViewRecyclerModule (upval), ScrollFrame (copy), Offset (ref)
			return if p17.type == ViewRecyclerModule.VirtualizerQueryType.GetScrollOffsetForItem then 0 else {
				atStart = true,
				atEnd = false,
				scrollOffset = ScrollFrame.CanvasPosition.Y,
				viewportLength = ScrollFrame.AbsoluteWindowSize.Y,
				contentLength = Offset,
				distanceFromEnd = Offset
			}
		end
	}
	local NewResult = p16.ScrollingFrameSync.new({
		dispatch = config.dispatch,
		getSnapshot = config.getSnapshot,
		query = config.query,
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
	end, function(Offset1) --[[ Line: 497 ]]
		-- upvalues: Offset (ref), NewResult (copy), ViewRecyclerModule (upval)
		local Snapshot = { contentLength = Offset }
		NewResult.applyVirtualizerUpdate(Snapshot, {
			snapshot = Snapshot,
			effects = {
				{
					type = ViewRecyclerModule.VirtualizerEffectType.ScrollPositionChanged,
					offset = Offset1
				}
			},
			presentation = { assignmentsChanged = false, placementChanged = false }
		})
	end, function(p17) --[[ Line: 505 ]]
		-- upvalues: Offset (ref)
		Offset = p17
	end, (NewResult.connect())
end

local function scrollSynchronizationWorkload(p16, p17, p18, OperationCount, p19) --[[ Line: 511 ]]
	-- upvalues: createScrollHost (copy), record (copy), ResponsibilityCatalogModule (copy)
	local ScrollFrame = Instance.new("ScrollingFrame")
	ScrollFrame.Size = UDim2.fromOffset(400, 400)
	ScrollFrame.CanvasSize = UDim2.fromOffset(400, 4000)
	local ScrollHost, ScrollHost2, ScrollHost3, _, ScrollHost5 = createScrollHost(p16, ScrollFrame)
	local MeasureResult = p17.measure(function() --[[ Line: 522 ]]
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

local function canvasPublicationWorkload(p20, p21, p22, OperationCount, p23) --[[ Line: 551 ]]
	-- upvalues: createScrollHost (copy), record (copy), ResponsibilityCatalogModule (copy)
	local ScrollFrame = Instance.new("ScrollingFrame")
	local _, _, ScrollHost3, ScrollHost4, ScrollHost5 = createScrollHost(p20, ScrollFrame)
	local CanvasPublications = 0
	local HostBoundary = record(p22, ResponsibilityCatalogModule.Roblox.CanvasPublication, "hostBoundary", "canvas-size-publication", "Computes and publishes adapter canvas sizes to a ScrollingFrame.", "canvasPublicationBatch", false, OperationCount, p21.measure(function() --[[ Line: 561 ]]
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

local function measurementSchedulingWorkload(p24, p25, p26, OperationCount, p27) --[[ Line: 589 ]]
	-- upvalues: MeasurementBatcherModule (copy), record (copy), ResponsibilityCatalogModule (copy)
	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.fromOffset(100, 40)
	local config = {
		key = "row",
		index = 1,
		assignmentGeneration = 1,
		itemRevision = 0
	}
	local Evidence = {}
	local MeasureResult = p25.measure(function() --[[ Line: 605 ]]
		-- upvalues: p24 (copy), Frame (copy), config (copy), MeasurementBatcherModule (upval), OperationCount (copy), Evidence (ref)
		local List = {}
		local BatchFlushes = 0
		local BatchedMeasurements = 0
		local Cancellations = 0
		local AttachResult = p24.Measurer.attach({
			instance = Frame,
			axis = p24.Axis.Y,
			getIdentity = function() --[[ Line: 613 ]]
				-- upvalues: config (upval)
				return config
			end,
			onItemMeasured = function() --[[ Line: 616 ]] end
		})
		local NewMeasurementBatcher = MeasurementBatcherModule.new(function(p28) --[[ Line: 618 ]]
			-- upvalues: BatchFlushes (ref), BatchedMeasurements (ref)
			BatchFlushes += 1
			BatchedMeasurements += #p28
		end, function(p28) --[[ Line: 621 ]]
			-- upvalues: List (copy)
			table.insert(List, p28)
		end)
		
		for i = 1, OperationCount do
			config.itemRevision = i
			AttachResult.scheduleSettle()
			AttachResult.scheduleSettle()
			NewMeasurementBatcher.add({
				itemKey = "row",
				assignmentGeneration = 1,
				length = 40,
				itemRevision = i
			})
			NewMeasurementBatcher.add({
				itemKey = "row",
				assignmentGeneration = 1,
				length = 41,
				itemRevision = i
			})
			table.remove(List, 1)()
			NewMeasurementBatcher.add({
				itemKey = "cancelled",
				assignmentGeneration = 1,
				length = 0,
				itemRevision = i
			})
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

local function measurementHeartbeatWorkload(p28, p29, p30, p31) --[[ Line: 662 ]]
	-- upvalues: RunService (copy), record (copy), ResponsibilityCatalogModule (copy)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = game:GetService("CoreGui")
	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.fromOffset(100, 40)
	Frame.Parent = ScreenGui
	RunService.Heartbeat:Wait()
	local config = {
		key = "row",
		index = 1,
		assignmentGeneration = 1,
		itemRevision = 0
	}
	local Count = 0
	local ObservedMeasurements = 0
	local LastMeasuredLength = -1
	local BindableEvent = Instance.new("BindableEvent")
	local AttachResult = p28.Measurer.attach({
		instance = Frame,
		axis = p28.Axis.Y,
		getIdentity = function() --[[ Line: 687 ]]
			-- upvalues: config (copy)
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
		-- upvalues: config (copy), Count (ref), AttachResult (copy), Clock (copy), BindableEvent (copy), ObservedMeasurements (ref)
		config.itemRevision += 1
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

local function viewportActivationWorkload(p30, p31, p32, NoOpEvaluations: number, p33) --[[ Line: 777 ]]
	-- upvalues: createFakeGui (copy), record (copy), ResponsibilityCatalogModule (copy)
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
	local RegisterResult: () -> () = NewResult.register(FakeGui1, function() --[[ Line: 796 ]]
		-- upvalues: Count (ref)
		Count += 1
	end)
	local Integrated = record(p32, ResponsibilityCatalogModule.Roblox.ViewportActivation, "integrated", "viewport-activation-transitions", "Evaluates positive activation transitions alongside unchanged no-op evaluations.", "viewportActivationBatch", false, NoOpEvaluations, p31.measure(function() --[[ Line: 800 ]]
		-- upvalues: NoOpEvaluations (copy), FakeGui1 (copy)
		for _ = 1, NoOpEvaluations do
			FakeGui1.AbsolutePosition = Vector2.new(0, 50)
			FakeGui1:fire("AbsolutePosition")
			FakeGui1:fire("AbsolutePosition")
			FakeGui1.AbsolutePosition = Vector2.new(0, 150)
			FakeGui1:fire("AbsolutePosition")
		end
	end, p33), {
		evaluations = NoOpEvaluations * 3,
		transitions = Count - Count,
		noOpEvaluations = NoOpEvaluations
	})
	RegisterResult()
	NewResult.destroy()
	FakeGui1:destroy()
	FakeGui:destroy()
	
	return Integrated
end

local function teardownWorkload(p34, p35, p36, OperationCount, p37) --[[ Line: 832 ]]
	-- upvalues: ViewRecyclerModule (copy), CreateFunction (copy), CreateVirtualizerModule (copy), record (copy), ResponsibilityCatalogModule (copy)
	local Clock = p37.clock or os.clock
	local AdaptersDestroyed = 0
	local ItemViewsDestroyed = 0
	local IdempotentDestroyCalls = 0
	local Count = 0
	local HostTeardownMs = 0
	local ScopeTeardownMs = 0
	
	return record(p36, ResponsibilityCatalogModule.Roblox.Teardown, "integrated", "full-adapter-teardown", "Destroys populated Roblox virtualizers, host Leases, connections, measurement state, and owned RecyclingScopes.", "fullAdapterTeardownBatch", false, OperationCount, p35.run(function(): number --[[ Line: 846 ]]
		-- upvalues: AdaptersDestroyed (ref), ItemViewsDestroyed (ref), IdempotentDestroyCalls (ref), HostTeardownMs (ref), ScopeTeardownMs (ref), OperationCount (copy), Count (ref), ViewRecyclerModule (upval), CreateFunction (upval), CreateVirtualizerModule (upval), p34 (copy), Clock (copy)
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
					create = function() --[[ Line: 860 ]]
						return Instance.new("Frame")
					end,
					update = function() --[[ Line: 863 ]] end
				},
				destroyItemView = function(Object) --[[ Line: 865 ]]
					-- upvalues: ItemViewsDestroyed (upval)
					ItemViewsDestroyed += 1
					Object:Destroy()
				end
			})
			local VirtualizerModule = CreateVirtualizerModule({
				scrollingFrame = ScrollFrame,
				axis = p34.Axis.Y,
				dataSource = ViewRecyclerModule.DataSource.snapshot({ `a-{Count}`, `b-{Count}` }, function(p38) --[[ Line: 875 ]]
					return p38
				end),
				layout = UniformResult,
				recyclingScope = CreateResult,
				getItemViewType = function(): string --[[ Line: 881 ]]
					return "row"
				end
			})
			local ClockResult = Clock()
			VirtualizerModule.destroy()
			local ScaledClockResult = (Clock() - ClockResult) * 1000
			local ClockResult1 = Clock()
			CreateResult.destroy()
			local ScaledClockResult1 = (Clock() - ClockResult1) * 1000
			HostTeardownMs += ScaledClockResult
			ScopeTeardownMs += ScaledClockResult1
			Total += ScaledClockResult + ScaledClockResult1
			AdaptersDestroyed += 1
			VirtualizerModule.destroy()
			CreateResult.destroy()
			IdempotentDestroyCalls += 1
			UniformResult.destroy()
			ScrollFrame:Destroy()
		end
		return Total
	end, p37), {
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
	run = function(p38, p39, p40, p41) --[[ Line: 925 ]]
		-- upvalues: placementWorkload (copy), placementRoutingWorkload (copy), reparentSelectionWorkload (copy), leaseLifecycleWorkload (copy), scrollSynchronizationWorkload (copy), canvasPublicationWorkload (copy), measurementSchedulingWorkload (copy), measurementHeartbeatWorkload (copy), viewportActivationWorkload (copy), teardownWorkload (copy)
		local P88 = p41 or {}
		local OperationCount = P88.operationCount or 100
		assert(OperationCount >= 1 and OperationCount % 1 == 0, "operationCount must be a positive integer")
		
		return {
			placementWorkload(p38, p39, p40, OperationCount, P88),
			placementRoutingWorkload(p38, p39, p40, OperationCount, P88),
			reparentSelectionWorkload(p39, p40, OperationCount, P88),
			leaseLifecycleWorkload(p38, p39, p40, OperationCount, P88),
			scrollSynchronizationWorkload(p38, p39, p40, OperationCount, P88),
			canvasPublicationWorkload(p38, p39, p40, OperationCount, P88),
			measurementSchedulingWorkload(p38, p39, p40, OperationCount, P88),
			measurementHeartbeatWorkload(p38, p39, p40, P88),
			viewportActivationWorkload(p38, p39, p40, OperationCount, P88),
			teardownWorkload(p38, p39, p40, OperationCount, P88)
		}
	end
}