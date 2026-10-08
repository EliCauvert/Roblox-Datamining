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
	
	if var4 == nil then
		return nil
	end
	local scrollingFrame = var4:FindFirstAncestorWhichIsA("ScrollingFrame")
	
	return var4.AbsolutePosition.Y - scrollingFrame.AbsolutePosition.Y + scrollingFrame.CanvasPosition.Y
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

local function createExpensiveItemChildren(p47, p48)
	local t = {
		Content = p47.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p48.text
		})
	}
	
	for i = 1, 24 do
		t[`Detail{i}`] = p47.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(i, 0),
			Size = UDim2.fromOffset(1, 1)
		})
	end
	return t
end

local function createExpensiveTraversalArm(p49, p50, p51, p52, p53, p54)
	-- upvalues: createExpensiveItemChildren (ref), observeCompletionPhases (ref), hasItemText (ref), mountedItemCount (ref), createOffsets (ref), captureCompletionPhase (ref)
	local virtualList
	local react = p49.React
	local t = { mounts = 0, unmounts = 0 }
	
	local function _()
		-- upvalues: react (ref), t (ref)
		react.useEffect(function()
			-- upvalues: t (copy)
			t.mounts += 1
			
			return function()
				-- upvalues: t (copy)
				t.unmounts += 1
			end
		end, {})
	end
	
	local _ = nil
	local var23 = nil
	
	if p53 == "advanced" then
		var23 = p49.ViewRecycler.createRecyclableView(function(p55)
			-- upvalues: p49 (ref), react (ref), t (ref), createExpensiveItemChildren (copy)
			local var24 = p49.SignalsReact.useSignalState(p55.itemSignal)
			react.useEffect(function()
				-- upvalues: t (copy)
				t.mounts += 1
				
				return function()
					-- upvalues: t (copy)
					t.unmounts += 1
				end
			end, {})
			
			return react.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, createExpensiveItemChildren(react, var24))
		end)
		virtualList = p49.ViewRecycler.VirtualList
	else
		virtualList = p49.ViewRecycler.createVirtualList({
			itemComponent = function(p55)
				-- upvalues: react (ref), t (ref), createExpensiveItemChildren (copy)
				react.useEffect(function()
					-- upvalues: t (copy)
					t.mounts += 1
					
					return function()
						-- upvalues: t (copy)
						t.unmounts += 1
					end
				end, {})
				
				return react.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, createExpensiveItemChildren(react, p55.item))
			end
		})
	end
	local var24 = 0
	local var25 = 0
	local var26 = 0
	local t_1 = {}
	local folder = Instance.new("Folder")
	local var27 = p49.ReactRoblox.createRoot(folder)
	local var28 = p49.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var29 = p49.ViewRecycler.DataSource.sequence(p50, function(p55)
		return p55.id
	end)
	p49.ReactRoblox.act(function()
		-- upvalues: var29 (ref), var28 (ref), p49 (ref), var24 (write), var23 (write), var27 (ref), react (ref), virtualList (write)
		local t = {
			overscan = 0,
			data = var29,
			layout = var28,
			axis = p49.ViewRecycler.Axis.Y,
			_instrumentation = {
				assignmentChanged = function(_, p55)
					-- upvalues: var24 (copy)
					if p55 ~= nil then
						var24 += 1
					end
				end
			}
		}
		
		if var23 ~= nil then
			t.itemType = var23
		end
		var27:render(react.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, 400)
		}, { List = react.createElement(virtualList, t) }))
	end)
	observeCompletionPhases(p49, {
		destinationRowCommitted = function()
			-- upvalues: hasItemText (copy), folder (ref)
			return hasItemText(folder, "Item 10")
		end
	}, `{p53} expensive traversal initial rows`, {})
	var25 = math.max(var25, mountedItemCount(folder))
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local var30 = createOffsets(p51, p52)
	
	return {
		run = function()
			-- upvalues: var24 (write), p54 (ref), var30 (ref), hasItemText (copy), folder (ref), p49 (ref), scrollingFrame (ref), captureCompletionPhase (copy), t_1 (ref), observeCompletionPhases (copy), p53 (ref), var25 (write), mountedItemCount (copy), var26 (write)
			local var31 = p54()
			
			for i, v in var30 do
				local var32 = math.floor(v / 40) + 1
				local t = {
					destinationRowCommitted = function()
						-- upvalues: hasItemText (copy), folder (copy), var32 (ref)
						return hasItemText(folder, `Item {var32}`)
					end
				}
				local t_2 = {}
				p49.ReactRoblox.act(function()
					-- upvalues: scrollingFrame (copy), v (ref), captureCompletionPhase (copy), t (ref), t_2 (ref), t_1 (copy)
					scrollingFrame.CanvasPosition = Vector2.new(0, v)
					captureCompletionPhase(t, t_2, t_1, "afterMutation")
				end)
				observeCompletionPhases(p49, t, `{p53} expensive traversal Item {var32}`, t_1, t_2)
				var25 = math.max(var25, mountedItemCount(folder))
			end
			local var33 = (p54() - var31) * 1000
			var26 = var24 - var24
			p49.ReactRoblox.act(function()
				-- upvalues: scrollingFrame (copy)
				scrollingFrame.CanvasPosition = Vector2.zero
			end)
			observeCompletionPhases(p49, {
				destinationRowCommitted = function()
					-- upvalues: hasItemText (copy), folder (copy)
					return hasItemText(folder, "Item 1")
				end
			}, `{p53} expensive traversal reset`, {})
			
			return var33
		end,
		getEvidence = function()
			-- upvalues: t (ref), var26 (write), var25 (write), t_1 (ref)
			return {
				mounts = t.mounts,
				unmounts = t.unmounts,
				assignmentDeliveriesPerTraversal = var26,
				mountedViewHighWater = var25,
				completionPhaseCounts = t_1
			}
		end,
		destroy = function()
			-- upvalues: p49 (ref), var27 (ref), var28 (ref), folder (ref)
			p49.ReactRoblox.act(function()
				-- upvalues: var27 (ref)
				var27:unmount()
			end)
			var28.destroy()
			folder:Destroy()
		end
	}
end

local function measureExpensiveUniformTraversalComparison(p55, p56, p57, p58, p59, p60, p61)
	-- upvalues: createExpensiveTraversalArm (ref), responsibilityCatalogModule (ref)
	local clock = p61.clock or os.clock
	local var31 = createExpensiveTraversalArm(p55, p58, p59, p60, "advanced", clock)
	local var32 = createExpensiveTraversalArm(p55, p58, p59, p60, "specialized", clock)
	local var33 = p56.run(var31.run, p61)
	local var34 = p56.run(var32.run, p61)
	var31.destroy()
	var32.destroy()
	local t = {
		completionBarrier = "destinationRowCommitted",
		reactWorkFlush = "ReactRoblox.actWithMockScheduler",
		advanced = var31.getEvidence(),
		specialized = var32.getEvidence()
	}
	assert(t.advanced.mounts == t.specialized.mounts, "expensive traversal mount evidence differs")
	assert(t.advanced.unmounts == t.specialized.unmounts, "expensive traversal unmount evidence differs")
	assert(t.advanced.assignmentDeliveriesPerTraversal == t.specialized.assignmentDeliveriesPerTraversal, "expensive traversal Assignment evidence differs")
	assert(t.advanced.mountedViewHighWater == t.specialized.mountedViewHighWater, "expensive traversal mounted-view high-water differs")
	
	return p57.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "expensive-uniform-traversal-interface-comparison",
		description = "Compares expensive fixed-height Item traversal through advanced VirtualList and createVirtualList.",
		responsibility = responsibilityCatalogModule.React.MountScroll,
		scale = {
			visibleRows = 10,
			itemLength = 40,
			overscan = 0,
			expensiveItemChildren = 24,
			items = p59,
			scrollSteps = p60
		},
		timing = {
			unit = "ms",
			basis = "completedScrollTraversal",
			includesSchedulerWaits = true,
			operationsPerSample = p60
		},
		arms = {
			advancedVirtualList = var33,
			specializedFactory = var34
		},
		evidence = t
	})
end

local function measureStatefulAssignmentRenderControl(value, p55, p56, p57)
	-- upvalues: hasItemText (ref), observeCompletionPhases (ref), responsibilityCatalogModule (ref)
	local clock = p57.clock or os.clock
	local var31 = value.Signals.createSignal({ entryHeight = 40 })
	local list = {
		{
			id = "item1",
			text = "Item 1",
			height = 40,
			presentationSignal = var31
		},
		{
			id = "item2",
			text = "Item 2",
			height = 40,
			presentationSignal = var31
		}
	}
	local var32 = 0
	local var33 = 0
	local var34 = 1
	local var35, var36 = value.Signals.createSignal(list[var34])
	
	local function StatefulBaseline()
		-- upvalues: var32 (write), value (ref), var35 (ref), var33 (write)
		var32 += 1
		local var37 = value.SignalsReact.useSignalState(var35)
		local var38 = value.SignalsReact.useSignalState(var37.presentationSignal)
		value.React.useLayoutEffect(function()
			-- upvalues: var33 (copy)
			var33 += 1
		end)
		
		return value.React.createElement("TextLabel", {
			Name = "Content",
			Size = UDim2.fromOffset(400, var38.entryHeight),
			Text = var37.text
		})
	end
	
	local folder = Instance.new("Folder")
	local var37 = value.ReactRoblox.createRoot(folder)
	value.ReactRoblox.act(function()
		-- upvalues: var37 (ref), value (ref), StatefulBaseline (ref)
		var37:render(value.React.createElement(StatefulBaseline))
	end)
	local var38 = 0
	local var39 = 0
	
	local function runBaseline()
		-- upvalues: var32 (write), var33 (write), var34 (write), clock (ref), value (ref), var36 (ref), list (ref), var38 (write), var39 (write), hasItemText (copy), folder (ref)
		var34 = if var34 == 1 then 2 else 1
		local var40 = clock()
		value.ReactRoblox.act(function()
			-- upvalues: var36 (copy), list (copy), var34 (copy)
			var36(list[var34])
		end)
		local var41 = (clock() - var40) * 1000
		var38 = var32 - var32
		var39 = var33 - var33
		assert(hasItemText(folder, list[var34].text), "baseline content did not commit")
		
		return var41
	end
	
	local var40 = 0
	local var41 = 0
	local var42 = 0
	local var43 = value.ViewRecycler.createRecyclableView(function(p58)
		-- upvalues: var40 (write), value (ref), var41 (write)
		var40 += 1
		local var44 = value.SignalsReact.useSignalState(p58.itemSignal)
		local var45 = value.SignalsReact.useSignalState(var44.presentationSignal)
		value.React.useLayoutEffect(function()
			-- upvalues: var41 (copy)
			var41 += 1
		end)
		
		return value.React.createElement("TextLabel", {
			Name = "Content",
			Size = UDim2.fromOffset(400, var45.entryHeight),
			Text = var44.text
		})
	end, { readiness = "ReadyOnCommit" })
	local var44 = value.ViewRecycler.DataSource.sequence(list, function(p58)
		return p58.id
	end)
	local var45 = value.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local folder_1 = Instance.new("Folder")
	local var46 = value.ReactRoblox.createRoot(folder_1)
	local t = {
		_instrumentation = {
			assignmentChanged = function(_, p58)
				-- upvalues: var42 (write)
				if p58 ~= nil then
					var42 += 1
				end
			end
		}
	}
	local act = value.ReactRoblox.act
	local var47 = nil
	local var48 = 1
	act(function()
		-- upvalues: var44 (ref), var45 (ref), value (ref), var43 (ref), var47 (ref), t (ref), var46 (ref), var48 (ref)
		local t = {
			overscan = 0,
			data = var44,
			layout = var45,
			axis = value.ViewRecycler.Axis.Y,
			itemType = var43,
			diagnostics = var47
		}
		
		if t ~= nil then
			for i, v in t do
				t[i] = v
			end
		end
		var46:render(value.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var48 * 40)
		}, {
			List = value.React.createElement(value.ViewRecycler.VirtualList, t)
		}))
	end)
	local scrollingFrame = folder_1:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local var49 = scrollingFrame
	local var50 = 1
	local var51 = 0
	local var52 = 0
	local var53 = 0
	local var54 = p55.run(runBaseline, p57)
	local var55 = p55.run(function()
		-- upvalues: var40 (write), var41 (write), var42 (write), var50 (write), list (ref), clock (ref), value (ref), var49 (ref), observeCompletionPhases (copy), hasItemText (copy), folder_1 (ref), var51 (write), var52 (write), var53 (write)
		var50 = if var50 == 1 then 2 else 1
		local text = list[var50].text
		local var56 = clock()
		value.ReactRoblox.act(function()
			-- upvalues: var49 (copy), var50 (copy)
			var49.CanvasPosition = Vector2.new(0, (var50 - 1) * 40)
		end)
		observeCompletionPhases(value, {
			destinationRowCommitted = function()
				-- upvalues: hasItemText (copy), folder_1 (copy), text (ref)
				return hasItemText(folder_1, text)
			end
		}, `stateful render control {text}`, {})
		local var57 = (clock() - var56) * 1000
		var51 = var40 - var40
		var52 = var41 - var41
		var53 = var42 - var42
		
		return var57
	end, p57)
	value.ReactRoblox.act(function()
		-- upvalues: var37 (ref)
		var37:unmount()
	end)
	folder:Destroy()
	value.ReactRoblox.act(function()
		-- upvalues: var46 (ref)
		var46:unmount()
	end)
	var45.destroy()
	folder_1:Destroy()
	assert(var38 == var51, "ViewRecycler changed stateful row render count")
	assert(var39 == var52, "ViewRecycler changed stateful row commit count")
	assert(var53 == 1, "expected exactly one recycled Assignment per update")
	
	return p56.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "stateful-assignment-render-control",
		description = "Compares stateful render invocations for a direct Signals update and one recycled Assignment.",
		responsibility = responsibilityCatalogModule.React.StatefulTransfer,
		scale = { items = 2, visibleRows = 1, signalsPerRow = 2 },
		timing = {
			unit = "ms",
			basis = "committedStatefulUpdate",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = { directSignalsReact = var54, viewRecycler = var55 },
		evidence = {
			additionalRendersFromViewRecycler = var51 - var38,
			additionalCommitsFromViewRecycler = var52 - var39,
			directSignalsReact = { rendersPerUpdate = var38, commitsPerUpdate = var39 },
			viewRecycler = {
				rendersPerAssignment = var51,
				commitsPerAssignment = var52,
				assignmentsPerUpdate = var53
			}
		}
	})
