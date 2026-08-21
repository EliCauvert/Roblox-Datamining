local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local viewRecycler = viewRecyclerRoblox.Parent.Parent.ViewRecycler.ViewRecycler
local viewRecyclerModule = require(viewRecyclerRoblox.Parent.ViewRecycler)
local measurementBatcherModule = require(viewRecyclerRoblox.RobloxAdapter.MeasurementBatcher)
local reparentableHostModule = require(viewRecyclerRoblox.RobloxAdapter.ReparentableHost)
local responsibilityCatalogModule = require(viewRecycler.Core.Diagnostics.__benchmarks__.ResponsibilityCatalog)
local create = require(viewRecyclerRoblox.RobloxAdapter.createRecyclingScope).create
local createVirtualizerModule = require(viewRecyclerRoblox.RobloxAdapter.createVirtualizer)

local function record(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9) --[[ line: 50 ]]
	return p0.create({
		suite = "view-recycler-roblox",
		layer = "robloxHost",
		owner = "roblox",
		responsibility = p1,
		timingClass = p2,
		workload = p3,
		description = p4,
		scale = { operations = p7 },
		timing = {
			unit = "ms",
			basis = p5,
			operationsPerSample = p7,
			includesSchedulerWaits = p6
		},
		arms = { viewRecycler = p8 },
		evidence = p9
	})
end

local function placementWorkload(p10, p11, p12, p13, p14) --[[ line: 86 ]]
	-- upvalues: record (ref), responsibilityCatalogModule (ref)
	local folder = Instance.new("Folder")
	local folder_1 = Instance.new("Folder")
	local frame = Instance.new("Frame")
	local var25 = p10.CanvasItemPlacer.createState()
	local t = {
		position = UDim2.fromOffset(0, 40),
		size = UDim2.new(1, 0, 0, 40),
		automaticSize = Enum.AutomaticSize.None
	}
	local t_1 = {
		position = UDim2.fromOffset(0, 80),
		size = t.size,
		automaticSize = t.automaticSize
	}
	p10.CanvasItemPlacer.place(frame, folder, t, var25, true)
	local var28 = 0
	local var29 = 0
	local var30 = 0
	local var31 = record(p12, responsibilityCatalogModule.Roblox.GeometryPlacement, "hostBoundary", "geometry-placement-paths", "Groups changed, unchanged, and reparented CanvasItemPlacer paths.", "placementPathBatch", false, p13, p11.measure(function() --[[ line: 111 ]]
		-- upvalues: var28 (write), var29 (write), var30 (write), p13 (ref), p10 (ref), frame (ref), folder (ref), t_1 (ref), var25 (ref), folder_1 (ref), t (ref)
		var28 = 0
		var29 = 0
		var30 = 0
		
		for _ = 1, p13 do
			var28 += p10.CanvasItemPlacer.place(frame, folder, t_1, var25, true)
			var29 += p10.CanvasItemPlacer.place(frame, folder, t_1, var25, true)
			var30 += p10.CanvasItemPlacer.place(frame, folder_1, t_1, var25, true)
			var30 += p10.CanvasItemPlacer.place(frame, folder, t, var25, true)
		end
	end, p14), {
		placementCalls = p13 * 4,
		changedPropertyWrites = var28,
		unchangedPropertyWrites = var29,
		reparentPropertyWrites = var30
	})
	p10.CanvasItemPlacer.detach(frame, var25)
	frame:Destroy()
	folder:Destroy()
	folder_1:Destroy()
	
	return var31
end

