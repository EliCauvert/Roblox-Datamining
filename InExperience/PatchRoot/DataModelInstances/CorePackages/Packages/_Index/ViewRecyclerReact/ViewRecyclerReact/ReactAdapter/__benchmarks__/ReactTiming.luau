local responsibilityCatalogModule = require(game:GetService("ReplicatedStorage").Packages._Workspace.ViewRecycler.ViewRecycler.Core.Diagnostics.__benchmarks__.ResponsibilityCatalog)
local list = { 10, 40 }

local function createItems(p1)
	local list = table.create(p1)
	
	for i = 1, p1 do
		list[i] = {
			id = `item{i}`,
			text = `Item {i}`,
			height = i % 5 * 2 + 36
		}
	end
	return list
end

local function hasItemText(p2, p3)
	for i, v in p2:GetDescendants() do
		if v:IsA("TextLabel") and v.Name == "Content" and v.Text == p3 then
			return true
		end
	end
	return false
end

local function mountedItemCount(p4)
	local var1 = 0
	
	for i, v in p4:GetDescendants() do
		if v:IsA("TextLabel") and v.Name == "Content" and v.Text ~= "" then
			var1 += 1
		end
	end
	return var1
end

local function findMeasuredObjects(p5, p6)
	for i, v in p5:GetDescendants() do
		if v:IsA("TextLabel") and v.Name == "Content" and v.Text == p6 then
			local parent = v.Parent
			while parent ~= nil and parent ~= p5 do
				if not parent:IsA("GuiObject") or string.find(parent.Name, "ListItemViewFrame", 1, true) ~= 1 then
					parent = parent.Parent
					continue
				end
				return v, parent
			end
			return v, nil
		end
	end
	return nil, nil
end

local function recordSizeComparison(p7, p8, p9, p10)
	local var2 = p7[p8]
	
	if var2 == nil then
		var2 = {
			observed = 0,
			matchedSettled = 0,
			differedFromSettled = 0
		}
		p7[p8] = var2
	end
	if p9 == nil then return end
	var2.observed += 1
	
	if p9 == p10 then
		var2.matchedSettled += 1
		
		return
	end
	var2.differedFromSettled += 1
end

local function _(p7)
	local scrollingFrame = p7:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	
	return scrollingFrame
end

local function flushDeferredWork()
	local bindableEvent = Instance.new("BindableEvent")
	task.defer(function()
		-- upvalues: bindableEvent (ref)
		bindableEvent:Fire()
	end)
	bindableEvent.Event:Wait()
	bindableEvent:Destroy()
end

local function waitForHeartbeatToSettle(value)
	local bindableEvent = Instance.new("BindableEvent")
	value.RunService.Heartbeat:Once(function()
		-- upvalues: bindableEvent (ref)
		task.defer(function()
			-- upvalues: bindableEvent (copy)
			task.defer(function()
				-- upvalues: bindableEvent (copy)
				bindableEvent:Fire()
			end)
		end)
	end)
	value.ReactRoblox.act(function()
		-- upvalues: bindableEvent (ref)
		bindableEvent.Event:Wait()
	end)
	bindableEvent:Destroy()
end

local _ = function(p7, p8, p9)
	local var2 = p7[p8]
	
	if var2 == nil then
		var2 = {}
		p7[p8] = var2
	end
	var2[p9] = (var2[p9] or 0) + 1
end

local function captureCompletionPhase(p7, p8, p9, p10)
	local var2 = true
	
	for i, v in p7 do
		if p8[i] == nil and v() then
			p8[i] = p10
			local var3 = p9[i]
			
			if var3 == nil then
				var3 = {}
				p9[i] = var3
			end
			var3[p10] = (var3[p10] or 0) + 1
		end
		if p8[i] == nil then
			var2 = false
		end
	end
	return var2
end

local function observeCompletionPhases(p11, p12, p13, p14, p15)
	-- upvalues: captureCompletionPhase (ref), flushDeferredWork (ref), waitForHeartbeatToSettle (ref)
	p15 = p15 or {}
	
	local function _(p16)
		-- upvalues: captureCompletionPhase (copy), p12 (ref), p15 (ref), p14 (ref)
		return captureCompletionPhase(p12, p15, p14, p16)
	end
	
	if captureCompletionPhase(p12, p15, p14, "afterAct") then
		return p15
	end
	p11.ReactRoblox.act(flushDeferredWork)
	
	if captureCompletionPhase(p12, p15, p14, "deferred") then
		return p15
	end
	waitForHeartbeatToSettle(p11)
	
	if captureCompletionPhase(p12, p15, p14, "heartbeatSettled") then
		return p15
	end
	for _ = 1, 20 do
		waitForHeartbeatToSettle(p11)
		
		if not captureCompletionPhase(p12, p15, p14, "laterHeartbeat") then
			continue
		end
		return p15
	end
	error(`React benchmark did not complete: {if type(p13) == "function" then p13() else p13}`)
end

local function createOffsets(value, p16)
	local maxValue = math.max(0, value * 40 - 400)
	local list = table.create(p16)
	
	for i = 1, p16 do
		list[i] = math.min(maxValue, (math.max(1, math.floor(value * i / (p16 + 1))) - 1) * 40)
	end
	return list
end

local function createItemTypes(p17)
	local react = p17.React
	local signalsReact = p17.SignalsReact
	local viewRecycler = p17.ViewRecycler
	
	return viewRecycler.createRecyclableView(function(p18)
		-- upvalues: signalsReact (ref), react (ref)
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = signalsReact.useSignalState(p18.itemSignal).text
		})
	end, { readiness = "ReadyOnAssignment" }), viewRecycler.createRecyclableView(function(p18)
		-- upvalues: signalsReact (ref), react (ref)
		local var4 = signalsReact.useSignalState(p18.itemSignal)
		
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.None,
			Size = UDim2.new(1, 0, 0, var4.height),
			Text = var4.text
		})
	end, { readiness = "ReadyOnAssignment" })
end

local _ = function(p17, p18, p19, p20, p21, p22, p23, p24)
	p17.ReactRoblox.act(function()
		-- upvalues: p19 (ref), p20 (ref), p17 (ref), p21 (ref), p23 (ref), p24 (ref), p18 (ref), p22 (ref)
		local t = {
			overscan = 0,
			data = p19,
			layout = p20,
			axis = p17.ViewRecycler.Axis.Y,
			itemType = p21,
			diagnostics = p23
		}
		
		if p24 ~= nil then
			for i, v in p24 do
				t[i] = v
			end
		end
		p18:render(p17.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, p22 * 40)
		}, {
			List = p17.React.createElement(p17.ViewRecycler.VirtualList, t)
		}))
	end)
end

local _ = function(p25, p26, p27, p28)
	p25.ReactRoblox.act(function()
		-- upvalues: p26 (ref)
		p26:unmount()
	end)
	p27.destroy()
	p28:Destroy()
end

local _ = function(p25, p26)
	return math.abs(p25 - p26) <= 0.01
end

local _ = function(value, p25)
	-- upvalues: findMeasuredObjects (ref)
	local _, var4 = findMeasuredObjects(value, p25)
	
	return if var4 == nil then nil else var4.Position.Y.Offset
end

local function createPropagationScenario(p25, p26, p27)
	local var4 = p27 * 40
	local var5 = var4 + 80
	local var6 = math.floor(p27 / 2) + 1
	local var7 = var6 - 5
	local var8 = (var7 - 1) * 40
	
	if p26 == "at-start" then
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
			name = p26,
			finalContentLength = var5
		}
	elseif p26 == "in-middle" then
		return {
			overscan = 0,
			name = p26,
			insertIndex = var6,
			initialOffset = var8,
			initialDestinationText = `Item {var7 + 9}`,
			insertedStartOffset = (var6 - 1) * 40,
			neighborKey = `item{var6}`,
			neighborStartOffset = (var6 - 1) * 40 + 80,
			finalContentLength = var5,
			finalScrollOffset = var8
		}
	elseif p26 == "before-visible-anchor" then
		local var9 = (var6 - 1) * 40
		local var10 = var6 - 1
		
		return {
			overscan = 2,
			name = p26,
			insertIndex = var10,
			initialOffset = var9,
			initialDestinationText = `Item {var6 + 9}`,
			insertedStartOffset = (var10 - 1) * 40,
			neighborKey = `item{var6}`,
			neighborStartOffset = var9 + 80,
			finalContentLength = var5,
			finalScrollOffset = var9 + 80
		}
	end
	return {
		overscan = 0,
		name = p26,
		insertIndex = p27 + 1,
		initialOffset = var4 - 400,
		initialDestinationText = `Item {p27}`,
		insertedStartOffset = var4,
		neighborKey = `item{p27}`,
		neighborStartOffset = var4 - 40,
		finalContentLength = var5,
		finalScrollOffset = var5 - 400,
		initialScrollAlignment = p25.ViewRecycler.ScrollAlignment.End,
		autoScrollOnChange = p25.ViewRecycler.AutoScrollPolicy.WhenAtEnd
	}
end

local function measureCompletedMount(p25, p26, p27, p28, p29, p30, p31)
	-- upvalues: observeCompletionPhases (ref), hasItemText (ref), mountedItemCount (ref), responsibilityCatalogModule (ref)
	local clock = p31.clock or os.clock
	local var4 = 0
	local t = {}
	
	return p27.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "completed-mount",
		description = "Mounts a uniform VirtualList and waits for the final expected visible row to commit.",
		responsibility = responsibilityCatalogModule.React.MountScroll,
		scale = { layout = "uniform", items = #p28, visibleRows = p30 },
		timing = {
			unit = "ms",
			basis = "completedMount",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = {
			viewRecycler = p26.run(function()
				-- upvalues: p25 (ref), p28 (ref), clock (ref), p29 (ref), p30 (ref), observeCompletionPhases (copy), hasItemText (copy), t (ref), var4 (write), mountedItemCount (copy)
				local folder = Instance.new("Folder")
				local var5 = p25.ReactRoblox.createRoot(folder)
				local var6 = p25.ViewRecycler.Layout.uniform({ itemLength = 40 })
				local var7 = p25.ViewRecycler.DataSource.snapshot(p28, function(p32)
					return p32.id
				end)
				local var8 = clock()
				local act = p25.ReactRoblox.act
				local var9 = nil
				local var10 = nil
				act(function()
					-- upvalues: var7 (ref), var6 (ref), p25 (ref), p29 (ref), var9 (ref), var10 (ref), var5 (ref), p30 (ref)
					local t = {
						overscan = 0,
						data = var7,
						layout = var6,
						axis = p25.ViewRecycler.Axis.Y,
						itemType = p29,
						diagnostics = var9
					}
					
					if var10 ~= nil then
						for i, v in var10 do
							t[i] = v
						end
					end
					var5:render(p25.React.createElement("Frame", {
						Name = "BenchmarkHost",
						Size = UDim2.fromOffset(400, p30 * 40)
					}, {
						List = p25.React.createElement(p25.ViewRecycler.VirtualList, t)
					}))
				end)
				observeCompletionPhases(p25, {
					destinationRowCommitted = function()
						-- upvalues: hasItemText (copy), folder (ref), p30 (copy)
						return hasItemText(folder, `Item {p30}`)
					end
				}, `mount Item {p30}`, t)
				local var11 = (clock() - var8) * 1000
				var4 = mountedItemCount(folder)
				p25.ReactRoblox.act(function()
					-- upvalues: var5 (ref)
					var5:unmount()
				end)
				var6.destroy()
				folder:Destroy()
				
				return var11
			end, p31)
		},
		evidence = {
			completionBarrier = "destinationRowCommitted",
			reactWorkFlush = "ReactRoblox.actWithMockScheduler",
			mountedItemViews = var4,
			completionPhaseCounts = t
		}
	})
end