end

local function measureHostSizeSettlePhases(value, p58, p59, p60)
	-- upvalues: observeCompletionPhases (ref), hasItemText (ref), waitForHeartbeatToSettle (ref), findMeasuredObjects (ref), flushDeferredWork (ref), recordSizeComparison (ref), responsibilityCatalogModule (ref)
	local clock = p60.clock or os.clock
	local screenGui = Instance.new("ScreenGui")
	screenGui.ResetOnSpawn = false
	screenGui.Parent = game:GetService("CoreGui")
	local var49 = value.ReactRoblox.createRoot(screenGui)
	local var50 = value.ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local repeated = string.rep("This response grows enough to wrap across the measured row. ", 8)
	local var51 = value.ViewRecycler.createRecyclableView(function(p61)
		-- upvalues: value (ref)
		return value.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.fromOffset(10, 0),
			Size = UDim2.new(1, -20, 0, 0),
			Text = value.SignalsReact.useSignalState(p61.itemSignal).text
		})
	end, { readiness = "ReadyOnCommit", hideWhilePending = true })
	local t = {
		id = "measurement-probe",
		text = "Short response",
		height = 40
	}
	local var52 = value.ViewRecycler.DataSource.sequence({ t }, function(p61)
		return p61.id
	end)
	local var53 = 0
	
	local var54 = function(p61)
		-- upvalues: var53 (write)
		if p61.kind == "measurementsProcessed" then
			var53 += p61.accepted
		end
	end
	
	local act = value.ReactRoblox.act
	local var55 = nil
	local var56 = 3
	act(function()
		-- upvalues: var52 (ref), var50 (ref), value (ref), var51 (ref), var54 (ref), var55 (ref), var49 (ref), var56 (ref)
		local t = {
			overscan = 0,
			data = var52,
			layout = var50,
			axis = value.ViewRecycler.Axis.Y,
			itemType = var51,
			diagnostics = var54
		}
		
		if var55 ~= nil then
			for i, v in var55 do
				t[i] = v
			end
		end
		var49:render(value.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var56 * 40)
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
			-- upvalues: var53 (write)
			return var53 > 0
		end
	}, "initial wrapped measured row", {})
	waitForHeartbeatToSettle(value)
	waitForHeartbeatToSettle(value)
	local var57 = 0
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local t_6 = { host = {}, content = {} }
	local var58 = 0
	local var59 = p58.run(function()
		-- upvalues: var58 (write), var57 (write), repeated (ref), var53 (write), findMeasuredObjects (copy), screenGui (ref), t_1 (ref), clock (ref), value (ref), var52 (ref), t (ref), flushDeferredWork (copy), waitForHeartbeatToSettle (copy), t_4 (ref), t_5 (ref), recordSizeComparison (copy), t_2 (ref), t_6 (ref), t_3 (ref)
		var58 += 1
		var57 = (var57 + 1) % 2
		local var60 = if var57 == 0 then "Short response" else repeated
		local var61 = if var57 == 0 then "short" else "long"
		local t_7 = {}
		local t_8 = {}
		local var62 = nil
		
		local function _(p61)
			-- upvalues: findMeasuredObjects (copy), screenGui (copy), var60 (ref), t_8 (ref), t_7 (ref), var62 (write), var53 (copy), var53 (ref), t_1 (copy)
			local var63, var64 = findMeasuredObjects(screenGui, var60)
			
			if var63 ~= nil then
				t_8[p61] = var63.AbsoluteSize.Y
			end
			if var64 ~= nil then
				t_7[p61] = var64.AbsoluteSize.Y
			end
			if var62 == nil and var53 < var53 then
				var62 = p61
				local var65 = t_1
				local measurementAccepted = var65.measurementAccepted
				
				if measurementAccepted == nil then
					measurementAccepted = {}
					var65.measurementAccepted = measurementAccepted
				end
				measurementAccepted[p61] = (measurementAccepted[p61] or 0) + 1
			end
		end
		
		local var63 = clock()
		value.ReactRoblox.act(function()
			-- upvalues: var52 (copy), t (copy), var60 (ref), findMeasuredObjects (copy), screenGui (copy), t_8 (ref), t_7 (ref), var62 (write), var53 (copy), var53 (ref), t_1 (copy)
			var52.setItem(1, { id = t.id, text = var60, height = t.height })
			local var64, var65 = findMeasuredObjects(screenGui, var60)
			
			if var64 ~= nil then
				t_8.afterMutation = var64.AbsoluteSize.Y
			end
			if var65 ~= nil then
				t_7.afterMutation = var65.AbsoluteSize.Y
			end
			if var62 == nil and var53 < var53 then
				var62 = "afterMutation"
				local var66 = t_1
				local measurementAccepted = var66.measurementAccepted
				
				if measurementAccepted == nil then
					measurementAccepted = {}
					var66.measurementAccepted = measurementAccepted
				end
				measurementAccepted.afterMutation = (measurementAccepted.afterMutation or 0) + 1
			end
		end)
		local var64, var65 = findMeasuredObjects(screenGui, var60)
		
		if var64 ~= nil then
			t_8.afterAct = var64.AbsoluteSize.Y
		end
		if var65 ~= nil then
			t_7.afterAct = var65.AbsoluteSize.Y
		end
		if var62 == nil and var53 < var53 then
			var62 = "afterAct"
			local var66 = t_1
			local measurementAccepted = var66.measurementAccepted
			
			if measurementAccepted == nil then
				measurementAccepted = {}
				var66.measurementAccepted = measurementAccepted
			end
			measurementAccepted.afterAct = (measurementAccepted.afterAct or 0) + 1
		end
		value.ReactRoblox.act(flushDeferredWork)
		local var67, var68 = findMeasuredObjects(screenGui, var60)
		
		if var67 ~= nil then
			t_8.deferred = var67.AbsoluteSize.Y
		end
		if var68 ~= nil then
			t_7.deferred = var68.AbsoluteSize.Y
		end
		if var62 == nil and var53 < var53 then
			var62 = "deferred"
			local var69 = t_1
			local measurementAccepted = var69.measurementAccepted
			
			if measurementAccepted == nil then
				measurementAccepted = {}
				var69.measurementAccepted = measurementAccepted
			end
			measurementAccepted.deferred = (measurementAccepted.deferred or 0) + 1
		end
		for i = 1, 3 do
			waitForHeartbeatToSettle(value)
			local var70 = `heartbeat{i}Settled`
			local var71, var72 = findMeasuredObjects(screenGui, var60)
			
			if var71 ~= nil then
				t_8[var70] = var71.AbsoluteSize.Y
			end
			if var72 ~= nil then
				t_7[var70] = var72.AbsoluteSize.Y
			end
			if var62 == nil and var53 < var53 then
				var62 = var70
				local var73 = t_1
				local measurementAccepted = var73.measurementAccepted
				
				if measurementAccepted == nil then
					measurementAccepted = {}
					var73.measurementAccepted = measurementAccepted
				end
				measurementAccepted[var70] = (measurementAccepted[var70] or 0) + 1
			end
		end
		local var74 = (clock() - var63) * 1000
		
		if var62 == nil then
			local var75 = t_1
			local measurementAccepted = var75.measurementAccepted
			
			if measurementAccepted == nil then
				measurementAccepted = {}
				var75.measurementAccepted = measurementAccepted
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
					update = var58,
					text = var61,
					observed = v,
					settled = heartbeat3Settled
				}
			end
		end
		for i_2, v_1 in t_8 do
			recordSizeComparison(t_3, i_2, v_1, heartbeat3Settled_1)
			
			if v_1 ~= heartbeat3Settled_1 and t_6.content[i_2] == nil then
				t_6.content[i_2] = {
					update = var58,
					text = var61,
					observed = v_1,
					settled = heartbeat3Settled_1
				}
			end
		end
		return var74
	end, p60)
	value.ReactRoblox.act(function()
		-- upvalues: var49 (ref)
		var49:unmount()
	end)
	var50.destroy()
	screenGui:Destroy()
	
	return p59.create({
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
		arms = { viewRecycler = var59 },
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

local function runAssignmentPropagationSample(value, p61, p62, p63, p64)
	-- upvalues: observeCompletionPhases (ref), hasItemText (ref), waitForHeartbeatToSettle (ref), findMeasuredObjects (ref)
	local clock = p64.clock or os.clock
	local list = table.create(p63)
	
	for i = 1, p63 do
		list[i] = { height = 40, id = `item{i}`, text = `Item {i}` }
	end
	local var76
	local t = {
		height = 80,
		id = `inserted-{p62.name}`,
		text = `Inserted {p62.name}`
	}
	local folder = Instance.new("Folder")
	local var77 = value.ReactRoblox.createRoot(folder)
	local var78 = value.ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local var79 = value.ViewRecycler.DataSource.sequence(list, function(p65)
		return p65.id
	end)
	local var80 = nil
	local var81 = nil
	local var82 = nil
	local var83 = nil
	local var84 = nil
	local var85 = false
	local var86 = nil
	local t_1 = { data = 0, measurement = 0, programmaticScroll = 0 }
	local t_2 = {}
	
	local var87 = function(p65)
		-- upvalues: var85 (write), var80 (write), var81 (write), clock (ref), var82 (write), t_1 (ref)
		if not var85 then return end
		if p65.kind == "measurementsProcessingStarted" and var80 ~= nil then
			var81 = var81 or clock()
			
			return
		elseif p65.kind == "measurementsProcessed" and p65.accepted > 0 and var80 ~= nil then
			var82 = var82 or clock()
			
			return
		elseif p65.kind == "scrollCorrection" then
			t_1[p65.source] += p65.delta
		end
	end
	
	local t_3 = {
		overscan = p62.overscan,
		preserveScrollPositionOnChange = p62.preserveScrollPositionOnChange,
		initialScrollAlignment = p62.initialScrollAlignment,
		autoScrollOnChange = p62.autoScrollOnChange,
		_instrumentation = {
			assignmentChanged = function(_, p65)
				-- upvalues: var85 (write), t (ref), var80 (write), clock (ref)
				if var85 and p65 ~= nil and (p65.key == t.id and var80 == nil) then
					var80 = clock()
				end
			end
		},
		onContentLengthChanged = function(p65)
			-- upvalues: var85 (write), p62 (ref), var86 (write)
			if var85 and math.abs(p65 - p62.finalContentLength) <= 0.01 then
				var86 = p65
			end
		end
	}
	local var88 = 10
	value.ReactRoblox.act(function()
		-- upvalues: var79 (ref), var78 (ref), value (ref), p61 (ref), var87 (ref), t_3 (ref), var77 (ref), var88 (ref)
		local t = {
			overscan = 0,
			data = var79,
			layout = var78,
			axis = value.ViewRecycler.Axis.Y,
			itemType = p61,
			diagnostics = var87
		}
		
		if t_3 ~= nil then
			for i, v in t_3 do
				t[i] = v
			end
		end
		var77:render(value.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var88 * 40)
		}, {
			List = value.React.createElement(value.ViewRecycler.VirtualList, t)
		}))
	end)
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	value.ReactRoblox.act(function()
		-- upvalues: scrollingFrame (ref), p62 (ref)
		scrollingFrame.CanvasPosition = Vector2.new(0, p62.initialOffset)
	end)
	observeCompletionPhases(value, {
		destinationRowCommitted = function()
			-- upvalues: hasItemText (copy), folder (ref), p62 (ref)
			return hasItemText(folder, p62.initialDestinationText)
		end,
		initialCanvasSettled = function()
			-- upvalues: scrollingFrame (ref), p63 (ref)
			return math.abs(scrollingFrame.CanvasSize.Y.Offset - p63 * 40) <= 0.01
		end
	}, `prepare {p62.name} insertion`, {})
	waitForHeartbeatToSettle(value)
	assert(math.abs(scrollingFrame.CanvasSize.Y.Offset - p63 * 40) <= 0.01, `{p62.name}: initial canvas size did not settle (expected {p63 * 40}, got {scrollingFrame.CanvasSize.Y.Offset})`)
	assert(math.abs(scrollingFrame.CanvasPosition.Y - p62.initialOffset) <= 0.01, `{p62.name}: initial scroll position did not settle`)
	var85 = true
	value.ReactRoblox.act(function()
		-- upvalues: var79 (ref), p62 (ref), t (ref)
		var79.insert(p62.insertIndex, t)
	end)
	local var89 = if p62.name == "before-visible-anchor" then 40 else 0
	local var90 = if p62.name == "before-visible-anchor" then 40 else 0
	local t_4 = {}
	
	local function captureLibraryPublication()
		-- upvalues: folder (ref), t (ref), findMeasuredObjects (copy), p62 (ref), var80 (write), var81 (write), var82 (write), var86 (write), t_1 (ref), var89 (ref), var90 (ref), var83 (write), clock (ref)
		local var91
		local _, var92 = findMeasuredObjects(folder, t.text)
		
		if var92 == nil then
			var91 = nil
		else
			local scrollingFrame = var92:FindFirstAncestorWhichIsA("ScrollingFrame")
			var91 = var92.AbsolutePosition.Y - scrollingFrame.AbsolutePosition.Y + scrollingFrame.CanvasPosition.Y
		end
		local var93
		local _, var94 = findMeasuredObjects(folder, `Item {string.sub(p62.neighborKey, 5)}`)
		
		if var94 == nil then
			var93 = nil
		else
			local scrollingFrame = var94:FindFirstAncestorWhichIsA("ScrollingFrame")
			var93 = var94.AbsolutePosition.Y - scrollingFrame.AbsolutePosition.Y + scrollingFrame.CanvasPosition.Y
		end
		local var95 = var80 ~= nil and (var81 ~= nil and (var82 ~= nil and (var86 ~= nil and (var91 ~= nil and (math.abs(var91 - p62.insertedStartOffset) <= 0.01 and (var93 ~= nil and (math.abs(var93 - p62.neighborStartOffset) <= 0.01 and (math.abs(t_1.data - var89) <= 0.01 and math.abs(t_1.measurement - var90) <= 0.01))))))))
		
		if var95 and var83 == nil then
			var83 = clock()
		end
		return var95
	end
	
	observeCompletionPhases(value, {
		libraryOutputsPublished = captureLibraryPublication,
		hostValuesObserved = function()
			-- upvalues: captureLibraryPublication (ref), folder (ref), t (ref), findMeasuredObjects (copy), p62 (ref), t_4 (write), var80 (write), var81 (write), var82 (write), var83 (write), var86 (write), scrollingFrame (ref), var84 (write), clock (ref)
			local var91
			captureLibraryPublication()
			local _, var92 = findMeasuredObjects(folder, t.text)
			
			if var92 == nil then
				var91 = nil
			else
				local scrollingFrame_1 = var92:FindFirstAncestorWhichIsA("ScrollingFrame")
				var91 = var92.AbsolutePosition.Y - scrollingFrame_1.AbsolutePosition.Y + scrollingFrame_1.CanvasPosition.Y
			end
			local var93
			local _, var94 = findMeasuredObjects(folder, `Item {string.sub(p62.neighborKey, 5)}`)
			
			if var94 == nil then
				var93 = nil
			else
				local scrollingFrame_1 = var94:FindFirstAncestorWhichIsA("ScrollingFrame")
				var93 = var94.AbsolutePosition.Y - scrollingFrame_1.AbsolutePosition.Y + scrollingFrame_1.CanvasPosition.Y
			end
			t_4 = {
				assigned = var80 ~= nil,
				measurementStarted = var81 ~= nil,
				measurementProcessed = var82 ~= nil,
				libraryPublished = var83 ~= nil,
				observedContentLength = var86,
				canvasLength = scrollingFrame.CanvasSize.Y.Offset,
				scrollOffset = scrollingFrame.CanvasPosition.Y,
				insertedOffset = var91,
				neighborOffset = var93
			}
			local var95 = var80 ~= nil and (var83 ~= nil and (math.abs(scrollingFrame.CanvasSize.Y.Offset - p62.finalContentLength) <= 0.01 and math.abs(scrollingFrame.CanvasPosition.Y - p62.finalScrollOffset) <= 0.01))
			
			if var95 and var84 == nil then
				var84 = clock()
			end
			return var95
		end
	}, function()
		-- upvalues: p62 (ref), t_4 (write)
		return `{p62.name} assignment, measurement, and propagation; assigned={t_4.assigned}, measurementStarted={t_4.measurementStarted}, measurementProcessed={t_4.measurementProcessed}, libraryPublished={t_4.libraryPublished}, content={t_4.observedContentLength}, canvas={t_4.canvasLength}, scroll={t_4.scrollOffset}, inserted={t_4.insertedOffset}, neighbor={t_4.neighborOffset}`
	end, t_2)
	local var91 = assert(var80, `{p62.name}: inserted item was not assigned`)
	local var92 = assert(var81, `{p62.name}: inserted item measurement did not reach Core`)
	local var93 = assert(var82, `{p62.name}: inserted item measurement was not accepted`)
	local var94 = assert(var83, `{p62.name}: library outputs were not fully published`)
	local var95 = assert(var84, `{p62.name}: host values did not fully propagate`)
	assert(var91 <= var92, `{p62.name}: measurement preceded assignment`)
	assert(var92 <= var93, `{p62.name}: measurement completed before it started`)
	assert(var93 <= var94, `{p62.name}: library outputs preceded measurement`)
	assert(var94 <= var95, `{p62.name}: host values preceded library outputs`)
	assert(math.abs(t_1.data - var89) <= 0.01, `{p62.name}: unexpected insertion anchor correction`)
	assert(math.abs(t_1.measurement - var90) <= 0.01, `{p62.name}: unexpected measurement anchor correction`)
	local t_5 = { insertIndex = p62.insertIndex }
	local var96, var97 = findMeasuredObjects(folder, t.text)
	
	if var97 == nil then
		var76 = nil
	else
		local scrollingFrame_1 = var97:FindFirstAncestorWhichIsA("ScrollingFrame")
		var76 = var97.AbsolutePosition.Y - scrollingFrame_1.AbsolutePosition.Y + scrollingFrame_1.CanvasPosition.Y
	end
	local var98
	t_5.insertedStartOffset = var76
	t_5.neighborKey = p62.neighborKey
	var96, var266 = findMeasuredObjects(folder, `Item {string.sub(p62.neighborKey, 5)}`)
	
	if var266 == nil then
		var98 = nil
	else
		local scrollingFrame_1 = var266:FindFirstAncestorWhichIsA("ScrollingFrame")
		var98 = var266.AbsolutePosition.Y - scrollingFrame_1.AbsolutePosition.Y + scrollingFrame_1.CanvasPosition.Y
	end
	t_5.neighborStartOffset = var98
	t_5.contentLength = scrollingFrame.CanvasSize.Y.Offset
	t_5.scrollOffset = scrollingFrame.CanvasPosition.Y
	t_5.dataAnchorCorrection = t_1.data
	t_5.measurementAnchorCorrection = t_1.measurement
	t_5.completionPhaseCounts = t_2
	t_5.assignmentToMeasurementStartMs = (var92 - var91) * 1000
	t_5.measurementProcessingMs = (var93 - var92) * 1000
	t_5.measurementProcessedToLibraryPublicationMs = (var94 - var93) * 1000
	t_5.libraryPublicationToHostObservationMs = (var95 - var94) * 1000
	t_5.assignmentToHostObservationMs = (var95 - var91) * 1000
	value.ReactRoblox.act(function()
		-- upvalues: var77 (ref)
		var77:unmount()
	end)
	var78.destroy()
	folder:Destroy()
	
	return t_5
