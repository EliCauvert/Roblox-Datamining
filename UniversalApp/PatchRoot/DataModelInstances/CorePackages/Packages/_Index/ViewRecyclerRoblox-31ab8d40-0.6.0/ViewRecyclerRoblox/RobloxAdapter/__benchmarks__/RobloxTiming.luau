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
	local t = { key = "row", value = "row" }
	local var8 = p6.HostPlacement.new({
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
			index = 1,
			contentStartOffset = 0,
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
	
	var8.apply(frame_1, {
		phase = "presented",
		host = frame_1,
		state = placementIntent()
	})
	
	return {
		canvas = scrollingFrame,
		overlay = frame,
		host = frame_1,
		hostPlacement = var8,
		setPlacement = function(value, p9)
			-- upvalues: var7 (write), var6 (write)
			var7 = value
			var6 = p9
		end,
		publishPlacementGeometry = function()
			-- upvalues: var8 (ref), frame_1 (ref), placementIntent (ref)
			var8.apply(frame_1, {
				phase = "presented",
				host = frame_1,
				state = placementIntent()
			})
		end
	}
end

local function _(p6)
	p6.hostPlacement.destroy()
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
	var6.hostPlacement.destroy()
	var6.host:Destroy()
	var6.overlay:Destroy()
	var6.canvas:Destroy()
	var7.hostPlacement.destroy()
	var7.host:Destroy()
	var7.overlay:Destroy()
	var7.canvas:Destroy()
	var8.hostPlacement.destroy()
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

local function physicalLifecycleWorkload(p15, p16, p17, p18, p19)
	-- upvalues: record (ref), responsibilityCatalogModule (ref)
	local folder = Instance.new("Folder")
	local frame = Instance.new("Frame")
	local var14 = p15.HostPlacement.new({
		selfSizing = false,
		container = folder,
		axis = p15.Axis.Y,
		onItemMeasurements = function() end,
		onItemViewPresentationChanged = function() end
	})
	local var15 = 0
	local var16 = 0
	local var17 = record(p17, responsibilityCatalogModule.Roblox.PhysicalLifecycle, "integrated", "canvas-item-view-physical-lifecycle", "Transitions one HostPlacement view through attachment and detachment without measurement work.", "physicalAttachDetachBatch", false, p18, p16.measure(function()
		-- upvalues: var15 (write), var16 (write), p18 (ref), var14 (ref), frame (ref), folder (ref)
		var15 = 0
		var16 = 0
		
		for _ = 1, p18 do
			var14.apply(frame, {
				phase = "presented",
				host = frame,
				state = {
					index = 1,
					viewportPlacement = nil,
					contentStartOffset = 0,
					assignment = { key = "row", value = "row" },
					itemLayout = { startOffset = 0, length = 40 },
					canvasPlacement = {}
				}
			})
			
			if frame.Parent == folder then
				var15 += 1
			end
			var14.apply(frame, nil)
			
			if frame.Parent == nil and not frame.Visible then
				var16 += 1
			end
		end
	end, p19), {
		attachments = var15,
		detachments = var16,
		finalParentIsNil = frame.Parent == nil
	})
	var14.destroy()
	frame:Destroy()
	folder:Destroy()
	
	return var17
end

local function createScrollHost(p20, p21)
	-- upvalues: viewRecyclerModule (ref)
	local offset = p21.CanvasSize.Y.Offset
	local var18 = 0
	local var19 = 0
	local var20 = viewRecyclerModule.DataSource.snapshot({}, function(p22)
		return p22
	end)
	local t = nil
	t = {
		setViewportSize = function()
			-- upvalues: var18 (write), t (write)
			var18 += 1
			
			return t.getCurrent()
		end,
		observeScrollOffset = function()
			-- upvalues: var19 (write), t (write)
			var19 += 1
			
			return t.getCurrent()
		end,
		getCurrent = function()
			-- upvalues: p21 (ref), offset (write)
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
					scrollOffset = p21.CanvasPosition.Y,
					viewportLength = p21.AbsoluteWindowSize.Y,
					contentLength = offset,
					distanceFromEnd = offset
				},
				contentLength = offset,
				dataPrefetchRequests = {},
				diagnostics = {}
			}
		end
	}
	local var21 = p20.ScrollHost.new({
		observeScrollOffset = t.observeScrollOffset,
		setViewportSize = t.setViewportSize,
		getCurrent = t.getCurrent,
		getInstance = function()
			-- upvalues: p21 (ref)
			return p21
		end,
		getConfiguration = function()
			-- upvalues: p20 (ref), var20 (ref)
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
				dataSource = var20
			}
		end
	})
	local var22 = var21.connect()
	var18 = 0
	var19 = 0
	
	return var21, function()
		-- upvalues: var18 (write), var19 (write)
		return var18, var19
	end, function(p22)
		-- upvalues: t (write), var21 (ref)
		local current = t.getCurrent()
		current.scrollPositionChanged = true
		current.scrollState.scrollOffset = p22
		var21.applyRecord(current, function() end)
	end, function(p22)
		-- upvalues: offset (write)
		offset = p22
	end, var22
