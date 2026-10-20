local ResponsibilityCatalogModule = require(game:GetService("ReplicatedStorage").Packages._Workspace.ViewRecycler.ViewRecycler.Core.Diagnostics.__benchmarks__.ResponsibilityCatalog)
local list = { 10, 40 }

local function createItems(ItemCount)
	local Buffer = table.create(ItemCount)
	
	for i = 1, ItemCount do
		Buffer[i] = {
			id = `item{i}`,
			text = `Item {i}`,
			height = i % 5 * 2 + 36
		}
	end
	return Buffer
end

local function hasItemText(Folder, ItemName): boolean
	for _, Label in Folder:GetDescendants() do
		if Label:IsA("TextLabel") and Label.Name == "Content" and Label.Text == ItemName then
			return true
		end
	end
	return false
end

local function mountedItemCount(Folder): number
	local Count = 0
	
	for _, Label in Folder:GetDescendants() do
		if Label:IsA("TextLabel") and Label.Name == "Content" and Label.Text ~= "" then
			Count += 1
		end
	end
	return Count
end

local function findMeasuredObjects(ScreenGui, PreservedName)
	for _, Label in ScreenGui:GetDescendants() do
		if Label:IsA("TextLabel") and Label.Name == "Content" and Label.Text == PreservedName then
			local Parent = Label.Parent
			while Parent ~= nil and Parent ~= ScreenGui do
				if Parent:IsA("GuiObject") and string.find(Parent.Name, "ListItemViewFrame", 1, true) == 1 then
					return Label, Parent
				end
				Parent = Parent.Parent
			end
			return Label, nil
		end
	end
	return nil, nil
end

local function recordSizeComparison(ContentSizeComparisons, Key, Observed, Heartbeat3Settled)
	local ContentSizeComparison = ContentSizeComparisons[Key]
	
	if ContentSizeComparison == nil then
		ContentSizeComparison = {
			observed = 0,
			matchedSettled = 0,
			differedFromSettled = 0
		}
		ContentSizeComparisons[Key] = ContentSizeComparison
	end
	if Observed == nil then return end
	ContentSizeComparison.observed += 1
	
	if Observed == Heartbeat3Settled then
		ContentSizeComparison.matchedSettled += 1
		
		return
	else
		ContentSizeComparison.differedFromSettled += 1
	end
end

local function _(Object)
	local ScrollingFrame = Object:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(ScrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	
	return ScrollingFrame
end

local function flushDeferredWork()
	local BindableEvent = Instance.new("BindableEvent")
	task.defer(function()
		-- upvalues: BindableEvent (copy)
		BindableEvent:Fire()
	end)
	BindableEvent.Event:Wait()
	BindableEvent:Destroy()
end

local function waitForHeartbeatToSettle(p1)
	local BindableEvent = Instance.new("BindableEvent")
	p1.RunService.Heartbeat:Once(function()
		-- upvalues: BindableEvent (copy)
		task.defer(function()
			-- upvalues: BindableEvent (upval)
			task.defer(function()
				-- upvalues: BindableEvent (upval)
				BindableEvent:Fire()
			end)
		end)
	end)
	p1.ReactRoblox.act(function()
		-- upvalues: BindableEvent (copy)
		BindableEvent.Event:Wait()
	end)
	BindableEvent:Destroy()
end

local _ = function(p1, Key, Key1)
	local v1 = p1[Key]
	
	if v1 == nil then
		v1 = {}
		p1[Key] = v1
	end
	v1[Key1] = (v1[Key1] or 0) + 1
end

local function captureCompletionPhase(List, Keys, CompletionPhaseCounts, Key): boolean
	local Flag = true
	
	for i, value in List do
		if Keys[i] == nil and value() then
			Keys[i] = Key
			local CompletionPhaseCount = CompletionPhaseCounts[i]
			
			if CompletionPhaseCount == nil then
				CompletionPhaseCount = {}
				CompletionPhaseCounts[i] = CompletionPhaseCount
			end
			CompletionPhaseCount[Key] = (CompletionPhaseCount[Key] or 0) + 1
		end
		if Keys[i] == nil then
			Flag = false
		end
	end
	return Flag
end

local function observeCompletionPhases(p1, p2, Callback, CompletionPhaseCounts, p3)
	-- upvalues: captureCompletionPhase (copy), flushDeferredWork (copy), waitForHeartbeatToSettle (copy)
	local P22 = p3 or {}
	
	local function _(p4)
		-- upvalues: captureCompletionPhase (upval), p2 (copy), P22 (copy), CompletionPhaseCounts (copy)
		return (captureCompletionPhase(p2, P22, CompletionPhaseCounts, p4))
	end
	
	if captureCompletionPhase(p2, P22, CompletionPhaseCounts, "afterAct") then
		return P22
	end
	p1.ReactRoblox.act(flushDeferredWork)
	
	if captureCompletionPhase(p2, P22, CompletionPhaseCounts, "deferred") then
		return P22
	end
	waitForHeartbeatToSettle(p1)
	
	if captureCompletionPhase(p2, P22, CompletionPhaseCounts, "heartbeatSettled") then
		return P22
	end
	for _ = 1, 20 do
		waitForHeartbeatToSettle(p1)
		
		if captureCompletionPhase(p2, P22, CompletionPhaseCounts, "laterHeartbeat") then
			return P22
		end
	end
	error(`React benchmark did not complete: {if type(Callback) == "function" then Callback() else Callback}`)
end

local function createOffsets(Items: number, OperationsPerSample: number)
	local Largest = math.max(0, Items * 40 - 400)
	local Buffer = table.create(OperationsPerSample)
	
	for i = 1, OperationsPerSample do
		Buffer[i] = math.min(Largest, (math.max(1, (math.floor(Items * i / (OperationsPerSample + 1)))) - 1) * 40)
	end
	return Buffer
end

local function createItemTypes(p4)
	local React = p4.React
	local SignalsReact = p4.SignalsReact
	local ViewRecycler = p4.ViewRecycler
	
	return ViewRecycler.createRecyclableView(function(p5)
		-- upvalues: SignalsReact (copy), React (copy)
		return React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = SignalsReact.useSignalState(p5.itemSignal).text
		})
	end, { readiness = "ReadyOnAssignment" }), (ViewRecycler.createRecyclableView(function(p5)
		-- upvalues: SignalsReact (copy), React (copy)
		local UseSignalStateResult = SignalsReact.useSignalState(p5.itemSignal)
		
		return React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.None,
			Size = UDim2.new(1, 0, 0, UseSignalStateResult.height),
			Text = UseSignalStateResult.text
		})
	end, { readiness = "ReadyOnAssignment" }))
end

local _ = function(p4, p5, Data, Layout, ItemType, p6, Diagnostics, p7)
	p4.ReactRoblox.act(function()
		-- upvalues: Data (copy), Layout (copy), p4 (copy), ItemType (copy), Diagnostics (copy), p7 (copy), p5 (copy), p6 (copy)
		local config = {
			overscan = 0,
			data = Data,
			layout = Layout,
			axis = p4.ViewRecycler.Axis.Y,
			itemType = ItemType,
			diagnostics = Diagnostics
		}
		
		if p7 ~= nil then
			for i, value in p7 do
				config[i] = value
			end
		end
		p5:render(p4.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, p6 * 40)
		}, {
			List = p4.React.createElement(p4.ViewRecycler.VirtualList, config)
		}))
	end)
end

local _ = function(p8, p9, p10, Object)
	p8.ReactRoblox.act(function()
		-- upvalues: p9 (copy)
		p9:unmount()
	end)
	p10.destroy()
	Object:Destroy()
end

local _ = function(p8, p9): boolean
	return math.abs(p8 - p9) <= 0.01
end

local _ = function(p8, p9)
	-- upvalues: findMeasuredObjects (copy)
	local _, MeasuredObjects2 = findMeasuredObjects(p8, p9)
	
	return if MeasuredObjects2 == nil then nil else MeasuredObjects2.Position.Y.Offset
end

local function createPropagationScenario(p8, Name, PropagationItemCount: number)
	local ScaledPropagationItemCount = PropagationItemCount * 40
	local NewScaledPropagationItemCount = ScaledPropagationItemCount + 80
	local NewFloored = math.floor(PropagationItemCount / 2) + 1
	local NewFlooredDelta = NewFloored - 5
	local ScaledNewFlooredDelta = (NewFlooredDelta - 1) * 40
	
	if Name == "at-start" then
		return {
			insertIndex = 1,
			initialOffset = 0,
			initialDestinationText = "Item 10",
			insertedStartOffset = 0,
			neighborKey = "item1",
			neighborStartOffset = 80,
			finalScrollOffset = 0,
			overscan = 0,
			preserveScrollPositionOnChange = false,
			name = Name,
			finalContentLength = NewScaledPropagationItemCount
		}
	elseif Name == "in-middle" then
		return {
			overscan = 0,
			name = Name,
			insertIndex = NewFloored,
			initialOffset = ScaledNewFlooredDelta,
			initialDestinationText = `Item {NewFlooredDelta + 9}`,
			insertedStartOffset = (NewFloored - 1) * 40,
			neighborKey = `item{NewFloored}`,
			neighborStartOffset = (NewFloored - 1) * 40 + 80,
			finalContentLength = NewScaledPropagationItemCount,
			finalScrollOffset = ScaledNewFlooredDelta
		}
	elseif Name == "before-visible-anchor" then
		local ScaledNewFloored = (NewFloored - 1) * 40
		local NewFlooredDelta1 = NewFloored - 1
		
		return {
			overscan = 2,
			name = Name,
			insertIndex = NewFlooredDelta1,
			initialOffset = ScaledNewFloored,
			initialDestinationText = `Item {NewFloored + 9}`,
			insertedStartOffset = (NewFlooredDelta1 - 1) * 40,
			neighborKey = `item{NewFloored}`,
			neighborStartOffset = ScaledNewFloored + 80,
			finalContentLength = NewScaledPropagationItemCount,
			finalScrollOffset = ScaledNewFloored + 80
		}
	else
		return {
			overscan = 0,
			name = Name,
			insertIndex = PropagationItemCount + 1,
			initialOffset = ScaledPropagationItemCount - 400,
			initialDestinationText = `Item {PropagationItemCount}`,
			insertedStartOffset = ScaledPropagationItemCount,
			neighborKey = `item{PropagationItemCount}`,
			neighborStartOffset = ScaledPropagationItemCount - 40,
			finalContentLength = NewScaledPropagationItemCount,
			finalScrollOffset = NewScaledPropagationItemCount - 400,
			initialScrollAlignment = p8.ViewRecycler.ScrollAlignment.End,
			autoScrollOnChange = p8.ViewRecycler.AutoScrollPolicy.WhenAtEnd
		}
	end
end

local function measureCompletedMount(p8, p9, p10, p11, p12, VisibleRows, p13)
	-- upvalues: observeCompletionPhases (copy), hasItemText (copy), mountedItemCount (copy), ResponsibilityCatalogModule (copy)
	local Clock = p13.clock or os.clock
	local MountedItemViews = 0
	local CompletionPhaseCounts = {}
	
	return p10.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "completed-mount",
		description = "Mounts a uniform VirtualList and waits for the final expected visible row to commit.",
		responsibility = ResponsibilityCatalogModule.React.MountScroll,
		scale = {
			layout = "uniform",
			items = #p11,
			visibleRows = VisibleRows
		},
		timing = {
			unit = "ms",
			basis = "completedMount",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = {
			viewRecycler = p9.run(function()
				-- upvalues: p8 (copy), p11 (copy), Clock (copy), p12 (copy), VisibleRows (copy), observeCompletionPhases (upval), hasItemText (upval), CompletionPhaseCounts (copy), MountedItemViews (ref), mountedItemCount (upval)
				local Folder = Instance.new("Folder")
				local Root = p8.ReactRoblox.createRoot(Folder)
				local UniformResult = p8.ViewRecycler.Layout.uniform({ itemLength = 40 })
				local SnapshotResult = p8.ViewRecycler.DataSource.snapshot(p11, function(p14)
					return p14.id
				end)
				local ClockResult = Clock()
				local Diagnostics = nil
				local v1 = nil
				p8.ReactRoblox.act(function()
					-- upvalues: SnapshotResult (copy), UniformResult (copy), p8 (copy), p12 (copy), Diagnostics (copy), v1 (copy), Root (copy), VisibleRows (copy)
					local config = {
						overscan = 0,
						data = SnapshotResult,
						layout = UniformResult,
						axis = p8.ViewRecycler.Axis.Y,
						itemType = p12,
						diagnostics = Diagnostics
					}
					
					if v1 ~= nil then
						for i, value in v1 do
							config[i] = value
						end
					end
					Root:render(p8.React.createElement("Frame", {
						Name = "BenchmarkHost",
						Size = UDim2.fromOffset(400, VisibleRows * 40)
					}, {
						List = p8.React.createElement(p8.ViewRecycler.VirtualList, config)
					}))
				end)
				observeCompletionPhases(p8, {
					destinationRowCommitted = function()
						-- upvalues: hasItemText (upval), Folder (copy), VisibleRows (upval)
						return (hasItemText(Folder, `Item {VisibleRows}`))
					end
				}, `mount Item {VisibleRows}`, CompletionPhaseCounts)
				local ScaledClockResult = (Clock() - ClockResult) * 1000
				MountedItemViews = mountedItemCount(Folder)
				p8.ReactRoblox.act(function()
					-- upvalues: Root (copy)
					Root:unmount()
				end)
				UniformResult.destroy()
				Folder:Destroy()
				
				return ScaledClockResult
			end, p13)
		},
		evidence = {
			completionBarrier = "destinationRowCommitted",
			reactWorkFlush = "ReactRoblox.actWithMockScheduler",
			mountedItemViews = MountedItemViews,
			completionPhaseCounts = CompletionPhaseCounts
		}
	})