local function createPlacementRoutingFixture(p15, p16, p17) --[[ line: 146 ]]
	local scrollingFrame = Instance.new("ScrollingFrame")
	local frame = Instance.new("Frame")
	local frame_1 = Instance.new("Frame")
	local var35 = p17
	local var36 = 0
	local t = { key = "row", index = 1, value = "row", generation = 1 }
	local var38 = p15.CanvasItemViewRuntime.new({
		selfSizing = false,
		container = scrollingFrame,
		viewportContainer = if p16 then frame else nil,
		axis = p15.Axis.Y,
		onItemMeasurements = function() --[[ line: 167 ]] end,
		onItemViewPresentationChanged = function() --[[ line: 168 ]] end
	})
	
	local function placementIntent() --[[ line: 170 ]]
		-- upvalues: t (ref), var36 (write), var35 (write)
		return {
			contentStartOffset = 0,
			measurementIdentity = nil,
			assignment = t,
			itemLayout = { startOffset = 0, length = 40 },
			canvasPlacement = { mainAxisLength = 40, mainAxisOffset = var36 },
			viewportPlacement = if var35 then {
				mainAxisLength = 40,
				viewportRelative = true,
				mainAxisOffset = var36
			} else nil
		}
	end
	
	var38.applyHostState(frame_1, {
		phase = "presented",
		visible = true,
		host = frame_1,
		assignment = t
	})
	var38.applyPlacementIntent(frame_1, placementIntent())
	
	return {
		canvas = scrollingFrame,
		overlay = frame,
		host = frame_1,
		runtime = var38,
		setPlacement = function(value, p18) --[[ line: 204 ]]
			-- upvalues: var36 (write), var35 (write)
			var36 = value
			var35 = p18
		end,
		publishPlacementGeometry = function() --[[ line: 208 ]]
			-- upvalues: var38 (ref), frame_1 (ref), placementIntent (ref)
			var38.applyPlacementIntent(frame_1, placementIntent())
		end
	}
end

local function _(p19) --[[ line: 214 | named "destroyPlacementRoutingFixture" ]]
	p19.runtime.destroy()
	p19.host:Destroy()
	p19.overlay:Destroy()
	p19.canvas:Destroy()
end

local function placementRoutingWorkload(p20, p21, p22, p23, p24) --[[ line: 221 ]]
	-- upvalues: createPlacementRoutingFixture (ref), responsibilityCatalogModule (ref)
	local var40 = createPlacementRoutingFixture(p20, false, true)
	local var41 = createPlacementRoutingFixture(p20, true, true)
	local var42 = createPlacementRoutingFixture(p20, true, true)
	local var43 = p22.create({
		suite = "view-recycler-roblox",
		layer = "robloxHost",
		owner = "roblox",
		timingClass = "integrated",
		workload = "viewport-overlay-placement-routing",
		description = "Compares retained overlay and canvas-fallback geometry with canvas-to-overlay routing transitions.",
		responsibility = responsibilityCatalogModule.Roblox.GeometryPlacement,
		scale = { operations = p23 },
		timing = {
			unit = "ms",
			basis = "placementPublicationBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p23
		},
		arms = {
			canvasFallback = p21.measure(function() --[[ line: 232 ]]
				-- upvalues: p23 (ref), var40 (ref)
				for i = 1, p23 do
					var40.setPlacement(i, true)
					var40.publishPlacementGeometry(i)
				end
			end, p24),
			viewportOverlay = p21.measure(function() --[[ line: 238 ]]
				-- upvalues: p23 (ref), var41 (ref)
				for i = 1, p23 do
					var41.setPlacement(i, true)
					var41.publishPlacementGeometry(i)
				end
			end, p24),
			routingTransitions = p21.measure(function() --[[ line: 244 ]]
				-- upvalues: p23 (ref), var42 (ref)
				for i = 1, p23 do
					var42.setPlacement(i, i % 2 == 0)
					var42.publishPlacementGeometry(i)
				end
			end, p24)
		},
		evidence = {
			canvasFallbackGeometryPublications = p23,
			overlayGeometryPublications = p23,
			routingPublications = p23,
			routingReparents = p23,
			canvasFallbackHostParent = var40.host.Parent == var40.canvas,
			overlayHostParent = var41.host.Parent == var41.overlay,
			routedHostInOverlay = var42.host.Parent == var42.overlay,
			canvasFallbackHostOffset = var40.host.Position.Y.Offset,
			overlayHostOffset = var41.host.Position.Y.Offset
		}
	})
	var40.runtime.destroy()
	var40.host:Destroy()
	var40.overlay:Destroy()
	var40.canvas:Destroy()
	var41.runtime.destroy()
	var41.host:Destroy()
	var41.overlay:Destroy()
	var41.canvas:Destroy()
	var42.runtime.destroy()
	var42.host:Destroy()
	var42.overlay:Destroy()
	var42.canvas:Destroy()
	
	return var43
end