end

local function scrollSynchronizationWorkload(p20, p21, p22, p23, p24)
	-- upvalues: createScrollHost (ref), record (ref), responsibilityCatalogModule (ref)
	local scrollingFrame = Instance.new("ScrollingFrame")
	scrollingFrame.Size = UDim2.fromOffset(400, 400)
	scrollingFrame.CanvasSize = UDim2.fromOffset(400, 4000)
	local var18, var19, var20, _, var21 = createScrollHost(p20, scrollingFrame)
	local var22 = p21.measure(function()
		-- upvalues: p23 (ref), var18 (ref), var20 (ref), scrollingFrame (ref)
		for i = 1, p23 do
			var18.scrollingFrameChanged()
			var20(i)
			scrollingFrame.CanvasPosition = scrollingFrame.CanvasPosition
		end
	end, p24)
	local var23, var24 = var19()
	local var25 = record(p22, responsibilityCatalogModule.Roblox.ScrollViewportSync, "hostBoundary", "scroll-viewport-offset-correction-sync", "Synchronizes viewport geometry and attributes host-reported offsets to Programmatic or User scroll.", "scrollSynchronizationBatch", false, p23, var22, {
		viewportUpdates = var23,
		runtimeUpdates = var24,
		finalScrollOffset = scrollingFrame.CanvasPosition.Y
	})
	var21()
	scrollingFrame:Destroy()
	
	return var25
end

local function canvasPublicationWorkload(p25, p26, p27, p28, p29)
	-- upvalues: createScrollHost (ref), record (ref), responsibilityCatalogModule (ref)
	local scrollingFrame = Instance.new("ScrollingFrame")
	local _, _, var23, var24, var25 = createScrollHost(p25, scrollingFrame)
	local var26 = 0
	local var27 = record(p27, responsibilityCatalogModule.Roblox.CanvasPublication, "hostBoundary", "canvas-size-publication", "Computes and publishes adapter canvas sizes to a ScrollingFrame.", "canvasPublicationBatch", false, p28, p26.measure(function()
		-- upvalues: var26 (write), p28 (ref), var24 (ref), var23 (ref)
		var26 = 0
		
		for i = 1, p28 do
			var24(i * 40)
			var23(0)
			var26 += 1
		end
	end, p29), {
		canvasPublications = var26,
		finalCanvasLength = scrollingFrame.CanvasSize.Y.Offset
	})
	var25()
	scrollingFrame:Destroy()
	
	return var27
end