end

local function measureStatefulMountArm(p14, p15, p16, RecyclableView, VisibleRows, p17)
	-- upvalues: observeCompletionPhases (copy), hasItemText (copy), mountedItemCount (copy)
	local Clock = p17.clock or os.clock
	local v1 = 0
	local t = {}
	
	return p15.run(function()
		-- upvalues: p14 (copy), p16 (copy), Clock (copy), RecyclableView (copy), VisibleRows (copy), observeCompletionPhases (upval), hasItemText (upval), t (copy), v1 (ref), mountedItemCount (upval)
		local Folder = Instance.new("Folder")
		local Root = p14.ReactRoblox.createRoot(Folder)
		local UniformResult = p14.ViewRecycler.Layout.uniform({ itemLength = 40 })
		local SnapshotResult = p14.ViewRecycler.DataSource.snapshot(p16, function(p18)
			return p18.id
		end)
		local ClockResult = Clock()
		local Diagnostics = nil
		local v2 = nil
		p14.ReactRoblox.act(function()
			-- upvalues: SnapshotResult (copy), UniformResult (copy), p14 (copy), RecyclableView (copy), Diagnostics (copy), v2 (copy), Root (copy), VisibleRows (copy)
			local config = {
				overscan = 0,
				data = SnapshotResult,
				layout = UniformResult,
				axis = p14.ViewRecycler.Axis.Y,
				itemType = RecyclableView,
				diagnostics = Diagnostics
			}
			
			if v2 ~= nil then
				for i, value in v2 do
					config[i] = value
				end
			end
			Root:render(p14.React.createElement("Frame", {
				Name = "BenchmarkHost",
				Size = UDim2.fromOffset(400, VisibleRows * 40)
			}, {
				List = p14.React.createElement(p14.ViewRecycler.VirtualList, config)
			}))
		end)
		observeCompletionPhases(p14, {
			destinationRowCommitted = function()
				-- upvalues: hasItemText (upval), Folder (copy), VisibleRows (upval)
				return (hasItemText(Folder, `Item {VisibleRows}:0`))
			end
		}, `mount stateful Item {VisibleRows}`, t)
		local ScaledClockResult = (Clock() - ClockResult) * 1000
		v1 = mountedItemCount(Folder)
		p14.ReactRoblox.act(function()
			-- upvalues: Root (copy)
			Root:unmount()
		end)
		UniformResult.destroy()
		Folder:Destroy()
		
		return ScaledClockResult
	end, p17), v1, t
end

local function measureRecyclingStateMountOverhead(p18, p19, p20, p21, VisibleRows, p22)
	-- upvalues: measureStatefulMountArm (copy), ResponsibilityCatalogModule (copy)
	local React = p18.React
	local SignalsReact = p18.SignalsReact
	local ViewRecycler = p18.ViewRecycler
	local RecyclableView = ViewRecycler.createRecyclableView(function(p23)
		-- upvalues: SignalsReact (copy), ViewRecycler (copy), React (copy)
		return React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = `{SignalsReact.useSignalState(p23.itemSignal).text}:{ViewRecycler.useRecyclingState(0)}`
		})
	end)
	local MeasureStatefulMountArmResult, MeasureStatefulMountArmResult2, MeasureStatefulMountArmResult3 = measureStatefulMountArm(p18, p19, p21, ViewRecycler.createRecyclableView(function(p23)
		-- upvalues: SignalsReact (copy), React (copy)
		return React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = `{SignalsReact.useSignalState(p23.itemSignal).text}:{React.useState(0)}`
		})
	end), VisibleRows, p22)
	local MeasureStatefulMountArmResult1, MeasureStatefulMountArmResult2_1, MeasureStatefulMountArmResult3_1 = measureStatefulMountArm(p18, p19, p21, RecyclableView, VisibleRows, p22)
	
	return p20.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "recycling-state-mount-overhead",
		description = "Compares completed ItemView mount with ordinary React state and recycling-aware state.",
		responsibility = ResponsibilityCatalogModule.React.MountScroll,
		scale = {
			layout = "uniform",
			stateHooksPerItemView = 1,
			items = #p21,
			visibleRows = VisibleRows
		},
		timing = {
			unit = "ms",
			basis = "completedMount",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = {
			reactState = MeasureStatefulMountArmResult,
			recyclingState = MeasureStatefulMountArmResult1
		},
		evidence = {
			completionBarrier = "destinationRowCommitted",
			reactWorkFlush = "ReactRoblox.actWithMockScheduler",
			reactStateMountedItemViews = MeasureStatefulMountArmResult2,
			recyclingStateMountedItemViews = MeasureStatefulMountArmResult2_1,
			completionPhaseCounts = {
				reactState = MeasureStatefulMountArmResult3,
				recyclingState = MeasureStatefulMountArmResult3_1
			}
		}
	})
end

local function measureCompletedTraversal(p18, p19, p20, p21, ItemType, ItemCount, ScrollStepCount, p22, p23)
	-- upvalues: hasItemText (copy), observeCompletionPhases (copy), createOffsets (copy), captureCompletionPhase (copy), mountedItemCount (copy), ResponsibilityCatalogModule (copy)
	local Clock = p23.clock or os.clock
	local Folder = Instance.new("Folder")
	local Root = p18.ReactRoblox.createRoot(Folder)
	local MeasuredResult = if p22 then p18.ViewRecycler.Layout.measured({ estimatedItemLength = 40 }) else p18.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local SequenceResult = p18.ViewRecycler.DataSource.sequence(p21, function(p24)
		return p24.id
	end)
	local NewAccepted = 0
	
	local function Diagnostics(p24)
		-- upvalues: NewAccepted (ref)
		if p24.kind == "measurementsProcessed" then
			NewAccepted += p24.accepted
		end
	end
	
	local v2 = nil
	local v3 = 10
	p18.ReactRoblox.act(function()
		-- upvalues: SequenceResult (copy), MeasuredResult (copy), p18 (copy), ItemType (copy), Diagnostics (copy), v2 (copy), Root (copy), v3 (copy)
		local config = {
			overscan = 0,
			data = SequenceResult,
			layout = MeasuredResult,
			axis = p18.ViewRecycler.Axis.Y,
			itemType = ItemType,
			diagnostics = Diagnostics
		}
		
		if v2 ~= nil then
			for i, value in v2 do
				config[i] = value
			end
		end
		Root:render(p18.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, v3 * 40)
		}, {
			List = p18.React.createElement(p18.ViewRecycler.VirtualList, config)
		}))
	end)
	local config = {
		destinationRowCommitted = function()
			-- upvalues: hasItemText (upval), Folder (copy)
			return (hasItemText(Folder, "Item 10"))
		end
	}
	
	if p22 then
		function config.measurementAccepted(): boolean
			-- upvalues: NewAccepted (ref)
			return NewAccepted > 0
		end
	end
	observeCompletionPhases(p18, config, "initial visible rows", {})
	local ScrollingFrame = Folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(ScrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local Offsets = createOffsets(ItemCount, ScrollStepCount)
	local v4 = 0
	local AcceptedMeasurementsPerTraversal = 0
	local CompletionPhaseCounts = {}
	local RunResult = p19.run(function()
		-- upvalues: v4 (ref), p22 (copy), Offsets (copy), SequenceResult (copy), NewAccepted (ref), Clock (copy), hasItemText (upval), Folder (copy), p18 (copy), ScrollingFrame (copy), captureCompletionPhase (upval), CompletionPhaseCounts (copy), observeCompletionPhases (upval), AcceptedMeasurementsPerTraversal (ref)
		v4 = (v4 + 1) % 2
		
		if p22 then
			for _, offset in Offsets do
				local NewFloored = math.floor(offset / 40) + 1
				local Copy = table.clone((SequenceResult.getItem(NewFloored)))
				Copy.height = if v4 == 0 then 36 else 44
				SequenceResult.setItem(NewFloored, Copy)
			end
		end
		local NewAccepted1 = NewAccepted
		local ClockResult = Clock()
		
		for _, offset1 in Offsets do
			local NewFloored = math.floor(offset1 / 40) + 1
			local NewAccepted2 = NewAccepted
			local config = {
				destinationRowCommitted = function()
					-- upvalues: hasItemText (upval), Folder (upval), NewFloored (copy)
					return (hasItemText(Folder, `Item {NewFloored}`))
				end
			}
			
			if p22 then
				function config.measurementAccepted(): boolean
					-- upvalues: NewAccepted (upval), NewAccepted2 (copy)
					return NewAccepted2 < NewAccepted
				end
			end
			local t = {}
			p18.ReactRoblox.act(function()
				-- upvalues: ScrollingFrame (upval), offset1 (copy), captureCompletionPhase (upval), config (copy), t (copy), CompletionPhaseCounts (upval)
				ScrollingFrame.CanvasPosition = Vector2.new(0, offset1)
				captureCompletionPhase(config, t, CompletionPhaseCounts, "afterMutation")
			end)
			observeCompletionPhases(p18, config, `scroll Item {NewFloored}`, CompletionPhaseCounts, t)
		end
		local ScaledClockResult = (Clock() - ClockResult) * 1000
		AcceptedMeasurementsPerTraversal = NewAccepted - NewAccepted1
		p18.ReactRoblox.act(function()
			-- upvalues: ScrollingFrame (upval)
			ScrollingFrame.CanvasPosition = Vector2.zero
		end)
		observeCompletionPhases(p18, {
			destinationRowCommitted = function()
				-- upvalues: hasItemText (upval), Folder (upval)
				return (hasItemText(Folder, "Item 1"))
			end
		}, "reset scroll position", {})
		
		return ScaledClockResult
	end, p23)
	local MountedItemCountResult = mountedItemCount(Folder)
	p18.ReactRoblox.act(function()
		-- upvalues: Root (copy)
		Root:unmount()
	end)
	MeasuredResult.destroy()
	Folder:Destroy()
	
	return p20.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		responsibility = ResponsibilityCatalogModule.React.MountScroll,
		workload = if p22 then "completed-measured-traversal" else "completed-uniform-traversal",
		description = if p22 then "Scrolls a measured VirtualList and waits for both destination-row commits and accepted size updates." else "Scrolls a uniform VirtualList and waits for each destination row to commit.",
		scale = {
			visibleRows = 10,
			items = ItemCount,
			scrollSteps = ScrollStepCount,
			layout = if p22 then "measured" else "uniform"
		},
		timing = {
			unit = "ms",
			basis = "completedScrollTraversal",
			includesSchedulerWaits = true,
			operationsPerSample = ScrollStepCount
		},
		arms = { viewRecycler = RunResult },
		evidence = {
			reactWorkFlush = "ReactRoblox.actWithMockScheduler",
			mountedItemViews = MountedItemCountResult,
			acceptedMeasurementsPerTraversal = AcceptedMeasurementsPerTraversal,
			completionBarrier = if p22 then "destinationRowCommittedAndMeasurementAccepted" else "destinationRowCommitted",
			completionPhaseCounts = CompletionPhaseCounts
		}
	})
end