end

local function measureAssignmentPropagation(value, p65, p66, p67, p68, p69, p70)
	-- upvalues: runAssignmentPropagationSample (ref), responsibilityCatalogModule (ref)
	local t = {}
	
	return p66.create({
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
			items = p69,
			scenario = p68.name
		},
		timing = {
			unit = "ms",
			basis = "assignmentToMilestone",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = {
			assignmentToMeasurementStart = p65.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p67 (ref), p68 (ref), p69 (ref), p70 (ref), t (write)
				local var89 = runAssignmentPropagationSample(value, p67, p68, p69, p70)
				t = var89
				
				return var89.assignmentToMeasurementStartMs
			end, p70),
			measurementProcessing = p65.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p67 (ref), p68 (ref), p69 (ref), p70 (ref), t (write)
				local var89 = runAssignmentPropagationSample(value, p67, p68, p69, p70)
				t = var89
				
				return var89.measurementProcessingMs
			end, p70),
			measurementProcessedToLibraryPublication = p65.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p67 (ref), p68 (ref), p69 (ref), p70 (ref), t (write)
				local var89 = runAssignmentPropagationSample(value, p67, p68, p69, p70)
				t = var89
				
				return var89.measurementProcessedToLibraryPublicationMs
			end, p70),
			libraryPublicationToHostObservation = p65.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p67 (ref), p68 (ref), p69 (ref), p70 (ref), t (write)
				local var89 = runAssignmentPropagationSample(value, p67, p68, p69, p70)
				t = var89
				
				return var89.libraryPublicationToHostObservationMs
			end, p70),
			assignmentToHostObservation = p65.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p67 (ref), p68 (ref), p69 (ref), p70 (ref), t (write)
				local var89 = runAssignmentPropagationSample(value, p67, p68, p69, p70)
				t = var89
				
				return var89.assignmentToHostObservationMs
			end, p70)
		},
		evidence = t
	})
end

local var89 = nil

local function measureDeclarativeReconciliation(p65, p66, p67, p68, p69)
	-- upvalues: createItems (ref), observeCompletionPhases (ref), hasItemText (ref), responsibilityCatalogModule (ref)
	local clock = p69.clock or os.clock
	local folder = Instance.new("Folder")
	local var90 = p65.ReactRoblox.createRoot(folder)
	local var91 = p65.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var92 = createItems(20)
	local var93 = createItems(20)
	
	for i, v in var93 do
		v.text = `Reconciled {i}`
	end
	local function _(p70)
		return {
			items = p70,
			getItemKey = function(p71)
				return p71.id
			end
		}
	end
	
	local t = {
		items = var92,
		getItemKey = function(p70)
			return p70.id
		end
	}
	local act = p65.ReactRoblox.act
	local var94 = nil
	local var95 = nil
	local var96 = 10
	act(function()
		-- upvalues: t (ref), var91 (ref), p65 (ref), p68 (ref), var94 (ref), var95 (ref), var90 (ref), var96 (ref)
		local t = {
			overscan = 0,
			data = t,
			layout = var91,
			axis = p65.ViewRecycler.Axis.Y,
			itemType = p68,
			diagnostics = var94
		}
		
		if var95 ~= nil then
			for i, v in var95 do
				t[i] = v
			end
		end
		var90:render(p65.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var96 * 40)
		}, {
			List = p65.React.createElement(p65.ViewRecycler.VirtualList, t)
		}))
	end)
	local var97 = false
	local var98 = 0
	local t_1 = {}
	local var99 = ""
	local var100 = p66.run(function()
		-- upvalues: var97 (write), var93 (ref), var92 (ref), var99 (write), clock (ref), p65 (ref), var90 (ref), var91 (ref), p68 (ref), observeCompletionPhases (copy), hasItemText (copy), folder (ref), t_1 (ref), var98 (write)
		var97 = not var97
		local var101 = if var97 then var93 else var92
		var99 = if var97 then "Reconciled 10" else "Item 10"
		local var102 = clock()
		local t = {
			items = var101,
			getItemKey = function(p70)
				return p70.id
			end
		}
		local act = p65.ReactRoblox.act
		local var103 = nil
		local var104 = nil
		local var105 = 10
		act(function()
			-- upvalues: t (ref), var91 (ref), p65 (ref), p68 (ref), var103 (ref), var104 (ref), var90 (ref), var105 (ref)
			local t = {
				overscan = 0,
				data = t,
				layout = var91,
				axis = p65.ViewRecycler.Axis.Y,
				itemType = p68,
				diagnostics = var103
			}
			
			if var104 ~= nil then
				for i, v in var104 do
					t[i] = v
				end
			end
			var90:render(p65.React.createElement("Frame", {
				Name = "BenchmarkHost",
				Size = UDim2.fromOffset(400, var105 * 40)
			}, {
				List = p65.React.createElement(p65.ViewRecycler.VirtualList, t)
			}))
		end)
		observeCompletionPhases(p65, {
			reconciledContentCommitted = function()
				-- upvalues: hasItemText (copy), folder (copy), var99 (copy)
				return hasItemText(folder, var99)
			end
		}, "declarative data reconciliation", t_1)
		var98 += 1
		
		return (clock() - var102) * 1000
	end, p69)
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	scrollingFrame = scrollingFrame.CanvasSize.Y.Offset
	p65.ReactRoblox.act(function()
		-- upvalues: var90 (ref)
		var90:unmount()
	end)
	var91.destroy()
	folder:Destroy()
	
	return p67.create({
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
		arms = { viewRecycler = var100 },
		evidence = {
			completionBarrier = "reconciledContentCommitted",
			reconciliations = var98,
			finalCommittedText = var99,
			finalContentLength = scrollingFrame,
			completionPhaseCounts = t_1
		}
	})