local function measurementSchedulingWorkload(p30, p31, p32, p33, p34)
	-- upvalues: measurementBatcherModule (ref), record (ref), responsibilityCatalogModule (ref)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.fromOffset(100, 40)
	local t = { key = "row", index = 1, itemRevision = 0 }
	local t_1 = {}
	local var28 = p31.measure(function()
		-- upvalues: p30 (ref), frame (ref), t (write), measurementBatcherModule (copy), p33 (ref), t_1 (write)
		local t_2 = {}
		local var29 = 0
		local var30 = 0
		local var31 = 0
		local var32 = p30.Measurer.attach({
			instance = frame,
			axis = p30.Axis.Y,
			getState = function()
				-- upvalues: t (copy)
				return t
			end,
			onItemMeasured = function() end
		})
		local var33 = measurementBatcherModule.new(function(p35)
			-- upvalues: var29 (write), var30 (write)
			var29 += 1
			var30 += #p35
		end, function(p35)
			-- upvalues: t_2 (ref)
			table.insert(t_2, p35)
		end)
		
		for i = 1, p33 do
			t = { key = "row", index = 1, itemRevision = i }
			var32.scheduleSettle()
			var32.scheduleSettle()
			var33.add({ length = 40, itemView = frame, state = t })
			var33.add({ length = 41, itemView = frame, state = t })
			table.remove(t_2, 1)()
			var33.add({ length = 0, itemView = frame, state = t })
			var33.cancelPending()
			table.remove(t_2, 1)()
			var31 += 1
		end
		t_1 = {
			settleRequests = p33 * 2,
			uniquePendingHeartbeats = var32.getPendingCount(),
			batchFlushes = var29,
			batchedMeasurements = var30,
			cancellations = var31,
			deferredCallbacksRemaining = #t_2
		}
		var33.destroy()
		var32.disconnect()
	end, p34)
	frame:Destroy()
	
	return record(p32, responsibilityCatalogModule.Roblox.MeasurementScheduling, "phased", "measurement-adapter-scheduling", "Schedules deduplicated settles, flushes measurement batches, and cancels stale batches without yielding.", "adapterMeasurementSchedulingBatch", false, p33, var28, t_1)
end

local function measurementHeartbeatWorkload(p35, p36, p37, p38)
	-- upvalues: runService (ref), record (ref), responsibilityCatalogModule (ref)
	local screenGui = Instance.new("ScreenGui")
	screenGui.Parent = game:GetService("CoreGui")
	local frame = Instance.new("Frame")
	frame.Size = UDim2.fromOffset(100, 40)
	frame.Parent = screenGui
	runService.Heartbeat:Wait()
	local t = { key = "row", index = 1, itemRevision = 0 }
	local var29 = 0
	local var30 = 0
	local var31 = -1
	local bindableEvent = Instance.new("BindableEvent")
	local var32 = p35.Measurer.attach({
		instance = frame,
		axis = p35.Axis.Y,
		getState = function()
			-- upvalues: t (write)
			return t
		end,
		onItemMeasured = function(_, p39)
			-- upvalues: var29 (write), var31 (write), bindableEvent (ref)
			var29 += 1
			var31 = p39
			bindableEvent:Fire()
		end
	})
	local clock = p38.clock or os.clock
	local var33 = record(p37, responsibilityCatalogModule.Roblox.MeasurementScheduling, "hostBoundary", "measurement-heartbeat-observation", "Observes one scheduled Roblox measurement after its required Heartbeat boundary.", "heartbeatMeasurementObservation", true, 1, p36.run(function()
		-- upvalues: t (write), var29 (write), var32 (ref), clock (ref), bindableEvent (ref), var30 (write)
		t = {
			key = "row",
			index = 1,
			itemRevision = t.itemRevision + 1
		}
		var32.scheduleSettle()
		local var34 = clock()
		bindableEvent.Event:Wait()
		local var35 = (clock() - var34) * 1000
		var30 = var29 - var29
		assert(var30 == 1, "scheduled measurement did not settle on Heartbeat")
		
		return var35
	end, p38), {
		completionBarrier = "RunService.Heartbeat",
		observedMeasurements = var30,
		lastMeasuredLength = var31,
		pendingHeartbeats = var32.getPendingCount()
	})
	var32.disconnect()
	bindableEvent:Destroy()
	screenGui:Destroy()
	
	return var33
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
			local var29 = t[p36]
			
			if var29 == nil then
				var29 = Instance.new("BindableEvent")
				t[p36] = var29
				table.insert(t_1, var29)
			end
			return var29.Event
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
			local var29 = t[p38]
			
			if var29 ~= nil then
				var29:Fire()
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
	-- upvalues: createFakeGui (ref), runService (ref), record (ref), responsibilityCatalogModule (ref)
	p41 = math.min(p41, 10)
	local var29 = createFakeGui({
		position = Vector2.new(0, 0),
		windowSize = Vector2.new(100, 100)
	})
	local var30 = createFakeGui({
		position = Vector2.new(0, 150),
		size = Vector2.new(10, 10),
		parent = var29
	})
	local var31 = 0
	local var32 = p38.ViewportCoordinator.new({ axis = p38.Axis.Y })
	var32.setViewport(var29)
	local var33 = record(p40, responsibilityCatalogModule.Roblox.ViewportActivation, "integrated", "viewport-activation-transitions", "Coalesces repeated layout geometry and evaluates each settled activation transition at Heartbeat.", "viewportActivationBatch", true, p41, p39.measure(function()
		-- upvalues: p41 (write), var30 (ref), runService (copy)
		for _ = 1, p41 do
			var30.AbsolutePosition = Vector2.new(0, 50)
			var30:fire("AbsolutePosition")
			var30:fire("AbsolutePosition")
			runService.Heartbeat:Wait()
			task.wait()
			var30.AbsolutePosition = Vector2.new(0, 150)
			var30:fire("AbsolutePosition")
			runService.Heartbeat:Wait()
			task.wait()
		end
	end, p42), {
		noOpEvaluations = 0,
		completionBarrier = "RunService.Heartbeat",
		evaluations = p41 * 2,
		transitions = var31 - var31
	})
	var32.register(var30, function()
		-- upvalues: var31 (write)
		var31 += 1
	end)()
	var32.destroy()
	var30:destroy()
	var29:destroy()
	
	return var33