local function measureHostSizeSettlePhases(p24, p25, p26, p27)
	-- upvalues: observeCompletionPhases (copy), hasItemText (copy), waitForHeartbeatToSettle (copy), findMeasuredObjects (copy), flushDeferredWork (copy), recordSizeComparison (copy), ResponsibilityCatalogModule (copy)
	local Clock = p27.clock or os.clock
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Parent = game:GetService("CoreGui")
	local Root = p24.ReactRoblox.createRoot(ScreenGui)
	local MeasuredResult = p24.ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local Repeated = string.rep("This response grows enough to wrap across the measured row. ", 8)
	local RecyclableView = p24.ViewRecycler.createRecyclableView(function(p28)
		-- upvalues: p24 (copy)
		return p24.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.fromOffset(10, 0),
			Size = UDim2.new(1, -20, 0, 0),
			Text = p24.SignalsReact.useSignalState(p28.itemSignal).text
		})
	end, { readiness = "ReadyOnCommit", hideWhilePending = true })
	local config = {
		id = "measurement-probe",
		text = "Short response",
		height = 40
	}
	local SequenceResult = p24.ViewRecycler.DataSource.sequence({ config }, function(p28)
		return p28.id
	end)
	local NewAccepted = 0
	
	local function Diagnostics(p28)
		-- upvalues: NewAccepted (ref)
		if p28.kind == "measurementsProcessed" then
			NewAccepted += p28.accepted
		end
	end
	
	local v5 = nil
	local v6 = 3
	p24.ReactRoblox.act(function()
		-- upvalues: SequenceResult (copy), MeasuredResult (copy), p24 (copy), RecyclableView (copy), Diagnostics (copy), v5 (copy), Root (copy), v6 (copy)
		local config = {
			overscan = 0,
			data = SequenceResult,
			layout = MeasuredResult,
			axis = p24.ViewRecycler.Axis.Y,
			itemType = RecyclableView,
			diagnostics = Diagnostics
		}
		
		if v5 ~= nil then
			for i, value in v5 do
				config[i] = value
			end
		end
		Root:render(p24.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, v6 * 40)
		}, {
			List = p24.React.createElement(p24.ViewRecycler.VirtualList, config)
		}))
	end)
	observeCompletionPhases(p24, {
		destinationRowCommitted = function()
			-- upvalues: hasItemText (upval), ScreenGui (copy)
			return (hasItemText(ScreenGui, "Short response"))
		end,
		measurementAccepted = function(): boolean
			-- upvalues: NewAccepted (ref)
			return NewAccepted > 0
		end
	}, "initial wrapped measured row", {})
	waitForHeartbeatToSettle(p24)
	waitForHeartbeatToSettle(p24)
	local v7 = 0
	local CompletionPhaseCounts = {}
	local HostSizeComparisons = {}
	local ContentSizeComparisons = {}
	local SettledHostSizeCounts = {}
	local SettledContentSizeCounts = {}
	local MismatchExamples = { host = {}, content = {} }
	local Update = 0
	local RunResult = p25.run(function()
		-- upvalues: Update (ref), v7 (ref), Repeated (copy), NewAccepted (ref), findMeasuredObjects (upval), ScreenGui (copy), CompletionPhaseCounts (copy), Clock (copy), p24 (copy), SequenceResult (copy), config (copy), flushDeferredWork (upval), waitForHeartbeatToSettle (upval), SettledHostSizeCounts (copy), SettledContentSizeCounts (copy), recordSizeComparison (upval), HostSizeComparisons (copy), MismatchExamples (copy), ContentSizeComparisons (copy)
		Update += 1
		v7 = (v7 + 1) % 2
		local ShortResponse = if v7 == 0 then "Short response" else Repeated
		local Short: string = if v7 == 0 then "short" else "long"
		local NewAccepted1 = NewAccepted
		local t = {}
		local t1 = {}
		local v8: string? = nil
		
		local function _(Key)
			-- upvalues: findMeasuredObjects (upval), ScreenGui (upval), ShortResponse (copy), t1 (copy), t (copy), v8 (ref), NewAccepted (upval), NewAccepted1 (copy), CompletionPhaseCounts (upval)
			local MeasuredObjects, MeasuredObjects2 = findMeasuredObjects(ScreenGui, ShortResponse)
			
			if MeasuredObjects ~= nil then
				t1[Key] = MeasuredObjects.AbsoluteSize.Y
			end
			if MeasuredObjects2 ~= nil then
				t[Key] = MeasuredObjects2.AbsoluteSize.Y
			end
			if v8 == nil and NewAccepted1 < NewAccepted then
				v8 = Key
				local MeasurementAccepted = CompletionPhaseCounts.measurementAccepted
				
				if MeasurementAccepted == nil then
					MeasurementAccepted = {}
					CompletionPhaseCounts.measurementAccepted = MeasurementAccepted
				end
				MeasurementAccepted[Key] = (MeasurementAccepted[Key] or 0) + 1
			end
		end
		
		local ClockResult = Clock()
		p24.ReactRoblox.act(function()
			-- upvalues: SequenceResult (upval), config (upval), ShortResponse (copy), findMeasuredObjects (upval), ScreenGui (upval), t1 (copy), t (copy), v8 (ref), NewAccepted (upval), NewAccepted1 (copy), CompletionPhaseCounts (upval)
			SequenceResult.setItem(1, {
				id = config.id,
				text = ShortResponse,
				height = config.height
			})
			local MeasuredObjects, MeasuredObjects2 = findMeasuredObjects(ScreenGui, ShortResponse)
			
			if MeasuredObjects ~= nil then
				t1.afterMutation = MeasuredObjects.AbsoluteSize.Y
			end
			if MeasuredObjects2 ~= nil then
				t.afterMutation = MeasuredObjects2.AbsoluteSize.Y
			end
			if v8 == nil and NewAccepted1 < NewAccepted then
				v8 = "afterMutation"
				local MeasurementAccepted = CompletionPhaseCounts.measurementAccepted
				
				if MeasurementAccepted == nil then
					MeasurementAccepted = {}
					CompletionPhaseCounts.measurementAccepted = MeasurementAccepted
				end
				MeasurementAccepted.afterMutation = (MeasurementAccepted.afterMutation or 0) + 1
			end
		end)
		local MeasuredObjects, MeasuredObjects2 = findMeasuredObjects(ScreenGui, ShortResponse)
		
		if MeasuredObjects ~= nil then
			t1.afterAct = MeasuredObjects.AbsoluteSize.Y
		end
		if MeasuredObjects2 ~= nil then
			t.afterAct = MeasuredObjects2.AbsoluteSize.Y
		end
		if v8 == nil and NewAccepted1 < NewAccepted then
			v8 = "afterAct"
			local MeasurementAccepted = CompletionPhaseCounts.measurementAccepted
			
			if MeasurementAccepted == nil then
				MeasurementAccepted = {}
				CompletionPhaseCounts.measurementAccepted = MeasurementAccepted
			end
			MeasurementAccepted.afterAct = (MeasurementAccepted.afterAct or 0) + 1
		end
		p24.ReactRoblox.act(flushDeferredWork)
		local MeasuredObjects1, MeasuredObjects2_1 = findMeasuredObjects(ScreenGui, ShortResponse)
		
		if MeasuredObjects1 ~= nil then
			t1.deferred = MeasuredObjects1.AbsoluteSize.Y
		end
		if MeasuredObjects2_1 ~= nil then
			t.deferred = MeasuredObjects2_1.AbsoluteSize.Y
		end
		if v8 == nil and NewAccepted1 < NewAccepted then
			v8 = "deferred"
			local MeasurementAccepted = CompletionPhaseCounts.measurementAccepted
			
			if MeasurementAccepted == nil then
				MeasurementAccepted = {}
				CompletionPhaseCounts.measurementAccepted = MeasurementAccepted
			end
			MeasurementAccepted.deferred = (MeasurementAccepted.deferred or 0) + 1
		end
		for i = 1, 3 do
			waitForHeartbeatToSettle(p24)
			local HeartbeatName: string = `heartbeat{i}Settled`
			local MeasuredObjects3, MeasuredObjects2_2 = findMeasuredObjects(ScreenGui, ShortResponse)
			
			if MeasuredObjects3 ~= nil then
				t1[HeartbeatName] = MeasuredObjects3.AbsoluteSize.Y
			end
			if MeasuredObjects2_2 ~= nil then
				t[HeartbeatName] = MeasuredObjects2_2.AbsoluteSize.Y
			end
			if v8 == nil and NewAccepted1 < NewAccepted then
				v8 = HeartbeatName
				local MeasurementAccepted = CompletionPhaseCounts.measurementAccepted
				
				if MeasurementAccepted == nil then
					MeasurementAccepted = {}
					CompletionPhaseCounts.measurementAccepted = MeasurementAccepted
				end
				MeasurementAccepted[HeartbeatName] = (MeasurementAccepted[HeartbeatName] or 0) + 1
			end
		end
		local ScaledClockResult = (Clock() - ClockResult) * 1000
		
		if v8 == nil then
			local MeasurementAccepted = CompletionPhaseCounts.measurementAccepted
			
			if MeasurementAccepted == nil then
				MeasurementAccepted = {}
				CompletionPhaseCounts.measurementAccepted = MeasurementAccepted
			end
			MeasurementAccepted.notAcceptedWithinThreeHeartbeats = (MeasurementAccepted.notAcceptedWithinThreeHeartbeats or 0) + 1
		end
		local Heartbeat3Settled = t.heartbeat3Settled
		local Heartbeat3Settled1 = t1.heartbeat3Settled
		assert(Heartbeat3Settled ~= nil and Heartbeat3Settled1 ~= nil, "wrapped measured row did not settle")
		SettledHostSizeCounts[tostring(Heartbeat3Settled)] = (SettledHostSizeCounts[tostring(Heartbeat3Settled)] or 0) + 1
		SettledContentSizeCounts[tostring(Heartbeat3Settled1)] = (SettledContentSizeCounts[tostring(Heartbeat3Settled1)] or 0) + 1
		
		for i2, Observed1 in t do
			recordSizeComparison(HostSizeComparisons, i2, Observed1, Heartbeat3Settled)
			
			if Observed1 ~= Heartbeat3Settled and MismatchExamples.host[i2] == nil then
				MismatchExamples.host[i2] = {
					update = Update,
					text = Short,
					observed = Observed1,
					settled = Heartbeat3Settled
				}
			end
		end
		for i1, Observed in t1 do
			recordSizeComparison(ContentSizeComparisons, i1, Observed, Heartbeat3Settled1)
			
			if Observed ~= Heartbeat3Settled1 and MismatchExamples.content[i1] == nil then
				MismatchExamples.content[i1] = {
					update = Update,
					text = Short,
					observed = Observed,
					settled = Heartbeat3Settled1
				}
			end
		end
		return ScaledClockResult
	end, p27)
	p24.ReactRoblox.act(function()
		-- upvalues: Root (copy)
		Root:unmount()
	end)
	MeasuredResult.destroy()
	ScreenGui:Destroy()
	
	return p26.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "phased",
		workload = "measurement-settle-phases",
		description = "Compares wrapped content and measured-host sizes before and after Roblox layout Heartbeats.",
		responsibility = ResponsibilityCatalogModule.React.MeasurementWiring,
		scale = {
			items = 1,
			layout = "measured",
			content = "wrappedTextItemRevision",
			heartbeatObservations = 3
		},
		timing = {
			unit = "ms",
			basis = "threeHeartbeatSettleProbe",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = { viewRecycler = RunResult },
		evidence = {
			reactWorkFlush = "ReactRoblox.actWithMockScheduler",
			completionPhaseCounts = CompletionPhaseCounts,
			hostSizeComparisons = HostSizeComparisons,
			contentSizeComparisons = ContentSizeComparisons,
			settledHostSizeCounts = SettledHostSizeCounts,
			settledContentSizeCounts = SettledContentSizeCounts,
			mismatchExamples = MismatchExamples
		}
	})
end