end

local function runDeclarativeDataReconciliation(p70, p71, p72, p73, p74)
	-- upvalues: createItemTypes (ref), var89 (write), measureDeclarativeReconciliation (ref)
	p73 = p73 or {}
	local var101, var102 = createItemTypes(p70)
	assert(var101 ~= var102, "React benchmark Recyclable view types must have distinct identities")
	
	if p74 then
		var89(p70, p71, p72, { sampleCount = 1, warmupCount = 0, bootstrapResamples = 0 })
	end
	return measureDeclarativeReconciliation(p70, p71, p72, var101, p73)
end

local function measurePropSynchronization(p70, p71, p72, p73, p74)
	-- upvalues: createItems (ref), observeCompletionPhases (ref), hasItemText (ref), responsibilityCatalogModule (ref)
	local clock = p74.clock or os.clock
	local folder = Instance.new("Folder")
	local var101 = p70.ReactRoblox.createRoot(folder)
	local var102 = p70.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var103 = p70.ViewRecycler.Layout.uniform({ itemLength = 44 })
	local var104 = createItems(20)
	local var105 = createItems(21)
	var105[1].text = "Replacement first"
	local var106 = p70.ViewRecycler.DataSource.snapshot(var104, function(p75)
		return p75.id
	end)
	local var107 = p70.ViewRecycler.DataSource.snapshot(var105, function(p75)
		return p75.id
	end)
	local act = p70.ReactRoblox.act
	local var108 = nil
	local var109 = nil
	local var110 = 10
	act(function()
		-- upvalues: var106 (ref), var102 (ref), p70 (ref), p73 (ref), var108 (ref), var109 (ref), var101 (ref), var110 (ref)
		local t = {
			overscan = 0,
			data = var106,
			layout = var102,
			axis = p70.ViewRecycler.Axis.Y,
			itemType = p73,
			diagnostics = var108
		}
		
		if var109 ~= nil then
			for i, v in var109 do
				t[i] = v
			end
		end
		var101:render(p70.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var110 * 40)
		}, {
			List = p70.React.createElement(p70.ViewRecycler.VirtualList, t)
		}))
	end)
	local var111 = false
	local var112 = 0
	local t = {}
	local var113 = 0
	local var114 = ""
	local var115 = p71.run(function()
		-- upvalues: var111 (write), var107 (ref), var106 (ref), var103 (ref), var102 (ref), var113 (write), var105 (ref), var104 (ref), var114 (write), clock (ref), p70 (ref), var101 (ref), p73 (ref), observeCompletionPhases (copy), hasItemText (copy), folder (ref), t (ref), var112 (write)
		var111 = not var111
		local var116 = if var111 then var107 else var106
		local var117 = if var111 then var103 else var102
		var113 = if var111 then #var105 * 44 else #var104 * 40
		var114 = if var111 then "Replacement first" else "Item 1"
		local var118 = clock()
		local act = p70.ReactRoblox.act
		local var119 = nil
		local var120 = nil
		local var121 = 10
		act(function()
			-- upvalues: var116 (ref), var117 (ref), p70 (ref), p73 (ref), var119 (ref), var120 (ref), var101 (ref), var121 (ref)
			local t = {
				overscan = 0,
				data = var116,
				layout = var117,
				axis = p70.ViewRecycler.Axis.Y,
				itemType = p73,
				diagnostics = var119
			}
			
			if var120 ~= nil then
				for i, v in var120 do
					t[i] = v
				end
			end
			var101:render(p70.React.createElement("Frame", {
				Name = "BenchmarkHost",
				Size = UDim2.fromOffset(400, var121 * 40)
			}, {
				List = p70.React.createElement(p70.ViewRecycler.VirtualList, t)
			}))
		end)
		observeCompletionPhases(p70, {
			dataAndLayoutPropsCommitted = function()
				-- upvalues: hasItemText (copy), folder (copy), var114 (copy), var113 (copy)
				local var122 = hasItemText(folder, var114)
				
				if var122 then
					local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
					assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
					var122 = math.abs(scrollingFrame.CanvasSize.Y.Offset - var113) <= 0.01
				end
				return var122
			end
		}, "data and layout prop replacement", t)
		var112 += 1
		
		return (clock() - var118) * 1000
	end, p74)
	p70.ReactRoblox.act(function()
		-- upvalues: var101 (ref)
		var101:unmount()
	end)
	var102.destroy()
	folder:Destroy()
	var103.destroy()
	
	return p72.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "integrated",
		workload = "data-layout-prop-replacement",
		description = "Atomically replaces VirtualList data and layout props and waits for matching host geometry.",
		responsibility = responsibilityCatalogModule.React.PropSynchronization,
		scale = {
			replacementsPerSample = 1,
			firstItems = #var104,
			secondItems = #var105
		},
		timing = {
			unit = "ms",
			basis = "dataLayoutPropCommit",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = { viewRecycler = var115 },
		evidence = {
			completionBarrier = "dataAndLayoutPropsCommitted",
			replacements = var112,
			finalCommittedText = var114,
			finalContentLength = var113,
			completionPhaseCounts = t
		}
	})
end

local function measureAssignmentBinding(value, p75, p76, p77)
	-- upvalues: createItems (ref), hasItemText (ref), captureCompletionPhase (ref), observeCompletionPhases (ref), responsibilityCatalogModule (ref)
	local clock = p77.clock or os.clock
	local var116 = 0
	local var117 = 0
	local var118 = value.ViewRecycler.createRecyclableView(function(p78)
		-- upvalues: var116 (write), value (ref)
		var116 += 1
		
		return value.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = value.SignalsReact.useSignalBinding(function(p79)
				-- upvalues: p78 (ref)
				return p78.itemSignal(p79).text
			end)
		})
	end, { readiness = "ReadyOnAssignment" })
	local folder = Instance.new("Folder")
	local var119 = value.ReactRoblox.createRoot(folder)
	local var120 = value.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var121 = value.ViewRecycler.DataSource.sequence(createItems(20), function(p78)
		return p78.id
	end)
	local t = {
		_instrumentation = {
			assignmentChanged = function(_, p78)
				-- upvalues: var117 (write)
				if p78 ~= nil then
					var117 += 1
				end
			end
		}
	}
	local act = value.ReactRoblox.act
	local var122 = nil
	local var123 = 10
	act(function()
		-- upvalues: var121 (ref), var120 (ref), value (ref), var118 (ref), var122 (ref), t (ref), var119 (ref), var123 (ref)
		local t = {
			overscan = 0,
			data = var121,
			layout = var120,
			axis = value.ViewRecycler.Axis.Y,
			itemType = var118,
			diagnostics = var122
		}
		
		if t ~= nil then
			for i, v in t do
				t[i] = v
			end
		end
		var119:render(value.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var123 * 40)
		}, {
			List = value.React.createElement(value.ViewRecycler.VirtualList, t)
		}))
	end)
	local var124 = var116
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local var125 = scrollingFrame
	local var126 = true
	local var127 = 0
	local t_1 = {}
	local var128 = p75.run(function()
		-- upvalues: var126 (write), var117 (write), hasItemText (copy), folder (ref), clock (ref), value (ref), var125 (ref), captureCompletionPhase (copy), t_1 (ref), observeCompletionPhases (copy), var127 (write)
		var126 = not var126
		local var129 = if var126 then 0 else 400
		local var130 = if var126 then "Item 1" else "Item 11"
		local t = {
			bindingDelivered = function()
				-- upvalues: hasItemText (copy), folder (copy), var130 (ref)
				return hasItemText(folder, var130)
			end
		}
		local t_2 = {}
		local var131 = clock()
		value.ReactRoblox.act(function()
			-- upvalues: var125 (copy), var129 (ref), captureCompletionPhase (copy), t (ref), t_2 (ref), t_1 (copy)
			var125.CanvasPosition = Vector2.new(0, var129)
			captureCompletionPhase(t, t_2, t_1, "afterMutation")
		end)
		observeCompletionPhases(value, t, `binding delivery to {var130}`, t_1, t_2)
		var127 = var117 - var117
		
		return (clock() - var131) * 1000
	end, p77)
	local var129 = var116
	value.ReactRoblox.act(function()
		-- upvalues: var119 (ref)
		var119:unmount()
	end)
	var120.destroy()
	folder:Destroy()
	
	return p76.create({
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
		arms = { immediate = var128 },
		evidence = {
			completionBarrier = "bindingDelivered",
			initialRenders = var124,
			finalRenders = var129,
			rerendersDuringDelivery = var129 - var124,
			deliveredAssignments = var127,
			completionPhaseCounts = t_1
		}
	}), p76.create({
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
		arms = { immediate = var128 },
		evidence = {
			completionBarrier = "bindingDelivered",
			publishedAssignments = var127,
			rerendersDuringPublication = var129 - var124,
			completionPhaseCounts = t_1
		}
	})
end

local function createPresentationArm(p78, p79, p80, p81)
	-- upvalues: createItems (ref), hasItemText (ref), captureCompletionPhase (ref), observeCompletionPhases (ref)
	local var124 = p78.ViewRecycler.createRecyclableView(if p79 == "ReadyOnAssignment" then function(p82)
		-- upvalues: p78 (ref)
		return p78.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p78.SignalsReact.useSignalBinding(function(p83)
				-- upvalues: p82 (ref)
				return p82.itemSignal(p83).text
			end)
		})
	end else function(p82)
		-- upvalues: p78 (ref)
		return p78.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p78.SignalsReact.useSignalState(p82.itemSignal).text
		})
	end, { readiness = p79, hideWhilePending = p80 })
	local folder = Instance.new("Folder")
	local var125 = p78.ReactRoblox.createRoot(folder)
	local var126 = p78.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var127 = p78.ViewRecycler.DataSource.sequence(createItems(20), function(p82)
		return p82.id
	end)
	local act = p78.ReactRoblox.act
	local var128 = nil
	local var129 = nil
	local var130 = 10
	act(function()
		-- upvalues: var127 (ref), var126 (ref), p78 (ref), var124 (ref), var128 (ref), var129 (ref), var125 (ref), var130 (ref)
		local t = {
			overscan = 0,
			data = var127,
			layout = var126,
			axis = p78.ViewRecycler.Axis.Y,
			itemType = var124,
			diagnostics = var128
		}
		
		if var129 ~= nil then
			for i, v in var129 do
				t[i] = v
			end
		end
		var125:render(p78.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var130 * 40)
		}, {
			List = p78.React.createElement(p78.ViewRecycler.VirtualList, t)
		}))
	end)
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local var131 = scrollingFrame
	local var132 = true
	local t = {}
	
	return {
		run = function()
			-- upvalues: var132 (write), hasItemText (copy), folder (ref), p81 (ref), p78 (ref), var131 (ref), captureCompletionPhase (copy), t (ref), observeCompletionPhases (copy)
			var132 = not var132
			local var133 = if var132 then 0 else 400
			local var134 = if var132 then "Item 1" else "Item 11"
			local t_1 = {
				presentationCommitted = function()
					-- upvalues: hasItemText (copy), folder (copy), var134 (ref)
					return hasItemText(folder, var134)
				end
			}
			local t_2 = {}
			local var135 = p81()
			p78.ReactRoblox.act(function()
				-- upvalues: var131 (copy), var133 (ref), captureCompletionPhase (copy), t_1 (ref), t_2 (ref), t (copy)
				var131.CanvasPosition = Vector2.new(0, var133)
				captureCompletionPhase(t_1, t_2, t, "afterMutation")
			end)
			observeCompletionPhases(p78, t_1, `presentation commit to {var134}`, t, t_2)
			
			return (p81() - var135) * 1000
		end,
		getEvidence = function()
			-- upvalues: p79 (ref), p80 (ref), t (ref)
			return {
				presentations = 1,
				readiness = p79,
				hideWhilePending = p80,
				completionPhaseCounts = t
			}
		end,
		destroy = function()
			-- upvalues: p78 (ref), var125 (ref), var126 (ref), folder (ref)
			p78.ReactRoblox.act(function()
				-- upvalues: var125 (ref)
				var125:unmount()
			end)
			var126.destroy()
			folder:Destroy()
		end
	}