local function measureStatefulMountArm(p32, p33, p34, p35, p36, p37)
	-- upvalues: observeCompletionPhases (ref), hasItemText (ref), mountedItemCount (ref)
	local clock = p37.clock or os.clock
	local var5 = 0
	local t = {}
	
	return p33.run(function()
		-- upvalues: p32 (ref), p34 (ref), clock (ref), p35 (ref), p36 (ref), observeCompletionPhases (copy), hasItemText (copy), t (ref), var5 (write), mountedItemCount (copy)
		local folder = Instance.new("Folder")
		local var6 = p32.ReactRoblox.createRoot(folder)
		local var7 = p32.ViewRecycler.Layout.uniform({ itemLength = 40 })
		local var8 = p32.ViewRecycler.DataSource.snapshot(p34, function(p38)
			return p38.id
		end)
		local var9 = clock()
		local act = p32.ReactRoblox.act
		local var10 = nil
		local var11 = nil
		act(function()
			-- upvalues: var8 (ref), var7 (ref), p32 (ref), p35 (ref), var10 (ref), var11 (ref), var6 (ref), p36 (ref)
			local t = {
				overscan = 0,
				data = var8,
				layout = var7,
				axis = p32.ViewRecycler.Axis.Y,
				itemType = p35,
				diagnostics = var10
			}
			
			if var11 ~= nil then
				for i, v in var11 do
					t[i] = v
				end
			end
			var6:render(p32.React.createElement("Frame", {
				Name = "BenchmarkHost",
				Size = UDim2.fromOffset(400, p36 * 40)
			}, {
				List = p32.React.createElement(p32.ViewRecycler.VirtualList, t)
			}))
		end)
		observeCompletionPhases(p32, {
			destinationRowCommitted = function()
				-- upvalues: hasItemText (copy), folder (ref), p36 (copy)
				return hasItemText(folder, `Item {p36}:0`)
			end
		}, `mount stateful Item {p36}`, t)
		local var12 = (clock() - var9) * 1000
		var5 = mountedItemCount(folder)
		p32.ReactRoblox.act(function()
			-- upvalues: var6 (ref)
			var6:unmount()
		end)
		var7.destroy()
		folder:Destroy()
		
		return var12
	end, p37), var5, t
end

local function measureRecyclingStateMountOverhead(p38, p39, p40, p41, p42, p43)
	-- upvalues: measureStatefulMountArm (ref), responsibilityCatalogModule (ref)
	local react = p38.React
	local signalsReact = p38.SignalsReact
	local viewRecycler = p38.ViewRecycler
	local var6 = viewRecycler.createRecyclableView(function(p44)
		-- upvalues: signalsReact (ref), viewRecycler (ref), react (ref)
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = `{signalsReact.useSignalState(p44.itemSignal).text}:{viewRecycler.useRecyclingState(0)}`
		})
	end)
	local var7, var8, var9 = measureStatefulMountArm(p38, p39, p41, viewRecycler.createRecyclableView(function(p44)
		-- upvalues: signalsReact (ref), react (ref)
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = `{signalsReact.useSignalState(p44.itemSignal).text}:{react.useState(0)}`
		})
	end), p42, p43)
	local var10, var11, var12 = measureStatefulMountArm(p38, p39, p41, var6, p42, p43)
	
	return p40.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "recycling-state-mount-overhead",
		description = "Compares completed ItemView mount with ordinary React state and recycling-aware state.",
		responsibility = responsibilityCatalogModule.React.MountScroll,
		scale = {
			layout = "uniform",
			stateHooksPerItemView = 1,
			items = #p41,
			visibleRows = p42
		},
		timing = {
			unit = "ms",
			basis = "completedMount",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = { reactState = var7, recyclingState = var10 },
		evidence = {
			completionBarrier = "destinationRowCommitted",
			reactWorkFlush = "ReactRoblox.actWithMockScheduler",
			reactStateMountedItemViews = var8,
			recyclingStateMountedItemViews = var11,
			completionPhaseCounts = { reactState = var9, recyclingState = var12 }
		}
	})
end

local function measureCompletedTraversal(p38, p39, p40, p41, p42, p43, p44, p45, p46)
	-- upvalues: hasItemText (ref), observeCompletionPhases (ref), createOffsets (ref), captureCompletionPhase (ref), mountedItemCount (ref), responsibilityCatalogModule (ref)
	local clock = p46.clock or os.clock
	local folder = Instance.new("Folder")
	local var6 = p38.ReactRoblox.createRoot(folder)
	local var7 = if p45 then p38.ViewRecycler.Layout.measured({ estimatedItemLength = 40 }) else p38.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var8 = p38.ViewRecycler.DataSource.sequence(p41, function(p47)
		return p47.id
	end)
	local var9 = 0
	
	local var10 = function(p47)
		-- upvalues: var9 (write)
		if p47.kind == "measurementsProcessed" then
			var9 += p47.accepted
		end
	end
	
	local act = p38.ReactRoblox.act
	local var11 = nil
	local var12 = 10
	act(function()
		-- upvalues: var8 (ref), var7 (ref), p38 (ref), p42 (ref), var10 (ref), var11 (ref), var6 (ref), var12 (ref)
		local t = {
			overscan = 0,
			data = var8,
			layout = var7,
			axis = p38.ViewRecycler.Axis.Y,
			itemType = p42,
			diagnostics = var10
		}
		
		if var11 ~= nil then
			for i, v in var11 do
				t[i] = v
			end
		end
		var6:render(p38.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var12 * 40)
		}, {
			List = p38.React.createElement(p38.ViewRecycler.VirtualList, t)
		}))
	end)
	local t = {
		destinationRowCommitted = function()
			-- upvalues: hasItemText (copy), folder (ref)
			return hasItemText(folder, "Item 10")
		end
	}
	
	if p45 then
		function t.measurementAccepted()
			-- upvalues: var9 (write)
			return var9 > 0
		end
	end
	observeCompletionPhases(p38, t, "initial visible rows", {})
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local var13 = createOffsets(p43, p44)
	local var14 = 0
	local var15 = 0
	local t_1 = {}
	local var16 = p39.run(function()
		-- upvalues: var14 (write), p45 (ref), var13 (ref), var8 (ref), var9 (write), clock (ref), hasItemText (copy), folder (ref), p38 (ref), scrollingFrame (ref), captureCompletionPhase (copy), t_1 (ref), observeCompletionPhases (copy), var15 (write)
		var14 = (var14 + 1) % 2
		
		if p45 then
			for i, v in var13 do
				local var17 = math.floor(v / 40) + 1
				local cloned = table.clone(var8.getItem(var17))
				cloned.height = if var14 == 0 then 36 else 44
				var8.setItem(var17, cloned)
			end
		end
		local var18 = clock()
		
		for i, v in var13 do
			local var19 = math.floor(v / 40) + 1
			local var20 = var9
			local t = {
				destinationRowCommitted = function()
					-- upvalues: hasItemText (copy), folder (copy), var19 (ref)
					return hasItemText(folder, `Item {var19}`)
				end
			}
			
			if p45 then
				function t.measurementAccepted()
					-- upvalues: var9 (copy), var20 (ref)
					return var20 < var9
				end
			end
			local t_2 = {}
			p38.ReactRoblox.act(function()
				-- upvalues: scrollingFrame (copy), v (ref), captureCompletionPhase (copy), t (ref), t_2 (ref), t_1 (copy)
				scrollingFrame.CanvasPosition = Vector2.new(0, v)
				captureCompletionPhase(t, t_2, t_1, "afterMutation")
			end)
			observeCompletionPhases(p38, t, `scroll Item {var19}`, t_1, t_2)
		end
		local var21 = (clock() - var18) * 1000
		var15 = var9 - var9
		p38.ReactRoblox.act(function()
			-- upvalues: scrollingFrame (copy)
			scrollingFrame.CanvasPosition = Vector2.zero
		end)
		observeCompletionPhases(p38, {
			destinationRowCommitted = function()
				-- upvalues: hasItemText (copy), folder (copy)
				return hasItemText(folder, "Item 1")
			end
		}, "reset scroll position", {})
		
		return var21
	end, p46)
	local var22 = mountedItemCount(folder)
	p38.ReactRoblox.act(function()
		-- upvalues: var6 (ref)
		var6:unmount()
	end)
	var7.destroy()
	folder:Destroy()
	
	return p40.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		responsibility = responsibilityCatalogModule.React.MountScroll,
		workload = if p45 then "completed-measured-traversal" else "completed-uniform-traversal",
		description = if p45 then "Scrolls a measured VirtualList and waits for both destination-row commits and accepted size updates." else "Scrolls a uniform VirtualList and waits for each destination row to commit.",
		scale = {
			visibleRows = 10,
			items = p43,
			scrollSteps = p44,
			layout = if p45 then "measured" else "uniform"
		},
		timing = {
			unit = "ms",
			basis = "completedScrollTraversal",
			includesSchedulerWaits = true,
			operationsPerSample = p44
		},
		arms = { viewRecycler = var16 },
		evidence = {
			reactWorkFlush = "ReactRoblox.actWithMockScheduler",
			mountedItemViews = var22,
			acceptedMeasurementsPerTraversal = var15,
			completionBarrier = if p45 then "destinationRowCommittedAndMeasurementAccepted" else "destinationRowCommitted",
			completionPhaseCounts = t_1
		}
	})
end