local function runAssignmentPropagationSample(p28, ItemType, PropagationScenario, Items: number, p29)
	-- upvalues: observeCompletionPhases (copy), hasItemText (copy), waitForHeartbeatToSettle (copy), findMeasuredObjects (copy)
	local Clock = p29.clock or os.clock
	local Buffer = table.create(Items)
	
	for i = 1, Items do
		Buffer[i] = { height = 40, id = `item{i}`, text = `Item {i}` }
	end
	local config = {
		height = 80,
		id = `inserted-{PropagationScenario.name}`,
		text = `Inserted {PropagationScenario.name}`
	}
	local Folder = Instance.new("Folder")
	local Root = p28.ReactRoblox.createRoot(Folder)
	local MeasuredResult = p28.ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local SequenceResult = p28.ViewRecycler.DataSource.sequence(Buffer, function(p30)
		return p30.id
	end)
	local v9 = nil
	local v10 = nil
	local v11 = nil
	local v12 = nil
	local v13 = nil
	local Flag = false
	local ObservedContentLength = nil
	local config1 = { data = 0, measurement = 0, programmaticScroll = 0 }
	local CompletionPhaseCounts = {}
	
	local function Diagnostics(p30)
		-- upvalues: Flag (ref), v9 (ref), v10 (ref), Clock (copy), v11 (ref), config1 (copy)
		if not Flag then return end
		if p30.kind == "measurementsProcessingStarted" and v9 ~= nil then
			v10 = v10 or Clock()
			
			return
		end
		if p30.kind == "measurementsProcessed" and p30.accepted > 0 and v9 ~= nil then
			v11 = v11 or Clock()
			
			return
		end
		if p30.kind == "scrollCorrection" then
			local Source = p30.source
			config1[Source] += p30.delta
		end
	end
	
	local config2 = {
		overscan = PropagationScenario.overscan,
		preserveScrollPositionOnChange = PropagationScenario.preserveScrollPositionOnChange,
		initialScrollAlignment = PropagationScenario.initialScrollAlignment,
		autoScrollOnChange = PropagationScenario.autoScrollOnChange,
		_instrumentation = {
			assignmentChanged = function(_, p30)
				-- upvalues: Flag (ref), config (copy), v9 (ref), Clock (copy)
				if Flag and p30 ~= nil and p30.key == config.id and v9 == nil then
					v9 = Clock()
				end
			end
		},
		onContentLengthChanged = function(p30)
			-- upvalues: Flag (ref), PropagationScenario (copy), ObservedContentLength (ref)
			if Flag and math.abs(p30 - PropagationScenario.finalContentLength) <= 0.01 then
				ObservedContentLength = p30
			end
		end
	}
	local v14 = 10
	p28.ReactRoblox.act(function()
		-- upvalues: SequenceResult (copy), MeasuredResult (copy), p28 (copy), ItemType (copy), Diagnostics (copy), config2 (copy), Root (copy), v14 (copy)
		local config = {
			overscan = 0,
			data = SequenceResult,
			layout = MeasuredResult,
			axis = p28.ViewRecycler.Axis.Y,
			itemType = ItemType,
			diagnostics = Diagnostics
		}
		
		if config2 ~= nil then
			for i, value in config2 do
				config[i] = value
			end
		end
		Root:render(p28.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, v14 * 40)
		}, {
			List = p28.React.createElement(p28.ViewRecycler.VirtualList, config)
		}))
	end)
	local ScrollingFrame = Folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(ScrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	p28.ReactRoblox.act(function()
		-- upvalues: ScrollingFrame (copy), PropagationScenario (copy)
		ScrollingFrame.CanvasPosition = Vector2.new(0, PropagationScenario.initialOffset)
	end)
	observeCompletionPhases(p28, {
		destinationRowCommitted = function()
			-- upvalues: hasItemText (upval), Folder (copy), PropagationScenario (copy)
			return (hasItemText(Folder, PropagationScenario.initialDestinationText))
		end,
		initialCanvasSettled = function(): boolean
			-- upvalues: ScrollingFrame (copy), Items (copy)
			return math.abs(ScrollingFrame.CanvasSize.Y.Offset - Items * 40) <= 0.01
		end
	}, `prepare {PropagationScenario.name} insertion`, {})
	waitForHeartbeatToSettle(p28)
	assert(math.abs(ScrollingFrame.CanvasSize.Y.Offset - Items * 40) <= 0.01, `{PropagationScenario.name}: initial canvas size did not settle (expected {Items * 40}, got {ScrollingFrame.CanvasSize.Y.Offset})`)
	assert(math.abs(ScrollingFrame.CanvasPosition.Y - PropagationScenario.initialOffset) <= 0.01, `{PropagationScenario.name}: initial scroll position did not settle`)
	Flag = true
	p28.ReactRoblox.act(function()
		-- upvalues: SequenceResult (copy), PropagationScenario (copy), config (copy)
		SequenceResult.insert(PropagationScenario.insertIndex, config)
	end)
	local v15: number = if PropagationScenario.name == "before-visible-anchor" then 40 else 0
	local v16: number = if PropagationScenario.name == "before-visible-anchor" then 40 else 0
	local t = {}
	
	local function captureLibraryPublication(): boolean
		-- upvalues: Folder (copy), config (copy), findMeasuredObjects (upval), PropagationScenario (copy), v9 (ref), v10 (ref), v11 (ref), ObservedContentLength (ref), config1 (copy), v15 (copy), v16 (copy), v12 (ref), Clock (copy)
		local _, MeasuredObjects2 = findMeasuredObjects(Folder, config.text)
		local Offset = if MeasuredObjects2 == nil then nil else MeasuredObjects2.Position.Y.Offset
		local _, MeasuredObjects2_1 = findMeasuredObjects(Folder, `Item {string.sub(PropagationScenario.neighborKey, 5)}`)
		local Offset1 = if MeasuredObjects2_1 == nil then nil else MeasuredObjects2_1.Position.Y.Offset
		local IsMagnitudeBelow: boolean = v9 ~= nil and (v10 ~= nil and (v11 ~= nil and (ObservedContentLength ~= nil and (Offset ~= nil and (math.abs(Offset - PropagationScenario.insertedStartOffset) <= 0.01 and (Offset1 ~= nil and (math.abs(Offset1 - PropagationScenario.neighborStartOffset) <= 0.01 and (math.abs(config1.data - v15) <= 0.01 and math.abs(config1.measurement - v16) <= 0.01))))))))
		
		if IsMagnitudeBelow and v12 == nil then
			v12 = Clock()
		end
		return IsMagnitudeBelow
	end
	
	observeCompletionPhases(p28, {
		libraryOutputsPublished = captureLibraryPublication,
		hostValuesObserved = function(): boolean
			-- upvalues: captureLibraryPublication (copy), Folder (copy), config (copy), findMeasuredObjects (upval), PropagationScenario (copy), t (ref), v9 (ref), v10 (ref), v11 (ref), v12 (ref), ObservedContentLength (ref), ScrollingFrame (copy), v13 (ref), Clock (copy)
			captureLibraryPublication()
			local _, MeasuredObjects2 = findMeasuredObjects(Folder, config.text)
			local Offset = if MeasuredObjects2 == nil then nil else MeasuredObjects2.Position.Y.Offset
			local _, MeasuredObjects2_1 = findMeasuredObjects(Folder, `Item {string.sub(PropagationScenario.neighborKey, 5)}`)
			t = {
				assigned = v9 ~= nil,
				measurementStarted = v10 ~= nil,
				measurementProcessed = v11 ~= nil,
				libraryPublished = v12 ~= nil,
				observedContentLength = ObservedContentLength,
				canvasLength = ScrollingFrame.CanvasSize.Y.Offset,
				scrollOffset = ScrollingFrame.CanvasPosition.Y,
				insertedOffset = Offset,
				neighborOffset = if MeasuredObjects2_1 == nil then nil else MeasuredObjects2_1.Position.Y.Offset
			}
			local IsMagnitudeBelow: boolean = v9 ~= nil and (v12 ~= nil and (math.abs(ScrollingFrame.CanvasSize.Y.Offset - PropagationScenario.finalContentLength) <= 0.01 and math.abs(ScrollingFrame.CanvasPosition.Y - PropagationScenario.finalScrollOffset) <= 0.01))
			
			if IsMagnitudeBelow and v13 == nil then
				v13 = Clock()
			end
			return IsMagnitudeBelow
		end
	}, function(): string
		-- upvalues: PropagationScenario (copy), t (ref)
		return `{PropagationScenario.name} assignment, measurement, and propagation; assigned={t.assigned}, measurementStarted={t.measurementStarted}, measurementProcessed={t.measurementProcessed}, libraryPublished={t.libraryPublished}, content={t.observedContentLength}, canvas={t.canvasLength}, scroll={t.scrollOffset}, inserted={t.insertedOffset}, neighbor={t.neighborOffset}`
	end, CompletionPhaseCounts)
	local v17 = assert(v9, `{PropagationScenario.name}: inserted item was not assigned`)
	local v18 = assert(v10, `{PropagationScenario.name}: inserted item measurement did not reach Core`)
	local v19 = assert(v11, `{PropagationScenario.name}: inserted item measurement was not accepted`)
	local v20 = assert(v12, `{PropagationScenario.name}: library outputs were not fully published`)
	local v21 = assert(v13, `{PropagationScenario.name}: host values did not fully propagate`)
	assert(v17 <= v18, `{PropagationScenario.name}: measurement preceded assignment`)
	assert(v18 <= v19, `{PropagationScenario.name}: measurement completed before it started`)
	assert(v19 <= v20, `{PropagationScenario.name}: library outputs preceded measurement`)
	assert(v20 <= v21, `{PropagationScenario.name}: host values preceded library outputs`)
	assert(math.abs(config1.data - v15) <= 0.01, `{PropagationScenario.name}: unexpected insertion anchor correction`)
	assert(math.abs(config1.measurement - v16) <= 0.01, `{PropagationScenario.name}: unexpected measurement anchor correction`)
	local _, MeasuredObjects2 = findMeasuredObjects(Folder, config.text)
	local Offset = if MeasuredObjects2 == nil then nil else MeasuredObjects2.Position.Y.Offset
	local _, MeasuredObjects2_1 = findMeasuredObjects(Folder, `Item {string.sub(PropagationScenario.neighborKey, 5)}`)
	local config3 = {
		insertIndex = PropagationScenario.insertIndex,
		insertedStartOffset = Offset,
		neighborKey = PropagationScenario.neighborKey,
		neighborStartOffset = if MeasuredObjects2_1 == nil then nil else MeasuredObjects2_1.Position.Y.Offset,
		contentLength = ScrollingFrame.CanvasSize.Y.Offset,
		scrollOffset = ScrollingFrame.CanvasPosition.Y,
		dataAnchorCorrection = config1.data,
		measurementAnchorCorrection = config1.measurement,
		completionPhaseCounts = CompletionPhaseCounts,
		assignmentToMeasurementStartMs = (v18 - v17) * 1000,
		measurementProcessingMs = (v19 - v18) * 1000,
		measurementProcessedToLibraryPublicationMs = (v20 - v19) * 1000,
		libraryPublicationToHostObservationMs = (v21 - v20) * 1000,
		assignmentToHostObservationMs = (v21 - v17) * 1000
	}
	p28.ReactRoblox.act(function()
		-- upvalues: Root (copy)
		Root:unmount()
	end)
	MeasuredResult.destroy()
	Folder:Destroy()
	
	return config3
end

local function measureAssignmentPropagation(p30, p31, p32, p33, p34, Items, p35)
	-- upvalues: runAssignmentPropagationSample (copy), ResponsibilityCatalogModule (copy)
	local Evidence = {}
	
	return p32.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "phased",
		workload = "measured-insertion-propagation",
		description = "Times an inserted row from assignment through measurement and fully propagated host geometry.",
		responsibility = ResponsibilityCatalogModule.React.MeasurementWiring,
		scale = {
			estimatedItemLength = 40,
			insertedItemLength = 80,
			visibleRows = 10,
			items = Items,
			scenario = p34.name
		},
		timing = {
			unit = "ms",
			basis = "assignmentToMilestone",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = {
			assignmentToMeasurementStart = p31.run(function()
				-- upvalues: runAssignmentPropagationSample (upval), p30 (copy), p33 (copy), p34 (copy), Items (copy), p35 (copy), Evidence (ref)
				local RunAssignmentPropagationSampleResult = runAssignmentPropagationSample(p30, p33, p34, Items, p35)
				Evidence = RunAssignmentPropagationSampleResult
				
				return RunAssignmentPropagationSampleResult.assignmentToMeasurementStartMs
			end, p35),
			measurementProcessing = p31.run(function()
				-- upvalues: runAssignmentPropagationSample (upval), p30 (copy), p33 (copy), p34 (copy), Items (copy), p35 (copy), Evidence (ref)
				local RunAssignmentPropagationSampleResult = runAssignmentPropagationSample(p30, p33, p34, Items, p35)
				Evidence = RunAssignmentPropagationSampleResult
				
				return RunAssignmentPropagationSampleResult.measurementProcessingMs
			end, p35),
			measurementProcessedToLibraryPublication = p31.run(function()
				-- upvalues: runAssignmentPropagationSample (upval), p30 (copy), p33 (copy), p34 (copy), Items (copy), p35 (copy), Evidence (ref)
				local RunAssignmentPropagationSampleResult = runAssignmentPropagationSample(p30, p33, p34, Items, p35)
				Evidence = RunAssignmentPropagationSampleResult
				
				return RunAssignmentPropagationSampleResult.measurementProcessedToLibraryPublicationMs
			end, p35),
			libraryPublicationToHostObservation = p31.run(function()
				-- upvalues: runAssignmentPropagationSample (upval), p30 (copy), p33 (copy), p34 (copy), Items (copy), p35 (copy), Evidence (ref)
				local RunAssignmentPropagationSampleResult = runAssignmentPropagationSample(p30, p33, p34, Items, p35)
				Evidence = RunAssignmentPropagationSampleResult
				
				return RunAssignmentPropagationSampleResult.libraryPublicationToHostObservationMs
			end, p35),
			assignmentToHostObservation = p31.run(function()
				-- upvalues: runAssignmentPropagationSample (upval), p30 (copy), p33 (copy), p34 (copy), Items (copy), p35 (copy), Evidence (ref)
				local RunAssignmentPropagationSampleResult = runAssignmentPropagationSample(p30, p33, p34, Items, p35)
				Evidence = RunAssignmentPropagationSampleResult
				
				return RunAssignmentPropagationSampleResult.assignmentToHostObservationMs
			end, p35)
		},
		evidence = Evidence
	})
end

local Callback = nil

local function measureDeclarativeReconciliation(p30, p31, p32, ItemType, p33)
	-- upvalues: createItems (copy), observeCompletionPhases (copy), hasItemText (copy), ResponsibilityCatalogModule (copy)
	local Clock = p33.clock or os.clock
	local Folder = Instance.new("Folder")
	local Root = p30.ReactRoblox.createRoot(Folder)
	local UniformResult = p30.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local Items = createItems(20)
	local Items1 = createItems(20)
	
	for i, value in Items1 do
		value.text = `Reconciled {i}`
	end
	local function _(Items)
		return {
			items = Items,
			getItemKey = function(p34)
				return p34.id
			end
		}
	end
	
	local Data = {
		items = Items,
		getItemKey = function(p34)
			return p34.id
		end
	}
	local Diagnostics = nil
	local v15 = nil
	local v16 = 10
	p30.ReactRoblox.act(function()
		-- upvalues: Data (copy), UniformResult (copy), p30 (copy), ItemType (copy), Diagnostics (copy), v15 (copy), Root (copy), v16 (copy)
		local config = {
			overscan = 0,
			data = Data,
			layout = UniformResult,
			axis = p30.ViewRecycler.Axis.Y,
			itemType = ItemType,
			diagnostics = Diagnostics
		}
		
		if v15 ~= nil then
			for i, value in v15 do
				config[i] = value
			end
		end
		Root:render(p30.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, v16 * 40)
		}, {
			List = p30.React.createElement(p30.ViewRecycler.VirtualList, config)
		}))
	end)
	local Inverted = false
	local Reconciliations = 0
	local CompletionPhaseCounts = {}
	local Reconciled = ""
	local RunResult = p31.run(function()
		-- upvalues: Inverted (ref), Items1 (copy), Items (copy), Reconciled (ref), Clock (copy), p30 (copy), Root (copy), UniformResult (copy), ItemType (copy), observeCompletionPhases (upval), hasItemText (upval), Folder (copy), CompletionPhaseCounts (copy), Reconciliations (ref)
		Inverted = not Inverted
		Reconciled = if Inverted then "Reconciled 10" else "Item 10"
		local ClockResult = Clock()
		local Data = {
			items = if Inverted then Items1 else Items,
			getItemKey = function(p34)
				return p34.id
			end
		}
		local Diagnostics = nil
		local v17 = nil
		local v18 = 10
		p30.ReactRoblox.act(function()
			-- upvalues: Data (copy), UniformResult (copy), p30 (copy), ItemType (copy), Diagnostics (copy), v17 (copy), Root (copy), v18 (copy)
			local config = {
				overscan = 0,
				data = Data,
				layout = UniformResult,
				axis = p30.ViewRecycler.Axis.Y,
				itemType = ItemType,
				diagnostics = Diagnostics
			}
			
			if v17 ~= nil then
				for i, value in v17 do
					config[i] = value
				end
			end
			Root:render(p30.React.createElement("Frame", {
				Name = "BenchmarkHost",
				Size = UDim2.fromOffset(400, v18 * 40)
			}, {
				List = p30.React.createElement(p30.ViewRecycler.VirtualList, config)
			}))
		end)
		observeCompletionPhases(p30, {
			reconciledContentCommitted = function()
				-- upvalues: hasItemText (upval), Folder (upval), Reconciled (upval)
				return (hasItemText(Folder, Reconciled))
			end
		}, "declarative data reconciliation", CompletionPhaseCounts)
		Reconciliations += 1
		
		return (Clock() - ClockResult) * 1000
	end, p33)
	local ScrollingFrame = Folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(ScrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local Offset = ScrollingFrame.CanvasSize.Y.Offset
	p30.ReactRoblox.act(function()
		-- upvalues: Root (copy)
		Root:unmount()
	end)
	UniformResult.destroy()
	Folder:Destroy()
	
	return p32.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "integrated",
		workload = "declarative-data-reconciliation",
		description = "Reconciles a replacement declarative item array through the retained VirtualList.",
		responsibility = ResponsibilityCatalogModule.React.DataReconciliation,
		scale = { items = 20, replacementsPerSample = 1 },
		timing = {
			unit = "ms",
			basis = "declarativeReconciliationCommit",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = { viewRecycler = RunResult },
		evidence = {
			completionBarrier = "reconciledContentCommitted",
			reconciliations = Reconciliations,
			finalCommittedText = Reconciled,
			finalContentLength = Offset,
			completionPhaseCounts = CompletionPhaseCounts
		}
	})