end

local function measurePresentationCommit(p82, p83, p84, p85)
	-- upvalues: createPresentationArm (ref), responsibilityCatalogModule (ref)
	local clock = p85.clock or os.clock
	local var131 = createPresentationArm(p82, "ReadyOnCommit", false, clock)
	local var132 = createPresentationArm(p82, "ReadyOnCommit", true, clock)
	local var133 = createPresentationArm(p82, "ReadyOnAssignment", false, clock)
	local var134 = p83.run(var131.run, p85)
	local var135 = p83.run(var132.run, p85)
	local var136 = p83.run(var133.run, p85)
	local t = {
		completionBarrier = "presentationCommitted",
		readyOnCommitVisible = var131.getEvidence(),
		readyOnCommitHidden = var132.getEvidence(),
		readyOnAssignment = var133.getEvidence()
	}
	var131.destroy()
	var132.destroy()
	var133.destroy()
	
	return p84.create({
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
			readyOnCommitVisible = var134,
			readyOnCommitHidden = var135,
			readyOnAssignment = var136
		},
		evidence = t
	})
end

local function measureVirtualListTeardown(p82, p83, p84, p85)
	-- upvalues: createItems (ref), observeCompletionPhases (ref), hasItemText (ref), responsibilityCatalogModule (ref)
	local clock = p85.clock or os.clock
	local t = {}
	
	return p84.create({
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
			viewRecycler = p83.run(function()
				-- upvalues: p82 (ref), createItems (copy), observeCompletionPhases (copy), hasItemText (copy), clock (ref), t (write)
				local var131 = 0
				local var132 = 0
				local var133 = p82.ViewRecycler.createRecyclableView(function(p86)
					-- upvalues: p82 (copy), var131 (write), var132 (write)
					local var134 = p82.SignalsReact.useSignalState(p86.itemSignal)
					p82.React.useEffect(function()
						-- upvalues: var131 (copy), var132 (copy)
						var131 += 1
						
						return function()
							-- upvalues: var132 (copy)
							var132 += 1
						end
					end, {})
					
					return p82.React.createElement("TextLabel", {
						Name = "Content",
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						Text = var134.text
					})
				end, { readiness = "ReadyOnCommit", hideWhilePending = true })
				local folder = Instance.new("Folder")
				local var134 = p82.ReactRoblox.createRoot(folder)
				local var135 = p82.ViewRecycler.Layout.uniform({ itemLength = 40 })
				local var136 = p82.ViewRecycler.DataSource.snapshot(createItems(20), function(p86)
					return p86.id
				end)
				local act = p82.ReactRoblox.act
				local var137 = nil
				local var138 = nil
				local var139 = 10
				act(function()
					-- upvalues: var136 (ref), var135 (ref), p82 (ref), var133 (ref), var137 (ref), var138 (ref), var134 (ref), var139 (ref)
					local t = {
						overscan = 0,
						data = var136,
						layout = var135,
						axis = p82.ViewRecycler.Axis.Y,
						itemType = var133,
						diagnostics = var137
					}
					
					if var138 ~= nil then
						for i, v in var138 do
							t[i] = v
						end
					end
					var134:render(p82.React.createElement("Frame", {
						Name = "BenchmarkHost",
						Size = UDim2.fromOffset(400, var139 * 40)
					}, {
						List = p82.React.createElement(p82.ViewRecycler.VirtualList, t)
					}))
				end)
				observeCompletionPhases(p82, {
					mounted = function()
						-- upvalues: var131 (write), hasItemText (copy), folder (ref)
						return var131 > 0 and hasItemText(folder, "Item 10")
					end
				}, "VirtualList teardown setup", {})
				local var140 = clock()
				p82.ReactRoblox.act(function()
					-- upvalues: var134 (ref)
					var134:unmount()
				end)
				var135.destroy()
				local count = #folder:GetDescendants()
				folder:Destroy()
				local var141 = (clock() - var140) * 1000
				assert(var132 == var131, "VirtualList teardown did not unmount every physical row")
				assert(count == 0, "VirtualList teardown retained host descendants")
				t = {
					completionBarrier = "allRowsUnmountedAndHostsRemoved",
					mountedRows = var131,
					unmountedRows = var132,
					descendantsAfterUnmount = count,
					completionPhaseCounts = { allRowsUnmountedAndHostsRemoved = { afterAct = 1 } }
				}
				
				return var141
			end, p85)
		},
		evidence = t
	})
end

local function createRecyclingTransferArm(p86, p87, p88)
	-- upvalues: findMeasuredObjects (ref), hasItemText (ref), captureCompletionPhase (ref), observeCompletionPhases (ref)
	local react = p86.React
	local signalsReact = p86.SignalsReact
	local viewRecycler = p86.ViewRecycler
	local var131 = 0
	local var132 = 0
	local var133 = viewRecycler.createRecyclableView(if p87 == "ReadyOnAssignment" then function(p89)
		-- upvalues: react (ref), var131 (write), var132 (write), signalsReact (ref)
		local var134 = react.useState("state-preserved")
		react.useEffect(function()
			-- upvalues: var131 (copy), var132 (copy)
			var131 += 1
			
			return function()
				-- upvalues: var132 (copy)
				var132 += 1
			end
		end, {})
		
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = signalsReact.useSignalBinding(function(p90)
				-- upvalues: p89 (ref), var134 (ref)
				return `{p89.itemSignal(p90).text}:{var134}`
			end)
		})
	end else function(p89)
		-- upvalues: p86 (ref), react (ref), var131 (write), var132 (write)
		local var134 = p86.SignalsReact.useSignalState(p89.itemSignal)
		local var135 = react.useState("state-preserved")
		react.useEffect(function()
			-- upvalues: var131 (copy), var132 (copy)
			var131 += 1
			
			return function()
				-- upvalues: var132 (copy)
				var132 += 1
			end
		end, {})
		
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = `{var134.text}:{var135}`
		})
	end, {
		readiness = p87,
		hideWhilePending = p87 == "ReadyOnCommit"
	})
	local var134 = viewRecycler.DataSource.sequence({ { id = "first", text = "First", height = 40 } }, function(p89)
		return p89.id
	end)
	local var135 = viewRecycler.DataSource.sequence({ { id = "second", text = "Second", height = 40 } }, function(p89)
		return p89.id
	end)
	local var136 = viewRecycler.Layout.uniform({ itemLength = 40 })
	local var137 = viewRecycler.Layout.uniform({ itemLength = 40 })
	local t = { current = nil }
	local frame = Instance.new("Frame")
	frame.Size = UDim2.fromOffset(400, 40)
	local var138 = p86.ReactRoblox.createRoot(frame)
	local viewRecycler_1 = p86.ViewRecycler
	local var139 = false
	local var140 = ""
	local var141 = nil
	local var142 = nil
	local var143 = 0
	local var144 = 0
	
	local function assignmentChanged(_, p89)
		-- upvalues: var139 (write), var144 (write), var143 (write), var140 (write), var141 (write), p88 (ref)
		if var139 then
			if p89 == nil then
				var144 += 1
				
				return
			end
			var143 += 1
			
			if p89.key == var140 and var141 == nil then
				var141 = p88()
			end
		end
	end
	
	local function presentationChanged(_, p89)
		-- upvalues: var139 (write), var140 (write), var142 (write), p88 (ref)
		if var139 and p89 ~= nil and (p89.key == var140 and var142 == nil) then
			var142 = p88()
		end
	end
	
	p86.ReactRoblox.act(function()
		-- upvalues: var138 (ref), react (ref), viewRecycler_1 (ref), t (ref), var134 (ref), var136 (ref), var133 (ref), assignmentChanged (ref), presentationChanged (ref), var135 (ref), var137 (ref)
		var138:render(react.createElement(viewRecycler_1.RecyclingViewport, {
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
					data = var134,
					layout = var136,
					axis = viewRecycler_1.Axis.Y,
					itemType = var133,
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
					data = var135,
					layout = var137,
					axis = viewRecycler_1.Axis.Y,
					itemType = var133,
					_instrumentation = {
						assignmentChanged = assignmentChanged,
						presentationChanged = presentationChanged
					},
					scrollingFrameProps = { Name = "SecondList" }
				})
			})
		}))
	end)
	local var145 = assert(findMeasuredObjects(frame, "First:state-preserved"))
	local listItemViewFrame1 = var145:FindFirstAncestor("ListItemViewFrame1")
	local var146 = assert(frame:FindFirstChild("FirstRoot", true))
	local var147 = assert(frame:FindFirstChild("SecondRoot", true))
	local var148 = true
	local t_1 = {}
	local var149 = 0
	local t_2 = {}
	
	return {
		run = function()
			-- upvalues: var148 (write), var146 (ref), var147 (ref), var140 (write), var141 (write), var142 (write), var139 (write), hasItemText (copy), frame (ref), findMeasuredObjects (copy), p88 (ref), var145 (ref), listItemViewFrame1 (ref), p86 (ref), t (ref), captureCompletionPhase (copy), t_1 (ref), observeCompletionPhases (copy), var149 (write), t_2 (write)
			var148 = not var148
			local var150 = if var148 then "First:state-preserved" else "Second:state-preserved"
			local var151 = if var148 then var146 else var147
			local var152 = if var148 then 0 else 40
			local var153 = if var148 then 400 else 200
			var140 = if var148 then "first" else "second"
			var141 = nil
			var142 = nil
			var139 = true
			local var154 = nil
			local var155 = nil
			local t_3 = {
				assignmentDelivered = function()
					-- upvalues: var141 (copy)
					return var141 ~= nil
				end,
				commitCompleted = function()
					-- upvalues: var142 (copy), hasItemText (copy), frame (copy), var150 (ref)
					return var142 ~= nil and hasItemText(frame, var150)
				end,
				layoutSettled = function()
					-- upvalues: findMeasuredObjects (copy), frame (copy), var150 (ref), var153 (ref), var154 (write), p88 (copy)
					local var156 = findMeasuredObjects(frame, var150)
					local var157 = var156 ~= nil and math.abs(var156.AbsoluteSize.X - var153) <= 0.01
					
					if var157 and var154 == nil then
						var154 = p88()
					end
					return var157
				end,
				hostObserved = function()
					-- upvalues: findMeasuredObjects (copy), frame (copy), var150 (ref), var145 (copy), var151 (ref), listItemViewFrame1 (copy), var155 (write), p88 (copy)
					local var156 = findMeasuredObjects(frame, var150)
					local var157 = var156 ~= nil and (var156 == var145 and (var156:IsDescendantOf(var151) and var156:FindFirstAncestor("ListItemViewFrame1") == listItemViewFrame1))
					
					if var157 and var155 == nil then
						var155 = p88()
					end
					return var157
				end,
				destinationPresented = function()
					-- upvalues: findMeasuredObjects (copy), frame (copy), var150 (ref), var145 (copy), var151 (ref), listItemViewFrame1 (copy), var153 (ref)
					local var156 = findMeasuredObjects(frame, var150)
					
					return var156 ~= nil and (var156 == var145 and (var156:IsDescendantOf(var151) and (var156:FindFirstAncestor("ListItemViewFrame1") == listItemViewFrame1 and math.abs(var156.AbsoluteSize.X - var153) <= 0.01)))
				end
			}
			local t_4 = {}
			local var156 = p88()
			p86.ReactRoblox.act(function()
				-- upvalues: t (copy), var152 (ref), captureCompletionPhase (copy), t_3 (ref), t_4 (ref), t_1 (copy)
				t.current.CanvasPosition = Vector2.new(0, var152)
				captureCompletionPhase(t_3, t_4, t_1, "afterMutation")
			end)
			observeCompletionPhases(p86, t_3, `recycling transfer to {var150}`, t_1, t_4)
			var149 += 1
			t_2 = {
				assignmentMs = (assert(var141, "fixed-size transfer assignment was not delivered") - var156) * 1000,
				commitMs = (assert(var142, "fixed-size transfer presentation was not committed") - var156) * 1000,
				layoutMs = (assert(var154, "fixed-size transfer layout did not settle") - var156) * 1000,
				hostMs = (assert(var155, "fixed-size transfer host was not observed") - var156) * 1000
			}
			
			return (p88() - var156) * 1000
		end,
		getEvidence = function()
			-- upvalues: var131 (write), var132 (write), var149 (write), findMeasuredObjects (copy), frame (ref), var148 (write), var145 (ref), var143 (write), var144 (write), t_2 (write), t_1 (ref)
			return {
				firstListWidth = 400,
				secondListWidth = 200,
				mounts = var131,
				unmounts = var132,
				transfers = var149,
				sameContentInstance = findMeasuredObjects(frame, if var148 then "First:state-preserved" else "Second:state-preserved") == var145,
				activations = var143,
				deactivations = var144,
				milestones = t_2,
				completionPhaseCounts = t_1
			}
		end,
		destroy = function()
			-- upvalues: p86 (ref), var138 (ref), var136 (ref), var137 (ref), frame (ref)
			p86.ReactRoblox.act(function()
				-- upvalues: var138 (copy)
				var138:unmount()
			end)
			var136.destroy()
			var137.destroy()
			frame:Destroy()
		end
	}