end

local _ = function(p43)
	return p43 * 7 % 41 + 40
end

local function createFrameWorkList(p43, p44)
	-- upvalues: runService (ref), viewRecyclerModule (ref), create (ref), createVirtualizerModule (ref)
	local clock = os.clock
	local var34 = false
	local var35 = 0
	local var36 = 0
	local var37 = 0
	local var38 = nil
	local bindableEvent = Instance.new("BindableEvent")
	
	local function closeWindow()
		-- upvalues: var37 (write), clock (ref), var35 (write)
		var37 += (clock() - var35) * 1000
	end
	
	local heartbeatConnection = runService.Heartbeat:Connect(function()
		-- upvalues: var34 (write), closeWindow (ref)
		if var34 then
			task.defer(closeWindow)
		end
	end)
	local preRenderConnection = runService.PreRender:Connect(function()
		-- upvalues: var34 (write), var37 (write), clock (ref), var35 (write), var36 (write), bindableEvent (ref)
		if var34 then
			task.defer(function()
				-- upvalues: var37 (copy), clock (copy), var35 (copy), var34 (copy), var36 (copy), bindableEvent (copy)
				var37 += (clock() - var35) * 1000
				var34 = false
				var36 -= 1
				
				if var36 == 0 then
					bindableEvent:Fire()
				end
			end)
			
			return
		end
	end)
	local screenGui = Instance.new("ScreenGui")
	screenGui.Parent = game:GetService("CoreGui")
	local scrollingFrame = Instance.new("ScrollingFrame")
	scrollingFrame.Size = UDim2.fromOffset(300, 600)
	scrollingFrame.Parent = screenGui
	local list = table.create(1000)
	
	for i = 1, 1000 do
		table.insert(list, { id = `row-{i}`, length = i * 7 % 41 + 40 })
	end
	local var39 = if p44 == "measured" then viewRecyclerModule.Layout.measured({ estimatedItemLength = 60 }) else viewRecyclerModule.Layout.uniform({ itemLength = 60 })
	local var40 = create({
		itemViewAdapter = {
			create = function()
				local frame = Instance.new("Frame")
				frame.BackgroundTransparency = 1
				local content = Instance.new("Frame")
				content.Name = "Content"
				content.Parent = frame
				
				return frame
			end
		}
	})
	local var41 = createVirtualizerModule({
		scrollingFrame = scrollingFrame,
		axis = p43.Axis.Y,
		dataSource = viewRecyclerModule.DataSource.sequence(list, function(p45)
			return p45.id
		end),
		layout = var39,
		recyclingScope = var40,
		getItemViewType = function()
			return "row"
		end,
		transition = function(p45, p46)
			if p46 ~= nil then
				p45:FindFirstChild("Content").Size = UDim2.new(1, 0, 0, p46.value.length)
			end
		end
	})
	local preAnimationConnection = runService.PreAnimation:Connect(function()
		-- upvalues: var36 (write), var34 (write), var35 (write), clock (ref), var38 (write)
		if var36 <= 0 then return end
		var34 = true
		var35 = clock()
		
		if var38 ~= nil then
			var38()
		end
	end)
	local renderSteppedConnection = runService.RenderStepped:Connect(function()
		-- upvalues: var34 (write), var35 (write), clock (ref)
		if var34 then
			var35 = clock()
		end
	end)
	
	local function _()
		-- upvalues: scrollingFrame (ref)
		local var42 = 0
		
		for i, v in scrollingFrame:GetDescendants() do
			if v.Name == "Content" then
				var42 += 1
			end
		end
		return var42
	end
	
	for _ = 1, 15 do
		runService.Heartbeat:Wait()
	end
	return {
		scrollingFrame = scrollingFrame,
		sample = function(p45, p46)
			-- upvalues: var37 (write), var38 (write), var34 (write), var36 (write), bindableEvent (ref)
			var37 = 0
			var38 = p46
			var34 = false
			var36 = p45
			bindableEvent.Event:Wait()
			var38 = nil
			
			return var37
		end,
		visibleContent = function()
			-- upvalues: scrollingFrame (ref)
			local y = scrollingFrame.AbsolutePosition.Y
			local var43 = y + scrollingFrame.AbsoluteWindowSize.Y
			
			for i, v in scrollingFrame:GetDescendants() do
				if v.Name == "Content" and v.Parent.Visible then
					local y_1 = v.AbsolutePosition.Y
					
					if y <= y_1 and y_1 < var43 then
						return v
					end
				end
			end
			return nil
		end,
		evidence = function()
			-- upvalues: scrollingFrame (ref)
			local t = {
				stacked = scrollingFrame:FindFirstChild("ViewRecyclerStack") ~= nil
			}
			local var44 = 0
			
			for i, v in scrollingFrame:GetDescendants() do
				if v.Name == "Content" then
					var44 += 1
				end
			end
			t.mountedHosts = var44
			
			return t
		end,
		destroy = function()
			-- upvalues: preAnimationConnection (ref), renderSteppedConnection (ref), heartbeatConnection (ref), preRenderConnection (ref), var41 (ref), var40 (ref), var39 (ref), screenGui (ref), bindableEvent (ref)
			preAnimationConnection:Disconnect()
			renderSteppedConnection:Disconnect()
			heartbeatConnection:Disconnect()
			preRenderConnection:Disconnect()
			var41.destroy()
			var40.dispose()
			var39.destroy()
			screenGui:Destroy()
			bindableEvent:Destroy()
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

local function frameWorkWorkloads(p45, p46, p47, p48, p49)
	-- upvalues: list (ref), createFrameWorkList (ref), responsibilityCatalogModule (ref)
	local minValue = math.min(p48, 10)
	local t = {}
	
	for i, v in list do
		local t_1 = {}
		local t_2 = { items = 1000, framesPerSample = minValue }
		
		for i_1, v_1 in v.layouts do
			local var44 = createFrameWorkList(p45, v_1)
			local var45 = false
			local var46 = nil
			
			if v.name == "scroll" then
				var46 = function()
					-- upvalues: var44 (ref)
					var44.scrollingFrame.CanvasPosition += Vector2.new(0, 37)
				end
			elseif v.name == "resize" then
				local var47 = var44.visibleContent()
				assert(var47 ~= nil, "frame-work benchmark found no visible Item")
				local offset = var47.Size.Y.Offset
				
				var46 = function()
					-- upvalues: var45 (write), var47 (ref), offset (ref)
					var45 = not var45
					var47.Size = UDim2.new(1, 0, 0, if var45 then offset + 20 else offset)
				end
			end
			local var48 = `{v_1}{if v_1 == "measured" then "Stacked" else "Absolute"}`
			t_1[var48] = p46.run(function()
				-- upvalues: var44 (ref), minValue (ref), var46 (write)
				return var44.sample(minValue, var46)
			end, p49)
			t_2[var48] = var44.evidence()
			var44.destroy()
		end
		table.insert(t, p47.create({
			suite = "view-recycler-roblox",
			layer = "robloxHost",
			owner = "roblox",
			timingClass = "integrated",
			responsibility = responsibilityCatalogModule.Roblox.GeometryPlacement,
			workload = v.workload,
			description = v.description,
			scale = { items = 1000, frames = minValue },
			timing = {
				unit = "ms",
				basis = "mainThreadFrameWorkBeforeRender",
				includesSchedulerWaits = false,
				operationsPerSample = minValue
			},
			arms = t_1,
			evidence = t_2
		}))
	end
	return t
end

local function teardownWorkload(p50, p51, p52, p53, p54)
	-- upvalues: viewRecyclerModule (ref), create (ref), createVirtualizerModule (ref), record (ref), responsibilityCatalogModule (ref)
	local clock = p54.clock or os.clock
	local var49 = 0
	local var50 = 0
	local var51 = 0
	local var52 = 0
	local var53 = 0
	local var54 = 0
	
	return record(p52, responsibilityCatalogModule.Roblox.Teardown, "integrated", "full-adapter-teardown", "Destroys populated Roblox virtualizers, physical hosts, connections, measurement state, and owned RecyclingScopes.", "fullAdapterTeardownBatch", false, p53, p51.run(function()
		-- upvalues: var49 (write), var50 (write), var51 (write), var53 (write), var54 (write), p53 (ref), var52 (write), viewRecyclerModule (copy), create (copy), createVirtualizerModule (copy), p50 (ref), clock (ref)
		var49 = 0
		var50 = 0
		var51 = 0
		var53 = 0
		var54 = 0
		local var55 = 0
		
		for _ = 1, p53 do
			var52 += 1
			local scrollingFrame = Instance.new("ScrollingFrame")
			scrollingFrame.Size = UDim2.fromOffset(100, 40)
			local var56 = viewRecyclerModule.Layout.uniform({ itemLength = 20 })
			local var57 = create({
				itemViewAdapter = {
					create = function()
						return Instance.new("Frame")
					end
				},
				destroyItemView = function(p55)
					-- upvalues: var50 (copy)
					var50 += 1
					p55:Destroy()
				end
			})
			local var58 = createVirtualizerModule({
				scrollingFrame = scrollingFrame,
				axis = p50.Axis.Y,
				dataSource = viewRecyclerModule.DataSource.snapshot({ `a-{var52}`, `b-{var52}` }, function(p55)
					return p55
				end),
				layout = var56,
				recyclingScope = var57,
				transition = function() end,
				getItemViewType = function()
					return "row"
				end
			})
			local var59 = clock()
			var58.destroy()
			local var60 = (clock() - var59) * 1000
			local var61 = clock()
			var57.dispose()
			local var62 = (clock() - var61) * 1000
			var53 += var60
			var54 += var62
			var55 += var60 + var62
			var49 += 1
			var58.destroy()
			var57.dispose()
			var51 += 1
			var56.destroy()
			scrollingFrame:Destroy()
		end
		return var55
	end, p54), {
		adaptersDestroyed = var49,
		itemViewsDestroyed = var50,
		idempotentDestroyCalls = var51,
		milestones = { hostTeardownMs = var53, scopeTeardownMs = var54 }
	})
end

return {
	run = function(p55, p56, p57, p58)
		-- upvalues: placementWorkload (ref), placementRoutingWorkload (ref), reparentSelectionWorkload (ref), physicalLifecycleWorkload (ref), scrollSynchronizationWorkload (ref), canvasPublicationWorkload (ref), measurementSchedulingWorkload (ref), measurementHeartbeatWorkload (ref), viewportActivationWorkload (ref), teardownWorkload (ref), frameWorkWorkloads (ref)
		p58 = p58 or {}
		local operationCount = p58.operationCount or 100
		assert(operationCount >= 1 and operationCount % 1 == 0, "operationCount must be a positive integer")
		local list = {
			placementWorkload(p55, p56, p57, operationCount, p58),
			placementRoutingWorkload(p55, p56, p57, operationCount, p58),
			reparentSelectionWorkload(p56, p57, operationCount, p58),
			physicalLifecycleWorkload(p55, p56, p57, operationCount, p58),
			scrollSynchronizationWorkload(p55, p56, p57, operationCount, p58),
			canvasPublicationWorkload(p55, p56, p57, operationCount, p58),
			measurementSchedulingWorkload(p55, p56, p57, operationCount, p58),
			measurementHeartbeatWorkload(p55, p56, p57, p58),
			viewportActivationWorkload(p55, p56, p57, operationCount, p58),
			teardownWorkload(p55, p56, p57, operationCount, p58)
		}
		
		for i, v in frameWorkWorkloads(p55, p56, p57, operationCount, p58) do
			table.insert(list, v)
		end
		return list
	end
}