end

local function runDeclarativeDataReconciliation(p34, p35, p36, p37, p38)
	-- upvalues: createItemTypes (copy), Callback (ref), measureDeclarativeReconciliation (copy)
	local P117 = p37 or {}
	local ItemTypes, ItemTypes2 = createItemTypes(p34)
	assert(ItemTypes ~= ItemTypes2, "React benchmark Recyclable view types must have distinct identities")
	
	if p38 then
		Callback(p34, p35, p36, { sampleCount = 1, warmupCount = 0, bootstrapResamples = 0 })
	end
	return measureDeclarativeReconciliation(p34, p35, p36, ItemTypes, P117)
end

local function measurePropSynchronization(p34, p35, p36, ItemType, p37)
	-- upvalues: createItems (copy), observeCompletionPhases (copy), hasItemText (copy), ResponsibilityCatalogModule (copy)
	local Clock = p37.clock or os.clock
	local Folder = Instance.new("Folder")
	local Root = p34.ReactRoblox.createRoot(Folder)
	local UniformResult = p34.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local UniformResult1 = p34.ViewRecycler.Layout.uniform({ itemLength = 44 })
	local Items = createItems(20)
	local Items1 = createItems(21)
	Items1[1].text = "Replacement first"
	local SnapshotResult = p34.ViewRecycler.DataSource.snapshot(Items, function(p38)
		return p38.id
	end)
	local SnapshotResult1 = p34.ViewRecycler.DataSource.snapshot(Items1, function(p38)
		return p38.id
	end)
	local Diagnostics = nil
	local v17 = nil
	local v18 = 10
	p34.ReactRoblox.act(function()
		-- upvalues: SnapshotResult (copy), UniformResult (copy), p34 (copy), ItemType (copy), Diagnostics (copy), v17 (copy), Root (copy), v18 (copy)
		local config = {
			overscan = 0,
			data = SnapshotResult,
			layout = UniformResult,
			axis = p34.ViewRecycler.Axis.Y,
			itemType = ItemType,
			diagnostics = Diagnostics
		}
		
		if v17 ~= nil then
			for i, value in v17 do
				config[i] = value
			end
		end
		Root:render(p34.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, v18 * 40)
		}, {
			List = p34.React.createElement(p34.ViewRecycler.VirtualList, config)
		}))
	end)
	local Inverted = false
	local Replacements = 0
	local CompletionPhaseCounts = {}
	local FinalContentLength = 0
	local ReplacementFirst = ""
	local RunResult = p35.run(function()
		-- upvalues: Inverted (ref), SnapshotResult1 (copy), SnapshotResult (copy), UniformResult1 (copy), UniformResult (copy), FinalContentLength (ref), Items1 (copy), Items (copy), ReplacementFirst (ref), Clock (copy), p34 (copy), Root (copy), ItemType (copy), observeCompletionPhases (upval), hasItemText (upval), Folder (copy), CompletionPhaseCounts (copy), Replacements (ref)
		Inverted = not Inverted
		local SnapshotResult2 = if Inverted then SnapshotResult1 else SnapshotResult
		local UniformResult2 = if Inverted then UniformResult1 else UniformResult
		FinalContentLength = if Inverted then #Items1 * 44 else #Items * 40
		ReplacementFirst = if Inverted then "Replacement first" else "Item 1"
		local ClockResult = Clock()
		local Diagnostics = nil
		local v19 = nil
		local v20 = 10
		p34.ReactRoblox.act(function()
			-- upvalues: SnapshotResult2 (copy), UniformResult2 (copy), p34 (copy), ItemType (copy), Diagnostics (copy), v19 (copy), Root (copy), v20 (copy)
			local config = {
				overscan = 0,
				data = SnapshotResult2,
				layout = UniformResult2,
				axis = p34.ViewRecycler.Axis.Y,
				itemType = ItemType,
				diagnostics = Diagnostics
			}
			
			if v19 ~= nil then
				for i, value in v19 do
					config[i] = value
				end
			end
			Root:render(p34.React.createElement("Frame", {
				Name = "BenchmarkHost",
				Size = UDim2.fromOffset(400, v20 * 40)
			}, {
				List = p34.React.createElement(p34.ViewRecycler.VirtualList, config)
			}))
		end)
		observeCompletionPhases(p34, {
			dataAndLayoutPropsCommitted = function()
				-- upvalues: hasItemText (upval), Folder (upval), ReplacementFirst (upval), FinalContentLength (upval)
				local HasItemText = hasItemText(Folder, ReplacementFirst)
				
				if HasItemText then
					local ScrollingFrame = Folder:FindFirstChildWhichIsA("ScrollingFrame", true)
					assert(ScrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
					HasItemText = math.abs(ScrollingFrame.CanvasSize.Y.Offset - FinalContentLength) <= 0.01
				end
				return HasItemText
			end
		}, "data and layout prop replacement", CompletionPhaseCounts)
		Replacements += 1
		
		return (Clock() - ClockResult) * 1000
	end, p37)
	p34.ReactRoblox.act(function()
		-- upvalues: Root (copy)
		Root:unmount()
	end)
	UniformResult.destroy()
	Folder:Destroy()
	UniformResult1.destroy()
	
	return p36.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "integrated",
		workload = "data-layout-prop-replacement",
		description = "Atomically replaces VirtualList data and layout props and waits for matching host geometry.",
		responsibility = ResponsibilityCatalogModule.React.PropSynchronization,
		scale = {
			replacementsPerSample = 1,
			firstItems = #Items,
			secondItems = #Items1
		},
		timing = {
			unit = "ms",
			basis = "dataLayoutPropCommit",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = { viewRecycler = RunResult },
		evidence = {
			completionBarrier = "dataAndLayoutPropsCommitted",
			replacements = Replacements,
			finalCommittedText = ReplacementFirst,
			finalContentLength = FinalContentLength,
			completionPhaseCounts = CompletionPhaseCounts
		}
	})
end

local function measureAssignmentBinding(p38, p39, p40, p41)
	-- upvalues: createItems (copy), hasItemText (copy), captureCompletionPhase (copy), observeCompletionPhases (copy), ResponsibilityCatalogModule (copy)
	local Clock = p41.clock or os.clock
	local Count = 0
	local Count1 = 0
	local RecyclableView = p38.ViewRecycler.createRecyclableView(function(p42)
		-- upvalues: Count (ref), p38 (copy)
		Count += 1
		
		return p38.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p38.SignalsReact.useSignalBinding(function(p43)
				-- upvalues: p42 (copy)
				return p42.itemSignal(p43).text
			end)
		})
	end, { readiness = "ReadyOnAssignment" })
	local Folder = Instance.new("Folder")
	local Root = p38.ReactRoblox.createRoot(Folder)
	local UniformResult = p38.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local SequenceResult = p38.ViewRecycler.DataSource.sequence(createItems(20), function(p42)
		return p42.id
	end)
	local config = {
		_instrumentation = {
			assignmentChanged = function(_, p42)
				-- upvalues: Count1 (ref)
				if p42 ~= nil then
					Count1 += 1
				end
			end
		}
	}
	local Diagnostics = nil
	local v19 = 10
	p38.ReactRoblox.act(function()
		-- upvalues: SequenceResult (copy), UniformResult (copy), p38 (copy), RecyclableView (copy), Diagnostics (copy), config (copy), Root (copy), v19 (copy)
		local config = {
			overscan = 0,
			data = SequenceResult,
			layout = UniformResult,
			axis = p38.ViewRecycler.Axis.Y,
			itemType = RecyclableView,
			diagnostics = Diagnostics
		}
		
		if config ~= nil then
			for i, value in config do
				config[i] = value
			end
		end
		Root:render(p38.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, v19 * 40)
		}, {
			List = p38.React.createElement(p38.ViewRecycler.VirtualList, config)
		}))
	end)
	local InitialRenders: number = Count
	local ScrollingFrame = Folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(ScrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local ScrollingFrame1 = ScrollingFrame
	local Inverted = true
	local DeliveredAssignments = 0
	local CompletionPhaseCounts = {}
	local RunResult = p39.run(function()
		-- upvalues: Inverted (ref), Count1 (ref), hasItemText (upval), Folder (copy), Clock (copy), p38 (copy), ScrollingFrame1 (copy), captureCompletionPhase (upval), CompletionPhaseCounts (copy), observeCompletionPhases (upval), DeliveredAssignments (ref)
		Inverted = not Inverted
		local Y: number = if Inverted then 0 else 400
		local Item: string = if Inverted then "Item 1" else "Item 11"
		local Count = Count1
		local config = {
			bindingDelivered = function()
				-- upvalues: hasItemText (upval), Folder (upval), Item (copy)
				return (hasItemText(Folder, Item))
			end
		}
		local t = {}
		local ClockResult = Clock()
		p38.ReactRoblox.act(function()
			-- upvalues: ScrollingFrame1 (upval), Y (copy), captureCompletionPhase (upval), config (copy), t (copy), CompletionPhaseCounts (upval)
			ScrollingFrame1.CanvasPosition = Vector2.new(0, Y)
			captureCompletionPhase(config, t, CompletionPhaseCounts, "afterMutation")
		end)
		observeCompletionPhases(p38, config, `binding delivery to {Item}`, CompletionPhaseCounts, t)
		DeliveredAssignments = Count1 - Count
		
		return (Clock() - ClockResult) * 1000
	end, p41)
	local FinalRenders: number = Count
	p38.ReactRoblox.act(function()
		-- upvalues: Root (copy)
		Root:unmount()
	end)
	UniformResult.destroy()
	Folder:Destroy()
	
	return p40.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "item-binding-delivery",
		description = "Delivers recycled item assignments through SignalsReact.useSignalBinding without rerendering physical rows.",
		responsibility = ResponsibilityCatalogModule.React.AssignmentBinding,
		scale = { items = 20, visibleRows = 10, assignmentsPerSample = 10 },
		timing = {
			unit = "ms",
			basis = "bindingAssignmentDelivery",
			operationsPerSample = 10,
			includesSchedulerWaits = true
		},
		arms = { immediate = RunResult },
		evidence = {
			completionBarrier = "bindingDelivered",
			initialRenders = InitialRenders,
			finalRenders = FinalRenders,
			rerendersDuringDelivery = FinalRenders - InitialRenders,
			deliveredAssignments = DeliveredAssignments,
			completionPhaseCounts = CompletionPhaseCounts
		}
	}), (p40.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "signal-item-publication",
		description = "Publishes recycled item values from the assignment signal into the bound host property.",
		responsibility = ResponsibilityCatalogModule.React.SignalsPublication,
		scale = { items = 20, visibleRows = 10, publicationsPerSample = 10 },
		timing = {
			unit = "ms",
			basis = "signalBindingPublication",
			operationsPerSample = 10,
			includesSchedulerWaits = true
		},
		arms = { immediate = RunResult },
		evidence = {
			completionBarrier = "bindingDelivered",
			publishedAssignments = DeliveredAssignments,
			rerendersDuringPublication = FinalRenders - InitialRenders,
			completionPhaseCounts = CompletionPhaseCounts
		}
	}))
end