end

local function createWrappedRecyclingTransferArm(p86, p87, p88)
	-- upvalues: waitForHeartbeatToSettle (ref), findMeasuredObjects (ref), hasItemText (ref), captureCompletionPhase (ref), observeCompletionPhases (ref)
	local react = p86.React
	local viewRecycler = p86.ViewRecycler
	local var131 = 0
	local var132 = 0
	local var133 = 0
	local var134 = nil
	local var135 = nil
	local var136 = nil
	local var137 = nil
	local var138 = nil
	local var139 = viewRecycler.createRecyclableView(function(p89)
		-- upvalues: p86 (ref), react (ref), var131 (write), var132 (write)
		local var140 = p86.SignalsReact.useSignalState(p89.itemSignal)
		local var141 = react.useState("state-preserved")
		react.useEffect(function()
			-- upvalues: var131 (copy), var132 (copy)
			var131 += 1
			
			return function()
				-- upvalues: var132 (copy)
				var132 += 1
			end
		end, {})
		
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -20, 0, 0),
			Text = `{var140.text}:{var141}`
		})
	end, {
		readiness = p87,
		hideWhilePending = p87 == "ReadyOnCommit"
	})
	local repeated = string.rep("First wrapped transfer content ", 8)
	local repeated_1 = string.rep("Second wrapped transfer content ", 8)
	local var140 = viewRecycler.DataSource.sequence({ { id = "first-wrapped", height = 40, text = repeated } }, function(p89)
		return p89.id
	end)
	local var141 = viewRecycler.DataSource.sequence({
		{ id = "second-wrapped", height = 40, text = repeated_1 }
	}, function(p89)
		return p89.id
	end)
	local var142 = viewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local var143 = viewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local t = { current = nil }
	local screenGui = Instance.new("ScreenGui")
	screenGui.ResetOnSpawn = false
	screenGui.Parent = game:GetService("CoreGui")
	local var144 = p86.ReactRoblox.createRoot(screenGui)
	local var145 = false
	local var146 = ""
	
	local function assignmentChanged(_, p89)
		-- upvalues: var145 (write), var146 (write), var134 (write), p88 (ref)
		if var145 and p89 ~= nil and (p89.key == var146 and var134 == nil) then
			var134 = p88()
		end
	end
	
	local function presentationChanged(_, p89)
		-- upvalues: var145 (write), var146 (write), var135 (write), p88 (ref)
		if var145 and p89 ~= nil and (p89.key == var146 and var135 == nil) then
			var135 = p88()
		end
	end
	
	local function diagnostics(p89)
		-- upvalues: var145 (write), var137 (write), var133 (write), p88 (ref)
		if var145 and p89.kind == "measurementsProcessed" and (p89.accepted > 0 and var137 == nil) then
			var133 += p89.accepted
			var137 = p88()
		end
	end
	
	p86.ReactRoblox.act(function()
		-- upvalues: var144 (ref), react (ref), viewRecycler (ref), t (ref), var140 (ref), var142 (ref), var139 (ref), diagnostics (ref), assignmentChanged (ref), presentationChanged (ref), var141 (ref), var143 (ref)
		var144:render(react.createElement("Frame", { Name = "TransferHost", Size = UDim2.fromOffset(400, 40) }, {
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
						data = var140,
						layout = var142,
						axis = viewRecycler.Axis.Y,
						itemType = var139,
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
						data = var141,
						layout = var143,
						axis = viewRecycler.Axis.Y,
						itemType = var139,
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
	waitForHeartbeatToSettle(p86)
	waitForHeartbeatToSettle(p86)
	local var147 = assert(findMeasuredObjects(screenGui, `{repeated}:state-preserved`))
	local listItemViewFrame1 = var147:FindFirstAncestor("ListItemViewFrame1")
	local var148 = assert(screenGui:FindFirstChild("FirstRoot", true))
	local var149 = assert(screenGui:FindFirstChild("SecondRoot", true))
	local var150 = true
	local t_1 = {}
	local var151 = 0
	local t_2 = {}
	
	return {
		run = function()
			-- upvalues: var150 (write), repeated (ref), repeated_1 (ref), var146 (write), var148 (ref), var149 (ref), var142 (ref), var143 (ref), var134 (write), var135 (write), var136 (write), var137 (write), var138 (write), p88 (ref), var145 (write), hasItemText (copy), screenGui (ref), findMeasuredObjects (copy), var147 (ref), listItemViewFrame1 (ref), p86 (ref), t (ref), captureCompletionPhase (copy), t_1 (ref), observeCompletionPhases (copy), t_2 (write), var151 (write)
			var150 = not var150
			local var152 = `{if var150 then repeated else repeated_1}:state-preserved`
			var146 = if var150 then "first-wrapped" else "second-wrapped"
			local var153 = if var150 then var148 else var149
			local var154 = if var150 then 0 else 40
			local var155 = if var150 then 400 else 200
			local var156 = if var150 then var142 else var143
			var134 = nil
			var135 = nil
			var136 = nil
			var137 = nil
			var138 = nil
			local var157 = p88()
			var145 = true
			local t_3 = {
				assignmentDelivered = function()
					-- upvalues: var134 (copy)
					return var134 ~= nil
				end,
				commitCompleted = function()
					-- upvalues: var135 (copy), hasItemText (copy), screenGui (copy), var152 (ref)
					return var135 ~= nil and hasItemText(screenGui, var152)
				end,
				layoutSettled = function()
					-- upvalues: findMeasuredObjects (copy), screenGui (copy), var152 (ref), var155 (ref), var136 (copy), p88 (copy)
					local var158, var159 = findMeasuredObjects(screenGui, var152)
					local var160 = var158 ~= nil and (var159 ~= nil and (var158.AbsoluteSize.X == var155 - 20 and (var158.AbsoluteSize.Y > 0 and var159.AbsoluteSize.Y > 0)))
					
					if var160 and var136 == nil then
						var136 = p88()
					end
					return var160
				end,
				measurementSettled = function()
					-- upvalues: findMeasuredObjects (copy), screenGui (copy), var152 (ref), var156 (ref), var137 (copy), p88 (copy)
					local var158, var159 = findMeasuredObjects(screenGui, var152)
					local var160 = var158 ~= nil and (var159 ~= nil and math.abs(var156.getItemLayout(1).length - var159.AbsoluteSize.Y) <= 0.01)
					
					if var160 and var137 == nil then
						var137 = p88()
					end
					return var160
				end,
				hostObserved = function()
					-- upvalues: findMeasuredObjects (copy), screenGui (copy), var152 (ref), var147 (copy), var153 (ref), listItemViewFrame1 (copy), var138 (copy), p88 (copy)
					local var158 = findMeasuredObjects(screenGui, var152)
					local var159 = var158 ~= nil and (var158 == var147 and (var158:IsDescendantOf(var153) and var158:FindFirstAncestor("ListItemViewFrame1") == listItemViewFrame1))
					
					if var159 and var138 == nil then
						var138 = p88()
					end
					return var159
				end
			}
			local t_4 = {}
			p86.ReactRoblox.act(function()
				-- upvalues: t (copy), var154 (ref), captureCompletionPhase (copy), t_3 (ref), t_4 (ref), t_1 (copy)
				t.current.CanvasPosition = Vector2.new(0, var154)
				captureCompletionPhase(t_3, t_4, t_1, "afterMutation")
			end)
			observeCompletionPhases(p86, t_3, function()
				-- upvalues: findMeasuredObjects (copy), screenGui (copy), var152 (ref), var146 (copy), var134 (copy), var135 (copy), var136 (copy), var137 (copy), var138 (copy), var155 (ref)
				local var158, var159 = findMeasuredObjects(screenGui, var152)
				
				return `wrapped recycling transfer to {var146}; assignment={var134 ~= nil}, commit={var135 ~= nil}, content={var158 ~= nil}, layout={var136 ~= nil}, measurement={var137 ~= nil}, host={var138 ~= nil}, contentWidth={if var158 == nil then "nil" else var158.AbsoluteSize.X}, expectedWidth={var155 - 20}, hostHeight={if var159 == nil then "nil" else var159.AbsoluteSize.Y}`
			end, t_1, t_4)
			t_2 = {
				assignmentMs = (assert(var134, "wrapped transfer assignment was not delivered") - var157) * 1000,
				commitMs = (assert(var135, "wrapped transfer presentation was not committed") - var157) * 1000,
				layoutMs = (assert(var136, "wrapped transfer layout did not settle") - var157) * 1000,
				measurementMs = (assert(var137, "wrapped transfer measurement was not settled") - var157) * 1000,
				hostMs = (assert(var138, "wrapped transfer host was not observed") - var157) * 1000
			}
			var151 += 1
			
			return (p88() - var157) * 1000
		end,
		getEvidence = function()
			-- upvalues: var131 (write), var132 (write), var151 (write), findMeasuredObjects (copy), screenGui (ref), var150 (write), repeated (ref), repeated_1 (ref), var147 (ref), var133 (write), t_2 (write), t_1 (ref)
			return {
				mounts = var131,
				unmounts = var132,
				transfers = var151,
				sameContentInstance = findMeasuredObjects(screenGui, `{if var150 then repeated else repeated_1}:state-preserved`) == var147,
				acceptedMeasurements = var133,
				milestones = t_2,
				completionPhaseCounts = t_1
			}
		end,
		destroy = function()
			-- upvalues: p86 (ref), var144 (ref), var142 (ref), var143 (ref), screenGui (ref)
			p86.ReactRoblox.act(function()
				-- upvalues: var144 (copy)
				var144:unmount()
			end)
			var142.destroy()
			var143.destroy()
			screenGui:Destroy()
		end
	}
end

var89 = function(p89, p90, p91, p92)
	-- upvalues: createRecyclingTransferArm (ref), createWrappedRecyclingTransferArm (ref), responsibilityCatalogModule (ref)
	local clock = p92.clock or os.clock
	local var160 = createRecyclingTransferArm(p89, "ReadyOnCommit", clock)
	local var161 = createRecyclingTransferArm(p89, "ReadyOnAssignment", clock)
	local var162 = createWrappedRecyclingTransferArm(p89, "ReadyOnCommit", clock)
	local var163 = createWrappedRecyclingTransferArm(p89, "ReadyOnAssignment", clock)
	local var164 = p90.run(var160.run, p92)
	local var165 = p90.run(var161.run, p92)
	local var166 = p90.run(var162.run, p92)
	local var167 = p90.run(var163.run, p92)
	local t = {
		fixedSizeMeasurementMilestone = "notRequiredUniformLayout",
		untilCommit = var160.getEvidence(),
		immediate = var161.getEvidence()
	}
	local t_1 = {
		wrappedUntilCommit = var162.getEvidence(),
		wrappedImmediate = var163.getEvidence()
	}
	var160.destroy()
	var161.destroy()
	var162.destroy()
	var163.destroy()
	
	return p91.create({
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
		arms = { untilCommit = var164, immediate = var165 },
		evidence = t
	}), p91.create({
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
		arms = { wrappedUntilCommit = var166, wrappedImmediate = var167 },
		evidence = t_1
	}), p91.create({
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
		arms = { untilCommit = var164, immediate = var165 },
		evidence = t
	})
end

local function measureRecyclingScopeHighWater(p89, p90, p91, p92, p93)
	-- upvalues: responsibilityCatalogModule (ref)
	local clock = p93.clock or os.clock
	local t = {}
	
	return p91.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "isolated",
		workload = "recycling-scope-high-water-lifecycle",
		description = "Creates one React RecyclingScope high-water batch and publishes only surviving hosts.",
		responsibility = responsibilityCatalogModule.React.ScopeOwnership,
		scale = { items = p92 },
		timing = {
			unit = "ms",
			basis = "recyclingScopeHighWaterBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p92
		},
		arms = {
			viewRecycler = p90.run(function()
				-- upvalues: p89 (ref), p92 (ref), clock (ref), t (write)
				local var160, var161 = p89.LifecycleWorkloads.recyclingScopeHighWater(p92, clock)
				t = var161
				
				return var160
			end, p93)
		},
		evidence = t
	})
end

local function measureCompositionChurn(p89, p90, p91, p92, p93)
	-- upvalues: responsibilityCatalogModule (ref)
	local clock = p93.clock or os.clock
	local var160 = p89.LifecycleWorkloads.compositionChurn(p92)
	local var161 = 0
	local var162 = 0
	local var163 = p90.run(function()
		-- upvalues: var160 (ref), clock (ref), var161 (write), var162 (write)
		local assignmentUpdates = var160.getAssignmentUpdates()
		local flushes = var160.getFlushes()
		local var164 = clock()
		var160.run()
		local var165 = (clock() - var164) * 1000
		var161 = var160.getAssignmentUpdates() - assignmentUpdates
		var162 = var160.getFlushes() - flushes
		
		return var165
	end, p93)
	var160.destroy()
	
	return p91.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "isolated",
		workload = "composed-recyclable-churn",
		description = "Coalesces one prop update per composed destination into a single placement flush.",
		responsibility = responsibilityCatalogModule.React.Composition,
		scale = { items = p92, updates = p92 },
		timing = {
			unit = "ms",
			basis = "compositionPlacementFlushBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p92
		},
		arms = { viewRecycler = var163 },
		evidence = {
			assignmentUpdates = var161,
			coalescedUpdates = p92,
			placementFlushes = var162,
			completionPhaseCounts = { compositionPublication = { synchronousFlush = 1 } }
		}
	})