local function measureHostSizeSettlePhases(value, p47, p48, p49)
	-- upvalues: observeCompletionPhases (ref), hasItemText (ref), waitForHeartbeatToSettle (ref), findMeasuredObjects (ref), flushDeferredWork (ref), recordSizeComparison (ref), responsibilityCatalogModule (ref)
	local clock = p49.clock or os.clock
	local screenGui = Instance.new("ScreenGui")
	screenGui.ResetOnSpawn = false
	screenGui.Parent = game:GetService("CoreGui")
	local var23 = value.ReactRoblox.createRoot(screenGui)
	local var24 = value.ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local repeated = string.rep("This response grows enough to wrap across the measured row. ", 8)
	local var25 = value.ViewRecycler.createRecyclableView(function(p50)
		-- upvalues: value (ref)
		return value.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.fromOffset(10, 0),
			Size = UDim2.new(1, -20, 0, 0),
			Text = value.SignalsReact.useSignalState(p50.itemSignal).text
		})
	end, { readiness = "ReadyOnCommit", hideWhilePending = true })
	local t = {
		id = "measurement-probe",
		text = "Short response",
		height = 40
	}
	local var26 = value.ViewRecycler.DataSource.sequence({ t }, function(p50)
		return p50.id
	end)
	local var27 = 0
	
	local var28 = function(p50)
		-- upvalues: var27 (write)
		if p50.kind == "measurementsProcessed" then
			var27 += p50.accepted
		end
	end
	
	local act = value.ReactRoblox.act
	local var29 = nil
	local var30 = 3
	act(function()
		-- upvalues: var26 (ref), var24 (ref), value (ref), var25 (ref), var28 (ref), var29 (ref), var23 (ref), var30 (ref)
		local t = {
			overscan = 0,
			data = var26,
			layout = var24,
			axis = value.ViewRecycler.Axis.Y,
			itemType = var25,
			diagnostics = var28
		}
		
		if var29 ~= nil then
			for i, v in var29 do
				t[i] = v
			end
		end
		var23:render(value.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var30 * 40)
		}, {
			List = value.React.createElement(value.ViewRecycler.VirtualList, t)
		}))
	end)
	observeCompletionPhases(value, {
		destinationRowCommitted = function()
			-- upvalues: hasItemText (copy), screenGui (ref)
			return hasItemText(screenGui, "Short response")
		end,
		measurementAccepted = function()
			-- upvalues: var27 (write)
			return var27 > 0
		end
	}, "initial wrapped measured row", {})
	waitForHeartbeatToSettle(value)
	waitForHeartbeatToSettle(value)
	local var31 = 0
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local t_6 = { host = {}, content = {} }
	local var32 = 0
	local var33 = p47.run(function()
		-- upvalues: var32 (write), var31 (write), repeated (ref), var27 (write), findMeasuredObjects (copy), screenGui (ref), t_1 (ref), clock (ref), value (ref), var26 (ref), t (ref), flushDeferredWork (copy), waitForHeartbeatToSettle (copy), t_4 (ref), t_5 (ref), recordSizeComparison (copy), t_2 (ref), t_6 (ref), t_3 (ref)
		var32 += 1
		var31 = (var31 + 1) % 2
		local var34 = if var31 == 0 then "Short response" else repeated
		local var35 = if var31 == 0 then "short" else "long"
		local t_7 = {}
		local t_8 = {}
		local var36 = nil
		
		local function _(p50)
			-- upvalues: findMeasuredObjects (copy), screenGui (copy), var34 (ref), t_8 (ref), t_7 (ref), var36 (write), var27 (copy), var27 (ref), t_1 (copy)
			local var37, var38 = findMeasuredObjects(screenGui, var34)
			
			if var37 ~= nil then
				t_8[p50] = var37.AbsoluteSize.Y
			end
			if var38 ~= nil then
				t_7[p50] = var38.AbsoluteSize.Y
			end
			if var36 == nil and var27 < var27 then
				var36 = p50
				local var39 = t_1
				local measurementAccepted = var39.measurementAccepted
				
				if measurementAccepted == nil then
					measurementAccepted = {}
					var39.measurementAccepted = measurementAccepted
				end
				measurementAccepted[p50] = (measurementAccepted[p50] or 0) + 1
			end
		end
		
		local var37 = clock()
		value.ReactRoblox.act(function()
			-- upvalues: var26 (copy), t (copy), var34 (ref), findMeasuredObjects (copy), screenGui (copy), t_8 (ref), t_7 (ref), var36 (write), var27 (copy), var27 (ref), t_1 (copy)
			var26.setItem(1, { id = t.id, text = var34, height = t.height })
			local var38, var39 = findMeasuredObjects(screenGui, var34)
			
			if var38 ~= nil then
				t_8.afterMutation = var38.AbsoluteSize.Y
			end
			if var39 ~= nil then
				t_7.afterMutation = var39.AbsoluteSize.Y
			end
			if var36 == nil and var27 < var27 then
				var36 = "afterMutation"
				local var40 = t_1
				local measurementAccepted = var40.measurementAccepted
				
				if measurementAccepted == nil then
					measurementAccepted = {}
					var40.measurementAccepted = measurementAccepted
				end
				measurementAccepted.afterMutation = (measurementAccepted.afterMutation or 0) + 1
			end
		end)
		local var38, var39 = findMeasuredObjects(screenGui, var34)
		
		if var38 ~= nil then
			t_8.afterAct = var38.AbsoluteSize.Y
		end
		if var39 ~= nil then
			t_7.afterAct = var39.AbsoluteSize.Y
		end
		if var36 == nil and var27 < var27 then
			var36 = "afterAct"
			local var40 = t_1
			local measurementAccepted = var40.measurementAccepted
			
			if measurementAccepted == nil then
				measurementAccepted = {}
				var40.measurementAccepted = measurementAccepted
			end
			measurementAccepted.afterAct = (measurementAccepted.afterAct or 0) + 1
		end
		value.ReactRoblox.act(flushDeferredWork)
		local var41, var42 = findMeasuredObjects(screenGui, var34)
		
		if var41 ~= nil then
			t_8.deferred = var41.AbsoluteSize.Y
		end
		if var42 ~= nil then
			t_7.deferred = var42.AbsoluteSize.Y
		end
		if var36 == nil and var27 < var27 then
			var36 = "deferred"
			local var43 = t_1
			local measurementAccepted = var43.measurementAccepted
			
			if measurementAccepted == nil then
				measurementAccepted = {}
				var43.measurementAccepted = measurementAccepted
			end
			measurementAccepted.deferred = (measurementAccepted.deferred or 0) + 1
		end
		for i = 1, 3 do
			waitForHeartbeatToSettle(value)
			local var44 = `heartbeat{i}Settled`
			local var45, var46 = findMeasuredObjects(screenGui, var34)
			
			if var45 ~= nil then
				t_8[var44] = var45.AbsoluteSize.Y
			end
			if var46 ~= nil then
				t_7[var44] = var46.AbsoluteSize.Y
			end
			if var36 == nil and var27 < var27 then
				var36 = var44
				local var47 = t_1
				local measurementAccepted = var47.measurementAccepted
				
				if measurementAccepted == nil then
					measurementAccepted = {}
					var47.measurementAccepted = measurementAccepted
				end
				measurementAccepted[var44] = (measurementAccepted[var44] or 0) + 1
			end
		end
		local var48 = (clock() - var37) * 1000
		
		if var36 == nil then
			local var49 = t_1
			local measurementAccepted = var49.measurementAccepted
			
			if measurementAccepted == nil then
				measurementAccepted = {}
				var49.measurementAccepted = measurementAccepted
			end
			measurementAccepted.notAcceptedWithinThreeHeartbeats = (measurementAccepted.notAcceptedWithinThreeHeartbeats or 0) + 1
		end
		local heartbeat3Settled = t_7.heartbeat3Settled
		local heartbeat3Settled_1 = t_8.heartbeat3Settled
		assert(heartbeat3Settled ~= nil and heartbeat3Settled_1 ~= nil, "wrapped measured row did not settle")
		t_4[tostring(heartbeat3Settled)] = (t_4[tostring(heartbeat3Settled)] or 0) + 1
		t_5[tostring(heartbeat3Settled_1)] = (t_5[tostring(heartbeat3Settled_1)] or 0) + 1
		
		for i_1, v in t_7 do
			recordSizeComparison(t_2, i_1, v, heartbeat3Settled)
			
			if v ~= heartbeat3Settled and t_6.host[i_1] == nil then
				t_6.host[i_1] = {
					update = var32,
					text = var35,
					observed = v,
					settled = heartbeat3Settled
				}
			end
		end
		for i_2, v_1 in t_8 do
			recordSizeComparison(t_3, i_2, v_1, heartbeat3Settled_1)
			
			if v_1 ~= heartbeat3Settled_1 and t_6.content[i_2] == nil then
				t_6.content[i_2] = {
					update = var32,
					text = var35,
					observed = v_1,
					settled = heartbeat3Settled_1
				}
			end
		end
		return var48
	end, p49)
	value.ReactRoblox.act(function()
		-- upvalues: var23 (ref)
		var23:unmount()
	end)
	var24.destroy()
	screenGui:Destroy()
	
	return p48.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "phased",
		workload = "measurement-settle-phases",
		description = "Compares wrapped content and measured-host sizes before and after Roblox layout Heartbeats.",
		responsibility = responsibilityCatalogModule.React.MeasurementWiring,
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
		arms = { viewRecycler = var33 },
		evidence = {
			reactWorkFlush = "ReactRoblox.actWithMockScheduler",
			completionPhaseCounts = t_1,
			hostSizeComparisons = t_2,
			contentSizeComparisons = t_3,
			settledHostSizeCounts = t_4,
			settledContentSizeCounts = t_5,
			mismatchExamples = t_6
		}
	})
end