local function reparentSelectionWorkload(p25, p26, p27, p28) --[[ line: 292 ]]
	-- upvalues: reparentableHostModule (ref), guiService (ref), record (ref), responsibilityCatalogModule (ref)
	local screenGui = Instance.new("ScreenGui")
	screenGui.Parent = game:GetService("CoreGui")
	local frame = Instance.new("Frame")
	frame.Parent = screenGui
	local frame_1 = Instance.new("Frame")
	frame_1.Parent = screenGui
	local benchmarkHost = reparentableHostModule.create("BenchmarkHost")
	local textButton = Instance.new("TextButton")
	textButton.Selectable = true
	textButton.Parent = benchmarkHost
	local var49 = 0
	local var50 = 0
	local var51 = 0
	local var52 = record(p26, responsibilityCatalogModule.Roblox.ReparentSelection, "hostBoundary", "reparent-selection-cleanup", "Places ReparentableHost instances and clears descendant selection while detaching.", "reparentSelectionBatch", false, p27, p25.measure(function() --[[ line: 311 ]]
		-- upvalues: var49 (write), var50 (write), var51 (write), p27 (ref), reparentableHostModule (copy), benchmarkHost (ref), frame (ref), frame_1 (ref), guiService (copy), textButton (ref)
		var49 = 0
		var50 = 0
		var51 = 0
		
		for i = 1, p27 do
			reparentableHostModule.place(benchmarkHost, {
				placeholder = if i % 2 == 0 then frame else frame_1,
				automaticSize = Enum.AutomaticSize.Y
			})
			var49 += 1
			
			if i == 1 then
				guiService.SelectedObject = textButton
			end
			reparentableHostModule.detach(benchmarkHost)
			var51 += 1
			
			if i == 1 and guiService.SelectedObject == nil then
				var50 += 1
			end
		end
	end, p28), {
		placements = var49,
		selectionClears = var50,
		detachments = var51,
		finalParentIsNil = benchmarkHost.Parent == nil
	})
	reparentableHostModule.destroy(benchmarkHost)
	screenGui:Destroy()
	
	return var52
end

local function leaseLifecycleWorkload(p29, p30, p31, p32, p33) --[[ line: 353 ]]
	-- upvalues: record (ref), responsibilityCatalogModule (ref)
	local folder = Instance.new("Folder")
	local frame = Instance.new("Frame")
	local var55 = p29.CanvasItemViewRuntime.new({
		selfSizing = false,
		container = folder,
		axis = p29.Axis.Y,
		onItemMeasurements = function() --[[ line: 366 ]] end,
		onItemViewPresentationChanged = function() --[[ line: 367 ]] end
	})
	local var56 = nil
	local var57 = 0
	local var58 = 0
	local var59 = record(p31, responsibilityCatalogModule.Roblox.LeaseLifecycle, "integrated", "canvas-item-view-runtime-lease-lifecycle", "Transitions one CanvasItemViewRuntime host Lease through attachment and detachment without measurement work.", "leaseAttachDetachBatch", false, p32, p30.measure(function() --[[ line: 372 ]]
		-- upvalues: var57 (write), var58 (write), p32 (ref), var56 (write), var55 (ref), frame (ref), folder (ref)
		var57 = 0
		var58 = 0
		
		for i = 1, p32 do
			var56 = { key = "row", index = 1, value = "row", generation = i }
			var55.applyPlacementIntent(frame, {
				viewportPlacement = nil,
				contentStartOffset = 0,
				measurementIdentity = nil,
				assignment = var56,
				itemLayout = { startOffset = 0, length = 40 },
				canvasPlacement = {}
			})
			var55.applyHostState(frame, {
				phase = "presented",
				visible = true,
				host = frame,
				assignment = var56
			})
			
			if frame.Parent == folder then
				var57 += 1
			end
			var55.applyHostState(frame, nil)
			var56 = nil
			
			if frame.Parent == nil and not frame.Visible then
				var58 += 1
			end
		end
	end, p33), {
		attachments = var57,
		detachments = var58,
		finalParentIsNil = frame.Parent == nil
	})
	var55.destroy()
	frame:Destroy()
	folder:Destroy()
	
	return var59
end