end

local function measureCompositionBatchSettlement(value, p89, p90, p91, p92)
	-- upvalues: responsibilityCatalogModule (ref)
	local clock = p92.clock or os.clock
	local var160 = value.LifecycleWorkloads.compositionChurn(p91)
	local var161 = 0
	local var162 = 0
	local var163 = 0
	local var164 = p89.run(function()
		-- upvalues: var160 (ref), clock (ref), var161 (write), var162 (write), var163 (write)
		local assignmentUpdates = var160.getAssignmentUpdates()
		local flushes = var160.getFlushes()
		local reactInvalidations = var160.getReactInvalidations()
		local var165 = clock()
		var160.runBatchSettlement()
		local var166 = (clock() - var165) * 1000
		var161 = var160.getAssignmentUpdates() - assignmentUpdates
		var162 = var160.getFlushes() - flushes
		var163 = var160.getReactInvalidations() - reactInvalidations
		
		return var166
	end, p92)
	var160.destroy()
	
	return p90.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "integrated",
		workload = "composed-recyclable-batch-settlement",
		description = "Rekeys composed destinations and settles their Assignments before one Recycling batch returns.",
		responsibility = responsibilityCatalogModule.React.Composition,
		scale = { items = p91, parentReassignments = p91 },
		timing = {
			unit = "ms",
			basis = "compositionPlacementBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p91
		},
		arms = { viewRecycler = var164 },
		evidence = {
			assignmentUpdates = var161,
			placementFlushes = var162,
			reactInvalidations = var163,
			completionPhaseCounts = { compositionPublication = { synchronousBatch = 1 } }
		}
	})
end

local function measureWarmPagination(p89, p90, p91, p92)
	-- upvalues: createItems (ref), observeCompletionPhases (ref), hasItemText (ref), waitForHeartbeatToSettle (ref), findMeasuredObjects (ref), responsibilityCatalogModule (ref)
	local clock = p92.clock or os.clock
	local var160 = createItems(500)
	local list = table.create(20)
	
	for i = 1, 20 do
		list[i] = { height = 40, id = `older{i}`, text = `Older {i}` }
	end
	local var161 = 0
	local var162 = 0
	local var163 = 0
	local var164 = 0
	local var165 = 0
	local var166 = p89.ViewRecycler.createRecyclableView(function(p93)
		-- upvalues: var161 (write), p89 (ref), var163 (write), var164 (write)
		var161 += 1
		local var167 = p89.ViewRecycler.useRecyclingIndex()
		
		return p89.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p89.SignalsReact.useSignalBinding(function(p94)
				-- upvalues: var163 (copy), p93 (ref)
				var163 += 1
				
				return p93.itemSignal(p94).text
			end),
			LayoutOrder = p89.SignalsReact.useSignalBinding(function(p94)
				-- upvalues: var164 (copy), var167 (ref)
				var164 += 1
				
				return var167(p94) or 0
			end)
		})
	end, { readiness = "ReadyOnAssignment" })
	local var167 = p89.ViewRecycler.DataSource.deque(var160, function(p93)
		-- upvalues: var165 (write)
		var165 += 1
		
		return p93.id
	end)
	local var168 = p89.ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local screenGui = Instance.new("ScreenGui")
	screenGui.ResetOnSpawn = false
	screenGui.Parent = game:GetService("CoreGui")
	local var169 = p89.ReactRoblox.createRoot(screenGui)
	local t = { data = 0, measurement = 0, programmaticScroll = 0 }
	
	local var170 = function(p93)
		-- upvalues: t (ref)
		if p93.kind == "scrollCorrection" then
			t[p93.source] += p93.delta
		end
	end
	
	local t_1 = {
		_instrumentation = {
			assignmentChanged = function(_, p93)
				-- upvalues: var162 (write)
				if p93 ~= nil and string.sub(p93.key, 1, 4) == "item" then
					var162 += 1
				end
			end
		}
	}
	local var171 = 10
	p89.ReactRoblox.act(function()
		-- upvalues: var167 (ref), var168 (ref), p89 (ref), var166 (ref), var170 (ref), t_1 (ref), var169 (ref), var171 (ref)
		local t = {
			overscan = 0,
			data = var167,
			layout = var168,
			axis = p89.ViewRecycler.Axis.Y,
			itemType = var166,
			diagnostics = var170
		}
		
		if t_1 ~= nil then
			for i, v in t_1 do
				t[i] = v
			end
		end
		var169:render(p89.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var171 * 40)
		}, {
			List = p89.React.createElement(p89.ViewRecycler.VirtualList, t)
		}))
	end)
	local scrollingFrame = screenGui:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local var172 = scrollingFrame
	p89.ReactRoblox.act(function()
		-- upvalues: var172 (ref)
		var172.CanvasPosition = Vector2.new(0, 9960)
	end)
	observeCompletionPhases(p89, {
		anchorVisible = function()
			-- upvalues: hasItemText (copy), screenGui (ref)
			return hasItemText(screenGui, "Item 250")
		end
	}, "warm pagination anchor", {})
	waitForHeartbeatToSettle(p89)
	waitForHeartbeatToSettle(p89)
	local t_2 = {}
	local var173 = p90.run(function()
		-- upvalues: screenGui (ref), findMeasuredObjects (copy), var172 (ref), var161 (write), var162 (write), var163 (write), var164 (write), t (ref), var165 (write), clock (ref), p89 (ref), var167 (ref), list (ref), waitForHeartbeatToSettle (copy), t_2 (write)
		local var174
		local _, var175 = findMeasuredObjects(screenGui, "Item 250")
		
		if var175 == nil then
			var174 = nil
		else
			local scrollingFrame = var175:FindFirstAncestorWhichIsA("ScrollingFrame")
			var174 = var175.AbsolutePosition.Y - scrollingFrame.AbsolutePosition.Y + scrollingFrame.CanvasPosition.Y
		end
		local var176
		local var177 = assert(var174) - var172.CanvasPosition.Y
		local offset = var172.CanvasSize.Y.Offset
		local data = t.data
		local measurement = t.measurement
		var165 = 0
		local var178 = clock()
		p89.ReactRoblox.act(function()
			-- upvalues: var167 (copy), list (copy)
			var167.pushFrontMany(list)
		end)
		waitForHeartbeatToSettle(p89)
		waitForHeartbeatToSettle(p89)
		local var179 = (clock() - var178) * 1000
		local _, var180 = findMeasuredObjects(screenGui, "Item 250")
		
		if var180 == nil then
			var176 = nil
		else
			local scrollingFrame = var180:FindFirstAncestorWhichIsA("ScrollingFrame")
			var176 = var180.AbsolutePosition.Y - scrollingFrame.AbsolutePosition.Y + scrollingFrame.CanvasPosition.Y
		end
		t_2 = {
			retainedItems = 500,
			insertedItems = 20,
			completionBarrier = "twoHeartbeatMeasurementSettlement",
			keyResolutions = var165,
			retainedRowRenders = var161 - var161,
			retainedAssignmentCallbacks = var162 - var162,
			retainedContentDeliveries = var163 - var163,
			indexPublications = var164 - var164,
			dataAnchorCorrection = t.data - data,
			measurementAnchorCorrection = t.measurement - measurement,
			finalAnchorDrift = assert(var176) - var172.CanvasPosition.Y - var177,
			initialCanvasLength = offset,
			finalCanvasLength = var172.CanvasSize.Y.Offset,
			finalScrollOffset = var172.CanvasPosition.Y,
			dataSourceItems = var167.getItemCount()
		}
		assert(t_2.keyResolutions == 20, "bulk prepend resolved keys outside the inserted page")
		assert(t_2.retainedRowRenders == 0, "bulk prepend rerendered a retained row")
		assert(t_2.retainedAssignmentCallbacks == 0, "bulk prepend republished a retained Assignment")
		assert(t_2.indexPublications > 0, "bulk prepend did not publish current retained indices")
		assert(t_2.retainedContentDeliveries == 0, "bulk prepend republished content for retained rows whose item did not change")
		assert(math.abs(t_2.finalAnchorDrift - 0) <= 0.01, "bulk prepend moved the retained anchor")
		assert(t_2.dataSourceItems == 520, "bulk prepend published the wrong item count")
		assert(t_2.initialCanvasLength < t_2.finalCanvasLength, "bulk prepend did not increase the imperative Canvas length")
		p89.ReactRoblox.act(function()
			-- upvalues: var167 (copy)
			var167.transaction(function()
				-- upvalues: var167 (copy)
				for _ = 1, 20 do
					var167.popFront()
				end
			end)
		end)
		waitForHeartbeatToSettle(p89)
		waitForHeartbeatToSettle(p89)
		
		return var179
	end, p92)
	p89.ReactRoblox.act(function()
		-- upvalues: var169 (ref)
		var169:unmount()
	end)
	var168.destroy()
	screenGui:Destroy()
	
	return p91.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "integrated",
		workload = "warm-bulk-prepend-settlement",
		description = "Prepends 20 rows to a warm measured 500-row deque and waits through measurement settlement.",
		responsibility = responsibilityCatalogModule.React.DataReconciliation,
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
		arms = { viewRecycler = var173 },
		evidence = t_2
	})
end

local function createPageItems(p93, p94)
	local list = table.create(20)
	
	for i = 1, 20 do
		local var174 = p94 + i - 1
		list[i] = {
			id = `{p93}{var174}`,
			text = `{p93} {var174}`,
			height = var174 % 5 * 2 + 36
		}
	end
	return list
end