local function runAssignmentPropagationSample(value, p50, p51, p52, p53)
	-- upvalues: observeCompletionPhases (ref), hasItemText (ref), waitForHeartbeatToSettle (ref), findMeasuredObjects (ref)
	local clock = p53.clock or os.clock
	local list = table.create(p52)
	
	for i = 1, p52 do
		list[i] = { height = 40, id = `item{i}`, text = `Item {i}` }
	end
	local t = {
		height = 80,
		id = `inserted-{p51.name}`,
		text = `Inserted {p51.name}`
	}
	local folder = Instance.new("Folder")
	local var50 = value.ReactRoblox.createRoot(folder)
	local var51 = value.ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local var52 = value.ViewRecycler.DataSource.sequence(list, function(p54)
		return p54.id
	end)
	local var53 = nil
	local var54 = nil
	local var55 = nil
	local var56 = nil
	local var57 = nil
	local var58 = false
	local var59 = nil
	local t_1 = { data = 0, measurement = 0, programmaticScroll = 0 }
	local t_2 = {}
	
	local var60 = function(p54)
		-- upvalues: var58 (write), var53 (write), var54 (write), clock (ref), var55 (write), t_1 (ref)
		if not var58 then return end
		if p54.kind == "measurementsProcessingStarted" and var53 ~= nil then
			var54 = var54 or clock()
			
			return
		elseif p54.kind == "measurementsProcessed" and p54.accepted > 0 and var53 ~= nil then
			var55 = var55 or clock()
			
			return
		elseif p54.kind == "scrollCorrection" then
			t_1[p54.source] += p54.delta
		end
	end
	
	local t_3 = {
		overscan = p51.overscan,
		preserveScrollPositionOnChange = p51.preserveScrollPositionOnChange,
		initialScrollAlignment = p51.initialScrollAlignment,
		autoScrollOnChange = p51.autoScrollOnChange,
		_instrumentation = {
			assignmentChanged = function(_, p54)
				-- upvalues: var58 (write), t (ref), var53 (write), clock (ref)
				if var58 and p54 ~= nil and (p54.key == t.id and var53 == nil) then
					var53 = clock()
				end
			end
		},
		onContentLengthChanged = function(p54)
			-- upvalues: var58 (write), p51 (ref), var59 (write)
			if var58 and math.abs(p54 - p51.finalContentLength) <= 0.01 then
				var59 = p54
			end
		end
	}
	local var61 = 10
	value.ReactRoblox.act(function()
		-- upvalues: var52 (ref), var51 (ref), value (ref), p50 (ref), var60 (ref), t_3 (ref), var50 (ref), var61 (ref)
		local t = {
			overscan = 0,
			data = var52,
			layout = var51,
			axis = value.ViewRecycler.Axis.Y,
			itemType = p50,
			diagnostics = var60
		}
		
		if t_3 ~= nil then
			for i, v in t_3 do
				t[i] = v
			end
		end
		var50:render(value.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var61 * 40)
		}, {
			List = value.React.createElement(value.ViewRecycler.VirtualList, t)
		}))
	end)
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	value.ReactRoblox.act(function()
		-- upvalues: scrollingFrame (ref), p51 (ref)
		scrollingFrame.CanvasPosition = Vector2.new(0, p51.initialOffset)
	end)
	observeCompletionPhases(value, {
		destinationRowCommitted = function()
			-- upvalues: hasItemText (copy), folder (ref), p51 (ref)
			return hasItemText(folder, p51.initialDestinationText)
		end,
		initialCanvasSettled = function()
			-- upvalues: scrollingFrame (ref), p52 (ref)
			return math.abs(scrollingFrame.CanvasSize.Y.Offset - p52 * 40) <= 0.01
		end
	}, `prepare {p51.name} insertion`, {})
	waitForHeartbeatToSettle(value)
	assert(math.abs(scrollingFrame.CanvasSize.Y.Offset - p52 * 40) <= 0.01, `{p51.name}: initial canvas size did not settle (expected {p52 * 40}, got {scrollingFrame.CanvasSize.Y.Offset})`)
	assert(math.abs(scrollingFrame.CanvasPosition.Y - p51.initialOffset) <= 0.01, `{p51.name}: initial scroll position did not settle`)
	var58 = true
	value.ReactRoblox.act(function()
		-- upvalues: var52 (ref), p51 (ref), t (ref)
		var52.insert(p51.insertIndex, t)
	end)
	local var62 = if p51.name == "before-visible-anchor" then 40 else 0
	local var63 = if p51.name == "before-visible-anchor" then 40 else 0
	local t_4 = {}
	
	local function captureLibraryPublication()
		-- upvalues: folder (ref), t (ref), findMeasuredObjects (copy), p51 (ref), var53 (write), var54 (write), var55 (write), var59 (write), t_1 (ref), var62 (ref), var63 (ref), var56 (write), clock (ref)
		local _, var64 = findMeasuredObjects(folder, t.text)
		local var65 = if var64 == nil then nil else var64.Position.Y.Offset
		local _, var66 = findMeasuredObjects(folder, `Item {string.sub(p51.neighborKey, 5)}`)
		local var67 = if var66 == nil then nil else var66.Position.Y.Offset
		local var68 = var53 ~= nil and (var54 ~= nil and (var55 ~= nil and (var59 ~= nil and (var65 ~= nil and (math.abs(var65 - p51.insertedStartOffset) <= 0.01 and (var67 ~= nil and (math.abs(var67 - p51.neighborStartOffset) <= 0.01 and (math.abs(t_1.data - var62) <= 0.01 and math.abs(t_1.measurement - var63) <= 0.01))))))))
		
		if var68 and var56 == nil then
			var56 = clock()
		end
		return var68
	end
	
	observeCompletionPhases(value, {
		libraryOutputsPublished = captureLibraryPublication,
		hostValuesObserved = function()
			-- upvalues: captureLibraryPublication (ref), folder (ref), t (ref), findMeasuredObjects (copy), p51 (ref), t_4 (write), var53 (write), var54 (write), var55 (write), var56 (write), var59 (write), scrollingFrame (ref), var57 (write), clock (ref)
			captureLibraryPublication()
			local _, var64 = findMeasuredObjects(folder, t.text)
			local var65 = if var64 == nil then nil else var64.Position.Y.Offset
			local _, var66 = findMeasuredObjects(folder, `Item {string.sub(p51.neighborKey, 5)}`)
			t_4 = {
				assigned = var53 ~= nil,
				measurementStarted = var54 ~= nil,
				measurementProcessed = var55 ~= nil,
				libraryPublished = var56 ~= nil,
				observedContentLength = var59,
				canvasLength = scrollingFrame.CanvasSize.Y.Offset,
				scrollOffset = scrollingFrame.CanvasPosition.Y,
				insertedOffset = var65,
				neighborOffset = if var66 == nil then nil else var66.Position.Y.Offset
			}
			local var67 = var53 ~= nil and (var56 ~= nil and (math.abs(scrollingFrame.CanvasSize.Y.Offset - p51.finalContentLength) <= 0.01 and math.abs(scrollingFrame.CanvasPosition.Y - p51.finalScrollOffset) <= 0.01))
			
			if var67 and var57 == nil then
				var57 = clock()
			end
			return var67
		end
	}, function()
		-- upvalues: p51 (ref), t_4 (write)
		return `{p51.name} assignment, measurement, and propagation; assigned={t_4.assigned}, measurementStarted={t_4.measurementStarted}, measurementProcessed={t_4.measurementProcessed}, libraryPublished={t_4.libraryPublished}, content={t_4.observedContentLength}, canvas={t_4.canvasLength}, scroll={t_4.scrollOffset}, inserted={t_4.insertedOffset}, neighbor={t_4.neighborOffset}`
	end, t_2)
	local var64 = assert(var53, `{p51.name}: inserted item was not assigned`)
	local var65 = assert(var54, `{p51.name}: inserted item measurement did not reach Core`)
	local var66 = assert(var55, `{p51.name}: inserted item measurement was not accepted`)
	local var67 = assert(var56, `{p51.name}: library outputs were not fully published`)
	local var68 = assert(var57, `{p51.name}: host values did not fully propagate`)
	assert(var64 <= var65, `{p51.name}: measurement preceded assignment`)
	assert(var65 <= var66, `{p51.name}: measurement completed before it started`)
	assert(var66 <= var67, `{p51.name}: library outputs preceded measurement`)
	assert(var67 <= var68, `{p51.name}: host values preceded library outputs`)
	assert(math.abs(t_1.data - var62) <= 0.01, `{p51.name}: unexpected insertion anchor correction`)
	assert(math.abs(t_1.measurement - var63) <= 0.01, `{p51.name}: unexpected measurement anchor correction`)
	local t_5 = { insertIndex = p51.insertIndex }
	local var69, var70 = findMeasuredObjects(folder, t.text)
	t_5.insertedStartOffset = if var70 == nil then nil else var70.Position.Y.Offset
	t_5.neighborKey = p51.neighborKey
	var69, var187 = findMeasuredObjects(folder, `Item {string.sub(p51.neighborKey, 5)}`)
	t_5.neighborStartOffset = if var187 == nil then nil else var187.Position.Y.Offset
	t_5.contentLength = scrollingFrame.CanvasSize.Y.Offset
	t_5.scrollOffset = scrollingFrame.CanvasPosition.Y
	t_5.dataAnchorCorrection = t_1.data
	t_5.measurementAnchorCorrection = t_1.measurement
	t_5.completionPhaseCounts = t_2
	t_5.assignmentToMeasurementStartMs = (var65 - var64) * 1000
	t_5.measurementProcessingMs = (var66 - var65) * 1000
	t_5.measurementProcessedToLibraryPublicationMs = (var67 - var66) * 1000
	t_5.libraryPublicationToHostObservationMs = (var68 - var67) * 1000
	t_5.assignmentToHostObservationMs = (var68 - var64) * 1000
	value.ReactRoblox.act(function()
		-- upvalues: var50 (ref)
		var50:unmount()
	end)
	var51.destroy()
	folder:Destroy()
	
	return t_5
end

local function measureAssignmentPropagation(value, p54, p55, p56, p57, p58, p59)
	-- upvalues: runAssignmentPropagationSample (ref), responsibilityCatalogModule (ref)
	local t = {}
	
	return p55.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "phased",
		workload = "measured-insertion-propagation",
		description = "Times an inserted row from assignment through measurement and fully propagated host geometry.",
		responsibility = responsibilityCatalogModule.React.MeasurementWiring,
		scale = {
			estimatedItemLength = 40,
			insertedItemLength = 80,
			visibleRows = 10,
			items = p58,
			scenario = p57.name
		},
		timing = {
			unit = "ms",
			basis = "assignmentToMilestone",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = {
			assignmentToMeasurementStart = p54.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p56 (ref), p57 (ref), p58 (ref), p59 (ref), t (write)
				local var62 = runAssignmentPropagationSample(value, p56, p57, p58, p59)
				t = var62
				
				return var62.assignmentToMeasurementStartMs
			end, p59),
			measurementProcessing = p54.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p56 (ref), p57 (ref), p58 (ref), p59 (ref), t (write)
				local var62 = runAssignmentPropagationSample(value, p56, p57, p58, p59)
				t = var62
				
				return var62.measurementProcessingMs
			end, p59),
			measurementProcessedToLibraryPublication = p54.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p56 (ref), p57 (ref), p58 (ref), p59 (ref), t (write)
				local var62 = runAssignmentPropagationSample(value, p56, p57, p58, p59)
				t = var62
				
				return var62.measurementProcessedToLibraryPublicationMs
			end, p59),
			libraryPublicationToHostObservation = p54.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p56 (ref), p57 (ref), p58 (ref), p59 (ref), t (write)
				local var62 = runAssignmentPropagationSample(value, p56, p57, p58, p59)
				t = var62
				
				return var62.libraryPublicationToHostObservationMs
			end, p59),
			assignmentToHostObservation = p54.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p56 (ref), p57 (ref), p58 (ref), p59 (ref), t (write)
				local var62 = runAssignmentPropagationSample(value, p56, p57, p58, p59)
				t = var62
				
				return var62.assignmentToHostObservationMs
			end, p59)
		},
		evidence = t
	})
end

local var62 = nil

local function measureDeclarativeReconciliation(p54, p55, p56, p57, p58)
	-- upvalues: createItems (ref), observeCompletionPhases (ref), hasItemText (ref), responsibilityCatalogModule (ref)
	local clock = p58.clock or os.clock
	local folder = Instance.new("Folder")
	local var63 = p54.ReactRoblox.createRoot(folder)
	local var64 = p54.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var65 = createItems(20)
	local var66 = createItems(20)
	
	for i, v in var66 do
		v.text = `Reconciled {i}`
	end
	local function _(p59)
		return {
			items = p59,
			getItemKey = function(p60)
				return p60.id
			end
		}
	end
	
	local t = {
		items = var65,
		getItemKey = function(p59)
			return p59.id
		end
	}
	local act = p54.ReactRoblox.act
	local var67 = nil
	local var68 = nil
	local var69 = 10
	act(function()
		-- upvalues: t (ref), var64 (ref), p54 (ref), p57 (ref), var67 (ref), var68 (ref), var63 (ref), var69 (ref)
		local t = {
			overscan = 0,
			data = t,
			layout = var64,
			axis = p54.ViewRecycler.Axis.Y,
			itemType = p57,
			diagnostics = var67
		}
		
		if var68 ~= nil then
			for i, v in var68 do
				t[i] = v
			end
		end
		var63:render(p54.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var69 * 40)
		}, {
			List = p54.React.createElement(p54.ViewRecycler.VirtualList, t)
		}))
	end)
	local var70 = false
	local var71 = 0
	local t_1 = {}
	local var72 = ""
	local var73 = p55.run(function()
		-- upvalues: var70 (write), var66 (ref), var65 (ref), var72 (write), clock (ref), p54 (ref), var63 (ref), var64 (ref), p57 (ref), observeCompletionPhases (copy), hasItemText (copy), folder (ref), t_1 (ref), var71 (write)
		var70 = not var70
		local var74 = if var70 then var66 else var65
		var72 = if var70 then "Reconciled 10" else "Item 10"
		local var75 = clock()
		local t = {
			items = var74,
			getItemKey = function(p59)
				return p59.id
			end
		}
		local act = p54.ReactRoblox.act
		local var76 = nil
		local var77 = nil
		local var78 = 10
		act(function()
			-- upvalues: t (ref), var64 (ref), p54 (ref), p57 (ref), var76 (ref), var77 (ref), var63 (ref), var78 (ref)
			local t = {
				overscan = 0,
				data = t,
				layout = var64,
				axis = p54.ViewRecycler.Axis.Y,
				itemType = p57,
				diagnostics = var76
			}
			
			if var77 ~= nil then
				for i, v in var77 do
					t[i] = v
				end
			end
			var63:render(p54.React.createElement("Frame", {
				Name = "BenchmarkHost",
				Size = UDim2.fromOffset(400, var78 * 40)
			}, {
				List = p54.React.createElement(p54.ViewRecycler.VirtualList, t)
			}))
		end)
		observeCompletionPhases(p54, {
			reconciledContentCommitted = function()
				-- upvalues: hasItemText (copy), folder (copy), var72 (copy)
				return hasItemText(folder, var72)
			end
		}, "declarative data reconciliation", t_1)
		var71 += 1
		
		return (clock() - var75) * 1000
	end, p58)
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	scrollingFrame = scrollingFrame.CanvasSize.Y.Offset
	p54.ReactRoblox.act(function()
		-- upvalues: var63 (ref)
		var63:unmount()
	end)
	var64.destroy()
	folder:Destroy()
	
	return p56.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "integrated",
		workload = "declarative-data-reconciliation",
		description = "Reconciles a replacement declarative item array through the retained VirtualList.",
		responsibility = responsibilityCatalogModule.React.DataReconciliation,
		scale = { items = 20, replacementsPerSample = 1 },
		timing = {
			unit = "ms",
			basis = "declarativeReconciliationCommit",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = { viewRecycler = var73 },
		evidence = {
			completionBarrier = "reconciledContentCommitted",
			reconciliations = var71,
			finalCommittedText = var72,
			finalContentLength = scrollingFrame,
			completionPhaseCounts = t_1
		}
	})
