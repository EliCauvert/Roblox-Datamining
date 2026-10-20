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
	
	if MeasuredObjects2 == nil then
		return nil
	else
		local ScrollingFrame = MeasuredObjects2:FindFirstAncestorWhichIsA("ScrollingFrame")
		
		return MeasuredObjects2.AbsolutePosition.Y - ScrollingFrame.AbsolutePosition.Y + ScrollingFrame.CanvasPosition.Y
	end
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

local function createExpensiveItemChildren(React, Item)
	local config = {
		Content = React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = Item.text
		})
	}
	
	for i = 1, 24 do
		config[`Detail{i}`] = React.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(i, 0),
			Size = UDim2.fromOffset(1, 1)
		})
	end
	return config
end

local function createExpensiveTraversalArm(p24, p25, Items, OperationsPerSample, p26, Callback)
	-- upvalues: createExpensiveItemChildren (copy), observeCompletionPhases (copy), hasItemText (copy), mountedItemCount (copy), createOffsets (copy), captureCompletionPhase (copy)
	local React = p24.React
	local config = { mounts = 0, unmounts = 0 }
	
	local function _()
		-- upvalues: React (copy), config (copy)
		React.useEffect(function()
			-- upvalues: config (upval)
			config.mounts += 1
			
			return function()
				-- upvalues: config (upval)
				config.unmounts += 1
			end
		end, {})
	end
	
	local VirtualList = nil
	local RecyclableView = nil
	
	if p26 == "advanced" then
		RecyclableView = p24.ViewRecycler.createRecyclableView(function(p27)
			-- upvalues: p24 (copy), React (copy), config (copy), createExpensiveItemChildren (upval)
			local UseSignalStateResult = p24.SignalsReact.useSignalState(p27.itemSignal)
			React.useEffect(function()
				-- upvalues: config (upval)
				config.mounts += 1
				
				return function()
					-- upvalues: config (upval)
					config.unmounts += 1
				end
			end, {})
			
			return React.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, (createExpensiveItemChildren(React, UseSignalStateResult)))
		end)
		VirtualList = p24.ViewRecycler.VirtualList
	else
		VirtualList = p24.ViewRecycler.createVirtualList({
			itemComponent = function(p27)
				-- upvalues: React (copy), config (copy), createExpensiveItemChildren (upval)
				React.useEffect(function()
					-- upvalues: config (upval)
					config.mounts += 1
					
					return function()
						-- upvalues: config (upval)
						config.unmounts += 1
					end
				end, {})
				
				return React.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, (createExpensiveItemChildren(React, p27.item)))
			end
		})
	end
	local Count = 0
	local v5 = 0
	local AssignmentDeliveriesPerTraversal = 0
	local CompletionPhaseCounts = {}
	local Folder = Instance.new("Folder")
	local Root = p24.ReactRoblox.createRoot(Folder)
	local UniformResult = p24.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local SequenceResult = p24.ViewRecycler.DataSource.sequence(p25, function(p27)
		return p27.id
	end)
	p24.ReactRoblox.act(function()
		-- upvalues: SequenceResult (copy), UniformResult (copy), p24 (copy), Count (ref), RecyclableView (ref), Root (copy), React (copy), VirtualList (ref)
		local config = {
			overscan = 0,
			data = SequenceResult,
			layout = UniformResult,
			axis = p24.ViewRecycler.Axis.Y,
			_instrumentation = {
				assignmentChanged = function(_, p27)
					-- upvalues: Count (upval)
					if p27 ~= nil then
						Count += 1
					end
				end
			}
		}
		
		if RecyclableView ~= nil then
			config.itemType = RecyclableView
		end
		Root:render(React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, 400)
		}, { List = React.createElement(VirtualList, config) }))
	end)
	observeCompletionPhases(p24, {
		destinationRowCommitted = function()
			-- upvalues: hasItemText (upval), Folder (copy)
			return (hasItemText(Folder, "Item 10"))
		end
	}, `{p26} expensive traversal initial rows`, {})
	local Largest = math.max(v5, (mountedItemCount(Folder)))
	local ScrollingFrame = Folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(ScrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local Offsets = createOffsets(Items, OperationsPerSample)
	
	return {
		run = function()
			-- upvalues: Count (ref), Callback (copy), Offsets (copy), hasItemText (upval), Folder (copy), p24 (copy), ScrollingFrame (copy), captureCompletionPhase (upval), CompletionPhaseCounts (copy), observeCompletionPhases (upval), p26 (copy), Largest (ref), mountedItemCount (upval), AssignmentDeliveriesPerTraversal (ref)
			local Count1 = Count
			local CallbackResult = Callback()
			
			for _, offset in Offsets do
				local NewFloored = math.floor(offset / 40) + 1
				local config = {
					destinationRowCommitted = function()
						-- upvalues: hasItemText (upval), Folder (upval), NewFloored (copy)
						return (hasItemText(Folder, `Item {NewFloored}`))
					end
				}
				local t = {}
				p24.ReactRoblox.act(function()
					-- upvalues: ScrollingFrame (upval), offset (copy), captureCompletionPhase (upval), config (copy), t (copy), CompletionPhaseCounts (upval)
					ScrollingFrame.CanvasPosition = Vector2.new(0, offset)
					captureCompletionPhase(config, t, CompletionPhaseCounts, "afterMutation")
				end)
				observeCompletionPhases(p24, config, `{p26} expensive traversal Item {NewFloored}`, CompletionPhaseCounts, t)
				Largest = math.max(Largest, (mountedItemCount(Folder)))
			end
			local ScaledCallbackResult = (Callback() - CallbackResult) * 1000
			AssignmentDeliveriesPerTraversal = Count - Count1
			p24.ReactRoblox.act(function()
				-- upvalues: ScrollingFrame (upval)
				ScrollingFrame.CanvasPosition = Vector2.zero
			end)
			observeCompletionPhases(p24, {
				destinationRowCommitted = function()
					-- upvalues: hasItemText (upval), Folder (upval)
					return (hasItemText(Folder, "Item 1"))
				end
			}, `{p26} expensive traversal reset`, {})
			
			return ScaledCallbackResult
		end,
		getEvidence = function()
			-- upvalues: config (copy), AssignmentDeliveriesPerTraversal (ref), Largest (ref), CompletionPhaseCounts (copy)
			return {
				mounts = config.mounts,
				unmounts = config.unmounts,
				assignmentDeliveriesPerTraversal = AssignmentDeliveriesPerTraversal,
				mountedViewHighWater = Largest,
				completionPhaseCounts = CompletionPhaseCounts
			}
		end,
		destroy = function()
			-- upvalues: p24 (copy), Root (copy), UniformResult (copy), Folder (copy)
			p24.ReactRoblox.act(function()
				-- upvalues: Root (copy)
				Root:unmount()
			end)
			UniformResult.destroy()
			Folder:Destroy()
		end
	}
end

local function measureExpensiveUniformTraversalComparison(p27, p28, p29, p30, Items, OperationsPerSample, p31)
	-- upvalues: createExpensiveTraversalArm (copy), ResponsibilityCatalogModule (copy)
	local Clock = p31.clock or os.clock
	local Advanced = createExpensiveTraversalArm(p27, p30, Items, OperationsPerSample, "advanced", Clock)
	local Specialized = createExpensiveTraversalArm(p27, p30, Items, OperationsPerSample, "specialized", Clock)
	local RunResult = p28.run(Advanced.run, p31)
	local RunResult1 = p28.run(Specialized.run, p31)
	Advanced.destroy()
	Specialized.destroy()
	local Evidence = {
		completionBarrier = "destinationRowCommitted",
		reactWorkFlush = "ReactRoblox.actWithMockScheduler",
		advanced = Advanced.getEvidence(),
		specialized = Specialized.getEvidence()
	}
	assert(Evidence.advanced.mounts == Evidence.specialized.mounts, "expensive traversal mount evidence differs")
	assert(Evidence.advanced.unmounts == Evidence.specialized.unmounts, "expensive traversal unmount evidence differs")
	assert(Evidence.advanced.assignmentDeliveriesPerTraversal == Evidence.specialized.assignmentDeliveriesPerTraversal, "expensive traversal Assignment evidence differs")
	assert(Evidence.advanced.mountedViewHighWater == Evidence.specialized.mountedViewHighWater, "expensive traversal mounted-view high-water differs")
	
	return p29.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "expensive-uniform-traversal-interface-comparison",
		description = "Compares expensive fixed-height Item traversal through advanced VirtualList and createVirtualList.",
		responsibility = ResponsibilityCatalogModule.React.MountScroll,
		scale = {
			visibleRows = 10,
			itemLength = 40,
			overscan = 0,
			expensiveItemChildren = 24,
			items = Items,
			scrollSteps = OperationsPerSample
		},
		timing = {
			unit = "ms",
			basis = "completedScrollTraversal",
			includesSchedulerWaits = true,
			operationsPerSample = OperationsPerSample
		},
		arms = {
			advancedVirtualList = RunResult,
			specializedFactory = RunResult1
		},
		evidence = Evidence
	})
end

local function measureStatefulAssignmentRenderControl(p27, p28, p29, p30)
	-- upvalues: hasItemText (copy), observeCompletionPhases (copy), ResponsibilityCatalogModule (copy)
	local Clock = p30.clock or os.clock
	local Signal = p27.Signals.createSignal({ entryHeight = 40 })
	local list = {
		{
			id = "item1",
			text = "Item 1",
			height = 40,
			presentationSignal = Signal
		},
		{
			id = "item2",
			text = "Item 2",
			height = 40,
			presentationSignal = Signal
		}
	}
	local Count = 0
	local Count1 = 0
	local v6 = 1
	local Signal1, Signal2 = p27.Signals.createSignal(list[v6])
	
	local function StatefulBaseline()
		-- upvalues: Count (ref), p27 (copy), Signal1 (copy), Count1 (ref)
		Count += 1
		local UseSignalStateResult = p27.SignalsReact.useSignalState(Signal1)
		local UseSignalStateResult1 = p27.SignalsReact.useSignalState(UseSignalStateResult.presentationSignal)
		p27.React.useLayoutEffect(function()
			-- upvalues: Count1 (upval)
			Count1 += 1
		end)
		
		return p27.React.createElement("TextLabel", {
			Name = "Content",
			Size = UDim2.fromOffset(400, UseSignalStateResult1.entryHeight),
			Text = UseSignalStateResult.text
		})
	end
	
	local Folder = Instance.new("Folder")
	local Root = p27.ReactRoblox.createRoot(Folder)
	p27.ReactRoblox.act(function()
		-- upvalues: Root (copy), p27 (copy), StatefulBaseline (copy)
		Root:render(p27.React.createElement(StatefulBaseline))
	end)
	local RendersPerUpdate = 0
	local CommitsPerUpdate = 0
	
	local function runBaseline()
		-- upvalues: Count (ref), Count1 (ref), v6 (ref), Clock (copy), p27 (copy), Signal2 (copy), list (copy), RendersPerUpdate (ref), CommitsPerUpdate (ref), hasItemText (upval), Folder (copy)
		local Count2 = Count
		local Count3 = Count1
		v6 = if v6 == 1 then 2 else 1
		local ClockResult = Clock()
		p27.ReactRoblox.act(function()
			-- upvalues: Signal2 (upval), list (upval), v6 (upval)
			Signal2(list[v6])
		end)
		local ScaledClockResult = (Clock() - ClockResult) * 1000
		RendersPerUpdate = Count - Count2
		CommitsPerUpdate = Count1 - Count3
		assert(hasItemText(Folder, list[v6].text), "baseline content did not commit")
		
		return ScaledClockResult
	end
	
	local Count2 = 0
	local Count3 = 0
	local Count4 = 0
	local RecyclableView = p27.ViewRecycler.createRecyclableView(function(p31)
		-- upvalues: Count2 (ref), p27 (copy), Count3 (ref)
		Count2 += 1
		local UseSignalStateResult = p27.SignalsReact.useSignalState(p31.itemSignal)
		local UseSignalStateResult1 = p27.SignalsReact.useSignalState(UseSignalStateResult.presentationSignal)
		p27.React.useLayoutEffect(function()
			-- upvalues: Count3 (upval)
			Count3 += 1
		end)
		
		return p27.React.createElement("TextLabel", {
			Name = "Content",
			Size = UDim2.fromOffset(400, UseSignalStateResult1.entryHeight),
			Text = UseSignalStateResult.text
		})
	end, { readiness = "ReadyOnCommit" })
	local SequenceResult = p27.ViewRecycler.DataSource.sequence(list, function(p31)
		return p31.id
	end)
	local UniformResult = p27.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local Folder1 = Instance.new("Folder")
	local Root1 = p27.ReactRoblox.createRoot(Folder1)
	local config = {
		_instrumentation = {
			assignmentChanged = function(_, p31)
				-- upvalues: Count4 (ref)
				if p31 ~= nil then
					Count4 += 1
				end
			end
		}
	}
	local Diagnostics = nil
	local v7 = 1
	p27.ReactRoblox.act(function()
		-- upvalues: SequenceResult (copy), UniformResult (copy), p27 (copy), RecyclableView (copy), Diagnostics (copy), config (copy), Root1 (copy), v7 (copy)
		local config = {
			overscan = 0,
			data = SequenceResult,
			layout = UniformResult,
			axis = p27.ViewRecycler.Axis.Y,
			itemType = RecyclableView,
			diagnostics = Diagnostics
		}
		
		if config ~= nil then
			for i, value in config do
				config[i] = value
			end
		end
		Root1:render(p27.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, v7 * 40)
		}, {
			List = p27.React.createElement(p27.ViewRecycler.VirtualList, config)
		}))
	end)
	local ScrollingFrame = Folder1:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(ScrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local ScrollingFrame1 = ScrollingFrame
	local v8 = 1
	local RendersPerAssignment = 0
	local CommitsPerAssignment = 0
	local AssignmentsPerUpdate = 0
	local RunResult = p28.run(runBaseline, p30)
	local RunResult1 = p28.run(function()
		-- upvalues: Count2 (ref), Count3 (ref), Count4 (ref), v8 (ref), list (copy), Clock (copy), p27 (copy), ScrollingFrame1 (copy), observeCompletionPhases (upval), hasItemText (upval), Folder1 (copy), RendersPerAssignment (ref), CommitsPerAssignment (ref), AssignmentsPerUpdate (ref)
		local Count = Count2
		local Count1 = Count3
		local Count5 = Count4
		v8 = if v8 == 1 then 2 else 1
		local Text = list[v8].text
		local ClockResult = Clock()
		p27.ReactRoblox.act(function()
			-- upvalues: ScrollingFrame1 (upval), v8 (upval)
			ScrollingFrame1.CanvasPosition = Vector2.new(0, (v8 - 1) * 40)
		end)
		observeCompletionPhases(p27, {
			destinationRowCommitted = function()
				-- upvalues: hasItemText (upval), Folder1 (upval), Text (copy)
				return (hasItemText(Folder1, Text))
			end
		}, `stateful render control {Text}`, {})
		local ScaledClockResult = (Clock() - ClockResult) * 1000
		RendersPerAssignment = Count2 - Count
		CommitsPerAssignment = Count3 - Count1
		AssignmentsPerUpdate = Count4 - Count5
		
		return ScaledClockResult
	end, p30)
	p27.ReactRoblox.act(function()
		-- upvalues: Root (copy)
		Root:unmount()
	end)
	Folder:Destroy()
	p27.ReactRoblox.act(function()
		-- upvalues: Root1 (copy)
		Root1:unmount()
	end)
	UniformResult.destroy()
	Folder1:Destroy()
	assert(RendersPerUpdate == RendersPerAssignment, "ViewRecycler changed stateful row render count")
	assert(CommitsPerUpdate == CommitsPerAssignment, "ViewRecycler changed stateful row commit count")
	assert(AssignmentsPerUpdate == 1, "expected exactly one recycled Assignment per update")
	
	return p29.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "stateful-assignment-render-control",
		description = "Compares stateful render invocations for a direct Signals update and one recycled Assignment.",
		responsibility = ResponsibilityCatalogModule.React.StatefulTransfer,
		scale = { items = 2, visibleRows = 1, signalsPerRow = 2 },
		timing = {
			unit = "ms",
			basis = "committedStatefulUpdate",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = {
			directSignalsReact = RunResult,
			viewRecycler = RunResult1
		},
		evidence = {
			additionalRendersFromViewRecycler = RendersPerAssignment - RendersPerUpdate,
			additionalCommitsFromViewRecycler = CommitsPerAssignment - CommitsPerUpdate,
			directSignalsReact = {
				rendersPerUpdate = RendersPerUpdate,
				commitsPerUpdate = CommitsPerUpdate
			},
			viewRecycler = {
				rendersPerAssignment = RendersPerAssignment,
				commitsPerAssignment = CommitsPerAssignment,
				assignmentsPerUpdate = AssignmentsPerUpdate
			}
		}
	})