local function createScrollHost(p34, p35) --[[ line: 429 ]]
	-- upvalues: viewRecyclerModule (ref)
	local offset = p35.CanvasSize.Y.Offset
	local var60 = 0
	local var61 = 0
	local var62 = viewRecyclerModule.DataSource.snapshot({}, function(p36) --[[ line: 433 ]]
		return p36
	end)
	local t = {
		dispatch = function(p37) --[[ line: 437 ]]
			-- upvalues: viewRecyclerModule (copy), var60 (write), var61 (write)
			if p37.type == viewRecyclerModule.VirtualizerCommandType.SetViewportSize then
				var60 += 1
			elseif p37.type == viewRecyclerModule.VirtualizerCommandType.ObserveScrollOffset then
				var61 += 1
			end
			return {
				snapshot = nil,
				effects = {},
				result = if p37.type == viewRecyclerModule.VirtualizerCommandType.ApplyScrollAnchorOffset then p37.offset else nil
			}
		end,
		getSnapshot = function() --[[ line: 451 ]]
			-- upvalues: offset (write)
			return { contentLength = offset }
		end,
		query = function(p38) --[[ line: 454 ]]
			-- upvalues: viewRecyclerModule (copy), p35 (ref), offset (write)
			return if p38.type == viewRecyclerModule.VirtualizerQueryType.GetScrollOffsetForItem then 0 else {
				atStart = true,
				atEnd = false,
				scrollOffset = p35.CanvasPosition.Y,
				viewportLength = p35.AbsoluteWindowSize.Y,
				contentLength = offset,
				distanceFromEnd = offset
			}
		end
	}
	local var64 = p34.ScrollHostCoordinator.new({
		dispatch = t.dispatch,
		getSnapshot = t.getSnapshot,
		query = t.query,
		getInstance = function() --[[ line: 472 ]]
			-- upvalues: p35 (ref)
			return p35
		end,
		getConfiguration = function() --[[ line: 475 ]]
			-- upvalues: p34 (ref), var62 (ref)
			return {
				initialScrollAlignment = nil,
				autoScrollOnChange = nil,
				startReachedThreshold = nil,
				onStartReached = nil,
				onEndReached = nil,
				onViewportChanged = nil,
				onScrollOffsetChanged = nil,
				onContentLengthChanged = nil,
				axis = p34.Axis.Y,
				dataSource = var62
			}
		end
	})
	local var65 = var64.connect()
	var60 = 0
	var61 = 0
	
	return var64, function() --[[ line: 494 ]]
		-- upvalues: var60 (write), var61 (write)
		return var60, var61
	end, function(p39) --[[ line: 497 ]]
		-- upvalues: offset (write), var64 (ref), viewRecyclerModule (copy)
		local t = { contentLength = offset }
		var64.handleUpdate(t, {
			snapshot = t,
			effects = {
				{
					type = viewRecyclerModule.VirtualizerEffectType.ScrollPositionChanged,
					offset = p39
				}
			},
			presentation = { assignmentsChanged = false, placementChanged = false }
		})
	end, function(p40) --[[ line: 505 ]]
		-- upvalues: offset (write)
		offset = p40
	end, var65
end

local function scrollSynchronizationWorkload(p41, p42, p43, p44, p45) --[[ line: 511 ]]
	-- upvalues: createScrollHost (ref), record (ref), responsibilityCatalogModule (ref)
	local scrollingFrame = Instance.new("ScrollingFrame")
	scrollingFrame.Size = UDim2.fromOffset(400, 400)
	scrollingFrame.CanvasSize = UDim2.fromOffset(400, 4000)
	local var68, var69, var70, _, var71 = createScrollHost(p41, scrollingFrame)
	local var72 = p42.measure(function() --[[ line: 522 ]]
		-- upvalues: p44 (ref), var68 (ref), var70 (ref), scrollingFrame (ref)
		for i = 1, p44 do
			var68.hostChanged()
			var70(i)
			scrollingFrame.CanvasPosition = scrollingFrame.CanvasPosition
		end
	end, p45)
	local var73, var74 = var69()
	local var75 = record(p43, responsibilityCatalogModule.Roblox.ScrollViewportSync, "hostBoundary", "scroll-viewport-offset-correction-sync", "Synchronizes viewport geometry and attributes host-reported offsets to Programmatic or User scroll.", "scrollSynchronizationBatch", false, p44, var72, {
		viewportUpdates = var73,
		runtimeUpdates = var74,
		finalScrollOffset = scrollingFrame.CanvasPosition.Y
	})
	var71()
	scrollingFrame:Destroy()
	
	return var75
end