end

local function runDeclarativeDataReconciliation(p59, p60, p61, p62, p63)
	-- upvalues: createItemTypes (ref), var62 (write), measureDeclarativeReconciliation (ref)
	p62 = p62 or {}
	local var74, var75 = createItemTypes(p59)
	assert(var74 ~= var75, "React benchmark Recyclable view types must have distinct identities")
	
	if p63 then
		var62(p59, p60, p61, { sampleCount = 1, warmupCount = 0, bootstrapResamples = 0 })
	end
	return measureDeclarativeReconciliation(p59, p60, p61, var74, p62)
end

local function measurePropSynchronization(p59, p60, p61, p62, p63)
	-- upvalues: createItems (ref), observeCompletionPhases (ref), hasItemText (ref), responsibilityCatalogModule (ref)
	local clock = p63.clock or os.clock
	local folder = Instance.new("Folder")
	local var74 = p59.ReactRoblox.createRoot(folder)
	local var75 = p59.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var76 = p59.ViewRecycler.Layout.uniform({ itemLength = 44 })
	local var77 = createItems(20)
	local var78 = createItems(21)
	var78[1].text = "Replacement first"
	local var79 = p59.ViewRecycler.DataSource.snapshot(var77, function(p64)
		return p64.id
	end)
	local var80 = p59.ViewRecycler.DataSource.snapshot(var78, function(p64)
		return p64.id
	end)
	local act = p59.ReactRoblox.act
	local var81 = nil
	local var82 = nil
	local var83 = 10
	act(function()
		-- upvalues: var79 (ref), var75 (ref), p59 (ref), p62 (ref), var81 (ref), var82 (ref), var74 (ref), var83 (ref)
		local t = {
			overscan = 0,
			data = var79,
			layout = var75,
			axis = p59.ViewRecycler.Axis.Y,
			itemType = p62,
			diagnostics = var81
		}
		
		if var82 ~= nil then
			for i, v in var82 do
				t[i] = v
			end
		end
		var74:render(p59.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var83 * 40)
		}, {
			List = p59.React.createElement(p59.ViewRecycler.VirtualList, t)
		}))
	end)
	local var84 = false
	local var85 = 0
	local t = {}
	local var86 = 0
	local var87 = ""
	local var88 = p60.run(function()
		-- upvalues: var84 (write), var80 (ref), var79 (ref), var76 (ref), var75 (ref), var86 (write), var78 (ref), var77 (ref), var87 (write), clock (ref), p59 (ref), var74 (ref), p62 (ref), observeCompletionPhases (copy), hasItemText (copy), folder (ref), t (ref), var85 (write)
		var84 = not var84
		local var89 = if var84 then var80 else var79
		local var90 = if var84 then var76 else var75
		var86 = if var84 then #var78 * 44 else #var77 * 40
		var87 = if var84 then "Replacement first" else "Item 1"
		local var91 = clock()
		local act = p59.ReactRoblox.act
		local var92 = nil
		local var93 = nil
		local var94 = 10
		act(function()
			-- upvalues: var89 (ref), var90 (ref), p59 (ref), p62 (ref), var92 (ref), var93 (ref), var74 (ref), var94 (ref)
			local t = {
				overscan = 0,
				data = var89,
				layout = var90,
				axis = p59.ViewRecycler.Axis.Y,
				itemType = p62,
				diagnostics = var92
			}
			
			if var93 ~= nil then
				for i, v in var93 do
					t[i] = v
				end
			end
			var74:render(p59.React.createElement("Frame", {
				Name = "BenchmarkHost",
				Size = UDim2.fromOffset(400, var94 * 40)
			}, {
				List = p59.React.createElement(p59.ViewRecycler.VirtualList, t)
			}))
		end)
		observeCompletionPhases(p59, {
			dataAndLayoutPropsCommitted = function()
				-- upvalues: hasItemText (copy), folder (copy), var87 (copy), var86 (copy)
				local var95 = hasItemText(folder, var87)
				
				if var95 then
					local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
					assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
					var95 = math.abs(scrollingFrame.CanvasSize.Y.Offset - var86) <= 0.01
				end
				return var95
			end
		}, "data and layout prop replacement", t)
		var85 += 1
		
		return (clock() - var91) * 1000
	end, p63)
	p59.ReactRoblox.act(function()
		-- upvalues: var74 (ref)
		var74:unmount()
	end)
	var75.destroy()
	folder:Destroy()
	var76.destroy()
	
	return p61.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "integrated",
		workload = "data-layout-prop-replacement",
		description = "Atomically replaces VirtualList data and layout props and waits for matching host geometry.",
		responsibility = responsibilityCatalogModule.React.PropSynchronization,
		scale = {
			replacementsPerSample = 1,
			firstItems = #var77,
			secondItems = #var78
		},
		timing = {
			unit = "ms",
			basis = "dataLayoutPropCommit",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = { viewRecycler = var88 },
		evidence = {
			completionBarrier = "dataAndLayoutPropsCommitted",
			replacements = var85,
			finalCommittedText = var87,
			finalContentLength = var86,
			completionPhaseCounts = t
		}
	})
end

local function measureAssignmentBinding(value, p64, p65, p66)
	-- upvalues: createItems (ref), hasItemText (ref), captureCompletionPhase (ref), observeCompletionPhases (ref), responsibilityCatalogModule (ref)
	local clock = p66.clock or os.clock
	local var89 = 0
	local var90 = 0
	local var91 = value.ViewRecycler.createRecyclableView(function(p67)
		-- upvalues: var89 (write), value (ref)
		var89 += 1
		
		return value.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = value.SignalsReact.useSignalBinding(function(p68)
				-- upvalues: p67 (ref)
				return p67.itemSignal(p68).text
			end)
		})
	end, { readiness = "ReadyOnAssignment" })
	local folder = Instance.new("Folder")
	local var92 = value.ReactRoblox.createRoot(folder)
	local var93 = value.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var94 = value.ViewRecycler.DataSource.sequence(createItems(20), function(p67)
		return p67.id
	end)
	local t = {
		_instrumentation = {
			assignmentChanged = function(_, p67)
				-- upvalues: var90 (write)
				if p67 ~= nil then
					var90 += 1
				end
			end
		}
	}
	local act = value.ReactRoblox.act
	local var95 = nil
	local var96 = 10
	act(function()
		-- upvalues: var94 (ref), var93 (ref), value (ref), var91 (ref), var95 (ref), t (ref), var92 (ref), var96 (ref)
		local t = {
			overscan = 0,
			data = var94,
			layout = var93,
			axis = value.ViewRecycler.Axis.Y,
			itemType = var91,
			diagnostics = var95
		}
		
		if t ~= nil then
			for i, v in t do
				t[i] = v
			end
		end
		var92:render(value.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var96 * 40)
		}, {
			List = value.React.createElement(value.ViewRecycler.VirtualList, t)
		}))
	end)
	local var97 = var89
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local var98 = scrollingFrame
	local var99 = true
	local var100 = 0
	local t_1 = {}
	local var101 = p64.run(function()
		-- upvalues: var99 (write), var90 (write), hasItemText (copy), folder (ref), clock (ref), value (ref), var98 (ref), captureCompletionPhase (copy), t_1 (ref), observeCompletionPhases (copy), var100 (write)
		var99 = not var99
		local var102 = if var99 then 0 else 400
		local var103 = if var99 then "Item 1" else "Item 11"
		local t = {
			bindingDelivered = function()
				-- upvalues: hasItemText (copy), folder (copy), var103 (ref)
				return hasItemText(folder, var103)
			end
		}
		local t_2 = {}
		local var104 = clock()
		value.ReactRoblox.act(function()
			-- upvalues: var98 (copy), var102 (ref), captureCompletionPhase (copy), t (ref), t_2 (ref), t_1 (copy)
			var98.CanvasPosition = Vector2.new(0, var102)
			captureCompletionPhase(t, t_2, t_1, "afterMutation")
		end)
		observeCompletionPhases(value, t, `binding delivery to {var103}`, t_1, t_2)
		var100 = var90 - var90
		
		return (clock() - var104) * 1000
	end, p66)
	local var102 = var89
	value.ReactRoblox.act(function()
		-- upvalues: var92 (ref)
		var92:unmount()
	end)
	var93.destroy()
	folder:Destroy()
	
	return p65.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "item-binding-delivery",
		description = "Delivers recycled item assignments through SignalsReact.useSignalBinding without rerendering physical rows.",
		responsibility = responsibilityCatalogModule.React.AssignmentBinding,
		scale = { items = 20, visibleRows = 10, assignmentsPerSample = 10 },
		timing = {
			unit = "ms",
			basis = "bindingAssignmentDelivery",
			operationsPerSample = 10,
			includesSchedulerWaits = true
		},
		arms = { immediate = var101 },
		evidence = {
			completionBarrier = "bindingDelivered",
			initialRenders = var97,
			finalRenders = var102,
			rerendersDuringDelivery = var102 - var97,
			deliveredAssignments = var100,
			completionPhaseCounts = t_1
		}
	}), p65.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "signal-item-publication",
		description = "Publishes recycled item values from the assignment signal into the bound host property.",
		responsibility = responsibilityCatalogModule.React.SignalsPublication,
		scale = { items = 20, visibleRows = 10, publicationsPerSample = 10 },
		timing = {
			unit = "ms",
			basis = "signalBindingPublication",
			operationsPerSample = 10,
			includesSchedulerWaits = true
		},
		arms = { immediate = var101 },
		evidence = {
			completionBarrier = "bindingDelivered",
			publishedAssignments = var100,
			rerendersDuringPublication = var102 - var97,
			completionPhaseCounts = t_1
		}
	})
end

local function createPresentationArm(p67, p68, p69, p70)
	-- upvalues: createItems (ref), hasItemText (ref), captureCompletionPhase (ref), observeCompletionPhases (ref)
	local var97 = p67.ViewRecycler.createRecyclableView(if p68 == "ReadyOnAssignment" then function(p71)
		-- upvalues: p67 (ref)
		return p67.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p67.SignalsReact.useSignalBinding(function(p72)
				-- upvalues: p71 (ref)
				return p71.itemSignal(p72).text
			end)
		})
	end else function(p71)
		-- upvalues: p67 (ref)
		return p67.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p67.SignalsReact.useSignalState(p71.itemSignal).text
		})
	end, { readiness = p68, hideWhilePending = p69 })
	local folder = Instance.new("Folder")
	local var98 = p67.ReactRoblox.createRoot(folder)
	local var99 = p67.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var100 = p67.ViewRecycler.DataSource.sequence(createItems(20), function(p71)
		return p71.id
	end)
	local act = p67.ReactRoblox.act
	local var101 = nil
	local var102 = nil
	local var103 = 10
	act(function()
		-- upvalues: var100 (ref), var99 (ref), p67 (ref), var97 (ref), var101 (ref), var102 (ref), var98 (ref), var103 (ref)
		local t = {
			overscan = 0,
			data = var100,
			layout = var99,
			axis = p67.ViewRecycler.Axis.Y,
			itemType = var97,
			diagnostics = var101
		}
		
		if var102 ~= nil then
			for i, v in var102 do
				t[i] = v
			end
		end
		var98:render(p67.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var103 * 40)
		}, {
			List = p67.React.createElement(p67.ViewRecycler.VirtualList, t)
		}))
	end)
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local var104 = scrollingFrame
	local var105 = true
	local t = {}
	
	return {
		run = function()
			-- upvalues: var105 (write), hasItemText (copy), folder (ref), p70 (ref), p67 (ref), var104 (ref), captureCompletionPhase (copy), t (ref), observeCompletionPhases (copy)
			var105 = not var105
			local var106 = if var105 then 0 else 400
			local var107 = if var105 then "Item 1" else "Item 11"
			local t_1 = {
				presentationCommitted = function()
					-- upvalues: hasItemText (copy), folder (copy), var107 (ref)
					return hasItemText(folder, var107)
				end
			}
			local t_2 = {}
			local var108 = p70()
			p67.ReactRoblox.act(function()
				-- upvalues: var104 (copy), var106 (ref), captureCompletionPhase (copy), t_1 (ref), t_2 (ref), t (copy)
				var104.CanvasPosition = Vector2.new(0, var106)
				captureCompletionPhase(t_1, t_2, t, "afterMutation")
			end)
			observeCompletionPhases(p67, t_1, `presentation commit to {var107}`, t, t_2)
			
			return (p70() - var108) * 1000
		end,
		getEvidence = function()
			-- upvalues: p68 (ref), p69 (ref), t (ref)
			return {
				presentations = 1,
				readiness = p68,
				hideWhilePending = p69,
				completionPhaseCounts = t
			}
		end,
		destroy = function()
			-- upvalues: p67 (ref), var98 (ref), var99 (ref), folder (ref)
			p67.ReactRoblox.act(function()
				-- upvalues: var98 (ref)
				var98:unmount()
			end)
			var99.destroy()
			folder:Destroy()
		end
	}