end

local function measureHostSizeSettlePhases(p31, p32, p33, p34)
	-- upvalues: observeCompletionPhases (copy), hasItemText (copy), waitForHeartbeatToSettle (copy), findMeasuredObjects (copy), flushDeferredWork (copy), recordSizeComparison (copy), ResponsibilityCatalogModule (copy)
	local Clock = p34.clock or os.clock
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Parent = game:GetService("CoreGui")
	local Root = p31.ReactRoblox.createRoot(ScreenGui)
	local MeasuredResult = p31.ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local Repeated = string.rep("This response grows enough to wrap across the measured row. ", 8)
	local RecyclableView = p31.ViewRecycler.createRecyclableView(function(p35)
		-- upvalues: p31 (copy)
		return p31.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.fromOffset(10, 0),
			Size = UDim2.new(1, -20, 0, 0),
			Text = p31.SignalsReact.useSignalState(p35.itemSignal).text
		})
	end, { readiness = "ReadyOnCommit", hideWhilePending = true })
	local config = {
		id = "measurement-probe",
		text = "Short response",
		height = 40
	}
	local SequenceResult = p31.ViewRecycler.DataSource.sequence({ config }, function(p35)
		return p35.id
	end)
	local NewAccepted = 0
	
	local function Diagnostics(p35)
		-- upvalues: NewAccepted (ref)
		if p35.kind == "measurementsProcessed" then
			NewAccepted += p35.accepted
		end
	end
	
	local v8 = nil
	local v9 = 3
	p31.ReactRoblox.act(function()
		-- upvalues: SequenceResult (copy), MeasuredResult (copy), p31 (copy), RecyclableView (copy), Diagnostics (copy), v8 (copy), Root (copy), v9 (copy)
		local config = {
			overscan = 0,
			data = SequenceResult,
			layout = MeasuredResult,
			axis = p31.ViewRecycler.Axis.Y,
			itemType = RecyclableView,
			diagnostics = Diagnostics
		}
		
		if v8 ~= nil then
			for i, value in v8 do
				config[i] = value
			end
		end
		Root:render(p31.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, v9 * 40)
		}, {
			List = p31.React.createElement(p31.ViewRecycler.VirtualList, config)
		}))
	end)
	observeCompletionPhases(p31, {
		destinationRowCommitted = function()
			-- upvalues: hasItemText (upval), ScreenGui (copy)
			return (hasItemText(ScreenGui, "Short response"))
		end,
		measurementAccepted = function(): boolean
			-- upvalues: NewAccepted (ref)
			return NewAccepted > 0
		end
	}, "initial wrapped measured row", {})
	waitForHeartbeatToSettle(p31)
	waitForHeartbeatToSettle(p31)
	local v10 = 0
	local CompletionPhaseCounts = {}
	local HostSizeComparisons = {}
	local ContentSizeComparisons = {}
	local SettledHostSizeCounts = {}
	local SettledContentSizeCounts = {}
	local MismatchExamples = { host = {}, content = {} }
	local Update = 0
	local RunResult = p32.run(function()
		-- upvalues: Update (ref), v10 (ref), Repeated (copy), NewAccepted (ref), findMeasuredObjects (upval), ScreenGui (copy), CompletionPhaseCounts (copy), Clock (copy), p31 (copy), SequenceResult (copy), config (copy), flushDeferredWork (upval), waitForHeartbeatToSettle (upval), SettledHostSizeCounts (copy), SettledContentSizeCounts (copy), recordSizeComparison (upval), HostSizeComparisons (copy), MismatchExamples (copy), ContentSizeComparisons (copy)
		Update += 1
		v10 = (v10 + 1) % 2
		local ShortResponse = if v10 == 0 then "Short response" else Repeated
		local Short: string = if v10 == 0 then "short" else "long"
		local NewAccepted1 = NewAccepted
		local t = {}
		local t1 = {}
		local v11: string? = nil
		
		local function _(Key)
			-- upvalues: findMeasuredObjects (upval), ScreenGui (upval), ShortResponse (copy), t1 (copy), t (copy), v11 (ref), NewAccepted (upval), NewAccepted1 (copy), CompletionPhaseCounts (upval)
			local MeasuredObjects, MeasuredObjects2 = findMeasuredObjects(ScreenGui, ShortResponse)
			
			if MeasuredObjects ~= nil then
				t1[Key] = MeasuredObjects.AbsoluteSize.Y
			end
			if MeasuredObjects2 ~= nil then
				t[Key] = MeasuredObjects2.AbsoluteSize.Y
			end
			if v11 == nil and NewAccepted1 < NewAccepted then
				v11 = Key
				local MeasurementAccepted = CompletionPhaseCounts.measurementAccepted
				
				if MeasurementAccepted == nil then
					MeasurementAccepted = {}
					CompletionPhaseCounts.measurementAccepted = MeasurementAccepted
				end
				MeasurementAccepted[Key] = (MeasurementAccepted[Key] or 0) + 1
			end
		end
		
		local ClockResult = Clock()
		p31.ReactRoblox.act(function()
			-- upvalues: SequenceResult (upval), config (upval), ShortResponse (copy), findMeasuredObjects (upval), ScreenGui (upval), t1 (copy), t (copy), v11 (ref), NewAccepted (upval), NewAccepted1 (copy), CompletionPhaseCounts (upval)
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
			if v11 == nil and NewAccepted1 < NewAccepted then
				v11 = "afterMutation"
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
		if v11 == nil and NewAccepted1 < NewAccepted then
			v11 = "afterAct"
			local MeasurementAccepted = CompletionPhaseCounts.measurementAccepted
			
			if MeasurementAccepted == nil then
				MeasurementAccepted = {}
				CompletionPhaseCounts.measurementAccepted = MeasurementAccepted
			end
			MeasurementAccepted.afterAct = (MeasurementAccepted.afterAct or 0) + 1
		end
		p31.ReactRoblox.act(flushDeferredWork)
		local MeasuredObjects1, MeasuredObjects2_1 = findMeasuredObjects(ScreenGui, ShortResponse)
		
		if MeasuredObjects1 ~= nil then
			t1.deferred = MeasuredObjects1.AbsoluteSize.Y
		end
		if MeasuredObjects2_1 ~= nil then
			t.deferred = MeasuredObjects2_1.AbsoluteSize.Y
		end
		if v11 == nil and NewAccepted1 < NewAccepted then
			v11 = "deferred"
			local MeasurementAccepted = CompletionPhaseCounts.measurementAccepted
			
			if MeasurementAccepted == nil then
				MeasurementAccepted = {}
				CompletionPhaseCounts.measurementAccepted = MeasurementAccepted
			end
			MeasurementAccepted.deferred = (MeasurementAccepted.deferred or 0) + 1
		end
		for i = 1, 3 do
			waitForHeartbeatToSettle(p31)
			local HeartbeatName: string = `heartbeat{i}Settled`
			local MeasuredObjects3, MeasuredObjects2_2 = findMeasuredObjects(ScreenGui, ShortResponse)
			
			if MeasuredObjects3 ~= nil then
				t1[HeartbeatName] = MeasuredObjects3.AbsoluteSize.Y
			end
			if MeasuredObjects2_2 ~= nil then
				t[HeartbeatName] = MeasuredObjects2_2.AbsoluteSize.Y
			end
			if v11 == nil and NewAccepted1 < NewAccepted then
				v11 = HeartbeatName
				local MeasurementAccepted = CompletionPhaseCounts.measurementAccepted
				
				if MeasurementAccepted == nil then
					MeasurementAccepted = {}
					CompletionPhaseCounts.measurementAccepted = MeasurementAccepted
				end
				MeasurementAccepted[HeartbeatName] = (MeasurementAccepted[HeartbeatName] or 0) + 1
			end
		end
		local ScaledClockResult = (Clock() - ClockResult) * 1000
		
		if v11 == nil then
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
	end, p34)
	p31.ReactRoblox.act(function()
		-- upvalues: Root (copy)
		Root:unmount()
	end)
	MeasuredResult.destroy()
	ScreenGui:Destroy()
	
	return p33.create({
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

local function runAssignmentPropagationSample(p35, ItemType, PropagationScenario, Items: number, p36)
	-- upvalues: observeCompletionPhases (copy), hasItemText (copy), waitForHeartbeatToSettle (copy), findMeasuredObjects (copy)
	local Clock = p36.clock or os.clock
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
	local Root = p35.ReactRoblox.createRoot(Folder)
	local MeasuredResult = p35.ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local SequenceResult = p35.ViewRecycler.DataSource.sequence(Buffer, function(p37)
		return p37.id
	end)
	local v12 = nil
	local v13 = nil
	local v14 = nil
	local v15 = nil
	local v16 = nil
	local Flag = false
	local ObservedContentLength = nil
	local config1 = { data = 0, measurement = 0, programmaticScroll = 0 }
	local CompletionPhaseCounts = {}
	
	local function Diagnostics(p37)
		-- upvalues: Flag (ref), v12 (ref), v13 (ref), Clock (copy), v14 (ref), config1 (copy)
		if not Flag then return end
		if p37.kind == "measurementsProcessingStarted" and v12 ~= nil then
			v13 = v13 or Clock()
			
			return
		end
		if p37.kind == "measurementsProcessed" and p37.accepted > 0 and v12 ~= nil then
			v14 = v14 or Clock()
			
			return
		end
		if p37.kind == "scrollCorrection" then
			local Source = p37.source
			config1[Source] += p37.delta
		end
	end
	
	local config2 = {
		overscan = PropagationScenario.overscan,
		preserveScrollPositionOnChange = PropagationScenario.preserveScrollPositionOnChange,
		initialScrollAlignment = PropagationScenario.initialScrollAlignment,
		autoScrollOnChange = PropagationScenario.autoScrollOnChange,
		_instrumentation = {
			assignmentChanged = function(_, p37)
				-- upvalues: Flag (ref), config (copy), v12 (ref), Clock (copy)
				if Flag and p37 ~= nil and p37.key == config.id and v12 == nil then
					v12 = Clock()
				end
			end
		},
		onContentLengthChanged = function(p37)
			-- upvalues: Flag (ref), PropagationScenario (copy), ObservedContentLength (ref)
			if Flag and math.abs(p37 - PropagationScenario.finalContentLength) <= 0.01 then
				ObservedContentLength = p37
			end
		end
	}
	local v17 = 10
	p35.ReactRoblox.act(function()
		-- upvalues: SequenceResult (copy), MeasuredResult (copy), p35 (copy), ItemType (copy), Diagnostics (copy), config2 (copy), Root (copy), v17 (copy)
		local config = {
			overscan = 0,
			data = SequenceResult,
			layout = MeasuredResult,
			axis = p35.ViewRecycler.Axis.Y,
			itemType = ItemType,
			diagnostics = Diagnostics
		}
		
		if config2 ~= nil then
			for i, value in config2 do
				config[i] = value
			end
		end
		Root:render(p35.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, v17 * 40)
		}, {
			List = p35.React.createElement(p35.ViewRecycler.VirtualList, config)
		}))
	end)
	local ScrollingFrame = Folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(ScrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	p35.ReactRoblox.act(function()
		-- upvalues: ScrollingFrame (copy), PropagationScenario (copy)
		ScrollingFrame.CanvasPosition = Vector2.new(0, PropagationScenario.initialOffset)
	end)
	observeCompletionPhases(p35, {
		destinationRowCommitted = function()
			-- upvalues: hasItemText (upval), Folder (copy), PropagationScenario (copy)
			return (hasItemText(Folder, PropagationScenario.initialDestinationText))
		end,
		initialCanvasSettled = function(): boolean
			-- upvalues: ScrollingFrame (copy), Items (copy)
			return math.abs(ScrollingFrame.CanvasSize.Y.Offset - Items * 40) <= 0.01
		end
	}, `prepare {PropagationScenario.name} insertion`, {})
	waitForHeartbeatToSettle(p35)
	assert(math.abs(ScrollingFrame.CanvasSize.Y.Offset - Items * 40) <= 0.01, `{PropagationScenario.name}: initial canvas size did not settle (expected {Items * 40}, got {ScrollingFrame.CanvasSize.Y.Offset})`)
	assert(math.abs(ScrollingFrame.CanvasPosition.Y - PropagationScenario.initialOffset) <= 0.01, `{PropagationScenario.name}: initial scroll position did not settle`)
	Flag = true
	p35.ReactRoblox.act(function()
		-- upvalues: SequenceResult (copy), PropagationScenario (copy), config (copy)
		SequenceResult.insert(PropagationScenario.insertIndex, config)
	end)
	local v18: number = if PropagationScenario.name == "before-visible-anchor" then 40 else 0
	local v19: number = if PropagationScenario.name == "before-visible-anchor" then 40 else 0
	local t = {}
	
	local function captureLibraryPublication(): boolean
		-- upvalues: Folder (copy), config (copy), findMeasuredObjects (upval), PropagationScenario (copy), v12 (ref), v13 (ref), v14 (ref), ObservedContentLength (ref), config1 (copy), v18 (copy), v19 (copy), v15 (ref), Clock (copy)
		local _, MeasuredObjects2 = findMeasuredObjects(Folder, config.text)
		local NewY = nil
		
		if MeasuredObjects2 == nil then
			NewY = nil
		else
			local ScrollingFrame = MeasuredObjects2:FindFirstAncestorWhichIsA("ScrollingFrame")
			NewY = MeasuredObjects2.AbsolutePosition.Y - ScrollingFrame.AbsolutePosition.Y + ScrollingFrame.CanvasPosition.Y
		end
		local _, MeasuredObjects2_1 = findMeasuredObjects(Folder, `Item {string.sub(PropagationScenario.neighborKey, 5)}`)
		local NewY1 = nil
		
		if MeasuredObjects2_1 == nil then
			NewY1 = nil
		else
			local ScrollingFrame = MeasuredObjects2_1:FindFirstAncestorWhichIsA("ScrollingFrame")
			NewY1 = MeasuredObjects2_1.AbsolutePosition.Y - ScrollingFrame.AbsolutePosition.Y + ScrollingFrame.CanvasPosition.Y
		end
		local IsMagnitudeBelow: boolean = v12 ~= nil and (v13 ~= nil and (v14 ~= nil and (ObservedContentLength ~= nil and (NewY ~= nil and (math.abs(NewY - PropagationScenario.insertedStartOffset) <= 0.01 and (NewY1 ~= nil and (math.abs(NewY1 - PropagationScenario.neighborStartOffset) <= 0.01 and (math.abs(config1.data - v18) <= 0.01 and math.abs(config1.measurement - v19) <= 0.01))))))))
		
		if IsMagnitudeBelow and v15 == nil then
			v15 = Clock()
		end
		return IsMagnitudeBelow
	end
	
	observeCompletionPhases(p35, {
		libraryOutputsPublished = captureLibraryPublication,
		hostValuesObserved = function(): boolean
			-- upvalues: captureLibraryPublication (copy), Folder (copy), config (copy), findMeasuredObjects (upval), PropagationScenario (copy), t (ref), v12 (ref), v13 (ref), v14 (ref), v15 (ref), ObservedContentLength (ref), ScrollingFrame (copy), v16 (ref), Clock (copy)
			captureLibraryPublication()
			local _, MeasuredObjects2 = findMeasuredObjects(Folder, config.text)
			local NewY = nil
			
			if MeasuredObjects2 == nil then
				NewY = nil
			else
				local ScrollingFrame1 = MeasuredObjects2:FindFirstAncestorWhichIsA("ScrollingFrame")
				NewY = MeasuredObjects2.AbsolutePosition.Y - ScrollingFrame1.AbsolutePosition.Y + ScrollingFrame1.CanvasPosition.Y
			end
			local _, MeasuredObjects2_1 = findMeasuredObjects(Folder, `Item {string.sub(PropagationScenario.neighborKey, 5)}`)
			local NewY1 = nil
			
			if MeasuredObjects2_1 == nil then
				NewY1 = nil
			else
				local ScrollingFrame2 = MeasuredObjects2_1:FindFirstAncestorWhichIsA("ScrollingFrame")
				NewY1 = MeasuredObjects2_1.AbsolutePosition.Y - ScrollingFrame2.AbsolutePosition.Y + ScrollingFrame2.CanvasPosition.Y
			end
			t = {
				assigned = v12 ~= nil,
				measurementStarted = v13 ~= nil,
				measurementProcessed = v14 ~= nil,
				libraryPublished = v15 ~= nil,
				observedContentLength = ObservedContentLength,
				canvasLength = ScrollingFrame.CanvasSize.Y.Offset,
				scrollOffset = ScrollingFrame.CanvasPosition.Y,
				insertedOffset = NewY,
				neighborOffset = NewY1
			}
			local IsMagnitudeBelow: boolean = v12 ~= nil and (v15 ~= nil and (math.abs(ScrollingFrame.CanvasSize.Y.Offset - PropagationScenario.finalContentLength) <= 0.01 and math.abs(ScrollingFrame.CanvasPosition.Y - PropagationScenario.finalScrollOffset) <= 0.01))
			
			if IsMagnitudeBelow and v16 == nil then
				v16 = Clock()
			end
			return IsMagnitudeBelow
		end
	}, function(): string
		-- upvalues: PropagationScenario (copy), t (ref)
		return `{PropagationScenario.name} assignment, measurement, and propagation; assigned={t.assigned}, measurementStarted={t.measurementStarted}, measurementProcessed={t.measurementProcessed}, libraryPublished={t.libraryPublished}, content={t.observedContentLength}, canvas={t.canvasLength}, scroll={t.scrollOffset}, inserted={t.insertedOffset}, neighbor={t.neighborOffset}`
	end, CompletionPhaseCounts)
	local v20 = assert(v12, `{PropagationScenario.name}: inserted item was not assigned`)
	local v21 = assert(v13, `{PropagationScenario.name}: inserted item measurement did not reach Core`)
	local v22 = assert(v14, `{PropagationScenario.name}: inserted item measurement was not accepted`)
	local v23 = assert(v15, `{PropagationScenario.name}: library outputs were not fully published`)
	local v24 = assert(v16, `{PropagationScenario.name}: host values did not fully propagate`)
	assert(v20 <= v21, `{PropagationScenario.name}: measurement preceded assignment`)
	assert(v21 <= v22, `{PropagationScenario.name}: measurement completed before it started`)
	assert(v22 <= v23, `{PropagationScenario.name}: library outputs preceded measurement`)
	assert(v23 <= v24, `{PropagationScenario.name}: host values preceded library outputs`)
	assert(math.abs(config1.data - v18) <= 0.01, `{PropagationScenario.name}: unexpected insertion anchor correction`)
	assert(math.abs(config1.measurement - v19) <= 0.01, `{PropagationScenario.name}: unexpected measurement anchor correction`)
	local config3 = { insertIndex = PropagationScenario.insertIndex }
	local _, MeasuredObjects2 = findMeasuredObjects(Folder, config.text)
	local NewY = nil
	
	if MeasuredObjects2 == nil then
		NewY = nil
	else
		local ScrollingFrame1 = MeasuredObjects2:FindFirstAncestorWhichIsA("ScrollingFrame")
		NewY = MeasuredObjects2.AbsolutePosition.Y - ScrollingFrame1.AbsolutePosition.Y + ScrollingFrame1.CanvasPosition.Y
	end
	config3.insertedStartOffset = NewY
	config3.neighborKey = PropagationScenario.neighborKey
	local _, MeasuredObjects2_1 = findMeasuredObjects(Folder, `Item {string.sub(PropagationScenario.neighborKey, 5)}`)
	local NewY1 = nil
	
	if MeasuredObjects2_1 == nil then
		NewY1 = nil
	else
		local ScrollingFrame2 = MeasuredObjects2_1:FindFirstAncestorWhichIsA("ScrollingFrame")
		NewY1 = MeasuredObjects2_1.AbsolutePosition.Y - ScrollingFrame2.AbsolutePosition.Y + ScrollingFrame2.CanvasPosition.Y
	end
	config3.neighborStartOffset = NewY1
	config3.contentLength = ScrollingFrame.CanvasSize.Y.Offset
	config3.scrollOffset = ScrollingFrame.CanvasPosition.Y
	config3.dataAnchorCorrection = config1.data
	config3.measurementAnchorCorrection = config1.measurement
	config3.completionPhaseCounts = CompletionPhaseCounts
	config3.assignmentToMeasurementStartMs = (v21 - v20) * 1000
	config3.measurementProcessingMs = (v22 - v21) * 1000
	config3.measurementProcessedToLibraryPublicationMs = (v23 - v22) * 1000
	config3.libraryPublicationToHostObservationMs = (v24 - v23) * 1000
	config3.assignmentToHostObservationMs = (v24 - v20) * 1000
	p35.ReactRoblox.act(function()
		-- upvalues: Root (copy)
		Root:unmount()
	end)
	MeasuredResult.destroy()
	Folder:Destroy()
	
	return config3
end

local function measureAssignmentPropagation(p37, p38, p39, p40, p41, Items, p42)
	-- upvalues: runAssignmentPropagationSample (copy), ResponsibilityCatalogModule (copy)
	local Evidence = {}
	
	return p39.create({
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
			scenario = p41.name
		},
		timing = {
			unit = "ms",
			basis = "assignmentToMilestone",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = {
			assignmentToMeasurementStart = p38.run(function()
				-- upvalues: runAssignmentPropagationSample (upval), p37 (copy), p40 (copy), p41 (copy), Items (copy), p42 (copy), Evidence (ref)
				local RunAssignmentPropagationSampleResult = runAssignmentPropagationSample(p37, p40, p41, Items, p42)
				Evidence = RunAssignmentPropagationSampleResult
				
				return RunAssignmentPropagationSampleResult.assignmentToMeasurementStartMs
			end, p42),
			measurementProcessing = p38.run(function()
				-- upvalues: runAssignmentPropagationSample (upval), p37 (copy), p40 (copy), p41 (copy), Items (copy), p42 (copy), Evidence (ref)
				local RunAssignmentPropagationSampleResult = runAssignmentPropagationSample(p37, p40, p41, Items, p42)
				Evidence = RunAssignmentPropagationSampleResult
				
				return RunAssignmentPropagationSampleResult.measurementProcessingMs
			end, p42),
			measurementProcessedToLibraryPublication = p38.run(function()
				-- upvalues: runAssignmentPropagationSample (upval), p37 (copy), p40 (copy), p41 (copy), Items (copy), p42 (copy), Evidence (ref)
				local RunAssignmentPropagationSampleResult = runAssignmentPropagationSample(p37, p40, p41, Items, p42)
				Evidence = RunAssignmentPropagationSampleResult
				
				return RunAssignmentPropagationSampleResult.measurementProcessedToLibraryPublicationMs
			end, p42),
			libraryPublicationToHostObservation = p38.run(function()
				-- upvalues: runAssignmentPropagationSample (upval), p37 (copy), p40 (copy), p41 (copy), Items (copy), p42 (copy), Evidence (ref)
				local RunAssignmentPropagationSampleResult = runAssignmentPropagationSample(p37, p40, p41, Items, p42)
				Evidence = RunAssignmentPropagationSampleResult
				
				return RunAssignmentPropagationSampleResult.libraryPublicationToHostObservationMs
			end, p42),
			assignmentToHostObservation = p38.run(function()
				-- upvalues: runAssignmentPropagationSample (upval), p37 (copy), p40 (copy), p41 (copy), Items (copy), p42 (copy), Evidence (ref)
				local RunAssignmentPropagationSampleResult = runAssignmentPropagationSample(p37, p40, p41, Items, p42)
				Evidence = RunAssignmentPropagationSampleResult
				
				return RunAssignmentPropagationSampleResult.assignmentToHostObservationMs
			end, p42)
		},
		evidence = Evidence
	})
end

local Callback = nil

local function measureDeclarativeReconciliation(p37, p38, p39, ItemType, p40)
	-- upvalues: createItems (copy), observeCompletionPhases (copy), hasItemText (copy), ResponsibilityCatalogModule (copy)
	local Clock = p40.clock or os.clock
	local Folder = Instance.new("Folder")
	local Root = p37.ReactRoblox.createRoot(Folder)
	local UniformResult = p37.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local Items = createItems(20)
	local Items1 = createItems(20)
	
	for i, value in Items1 do
		value.text = `Reconciled {i}`
	end
	local function _(Items)
		return {
			items = Items,
			getItemKey = function(p41)
				return p41.id
			end
		}
	end
	
	local Data = {
		items = Items,
		getItemKey = function(p41)
			return p41.id
		end
	}
	local Diagnostics = nil
	local v18 = nil
	local v19 = 10
	p37.ReactRoblox.act(function()
		-- upvalues: Data (copy), UniformResult (copy), p37 (copy), ItemType (copy), Diagnostics (copy), v18 (copy), Root (copy), v19 (copy)
		local config = {
			overscan = 0,
			data = Data,
			layout = UniformResult,
			axis = p37.ViewRecycler.Axis.Y,
			itemType = ItemType,
			diagnostics = Diagnostics
		}
		
		if v18 ~= nil then
			for i, value in v18 do
				config[i] = value
			end
		end
		Root:render(p37.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, v19 * 40)
		}, {
			List = p37.React.createElement(p37.ViewRecycler.VirtualList, config)
		}))
	end)
	local Inverted = false
	local Reconciliations = 0
	local CompletionPhaseCounts = {}
	local Reconciled = ""
	local RunResult = p38.run(function()
		-- upvalues: Inverted (ref), Items1 (copy), Items (copy), Reconciled (ref), Clock (copy), p37 (copy), Root (copy), UniformResult (copy), ItemType (copy), observeCompletionPhases (upval), hasItemText (upval), Folder (copy), CompletionPhaseCounts (copy), Reconciliations (ref)
		Inverted = not Inverted
		Reconciled = if Inverted then "Reconciled 10" else "Item 10"
		local ClockResult = Clock()
		local Data = {
			items = if Inverted then Items1 else Items,
			getItemKey = function(p41)
				return p41.id
			end
		}
		local Diagnostics = nil
		local v20 = nil
		local v21 = 10
		p37.ReactRoblox.act(function()
			-- upvalues: Data (copy), UniformResult (copy), p37 (copy), ItemType (copy), Diagnostics (copy), v20 (copy), Root (copy), v21 (copy)
			local config = {
				overscan = 0,
				data = Data,
				layout = UniformResult,
				axis = p37.ViewRecycler.Axis.Y,
				itemType = ItemType,
				diagnostics = Diagnostics
			}
			
			if v20 ~= nil then
				for i, value in v20 do
					config[i] = value
				end
			end
			Root:render(p37.React.createElement("Frame", {
				Name = "BenchmarkHost",
				Size = UDim2.fromOffset(400, v21 * 40)
			}, {
				List = p37.React.createElement(p37.ViewRecycler.VirtualList, config)
			}))
		end)
		observeCompletionPhases(p37, {
			reconciledContentCommitted = function()
				-- upvalues: hasItemText (upval), Folder (upval), Reconciled (upval)
				return (hasItemText(Folder, Reconciled))
			end
		}, "declarative data reconciliation", CompletionPhaseCounts)
		Reconciliations += 1
		
		return (Clock() - ClockResult) * 1000
	end, p40)
	local ScrollingFrame = Folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(ScrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local Offset = ScrollingFrame.CanvasSize.Y.Offset
	p37.ReactRoblox.act(function()
		-- upvalues: Root (copy)
		Root:unmount()
	end)
	UniformResult.destroy()
	Folder:Destroy()
	
	return p39.create({
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

local function runDeclarativeDataReconciliation(p41, p42, p43, p44, p45)
	-- upvalues: createItemTypes (copy), Callback (ref), measureDeclarativeReconciliation (copy)
	local P144 = p44 or {}
	local ItemTypes, ItemTypes2 = createItemTypes(p41)
	assert(ItemTypes ~= ItemTypes2, "React benchmark Recyclable view types must have distinct identities")
	
	if p45 then
		Callback(p41, p42, p43, { sampleCount = 1, warmupCount = 0, bootstrapResamples = 0 })
	end
	return measureDeclarativeReconciliation(p41, p42, p43, ItemTypes, P144)
end

local function measurePropSynchronization(p41, p42, p43, ItemType, p44)
	-- upvalues: createItems (copy), observeCompletionPhases (copy), hasItemText (copy), ResponsibilityCatalogModule (copy)
	local Clock = p44.clock or os.clock
	local Folder = Instance.new("Folder")
	local Root = p41.ReactRoblox.createRoot(Folder)
	local UniformResult = p41.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local UniformResult1 = p41.ViewRecycler.Layout.uniform({ itemLength = 44 })
	local Items = createItems(20)
	local Items1 = createItems(21)
	Items1[1].text = "Replacement first"
	local SnapshotResult = p41.ViewRecycler.DataSource.snapshot(Items, function(p45)
		return p45.id
	end)
	local SnapshotResult1 = p41.ViewRecycler.DataSource.snapshot(Items1, function(p45)
		return p45.id
	end)
	local Diagnostics = nil
	local v20 = nil
	local v21 = 10
	p41.ReactRoblox.act(function()
		-- upvalues: SnapshotResult (copy), UniformResult (copy), p41 (copy), ItemType (copy), Diagnostics (copy), v20 (copy), Root (copy), v21 (copy)
		local config = {
			overscan = 0,
			data = SnapshotResult,
			layout = UniformResult,
			axis = p41.ViewRecycler.Axis.Y,
			itemType = ItemType,
			diagnostics = Diagnostics
		}
		
		if v20 ~= nil then
			for i, value in v20 do
				config[i] = value
			end
		end
		Root:render(p41.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, v21 * 40)
		}, {
			List = p41.React.createElement(p41.ViewRecycler.VirtualList, config)
		}))
	end)
	local Inverted = false
	local Replacements = 0
	local CompletionPhaseCounts = {}
	local FinalContentLength = 0
	local ReplacementFirst = ""
	local RunResult = p42.run(function()
		-- upvalues: Inverted (ref), SnapshotResult1 (copy), SnapshotResult (copy), UniformResult1 (copy), UniformResult (copy), FinalContentLength (ref), Items1 (copy), Items (copy), ReplacementFirst (ref), Clock (copy), p41 (copy), Root (copy), ItemType (copy), observeCompletionPhases (upval), hasItemText (upval), Folder (copy), CompletionPhaseCounts (copy), Replacements (ref)
		Inverted = not Inverted
		local SnapshotResult2 = if Inverted then SnapshotResult1 else SnapshotResult
		local UniformResult2 = if Inverted then UniformResult1 else UniformResult
		FinalContentLength = if Inverted then #Items1 * 44 else #Items * 40
		ReplacementFirst = if Inverted then "Replacement first" else "Item 1"
		local ClockResult = Clock()
		local Diagnostics = nil
		local v22 = nil
		local v23 = 10
		p41.ReactRoblox.act(function()
			-- upvalues: SnapshotResult2 (copy), UniformResult2 (copy), p41 (copy), ItemType (copy), Diagnostics (copy), v22 (copy), Root (copy), v23 (copy)
			local config = {
				overscan = 0,
				data = SnapshotResult2,
				layout = UniformResult2,
				axis = p41.ViewRecycler.Axis.Y,
				itemType = ItemType,
				diagnostics = Diagnostics
			}
			
			if v22 ~= nil then
				for i, value in v22 do
					config[i] = value
				end
			end
			Root:render(p41.React.createElement("Frame", {
				Name = "BenchmarkHost",
				Size = UDim2.fromOffset(400, v23 * 40)
			}, {
				List = p41.React.createElement(p41.ViewRecycler.VirtualList, config)
			}))
		end)
		observeCompletionPhases(p41, {
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
	end, p44)
	p41.ReactRoblox.act(function()
		-- upvalues: Root (copy)
		Root:unmount()
	end)
	UniformResult.destroy()
	Folder:Destroy()
	UniformResult1.destroy()
	
	return p43.create({
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

local function measureAssignmentBinding(p45, p46, p47, p48)
	-- upvalues: createItems (copy), hasItemText (copy), captureCompletionPhase (copy), observeCompletionPhases (copy), ResponsibilityCatalogModule (copy)
	local Clock = p48.clock or os.clock
	local Count = 0
	local Count1 = 0
	local RecyclableView = p45.ViewRecycler.createRecyclableView(function(p49)
		-- upvalues: Count (ref), p45 (copy)
		Count += 1
		
		return p45.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p45.SignalsReact.useSignalBinding(function(p50)
				-- upvalues: p49 (copy)
				return p49.itemSignal(p50).text
			end)
		})
	end, { readiness = "ReadyOnAssignment" })
	local Folder = Instance.new("Folder")
	local Root = p45.ReactRoblox.createRoot(Folder)
	local UniformResult = p45.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local SequenceResult = p45.ViewRecycler.DataSource.sequence(createItems(20), function(p49)
		return p49.id
	end)
	local config = {
		_instrumentation = {
			assignmentChanged = function(_, p49)
				-- upvalues: Count1 (ref)
				if p49 ~= nil then
					Count1 += 1
				end
			end
		}
	}
	local Diagnostics = nil
	local v22 = 10
	p45.ReactRoblox.act(function()
		-- upvalues: SequenceResult (copy), UniformResult (copy), p45 (copy), RecyclableView (copy), Diagnostics (copy), config (copy), Root (copy), v22 (copy)
		local config = {
			overscan = 0,
			data = SequenceResult,
			layout = UniformResult,
			axis = p45.ViewRecycler.Axis.Y,
			itemType = RecyclableView,
			diagnostics = Diagnostics
		}
		
		if config ~= nil then
			for i, value in config do
				config[i] = value
			end
		end
		Root:render(p45.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, v22 * 40)
		}, {
			List = p45.React.createElement(p45.ViewRecycler.VirtualList, config)
		}))
	end)
	local InitialRenders: number = Count
	local ScrollingFrame = Folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(ScrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local ScrollingFrame1 = ScrollingFrame
	local Inverted = true
	local DeliveredAssignments = 0
	local CompletionPhaseCounts = {}
	local RunResult = p46.run(function()
		-- upvalues: Inverted (ref), Count1 (ref), hasItemText (upval), Folder (copy), Clock (copy), p45 (copy), ScrollingFrame1 (copy), captureCompletionPhase (upval), CompletionPhaseCounts (copy), observeCompletionPhases (upval), DeliveredAssignments (ref)
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
		p45.ReactRoblox.act(function()
			-- upvalues: ScrollingFrame1 (upval), Y (copy), captureCompletionPhase (upval), config (copy), t (copy), CompletionPhaseCounts (upval)
			ScrollingFrame1.CanvasPosition = Vector2.new(0, Y)
			captureCompletionPhase(config, t, CompletionPhaseCounts, "afterMutation")
		end)
		observeCompletionPhases(p45, config, `binding delivery to {Item}`, CompletionPhaseCounts, t)
		DeliveredAssignments = Count1 - Count
		
		return (Clock() - ClockResult) * 1000
	end, p48)
	local FinalRenders: number = Count
	p45.ReactRoblox.act(function()
		-- upvalues: Root (copy)
		Root:unmount()
	end)
	UniformResult.destroy()
	Folder:Destroy()
	
	return p47.create({
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
	}), (p47.create({
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

local function createPresentationArm(p49, Readiness, HideWhilePending, Callback)
	-- upvalues: createItems (copy), hasItemText (copy), captureCompletionPhase (copy), observeCompletionPhases (copy)
	local RecyclableView = p49.ViewRecycler.createRecyclableView(if Readiness == "ReadyOnAssignment" then function(p50)
		-- upvalues: p49 (copy)
		return p49.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p49.SignalsReact.useSignalBinding(function(p51)
				-- upvalues: p50 (copy)
				return p50.itemSignal(p51).text
			end)
		})
	end else function(p50)
		-- upvalues: p49 (copy)
		return p49.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p49.SignalsReact.useSignalState(p50.itemSignal).text
		})
	end, {
		readiness = Readiness,
		hideWhilePending = HideWhilePending
	})
	local Folder = Instance.new("Folder")
	local Root = p49.ReactRoblox.createRoot(Folder)
	local UniformResult = p49.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local SequenceResult = p49.ViewRecycler.DataSource.sequence(createItems(20), function(p50)
		return p50.id
	end)
	local Diagnostics = nil
	local v23 = nil
	local v24 = 10
	p49.ReactRoblox.act(function()
		-- upvalues: SequenceResult (copy), UniformResult (copy), p49 (copy), RecyclableView (copy), Diagnostics (copy), v23 (copy), Root (copy), v24 (copy)
		local config = {
			overscan = 0,
			data = SequenceResult,
			layout = UniformResult,
			axis = p49.ViewRecycler.Axis.Y,
			itemType = RecyclableView,
			diagnostics = Diagnostics
		}
		
		if v23 ~= nil then
			for i, value in v23 do
				config[i] = value
			end
		end
		Root:render(p49.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, v24 * 40)
		}, {
			List = p49.React.createElement(p49.ViewRecycler.VirtualList, config)
		}))
	end)
	local ScrollingFrame = Folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(ScrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local ScrollingFrame1 = ScrollingFrame
	local Inverted = true
	local CompletionPhaseCounts = {}
	
	return {
		run = function()
			-- upvalues: Inverted (ref), hasItemText (upval), Folder (copy), Callback (copy), p49 (copy), ScrollingFrame1 (copy), captureCompletionPhase (upval), CompletionPhaseCounts (copy), observeCompletionPhases (upval)
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
			p49.ReactRoblox.act(function()
				-- upvalues: ScrollingFrame1 (upval), Y (copy), captureCompletionPhase (upval), config (copy), t (copy), CompletionPhaseCounts (upval)
				ScrollingFrame1.CanvasPosition = Vector2.new(0, Y)
				captureCompletionPhase(config, t, CompletionPhaseCounts, "afterMutation")
			end)
			observeCompletionPhases(p49, config, `presentation commit to {Item}`, CompletionPhaseCounts, t)
			
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
			-- upvalues: p49 (copy), Root (copy), UniformResult (copy), Folder (copy)
			p49.ReactRoblox.act(function()
				-- upvalues: Root (copy)
				Root:unmount()
			end)
			UniformResult.destroy()
			Folder:Destroy()
		end
	}
end

local function measurePresentationCommit(p50, p51, p52, p53)
	-- upvalues: createPresentationArm (copy), ResponsibilityCatalogModule (copy)
	local Clock = p53.clock or os.clock
	local ReadyOnCommit = createPresentationArm(p50, "ReadyOnCommit", false, Clock)
	local ReadyOnCommit1 = createPresentationArm(p50, "ReadyOnCommit", true, Clock)
	local ReadyOnAssignment = createPresentationArm(p50, "ReadyOnAssignment", false, Clock)
	local RunResult = p51.run(ReadyOnCommit.run, p53)
	local RunResult1 = p51.run(ReadyOnCommit1.run, p53)
	local RunResult2 = p51.run(ReadyOnAssignment.run, p53)
	local Evidence = {
		completionBarrier = "presentationCommitted",
		readyOnCommitVisible = ReadyOnCommit.getEvidence(),
		readyOnCommitHidden = ReadyOnCommit1.getEvidence(),
		readyOnAssignment = ReadyOnAssignment.getEvidence()
	}
	ReadyOnCommit.destroy()
	ReadyOnCommit1.destroy()
	ReadyOnAssignment.destroy()
	
	return p52.create({
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

local function measureVirtualListTeardown(p50, p51, p52, p53)
	-- upvalues: createItems (copy), observeCompletionPhases (copy), hasItemText (copy), ResponsibilityCatalogModule (copy)
	local Clock = p53.clock or os.clock
	local Evidence = {}
	
	return p52.create({
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
			viewRecycler = p51.run(function()
				-- upvalues: p50 (copy), createItems (upval), observeCompletionPhases (upval), hasItemText (upval), Clock (copy), Evidence (ref)
				local MountedRows = 0
				local UnmountedRows = 0
				local RecyclableView = p50.ViewRecycler.createRecyclableView(function(p54)
					-- upvalues: p50 (upval), MountedRows (ref), UnmountedRows (ref)
					local UseSignalStateResult = p50.SignalsReact.useSignalState(p54.itemSignal)
					p50.React.useEffect(function()
						-- upvalues: MountedRows (upval), UnmountedRows (upval)
						MountedRows += 1
						
						return function()
							-- upvalues: UnmountedRows (upval)
							UnmountedRows += 1
						end
					end, {})
					
					return p50.React.createElement("TextLabel", {
						Name = "Content",
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						Text = UseSignalStateResult.text
					})
				end, { readiness = "ReadyOnCommit", hideWhilePending = true })
				local Folder = Instance.new("Folder")
				local Root = p50.ReactRoblox.createRoot(Folder)
				local UniformResult = p50.ViewRecycler.Layout.uniform({ itemLength = 40 })
				local SnapshotResult = p50.ViewRecycler.DataSource.snapshot(createItems(20), function(p54)
					return p54.id
				end)
				local Diagnostics = nil
				local v25 = nil
				local v26 = 10
				p50.ReactRoblox.act(function()
					-- upvalues: SnapshotResult (copy), UniformResult (copy), p50 (copy), RecyclableView (copy), Diagnostics (copy), v25 (copy), Root (copy), v26 (copy)
					local config = {
						overscan = 0,
						data = SnapshotResult,
						layout = UniformResult,
						axis = p50.ViewRecycler.Axis.Y,
						itemType = RecyclableView,
						diagnostics = Diagnostics
					}
					
					if v25 ~= nil then
						for i, value in v25 do
							config[i] = value
						end
					end
					Root:render(p50.React.createElement("Frame", {
						Name = "BenchmarkHost",
						Size = UDim2.fromOffset(400, v26 * 40)
					}, {
						List = p50.React.createElement(p50.ViewRecycler.VirtualList, config)
					}))
				end)
				observeCompletionPhases(p50, {
					mounted = function()
						-- upvalues: MountedRows (ref), hasItemText (upval), Folder (copy)
						return MountedRows > 0 and hasItemText(Folder, "Item 10")
					end
				}, "VirtualList teardown setup", {})
				local ClockResult = Clock()
				p50.ReactRoblox.act(function()
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
			end, p53)
		},
		evidence = Evidence
	})
end

local function createRecyclingTransferArm(p54, Readiness, Callback)
	-- upvalues: findMeasuredObjects (copy), hasItemText (copy), captureCompletionPhase (copy), observeCompletionPhases (copy)
	local React = p54.React
	local SignalsReact = p54.SignalsReact
	local ViewRecycler = p54.ViewRecycler
	local Count = 0
	local Count1 = 0
	
	local function StatefulStructuralRow(p55)
		-- upvalues: p54 (copy), React (copy), Count (ref), Count1 (ref)
		local UseSignalStateResult = p54.SignalsReact.useSignalState(p55.itemSignal)
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
	
	local function StatefulBindingRow(p55)
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
			Text = SignalsReact.useSignalBinding(function(p56): string
				-- upvalues: p55 (copy), StatePreserved (copy)
				return `{p55.itemSignal(p56).text}:{StatePreserved}`
			end)
		})
	end
	
	local RecyclableView = ViewRecycler.createRecyclableView(if Readiness == "ReadyOnAssignment" then StatefulBindingRow else StatefulStructuralRow, {
		readiness = Readiness,
		hideWhilePending = Readiness == "ReadyOnCommit"
	})
	local SequenceResult = ViewRecycler.DataSource.sequence({ { id = "first", text = "First", height = 40 } }, function(p55)
		return p55.id
	end)
	local SequenceResult1 = ViewRecycler.DataSource.sequence({ { id = "second", text = "Second", height = 40 } }, function(p55)
		return p55.id
	end)
	local UniformResult = ViewRecycler.Layout.uniform({ itemLength = 40 })
	local UniformResult1 = ViewRecycler.Layout.uniform({ itemLength = 40 })
	local ScrollingFrameRef = { current = nil }
	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.fromOffset(400, 40)
	local Root = p54.ReactRoblox.createRoot(Frame)
	local ViewRecycler1 = p54.ViewRecycler
	local Flag = false
	local First = ""
	local v25 = nil
	local v26 = nil
	local Activations = 0
	local Deactivations = 0
	
	local function assignmentChanged(_, p55)
		-- upvalues: Flag (ref), Deactivations (ref), Activations (ref), First (ref), v25 (ref), Callback (copy)
		if Flag then
			if p55 == nil then
				Deactivations += 1
				
				return
			end
			Activations += 1
			
			if p55.key == First and v25 == nil then
				v25 = Callback()
			end
		end
	end
	
	local function presentationChanged(_, p55)
		-- upvalues: Flag (ref), First (ref), v26 (ref), Callback (copy)
		if Flag and p55 ~= nil and p55.key == First and v26 == nil then
			v26 = Callback()
		end
	end
	
	p54.ReactRoblox.act(function()
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
	local v27 = assert(Frame:FindFirstChild("FirstRoot", true))
	local v28 = assert(Frame:FindFirstChild("SecondRoot", true))
	local Inverted = true
	local CompletionPhaseCounts = {}
	local Transfers = 0
	local Milestones = {}
	
	return {
		run = function()
			-- upvalues: Inverted (ref), v27 (copy), v28 (copy), First (ref), v25 (ref), v26 (ref), Flag (ref), hasItemText (upval), Frame (copy), findMeasuredObjects (upval), Callback (copy), Frame1 (copy), ListItemViewFrame1 (copy), p54 (copy), ScrollingFrameRef (copy), captureCompletionPhase (upval), CompletionPhaseCounts (copy), observeCompletionPhases (upval), Transfers (ref), Milestones (ref)
			Inverted = not Inverted
			local FirstStatePreserved: string = if Inverted then "First:state-preserved" else "Second:state-preserved"
			local Ancestor = if Inverted then v27 else v28
			local Y: number = if Inverted then 0 else 40
			local v29: number = if Inverted then 400 else 200
			First = if Inverted then "first" else "second"
			v25 = nil
			v26 = nil
			Flag = true
			local v30 = nil
			local v31 = nil
			local config = {
				assignmentDelivered = function(): boolean
					-- upvalues: v25 (upval)
					return v25 ~= nil
				end,
				commitCompleted = function()
					-- upvalues: v26 (upval), hasItemText (upval), Frame (upval), FirstStatePreserved (copy)
					return v26 ~= nil and hasItemText(Frame, FirstStatePreserved)
				end,
				layoutSettled = function(): boolean
					-- upvalues: findMeasuredObjects (upval), Frame (upval), FirstStatePreserved (copy), v29 (copy), v30 (ref), Callback (upval)
					local MeasuredObjects = findMeasuredObjects(Frame, FirstStatePreserved)
					local IsMagnitudeBelow: boolean = MeasuredObjects ~= nil and math.abs(MeasuredObjects.AbsoluteSize.X - v29) <= 0.01
					
					if IsMagnitudeBelow and v30 == nil then
						v30 = Callback()
					end
					return IsMagnitudeBelow
				end,
				hostObserved = function(): boolean
					-- upvalues: findMeasuredObjects (upval), Frame (upval), FirstStatePreserved (copy), Frame1 (upval), Ancestor (copy), ListItemViewFrame1 (upval), v31 (ref), Callback (upval)
					local MeasuredObjects = findMeasuredObjects(Frame, FirstStatePreserved)
					local IsListItemViewFrameMatch: boolean = MeasuredObjects ~= nil and (MeasuredObjects == Frame1 and (MeasuredObjects:IsDescendantOf(Ancestor) and MeasuredObjects:FindFirstAncestor("ListItemViewFrame1") == ListItemViewFrame1))
					
					if IsListItemViewFrameMatch and v31 == nil then
						v31 = Callback()
					end
					return IsListItemViewFrameMatch
				end,
				destinationPresented = function(): boolean
					-- upvalues: findMeasuredObjects (upval), Frame (upval), FirstStatePreserved (copy), Frame1 (upval), Ancestor (copy), ListItemViewFrame1 (upval), v29 (copy)
					local MeasuredObjects = findMeasuredObjects(Frame, FirstStatePreserved)
					
					return MeasuredObjects ~= nil and (MeasuredObjects == Frame1 and (MeasuredObjects:IsDescendantOf(Ancestor) and (MeasuredObjects:FindFirstAncestor("ListItemViewFrame1") == ListItemViewFrame1 and math.abs(MeasuredObjects.AbsoluteSize.X - v29) <= 0.01)))
				end
			}
			local t = {}
			local CallbackResult = Callback()
			p54.ReactRoblox.act(function()
				-- upvalues: ScrollingFrameRef (upval), Y (copy), captureCompletionPhase (upval), config (copy), t (copy), CompletionPhaseCounts (upval)
				ScrollingFrameRef.current.CanvasPosition = Vector2.new(0, Y)
				captureCompletionPhase(config, t, CompletionPhaseCounts, "afterMutation")
			end)
			observeCompletionPhases(p54, config, `recycling transfer to {FirstStatePreserved}`, CompletionPhaseCounts, t)
			Transfers += 1
			Milestones = {
				assignmentMs = (assert(v25, "fixed-size transfer assignment was not delivered") - CallbackResult) * 1000,
				commitMs = (assert(v26, "fixed-size transfer presentation was not committed") - CallbackResult) * 1000,
				layoutMs = (assert(v30, "fixed-size transfer layout did not settle") - CallbackResult) * 1000,
				hostMs = (assert(v31, "fixed-size transfer host was not observed") - CallbackResult) * 1000
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
			-- upvalues: p54 (copy), Root (copy), UniformResult (copy), UniformResult1 (copy), Frame (copy)
			p54.ReactRoblox.act(function()
				-- upvalues: Root (upval)
				Root:unmount()
			end)
			UniformResult.destroy()
			UniformResult1.destroy()
			Frame:Destroy()
		end
	}
end

local function createWrappedRecyclingTransferArm(p54, Readiness, Callback)
	-- upvalues: waitForHeartbeatToSettle (copy), findMeasuredObjects (copy), hasItemText (copy), captureCompletionPhase (copy), observeCompletionPhases (copy)
	local React = p54.React
	local ViewRecycler = p54.ViewRecycler
	local Mounts = 0
	local Unmounts = 0
	local NewAccepted = 0
	local v25 = nil
	local v26 = nil
	local v27 = nil
	local v28 = nil
	local v29 = nil
	local RecyclableView = ViewRecycler.createRecyclableView(function(p55)
		-- upvalues: p54 (copy), React (copy), Mounts (ref), Unmounts (ref)
		local UseSignalStateResult = p54.SignalsReact.useSignalState(p55.itemSignal)
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
	local SequenceResult = ViewRecycler.DataSource.sequence({ { id = "first-wrapped", height = 40, text = Repeated } }, function(p55)
		return p55.id
	end)
	local SequenceResult1 = ViewRecycler.DataSource.sequence({ { id = "second-wrapped", height = 40, text = Repeated1 } }, function(p55)
		return p55.id
	end)
	local MeasuredResult = ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local MeasuredResult1 = ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local ScrollingFrameRef = { current = nil }
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Parent = game:GetService("CoreGui")
	local Root = p54.ReactRoblox.createRoot(ScreenGui)
	local Flag = false
	local FirstWrapped = ""
	
	local function assignmentChanged(_, p55)
		-- upvalues: Flag (ref), FirstWrapped (ref), v25 (ref), Callback (copy)
		if Flag and p55 ~= nil and p55.key == FirstWrapped and v25 == nil then
			v25 = Callback()
		end
	end
	
	local function presentationChanged(_, p55)
		-- upvalues: Flag (ref), FirstWrapped (ref), v26 (ref), Callback (copy)
		if Flag and p55 ~= nil and p55.key == FirstWrapped and v26 == nil then
			v26 = Callback()
		end
	end
	
	local function diagnostics(p55)
		-- upvalues: Flag (ref), v28 (ref), NewAccepted (ref), Callback (copy)
		if Flag and p55.kind == "measurementsProcessed" and p55.accepted > 0 and v28 == nil then
			NewAccepted += p55.accepted
			v28 = Callback()
		end
	end
	
	p54.ReactRoblox.act(function()
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
	waitForHeartbeatToSettle(p54)
	waitForHeartbeatToSettle(p54)
	local Object = assert(findMeasuredObjects(ScreenGui, `{Repeated}:state-preserved`))
	local ListItemViewFrame1 = Object:FindFirstAncestor("ListItemViewFrame1")
	local v30 = assert(ScreenGui:FindFirstChild("FirstRoot", true))
	local v31 = assert(ScreenGui:FindFirstChild("SecondRoot", true))
	local Inverted = true
	local CompletionPhaseCounts = {}
	local Transfers = 0
	local Milestones = {}
	
	return {
		run = function()
			-- upvalues: Inverted (ref), Repeated (copy), Repeated1 (copy), FirstWrapped (ref), v30 (copy), v31 (copy), MeasuredResult (copy), MeasuredResult1 (copy), v25 (ref), v26 (ref), v27 (ref), v28 (ref), v29 (ref), Callback (copy), Flag (ref), hasItemText (upval), ScreenGui (copy), findMeasuredObjects (upval), Object (copy), ListItemViewFrame1 (copy), p54 (copy), ScrollingFrameRef (copy), captureCompletionPhase (upval), CompletionPhaseCounts (copy), observeCompletionPhases (upval), Milestones (ref), Transfers (ref)
			Inverted = not Inverted
			local PreservedName: string = `{if Inverted then Repeated else Repeated1}:state-preserved`
			FirstWrapped = if Inverted then "first-wrapped" else "second-wrapped"
			local Ancestor = if Inverted then v30 else v31
			local Y: number = if Inverted then 0 else 40
			local v32: number = if Inverted then 400 else 200
			local MeasuredResult2 = if Inverted then MeasuredResult else MeasuredResult1
			v25 = nil
			v26 = nil
			v27 = nil
			v28 = nil
			v29 = nil
			local CallbackResult = Callback()
			Flag = true
			local config = {
				assignmentDelivered = function(): boolean
					-- upvalues: v25 (upval)
					return v25 ~= nil
				end,
				commitCompleted = function()
					-- upvalues: v26 (upval), hasItemText (upval), ScreenGui (upval), PreservedName (copy)
					return v26 ~= nil and hasItemText(ScreenGui, PreservedName)
				end,
				layoutSettled = function(): boolean
					-- upvalues: findMeasuredObjects (upval), ScreenGui (upval), PreservedName (copy), v32 (copy), v27 (upval), Callback (upval)
					local MeasuredObjects, MeasuredObjects2 = findMeasuredObjects(ScreenGui, PreservedName)
					local IsYAbove: boolean = MeasuredObjects ~= nil and (MeasuredObjects2 ~= nil and (MeasuredObjects.AbsoluteSize.X == v32 - 20 and (MeasuredObjects.AbsoluteSize.Y > 0 and MeasuredObjects2.AbsoluteSize.Y > 0)))
					
					if IsYAbove and v27 == nil then
						v27 = Callback()
					end
					return IsYAbove
				end,
				measurementSettled = function(): boolean
					-- upvalues: findMeasuredObjects (upval), ScreenGui (upval), PreservedName (copy), MeasuredResult2 (copy), v28 (upval), Callback (upval)
					local MeasuredObjects, MeasuredObjects2 = findMeasuredObjects(ScreenGui, PreservedName)
					local IsMagnitudeBelow: boolean = MeasuredObjects ~= nil and (MeasuredObjects2 ~= nil and math.abs(MeasuredResult2.getItemLayout(1).length - MeasuredObjects2.AbsoluteSize.Y) <= 0.01)
					
					if IsMagnitudeBelow and v28 == nil then
						v28 = Callback()
					end
					return IsMagnitudeBelow
				end,
				hostObserved = function(): boolean
					-- upvalues: findMeasuredObjects (upval), ScreenGui (upval), PreservedName (copy), Object (upval), Ancestor (copy), ListItemViewFrame1 (upval), v29 (upval), Callback (upval)
					local MeasuredObjects = findMeasuredObjects(ScreenGui, PreservedName)
					local IsListItemViewFrameMatch: boolean = MeasuredObjects ~= nil and (MeasuredObjects == Object and (MeasuredObjects:IsDescendantOf(Ancestor) and MeasuredObjects:FindFirstAncestor("ListItemViewFrame1") == ListItemViewFrame1))
					
					if IsListItemViewFrameMatch and v29 == nil then
						v29 = Callback()
					end
					return IsListItemViewFrameMatch
				end
			}
			local t = {}
			p54.ReactRoblox.act(function()
				-- upvalues: ScrollingFrameRef (upval), Y (copy), captureCompletionPhase (upval), config (copy), t (copy), CompletionPhaseCounts (upval)
				ScrollingFrameRef.current.CanvasPosition = Vector2.new(0, Y)
				captureCompletionPhase(config, t, CompletionPhaseCounts, "afterMutation")
			end)
			observeCompletionPhases(p54, config, function(): string
				-- upvalues: findMeasuredObjects (upval), ScreenGui (upval), PreservedName (copy), FirstWrapped (upval), v25 (upval), v26 (upval), v27 (upval), v28 (upval), v29 (upval), v32 (copy)
				local MeasuredObjects, MeasuredObjects2 = findMeasuredObjects(ScreenGui, PreservedName)
				
				return `wrapped recycling transfer to {FirstWrapped}; assignment={v25 ~= nil}, commit={v26 ~= nil}, content={MeasuredObjects ~= nil}, layout={v27 ~= nil}, measurement={v28 ~= nil}, host={v29 ~= nil}, contentWidth={if MeasuredObjects == nil then "nil" else MeasuredObjects.AbsoluteSize.X}, expectedWidth={v32 - 20}, hostHeight={if MeasuredObjects2 == nil then "nil" else MeasuredObjects2.AbsoluteSize.Y}`
			end, CompletionPhaseCounts, t)
			Milestones = {
				assignmentMs = (assert(v25, "wrapped transfer assignment was not delivered") - CallbackResult) * 1000,
				commitMs = (assert(v26, "wrapped transfer presentation was not committed") - CallbackResult) * 1000,
				layoutMs = (assert(v27, "wrapped transfer layout did not settle") - CallbackResult) * 1000,
				measurementMs = (assert(v28, "wrapped transfer measurement was not settled") - CallbackResult) * 1000,
				hostMs = (assert(v29, "wrapped transfer host was not observed") - CallbackResult) * 1000
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
			-- upvalues: p54 (copy), Root (copy), MeasuredResult (copy), MeasuredResult1 (copy), ScreenGui (copy)
			p54.ReactRoblox.act(function()
				-- upvalues: Root (upval)
				Root:unmount()
			end)
			MeasuredResult.destroy()
			MeasuredResult1.destroy()
			ScreenGui:Destroy()
		end
	}
end

Callback = function(p55, p56, p57, p58)
	-- upvalues: createRecyclingTransferArm (copy), createWrappedRecyclingTransferArm (copy), ResponsibilityCatalogModule (copy)
	local Clock = p58.clock or os.clock
	local ReadyOnCommit = createRecyclingTransferArm(p55, "ReadyOnCommit", Clock)
	local ReadyOnAssignment = createRecyclingTransferArm(p55, "ReadyOnAssignment", Clock)
	local ReadyOnCommit1 = createWrappedRecyclingTransferArm(p55, "ReadyOnCommit", Clock)
	local ReadyOnAssignment1 = createWrappedRecyclingTransferArm(p55, "ReadyOnAssignment", Clock)
	local RunResult = p56.run(ReadyOnCommit.run, p58)
	local RunResult1 = p56.run(ReadyOnAssignment.run, p58)
	local RunResult2 = p56.run(ReadyOnCommit1.run, p58)
	local RunResult3 = p56.run(ReadyOnAssignment1.run, p58)
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
	
	return p57.create({
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
	}), p57.create({
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
	}), (p57.create({
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

local function measureRecyclingScopeHighWater(p55, p56, p57, Items, p58)
	-- upvalues: ResponsibilityCatalogModule (copy)
	local Clock = p58.clock or os.clock
	local Evidence = {}
	
	return p57.create({
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
			viewRecycler = p56.run(function()
				-- upvalues: p55 (copy), Items (copy), Clock (copy), Evidence (ref)
				local RecyclingScopeHighWaterResult, RecyclingScopeHighWaterResult2 = p55.LifecycleWorkloads.recyclingScopeHighWater(Items, Clock)
				Evidence = RecyclingScopeHighWaterResult2
				
				return RecyclingScopeHighWaterResult
			end, p58)
		},
		evidence = Evidence
	})
end

local function measureCompositionChurn(p55, p56, p57, CoalescedUpdates, p58)
	-- upvalues: ResponsibilityCatalogModule (copy)
	local Clock = p58.clock or os.clock
	local CompositionChurnResult = p55.LifecycleWorkloads.compositionChurn(CoalescedUpdates)
	local AssignmentUpdatesDelta = 0
	local FlushesDelta = 0
	local RunResult = p56.run(function()
		-- upvalues: CompositionChurnResult (copy), Clock (copy), AssignmentUpdatesDelta (ref), FlushesDelta (ref)
		local AssignmentUpdates = CompositionChurnResult.getAssignmentUpdates()
		local Flushes = CompositionChurnResult.getFlushes()
		local ClockResult = Clock()
		CompositionChurnResult.run()
		local ScaledClockResult = (Clock() - ClockResult) * 1000
		AssignmentUpdatesDelta = CompositionChurnResult.getAssignmentUpdates() - AssignmentUpdates
		FlushesDelta = CompositionChurnResult.getFlushes() - Flushes
		
		return ScaledClockResult
	end, p58)
	CompositionChurnResult.destroy()
	
	return p57.create({
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

local function measureCompositionBatchSettlement(p55, p56, p57, Items, p58)
	-- upvalues: ResponsibilityCatalogModule (copy)
	local Clock = p58.clock or os.clock
	local CompositionChurnResult = p55.LifecycleWorkloads.compositionChurn(Items)
	local AssignmentUpdatesDelta = 0
	local FlushesDelta = 0
	local ReactInvalidationsDelta = 0
	local RunResult = p56.run(function()
		-- upvalues: CompositionChurnResult (copy), Clock (copy), AssignmentUpdatesDelta (ref), FlushesDelta (ref), ReactInvalidationsDelta (ref)
		local AssignmentUpdates = CompositionChurnResult.getAssignmentUpdates()
		local Flushes = CompositionChurnResult.getFlushes()
		local ReactInvalidations = CompositionChurnResult.getReactInvalidations()
		local ClockResult = Clock()
		CompositionChurnResult.runBatchSettlement()
		local ScaledClockResult = (Clock() - ClockResult) * 1000
		AssignmentUpdatesDelta = CompositionChurnResult.getAssignmentUpdates() - AssignmentUpdates
		FlushesDelta = CompositionChurnResult.getFlushes() - Flushes
		ReactInvalidationsDelta = CompositionChurnResult.getReactInvalidations() - ReactInvalidations
		
		return ScaledClockResult
	end, p58)
	CompositionChurnResult.destroy()
	
	return p57.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "integrated",
		workload = "composed-recyclable-batch-settlement",
		description = "Rekeys composed destinations and settles their Assignments before one Recycling batch returns.",
		responsibility = ResponsibilityCatalogModule.React.Composition,
		scale = { items = Items, parentReassignments = Items },
		timing = {
			unit = "ms",
			basis = "compositionPlacementBatch",
			includesSchedulerWaits = false,
			operationsPerSample = Items
		},
		arms = { viewRecycler = RunResult },
		evidence = {
			assignmentUpdates = AssignmentUpdatesDelta,
			placementFlushes = FlushesDelta,
			reactInvalidations = ReactInvalidationsDelta,
			completionPhaseCounts = { compositionPublication = { synchronousBatch = 1 } }
		}
	})
end

local function measureWarmPagination(p55, p56, p57, p58)
	-- upvalues: createItems (copy), observeCompletionPhases (copy), hasItemText (copy), waitForHeartbeatToSettle (copy), findMeasuredObjects (copy), ResponsibilityCatalogModule (copy)
	local Clock = p58.clock or os.clock
	local Items = createItems(500)
	local Buffer = table.create(20)
	
	for i = 1, 20 do
		Buffer[i] = { height = 40, id = `older{i}`, text = `Older {i}` }
	end
	local Count = 0
	local Count1 = 0
	local Count2 = 0
	local Count3 = 0
	local KeyResolutions = 0
	local RecyclableView = p55.ViewRecycler.createRecyclableView(function(p59)
		-- upvalues: Count (ref), p55 (copy), Count2 (ref), Count3 (ref)
		Count += 1
		local UseRecyclingIndexResult = p55.ViewRecycler.useRecyclingIndex()
		
		return p55.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p55.SignalsReact.useSignalBinding(function(p60)
				-- upvalues: Count2 (upval), p59 (copy)
				Count2 += 1
				
				return p59.itemSignal(p60).text
			end),
			LayoutOrder = p55.SignalsReact.useSignalBinding(function(p60)
				-- upvalues: Count3 (upval), UseRecyclingIndexResult (copy)
				Count3 += 1
				
				return UseRecyclingIndexResult(p60) or 0
			end)
		})
	end, { readiness = "ReadyOnAssignment" })
	local DequeResult = p55.ViewRecycler.DataSource.deque(Items, function(p59)
		-- upvalues: KeyResolutions (ref)
		KeyResolutions += 1
		
		return p59.id
	end)
	local MeasuredResult = p55.ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Parent = game:GetService("CoreGui")
	local Root = p55.ReactRoblox.createRoot(ScreenGui)
	local config = { data = 0, measurement = 0, programmaticScroll = 0 }
	
	local function Diagnostics(p59)
		-- upvalues: config (copy)
		if p59.kind == "scrollCorrection" then
			local Source = p59.source
			config[Source] += p59.delta
		end
	end
	
	local config1 = {
		_instrumentation = {
			assignmentChanged = function(_, p59)
				-- upvalues: Count1 (ref)
				if p59 ~= nil and string.sub(p59.key, 1, 4) == "item" then
					Count1 += 1
				end
			end
		}
	}
	local v33 = 10
	p55.ReactRoblox.act(function()
		-- upvalues: DequeResult (copy), MeasuredResult (copy), p55 (copy), RecyclableView (copy), Diagnostics (copy), config1 (copy), Root (copy), v33 (copy)
		local config = {
			overscan = 0,
			data = DequeResult,
			layout = MeasuredResult,
			axis = p55.ViewRecycler.Axis.Y,
			itemType = RecyclableView,
			diagnostics = Diagnostics
		}
		
		if config1 ~= nil then
			for i, value in config1 do
				config[i] = value
			end
		end
		Root:render(p55.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, v33 * 40)
		}, {
			List = p55.React.createElement(p55.ViewRecycler.VirtualList, config)
		}))
	end)
	local ScrollingFrame = ScreenGui:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(ScrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local ScrollFrame = ScrollingFrame
	p55.ReactRoblox.act(function()
		-- upvalues: ScrollFrame (copy)
		ScrollFrame.CanvasPosition = Vector2.new(0, 9960)
	end)
	observeCompletionPhases(p55, {
		anchorVisible = function()
			-- upvalues: hasItemText (upval), ScreenGui (copy)
			return (hasItemText(ScreenGui, "Item 250"))
		end
	}, "warm pagination anchor", {})
	waitForHeartbeatToSettle(p55)
	waitForHeartbeatToSettle(p55)
	local Evidence = {}
	local RunResult = p56.run(function()
		-- upvalues: ScreenGui (copy), findMeasuredObjects (upval), ScrollFrame (copy), Count (ref), Count1 (ref), Count2 (ref), Count3 (ref), config (copy), KeyResolutions (ref), Clock (copy), p55 (copy), DequeResult (copy), Buffer (copy), waitForHeartbeatToSettle (upval), Evidence (ref)
		local _, Item2502 = findMeasuredObjects(ScreenGui, "Item 250")
		local NewY = nil
		
		if Item2502 == nil then
			NewY = nil
		else
			local ScrollingFrame = Item2502:FindFirstAncestorWhichIsA("ScrollingFrame")
			NewY = Item2502.AbsolutePosition.Y - ScrollingFrame.AbsolutePosition.Y + ScrollingFrame.CanvasPosition.Y
		end
		local v34 = assert(NewY) - ScrollFrame.CanvasPosition.Y
		local Offset = ScrollFrame.CanvasSize.Y.Offset
		local Count4 = Count
		local Count5 = Count1
		local Count6 = Count2
		local Count7 = Count3
		local Data = config.data
		local Measurement = config.measurement
		KeyResolutions = 0
		local ClockResult = Clock()
		p55.ReactRoblox.act(function()
			-- upvalues: DequeResult (upval), Buffer (upval)
			DequeResult.pushFrontMany(Buffer)
		end)
		waitForHeartbeatToSettle(p55)
		waitForHeartbeatToSettle(p55)
		local ScaledClockResult = (Clock() - ClockResult) * 1000
		local _, Item2502_1 = findMeasuredObjects(ScreenGui, "Item 250")
		local NewY1 = nil
		
		if Item2502_1 == nil then
			NewY1 = nil
		else
			local ScrollingFrame = Item2502_1:FindFirstAncestorWhichIsA("ScrollingFrame")
			NewY1 = Item2502_1.AbsolutePosition.Y - ScrollingFrame.AbsolutePosition.Y + ScrollingFrame.CanvasPosition.Y
		end
		Evidence = {
			retainedItems = 500,
			insertedItems = 20,
			completionBarrier = "twoHeartbeatMeasurementSettlement",
			keyResolutions = KeyResolutions,
			retainedRowRenders = Count - Count4,
			retainedAssignmentCallbacks = Count1 - Count5,
			retainedContentDeliveries = Count2 - Count6,
			indexPublications = Count3 - Count7,
			dataAnchorCorrection = config.data - Data,
			measurementAnchorCorrection = config.measurement - Measurement,
			finalAnchorDrift = assert(NewY1) - ScrollFrame.CanvasPosition.Y - v34,
			initialCanvasLength = Offset,
			finalCanvasLength = ScrollFrame.CanvasSize.Y.Offset,
			finalScrollOffset = ScrollFrame.CanvasPosition.Y,
			dataSourceItems = DequeResult.getItemCount()
		}
		assert(Evidence.keyResolutions == 20, "bulk prepend resolved keys outside the inserted page")
		assert(Evidence.retainedRowRenders == 0, "bulk prepend rerendered a retained row")
		assert(Evidence.retainedAssignmentCallbacks == 0, "bulk prepend republished a retained Assignment")
		assert(Evidence.indexPublications > 0, "bulk prepend did not publish current retained indices")
		assert(Evidence.retainedContentDeliveries == 0, "bulk prepend republished content for retained rows whose item did not change")
		assert(math.abs(Evidence.finalAnchorDrift - 0) <= 0.01, "bulk prepend moved the retained anchor")
		assert(Evidence.dataSourceItems == 520, "bulk prepend published the wrong item count")
		assert(Evidence.initialCanvasLength < Evidence.finalCanvasLength, "bulk prepend did not increase the imperative Canvas length")
		p55.ReactRoblox.act(function()
			-- upvalues: DequeResult (upval)
			DequeResult.transaction(function()
				-- upvalues: DequeResult (upval)
				for _ = 1, 20 do
					DequeResult.popFront()
				end
			end)
		end)
		waitForHeartbeatToSettle(p55)
		waitForHeartbeatToSettle(p55)
		
		return ScaledClockResult
	end, p58)
	p55.ReactRoblox.act(function()
		-- upvalues: Root (copy)
		Root:unmount()
	end)
	MeasuredResult.destroy()
	ScreenGui:Destroy()
	
	return p57.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "integrated",
		workload = "warm-bulk-prepend-settlement",
		description = "Prepends 20 rows to a warm measured 500-row deque and waits through measurement settlement.",
		responsibility = ResponsibilityCatalogModule.React.DataReconciliation,
		scale = {
			retainedItems = 500,
			insertedItems = 20,
			visibleRows = 10
		},
		timing = {
			unit = "ms",
			basis = "bulkPrependThroughMeasurementSettlement",
			operationsPerSample = 20,
			includesSchedulerWaits = true
		},
		arms = { viewRecycler = RunResult },
		evidence = Evidence
	})
end

local function createPageItems(Newer, p59: number)
	local Buffer = table.create(20)
	
	for i = 1, 20 do
		local IDelta = p59 + i - 1
		Buffer[i] = {
			id = `{Newer}{IDelta}`,
			text = `{Newer} {IDelta}`,
			height = IDelta % 5 * 2 + 36
		}
	end
	return Buffer
end

local _ = function(Tbl)
	if #Tbl == 0 then
		return 0
	else
		local Copy = table.clone(Tbl)
		table.sort(Copy)
		
		return Copy[math.ceil(#Copy / 2)]
	end
end

local function measureScrollPaginationArm(p60, p61, ItemType, p62, p63)
	-- upvalues: createItems (copy), createPageItems (copy), waitForHeartbeatToSettle (copy), flushDeferredWork (copy)
	local React = p60.React
	local ReactRoblox = p60.ReactRoblox
	local ViewRecycler = p60.ViewRecycler
	local Clock = p63.clock or os.clock
	local IsEnd = p62.edge == "end"
	local IsNotPreloaded = p62.source ~= "preloaded"
	local Count = 0
	
	local function getItemKey(p64)
		-- upvalues: Count (ref)
		Count += 1
		
		return p64.id
	end
	
	local Items = createItems(if IsNotPreloaded then 200 else 4200)
	local DequeResult = if p62.source == "deque" then ViewRecycler.DataSource.deque(Items, getItemKey) else nil
	local Callback = nil
	local Flag = false
	local PagesDelivered = 0
	local Count1 = 0
	
	local function deliverPage()
		-- upvalues: createPageItems (upval), IsEnd (copy), Count1 (ref), DequeResult (copy), Callback (ref), PagesDelivered (ref), Flag (ref)
		local PageItems = createPageItems(if IsEnd then "newer" else "older", Count1 + 1)
		Count1 += 20
		
		if DequeResult == nil then
			Callback(function(p64)
				-- upvalues: IsEnd (upval), PageItems (copy)
				local Buffer = table.create(#p64 + 20)
				
				if IsEnd then
					table.move(p64, 1, #p64, 1, Buffer)
					table.move(PageItems, 1, 20, #p64 + 1, Buffer)
					
					return Buffer
				else
					table.move(PageItems, 1, 20, 1, Buffer)
					table.move(p64, 1, #p64, 21, Buffer)
					
					return Buffer
				end
			end)
		elseif IsEnd then
			DequeResult.pushBackMany(PageItems)
		else
			DequeResult.pushFrontMany(PageItems)
		end
		PagesDelivered += 1
		Flag = false
	end
	
	local function requestPage()
		-- upvalues: Flag (ref), deliverPage (copy)
		if not Flag then
			Flag = true
			task.defer(deliverPage)
			
			return
		end
	end
	
	local MeasuredResult = ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	
	local function PaginationHost()
		-- upvalues: React (copy), Items (copy), Callback (ref), ViewRecycler (copy), DequeResult (copy), getItemKey (copy), MeasuredResult (copy), ItemType (copy), IsNotPreloaded (copy), IsEnd (copy), requestPage (copy)
		local UseStateResult, UseStateResult2 = React.useState(Items)
		Callback = UseStateResult2
		
		return React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, 400)
		}, {
			List = React.createElement(ViewRecycler.VirtualList, {
				overscan = 0,
				startReachedThreshold = 200,
				endReachedThreshold = 200,
				data = DequeResult or { items = UseStateResult, getItemKey = getItemKey },
				layout = MeasuredResult,
				axis = ViewRecycler.Axis.Y,
				itemType = ItemType,
				onStartReached = if IsNotPreloaded and not IsEnd then requestPage else nil,
				onEndReached = if IsNotPreloaded and IsEnd then requestPage else nil
			})
		})
	end
	
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Parent = game:GetService("CoreGui")
	local Root = ReactRoblox.createRoot(ScreenGui)
	ReactRoblox.act(function()
		-- upvalues: Root (copy), React (copy), PaginationHost (copy)
		Root:render(React.createElement(PaginationHost))
	end)
	waitForHeartbeatToSettle(p60)
	local ScrollingFrame = ScreenGui:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(ScrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	
	local function _(): number
		-- upvalues: IsNotPreloaded (copy), IsEnd (copy), ScrollingFrame (copy)
		return if IsNotPreloaded then if IsEnd then math.max(0, ScrollingFrame.CanvasSize.Y.Offset - 400 - 800) else 800 else 0
	end
	
	local _ = function(Y)
		-- upvalues: ReactRoblox (copy), ScrollingFrame (copy), flushDeferredWork (upval)
		ReactRoblox.act(function()
			-- upvalues: ScrollingFrame (upval), Y (copy)
			ScrollingFrame.CanvasPosition = Vector2.new(0, Y)
		end)
		ReactRoblox.act(flushDeferredWork)
	end
	
	local Largest: number = if IsNotPreloaded then if IsEnd then math.max(0, ScrollingFrame.CanvasSize.Y.Offset - 400 - 800) else 800 else 0
	ReactRoblox.act(function()
		-- upvalues: ScrollingFrame (copy), Largest (copy)
		ScrollingFrame.CanvasPosition = Vector2.new(0, Largest)
	end)
	ReactRoblox.act(flushDeferredWork)
	waitForHeartbeatToSettle(p60)
	waitForHeartbeatToSettle(p60)
	local v34: number = if IsEnd then 40 else -40
	local Amounts = {}
	local Amounts1 = {}
	local Tbl = {}
	local Tbl1 = {}
	local KeyReadsPerPage = 0
	local RunResult = p61.run(function(): number
		-- upvalues: IsNotPreloaded (copy), ScrollingFrame (copy), IsEnd (copy), ReactRoblox (copy), flushDeferredWork (upval), waitForHeartbeatToSettle (upval), p60 (copy), PagesDelivered (ref), v34 (copy), Count (ref), Clock (copy), KeyReadsPerPage (ref), Amounts (copy), Amounts1 (copy), Tbl (copy), Tbl1 (copy)
		if not IsNotPreloaded and ScrollingFrame.CanvasSize.Y.Offset - 400 < ScrollingFrame.CanvasPosition.Y + 1600 then
			local Largest: number = if IsNotPreloaded then if IsEnd then math.max(0, ScrollingFrame.CanvasSize.Y.Offset - 400 - 800) else 800 else 0
			ReactRoblox.act(function()
				-- upvalues: ScrollingFrame (upval), Largest (copy)
				ScrollingFrame.CanvasPosition = Vector2.new(0, Largest)
			end)
			ReactRoblox.act(flushDeferredWork)
			waitForHeartbeatToSettle(p60)
		end
		local Total = 0
		
		for i = 1, 20 do
			local PagesDelivered1 = PagesDelivered
			local Largest1 = math.max(0, ScrollingFrame.CanvasPosition.Y + v34)
			Count = 0
			local GcinfoResult = gcinfo()
			local ClockResult = Clock()
			ReactRoblox.act(function()
				-- upvalues: ScrollingFrame (upval), Largest1 (copy)
				ScrollingFrame.CanvasPosition = Vector2.new(0, Largest1)
			end)
			ReactRoblox.act(flushDeferredWork)
			local ScaledClockResult = (Clock() - ClockResult) * 1000
			local GcinfoResultDelta = gcinfo() - GcinfoResult
			Total += ScaledClockResult
			local IsPagesDeliveredBelow = PagesDelivered1 < PagesDelivered
			
			if IsPagesDeliveredBelow then
				KeyReadsPerPage = Count
				table.insert(Amounts, ScaledClockResult)
			else
				table.insert(Amounts1, ScaledClockResult)
			end
			if GcinfoResultDelta >= 0 then
				table.insert(if IsPagesDeliveredBelow then Tbl else Tbl1, GcinfoResultDelta)
			end
			if i % 5 == 0 then
				waitForHeartbeatToSettle(p60)
			end
		end
		return Total
	end, p63)
	local NewCount = if DequeResult == nil then Count1 + #Items else DequeResult.getItemCount()
	p60.ReactRoblox.act(function()
		-- upvalues: Root (copy)
		Root:unmount()
	end)
	MeasuredResult.destroy()
	ScreenGui:Destroy()
	local config = {
		pagesDelivered = PagesDelivered,
		finalItemCount = NewCount,
		keyReadsPerPage = KeyReadsPerPage
	}
	local PageStepMedianMs = nil
	
	if #Amounts == 0 then
		PageStepMedianMs = 0
	else
		local Copy = table.clone(Amounts)
		table.sort(Copy)
		PageStepMedianMs = Copy[math.ceil(#Copy / 2)]
	end
	config.pageStepMedianMs = PageStepMedianMs
	local Entry = nil
	
	if #Amounts1 == 0 then
		Entry = 0
	else
		local Copy = table.clone(Amounts1)
		table.sort(Copy)
		Entry = Copy[math.ceil(#Copy / 2)]
	end
	config.scrollStepMedianMs = Entry
	local Entry1 = nil
	
	if #Tbl == 0 then
		Entry1 = 0
	else
		local Copy = table.clone(Tbl)
		table.sort(Copy)
		Entry1 = Copy[math.ceil(#Copy / 2)]
	end
	config.pageStepMedianAllocatedKb = Entry1
	local Entry2 = nil
	
	if #Tbl1 == 0 then
		Entry2 = 0
	else
		local Copy = table.clone(Tbl1)
		table.sort(Copy)
		Entry2 = Copy[math.ceil(#Copy / 2)]
	end
	config.scrollStepMedianAllocatedKb = Entry2
	
	return RunResult, config
end

local function measureScrollPagination(p64, p65, p66, p67)
	-- upvalues: createItemTypes (copy), measureScrollPaginationArm (copy), ResponsibilityCatalogModule (copy)
	local _, ItemTypes2 = createItemTypes(p64)
	local config = {
		preloaded = { source = "preloaded", edge = "end" },
		declarativeAppend = { source = "declarative", edge = "end" },
		dequeAppend = { source = "deque", edge = "end" },
		declarativePrepend = { source = "declarative", edge = "start" },
		dequePrepend = { source = "deque", edge = "start" }
	}
	local Arms = {}
	local Evidence = {}
	
	for _, value in {
		"preloaded",
		"declarativeAppend",
		"dequeAppend",
		"declarativePrepend",
		"dequePrepend"
	} do
		Arms[value], Evidence[value] = measureScrollPaginationArm(p64, p65, ItemTypes2, config[value], p67)
	end
	Evidence.completionBarrier = "synchronousScrollAndDeferredPageDelivery"
	
	return p66.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "scroll-pagination",
		description = "Scrolls a measured VirtualList one row per step toward an edge whose reached callback delivers the next page, compared with scrolling preloaded items.",
		responsibility = ResponsibilityCatalogModule.React.MountScroll,
		scale = {
			initialItems = 200,
			pageSize = 20,
			stepsPerSample = 20,
			visibleRows = 10,
			layout = "measured"
		},
		timing = {
			unit = "ms",
			basis = "synchronousScrollStepsAcrossOnePage",
			operationsPerSample = 20,
			includesSchedulerWaits = false
		},
		arms = Arms,
		evidence = Evidence
	})
end

local function runRecyclingStateMount(p68, p69, p70, p71)
	-- upvalues: measureRecyclingStateMountOverhead (copy), createItems (copy)
	local P247 = p71 or {}
	local ItemCount = P247.itemCount or 1000
	local RecyclingStateVisibleRows = P247.recyclingStateVisibleRows or 40
	assert(ItemCount >= 1 and ItemCount % 1 == 0, "itemCount must be a positive integer")
	assert(RecyclingStateVisibleRows >= 1 and RecyclingStateVisibleRows <= ItemCount and RecyclingStateVisibleRows % 1 == 0, "recyclingStateVisibleRows must be an integer within itemCount")
	
	return measureRecyclingStateMountOverhead(p68, p69, p70, createItems(ItemCount), RecyclingStateVisibleRows, P247)
end

return {
	run = function(p68, p69, p70, p71)
		-- upvalues: list (copy), createItems (copy), createItemTypes (copy), measureCompletedMount (copy), measureCompletedTraversal (copy), measureHostSizeSettlePhases (copy), measureAssignmentPropagation (copy), createPropagationScenario (copy), Callback (ref), measureRecyclingScopeHighWater (copy), measureCompositionChurn (copy), measureDeclarativeReconciliation (copy), measurePropSynchronization (copy), measureAssignmentBinding (copy), measurePresentationCommit (copy), measureVirtualListTeardown (copy), runRecyclingStateMount (copy), measureCompositionBatchSettlement (copy), measureWarmPagination (copy), measureExpensiveUniformTraversalComparison (copy), measureStatefulAssignmentRenderControl (copy), measureScrollPagination (copy)
		local P251 = p71 or {}
		local ItemCount = P251.itemCount or 1000
		local ScrollStepCount = P251.scrollStepCount or 10
		local MountVisibleRows = P251.mountVisibleRows or list
		local LifecycleItemCount = P251.lifecycleItemCount or 40
		local PropagationItemCount = P251.propagationItemCount or 1000
		assert(ItemCount >= 10 and ItemCount % 1 == 0, "itemCount must be an integer of at least 10")
		assert(ScrollStepCount >= 1 and ScrollStepCount % 1 == 0, "scrollStepCount must be a positive integer")
		assert(PropagationItemCount >= 20 and PropagationItemCount % 1 == 0, "propagationItemCount must be an integer of at least 20")
		local Items = createItems(ItemCount)
		local ItemTypes, ItemTypes2 = createItemTypes(p68)
		local List = {}
		
		for _, mountVisibleRow in ipairs(MountVisibleRows) do
			assert(mountVisibleRow >= 1 and mountVisibleRow <= ItemCount, "mount visible-row scale is out of range")
			table.insert(List, measureCompletedMount(p68, p69, p70, Items, ItemTypes, mountVisibleRow, P251))
		end
		table.insert(List, measureCompletedTraversal(p68, p69, p70, Items, ItemTypes, ItemCount, ScrollStepCount, false, P251))
		table.insert(List, measureCompletedTraversal(p68, p69, p70, Items, ItemTypes2, ItemCount, ScrollStepCount, true, P251))
		table.insert(List, measureHostSizeSettlePhases(p68, p69, p70, P251))
		local _, ItemTypes2_1 = createItemTypes(p68)
		
		for _, value in ipairs({
			"at-start",
			"in-middle",
			"before-visible-anchor",
			"at-end"
		}) do
			table.insert(List, measureAssignmentPropagation(p68, p69, p70, ItemTypes2_1, createPropagationScenario(p68, value, PropagationItemCount), PropagationItemCount, P251))
		end
		local CallbackResult, CallbackResult2, CallbackResult3 = Callback(p68, p69, p70, P251)
		table.insert(List, CallbackResult)
		table.insert(List, CallbackResult2)
		table.insert(List, CallbackResult3)
		table.insert(List, measureRecyclingScopeHighWater(p68, p69, p70, LifecycleItemCount, P251))
		table.insert(List, measureCompositionChurn(p68, p69, p70, LifecycleItemCount, P251))
		table.insert(List, measureDeclarativeReconciliation(p68, p69, p70, ItemTypes, P251))
		table.insert(List, measurePropSynchronization(p68, p69, p70, ItemTypes, P251))
		local MeasureAssignmentBindingResult, MeasureAssignmentBindingResult2 = measureAssignmentBinding(p68, p69, p70, P251)
		table.insert(List, MeasureAssignmentBindingResult)
		table.insert(List, MeasureAssignmentBindingResult2)
		table.insert(List, measurePresentationCommit(p68, p69, p70, P251))
		table.insert(List, measureVirtualListTeardown(p68, p69, p70, P251))
		table.insert(List, runRecyclingStateMount(p68, p69, p70, P251))
		table.insert(List, measureCompositionBatchSettlement(p68, p69, p70, LifecycleItemCount, P251))
		table.insert(List, measureWarmPagination(p68, p69, p70, P251))
		table.insert(List, measureExpensiveUniformTraversalComparison(p68, p69, p70, Items, ItemCount, ScrollStepCount, P251))
		table.insert(List, measureStatefulAssignmentRenderControl(p68, p69, p70, P251))
		table.insert(List, measureScrollPagination(p68, p69, p70, P251))
		
		return List
	end,
	runDeclarativeDataReconciliation = runDeclarativeDataReconciliation,
	runRecyclingStateMount = runRecyclingStateMount
}