local function canvasPublicationWorkload(p46, p47, p48, p49, p50) --[[ line: 551 ]]
	-- upvalues: createScrollHost (ref), record (ref), responsibilityCatalogModule (ref)
	local scrollingFrame = Instance.new("ScrollingFrame")
	local _, _, var77, var78, var79 = createScrollHost(p46, scrollingFrame)
	local var80 = 0
	local var81 = record(p48, responsibilityCatalogModule.Roblox.CanvasPublication, "hostBoundary", "canvas-size-publication", "Computes and publishes adapter canvas sizes to a ScrollingFrame.", "canvasPublicationBatch", false, p49, p47.measure(function() --[[ line: 561 ]]
		-- upvalues: var80 (write), p49 (ref), var78 (ref), var77 (ref)
		var80 = 0
		
		for i = 1, p49 do
			var78(i * 40)
			var77(0)
			var80 += 1
		end
	end, p50), {
		canvasPublications = var80,
		finalCanvasLength = scrollingFrame.CanvasSize.Y.Offset
	})
	var79()
	scrollingFrame:Destroy()
	
	return var81
end

local function measurementSchedulingWorkload(p51, p52, p53, p54, p55) --[[ line: 589 ]]
	-- upvalues: measurementBatcherModule (ref), record (ref), responsibilityCatalogModule (ref)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.fromOffset(100, 40)
	local t = {
		key = "row",
		index = 1,
		assignmentGeneration = 1,
		itemRevision = 0
	}
	local t_1 = {}
	local var85 = p52.measure(function() --[[ line: 605 ]]
		-- upvalues: p51 (ref), frame (ref), t (ref), measurementBatcherModule (copy), p54 (ref), t_1 (write)
		local t_2 = {}
		local var87 = 0
		local var88 = 0
		local var89 = 0
		local var90 = p51.Measurer.attach({
			instance = frame,
			axis = p51.Axis.Y,
			getIdentity = function() --[[ line: 613 ]]
				-- upvalues: t (copy)
				return t
			end,
			onItemMeasured = function() --[[ line: 616 ]] end
		})
		local var91 = measurementBatcherModule.new(function(p56) --[[ line: 618 ]]
			-- upvalues: var87 (write), var88 (write)
			var87 += 1
			var88 += #p56
		end, function(p57) --[[ line: 621 ]]
			-- upvalues: t_2 (ref)
			table.insert(t_2, p57)
		end)
		
		for i = 1, p54 do
			t.itemRevision = i
			var90.scheduleSettle()
			var90.scheduleSettle()
			var91.add({
				itemKey = "row",
				assignmentGeneration = 1,
				length = 40,
				itemRevision = i
			})
			var91.add({
				itemKey = "row",
				assignmentGeneration = 1,
				length = 41,
				itemRevision = i
			})
			table.remove(t_2, 1)()
			var91.add({
				itemKey = "cancelled",
				assignmentGeneration = 1,
				length = 0,
				itemRevision = i
			})
			var91.cancelPending()
			table.remove(t_2, 1)()
			var89 += 1
		end
		t_1 = {
			settleRequests = p54 * 2,
			uniquePendingHeartbeats = var90.getPendingCount(),
			batchFlushes = var87,
			batchedMeasurements = var88,
			cancellations = var89,
			deferredCallbacksRemaining = #t_2
		}
		var91.destroy()
		var90.disconnect()
	end, p55)
	frame:Destroy()
	
	return record(p53, responsibilityCatalogModule.Roblox.MeasurementScheduling, "phased", "measurement-adapter-scheduling", "Schedules deduplicated settles, flushes measurement batches, and cancels stale batches without yielding.", "adapterMeasurementSchedulingBatch", false, p54, var85, t_1)
end