end

local function measurePresentationCommit(p71, p72, p73, p74)
	-- upvalues: createPresentationArm (ref), responsibilityCatalogModule (ref)
	local clock = p74.clock or os.clock
	local var104 = createPresentationArm(p71, "ReadyOnCommit", false, clock)
	local var105 = createPresentationArm(p71, "ReadyOnCommit", true, clock)
	local var106 = createPresentationArm(p71, "ReadyOnAssignment", false, clock)
	local var107 = p72.run(var104.run, p74)
	local var108 = p72.run(var105.run, p74)
	local var109 = p72.run(var106.run, p74)
	local t = {
		completionBarrier = "presentationCommitted",
		readyOnCommitVisible = var104.getEvidence(),
		readyOnCommitHidden = var105.getEvidence(),
		readyOnAssignment = var106.getEvidence()
	}
	var104.destroy()
	var105.destroy()
	var106.destroy()
	
	return p73.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "recyclable-view-readiness",
		description = "Measures assignment-to-presented-content latency for every readiness and pending policy.",
		responsibility = responsibilityCatalogModule.React.Presentation,
		scale = { items = 20, visibleRows = 10, scrollsPerSample = 1 },
		timing = {
			unit = "ms",
			basis = "presentationCommit",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = {
			readyOnCommitVisible = var107,
			readyOnCommitHidden = var108,
			readyOnAssignment = var109
		},
		evidence = t
	})
end

local function measureVirtualListTeardown(p71, p72, p73, p74)
	-- upvalues: createItems (ref), observeCompletionPhases (ref), hasItemText (ref), responsibilityCatalogModule (ref)
	local clock = p74.clock or os.clock
	local t = {}
	
	return p73.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "virtual-list-teardown",
		description = "Unmounts a complete VirtualList and destroys its layout and host container.",
		responsibility = responsibilityCatalogModule.React.Teardown,
		scale = { items = 20, visibleRows = 10 },
		timing = {
			unit = "ms",
			basis = "fullVirtualListTeardown",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = {
			viewRecycler = p72.run(function()
				-- upvalues: p71 (ref), createItems (copy), observeCompletionPhases (copy), hasItemText (copy), clock (ref), t (write)
				local var104 = 0
				local var105 = 0
				local var106 = p71.ViewRecycler.createRecyclableView(function(p75)
					-- upvalues: p71 (copy), var104 (write), var105 (write)
					local var107 = p71.SignalsReact.useSignalState(p75.itemSignal)
					p71.React.useEffect(function()
						-- upvalues: var104 (copy), var105 (copy)
						var104 += 1
						
						return function()
							-- upvalues: var105 (copy)
							var105 += 1
						end
					end, {})
					
					return p71.React.createElement("TextLabel", {
						Name = "Content",
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						Text = var107.text
					})
				end, { readiness = "ReadyOnCommit", hideWhilePending = true })
				local folder = Instance.new("Folder")
				local var107 = p71.ReactRoblox.createRoot(folder)
				local var108 = p71.ViewRecycler.Layout.uniform({ itemLength = 40 })
				local var109 = p71.ViewRecycler.DataSource.snapshot(createItems(20), function(p75)
					return p75.id
				end)
				local act = p71.ReactRoblox.act
				local var110 = nil
				local var111 = nil
				local var112 = 10
				act(function()
					-- upvalues: var109 (ref), var108 (ref), p71 (ref), var106 (ref), var110 (ref), var111 (ref), var107 (ref), var112 (ref)
					local t = {
						overscan = 0,
						data = var109,
						layout = var108,
						axis = p71.ViewRecycler.Axis.Y,
						itemType = var106,
						diagnostics = var110
					}
					
					if var111 ~= nil then
						for i, v in var111 do
							t[i] = v
						end
					end
					var107:render(p71.React.createElement("Frame", {
						Name = "BenchmarkHost",
						Size = UDim2.fromOffset(400, var112 * 40)
					}, {
						List = p71.React.createElement(p71.ViewRecycler.VirtualList, t)
					}))
				end)
				observeCompletionPhases(p71, {
					mounted = function()
						-- upvalues: var104 (write), hasItemText (copy), folder (ref)
						return var104 > 0 and hasItemText(folder, "Item 10")
					end
				}, "VirtualList teardown setup", {})
				local var113 = clock()
				p71.ReactRoblox.act(function()
					-- upvalues: var107 (ref)
					var107:unmount()
				end)
				var108.destroy()
				local count = #folder:GetDescendants()
				folder:Destroy()
				local var114 = (clock() - var113) * 1000
				assert(var105 == var104, "VirtualList teardown did not unmount every physical row")
				assert(count == 0, "VirtualList teardown retained host descendants")
				t = {
					completionBarrier = "allRowsUnmountedAndHostsRemoved",
					mountedRows = var104,
					unmountedRows = var105,
					descendantsAfterUnmount = count,
					completionPhaseCounts = { allRowsUnmountedAndHostsRemoved = { afterAct = 1 } }
				}
				
				return var114
			end, p74)
		},
		evidence = t
	})
end

local function createRecyclingTransferArm(p75, p76, p77)
	-- upvalues: findMeasuredObjects (ref), hasItemText (ref), captureCompletionPhase (ref), observeCompletionPhases (ref)
	local react = p75.React
	local signalsReact = p75.SignalsReact
	local viewRecycler = p75.ViewRecycler
	local var104 = 0
	local var105 = 0
	local var106 = viewRecycler.createRecyclableView(if p76 == "ReadyOnAssignment" then function(p78)
		-- upvalues: react (ref), var104 (write), var105 (write), signalsReact (ref)
		local var107 = react.useState("state-preserved")
		react.useEffect(function()
			-- upvalues: var104 (copy), var105 (copy)
			var104 += 1
			
			return function()
				-- upvalues: var105 (copy)
				var105 += 1
			end
		end, {})
		
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = signalsReact.useSignalBinding(function(p79)
				-- upvalues: p78 (ref), var107 (ref)
				return `{p78.itemSignal(p79).text}:{var107}`
			end)
		})
	end else function(p78)
		-- upvalues: p75 (ref), react (ref), var104 (write), var105 (write)
		local var107 = p75.SignalsReact.useSignalState(p78.itemSignal)
		local var108 = react.useState("state-preserved")
		react.useEffect(function()
			-- upvalues: var104 (copy), var105 (copy)
			var104 += 1
			
			return function()
				-- upvalues: var105 (copy)
				var105 += 1
			end
		end, {})
		
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = `{var107.text}:{var108}`
		})
	end, {
		readiness = p76,
		hideWhilePending = p76 == "ReadyOnCommit"
	})
	local var107 = viewRecycler.DataSource.sequence({ { id = "first", text = "First", height = 40 } }, function(p78)
		return p78.id
	end)
	local var108 = viewRecycler.DataSource.sequence({ { id = "second", text = "Second", height = 40 } }, function(p78)
		return p78.id
	end)
	local var109 = viewRecycler.Layout.uniform({ itemLength = 40 })
	local var110 = viewRecycler.Layout.uniform({ itemLength = 40 })
	local t = { current = nil }
	local frame = Instance.new("Frame")
	frame.Size = UDim2.fromOffset(400, 40)
	local var111 = p75.ReactRoblox.createRoot(frame)
	local viewRecycler_1 = p75.ViewRecycler
	local var112 = false
	local var113 = ""
	local var114 = nil
	local var115 = nil
	local var116 = 0
	local var117 = 0
	
	local function assignmentChanged(_, p78)
		-- upvalues: var112 (write), var117 (write), var116 (write), var113 (write), var114 (write), p77 (ref)
		if var112 then
			if p78 == nil then
				var117 += 1
				
				return
			end
			var116 += 1
			
			if p78.key == var113 and var114 == nil then
				var114 = p77()
			end
		end
	end
	
	local function presentationChanged(_, p78)
		-- upvalues: var112 (write), var113 (write), var115 (write), p77 (ref)
		if var112 and p78 ~= nil and (p78.key == var113 and var115 == nil) then
			var115 = p77()
		end
	end
	
	p75.ReactRoblox.act(function()
		-- upvalues: var111 (ref), react (ref), viewRecycler_1 (ref), t (ref), var107 (ref), var109 (ref), var106 (ref), assignmentChanged (ref), presentationChanged (ref), var108 (ref), var110 (ref)
		var111:render(react.createElement(viewRecycler_1.RecyclingViewport, {
			axis = viewRecycler_1.Axis.Y,
			scrollingFrameRef = t,
			scrollingFrameProps = { Name = "Viewport", CanvasSize = UDim2.fromOffset(0, 80) }
		}, {
			FirstRoot = react.createElement("Frame", {
				Name = "FirstRoot",
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, 0),
				Size = UDim2.fromOffset(400, 40)
			}, {
				List = react.createElement(viewRecycler_1.VirtualList, {
					overscan = 0,
					data = var107,
					layout = var109,
					axis = viewRecycler_1.Axis.Y,
					itemType = var106,
					_instrumentation = {
						assignmentChanged = assignmentChanged,
						presentationChanged = presentationChanged
					},
					scrollingFrameProps = { Name = "FirstList" }
				})
			}),
			SecondRoot = react.createElement("Frame", {
				Name = "SecondRoot",
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, 40),
				Size = UDim2.fromOffset(200, 40)
			}, {
				List = react.createElement(viewRecycler_1.VirtualList, {
					overscan = 0,
					data = var108,
					layout = var110,
					axis = viewRecycler_1.Axis.Y,
					itemType = var106,
					_instrumentation = {
						assignmentChanged = assignmentChanged,
						presentationChanged = presentationChanged
					},
					scrollingFrameProps = { Name = "SecondList" }
				})
			})
		}))
	end)
	local var118 = assert(findMeasuredObjects(frame, "First:state-preserved"))
	local listItemViewFrame1 = var118:FindFirstAncestor("ListItemViewFrame1")
	local var119 = assert(frame:FindFirstChild("FirstRoot", true))
	local var120 = assert(frame:FindFirstChild("SecondRoot", true))
	local var121 = true
	local t_1 = {}
	local var122 = 0
	local t_2 = {}
	
	return {
		run = function()
			-- upvalues: var121 (write), var119 (ref), var120 (ref), var113 (write), var114 (write), var115 (write), var112 (write), hasItemText (copy), frame (ref), findMeasuredObjects (copy), p77 (ref), var118 (ref), listItemViewFrame1 (ref), p75 (ref), t (ref), captureCompletionPhase (copy), t_1 (ref), observeCompletionPhases (copy), var122 (write), t_2 (write)
			var121 = not var121
			local var123 = if var121 then "First:state-preserved" else "Second:state-preserved"
			local var124 = if var121 then var119 else var120
			local var125 = if var121 then 0 else 40
			local var126 = if var121 then 400 else 200
			var113 = if var121 then "first" else "second"
			var114 = nil
			var115 = nil
			var112 = true
			local var127 = nil
			local var128 = nil
			local t_3 = {
				assignmentDelivered = function()
					-- upvalues: var114 (copy)
					return var114 ~= nil
				end,
				commitCompleted = function()
					-- upvalues: var115 (copy), hasItemText (copy), frame (copy), var123 (ref)
					return var115 ~= nil and hasItemText(frame, var123)
				end,
				layoutSettled = function()
					-- upvalues: findMeasuredObjects (copy), frame (copy), var123 (ref), var126 (ref), var127 (write), p77 (copy)
					local var129 = findMeasuredObjects(frame, var123)
					local var130 = var129 ~= nil and math.abs(var129.AbsoluteSize.X - var126) <= 0.01
					
					if var130 and var127 == nil then
						var127 = p77()
					end
					return var130
				end,
				hostObserved = function()
					-- upvalues: findMeasuredObjects (copy), frame (copy), var123 (ref), var118 (copy), var124 (ref), listItemViewFrame1 (copy), var128 (write), p77 (copy)
					local var129 = findMeasuredObjects(frame, var123)
					local var130 = var129 ~= nil and (var129 == var118 and (var129:IsDescendantOf(var124) and var129:FindFirstAncestor("ListItemViewFrame1") == listItemViewFrame1))
					
					if var130 and var128 == nil then
						var128 = p77()
					end
					return var130
				end,
				destinationPresented = function()
					-- upvalues: findMeasuredObjects (copy), frame (copy), var123 (ref), var118 (copy), var124 (ref), listItemViewFrame1 (copy), var126 (ref)
					local var129 = findMeasuredObjects(frame, var123)
					
					return var129 ~= nil and (var129 == var118 and (var129:IsDescendantOf(var124) and (var129:FindFirstAncestor("ListItemViewFrame1") == listItemViewFrame1 and math.abs(var129.AbsoluteSize.X - var126) <= 0.01)))
				end
			}
			local t_4 = {}
			local var129 = p77()
			p75.ReactRoblox.act(function()
				-- upvalues: t (copy), var125 (ref), captureCompletionPhase (copy), t_3 (ref), t_4 (ref), t_1 (copy)
				t.current.CanvasPosition = Vector2.new(0, var125)
				captureCompletionPhase(t_3, t_4, t_1, "afterMutation")
			end)
			observeCompletionPhases(p75, t_3, `recycling transfer to {var123}`, t_1, t_4)
			var122 += 1
			t_2 = {
				assignmentMs = (assert(var114, "fixed-size transfer assignment was not delivered") - var129) * 1000,
				commitMs = (assert(var115, "fixed-size transfer presentation was not committed") - var129) * 1000,
				layoutMs = (assert(var127, "fixed-size transfer layout did not settle") - var129) * 1000,
				hostMs = (assert(var128, "fixed-size transfer host was not observed") - var129) * 1000
			}
			
			return (p77() - var129) * 1000
		end,
		getEvidence = function()
			-- upvalues: var104 (write), var105 (write), var122 (write), findMeasuredObjects (copy), frame (ref), var121 (write), var118 (ref), var116 (write), var117 (write), t_2 (write), t_1 (ref)
			return {
				firstListWidth = 400,
				secondListWidth = 200,
				mounts = var104,
				unmounts = var105,
				transfers = var122,
				sameContentInstance = findMeasuredObjects(frame, if var121 then "First:state-preserved" else "Second:state-preserved") == var118,
				activations = var116,
				deactivations = var117,
				milestones = t_2,
				completionPhaseCounts = t_1
			}
		end,
		destroy = function()
			-- upvalues: p75 (ref), var111 (ref), var109 (ref), var110 (ref), frame (ref)
			p75.ReactRoblox.act(function()
				-- upvalues: var111 (copy)
				var111:unmount()
			end)
			var109.destroy()
			var110.destroy()
			frame:Destroy()
		end
	}
