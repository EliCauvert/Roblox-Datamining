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

local function record(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	return p1.create({
		suite = "view-recycler-roblox",
		layer = "robloxHost",
		owner = "roblox",
		responsibility = p2,
		timingClass = p3,
		workload = p4,
		description = p5,
		scale = { operations = p8 },
		timing = {
			unit = "ms",
			basis = p6,
			operationsPerSample = p8,
			includesSchedulerWaits = p7
		},
		arms = { viewRecycler = p9 },
		evidence = p10
	})
end

local function placementWorkload(p1, p2, p3, p4, p5)
	-- upvalues: record (ref), responsibilityCatalogModule (ref)
	local folder = Instance.new("Folder")
	local folder_1 = Instance.new("Folder")
	local frame = Instance.new("Frame")
	local var1 = p1.CanvasItemPlacer.createState()
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
	p1.CanvasItemPlacer.place(frame, folder, t, var1, true)
	local var2 = 0
	local var3 = 0
	local var4 = 0
	local var5 = record(p3, responsibilityCatalogModule.Roblox.GeometryPlacement, "hostBoundary", "geometry-placement-paths", "Groups changed, unchanged, and reparented CanvasItemPlacer paths.", "placementPathBatch", false, p4, p2.measure(function()
		-- upvalues: var2 (write), var3 (write), var4 (write), p4 (ref), p1 (ref), frame (ref), folder (ref), t_1 (ref), var1 (ref), folder_1 (ref), t (ref)
		var2 = 0
		var3 = 0
		var4 = 0
		
		for _ = 1, p4 do
			var2 += p1.CanvasItemPlacer.place(frame, folder, t_1, var1, true)
			var3 += p1.CanvasItemPlacer.place(frame, folder, t_1, var1, true)
			var4 += p1.CanvasItemPlacer.place(frame, folder_1, t_1, var1, true)
			var4 += p1.CanvasItemPlacer.place(frame, folder, t, var1, true)
		end
	end, p5), {
		placementCalls = p4 * 4,
		changedPropertyWrites = var2,
		unchangedPropertyWrites = var3,
		reparentPropertyWrites = var4
	})
	p1.CanvasItemPlacer.detach(frame, var1)
	frame:Destroy()
	folder:Destroy()
	folder_1:Destroy()
	
	return var5
end

local function createPlacementRoutingFixture(p6, p7, p8)
	local scrollingFrame = Instance.new("ScrollingFrame")
	local frame = Instance.new("Frame")
	local frame_1 = Instance.new("Frame")
	local var6 = p8
	local var7 = 0
	local t = { key = "row", index = 1, value = "row", generation = 1 }
	local var8 = p6.CanvasItemViewRuntime.new({
		selfSizing = false,
		container = scrollingFrame,
		viewportContainer = if p7 then frame else nil,
		axis = p6.Axis.Y,
		onItemMeasurements = function() end,
		onItemViewPresentationChanged = function() end
	})
	
	local function placementIntent()
		-- upvalues: t (ref), var7 (write), var6 (write)
		return {
			contentStartOffset = 0,
			measurementIdentity = nil,
			assignment = t,
			itemLayout = { startOffset = 0, length = 40 },
			canvasPlacement = { mainAxisLength = 40, mainAxisOffset = var7 },
			viewportPlacement = if var6 then {
				mainAxisLength = 40,
				viewportRelative = true,
				mainAxisOffset = var7
			} else nil
		}
	end
	
	var8.applyHostState(frame_1, {
		phase = "presented",
		visible = true,
		host = frame_1,
		assignment = t
	})
	var8.applyPlacementIntent(frame_1, placementIntent())
	
	return {
		canvas = scrollingFrame,
		overlay = frame,
		host = frame_1,
		runtime = var8,
		setPlacement = function(value, p9)
			-- upvalues: var7 (write), var6 (write)
			var7 = value
			var6 = p9
		end,
		publishPlacementGeometry = function()
			-- upvalues: var8 (ref), frame_1 (ref), placementIntent (ref)
			var8.applyPlacementIntent(frame_1, placementIntent())
		end
	}
end

local function _(p6)
	p6.runtime.destroy()
	p6.host:Destroy()
	p6.overlay:Destroy()
	p6.canvas:Destroy()
end

local function placementRoutingWorkload(p6, p7, p8, p9, p10)
	-- upvalues: createPlacementRoutingFixture (ref), responsibilityCatalogModule (ref)
	local var6 = createPlacementRoutingFixture(p6, false, true)
	local var7 = createPlacementRoutingFixture(p6, true, true)
	local var8 = createPlacementRoutingFixture(p6, true, true)
	local var9 = p8.create({
		suite = "view-recycler-roblox",
		layer = "robloxHost",
		owner = "roblox",
		timingClass = "integrated",
		workload = "viewport-overlay-placement-routing",
		description = "Compares retained overlay and canvas-fallback geometry with canvas-to-overlay routing transitions.",
		responsibility = responsibilityCatalogModule.Roblox.GeometryPlacement,
		scale = { operations = p9 },
		timing = {
			unit = "ms",
			basis = "placementPublicationBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p9
		},
		arms = {
			canvasFallback = p7.measure(function()
				-- upvalues: p9 (ref), var6 (ref)
				for i = 1, p9 do
					var6.setPlacement(i, true)
					var6.publishPlacementGeometry(i)
				end
			end, p10),
			viewportOverlay = p7.measure(function()
				-- upvalues: p9 (ref), var7 (ref)
				for i = 1, p9 do
					var7.setPlacement(i, true)
					var7.publishPlacementGeometry(i)
				end
			end, p10),
			routingTransitions = p7.measure(function()
				-- upvalues: p9 (ref), var8 (ref)
				for i = 1, p9 do
					var8.setPlacement(i, i % 2 == 0)
					var8.publishPlacementGeometry(i)
				end
			end, p10)
		},
		evidence = {
			canvasFallbackGeometryPublications = p9,
			overlayGeometryPublications = p9,
			routingPublications = p9,
			routingReparents = p9,
			canvasFallbackHostParent = var6.host.Parent == var6.canvas,
			overlayHostParent = var7.host.Parent == var7.overlay,
			routedHostInOverlay = var8.host.Parent == var8.overlay,
			canvasFallbackHostOffset = var6.host.Position.Y.Offset,
			overlayHostOffset = var7.host.Position.Y.Offset
		}
	})
	var6.runtime.destroy()
	var6.host:Destroy()
	var6.overlay:Destroy()
	var6.canvas:Destroy()
	var7.runtime.destroy()
	var7.host:Destroy()
	var7.overlay:Destroy()
	var7.canvas:Destroy()
	var8.runtime.destroy()
	var8.host:Destroy()
	var8.overlay:Destroy()
	var8.canvas:Destroy()
	
	return var9
end

local function reparentSelectionWorkload(p11, p12, p13, p14)
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
	local var10 = 0
	local var11 = 0
	local var12 = 0
	local var13 = record(p12, responsibilityCatalogModule.Roblox.ReparentSelection, "hostBoundary", "reparent-selection-cleanup", "Places ReparentableHost instances and clears descendant selection while detaching.", "reparentSelectionBatch", false, p13, p11.measure(function()
		-- upvalues: var10 (write), var11 (write), var12 (write), p13 (ref), reparentableHostModule (copy), benchmarkHost (ref), frame (ref), frame_1 (ref), guiService (copy), textButton (ref)
		var10 = 0
		var11 = 0
		var12 = 0
		
		for i = 1, p13 do
			reparentableHostModule.place(benchmarkHost, {
				placeholder = if i % 2 == 0 then frame else frame_1,
				automaticSize = Enum.AutomaticSize.Y
			})
			var10 += 1
			
			if i == 1 then
				guiService.SelectedObject = textButton
			end
			reparentableHostModule.detach(benchmarkHost)
			var12 += 1
			
			if i == 1 and guiService.SelectedObject == nil then
				var11 += 1
			end
		end
	end, p14), {
		placements = var10,
		selectionClears = var11,
		detachments = var12,
		finalParentIsNil = benchmarkHost.Parent == nil
	})
	reparentableHostModule.destroy(benchmarkHost)
	screenGui:Destroy()
	
	return var13
end

local function leaseLifecycleWorkload(p15, p16, p17, p18, p19)
	-- upvalues: record (ref), responsibilityCatalogModule (ref)
	local folder = Instance.new("Folder")
	local frame = Instance.new("Frame")
	local var14 = p15.CanvasItemViewRuntime.new({
		selfSizing = false,
		container = folder,
		axis = p15.Axis.Y,
		onItemMeasurements = function() end,
		onItemViewPresentationChanged = function() end
	})
	local var15 = nil
	local var16 = 0
	local var17 = 0
	local var18 = record(p17, responsibilityCatalogModule.Roblox.LeaseLifecycle, "integrated", "canvas-item-view-runtime-lease-lifecycle", "Transitions one CanvasItemViewRuntime host Lease through attachment and detachment without measurement work.", "leaseAttachDetachBatch", false, p18, p16.measure(function()
		-- upvalues: var16 (write), var17 (write), p18 (ref), var15 (write), var14 (ref), frame (ref), folder (ref)
		var16 = 0
		var17 = 0
		
		for i = 1, p18 do
			var15 = { key = "row", index = 1, value = "row", generation = i }
			var14.applyPlacementIntent(frame, {
				viewportPlacement = nil,
				contentStartOffset = 0,
				measurementIdentity = nil,
				assignment = var15,
				itemLayout = { startOffset = 0, length = 40 },
				canvasPlacement = {}
			})
			var14.applyHostState(frame, {
				phase = "presented",
				visible = true,
				host = frame,
				assignment = var15
			})
			
			if frame.Parent == folder then
				var16 += 1
			end
			var14.applyHostState(frame, nil)
			var15 = nil
			
			if frame.Parent == nil and not frame.Visible then
				var17 += 1
			end
		end
	end, p19), {
		attachments = var16,
		detachments = var17,
		finalParentIsNil = frame.Parent == nil
	})
	var14.destroy()
	frame:Destroy()
	folder:Destroy()
	
	return var18
end

local function createScrollHost(p20, p21)
	-- upvalues: viewRecyclerModule (ref)
	local offset = p21.CanvasSize.Y.Offset
	local var19 = 0
	local var20 = 0
	local var21 = viewRecyclerModule.DataSource.snapshot({}, function(p22)
		return p22
	end)
	local t = {
		dispatch = function(p22)
			-- upvalues: viewRecyclerModule (copy), var19 (write), var20 (write)
			if p22.type == viewRecyclerModule.VirtualizerCommandType.SetViewportSize then
				var19 += 1
			elseif p22.type == viewRecyclerModule.VirtualizerCommandType.ObserveScrollOffset then
				var20 += 1
			end
			return {
				snapshot = nil,
				effects = {},
				result = if p22.type == viewRecyclerModule.VirtualizerCommandType.ApplyScrollAnchorOffset then p22.offset else nil
			}
		end,
		getSnapshot = function()
			-- upvalues: offset (write)
			return { contentLength = offset }
		end,
		query = function(p22)
			-- upvalues: viewRecyclerModule (copy), p21 (ref), offset (write)
			return if p22.type == viewRecyclerModule.VirtualizerQueryType.GetScrollOffsetForItem then 0 else {
				atStart = true,
				atEnd = false,
				scrollOffset = p21.CanvasPosition.Y,
				viewportLength = p21.AbsoluteWindowSize.Y,
				contentLength = offset,
				distanceFromEnd = offset
			}
		end
	}
	local var22 = p20.ScrollHostCoordinator.new({
		dispatch = t.dispatch,
		getSnapshot = t.getSnapshot,
		query = t.query,
		getInstance = function()
			-- upvalues: p21 (ref)
			return p21
		end,
		getConfiguration = function()
			-- upvalues: p20 (ref), var21 (ref)
			return {
				initialScrollAlignment = nil,
				autoScrollOnChange = nil,
				startReachedThreshold = nil,
				onStartReached = nil,
				onEndReached = nil,
				onViewportChanged = nil,
				onScrollOffsetChanged = nil,
				onContentLengthChanged = nil,
				axis = p20.Axis.Y,
				dataSource = var21
			}
		end
	})
	local var23 = var22.connect()
	var19 = 0
	var20 = 0
	
	return var22, function()
		-- upvalues: var19 (write), var20 (write)
		return var19, var20
	end, function(p22)
		-- upvalues: offset (write), var22 (ref), viewRecyclerModule (copy)
		local t = { contentLength = offset }
		var22.handleUpdate(t, {
			snapshot = t,
			effects = {
				{
					type = viewRecyclerModule.VirtualizerEffectType.ScrollPositionChanged,
					offset = p22
				}
			},
			presentation = { assignmentsChanged = false, placementChanged = false }
		})
	end, function(p22)
		-- upvalues: offset (write)
		offset = p22
	end, var23
end

local function scrollSynchronizationWorkload(p20, p21, p22, p23, p24)
	-- upvalues: createScrollHost (ref), record (ref), responsibilityCatalogModule (ref)
	local scrollingFrame = Instance.new("ScrollingFrame")
	scrollingFrame.Size = UDim2.fromOffset(400, 400)
	scrollingFrame.CanvasSize = UDim2.fromOffset(400, 4000)
	local var19, var20, var21, _, var22 = createScrollHost(p20, scrollingFrame)
	local var23 = p21.measure(function()
		-- upvalues: p23 (ref), var19 (ref), var21 (ref), scrollingFrame (ref)
		for i = 1, p23 do
			var19.hostChanged()
			var21(i)
			scrollingFrame.CanvasPosition = scrollingFrame.CanvasPosition
		end
	end, p24)
	local var24, var25 = var20()
	local var26 = record(p22, responsibilityCatalogModule.Roblox.ScrollViewportSync, "hostBoundary", "scroll-viewport-offset-correction-sync", "Synchronizes viewport geometry and attributes host-reported offsets to Programmatic or User scroll.", "scrollSynchronizationBatch", false, p23, var23, {
		viewportUpdates = var24,
		runtimeUpdates = var25,
		finalScrollOffset = scrollingFrame.CanvasPosition.Y
	})
	var22()
	scrollingFrame:Destroy()
	
	return var26
end

local function canvasPublicationWorkload(p25, p26, p27, p28, p29)
	-- upvalues: createScrollHost (ref), record (ref), responsibilityCatalogModule (ref)
	local scrollingFrame = Instance.new("ScrollingFrame")
	local _, _, var24, var25, var26 = createScrollHost(p25, scrollingFrame)
	local var27 = 0
	local var28 = record(p27, responsibilityCatalogModule.Roblox.CanvasPublication, "hostBoundary", "canvas-size-publication", "Computes and publishes adapter canvas sizes to a ScrollingFrame.", "canvasPublicationBatch", false, p28, p26.measure(function()
		-- upvalues: var27 (write), p28 (ref), var25 (ref), var24 (ref)
		var27 = 0
		
		for i = 1, p28 do
			var25(i * 40)
			var24(0)
			var27 += 1
		end
	end, p29), {
		canvasPublications = var27,
		finalCanvasLength = scrollingFrame.CanvasSize.Y.Offset
	})
	var26()
	scrollingFrame:Destroy()
	
	return var28
end

local function measurementSchedulingWorkload(p30, p31, p32, p33, p34)
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
	local var29 = p31.measure(function()
		-- upvalues: p30 (ref), frame (ref), t (ref), measurementBatcherModule (copy), p33 (ref), t_1 (write)
		local t_2 = {}
		local var30 = 0
		local var31 = 0
		local var32 = 0
		local var33 = p30.Measurer.attach({
			instance = frame,
			axis = p30.Axis.Y,
			getIdentity = function()
				-- upvalues: t (copy)
				return t
			end,
			onItemMeasured = function() end
		})
		local var34 = measurementBatcherModule.new(function(p35)
			-- upvalues: var30 (write), var31 (write)
			var30 += 1
			var31 += #p35
		end, function(p35)
			-- upvalues: t_2 (ref)
			table.insert(t_2, p35)
		end)
		
		for i = 1, p33 do
			t.itemRevision = i
			var33.scheduleSettle()
			var33.scheduleSettle()
			var34.add({
				itemKey = "row",
				assignmentGeneration = 1,
				length = 40,
				itemRevision = i
			})
			var34.add({
				itemKey = "row",
				assignmentGeneration = 1,
				length = 41,
				itemRevision = i
			})
			table.remove(t_2, 1)()
			var34.add({
				itemKey = "cancelled",
				assignmentGeneration = 1,
				length = 0,
				itemRevision = i
			})
			var34.cancelPending()
			table.remove(t_2, 1)()
			var32 += 1
		end
		t_1 = {
			settleRequests = p33 * 2,
			uniquePendingHeartbeats = var33.getPendingCount(),
			batchFlushes = var30,
			batchedMeasurements = var31,
			cancellations = var32,
			deferredCallbacksRemaining = #t_2
		}
		var34.destroy()
		var33.disconnect()
	end, p34)
	frame:Destroy()
	
	return record(p32, responsibilityCatalogModule.Roblox.MeasurementScheduling, "phased", "measurement-adapter-scheduling", "Schedules deduplicated settles, flushes measurement batches, and cancels stale batches without yielding.", "adapterMeasurementSchedulingBatch", false, p33, var29, t_1)
end

local function measurementHeartbeatWorkload(p35, p36, p37, p38)
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
	local var30 = 0
	local var31 = 0
	local var32 = -1
	local bindableEvent = Instance.new("BindableEvent")
	local var33 = p35.Measurer.attach({
		instance = frame,
		axis = p35.Axis.Y,
		getIdentity = function()
			-- upvalues: t (ref)
			return t
		end,
		onItemMeasured = function(_, p39)
			-- upvalues: var30 (write), var32 (write), bindableEvent (ref)
			var30 += 1
			var32 = p39
			bindableEvent:Fire()
		end
	})
	local clock = p38.clock or os.clock
	local var34 = record(p37, responsibilityCatalogModule.Roblox.MeasurementScheduling, "hostBoundary", "measurement-heartbeat-observation", "Observes one scheduled Roblox measurement after its required Heartbeat boundary.", "heartbeatMeasurementObservation", true, 1, p36.run(function()
		-- upvalues: t (ref), var30 (write), var33 (ref), clock (ref), bindableEvent (ref), var31 (write)
		t.itemRevision += 1
		var33.scheduleSettle()
		local var35 = clock()
		bindableEvent.Event:Wait()
		local var36 = (clock() - var35) * 1000
		var31 = var30 - var30
		assert(var31 == 1, "scheduled measurement did not settle on Heartbeat")
		
		return var36
	end, p38), {
		completionBarrier = "RunService.Heartbeat",
		observedMeasurements = var31,
		lastMeasuredLength = var32,
		pendingHeartbeats = var33.getPendingCount()
	})
	var33.disconnect()
	bindableEvent:Destroy()
	screenGui:Destroy()
	
	return var34
end

local function createFakeGui(p35)
	local t = {}
	local t_1 = {}
	local bindableEvent = Instance.new("BindableEvent")
	table.insert(t_1, bindableEvent)
	
	return {
		AbsolutePosition = p35.position or Vector2.zero,
		AbsoluteSize = p35.size or Vector2.zero,
		AbsoluteWindowSize = p35.windowSize or Vector2.zero,
		CanvasPosition = p35.canvasPosition or Vector2.zero,
		Parent = p35.parent,
		Destroying = bindableEvent.Event,
		GetPropertyChangedSignal = function(_, p36)
			-- upvalues: t (ref), t_1 (ref)
			local var30 = t[p36]
			
			if var30 == nil then
				var30 = Instance.new("BindableEvent")
				t[p36] = var30
				table.insert(t_1, var30)
			end
			return var30.Event
		end,
		IsDescendantOf = function(p36, p37)
			local parent = p36.Parent
			while parent ~= nil do
				if parent ~= p37 then
					parent = parent.Parent
					continue
				end
				return true
			end
			return false
		end,
		fire = function(_, p38)
			-- upvalues: t (ref)
			local var30 = t[p38]
			
			if var30 ~= nil then
				var30:Fire()
			end
		end,
		destroy = function(_)
			-- upvalues: t_1 (ref)
			for i, v in t_1 do
				v:Destroy()
			end
		end
	}
end

local function viewportActivationWorkload(p38, p39, p40, p41, p42)
	-- upvalues: createFakeGui (ref), record (ref), responsibilityCatalogModule (ref)
	local var30 = createFakeGui({
		position = Vector2.new(0, 0),
		windowSize = Vector2.new(100, 100)
	})
	local var31 = createFakeGui({
		position = Vector2.new(0, 150),
		size = Vector2.new(10, 10),
		parent = var30
	})
	local var32 = 0
	local var33 = p38.ViewportCoordinator.new({ axis = p38.Axis.Y })
	var33.setViewport(var30)
	local var34 = record(p40, responsibilityCatalogModule.Roblox.ViewportActivation, "integrated", "viewport-activation-transitions", "Evaluates positive activation transitions alongside unchanged no-op evaluations.", "viewportActivationBatch", false, p41, p39.measure(function()
		-- upvalues: p41 (ref), var31 (ref)
		for _ = 1, p41 do
			var31.AbsolutePosition = Vector2.new(0, 50)
			var31:fire("AbsolutePosition")
			var31:fire("AbsolutePosition")
			var31.AbsolutePosition = Vector2.new(0, 150)
			var31:fire("AbsolutePosition")
		end
	end, p42), {
		evaluations = p41 * 3,
		transitions = var32 - var32,
		noOpEvaluations = p41
	})
	var33.register(var31, function()
		-- upvalues: var32 (write)
		var32 += 1
	end)()
	var33.destroy()
	var31:destroy()
	var30:destroy()
	
	return var34
end

local function teardownWorkload(p43, p44, p45, p46, p47)
	-- upvalues: viewRecyclerModule (ref), create (ref), createVirtualizerModule (ref), record (ref), responsibilityCatalogModule (ref)
	local clock = p47.clock or os.clock
	local var35 = 0
	local var36 = 0
	local var37 = 0
	local var38 = 0
	local var39 = 0
	local var40 = 0
	
	return record(p45, responsibilityCatalogModule.Roblox.Teardown, "integrated", "full-adapter-teardown", "Destroys populated Roblox virtualizers, host Leases, connections, measurement state, and owned RecyclingScopes.", "fullAdapterTeardownBatch", false, p46, p44.run(function()
		-- upvalues: var35 (write), var36 (write), var37 (write), var39 (write), var40 (write), p46 (ref), var38 (write), viewRecyclerModule (copy), create (copy), createVirtualizerModule (copy), p43 (ref), clock (ref)
		var35 = 0
		var36 = 0
		var37 = 0
		var39 = 0
		var40 = 0
		local var41 = 0
		
		for _ = 1, p46 do
			var38 += 1
			local scrollingFrame = Instance.new("ScrollingFrame")
			scrollingFrame.Size = UDim2.fromOffset(100, 40)
			local var42 = viewRecyclerModule.Layout.uniform({ itemLength = 20 })
			local var43 = create({
				itemViewAdapter = {
					create = function()
						return Instance.new("Frame")
					end,
					update = function() end
				},
				destroyItemView = function(p48)
					-- upvalues: var36 (copy)
					var36 += 1
					p48:Destroy()
				end
			})
			local var44 = createVirtualizerModule({
				scrollingFrame = scrollingFrame,
				axis = p43.Axis.Y,
				dataSource = viewRecyclerModule.DataSource.snapshot({ `a-{var38}`, `b-{var38}` }, function(p48)
					return p48
				end),
				layout = var42,
				recyclingScope = var43,
				getItemViewType = function()
					return "row"
				end
			})
			local var45 = clock()
			var44.destroy()
			local var46 = (clock() - var45) * 1000
			local var47 = clock()
			var43.destroy()
			local var48 = (clock() - var47) * 1000
			var39 += var46
			var40 += var48
			var41 += var46 + var48
			var35 += 1
			var44.destroy()
			var43.destroy()
			var37 += 1
			var42.destroy()
			scrollingFrame:Destroy()
		end
		return var41
	end, p47), {
		adaptersDestroyed = var35,
		itemViewsDestroyed = var36,
		idempotentDestroyCalls = var37,
		milestones = { hostTeardownMs = var39, scopeTeardownMs = var40 }
	})
end

return {
	run = function(p48, p49, p50, p51)
		-- upvalues: placementWorkload (ref), placementRoutingWorkload (ref), reparentSelectionWorkload (ref), leaseLifecycleWorkload (ref), scrollSynchronizationWorkload (ref), canvasPublicationWorkload (ref), measurementSchedulingWorkload (ref), measurementHeartbeatWorkload (ref), viewportActivationWorkload (ref), teardownWorkload (ref)
		p51 = p51 or {}
		local operationCount = p51.operationCount or 100
		assert(operationCount >= 1 and operationCount % 1 == 0, "operationCount must be a positive integer")
		
		return {
			placementWorkload(p48, p49, p50, operationCount, p51),
			placementRoutingWorkload(p48, p49, p50, operationCount, p51),
			reparentSelectionWorkload(p49, p50, operationCount, p51),
			leaseLifecycleWorkload(p48, p49, p50, operationCount, p51),
			scrollSynchronizationWorkload(p48, p49, p50, operationCount, p51),
			canvasPublicationWorkload(p48, p49, p50, operationCount, p51),
			measurementSchedulingWorkload(p48, p49, p50, operationCount, p51),
			measurementHeartbeatWorkload(p48, p49, p50, p51),
			viewportActivationWorkload(p48, p49, p50, operationCount, p51),
			teardownWorkload(p48, p49, p50, operationCount, p51)
		}
	end
}