local function measurementHeartbeatWorkload(p58, p59, p60, p61) --[[ line: 662 ]]
	-- upvalues: runService (ref), record (ref), responsibilityCatalogModule (ref)
	local screenGui = Instance.new("ScreenGui")
	screenGui.Parent = game:GetService("CoreGui")
	local frame = Instance.new("Frame")
	frame.Size = UDim2.fromOffset(100, 40)
	frame.Parent = screenGui
	runService.Heartbeat:Wait()
	local t = {
		key = "row",
		index = 1,
		assignmentGeneration = 1,
		itemRevision = 0
	}
	local var95 = 0
	local var96 = 0
	local var97 = -1
	local bindableEvent = Instance.new("BindableEvent")
	local var99 = p58.Measurer.attach({
		instance = frame,
		axis = p58.Axis.Y,
		getIdentity = function() --[[ line: 687 ]]
			-- upvalues: t (ref)
			return t
		end,
		onItemMeasured = function(_, p62) --[[ line: 690 ]]
			-- upvalues: var95 (write), var97 (write), bindableEvent (ref)
			var95 += 1
			var97 = p62
			bindableEvent:Fire()
		end
	})
	local clock = p61.clock or os.clock
	local var101 = record(p60, responsibilityCatalogModule.Roblox.MeasurementScheduling, "hostBoundary", "measurement-heartbeat-observation", "Observes one scheduled Roblox measurement after its required Heartbeat boundary.", "heartbeatMeasurementObservation", true, 1, p59.run(function() --[[ line: 697 ]]
		-- upvalues: t (ref), var95 (write), var99 (ref), clock (ref), bindableEvent (ref), var96 (write)
		t.itemRevision += 1
		var99.scheduleSettle()
		local var102 = clock()
		bindableEvent.Event:Wait()
		local var103 = (clock() - var102) * 1000
		var96 = var95 - var95
		assert(var96 == 1, "scheduled measurement did not settle on Heartbeat")
		
		return var103
	end, p61), {
		completionBarrier = "RunService.Heartbeat",
		observedMeasurements = var96,
		lastMeasuredLength = var97,
		pendingHeartbeats = var99.getPendingCount()
	})
	var99.disconnect()
	bindableEvent:Destroy()
	screenGui:Destroy()
	
	return var101
end

local function createFakeGui(p63) --[[ line: 731 ]]
	local t = {}
	local t_1 = {}
	local bindableEvent = Instance.new("BindableEvent")
	table.insert(t_1, bindableEvent)
	
	return {
		AbsolutePosition = p63.position or Vector2.zero,
		AbsoluteSize = p63.size or Vector2.zero,
		AbsoluteWindowSize = p63.windowSize or Vector2.zero,
		CanvasPosition = p63.canvasPosition or Vector2.zero,
		Parent = p63.parent,
		Destroying = bindableEvent.Event,
		GetPropertyChangedSignal = function(_, p64) --[[ line: 744 ]]
			-- upvalues: t (ref), t_1 (ref)
			local var107 = t[p64]
			
			if var107 == nil then
				var107 = Instance.new("BindableEvent")
				t[p64] = var107
				table.insert(t_1, var107)
			end
			return var107.Event
		end,
		IsDescendantOf = function(p65, p66) --[[ line: 753 ]]
			local parent = p65.Parent
			while parent ~= nil do
				if parent ~= p66 then
					parent = parent.Parent
					continue
				end
				return true
			end
			return false
		end,
		fire = function(_, p67) --[[ line: 763 ]]
			-- upvalues: t (ref)
			local var108 = t[p67]
			
			if var108 ~= nil then
				var108:Fire()
			end
		end,
		destroy = function(_) --[[ line: 769 ]]
			-- upvalues: t_1 (ref)
			for i, v in t_1 do
				v:Destroy()
			end
		end
	}
end

local function viewportActivationWorkload(p68, p69, p70, p71, p72) --[[ line: 777 ]]
	-- upvalues: createFakeGui (ref), record (ref), responsibilityCatalogModule (ref)
	local var109 = createFakeGui({
		position = Vector2.new(0, 0),
		windowSize = Vector2.new(100, 100)
	})
	local var110 = createFakeGui({
		position = Vector2.new(0, 150),
		size = Vector2.new(10, 10),
		parent = var109
	})
	local var111 = 0
	local var112 = p68.ViewportCoordinator.new({ axis = p68.Axis.Y })
	var112.setViewport(var109)
	local var113 = record(p70, responsibilityCatalogModule.Roblox.ViewportActivation, "integrated", "viewport-activation-transitions", "Evaluates positive activation transitions alongside unchanged no-op evaluations.", "viewportActivationBatch", false, p71, p69.measure(function() --[[ line: 800 ]]
		-- upvalues: p71 (ref), var110 (ref)
		for _ = 1, p71 do
			var110.AbsolutePosition = Vector2.new(0, 50)
			var110:fire("AbsolutePosition")
			var110:fire("AbsolutePosition")
			var110.AbsolutePosition = Vector2.new(0, 150)
			var110:fire("AbsolutePosition")
		end
	end, p72), {
		evaluations = p71 * 3,
		transitions = var111 - var111,
		noOpEvaluations = p71
	})
	var112.register(var110, function() --[[ line: 796 ]]
		-- upvalues: var111 (write)
		var111 += 1
	end)()
	var112.destroy()
	var110:destroy()
	var109:destroy()
	
	return var113