local function createPresentationArm(p42, Readiness, HideWhilePending, Callback)
	-- upvalues: createItems (copy), hasItemText (copy), captureCompletionPhase (copy), observeCompletionPhases (copy)
	local RecyclableView = p42.ViewRecycler.createRecyclableView(if Readiness == "ReadyOnAssignment" then function(p43)
		-- upvalues: p42 (copy)
		return p42.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p42.SignalsReact.useSignalBinding(function(p44)
				-- upvalues: p43 (copy)
				return p43.itemSignal(p44).text
			end)
		})
	end else function(p43)
		-- upvalues: p42 (copy)
		return p42.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p42.SignalsReact.useSignalState(p43.itemSignal).text
		})
	end, {
		readiness = Readiness,
		hideWhilePending = HideWhilePending
	})
	local Folder = Instance.new("Folder")
	local Root = p42.ReactRoblox.createRoot(Folder)
	local UniformResult = p42.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local SequenceResult = p42.ViewRecycler.DataSource.sequence(createItems(20), function(p43)
		return p43.id
	end)
	local Diagnostics = nil
	local v20 = nil
	local v21 = 10
	p42.ReactRoblox.act(function()
		-- upvalues: SequenceResult (copy), UniformResult (copy), p42 (copy), RecyclableView (copy), Diagnostics (copy), v20 (copy), Root (copy), v21 (copy)
		local config = {
			overscan = 0,
			data = SequenceResult,
			layout = UniformResult,
			axis = p42.ViewRecycler.Axis.Y,
			itemType = RecyclableView,
			diagnostics = Diagnostics
		}
		
		if v20 ~= nil then
			for i, value in v20 do
				config[i] = value
			end
		end
		Root:render(p42.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, v21 * 40)
		}, {
			List = p42.React.createElement(p42.ViewRecycler.VirtualList, config)
		}))
	end)
	local ScrollingFrame = Folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(ScrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local ScrollingFrame1 = ScrollingFrame
	local Inverted = true
	local CompletionPhaseCounts = {}
	
	return {
		run = function()
			-- upvalues: Inverted (ref), hasItemText (upval), Folder (copy), Callback (copy), p42 (copy), ScrollingFrame1 (copy), captureCompletionPhase (upval), CompletionPhaseCounts (copy), observeCompletionPhases (upval)
			Inverted = not Inverted
			local Y: number = if Inverted then 0 else 400
			local Item: string = if Inverted then "Item 1" else "Item 11"
			local config = {
				presentationCommitted = function()
					-- upvalues: hasItemText (upval), Folder (upval), Item (copy)
					return (hasItemText(Folder, Item))
				end
			}
			local t = {}
			local CallbackResult = Callback()
			p42.ReactRoblox.act(function()
				-- upvalues: ScrollingFrame1 (upval), Y (copy), captureCompletionPhase (upval), config (copy), t (copy), CompletionPhaseCounts (upval)
				ScrollingFrame1.CanvasPosition = Vector2.new(0, Y)
				captureCompletionPhase(config, t, CompletionPhaseCounts, "afterMutation")
			end)
			observeCompletionPhases(p42, config, `presentation commit to {Item}`, CompletionPhaseCounts, t)
			
			return (Callback() - CallbackResult) * 1000
		end,
		getEvidence = function()
			-- upvalues: Readiness (copy), HideWhilePending (copy), CompletionPhaseCounts (copy)
			return {
				presentations = 1,
				readiness = Readiness,
				hideWhilePending = HideWhilePending,
				completionPhaseCounts = CompletionPhaseCounts
			}
		end,
		destroy = function()
			-- upvalues: p42 (copy), Root (copy), UniformResult (copy), Folder (copy)
			p42.ReactRoblox.act(function()
				-- upvalues: Root (copy)
				Root:unmount()
			end)
			UniformResult.destroy()
			Folder:Destroy()
		end
	}
end

local function measurePresentationCommit(p43, p44, p45, p46)
	-- upvalues: createPresentationArm (copy), ResponsibilityCatalogModule (copy)
	local Clock = p46.clock or os.clock
	local ReadyOnCommit = createPresentationArm(p43, "ReadyOnCommit", false, Clock)
	local ReadyOnCommit1 = createPresentationArm(p43, "ReadyOnCommit", true, Clock)
	local ReadyOnAssignment = createPresentationArm(p43, "ReadyOnAssignment", false, Clock)
	local RunResult = p44.run(ReadyOnCommit.run, p46)
	local RunResult1 = p44.run(ReadyOnCommit1.run, p46)
	local RunResult2 = p44.run(ReadyOnAssignment.run, p46)
	local Evidence = {
		completionBarrier = "presentationCommitted",
		readyOnCommitVisible = ReadyOnCommit.getEvidence(),
		readyOnCommitHidden = ReadyOnCommit1.getEvidence(),
		readyOnAssignment = ReadyOnAssignment.getEvidence()
	}
	ReadyOnCommit.destroy()
	ReadyOnCommit1.destroy()
	ReadyOnAssignment.destroy()
	
	return p45.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "recyclable-view-readiness",
		description = "Measures assignment-to-presented-content latency for every readiness and pending policy.",
		responsibility = ResponsibilityCatalogModule.React.Presentation,
		scale = { items = 20, visibleRows = 10, scrollsPerSample = 1 },
		timing = {
			unit = "ms",
			basis = "presentationCommit",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = {
			readyOnCommitVisible = RunResult,
			readyOnCommitHidden = RunResult1,
			readyOnAssignment = RunResult2
		},
		evidence = Evidence
	})
end

local function measureVirtualListTeardown(p43, p44, p45, p46)
	-- upvalues: createItems (copy), observeCompletionPhases (copy), hasItemText (copy), ResponsibilityCatalogModule (copy)
	local Clock = p46.clock or os.clock
	local Evidence = {}
	
	return p45.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "virtual-list-teardown",
		description = "Unmounts a complete VirtualList and destroys its layout and host container.",
		responsibility = ResponsibilityCatalogModule.React.Teardown,
		scale = { items = 20, visibleRows = 10 },
		timing = {
			unit = "ms",
			basis = "fullVirtualListTeardown",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = {
			viewRecycler = p44.run(function()
				-- upvalues: p43 (copy), createItems (upval), observeCompletionPhases (upval), hasItemText (upval), Clock (copy), Evidence (ref)
				local MountedRows = 0
				local UnmountedRows = 0
				local RecyclableView = p43.ViewRecycler.createRecyclableView(function(p47)
					-- upvalues: p43 (upval), MountedRows (ref), UnmountedRows (ref)
					local UseSignalStateResult = p43.SignalsReact.useSignalState(p47.itemSignal)
					p43.React.useEffect(function()
						-- upvalues: MountedRows (upval), UnmountedRows (upval)
						MountedRows += 1
						
						return function()
							-- upvalues: UnmountedRows (upval)
							UnmountedRows += 1
						end
					end, {})
					
					return p43.React.createElement("TextLabel", {
						Name = "Content",
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						Text = UseSignalStateResult.text
					})
				end, { readiness = "ReadyOnCommit", hideWhilePending = true })
				local Folder = Instance.new("Folder")
				local Root = p43.ReactRoblox.createRoot(Folder)
				local UniformResult = p43.ViewRecycler.Layout.uniform({ itemLength = 40 })
				local SnapshotResult = p43.ViewRecycler.DataSource.snapshot(createItems(20), function(p47)
					return p47.id
				end)
				local Diagnostics = nil
				local v22 = nil
				local v23 = 10
				p43.ReactRoblox.act(function()
					-- upvalues: SnapshotResult (copy), UniformResult (copy), p43 (copy), RecyclableView (copy), Diagnostics (copy), v22 (copy), Root (copy), v23 (copy)
					local config = {
						overscan = 0,
						data = SnapshotResult,
						layout = UniformResult,
						axis = p43.ViewRecycler.Axis.Y,
						itemType = RecyclableView,
						diagnostics = Diagnostics
					}
					
					if v22 ~= nil then
						for i, value in v22 do
							config[i] = value
						end
					end
					Root:render(p43.React.createElement("Frame", {
						Name = "BenchmarkHost",
						Size = UDim2.fromOffset(400, v23 * 40)
					}, {
						List = p43.React.createElement(p43.ViewRecycler.VirtualList, config)
					}))
				end)
				observeCompletionPhases(p43, {
					mounted = function()
						-- upvalues: MountedRows (ref), hasItemText (upval), Folder (copy)
						return MountedRows > 0 and hasItemText(Folder, "Item 10")
					end
				}, "VirtualList teardown setup", {})
				local ClockResult = Clock()
				p43.ReactRoblox.act(function()
					-- upvalues: Root (copy)
					Root:unmount()
				end)
				UniformResult.destroy()
				local Count = #Folder:GetDescendants()
				Folder:Destroy()
				local ScaledClockResult = (Clock() - ClockResult) * 1000
				assert(UnmountedRows == MountedRows, "VirtualList teardown did not unmount every physical row")
				assert(Count == 0, "VirtualList teardown retained host descendants")
				Evidence = {
					completionBarrier = "allRowsUnmountedAndHostsRemoved",
					mountedRows = MountedRows,
					unmountedRows = UnmountedRows,
					descendantsAfterUnmount = Count,
					completionPhaseCounts = { allRowsUnmountedAndHostsRemoved = { afterAct = 1 } }
				}
				
				return ScaledClockResult
			end, p46)
		},
		evidence = Evidence
	})
end

local function createRecyclingTransferArm(p47, Readiness, Callback)
	-- upvalues: findMeasuredObjects (copy), hasItemText (copy), captureCompletionPhase (copy), observeCompletionPhases (copy)
	local React = p47.React
	local SignalsReact = p47.SignalsReact
	local ViewRecycler = p47.ViewRecycler
	local Count = 0
	local Count1 = 0
	
	local function StatefulStructuralRow(p48)
		-- upvalues: p47 (copy), React (copy), Count (ref), Count1 (ref)
		local UseSignalStateResult = p47.SignalsReact.useSignalState(p48.itemSignal)
		local StatePreserved = React.useState("state-preserved")
		React.useEffect(function()
			-- upvalues: Count (upval), Count1 (upval)
			Count += 1
			
			return function()
				-- upvalues: Count1 (upval)
				Count1 += 1
			end
		end, {})
		
		return React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = `{UseSignalStateResult.text}:{StatePreserved}`
		})
	end
	
	local function StatefulBindingRow(p48)
		-- upvalues: React (copy), Count (ref), Count1 (ref), SignalsReact (copy)
		local StatePreserved = React.useState("state-preserved")
		React.useEffect(function()
			-- upvalues: Count (upval), Count1 (upval)
			Count += 1
			
			return function()
				-- upvalues: Count1 (upval)
				Count1 += 1
			end
		end, {})
		
		return React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = SignalsReact.useSignalBinding(function(p49): string
				-- upvalues: p48 (copy), StatePreserved (copy)
				return `{p48.itemSignal(p49).text}:{StatePreserved}`
			end)
		})
	end
	
	local RecyclableView = ViewRecycler.createRecyclableView(if Readiness == "ReadyOnAssignment" then StatefulBindingRow else StatefulStructuralRow, {
		readiness = Readiness,
		hideWhilePending = Readiness == "ReadyOnCommit"
	})
	local SequenceResult = ViewRecycler.DataSource.sequence({ { id = "first", text = "First", height = 40 } }, function(p48)
		return p48.id
	end)
	local SequenceResult1 = ViewRecycler.DataSource.sequence({ { id = "second", text = "Second", height = 40 } }, function(p48)
		return p48.id
	end)
	local UniformResult = ViewRecycler.Layout.uniform({ itemLength = 40 })
	local UniformResult1 = ViewRecycler.Layout.uniform({ itemLength = 40 })
	local ScrollingFrameRef = { current = nil }
	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.fromOffset(400, 40)
	local Root = p47.ReactRoblox.createRoot(Frame)
	local ViewRecycler1 = p47.ViewRecycler
	local Flag = false
	local First = ""
	local v22 = nil
	local v23 = nil
	local Activations = 0
	local Deactivations = 0
	
	local function assignmentChanged(_, p48)
		-- upvalues: Flag (ref), Deactivations (ref), Activations (ref), First (ref), v22 (ref), Callback (copy)
		if Flag then
			if p48 == nil then
				Deactivations += 1
				
				return
			end
			Activations += 1
			
			if p48.key == First and v22 == nil then
				v22 = Callback()
			end
		end
	end
	
	local function presentationChanged(_, p48)
		-- upvalues: Flag (ref), First (ref), v23 (ref), Callback (copy)
		if Flag and p48 ~= nil and p48.key == First and v23 == nil then
			v23 = Callback()
		end
	end
	
	p47.ReactRoblox.act(function()
		-- upvalues: Root (copy), React (copy), ViewRecycler1 (copy), ScrollingFrameRef (copy), SequenceResult (copy), UniformResult (copy), RecyclableView (copy), assignmentChanged (copy), presentationChanged (copy), SequenceResult1 (copy), UniformResult1 (copy)
		Root:render(React.createElement(ViewRecycler1.RecyclingViewport, {
			axis = ViewRecycler1.Axis.Y,
			scrollingFrameRef = ScrollingFrameRef,
			scrollingFrameProps = { Name = "Viewport", CanvasSize = UDim2.fromOffset(0, 80) }
		}, {
			FirstRoot = React.createElement("Frame", {
				Name = "FirstRoot",
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, 0),
				Size = UDim2.fromOffset(400, 40)
			}, {
				List = React.createElement(ViewRecycler1.VirtualList, {
					overscan = 0,
					data = SequenceResult,
					layout = UniformResult,
					axis = ViewRecycler1.Axis.Y,
					itemType = RecyclableView,
					_instrumentation = {
						assignmentChanged = assignmentChanged,
						presentationChanged = presentationChanged
					},
					scrollingFrameProps = { Name = "FirstList" }
				})
			}),
			SecondRoot = React.createElement("Frame", {
				Name = "SecondRoot",
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, 40),
				Size = UDim2.fromOffset(200, 40)
			}, {
				List = React.createElement(ViewRecycler1.VirtualList, {
					overscan = 0,
					data = SequenceResult1,
					layout = UniformResult1,
					axis = ViewRecycler1.Axis.Y,
					itemType = RecyclableView,
					_instrumentation = {
						assignmentChanged = assignmentChanged,
						presentationChanged = presentationChanged
					},
					scrollingFrameProps = { Name = "SecondList" }
				})
			})
		}))
	end)
	local Frame1 = assert(findMeasuredObjects(Frame, "First:state-preserved"))
	local ListItemViewFrame1 = Frame1:FindFirstAncestor("ListItemViewFrame1")
	local v24 = assert(Frame:FindFirstChild("FirstRoot", true))
	local v25 = assert(Frame:FindFirstChild("SecondRoot", true))
	local Inverted = true
	local CompletionPhaseCounts = {}
	local Transfers = 0
	local Milestones = {}
	
	return {
		run = function()
			-- upvalues: Inverted (ref), v24 (copy), v25 (copy), First (ref), v22 (ref), v23 (ref), Flag (ref), hasItemText (upval), Frame (copy), findMeasuredObjects (upval), Callback (copy), Frame1 (copy), ListItemViewFrame1 (copy), p47 (copy), ScrollingFrameRef (copy), captureCompletionPhase (upval), CompletionPhaseCounts (copy), observeCompletionPhases (upval), Transfers (ref), Milestones (ref)
			Inverted = not Inverted
			local FirstStatePreserved: string = if Inverted then "First:state-preserved" else "Second:state-preserved"
			local Ancestor = if Inverted then v24 else v25
			local Y: number = if Inverted then 0 else 40
			local v26: number = if Inverted then 400 else 200
			First = if Inverted then "first" else "second"
			v22 = nil
			v23 = nil
			Flag = true
			local v27 = nil
			local v28 = nil
			local config = {
				assignmentDelivered = function(): boolean
					-- upvalues: v22 (upval)
					return v22 ~= nil
				end,
				commitCompleted = function()
					-- upvalues: v23 (upval), hasItemText (upval), Frame (upval), FirstStatePreserved (copy)
					return v23 ~= nil and hasItemText(Frame, FirstStatePreserved)
				end,
				layoutSettled = function(): boolean
					-- upvalues: findMeasuredObjects (upval), Frame (upval), FirstStatePreserved (copy), v26 (copy), v27 (ref), Callback (upval)
					local MeasuredObjects = findMeasuredObjects(Frame, FirstStatePreserved)
					local IsMagnitudeBelow: boolean = MeasuredObjects ~= nil and math.abs(MeasuredObjects.AbsoluteSize.X - v26) <= 0.01
					
					if IsMagnitudeBelow and v27 == nil then
						v27 = Callback()
					end
					return IsMagnitudeBelow
				end,
				hostObserved = function(): boolean
					-- upvalues: findMeasuredObjects (upval), Frame (upval), FirstStatePreserved (copy), Frame1 (upval), Ancestor (copy), ListItemViewFrame1 (upval), v28 (ref), Callback (upval)
					local MeasuredObjects = findMeasuredObjects(Frame, FirstStatePreserved)
					local IsListItemViewFrameMatch: boolean = MeasuredObjects ~= nil and (MeasuredObjects == Frame1 and (MeasuredObjects:IsDescendantOf(Ancestor) and MeasuredObjects:FindFirstAncestor("ListItemViewFrame1") == ListItemViewFrame1))
					
					if IsListItemViewFrameMatch and v28 == nil then
						v28 = Callback()
					end
					return IsListItemViewFrameMatch
				end,
				destinationPresented = function(): boolean
					-- upvalues: findMeasuredObjects (upval), Frame (upval), FirstStatePreserved (copy), Frame1 (upval), Ancestor (copy), ListItemViewFrame1 (upval), v26 (copy)
					local MeasuredObjects = findMeasuredObjects(Frame, FirstStatePreserved)
					
					return MeasuredObjects ~= nil and (MeasuredObjects == Frame1 and (MeasuredObjects:IsDescendantOf(Ancestor) and (MeasuredObjects:FindFirstAncestor("ListItemViewFrame1") == ListItemViewFrame1 and math.abs(MeasuredObjects.AbsoluteSize.X - v26) <= 0.01)))
				end
			}
			local t = {}
			local CallbackResult = Callback()
			p47.ReactRoblox.act(function()
				-- upvalues: ScrollingFrameRef (upval), Y (copy), captureCompletionPhase (upval), config (copy), t (copy), CompletionPhaseCounts (upval)
				ScrollingFrameRef.current.CanvasPosition = Vector2.new(0, Y)
				captureCompletionPhase(config, t, CompletionPhaseCounts, "afterMutation")
			end)
			observeCompletionPhases(p47, config, `recycling transfer to {FirstStatePreserved}`, CompletionPhaseCounts, t)
			Transfers += 1
			Milestones = {
				assignmentMs = (assert(v22, "fixed-size transfer assignment was not delivered") - CallbackResult) * 1000,
				commitMs = (assert(v23, "fixed-size transfer presentation was not committed") - CallbackResult) * 1000,
				layoutMs = (assert(v27, "fixed-size transfer layout did not settle") - CallbackResult) * 1000,
				hostMs = (assert(v28, "fixed-size transfer host was not observed") - CallbackResult) * 1000
			}
			
			return (Callback() - CallbackResult) * 1000
		end,
		getEvidence = function()
			-- upvalues: Count (ref), Count1 (ref), Transfers (ref), findMeasuredObjects (upval), Frame (copy), Inverted (ref), Frame1 (copy), Activations (ref), Deactivations (ref), Milestones (ref), CompletionPhaseCounts (copy)
			return {
				firstListWidth = 400,
				secondListWidth = 200,
				mounts = Count,
				unmounts = Count1,
				transfers = Transfers,
				sameContentInstance = findMeasuredObjects(Frame, if Inverted then "First:state-preserved" else "Second:state-preserved") == Frame1,
				activations = Activations,
				deactivations = Deactivations,
				milestones = Milestones,
				completionPhaseCounts = CompletionPhaseCounts
			}
		end,
		destroy = function()
			-- upvalues: p47 (copy), Root (copy), UniformResult (copy), UniformResult1 (copy), Frame (copy)
			p47.ReactRoblox.act(function()
				-- upvalues: Root (upval)
				Root:unmount()
			end)
			UniformResult.destroy()
			UniformResult1.destroy()
			Frame:Destroy()
		end
	}