end

local function createWrappedRecyclingTransferArm(p75, p76, p77)
	-- upvalues: waitForHeartbeatToSettle (ref), findMeasuredObjects (ref), hasItemText (ref), captureCompletionPhase (ref), observeCompletionPhases (ref)
	local react = p75.React
	local viewRecycler = p75.ViewRecycler
	local var104 = 0
	local var105 = 0
	local var106 = 0
	local var107 = nil
	local var108 = nil
	local var109 = nil
	local var110 = nil
	local var111 = nil
	local var112 = viewRecycler.createRecyclableView(function(p78)
		-- upvalues: p75 (ref), react (ref), var104 (write), var105 (write)
		local var113 = p75.SignalsReact.useSignalState(p78.itemSignal)
		local var114 = react.useState("state-preserved")
		react.useEffect(function()
			-- upvalues: var104 (copy), var105 (copy)
			var104 += 1
			
			return function()
				-- upvalues: var105 (copy)
				var105 += 1
			end
		end, {})
		
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -20, 0, 0),
			Text = `{var113.text}:{var114}`
		})
	end, {
		readiness = p76,
		hideWhilePending = p76 == "ReadyOnCommit"
	})
	local repeated = string.rep("First wrapped transfer content ", 8)
	local repeated_1 = string.rep("Second wrapped transfer content ", 8)
	local var113 = viewRecycler.DataSource.sequence({ { id = "first-wrapped", height = 40, text = repeated } }, function(p78)
		return p78.id
	end)
	local var114 = viewRecycler.DataSource.sequence({
		{ id = "second-wrapped", height = 40, text = repeated_1 }
	}, function(p78)
		return p78.id
	end)
	local var115 = viewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local var116 = viewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local t = { current = nil }
	local screenGui = Instance.new("ScreenGui")
	screenGui.ResetOnSpawn = false
	screenGui.Parent = game:GetService("CoreGui")
	local var117 = p75.ReactRoblox.createRoot(screenGui)
	local var118 = false
	local var119 = ""
	
	local function assignmentChanged(_, p78)
		-- upvalues: var118 (write), var119 (write), var107 (write), p77 (ref)
		if var118 and p78 ~= nil and (p78.key == var119 and var107 == nil) then
			var107 = p77()
		end
	end
	
	local function presentationChanged(_, p78)
		-- upvalues: var118 (write), var119 (write), var108 (write), p77 (ref)
		if var118 and p78 ~= nil and (p78.key == var119 and var108 == nil) then
			var108 = p77()
		end
	end
	
	local function diagnostics(p78)
		-- upvalues: var118 (write), var110 (write), var106 (write), p77 (ref)
		if var118 and p78.kind == "measurementsProcessed" and (p78.accepted > 0 and var110 == nil) then
			var106 += p78.accepted
			var110 = p77()
		end
	end
	
	p75.ReactRoblox.act(function()
		-- upvalues: var117 (ref), react (ref), viewRecycler (ref), t (ref), var113 (ref), var115 (ref), var112 (ref), diagnostics (ref), assignmentChanged (ref), presentationChanged (ref), var114 (ref), var116 (ref)
		var117:render(react.createElement("Frame", { Name = "TransferHost", Size = UDim2.fromOffset(400, 40) }, {
			Viewport = react.createElement(viewRecycler.RecyclingViewport, {
				axis = viewRecycler.Axis.Y,
				scrollingFrameRef = t,
				scrollingFrameProps = { Name = "Viewport", CanvasSize = UDim2.fromOffset(0, 80) }
			}, {
				FirstRoot = react.createElement("Frame", {
					Name = "FirstRoot",
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(0, 0),
					Size = UDim2.fromOffset(400, 40)
				}, {
					List = react.createElement(viewRecycler.VirtualList, {
						overscan = 0,
						data = var113,
						layout = var115,
						axis = viewRecycler.Axis.Y,
						itemType = var112,
						diagnostics = diagnostics,
						_instrumentation = {
							assignmentChanged = assignmentChanged,
							presentationChanged = presentationChanged
						},
						scrollingFrameProps = { Name = "FirstList" }
					})
				}),
				SecondRoot = react.createElement("Frame", {
					Name = "SecondRoot",
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(0, 40),
					Size = UDim2.fromOffset(200, 40)
				}, {
					List = react.createElement(viewRecycler.VirtualList, {
						overscan = 0,
						data = var114,
						layout = var116,
						axis = viewRecycler.Axis.Y,
						itemType = var112,
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
	waitForHeartbeatToSettle(p75)
	waitForHeartbeatToSettle(p75)
	local var120 = assert(findMeasuredObjects(screenGui, `{repeated}:state-preserved`))
	local listItemViewFrame1 = var120:FindFirstAncestor("ListItemViewFrame1")
	local var121 = assert(screenGui:FindFirstChild("FirstRoot", true))
	local var122 = assert(screenGui:FindFirstChild("SecondRoot", true))
	local var123 = true
	local t_1 = {}
	local var124 = 0
	local t_2 = {}
	
	return {
		run = function()
			-- upvalues: var123 (write), repeated (ref), repeated_1 (ref), var119 (write), var121 (ref), var122 (ref), var115 (ref), var116 (ref), var107 (write), var108 (write), var109 (write), var110 (write), var111 (write), p77 (ref), var118 (write), hasItemText (copy), screenGui (ref), findMeasuredObjects (copy), var120 (ref), listItemViewFrame1 (ref), p75 (ref), t (ref), captureCompletionPhase (copy), t_1 (ref), observeCompletionPhases (copy), t_2 (write), var124 (write)
			var123 = not var123
			local var125 = `{if var123 then repeated else repeated_1}:state-preserved`
			var119 = if var123 then "first-wrapped" else "second-wrapped"
			local var126 = if var123 then var121 else var122
			local var127 = if var123 then 0 else 40
			local var128 = if var123 then 400 else 200
			local var129 = if var123 then var115 else var116
			var107 = nil
			var108 = nil
			var109 = nil
			var110 = nil
			var111 = nil
			local var130 = p77()
			var118 = true
			local t_3 = {
				assignmentDelivered = function()
					-- upvalues: var107 (copy)
					return var107 ~= nil
				end,
				commitCompleted = function()
					-- upvalues: var108 (copy), hasItemText (copy), screenGui (copy), var125 (ref)
					return var108 ~= nil and hasItemText(screenGui, var125)
				end,
				layoutSettled = function()
					-- upvalues: findMeasuredObjects (copy), screenGui (copy), var125 (ref), var128 (ref), var109 (copy), p77 (copy)
					local var131, var132 = findMeasuredObjects(screenGui, var125)
					local var133 = var131 ~= nil and (var132 ~= nil and (var131.AbsoluteSize.X == var128 - 20 and (var131.AbsoluteSize.Y > 0 and var132.AbsoluteSize.Y > 0)))
					
					if var133 and var109 == nil then
						var109 = p77()
					end
					return var133
				end,
				measurementSettled = function()
					-- upvalues: findMeasuredObjects (copy), screenGui (copy), var125 (ref), var129 (ref), var110 (copy), p77 (copy)
					local var131, var132 = findMeasuredObjects(screenGui, var125)
					local var133 = var131 ~= nil and (var132 ~= nil and math.abs(var129.getItemLayout(1).length - var132.AbsoluteSize.Y) <= 0.01)
					
					if var133 and var110 == nil then
						var110 = p77()
					end
					return var133
				end,
				hostObserved = function()
					-- upvalues: findMeasuredObjects (copy), screenGui (copy), var125 (ref), var120 (copy), var126 (ref), listItemViewFrame1 (copy), var111 (copy), p77 (copy)
					local var131 = findMeasuredObjects(screenGui, var125)
					local var132 = var131 ~= nil and (var131 == var120 and (var131:IsDescendantOf(var126) and var131:FindFirstAncestor("ListItemViewFrame1") == listItemViewFrame1))
					
					if var132 and var111 == nil then
						var111 = p77()
					end
					return var132
				end
			}
			local t_4 = {}
			p75.ReactRoblox.act(function()
				-- upvalues: t (copy), var127 (ref), captureCompletionPhase (copy), t_3 (ref), t_4 (ref), t_1 (copy)
				t.current.CanvasPosition = Vector2.new(0, var127)
				captureCompletionPhase(t_3, t_4, t_1, "afterMutation")
			end)
			observeCompletionPhases(p75, t_3, function()
				-- upvalues: findMeasuredObjects (copy), screenGui (copy), var125 (ref), var119 (copy), var107 (copy), var108 (copy), var109 (copy), var110 (copy), var111 (copy), var128 (ref)
				local var131, var132 = findMeasuredObjects(screenGui, var125)
				
				return `wrapped recycling transfer to {var119}; assignment={var107 ~= nil}, commit={var108 ~= nil}, content={var131 ~= nil}, layout={var109 ~= nil}, measurement={var110 ~= nil}, host={var111 ~= nil}, contentWidth={if var131 == nil then "nil" else var131.AbsoluteSize.X}, expectedWidth={var128 - 20}, hostHeight={if var132 == nil then "nil" else var132.AbsoluteSize.Y}`
			end, t_1, t_4)
			t_2 = {
				assignmentMs = (assert(var107, "wrapped transfer assignment was not delivered") - var130) * 1000,
				commitMs = (assert(var108, "wrapped transfer presentation was not committed") - var130) * 1000,
				layoutMs = (assert(var109, "wrapped transfer layout did not settle") - var130) * 1000,
				measurementMs = (assert(var110, "wrapped transfer measurement was not settled") - var130) * 1000,
				hostMs = (assert(var111, "wrapped transfer host was not observed") - var130) * 1000
			}
			var124 += 1
			
			return (p77() - var130) * 1000
		end,
		getEvidence = function()
			-- upvalues: var104 (write), var105 (write), var124 (write), findMeasuredObjects (copy), screenGui (ref), var123 (write), repeated (ref), repeated_1 (ref), var120 (ref), var106 (write), t_2 (write), t_1 (ref)
			return {
				mounts = var104,
				unmounts = var105,
				transfers = var124,
				sameContentInstance = findMeasuredObjects(screenGui, `{if var123 then repeated else repeated_1}:state-preserved`) == var120,
				acceptedMeasurements = var106,
				milestones = t_2,
				completionPhaseCounts = t_1
			}
		end,
		destroy = function()
			-- upvalues: p75 (ref), var117 (ref), var115 (ref), var116 (ref), screenGui (ref)
			p75.ReactRoblox.act(function()
				-- upvalues: var117 (copy)
				var117:unmount()
			end)
			var115.destroy()
			var116.destroy()
			screenGui:Destroy()
		end
	}
end

var62 = function(p78, p79, p80, p81)
	-- upvalues: createRecyclingTransferArm (ref), createWrappedRecyclingTransferArm (ref), responsibilityCatalogModule (ref)
	local clock = p81.clock or os.clock
	local var133 = createRecyclingTransferArm(p78, "ReadyOnCommit", clock)
	local var134 = createRecyclingTransferArm(p78, "ReadyOnAssignment", clock)
	local var135 = createWrappedRecyclingTransferArm(p78, "ReadyOnCommit", clock)
	local var136 = createWrappedRecyclingTransferArm(p78, "ReadyOnAssignment", clock)
	local var137 = p79.run(var133.run, p81)
	local var138 = p79.run(var134.run, p81)
	local var139 = p79.run(var135.run, p81)
	local var140 = p79.run(var136.run, p81)
	local t = {
		fixedSizeMeasurementMilestone = "notRequiredUniformLayout",
		untilCommit = var133.getEvidence(),
		immediate = var134.getEvidence()
	}
	local t_1 = {
		wrappedUntilCommit = var135.getEvidence(),
		wrappedImmediate = var136.getEvidence()
	}
	var133.destroy()
	var134.destroy()
	var135.destroy()
	var136.destroy()
	
	return p80.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "phased",
		workload = "completed-recycling-transfer",
		description = "Transfers one stateful physical host between different-width lists and observes presentation and derived bounds without remounting.",
		responsibility = responsibilityCatalogModule.React.StatefulTransfer,
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
		arms = { untilCommit = var137, immediate = var138 },
		evidence = t
	}), p80.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "phased",
		workload = "completed-automatic-size-recycling-transfer",
		description = "Transfers one wrapped AutomaticSize physical host across different-width measured lists.",
		responsibility = responsibilityCatalogModule.React.AutomaticSizeTransfer,
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
		arms = { wrappedUntilCommit = var139, wrappedImmediate = var140 },
		evidence = t_1
	}), p80.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "phased",
		workload = "viewport-active-gating",
		description = "Deactivates the leaving child list and activates the entering child list in one viewport transfer.",
		responsibility = responsibilityCatalogModule.React.ViewportActiveGating,
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
		arms = { untilCommit = var137, immediate = var138 },
		evidence = t
	})
end

local function measureRecyclingScopeHighWater(p78, p79, p80, p81, p82)
	-- upvalues: responsibilityCatalogModule (ref)
	local clock = p82.clock or os.clock
	local t = {}
	
	return p80.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "isolated",
		workload = "recycling-scope-high-water-lifecycle",
		description = "Creates one React RecyclingScope high-water batch and publishes only surviving hosts.",
		responsibility = responsibilityCatalogModule.React.ScopeOwnership,
		scale = { items = p81 },
		timing = {
			unit = "ms",
			basis = "recyclingScopeHighWaterBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p81
		},
		arms = {
			viewRecycler = p79.run(function()
				-- upvalues: p78 (ref), p81 (ref), clock (ref), t (write)
				local var133, var134 = p78.LifecycleWorkloads.recyclingScopeHighWater(p81, clock)
				t = var134
				
				return var133
			end, p82)
		},
		evidence = t
	})
end

local function measureCompositionChurn(p78, p79, p80, p81, p82)
	-- upvalues: responsibilityCatalogModule (ref)
	local clock = p82.clock or os.clock
	local var133 = p78.LifecycleWorkloads.compositionChurn(p81)
	local var134 = 0
	local var135 = 0
	local var136 = p79.run(function()
		-- upvalues: var133 (ref), clock (ref), var134 (write), var135 (write)
		local assignmentUpdates = var133.getAssignmentUpdates()
		local flushes = var133.getFlushes()
		local var137 = clock()
		var133.run()
		local var138 = (clock() - var137) * 1000
		var134 = var133.getAssignmentUpdates() - assignmentUpdates
		var135 = var133.getFlushes() - flushes
		
		return var138
	end, p82)
	var133.destroy()
	
	return p80.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "isolated",
		workload = "composed-recyclable-churn",
		description = "Coalesces one prop update per composed destination into a single placement flush.",
		responsibility = responsibilityCatalogModule.React.Composition,
		scale = { items = p81, updates = p81 },
		timing = {
			unit = "ms",
			basis = "compositionPlacementFlushBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p81
		},
		arms = { viewRecycler = var136 },
		evidence = {
			assignmentUpdates = var134,
			coalescedUpdates = p81,
			placementFlushes = var135,
			completionPhaseCounts = { compositionPublication = { synchronousFlush = 1 } }
		}
	})