local _ = function(p95)
	if #p95 == 0 then
		return 0
	end
	local cloned = table.clone(p95)
	table.sort(cloned)
	
	return cloned[math.ceil(#cloned / 2)]
end

local function measureScrollPaginationArm(p95, p96, p97, p98, p99)
	-- upvalues: createItems (ref), createPageItems (ref), waitForHeartbeatToSettle (ref), flushDeferredWork (ref)
	local var175
	local react = p95.React
	local reactRoblox = p95.ReactRoblox
	local viewRecycler = p95.ViewRecycler
	local clock = p99.clock or os.clock
	local isEnd = p98.edge == "end"
	local isNotPreloaded = p98.source ~= "preloaded"
	local var176 = 0
	
	local function getItemKey(p100)
		-- upvalues: var176 (write)
		var176 += 1
		
		return p100.id
	end
	
	local var177 = createItems(if isNotPreloaded then 200 else 4200)
	local var178 = if p98.source == "deque" then viewRecycler.DataSource.deque(var177, getItemKey) else nil
	local var179 = nil
	local var180 = false
	local var181 = 0
	local var182 = 0
	
	local function deliverPage()
		-- upvalues: createPageItems (copy), isEnd (ref), var182 (write), var178 (ref), var179 (write), var181 (write), var180 (write)
		local var183 = createPageItems(if isEnd then "newer" else "older", var182 + 1)
		var182 += 20
		
		if var178 == nil then
			var179(function(p100)
				-- upvalues: isEnd (copy), var183 (ref)
				local list = table.create(#p100 + 20)
				
				if isEnd then
					table.move(p100, 1, #p100, 1, list)
					table.move(var183, 1, 20, #p100 + 1, list)
					
					return list
				end
				table.move(var183, 1, 20, 1, list)
				table.move(p100, 1, #p100, 21, list)
				
				return list
			end)
		elseif isEnd then
			var178.pushBackMany(var183)
		else
			var178.pushFrontMany(var183)
		end
		var181 += 1
		var180 = false
	end
	
	local function requestPage()
		-- upvalues: var180 (write), deliverPage (ref)
		if var180 then
			return
		end
		var180 = true
		task.defer(deliverPage)
	end
	
	local var183 = viewRecycler.Layout.measured({ estimatedItemLength = 40 })
	
	local function PaginationHost()
		-- upvalues: react (ref), var177 (ref), var179 (write), viewRecycler (ref), var178 (ref), getItemKey (ref), var183 (ref), p97 (ref), isNotPreloaded (ref), isEnd (ref), requestPage (ref)
		local var184, var185 = react.useState(var177)
		var179 = var185
		
		return react.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, 400)
		}, {
			List = react.createElement(viewRecycler.VirtualList, {
				overscan = 0,
				startReachedThreshold = 200,
				endReachedThreshold = 200,
				data = var178 or { items = var184, getItemKey = getItemKey },
				layout = var183,
				axis = viewRecycler.Axis.Y,
				itemType = p97,
				onStartReached = if isNotPreloaded and not isEnd then requestPage else nil,
				onEndReached = if isNotPreloaded and isEnd then requestPage else nil
			})
		})
	end
	
	local screenGui = Instance.new("ScreenGui")
	screenGui.ResetOnSpawn = false
	screenGui.Parent = game:GetService("CoreGui")
	local var184 = reactRoblox.createRoot(screenGui)
	reactRoblox.act(function()
		-- upvalues: var184 (ref), react (ref), PaginationHost (ref)
		var184:render(react.createElement(PaginationHost))
	end)
	waitForHeartbeatToSettle(p95)
	local scrollingFrame = screenGui:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	
	scrollingFrame = function()
		-- upvalues: isNotPreloaded (ref), isEnd (ref), scrollingFrame (ref)
		return if isNotPreloaded then if isEnd then math.max(0, scrollingFrame.CanvasSize.Y.Offset - 400 - 800) else 800 else 0
	end
	
	local function _(p100)
		-- upvalues: reactRoblox (ref), scrollingFrame (ref), flushDeferredWork (copy)
		reactRoblox.act(function()
			-- upvalues: scrollingFrame (copy), p100 (ref)
			scrollingFrame.CanvasPosition = Vector2.new(0, p100)
		end)
		reactRoblox.act(flushDeferredWork)
	end
	
	local var185 = if not isNotPreloaded then 0 elseif isEnd then math.max(0, scrollingFrame.CanvasSize.Y.Offset - 400 - 800) else 800
	reactRoblox.act(function()
		-- upvalues: scrollingFrame (ref), var185 (ref)
		scrollingFrame.CanvasPosition = Vector2.new(0, var185)
	end)
	reactRoblox.act(flushDeferredWork)
	waitForHeartbeatToSettle(p95)
	waitForHeartbeatToSettle(p95)
	local var186 = if isEnd then 40 else -40
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local var187 = 0
	local var188 = p96.run(function()
		-- upvalues: isNotPreloaded (ref), scrollingFrame (ref), isEnd (ref), reactRoblox (ref), flushDeferredWork (copy), waitForHeartbeatToSettle (copy), p95 (ref), var181 (write), var186 (ref), var176 (write), clock (ref), var187 (write), t (ref), t_1 (ref), t_2 (ref), t_3 (ref)
		if not isNotPreloaded and scrollingFrame.CanvasSize.Y.Offset - 400 < scrollingFrame.CanvasPosition.Y + 1600 then
			local var189 = if not isNotPreloaded then 0 elseif isEnd then math.max(0, scrollingFrame.CanvasSize.Y.Offset - 400 - 800) else 800
			reactRoblox.act(function()
				-- upvalues: scrollingFrame (copy), var189 (ref)
				scrollingFrame.CanvasPosition = Vector2.new(0, var189)
			end)
			reactRoblox.act(flushDeferredWork)
			waitForHeartbeatToSettle(p95)
		end
		local var190 = 0
		
		for i = 1, 20 do
			local var191 = var181
			local maxValue = math.max(0, scrollingFrame.CanvasPosition.Y + var186)
			var176 = 0
			local var192 = gcinfo()
			local var193 = clock()
			reactRoblox.act(function()
				-- upvalues: scrollingFrame (copy), maxValue (ref)
				scrollingFrame.CanvasPosition = Vector2.new(0, maxValue)
			end)
			reactRoblox.act(flushDeferredWork)
			local var194 = (clock() - var193) * 1000
			local var195 = gcinfo() - var192
			var190 += var194
			local var196 = var191 < var181
			
			if var196 then
				var187 = var176
				table.insert(t, var194)
			else
				table.insert(t_1, var194)
			end
			if var195 >= 0 then
				table.insert(if var196 then t_2 else t_3, var195)
			end
			if i % 5 == 0 then
				waitForHeartbeatToSettle(p95)
			end
		end
		return var190
	end, p99)
	local var197 = if var178 ~= nil then var182 + #var177 else var178.getItemCount()
	p95.ReactRoblox.act(function()
		-- upvalues: var184 (ref)
		var184:unmount()
	end)
	var183.destroy()
	screenGui:Destroy()
	local t_4 = {
		pagesDelivered = var181,
		finalItemCount = var197,
		keyReadsPerPage = var187
	}
	
	if #t == 0 then
		var175 = 0
	else
		local cloned = table.clone(t)
		table.sort(cloned)
		var175 = cloned[math.ceil(#cloned / 2)]
	end
	local var198
	t_4.pageStepMedianMs = var175
	
	if #t_1 == 0 then
		var198 = 0
	else
		local cloned = table.clone(t_1)
		table.sort(cloned)
		var198 = cloned[math.ceil(#cloned / 2)]
	end
	local var199
	t_4.scrollStepMedianMs = var198
	
	if #t_2 == 0 then
		var199 = 0
	else
		local cloned = table.clone(t_2)
		table.sort(cloned)
		var199 = cloned[math.ceil(#cloned / 2)]
	end
	local var200
	t_4.pageStepMedianAllocatedKb = var199
	
	if #t_3 == 0 then
		var200 = 0
	else
		local cloned = table.clone(t_3)
		table.sort(cloned)
		var200 = cloned[math.ceil(#cloned / 2)]
	end
	t_4.scrollStepMedianAllocatedKb = var200
	
	return var188, t_4
end

local function measureScrollPagination(p100, p101, p102, p103)
	-- upvalues: createItemTypes (ref), measureScrollPaginationArm (ref), responsibilityCatalogModule (ref)
	local _, var189 = createItemTypes(p100)
	local t = {
		preloaded = { source = "preloaded", edge = "end" },
		declarativeAppend = { source = "declarative", edge = "end" },
		dequeAppend = { source = "deque", edge = "end" },
		declarativePrepend = { source = "declarative", edge = "start" },
		dequePrepend = { source = "deque", edge = "start" }
	}
	local t_1 = {}
	local t_2 = {}
	
	for i, v in {
		"preloaded",
		"declarativeAppend",
		"dequeAppend",
		"declarativePrepend",
		"dequePrepend"
	} do
		local var190, var191 = measureScrollPaginationArm(p100, p101, var189, t[v], p103)
		t_1[v] = var190
		t_2[v] = var191
	end
	t_2.completionBarrier = "synchronousScrollAndDeferredPageDelivery"
	
	return p102.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "scroll-pagination",
		description = "Scrolls a measured VirtualList one row per step toward an edge whose reached callback delivers the next page, compared with scrolling preloaded items.",
		responsibility = responsibilityCatalogModule.React.MountScroll,
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
		arms = t_1,
		evidence = t_2
	})
end

local function runRecyclingStateMount(p104, p105, p106, p107)
	-- upvalues: measureRecyclingStateMountOverhead (ref), createItems (ref)
	p107 = p107 or {}
	local itemCount = p107.itemCount or 1000
	local recyclingStateVisibleRows = p107.recyclingStateVisibleRows or 40
	assert(itemCount >= 1 and itemCount % 1 == 0, "itemCount must be a positive integer")
	assert(recyclingStateVisibleRows >= 1 and (recyclingStateVisibleRows <= itemCount and recyclingStateVisibleRows % 1 == 0), "recyclingStateVisibleRows must be an integer within itemCount")
	
	return measureRecyclingStateMountOverhead(p104, p105, p106, createItems(itemCount), recyclingStateVisibleRows, p107)
end

return {
	run = function(p104, p105, p106, p107)
		-- upvalues: list (ref), createItems (ref), createItemTypes (ref), measureCompletedMount (ref), measureCompletedTraversal (ref), measureHostSizeSettlePhases (ref), measureAssignmentPropagation (ref), createPropagationScenario (ref), var89 (write), measureRecyclingScopeHighWater (ref), measureCompositionChurn (ref), measureDeclarativeReconciliation (ref), measurePropSynchronization (ref), measureAssignmentBinding (ref), measurePresentationCommit (ref), measureVirtualListTeardown (ref), runRecyclingStateMount (ref), measureCompositionBatchSettlement (ref), measureWarmPagination (ref), measureExpensiveUniformTraversalComparison (ref), measureStatefulAssignmentRenderControl (ref), measureScrollPagination (ref)
		p107 = p107 or {}
		local itemCount = p107.itemCount or 1000
		local scrollStepCount = p107.scrollStepCount or 10
		local mountVisibleRows = p107.mountVisibleRows or list
		local lifecycleItemCount = p107.lifecycleItemCount or 40
		local propagationItemCount = p107.propagationItemCount or 1000
		assert(itemCount >= 10 and itemCount % 1 == 0, "itemCount must be an integer of at least 10")
		assert(scrollStepCount >= 1 and scrollStepCount % 1 == 0, "scrollStepCount must be a positive integer")
		assert(propagationItemCount >= 20 and propagationItemCount % 1 == 0, "propagationItemCount must be an integer of at least 20")
		local var192 = createItems(itemCount)
		local var193, var194 = createItemTypes(p104)
		local t = {}
		
		for i, v in ipairs(mountVisibleRows) do
			assert(v >= 1 and v <= itemCount, "mount visible-row scale is out of range")
			table.insert(t, measureCompletedMount(p104, p105, p106, var192, var193, v, p107))
		end
		table.insert(t, measureCompletedTraversal(p104, p105, p106, var192, var193, itemCount, scrollStepCount, false, p107))
		table.insert(t, measureCompletedTraversal(p104, p105, p106, var192, var194, itemCount, scrollStepCount, true, p107))
		table.insert(t, measureHostSizeSettlePhases(p104, p105, p106, p107))
		local _, var195 = createItemTypes(p104)
		
		for i_1, v_1 in ipairs({
			"at-start",
			"in-middle",
			"before-visible-anchor",
			"at-end"
		}) do
			table.insert(t, measureAssignmentPropagation(p104, p105, p106, var195, createPropagationScenario(p104, v_1, propagationItemCount), propagationItemCount, p107))
		end
		local var196, var197, var198 = var89(p104, p105, p106, p107)
		table.insert(t, var196)
		table.insert(t, var197)
		table.insert(t, var198)
		table.insert(t, measureRecyclingScopeHighWater(p104, p105, p106, lifecycleItemCount, p107))
		table.insert(t, measureCompositionChurn(p104, p105, p106, lifecycleItemCount, p107))
		table.insert(t, measureDeclarativeReconciliation(p104, p105, p106, var193, p107))
		table.insert(t, measurePropSynchronization(p104, p105, p106, var193, p107))
		local var199, var200 = measureAssignmentBinding(p104, p105, p106, p107)
		table.insert(t, var199)
		table.insert(t, var200)
		table.insert(t, measurePresentationCommit(p104, p105, p106, p107))
		table.insert(t, measureVirtualListTeardown(p104, p105, p106, p107))
		table.insert(t, runRecyclingStateMount(p104, p105, p106, p107))
		table.insert(t, measureCompositionBatchSettlement(p104, p105, p106, lifecycleItemCount, p107))
		table.insert(t, measureWarmPagination(p104, p105, p106, p107))
		table.insert(t, measureExpensiveUniformTraversalComparison(p104, p105, p106, var192, itemCount, scrollStepCount, p107))
		table.insert(t, measureStatefulAssignmentRenderControl(p104, p105, p106, p107))
		table.insert(t, measureScrollPagination(p104, p105, p106, p107))
		
		return t
	end,
	runDeclarativeDataReconciliation = runDeclarativeDataReconciliation,
	runRecyclingStateMount = runRecyclingStateMount
}