end

local function createWrappedRecyclingTransferArm(p47, Readiness, Callback)
	-- upvalues: waitForHeartbeatToSettle (copy), findMeasuredObjects (copy), hasItemText (copy), captureCompletionPhase (copy), observeCompletionPhases (copy)
	local React = p47.React
	local ViewRecycler = p47.ViewRecycler
	local Mounts = 0
	local Unmounts = 0
	local NewAccepted = 0
	local v22 = nil
	local v23 = nil
	local v24 = nil
	local v25 = nil
	local v26 = nil
	local RecyclableView = ViewRecycler.createRecyclableView(function(p48)
		-- upvalues: p47 (copy), React (copy), Mounts (ref), Unmounts (ref)
		local UseSignalStateResult = p47.SignalsReact.useSignalState(p48.itemSignal)
		local StatePreserved = React.useState("state-preserved")
		React.useEffect(function()
			-- upvalues: Mounts (upval), Unmounts (upval)
			Mounts += 1
			
			return function()
				-- upvalues: Unmounts (upval)
				Unmounts += 1
			end
		end, {})
		
		return React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -20, 0, 0),
			Text = `{UseSignalStateResult.text}:{StatePreserved}`
		})
	end, {
		readiness = Readiness,
		hideWhilePending = Readiness == "ReadyOnCommit"
	})
	local Repeated = string.rep("First wrapped transfer content ", 8)
	local Repeated1 = string.rep("Second wrapped transfer content ", 8)
	local SequenceResult = ViewRecycler.DataSource.sequence({ { id = "first-wrapped", height = 40, text = Repeated } }, function(p48)
		return p48.id
	end)
	local SequenceResult1 = ViewRecycler.DataSource.sequence({ { id = "second-wrapped", height = 40, text = Repeated1 } }, function(p48)
		return p48.id
	end)
	local MeasuredResult = ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local MeasuredResult1 = ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local ScrollingFrameRef = { current = nil }
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Parent = game:GetService("CoreGui")
	local Root = p47.ReactRoblox.createRoot(ScreenGui)
	local Flag = false
	local FirstWrapped = ""
	
	local function assignmentChanged(_, p48)
		-- upvalues: Flag (ref), FirstWrapped (ref), v22 (ref), Callback (copy)
		if Flag and p48 ~= nil and p48.key == FirstWrapped and v22 == nil then
			v22 = Callback()
		end
	end
	
	local function presentationChanged(_, p48)
		-- upvalues: Flag (ref), FirstWrapped (ref), v23 (ref), Callback (copy)
		if Flag and p48 ~= nil and p48.key == FirstWrapped and v23 == nil then
			v23 = Callback()
		end
	end
	
	local function diagnostics(p48)
		-- upvalues: Flag (ref), v25 (ref), NewAccepted (ref), Callback (copy)
		if Flag and p48.kind == "measurementsProcessed" and p48.accepted > 0 and v25 == nil then
			NewAccepted += p48.accepted
			v25 = Callback()
		end
	end
	
	p47.ReactRoblox.act(function()
		-- upvalues: Root (copy), React (copy), ViewRecycler (copy), ScrollingFrameRef (copy), SequenceResult (copy), MeasuredResult (copy), RecyclableView (copy), diagnostics (copy), assignmentChanged (copy), presentationChanged (copy), SequenceResult1 (copy), MeasuredResult1 (copy)
		Root:render(React.createElement("Frame", { Name = "TransferHost", Size = UDim2.fromOffset(400, 40) }, {
			Viewport = React.createElement(ViewRecycler.RecyclingViewport, {
				axis = ViewRecycler.Axis.Y,
				scrollingFrameRef = ScrollingFrameRef,
				scrollingFrameProps = { Name = "Viewport", CanvasSize = UDim2.fromOffset(0, 80) }
			}, {
				FirstRoot = React.createElement("Frame", {
					Name = "FirstRoot",
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(0, 0),
					Size = UDim2.fromOffset(400, 40)
				}, {
					List = React.createElement(ViewRecycler.VirtualList, {
						overscan = 0,
						data = SequenceResult,
						layout = MeasuredResult,
						axis = ViewRecycler.Axis.Y,
						itemType = RecyclableView,
						diagnostics = diagnostics,
						_instrumentation = {
							assignmentChanged = assignmentChanged,
							presentationChanged = presentationChanged
						},
						scrollingFrameProps = { Name = "FirstList" }
					})
				}),
				SecondRoot = React.createElement("Frame", {
					Name = "SecondRoot",
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(0, 40),
					Size = UDim2.fromOffset(200, 40)
				}, {
					List = React.createElement(ViewRecycler.VirtualList, {
						overscan = 0,
						data = SequenceResult1,
						layout = MeasuredResult1,
						axis = ViewRecycler.Axis.Y,
						itemType = RecyclableView,
						diagnostics = diagnostics,
						_instrumentation = {
							assignmentChanged = assignmentChanged,
							presentationChanged = presentationChanged
						},
						scrollingFrameProps = { Name = "SecondList" }
					})
				})
			})
		}))
	end)
	waitForHeartbeatToSettle(p47)
	waitForHeartbeatToSettle(p47)
	local Object = assert(findMeasuredObjects(ScreenGui, `{Repeated}:state-preserved`))
	local ListItemViewFrame1 = Object:FindFirstAncestor("ListItemViewFrame1")
	local v27 = assert(ScreenGui:FindFirstChild("FirstRoot", true))
	local v28 = assert(ScreenGui:FindFirstChild("SecondRoot", true))
	local Inverted = true
	local CompletionPhaseCounts = {}
	local Transfers = 0
	local Milestones = {}
	
	return {
		run = function()
			-- upvalues: Inverted (ref), Repeated (copy), Repeated1 (copy), FirstWrapped (ref), v27 (copy), v28 (copy), MeasuredResult (copy), MeasuredResult1 (copy), v22 (ref), v23 (ref), v24 (ref), v25 (ref), v26 (ref), Callback (copy), Flag (ref), hasItemText (upval), ScreenGui (copy), findMeasuredObjects (upval), Object (copy), ListItemViewFrame1 (copy), p47 (copy), ScrollingFrameRef (copy), captureCompletionPhase (upval), CompletionPhaseCounts (copy), observeCompletionPhases (upval), Milestones (ref), Transfers (ref)
			Inverted = not Inverted
			local PreservedName: string = `{if Inverted then Repeated else Repeated1}:state-preserved`
			FirstWrapped = if Inverted then "first-wrapped" else "second-wrapped"
			local Ancestor = if Inverted then v27 else v28
			local Y: number = if Inverted then 0 else 40
			local v29: number = if Inverted then 400 else 200
			local MeasuredResult2 = if Inverted then MeasuredResult else MeasuredResult1
			v22 = nil
			v23 = nil
			v24 = nil
			v25 = nil
			v26 = nil
			local CallbackResult = Callback()
			Flag = true
			local config = {
				assignmentDelivered = function(): boolean
					-- upvalues: v22 (upval)
					return v22 ~= nil
				end,
				commitCompleted = function()
					-- upvalues: v23 (upval), hasItemText (upval), ScreenGui (upval), PreservedName (copy)
					return v23 ~= nil and hasItemText(ScreenGui, PreservedName)
				end,
				layoutSettled = function(): boolean
					-- upvalues: findMeasuredObjects (upval), ScreenGui (upval), PreservedName (copy), v29 (copy), v24 (upval), Callback (upval)
					local MeasuredObjects, MeasuredObjects2 = findMeasuredObjects(ScreenGui, PreservedName)
					local IsYAbove: boolean = MeasuredObjects ~= nil and (MeasuredObjects2 ~= nil and (MeasuredObjects.AbsoluteSize.X == v29 - 20 and (MeasuredObjects.AbsoluteSize.Y > 0 and MeasuredObjects2.AbsoluteSize.Y > 0)))
					
					if IsYAbove and v24 == nil then
						v24 = Callback()
					end
					return IsYAbove
				end,
				measurementSettled = function(): boolean
					-- upvalues: findMeasuredObjects (upval), ScreenGui (upval), PreservedName (copy), MeasuredResult2 (copy), v25 (upval), Callback (upval)
					local MeasuredObjects, MeasuredObjects2 = findMeasuredObjects(ScreenGui, PreservedName)
					local IsMagnitudeBelow: boolean = MeasuredObjects ~= nil and (MeasuredObjects2 ~= nil and math.abs(MeasuredResult2.getItemLayout(1).length - MeasuredObjects2.AbsoluteSize.Y) <= 0.01)
					
					if IsMagnitudeBelow and v25 == nil then
						v25 = Callback()
					end
					return IsMagnitudeBelow
				end,
				hostObserved = function(): boolean
					-- upvalues: findMeasuredObjects (upval), ScreenGui (upval), PreservedName (copy), Object (upval), Ancestor (copy), ListItemViewFrame1 (upval), v26 (upval), Callback (upval)
					local MeasuredObjects = findMeasuredObjects(ScreenGui, PreservedName)
					local IsListItemViewFrameMatch: boolean = MeasuredObjects ~= nil and (MeasuredObjects == Object and (MeasuredObjects:IsDescendantOf(Ancestor) and MeasuredObjects:FindFirstAncestor("ListItemViewFrame1") == ListItemViewFrame1))
					
					if IsListItemViewFrameMatch and v26 == nil then
						v26 = Callback()
					end
					return IsListItemViewFrameMatch
				end
			}
			local t = {}
			p47.ReactRoblox.act(function()
				-- upvalues: ScrollingFrameRef (upval), Y (copy), captureCompletionPhase (upval), config (copy), t (copy), CompletionPhaseCounts (upval)
				ScrollingFrameRef.current.CanvasPosition = Vector2.new(0, Y)
				captureCompletionPhase(config, t, CompletionPhaseCounts, "afterMutation")
			end)
			observeCompletionPhases(p47, config, function(): string
				-- upvalues: findMeasuredObjects (upval), ScreenGui (upval), PreservedName (copy), FirstWrapped (upval), v22 (upval), v23 (upval), v24 (upval), v25 (upval), v26 (upval), v29 (copy)
				local MeasuredObjects, MeasuredObjects2 = findMeasuredObjects(ScreenGui, PreservedName)
				
				return `wrapped recycling transfer to {FirstWrapped}; assignment={v22 ~= nil}, commit={v23 ~= nil}, content={MeasuredObjects ~= nil}, layout={v24 ~= nil}, measurement={v25 ~= nil}, host={v26 ~= nil}, contentWidth={if MeasuredObjects == nil then "nil" else MeasuredObjects.AbsoluteSize.X}, expectedWidth={v29 - 20}, hostHeight={if MeasuredObjects2 == nil then "nil" else MeasuredObjects2.AbsoluteSize.Y}`
			end, CompletionPhaseCounts, t)
			Milestones = {
				assignmentMs = (assert(v22, "wrapped transfer assignment was not delivered") - CallbackResult) * 1000,
				commitMs = (assert(v23, "wrapped transfer presentation was not committed") - CallbackResult) * 1000,
				layoutMs = (assert(v24, "wrapped transfer layout did not settle") - CallbackResult) * 1000,
				measurementMs = (assert(v25, "wrapped transfer measurement was not settled") - CallbackResult) * 1000,
				hostMs = (assert(v26, "wrapped transfer host was not observed") - CallbackResult) * 1000
			}
			Transfers += 1
			
			return (Callback() - CallbackResult) * 1000
		end,
		getEvidence = function()
			-- upvalues: Mounts (ref), Unmounts (ref), Transfers (ref), findMeasuredObjects (upval), ScreenGui (copy), Inverted (ref), Repeated (copy), Repeated1 (copy), Object (copy), NewAccepted (ref), Milestones (ref), CompletionPhaseCounts (copy)
			return {
				mounts = Mounts,
				unmounts = Unmounts,
				transfers = Transfers,
				sameContentInstance = findMeasuredObjects(ScreenGui, `{if Inverted then Repeated else Repeated1}:state-preserved`) == Object,
				acceptedMeasurements = NewAccepted,
				milestones = Milestones,
				completionPhaseCounts = CompletionPhaseCounts
			}
		end,
		destroy = function()
			-- upvalues: p47 (copy), Root (copy), MeasuredResult (copy), MeasuredResult1 (copy), ScreenGui (copy)
			p47.ReactRoblox.act(function()
				-- upvalues: Root (upval)
				Root:unmount()
			end)
			MeasuredResult.destroy()
			MeasuredResult1.destroy()
			ScreenGui:Destroy()
		end
	}