end

local function runRecyclingStateMount(p78, p79, p80, p81)
	-- upvalues: measureRecyclingStateMountOverhead (ref), createItems (ref)
	p81 = p81 or {}
	local itemCount = p81.itemCount or 1000
	local recyclingStateVisibleRows = p81.recyclingStateVisibleRows or 40
	assert(itemCount >= 1 and itemCount % 1 == 0, "itemCount must be a positive integer")
	assert(recyclingStateVisibleRows >= 1 and (recyclingStateVisibleRows <= itemCount and recyclingStateVisibleRows % 1 == 0), "recyclingStateVisibleRows must be an integer within itemCount")
	
	return measureRecyclingStateMountOverhead(p78, p79, p80, createItems(itemCount), recyclingStateVisibleRows, p81)
end

return {
	run = function(p78, p79, p80, p81)
		-- upvalues: list (ref), createItems (ref), createItemTypes (ref), measureCompletedMount (ref), measureCompletedTraversal (ref), measureHostSizeSettlePhases (ref), measureAssignmentPropagation (ref), createPropagationScenario (ref), var62 (write), measureRecyclingScopeHighWater (ref), measureCompositionChurn (ref), measureDeclarativeReconciliation (ref), measurePropSynchronization (ref), measureAssignmentBinding (ref), measurePresentationCommit (ref), measureVirtualListTeardown (ref), runRecyclingStateMount (ref)
		p81 = p81 or {}
		local itemCount = p81.itemCount or 1000
		local scrollStepCount = p81.scrollStepCount or 10
		local mountVisibleRows = p81.mountVisibleRows or list
		local lifecycleItemCount = p81.lifecycleItemCount or 40
		local propagationItemCount = p81.propagationItemCount or 1000
		assert(itemCount >= 10 and itemCount % 1 == 0, "itemCount must be an integer of at least 10")
		assert(scrollStepCount >= 1 and scrollStepCount % 1 == 0, "scrollStepCount must be a positive integer")
		assert(propagationItemCount >= 20 and propagationItemCount % 1 == 0, "propagationItemCount must be an integer of at least 20")
		local var133 = createItems(itemCount)
		local var134, var135 = createItemTypes(p78)
		local t = {}
		
		for i, v in ipairs(mountVisibleRows) do
			assert(v >= 1 and v <= itemCount, "mount visible-row scale is out of range")
			table.insert(t, measureCompletedMount(p78, p79, p80, var133, var134, v, p81))
		end
		table.insert(t, measureCompletedTraversal(p78, p79, p80, var133, var134, itemCount, scrollStepCount, false, p81))
		table.insert(t, measureCompletedTraversal(p78, p79, p80, var133, var135, itemCount, scrollStepCount, true, p81))
		table.insert(t, measureHostSizeSettlePhases(p78, p79, p80, p81))
		local _, var136 = createItemTypes(p78)
		
		for i_1, v_1 in ipairs({
			"at-start",
			"in-middle",
			"before-visible-anchor",
			"at-end"
		}) do
			table.insert(t, measureAssignmentPropagation(p78, p79, p80, var136, createPropagationScenario(p78, v_1, propagationItemCount), propagationItemCount, p81))
		end
		local var137, var138, var139 = var62(p78, p79, p80, p81)
		table.insert(t, var137)
		table.insert(t, var138)
		table.insert(t, var139)
		table.insert(t, measureRecyclingScopeHighWater(p78, p79, p80, lifecycleItemCount, p81))
		table.insert(t, measureCompositionChurn(p78, p79, p80, lifecycleItemCount, p81))
		table.insert(t, measureDeclarativeReconciliation(p78, p79, p80, var134, p81))
		table.insert(t, measurePropSynchronization(p78, p79, p80, var134, p81))
		local var140, var141 = measureAssignmentBinding(p78, p79, p80, p81)
		table.insert(t, var140)
		table.insert(t, var141)
		table.insert(t, measurePresentationCommit(p78, p79, p80, p81))
		table.insert(t, measureVirtualListTeardown(p78, p79, p80, p81))
		table.insert(t, runRecyclingStateMount(p78, p79, p80, p81))
		
		return t
	end,
	runDeclarativeDataReconciliation = runDeclarativeDataReconciliation,
	runRecyclingStateMount = runRecyclingStateMount
}