end

local function teardownWorkload(p73, p74, p75, p76, p77) --[[ line: 832 ]]
	-- upvalues: viewRecyclerModule (ref), create (ref), createVirtualizerModule (ref), record (ref), responsibilityCatalogModule (ref)
	local clock = p77.clock or os.clock
	local var115 = 0
	local var116 = 0
	local var117 = 0
	local var118 = 0
	local var119 = 0
	local var120 = 0
	
	return record(p75, responsibilityCatalogModule.Roblox.Teardown, "integrated", "full-adapter-teardown", "Destroys populated Roblox virtualizers, host Leases, connections, measurement state, and owned RecyclingScopes.", "fullAdapterTeardownBatch", false, p76, p74.run(function() --[[ line: 846 ]]
		-- upvalues: var115 (write), var116 (write), var117 (write), var119 (write), var120 (write), p76 (ref), var118 (write), viewRecyclerModule (copy), create (copy), createVirtualizerModule (copy), p73 (ref), clock (ref)
		var115 = 0
		var116 = 0
		var117 = 0
		var119 = 0
		var120 = 0
		local var121 = 0
		
		for _ = 1, p76 do
			var118 += 1
			local scrollingFrame = Instance.new("ScrollingFrame")
			scrollingFrame.Size = UDim2.fromOffset(100, 40)
			local var123 = viewRecyclerModule.Layout.uniform({ itemLength = 20 })
			local var124 = create({
				itemViewAdapter = {
					create = function() --[[ line: 860 ]]
						return Instance.new("Frame")
					end,
					update = function() --[[ line: 863 ]] end
				},
				destroyItemView = function(p78) --[[ line: 865 ]]
					-- upvalues: var116 (copy)
					var116 += 1
					p78:Destroy()
				end
			})
			local var125 = createVirtualizerModule({
				scrollingFrame = scrollingFrame,
				axis = p73.Axis.Y,
				dataSource = viewRecyclerModule.DataSource.snapshot({ `a-{var118}`, `b-{var118}` }, function(p79) --[[ line: 875 ]]
					return p79
				end),
				layout = var123,
				recyclingScope = var124,
				getItemViewType = function() --[[ line: 881 ]]
					return "row"
				end
			})
			local var126 = clock()
			var125.destroy()
			local var127 = (clock() - var126) * 1000
			local var128 = clock()
			var124.destroy()
			local var129 = (clock() - var128) * 1000
			var119 += var127
			var120 += var129
			var121 += var127 + var129
			var115 += 1
			var125.destroy()
			var124.destroy()
			var117 += 1
			var123.destroy()
			scrollingFrame:Destroy()
		end
		return var121
	end, p77), {
		adaptersDestroyed = var115,
		itemViewsDestroyed = var116,
		idempotentDestroyCalls = var117,
		milestones = { hostTeardownMs = var119, scopeTeardownMs = var120 }
	})
end

return {
	run = function(p80, p81, p82, p83) --[[ line: 925 ]]
		-- upvalues: placementWorkload (ref), placementRoutingWorkload (ref), reparentSelectionWorkload (ref), leaseLifecycleWorkload (ref), scrollSynchronizationWorkload (ref), canvasPublicationWorkload (ref), measurementSchedulingWorkload (ref), measurementHeartbeatWorkload (ref), viewportActivationWorkload (ref), teardownWorkload (ref)
		p83 = p83 or {}
		local operationCount = p83.operationCount or 100
		assert(operationCount >= 1 and operationCount % 1 == 0, "operationCount must be a positive integer")
		
		return {
			placementWorkload(p80, p81, p82, operationCount, p83),
			placementRoutingWorkload(p80, p81, p82, operationCount, p83),
			reparentSelectionWorkload(p81, p82, operationCount, p83),
			leaseLifecycleWorkload(p80, p81, p82, operationCount, p83),
			scrollSynchronizationWorkload(p80, p81, p82, operationCount, p83),
			canvasPublicationWorkload(p80, p81, p82, operationCount, p83),
			measurementSchedulingWorkload(p80, p81, p82, operationCount, p83),
			measurementHeartbeatWorkload(p80, p81, p82, p83),
			viewportActivationWorkload(p80, p81, p82, operationCount, p83),
			teardownWorkload(p80, p81, p82, operationCount, p83)
		}
	end
}