end

Callback = function(p48, p49, p50, p51)
	-- upvalues: createRecyclingTransferArm (copy), createWrappedRecyclingTransferArm (copy), ResponsibilityCatalogModule (copy)
	local Clock = p51.clock or os.clock
	local ReadyOnCommit = createRecyclingTransferArm(p48, "ReadyOnCommit", Clock)
	local ReadyOnAssignment = createRecyclingTransferArm(p48, "ReadyOnAssignment", Clock)
	local ReadyOnCommit1 = createWrappedRecyclingTransferArm(p48, "ReadyOnCommit", Clock)
	local ReadyOnAssignment1 = createWrappedRecyclingTransferArm(p48, "ReadyOnAssignment", Clock)
	local RunResult = p49.run(ReadyOnCommit.run, p51)
	local RunResult1 = p49.run(ReadyOnAssignment.run, p51)
	local RunResult2 = p49.run(ReadyOnCommit1.run, p51)
	local RunResult3 = p49.run(ReadyOnAssignment1.run, p51)
	local Evidence = {
		fixedSizeMeasurementMilestone = "notRequiredUniformLayout",
		untilCommit = ReadyOnCommit.getEvidence(),
		immediate = ReadyOnAssignment.getEvidence()
	}
	local Evidence1 = {
		wrappedUntilCommit = ReadyOnCommit1.getEvidence(),
		wrappedImmediate = ReadyOnAssignment1.getEvidence()
	}
	ReadyOnCommit.destroy()
	ReadyOnAssignment.destroy()
	ReadyOnCommit1.destroy()
	ReadyOnAssignment1.destroy()
	
	return p50.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "phased",
		workload = "completed-recycling-transfer",
		description = "Transfers one stateful physical host between different-width lists and observes presentation and derived bounds without remounting.",
		responsibility = ResponsibilityCatalogModule.React.StatefulTransfer,
		scale = {
			itemsPerList = 1,
			physicalHosts = 1,
			reparentsPerSample = 1
		},
		timing = {
			unit = "ms",
			basis = "completedCrossListTransfer",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = { untilCommit = RunResult, immediate = RunResult1 },
		evidence = Evidence
	}), p50.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "phased",
		workload = "completed-automatic-size-recycling-transfer",
		description = "Transfers one wrapped AutomaticSize physical host across different-width measured lists.",
		responsibility = ResponsibilityCatalogModule.React.AutomaticSizeTransfer,
		scale = {
			itemsPerList = 1,
			physicalHosts = 1,
			reparentsPerSample = 1
		},
		timing = {
			unit = "ms",
			basis = "completedAutomaticSizeCrossListTransfer",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = {
			wrappedUntilCommit = RunResult2,
			wrappedImmediate = RunResult3
		},
		evidence = Evidence1
	}), (p50.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "phased",
		workload = "viewport-active-gating",
		description = "Deactivates the leaving child list and activates the entering child list in one viewport transfer.",
		responsibility = ResponsibilityCatalogModule.React.ViewportActiveGating,
		scale = {
			childLists = 2,
			physicalHosts = 1,
			transitionsPerSample = 1
		},
		timing = {
			unit = "ms",
			basis = "completedViewportActiveTransition",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = { untilCommit = RunResult, immediate = RunResult1 },
		evidence = Evidence
	}))
end

local function measureRecyclingScopeHighWater(p48, p49, p50, Items, p51)
	-- upvalues: ResponsibilityCatalogModule (copy)
	local Clock = p51.clock or os.clock
	local Evidence = {}
	
	return p50.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "isolated",
		workload = "recycling-scope-high-water-lifecycle",
		description = "Creates one React RecyclingScope high-water batch and publishes only surviving hosts.",
		responsibility = ResponsibilityCatalogModule.React.ScopeOwnership,
		scale = { items = Items },
		timing = {
			unit = "ms",
			basis = "recyclingScopeHighWaterBatch",
			includesSchedulerWaits = false,
			operationsPerSample = Items
		},
		arms = {
			viewRecycler = p49.run(function()
				-- upvalues: p48 (copy), Items (copy), Clock (copy), Evidence (ref)
				local RecyclingScopeHighWaterResult, RecyclingScopeHighWaterResult2 = p48.LifecycleWorkloads.recyclingScopeHighWater(Items, Clock)
				Evidence = RecyclingScopeHighWaterResult2
				
				return RecyclingScopeHighWaterResult
			end, p51)
		},
		evidence = Evidence
	})
end

local function measureCompositionChurn(p48, p49, p50, CoalescedUpdates, p51)
	-- upvalues: ResponsibilityCatalogModule (copy)
	local Clock = p51.clock or os.clock
	local CompositionChurnResult = p48.LifecycleWorkloads.compositionChurn(CoalescedUpdates)
	local AssignmentUpdatesDelta = 0
	local FlushesDelta = 0
	local RunResult = p49.run(function()
		-- upvalues: CompositionChurnResult (copy), Clock (copy), AssignmentUpdatesDelta (ref), FlushesDelta (ref)
		local AssignmentUpdates = CompositionChurnResult.getAssignmentUpdates()
		local Flushes = CompositionChurnResult.getFlushes()
		local ClockResult = Clock()
		CompositionChurnResult.run()
		local ScaledClockResult = (Clock() - ClockResult) * 1000
		AssignmentUpdatesDelta = CompositionChurnResult.getAssignmentUpdates() - AssignmentUpdates
		FlushesDelta = CompositionChurnResult.getFlushes() - Flushes
		
		return ScaledClockResult
	end, p51)
	CompositionChurnResult.destroy()
	
	return p50.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "isolated",
		workload = "composed-recyclable-churn",
		description = "Coalesces one prop update per composed destination into a single placement flush.",
		responsibility = ResponsibilityCatalogModule.React.Composition,
		scale = { items = CoalescedUpdates, updates = CoalescedUpdates },
		timing = {
			unit = "ms",
			basis = "compositionPlacementFlushBatch",
			includesSchedulerWaits = false,
			operationsPerSample = CoalescedUpdates
		},
		arms = { viewRecycler = RunResult },
		evidence = {
			assignmentUpdates = AssignmentUpdatesDelta,
			coalescedUpdates = CoalescedUpdates,
			placementFlushes = FlushesDelta,
			completionPhaseCounts = { compositionPublication = { synchronousFlush = 1 } }
		}
	})
end

local function runRecyclingStateMount(p48, p49, p50, p51)
	-- upvalues: measureRecyclingStateMountOverhead (copy), createItems (copy)
	local P190 = p51 or {}
	local ItemCount = P190.itemCount or 1000
	local RecyclingStateVisibleRows = P190.recyclingStateVisibleRows or 40
	assert(ItemCount >= 1 and ItemCount % 1 == 0, "itemCount must be a positive integer")
	assert(RecyclingStateVisibleRows >= 1 and RecyclingStateVisibleRows <= ItemCount and RecyclingStateVisibleRows % 1 == 0, "recyclingStateVisibleRows must be an integer within itemCount")
	
	return measureRecyclingStateMountOverhead(p48, p49, p50, createItems(ItemCount), RecyclingStateVisibleRows, P190)
end

return {
	run = function(p48, p49, p50, p51)
		-- upvalues: list (copy), createItems (copy), createItemTypes (copy), measureCompletedMount (copy), measureCompletedTraversal (copy), measureHostSizeSettlePhases (copy), measureAssignmentPropagation (copy), createPropagationScenario (copy), Callback (ref), measureRecyclingScopeHighWater (copy), measureCompositionChurn (copy), measureDeclarativeReconciliation (copy), measurePropSynchronization (copy), measureAssignmentBinding (copy), measurePresentationCommit (copy), measureVirtualListTeardown (copy), runRecyclingStateMount (copy)
		local P194 = p51 or {}
		local ItemCount = P194.itemCount or 1000
		local ScrollStepCount = P194.scrollStepCount or 10
		local MountVisibleRows = P194.mountVisibleRows or list
		local LifecycleItemCount = P194.lifecycleItemCount or 40
		local PropagationItemCount = P194.propagationItemCount or 1000
		assert(ItemCount >= 10 and ItemCount % 1 == 0, "itemCount must be an integer of at least 10")
		assert(ScrollStepCount >= 1 and ScrollStepCount % 1 == 0, "scrollStepCount must be a positive integer")
		assert(PropagationItemCount >= 20 and PropagationItemCount % 1 == 0, "propagationItemCount must be an integer of at least 20")
		local Items = createItems(ItemCount)
		local ItemTypes, ItemTypes2 = createItemTypes(p48)
		local List = {}
		
		for _, mountVisibleRow in ipairs(MountVisibleRows) do
			assert(mountVisibleRow >= 1 and mountVisibleRow <= ItemCount, "mount visible-row scale is out of range")
			table.insert(List, measureCompletedMount(p48, p49, p50, Items, ItemTypes, mountVisibleRow, P194))
		end
		table.insert(List, measureCompletedTraversal(p48, p49, p50, Items, ItemTypes, ItemCount, ScrollStepCount, false, P194))
		table.insert(List, measureCompletedTraversal(p48, p49, p50, Items, ItemTypes2, ItemCount, ScrollStepCount, true, P194))
		table.insert(List, measureHostSizeSettlePhases(p48, p49, p50, P194))
		local _, ItemTypes2_1 = createItemTypes(p48)
		
		for _, value in ipairs({
			"at-start",
			"in-middle",
			"before-visible-anchor",
			"at-end"
		}) do
			table.insert(List, measureAssignmentPropagation(p48, p49, p50, ItemTypes2_1, createPropagationScenario(p48, value, PropagationItemCount), PropagationItemCount, P194))
		end
		local CallbackResult, CallbackResult2, CallbackResult3 = Callback(p48, p49, p50, P194)
		table.insert(List, CallbackResult)
		table.insert(List, CallbackResult2)
		table.insert(List, CallbackResult3)
		table.insert(List, measureRecyclingScopeHighWater(p48, p49, p50, LifecycleItemCount, P194))
		table.insert(List, measureCompositionChurn(p48, p49, p50, LifecycleItemCount, P194))
		table.insert(List, measureDeclarativeReconciliation(p48, p49, p50, ItemTypes, P194))
		table.insert(List, measurePropSynchronization(p48, p49, p50, ItemTypes, P194))
		local MeasureAssignmentBindingResult, MeasureAssignmentBindingResult2 = measureAssignmentBinding(p48, p49, p50, P194)
		table.insert(List, MeasureAssignmentBindingResult)
		table.insert(List, MeasureAssignmentBindingResult2)
		table.insert(List, measurePresentationCommit(p48, p49, p50, P194))
		table.insert(List, measureVirtualListTeardown(p48, p49, p50, P194))
		table.insert(List, runRecyclingStateMount(p48, p49, p50, P194))
		
		return List
	end,
	runDeclarativeDataReconciliation = runDeclarativeDataReconciliation,
	runRecyclingStateMount = runRecyclingStateMount
}