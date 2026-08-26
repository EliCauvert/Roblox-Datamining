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
			Text = signalsReact.useSignalState(p18.valueSignal).text
		})
	end, { readiness = "ReadyOnAssignment" }), viewRecycler.createRecyclableView(function(p18)
		-- upvalues: signalsReact (ref), react (ref)
		local var4 = signalsReact.useSignalState(p18.valueSignal)
		
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

local function measureCompletedTraversal(p32, p33, p34, p35, p36, p37, p38, p39, p40)
	-- upvalues: hasItemText (ref), observeCompletionPhases (ref), createOffsets (ref), captureCompletionPhase (ref), mountedItemCount (ref), responsibilityCatalogModule (ref)
	local clock = p40.clock or os.clock
	local folder = Instance.new("Folder")
	local var5 = p32.ReactRoblox.createRoot(folder)
	local var6 = if p39 then p32.ViewRecycler.Layout.measured({ estimatedItemLength = 40 }) else p32.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var7 = p32.ViewRecycler.DataSource.sequence(p35, function(p41)
		return p41.id
	end)
	local var8 = 0
	
	local var9 = function(p41)
		-- upvalues: var8 (write)
		if p41.kind == "measurementsProcessed" then
			var8 += p41.accepted
		end
	end
	
	local act = p32.ReactRoblox.act
	local var10 = nil
	local var11 = 10
	act(function()
		-- upvalues: var7 (ref), var6 (ref), p32 (ref), p36 (ref), var9 (ref), var10 (ref), var5 (ref), var11 (ref)
		local t = {
			overscan = 0,
			data = var7,
			layout = var6,
			axis = p32.ViewRecycler.Axis.Y,
			itemType = p36,
			diagnostics = var9
		}
		
		if var10 ~= nil then
			for i, v in var10 do
				t[i] = v
			end
		end
		var5:render(p32.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var11 * 40)
		}, {
			List = p32.React.createElement(p32.ViewRecycler.VirtualList, t)
		}))
	end)
	local t = {
		destinationRowCommitted = function()
			-- upvalues: hasItemText (copy), folder (ref)
			return hasItemText(folder, "Item 10")
		end
	}
	
	if p39 then
		function t.measurementAccepted()
			-- upvalues: var8 (write)
			return var8 > 0
		end
	end
	observeCompletionPhases(p32, t, "initial visible rows", {})
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local var12 = createOffsets(p37, p38)
	local var13 = 0
	local var14 = 0
	local t_1 = {}
	local var15 = p33.run(function()
		-- upvalues: var13 (write), p39 (ref), var12 (ref), var7 (ref), var8 (write), clock (ref), hasItemText (copy), folder (ref), p32 (ref), scrollingFrame (ref), captureCompletionPhase (copy), t_1 (ref), observeCompletionPhases (copy), var14 (write)
		var13 = (var13 + 1) % 2
		
		if p39 then
			for i, v in var12 do
				local var16 = math.floor(v / 40) + 1
				local cloned = table.clone(var7.getItem(var16))
				cloned.height = if var13 == 0 then 36 else 44
				var7.setItem(var16, cloned)
			end
		end
		local var17 = clock()
		
		for i, v in var12 do
			local var18 = math.floor(v / 40) + 1
			local var19 = var8
			local t = {
				destinationRowCommitted = function()
					-- upvalues: hasItemText (copy), folder (copy), var18 (ref)
					return hasItemText(folder, `Item {var18}`)
				end
			}
			
			if p39 then
				function t.measurementAccepted()
					-- upvalues: var8 (copy), var19 (ref)
					return var19 < var8
				end
			end
			local t_2 = {}
			p32.ReactRoblox.act(function()
				-- upvalues: scrollingFrame (copy), v (ref), captureCompletionPhase (copy), t (ref), t_2 (ref), t_1 (copy)
				scrollingFrame.CanvasPosition = Vector2.new(0, v)
				captureCompletionPhase(t, t_2, t_1, "afterMutation")
			end)
			observeCompletionPhases(p32, t, `scroll Item {var18}`, t_1, t_2)
		end
		local var20 = (clock() - var17) * 1000
		var14 = var8 - var8
		p32.ReactRoblox.act(function()
			-- upvalues: scrollingFrame (copy)
			scrollingFrame.CanvasPosition = Vector2.zero
		end)
		observeCompletionPhases(p32, {
			destinationRowCommitted = function()
				-- upvalues: hasItemText (copy), folder (copy)
				return hasItemText(folder, "Item 1")
			end
		}, "reset scroll position", {})
		
		return var20
	end, p40)
	local var21 = mountedItemCount(folder)
	p32.ReactRoblox.act(function()
		-- upvalues: var5 (ref)
		var5:unmount()
	end)
	var6.destroy()
	folder:Destroy()
	
	return p34.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		responsibility = responsibilityCatalogModule.React.MountScroll,
		workload = if p39 then "completed-measured-traversal" else "completed-uniform-traversal",
		description = if p39 then "Scrolls a measured VirtualList and waits for both destination-row commits and accepted size updates." else "Scrolls a uniform VirtualList and waits for each destination row to commit.",
		scale = {
			visibleRows = 10,
			items = p37,
			scrollSteps = p38,
			layout = if p39 then "measured" else "uniform"
		},
		timing = {
			unit = "ms",
			basis = "completedScrollTraversal",
			includesSchedulerWaits = true,
			operationsPerSample = p38
		},
		arms = { viewRecycler = var15 },
		evidence = {
			reactWorkFlush = "ReactRoblox.actWithMockScheduler",
			mountedItemViews = var21,
			acceptedMeasurementsPerTraversal = var14,
			completionBarrier = if p39 then "destinationRowCommittedAndMeasurementAccepted" else "destinationRowCommitted",
			completionPhaseCounts = t_1
		}
	})
end

local function measureHostSizeSettlePhases(value, p41, p42, p43)
	-- upvalues: observeCompletionPhases (ref), hasItemText (ref), waitForHeartbeatToSettle (ref), findMeasuredObjects (ref), flushDeferredWork (ref), recordSizeComparison (ref), responsibilityCatalogModule (ref)
	local clock = p43.clock or os.clock
	local screenGui = Instance.new("ScreenGui")
	screenGui.ResetOnSpawn = false
	screenGui.Parent = game:GetService("CoreGui")
	local var22 = value.ReactRoblox.createRoot(screenGui)
	local var23 = value.ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local repeated = string.rep("This response grows enough to wrap across the measured row. ", 8)
	local var24 = value.ViewRecycler.createRecyclableView(function(p44)
		-- upvalues: value (ref)
		return value.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.fromOffset(10, 0),
			Size = UDim2.new(1, -20, 0, 0),
			Text = value.SignalsReact.useSignalState(p44.valueSignal).text
		})
	end, { readiness = "ReadyOnCommit", hideWhilePending = true })
	local t = {
		id = "measurement-probe",
		text = "Short response",
		height = 40
	}
	local var25 = value.ViewRecycler.DataSource.sequence({ t }, function(p44)
		return p44.id
	end)
	local var26 = 0
	
	local var27 = function(p44)
		-- upvalues: var26 (write)
		if p44.kind == "measurementsProcessed" then
			var26 += p44.accepted
		end
	end
	
	local act = value.ReactRoblox.act
	local var28 = nil
	local var29 = 3
	act(function()
		-- upvalues: var25 (ref), var23 (ref), value (ref), var24 (ref), var27 (ref), var28 (ref), var22 (ref), var29 (ref)
		local t = {
			overscan = 0,
			data = var25,
			layout = var23,
			axis = value.ViewRecycler.Axis.Y,
			itemType = var24,
			diagnostics = var27
		}
		
		if var28 ~= nil then
			for i, v in var28 do
				t[i] = v
			end
		end
		var22:render(value.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var29 * 40)
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
			-- upvalues: var26 (write)
			return var26 > 0
		end
	}, "initial wrapped measured row", {})
	waitForHeartbeatToSettle(value)
	waitForHeartbeatToSettle(value)
	local var30 = 0
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local t_6 = { host = {}, content = {} }
	local var31 = 0
	local var32 = p41.run(function()
		-- upvalues: var31 (write), var30 (write), repeated (ref), var26 (write), findMeasuredObjects (copy), screenGui (ref), t_1 (ref), clock (ref), value (ref), var25 (ref), t (ref), flushDeferredWork (copy), waitForHeartbeatToSettle (copy), t_4 (ref), t_5 (ref), recordSizeComparison (copy), t_2 (ref), t_6 (ref), t_3 (ref)
		var31 += 1
		var30 = (var30 + 1) % 2
		local var33 = if var30 == 0 then "Short response" else repeated
		local var34 = if var30 == 0 then "short" else "long"
		local t_7 = {}
		local t_8 = {}
		local var35 = nil
		
		local function _(p44)
			-- upvalues: findMeasuredObjects (copy), screenGui (copy), var33 (ref), t_8 (ref), t_7 (ref), var35 (write), var26 (copy), var26 (ref), t_1 (copy)
			local var36, var37 = findMeasuredObjects(screenGui, var33)
			
			if var36 ~= nil then
				t_8[p44] = var36.AbsoluteSize.Y
			end
			if var37 ~= nil then
				t_7[p44] = var37.AbsoluteSize.Y
			end
			if var35 == nil and var26 < var26 then
				var35 = p44
				local var38 = t_1
				local measurementAccepted = var38.measurementAccepted
				
				if measurementAccepted == nil then
					measurementAccepted = {}
					var38.measurementAccepted = measurementAccepted
				end
				measurementAccepted[p44] = (measurementAccepted[p44] or 0) + 1
			end
		end
		
		local var36 = clock()
		value.ReactRoblox.act(function()
			-- upvalues: var25 (copy), t (copy), var33 (ref), findMeasuredObjects (copy), screenGui (copy), t_8 (ref), t_7 (ref), var35 (write), var26 (copy), var26 (ref), t_1 (copy)
			var25.setItem(1, { id = t.id, text = var33, height = t.height })
			local var37, var38 = findMeasuredObjects(screenGui, var33)
			
			if var37 ~= nil then
				t_8.afterMutation = var37.AbsoluteSize.Y
			end
			if var38 ~= nil then
				t_7.afterMutation = var38.AbsoluteSize.Y
			end
			if var35 == nil and var26 < var26 then
				var35 = "afterMutation"
				local var39 = t_1
				local measurementAccepted = var39.measurementAccepted
				
				if measurementAccepted == nil then
					measurementAccepted = {}
					var39.measurementAccepted = measurementAccepted
				end
				measurementAccepted.afterMutation = (measurementAccepted.afterMutation or 0) + 1
			end
		end)
		local var37, var38 = findMeasuredObjects(screenGui, var33)
		
		if var37 ~= nil then
			t_8.afterAct = var37.AbsoluteSize.Y
		end
		if var38 ~= nil then
			t_7.afterAct = var38.AbsoluteSize.Y
		end
		if var35 == nil and var26 < var26 then
			var35 = "afterAct"
			local var39 = t_1
			local measurementAccepted = var39.measurementAccepted
			
			if measurementAccepted == nil then
				measurementAccepted = {}
				var39.measurementAccepted = measurementAccepted
			end
			measurementAccepted.afterAct = (measurementAccepted.afterAct or 0) + 1
		end
		value.ReactRoblox.act(flushDeferredWork)
		local var40, var41 = findMeasuredObjects(screenGui, var33)
		
		if var40 ~= nil then
			t_8.deferred = var40.AbsoluteSize.Y
		end
		if var41 ~= nil then
			t_7.deferred = var41.AbsoluteSize.Y
		end
		if var35 == nil and var26 < var26 then
			var35 = "deferred"
			local var42 = t_1
			local measurementAccepted = var42.measurementAccepted
			
			if measurementAccepted == nil then
				measurementAccepted = {}
				var42.measurementAccepted = measurementAccepted
			end
			measurementAccepted.deferred = (measurementAccepted.deferred or 0) + 1
		end
		for i = 1, 3 do
			waitForHeartbeatToSettle(value)
			local var43 = `heartbeat{i}Settled`
			local var44, var45 = findMeasuredObjects(screenGui, var33)
			
			if var44 ~= nil then
				t_8[var43] = var44.AbsoluteSize.Y
			end
			if var45 ~= nil then
				t_7[var43] = var45.AbsoluteSize.Y
			end
			if var35 == nil and var26 < var26 then
				var35 = var43
				local var46 = t_1
				local measurementAccepted = var46.measurementAccepted
				
				if measurementAccepted == nil then
					measurementAccepted = {}
					var46.measurementAccepted = measurementAccepted
				end
				measurementAccepted[var43] = (measurementAccepted[var43] or 0) + 1
			end
		end
		local var47 = (clock() - var36) * 1000
		
		if var35 == nil then
			local var48 = t_1
			local measurementAccepted = var48.measurementAccepted
			
			if measurementAccepted == nil then
				measurementAccepted = {}
				var48.measurementAccepted = measurementAccepted
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
					update = var31,
					text = var34,
					observed = v,
					settled = heartbeat3Settled
				}
			end
		end
		for i_2, v_1 in t_8 do
			recordSizeComparison(t_3, i_2, v_1, heartbeat3Settled_1)
			
			if v_1 ~= heartbeat3Settled_1 and t_6.content[i_2] == nil then
				t_6.content[i_2] = {
					update = var31,
					text = var34,
					observed = v_1,
					settled = heartbeat3Settled_1
				}
			end
		end
		return var47
	end, p43)
	value.ReactRoblox.act(function()
		-- upvalues: var22 (ref)
		var22:unmount()
	end)
	var23.destroy()
	screenGui:Destroy()
	
	return p42.create({
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
		arms = { viewRecycler = var32 },
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

local function runAssignmentPropagationSample(value, p44, p45, p46, p47)
	-- upvalues: observeCompletionPhases (ref), hasItemText (ref), waitForHeartbeatToSettle (ref), findMeasuredObjects (ref)
	local clock = p47.clock or os.clock
	local list = table.create(p46)
	
	for i = 1, p46 do
		list[i] = { height = 40, id = `item{i}`, text = `Item {i}` }
	end
	local t = {
		height = 80,
		id = `inserted-{p45.name}`,
		text = `Inserted {p45.name}`
	}
	local folder = Instance.new("Folder")
	local var49 = value.ReactRoblox.createRoot(folder)
	local var50 = value.ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local var51 = value.ViewRecycler.DataSource.sequence(list, function(p48)
		return p48.id
	end)
	local var52 = nil
	local var53 = nil
	local var54 = nil
	local var55 = nil
	local var56 = nil
	local var57 = false
	local var58 = nil
	local t_1 = { data = 0, measurement = 0, programmaticScroll = 0 }
	local t_2 = {}
	
	local var59 = function(p48)
		-- upvalues: var57 (write), var52 (write), var53 (write), clock (ref), var54 (write), t_1 (ref)
		if not var57 then return end
		if p48.kind == "measurementsProcessingStarted" and var52 ~= nil then
			var53 = var53 or clock()
			
			return
		elseif p48.kind == "measurementsProcessed" and p48.accepted > 0 and var52 ~= nil then
			var54 = var54 or clock()
			
			return
		elseif p48.kind == "scrollCorrection" then
			t_1[p48.source] += p48.delta
		end
	end
	
	local t_3 = {
		overscan = p45.overscan,
		preserveScrollPositionOnChange = p45.preserveScrollPositionOnChange,
		initialScrollAlignment = p45.initialScrollAlignment,
		autoScrollOnChange = p45.autoScrollOnChange,
		_instrumentation = {
			assignmentChanged = function(_, p48)
				-- upvalues: var57 (write), t (ref), var52 (write), clock (ref)
				if var57 and p48 ~= nil and (p48.key == t.id and var52 == nil) then
					var52 = clock()
				end
			end
		},
		onContentLengthChanged = function(p48)
			-- upvalues: var57 (write), p45 (ref), var58 (write)
			if var57 and math.abs(p48 - p45.finalContentLength) <= 0.01 then
				var58 = p48
			end
		end
	}
	local var60 = 10
	value.ReactRoblox.act(function()
		-- upvalues: var51 (ref), var50 (ref), value (ref), p44 (ref), var59 (ref), t_3 (ref), var49 (ref), var60 (ref)
		local t = {
			overscan = 0,
			data = var51,
			layout = var50,
			axis = value.ViewRecycler.Axis.Y,
			itemType = p44,
			diagnostics = var59
		}
		
		if t_3 ~= nil then
			for i, v in t_3 do
				t[i] = v
			end
		end
		var49:render(value.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var60 * 40)
		}, {
			List = value.React.createElement(value.ViewRecycler.VirtualList, t)
		}))
	end)
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	value.ReactRoblox.act(function()
		-- upvalues: scrollingFrame (ref), p45 (ref)
		scrollingFrame.CanvasPosition = Vector2.new(0, p45.initialOffset)
	end)
	observeCompletionPhases(value, {
		destinationRowCommitted = function()
			-- upvalues: hasItemText (copy), folder (ref), p45 (ref)
			return hasItemText(folder, p45.initialDestinationText)
		end,
		initialCanvasSettled = function()
			-- upvalues: scrollingFrame (ref), p46 (ref)
			return math.abs(scrollingFrame.CanvasSize.Y.Offset - p46 * 40) <= 0.01
		end
	}, `prepare {p45.name} insertion`, {})
	waitForHeartbeatToSettle(value)
	assert(math.abs(scrollingFrame.CanvasSize.Y.Offset - p46 * 40) <= 0.01, `{p45.name}: initial canvas size did not settle (expected {p46 * 40}, got {scrollingFrame.CanvasSize.Y.Offset})`)
	assert(math.abs(scrollingFrame.CanvasPosition.Y - p45.initialOffset) <= 0.01, `{p45.name}: initial scroll position did not settle`)
	var57 = true
	value.ReactRoblox.act(function()
		-- upvalues: var51 (ref), p45 (ref), t (ref)
		var51.insert(p45.insertIndex, t)
	end)
	local var61 = if p45.name == "before-visible-anchor" then 40 else 0
	local var62 = if p45.name == "before-visible-anchor" then 40 else 0
	local t_4 = {}
	
	local function captureLibraryPublication()
		-- upvalues: folder (ref), t (ref), findMeasuredObjects (copy), p45 (ref), var52 (write), var53 (write), var54 (write), var58 (write), t_1 (ref), var61 (ref), var62 (ref), var55 (write), clock (ref)
		local _, var63 = findMeasuredObjects(folder, t.text)
		local var64 = if var63 == nil then nil else var63.Position.Y.Offset
		local _, var65 = findMeasuredObjects(folder, `Item {string.sub(p45.neighborKey, 5)}`)
		local var66 = if var65 == nil then nil else var65.Position.Y.Offset
		local var67 = var52 ~= nil and (var53 ~= nil and (var54 ~= nil and (var58 ~= nil and (var64 ~= nil and (math.abs(var64 - p45.insertedStartOffset) <= 0.01 and (var66 ~= nil and (math.abs(var66 - p45.neighborStartOffset) <= 0.01 and (math.abs(t_1.data - var61) <= 0.01 and math.abs(t_1.measurement - var62) <= 0.01))))))))
		
		if var67 and var55 == nil then
			var55 = clock()
		end
		return var67
	end
	
	observeCompletionPhases(value, {
		libraryOutputsPublished = captureLibraryPublication,
		hostValuesObserved = function()
			-- upvalues: captureLibraryPublication (ref), folder (ref), t (ref), findMeasuredObjects (copy), p45 (ref), t_4 (write), var52 (write), var53 (write), var54 (write), var55 (write), var58 (write), scrollingFrame (ref), var56 (write), clock (ref)
			captureLibraryPublication()
			local _, var63 = findMeasuredObjects(folder, t.text)
			local var64 = if var63 == nil then nil else var63.Position.Y.Offset
			local _, var65 = findMeasuredObjects(folder, `Item {string.sub(p45.neighborKey, 5)}`)
			t_4 = {
				assigned = var52 ~= nil,
				measurementStarted = var53 ~= nil,
				measurementProcessed = var54 ~= nil,
				libraryPublished = var55 ~= nil,
				observedContentLength = var58,
				canvasLength = scrollingFrame.CanvasSize.Y.Offset,
				scrollOffset = scrollingFrame.CanvasPosition.Y,
				insertedOffset = var64,
				neighborOffset = if var65 == nil then nil else var65.Position.Y.Offset
			}
			local var66 = var52 ~= nil and (var55 ~= nil and (math.abs(scrollingFrame.CanvasSize.Y.Offset - p45.finalContentLength) <= 0.01 and math.abs(scrollingFrame.CanvasPosition.Y - p45.finalScrollOffset) <= 0.01))
			
			if var66 and var56 == nil then
				var56 = clock()
			end
			return var66
		end
	}, function()
		-- upvalues: p45 (ref), t_4 (write)
		return `{p45.name} assignment, measurement, and propagation; assigned={t_4.assigned}, measurementStarted={t_4.measurementStarted}, measurementProcessed={t_4.measurementProcessed}, libraryPublished={t_4.libraryPublished}, content={t_4.observedContentLength}, canvas={t_4.canvasLength}, scroll={t_4.scrollOffset}, inserted={t_4.insertedOffset}, neighbor={t_4.neighborOffset}`
	end, t_2)
	local var63 = assert(var52, `{p45.name}: inserted item was not assigned`)
	local var64 = assert(var53, `{p45.name}: inserted item measurement did not reach Core`)
	local var65 = assert(var54, `{p45.name}: inserted item measurement was not accepted`)
	local var66 = assert(var55, `{p45.name}: library outputs were not fully published`)
	local var67 = assert(var56, `{p45.name}: host values did not fully propagate`)
	assert(var63 <= var64, `{p45.name}: measurement preceded assignment`)
	assert(var64 <= var65, `{p45.name}: measurement completed before it started`)
	assert(var65 <= var66, `{p45.name}: library outputs preceded measurement`)
	assert(var66 <= var67, `{p45.name}: host values preceded library outputs`)
	assert(math.abs(t_1.data - var61) <= 0.01, `{p45.name}: unexpected insertion anchor correction`)
	assert(math.abs(t_1.measurement - var62) <= 0.01, `{p45.name}: unexpected measurement anchor correction`)
	local t_5 = { insertIndex = p45.insertIndex }
	local var68, var69 = findMeasuredObjects(folder, t.text)
	t_5.insertedStartOffset = if var69 == nil then nil else var69.Position.Y.Offset
	t_5.neighborKey = p45.neighborKey
	var68, var166 = findMeasuredObjects(folder, `Item {string.sub(p45.neighborKey, 5)}`)
	t_5.neighborStartOffset = if var166 == nil then nil else var166.Position.Y.Offset
	t_5.contentLength = scrollingFrame.CanvasSize.Y.Offset
	t_5.scrollOffset = scrollingFrame.CanvasPosition.Y
	t_5.dataAnchorCorrection = t_1.data
	t_5.measurementAnchorCorrection = t_1.measurement
	t_5.completionPhaseCounts = t_2
	t_5.assignmentToMeasurementStartMs = (var64 - var63) * 1000
	t_5.measurementProcessingMs = (var65 - var64) * 1000
	t_5.measurementProcessedToLibraryPublicationMs = (var66 - var65) * 1000
	t_5.libraryPublicationToHostObservationMs = (var67 - var66) * 1000
	t_5.assignmentToHostObservationMs = (var67 - var63) * 1000
	value.ReactRoblox.act(function()
		-- upvalues: var49 (ref)
		var49:unmount()
	end)
	var50.destroy()
	folder:Destroy()
	
	return t_5
end

local function measureAssignmentPropagation(value, p48, p49, p50, p51, p52, p53)
	-- upvalues: runAssignmentPropagationSample (ref), responsibilityCatalogModule (ref)
	local t = {}
	
	return p49.create({
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
			items = p52,
			scenario = p51.name
		},
		timing = {
			unit = "ms",
			basis = "assignmentToMilestone",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = {
			assignmentToMeasurementStart = p48.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p50 (ref), p51 (ref), p52 (ref), p53 (ref), t (write)
				local var61 = runAssignmentPropagationSample(value, p50, p51, p52, p53)
				t = var61
				
				return var61.assignmentToMeasurementStartMs
			end, p53),
			measurementProcessing = p48.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p50 (ref), p51 (ref), p52 (ref), p53 (ref), t (write)
				local var61 = runAssignmentPropagationSample(value, p50, p51, p52, p53)
				t = var61
				
				return var61.measurementProcessingMs
			end, p53),
			measurementProcessedToLibraryPublication = p48.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p50 (ref), p51 (ref), p52 (ref), p53 (ref), t (write)
				local var61 = runAssignmentPropagationSample(value, p50, p51, p52, p53)
				t = var61
				
				return var61.measurementProcessedToLibraryPublicationMs
			end, p53),
			libraryPublicationToHostObservation = p48.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p50 (ref), p51 (ref), p52 (ref), p53 (ref), t (write)
				local var61 = runAssignmentPropagationSample(value, p50, p51, p52, p53)
				t = var61
				
				return var61.libraryPublicationToHostObservationMs
			end, p53),
			assignmentToHostObservation = p48.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p50 (ref), p51 (ref), p52 (ref), p53 (ref), t (write)
				local var61 = runAssignmentPropagationSample(value, p50, p51, p52, p53)
				t = var61
				
				return var61.assignmentToHostObservationMs
			end, p53)
		},
		evidence = t
	})
end

local var61 = nil

local function measureDeclarativeReconciliation(p48, p49, p50, p51, p52)
	-- upvalues: createItems (ref), observeCompletionPhases (ref), hasItemText (ref), responsibilityCatalogModule (ref)
	local clock = p52.clock or os.clock
	local folder = Instance.new("Folder")
	local var62 = p48.ReactRoblox.createRoot(folder)
	local var63 = p48.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var64 = createItems(20)
	local var65 = createItems(20)
	
	for i, v in var65 do
		v.text = `Reconciled {i}`
	end
	local function _(p53)
		return {
			items = p53,
			getItemKey = function(p54)
				return p54.id
			end
		}
	end
	
	local t = {
		items = var64,
		getItemKey = function(p53)
			return p53.id
		end
	}
	local act = p48.ReactRoblox.act
	local var66 = nil
	local var67 = nil
	local var68 = 10
	act(function()
		-- upvalues: t (ref), var63 (ref), p48 (ref), p51 (ref), var66 (ref), var67 (ref), var62 (ref), var68 (ref)
		local t = {
			overscan = 0,
			data = t,
			layout = var63,
			axis = p48.ViewRecycler.Axis.Y,
			itemType = p51,
			diagnostics = var66
		}
		
		if var67 ~= nil then
			for i, v in var67 do
				t[i] = v
			end
		end
		var62:render(p48.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var68 * 40)
		}, {
			List = p48.React.createElement(p48.ViewRecycler.VirtualList, t)
		}))
	end)
	local var69 = false
	local var70 = 0
	local t_1 = {}
	local var71 = ""
	local var72 = p49.run(function()
		-- upvalues: var69 (write), var65 (ref), var64 (ref), var71 (write), clock (ref), p48 (ref), var62 (ref), var63 (ref), p51 (ref), observeCompletionPhases (copy), hasItemText (copy), folder (ref), t_1 (ref), var70 (write)
		var69 = not var69
		local var73 = if var69 then var65 else var64
		var71 = if var69 then "Reconciled 10" else "Item 10"
		local var74 = clock()
		local t = {
			items = var73,
			getItemKey = function(p53)
				return p53.id
			end
		}
		local act = p48.ReactRoblox.act
		local var75 = nil
		local var76 = nil
		local var77 = 10
		act(function()
			-- upvalues: t (ref), var63 (ref), p48 (ref), p51 (ref), var75 (ref), var76 (ref), var62 (ref), var77 (ref)
			local t = {
				overscan = 0,
				data = t,
				layout = var63,
				axis = p48.ViewRecycler.Axis.Y,
				itemType = p51,
				diagnostics = var75
			}
			
			if var76 ~= nil then
				for i, v in var76 do
					t[i] = v
				end
			end
			var62:render(p48.React.createElement("Frame", {
				Name = "BenchmarkHost",
				Size = UDim2.fromOffset(400, var77 * 40)
			}, {
				List = p48.React.createElement(p48.ViewRecycler.VirtualList, t)
			}))
		end)
		observeCompletionPhases(p48, {
			reconciledContentCommitted = function()
				-- upvalues: hasItemText (copy), folder (copy), var71 (copy)
				return hasItemText(folder, var71)
			end
		}, "declarative data reconciliation", t_1)
		var70 += 1
		
		return (clock() - var74) * 1000
	end, p52)
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	scrollingFrame = scrollingFrame.CanvasSize.Y.Offset
	p48.ReactRoblox.act(function()
		-- upvalues: var62 (ref)
		var62:unmount()
	end)
	var63.destroy()
	folder:Destroy()
	
	return p50.create({
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
		arms = { viewRecycler = var72 },
		evidence = {
			completionBarrier = "reconciledContentCommitted",
			reconciliations = var70,
			finalCommittedText = var71,
			finalContentLength = scrollingFrame,
			completionPhaseCounts = t_1
		}
	})
end

local function runDeclarativeDataReconciliation(p53, p54, p55, p56, p57)
	-- upvalues: createItemTypes (ref), var61 (write), measureDeclarativeReconciliation (ref)
	p56 = p56 or {}
	local var73, var74 = createItemTypes(p53)
	assert(var73 ~= var74, "React benchmark Recyclable view types must have distinct identities")
	
	if p57 then
		var61(p53, p54, p55, { sampleCount = 1, warmupCount = 0, bootstrapResamples = 0 })
	end
	return measureDeclarativeReconciliation(p53, p54, p55, var73, p56)
end

local function measurePropSynchronization(p53, p54, p55, p56, p57)
	-- upvalues: createItems (ref), observeCompletionPhases (ref), hasItemText (ref), responsibilityCatalogModule (ref)
	local clock = p57.clock or os.clock
	local folder = Instance.new("Folder")
	local var73 = p53.ReactRoblox.createRoot(folder)
	local var74 = p53.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var75 = p53.ViewRecycler.Layout.uniform({ itemLength = 44 })
	local var76 = createItems(20)
	local var77 = createItems(21)
	var77[1].text = "Replacement first"
	local var78 = p53.ViewRecycler.DataSource.snapshot(var76, function(p58)
		return p58.id
	end)
	local var79 = p53.ViewRecycler.DataSource.snapshot(var77, function(p58)
		return p58.id
	end)
	local act = p53.ReactRoblox.act
	local var80 = nil
	local var81 = nil
	local var82 = 10
	act(function()
		-- upvalues: var78 (ref), var74 (ref), p53 (ref), p56 (ref), var80 (ref), var81 (ref), var73 (ref), var82 (ref)
		local t = {
			overscan = 0,
			data = var78,
			layout = var74,
			axis = p53.ViewRecycler.Axis.Y,
			itemType = p56,
			diagnostics = var80
		}
		
		if var81 ~= nil then
			for i, v in var81 do
				t[i] = v
			end
		end
		var73:render(p53.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var82 * 40)
		}, {
			List = p53.React.createElement(p53.ViewRecycler.VirtualList, t)
		}))
	end)
	local var83 = false
	local var84 = 0
	local t = {}
	local var85 = 0
	local var86 = ""
	local var87 = p54.run(function()
		-- upvalues: var83 (write), var79 (ref), var78 (ref), var75 (ref), var74 (ref), var85 (write), var77 (ref), var76 (ref), var86 (write), clock (ref), p53 (ref), var73 (ref), p56 (ref), observeCompletionPhases (copy), hasItemText (copy), folder (ref), t (ref), var84 (write)
		var83 = not var83
		local var88 = if var83 then var79 else var78
		local var89 = if var83 then var75 else var74
		var85 = if var83 then #var77 * 44 else #var76 * 40
		var86 = if var83 then "Replacement first" else "Item 1"
		local var90 = clock()
		local act = p53.ReactRoblox.act
		local var91 = nil
		local var92 = nil
		local var93 = 10
		act(function()
			-- upvalues: var88 (ref), var89 (ref), p53 (ref), p56 (ref), var91 (ref), var92 (ref), var73 (ref), var93 (ref)
			local t = {
				overscan = 0,
				data = var88,
				layout = var89,
				axis = p53.ViewRecycler.Axis.Y,
				itemType = p56,
				diagnostics = var91
			}
			
			if var92 ~= nil then
				for i, v in var92 do
					t[i] = v
				end
			end
			var73:render(p53.React.createElement("Frame", {
				Name = "BenchmarkHost",
				Size = UDim2.fromOffset(400, var93 * 40)
			}, {
				List = p53.React.createElement(p53.ViewRecycler.VirtualList, t)
			}))
		end)
		observeCompletionPhases(p53, {
			dataAndLayoutPropsCommitted = function()
				-- upvalues: hasItemText (copy), folder (copy), var86 (copy), var85 (copy)
				local var94 = hasItemText(folder, var86)
				
				if var94 then
					local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
					assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
					var94 = math.abs(scrollingFrame.CanvasSize.Y.Offset - var85) <= 0.01
				end
				return var94
			end
		}, "data and layout prop replacement", t)
		var84 += 1
		
		return (clock() - var90) * 1000
	end, p57)
	p53.ReactRoblox.act(function()
		-- upvalues: var73 (ref)
		var73:unmount()
	end)
	var74.destroy()
	folder:Destroy()
	var75.destroy()
	
	return p55.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "integrated",
		workload = "data-layout-prop-replacement",
		description = "Atomically replaces VirtualList data and layout props and waits for matching host geometry.",
		responsibility = responsibilityCatalogModule.React.PropSynchronization,
		scale = {
			replacementsPerSample = 1,
			firstItems = #var76,
			secondItems = #var77
		},
		timing = {
			unit = "ms",
			basis = "dataLayoutPropCommit",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = { viewRecycler = var87 },
		evidence = {
			completionBarrier = "dataAndLayoutPropsCommitted",
			replacements = var84,
			finalCommittedText = var86,
			finalContentLength = var85,
			completionPhaseCounts = t
		}
	})
end

local function measureAssignmentBinding(value, p58, p59, p60)
	-- upvalues: createItems (ref), hasItemText (ref), captureCompletionPhase (ref), observeCompletionPhases (ref), responsibilityCatalogModule (ref)
	local clock = p60.clock or os.clock
	local var88 = 0
	local var89 = 0
	local var90 = value.ViewRecycler.createRecyclableView(function(p61)
		-- upvalues: var88 (write), value (ref)
		var88 += 1
		
		return value.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = value.ViewRecycler.useItemBinding(p61.valueSignal, function(p62)
				return p62.text
			end)
		})
	end, { readiness = "ReadyOnAssignment" })
	local folder = Instance.new("Folder")
	local var91 = value.ReactRoblox.createRoot(folder)
	local var92 = value.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var93 = value.ViewRecycler.DataSource.sequence(createItems(20), function(p61)
		return p61.id
	end)
	local t = {
		_instrumentation = {
			assignmentChanged = function(_, p61)
				-- upvalues: var89 (write)
				if p61 ~= nil then
					var89 += 1
				end
			end
		}
	}
	local act = value.ReactRoblox.act
	local var94 = nil
	local var95 = 10
	act(function()
		-- upvalues: var93 (ref), var92 (ref), value (ref), var90 (ref), var94 (ref), t (ref), var91 (ref), var95 (ref)
		local t = {
			overscan = 0,
			data = var93,
			layout = var92,
			axis = value.ViewRecycler.Axis.Y,
			itemType = var90,
			diagnostics = var94
		}
		
		if t ~= nil then
			for i, v in t do
				t[i] = v
			end
		end
		var91:render(value.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var95 * 40)
		}, {
			List = value.React.createElement(value.ViewRecycler.VirtualList, t)
		}))
	end)
	local var96 = var88
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local var97 = scrollingFrame
	local var98 = true
	local var99 = 0
	local t_1 = {}
	local var100 = p58.run(function()
		-- upvalues: var98 (write), var89 (write), hasItemText (copy), folder (ref), clock (ref), value (ref), var97 (ref), captureCompletionPhase (copy), t_1 (ref), observeCompletionPhases (copy), var99 (write)
		var98 = not var98
		local var101 = if var98 then 0 else 400
		local var102 = if var98 then "Item 1" else "Item 11"
		local t = {
			bindingDelivered = function()
				-- upvalues: hasItemText (copy), folder (copy), var102 (ref)
				return hasItemText(folder, var102)
			end
		}
		local t_2 = {}
		local var103 = clock()
		value.ReactRoblox.act(function()
			-- upvalues: var97 (copy), var101 (ref), captureCompletionPhase (copy), t (ref), t_2 (ref), t_1 (copy)
			var97.CanvasPosition = Vector2.new(0, var101)
			captureCompletionPhase(t, t_2, t_1, "afterMutation")
		end)
		observeCompletionPhases(value, t, `binding delivery to {var102}`, t_1, t_2)
		var99 = var89 - var89
		
		return (clock() - var103) * 1000
	end, p60)
	local var101 = var88
	value.ReactRoblox.act(function()
		-- upvalues: var91 (ref)
		var91:unmount()
	end)
	var92.destroy()
	folder:Destroy()
	
	return p59.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "item-binding-delivery",
		description = "Delivers recycled item assignments through useItemBinding without rerendering physical rows.",
		responsibility = responsibilityCatalogModule.React.AssignmentBinding,
		scale = { items = 20, visibleRows = 10, assignmentsPerSample = 10 },
		timing = {
			unit = "ms",
			basis = "bindingAssignmentDelivery",
			operationsPerSample = 10,
			includesSchedulerWaits = true
		},
		arms = { immediate = var100 },
		evidence = {
			completionBarrier = "bindingDelivered",
			initialRenders = var96,
			finalRenders = var101,
			rerendersDuringDelivery = var101 - var96,
			deliveredAssignments = var99,
			completionPhaseCounts = t_1
		}
	}), p59.create({
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
		arms = { immediate = var100 },
		evidence = {
			completionBarrier = "bindingDelivered",
			publishedAssignments = var99,
			rerendersDuringPublication = var101 - var96,
			completionPhaseCounts = t_1
		}
	})
end

local function createPresentationArm(p61, p62, p63, p64)
	-- upvalues: createItems (ref), hasItemText (ref), captureCompletionPhase (ref), observeCompletionPhases (ref)
	local var96 = p61.ViewRecycler.createRecyclableView(if p62 == "ReadyOnAssignment" then function(p65)
		-- upvalues: p61 (ref)
		return p61.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p61.ViewRecycler.useItemBinding(p65.valueSignal, function(p66)
				return p66.text
			end)
		})
	end else function(p65)
		-- upvalues: p61 (ref)
		return p61.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p61.SignalsReact.useSignalState(p65.valueSignal).text
		})
	end, { readiness = p62, hideWhilePending = p63 })
	local folder = Instance.new("Folder")
	local var97 = p61.ReactRoblox.createRoot(folder)
	local var98 = p61.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var99 = p61.ViewRecycler.DataSource.sequence(createItems(20), function(p65)
		return p65.id
	end)
	local act = p61.ReactRoblox.act
	local var100 = nil
	local var101 = nil
	local var102 = 10
	act(function()
		-- upvalues: var99 (ref), var98 (ref), p61 (ref), var96 (ref), var100 (ref), var101 (ref), var97 (ref), var102 (ref)
		local t = {
			overscan = 0,
			data = var99,
			layout = var98,
			axis = p61.ViewRecycler.Axis.Y,
			itemType = var96,
			diagnostics = var100
		}
		
		if var101 ~= nil then
			for i, v in var101 do
				t[i] = v
			end
		end
		var97:render(p61.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var102 * 40)
		}, {
			List = p61.React.createElement(p61.ViewRecycler.VirtualList, t)
		}))
	end)
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local var103 = scrollingFrame
	local var104 = true
	local t = {}
	
	return {
		run = function()
			-- upvalues: var104 (write), hasItemText (copy), folder (ref), p64 (ref), p61 (ref), var103 (ref), captureCompletionPhase (copy), t (ref), observeCompletionPhases (copy)
			var104 = not var104
			local var105 = if var104 then 0 else 400
			local var106 = if var104 then "Item 1" else "Item 11"
			local t_1 = {
				presentationCommitted = function()
					-- upvalues: hasItemText (copy), folder (copy), var106 (ref)
					return hasItemText(folder, var106)
				end
			}
			local t_2 = {}
			local var107 = p64()
			p61.ReactRoblox.act(function()
				-- upvalues: var103 (copy), var105 (ref), captureCompletionPhase (copy), t_1 (ref), t_2 (ref), t (copy)
				var103.CanvasPosition = Vector2.new(0, var105)
				captureCompletionPhase(t_1, t_2, t, "afterMutation")
			end)
			observeCompletionPhases(p61, t_1, `presentation commit to {var106}`, t, t_2)
			
			return (p64() - var107) * 1000
		end,
		getEvidence = function()
			-- upvalues: p62 (ref), p63 (ref), t (ref)
			return {
				presentations = 1,
				readiness = p62,
				hideWhilePending = p63,
				completionPhaseCounts = t
			}
		end,
		destroy = function()
			-- upvalues: p61 (ref), var97 (ref), var98 (ref), folder (ref)
			p61.ReactRoblox.act(function()
				-- upvalues: var97 (ref)
				var97:unmount()
			end)
			var98.destroy()
			folder:Destroy()
		end
	}
end

local function measurePresentationCommit(p65, p66, p67, p68)
	-- upvalues: createPresentationArm (ref), responsibilityCatalogModule (ref)
	local clock = p68.clock or os.clock
	local var103 = createPresentationArm(p65, "ReadyOnCommit", false, clock)
	local var104 = createPresentationArm(p65, "ReadyOnCommit", true, clock)
	local var105 = createPresentationArm(p65, "ReadyOnAssignment", false, clock)
	local var106 = p66.run(var103.run, p68)
	local var107 = p66.run(var104.run, p68)
	local var108 = p66.run(var105.run, p68)
	local t = {
		completionBarrier = "presentationCommitted",
		readyOnCommitVisible = var103.getEvidence(),
		readyOnCommitHidden = var104.getEvidence(),
		readyOnAssignment = var105.getEvidence()
	}
	var103.destroy()
	var104.destroy()
	var105.destroy()
	
	return p67.create({
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
			readyOnCommitVisible = var106,
			readyOnCommitHidden = var107,
			readyOnAssignment = var108
		},
		evidence = t
	})
end

local function measureVirtualListTeardown(p65, p66, p67, p68)
	-- upvalues: createItems (ref), observeCompletionPhases (ref), hasItemText (ref), responsibilityCatalogModule (ref)
	local clock = p68.clock or os.clock
	local t = {}
	
	return p67.create({
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
			viewRecycler = p66.run(function()
				-- upvalues: p65 (ref), createItems (copy), observeCompletionPhases (copy), hasItemText (copy), clock (ref), t (write)
				local var103 = 0
				local var104 = 0
				local var105 = p65.ViewRecycler.createRecyclableView(function(p69)
					-- upvalues: p65 (copy), var103 (write), var104 (write)
					local var106 = p65.SignalsReact.useSignalState(p69.valueSignal)
					p65.React.useEffect(function()
						-- upvalues: var103 (copy), var104 (copy)
						var103 += 1
						
						return function()
							-- upvalues: var104 (copy)
							var104 += 1
						end
					end, {})
					
					return p65.React.createElement("TextLabel", {
						Name = "Content",
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						Text = var106.text
					})
				end, { readiness = "ReadyOnCommit", hideWhilePending = true })
				local folder = Instance.new("Folder")
				local var106 = p65.ReactRoblox.createRoot(folder)
				local var107 = p65.ViewRecycler.Layout.uniform({ itemLength = 40 })
				local var108 = p65.ViewRecycler.DataSource.snapshot(createItems(20), function(p69)
					return p69.id
				end)
				local act = p65.ReactRoblox.act
				local var109 = nil
				local var110 = nil
				local var111 = 10
				act(function()
					-- upvalues: var108 (ref), var107 (ref), p65 (ref), var105 (ref), var109 (ref), var110 (ref), var106 (ref), var111 (ref)
					local t = {
						overscan = 0,
						data = var108,
						layout = var107,
						axis = p65.ViewRecycler.Axis.Y,
						itemType = var105,
						diagnostics = var109
					}
					
					if var110 ~= nil then
						for i, v in var110 do
							t[i] = v
						end
					end
					var106:render(p65.React.createElement("Frame", {
						Name = "BenchmarkHost",
						Size = UDim2.fromOffset(400, var111 * 40)
					}, {
						List = p65.React.createElement(p65.ViewRecycler.VirtualList, t)
					}))
				end)
				observeCompletionPhases(p65, {
					mounted = function()
						-- upvalues: var103 (write), hasItemText (copy), folder (ref)
						return var103 > 0 and hasItemText(folder, "Item 10")
					end
				}, "VirtualList teardown setup", {})
				local var112 = clock()
				p65.ReactRoblox.act(function()
					-- upvalues: var106 (ref)
					var106:unmount()
				end)
				var107.destroy()
				local count = #folder:GetDescendants()
				folder:Destroy()
				local var113 = (clock() - var112) * 1000
				assert(var104 == var103, "VirtualList teardown did not unmount every physical row")
				assert(count == 0, "VirtualList teardown retained host descendants")
				t = {
					completionBarrier = "allRowsUnmountedAndHostsRemoved",
					mountedRows = var103,
					unmountedRows = var104,
					descendantsAfterUnmount = count,
					completionPhaseCounts = { allRowsUnmountedAndHostsRemoved = { afterAct = 1 } }
				}
				
				return var113
			end, p68)
		},
		evidence = t
	})
end

local function createRecyclingTransferArm(p69, p70, p71)
	-- upvalues: findMeasuredObjects (ref), hasItemText (ref), captureCompletionPhase (ref), observeCompletionPhases (ref)
	local react = p69.React
	local viewRecycler = p69.ViewRecycler
	local var103 = 0
	local var104 = 0
	local var105 = viewRecycler.createRecyclableView(if p70 == "ReadyOnAssignment" then function(p72)
		-- upvalues: react (ref), var103 (write), var104 (write), viewRecycler (ref)
		local var106 = react.useState("state-preserved")
		react.useEffect(function()
			-- upvalues: var103 (copy), var104 (copy)
			var103 += 1
			
			return function()
				-- upvalues: var104 (copy)
				var104 += 1
			end
		end, {})
		
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = viewRecycler.useItemBinding(p72.valueSignal, function(p73)
				-- upvalues: var106 (ref)
				return `{p73.text}:{var106}`
			end)
		})
	end else function(p72)
		-- upvalues: p69 (ref), react (ref), var103 (write), var104 (write)
		local var106 = p69.SignalsReact.useSignalState(p72.valueSignal)
		local var107 = react.useState("state-preserved")
		react.useEffect(function()
			-- upvalues: var103 (copy), var104 (copy)
			var103 += 1
			
			return function()
				-- upvalues: var104 (copy)
				var104 += 1
			end
		end, {})
		
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = `{var106.text}:{var107}`
		})
	end, {
		readiness = p70,
		hideWhilePending = p70 == "ReadyOnCommit"
	})
	local var106 = viewRecycler.DataSource.sequence({ { id = "first", text = "First", height = 40 } }, function(p72)
		return p72.id
	end)
	local var107 = viewRecycler.DataSource.sequence({ { id = "second", text = "Second", height = 40 } }, function(p72)
		return p72.id
	end)
	local var108 = viewRecycler.Layout.uniform({ itemLength = 40 })
	local var109 = viewRecycler.Layout.uniform({ itemLength = 40 })
	local t = { current = nil }
	local frame = Instance.new("Frame")
	frame.Size = UDim2.fromOffset(400, 40)
	local var110 = p69.ReactRoblox.createRoot(frame)
	local viewRecycler_1 = p69.ViewRecycler
	local var111 = false
	local var112 = ""
	local var113 = nil
	local var114 = nil
	local var115 = 0
	local var116 = 0
	
	local function assignmentChanged(_, p72)
		-- upvalues: var111 (write), var116 (write), var115 (write), var112 (write), var113 (write), p71 (ref)
		if var111 then
			if p72 == nil then
				var116 += 1
				
				return
			end
			var115 += 1
			
			if p72.key == var112 and var113 == nil then
				var113 = p71()
			end
		end
	end
	
	local function presentationChanged(_, p72)
		-- upvalues: var111 (write), var112 (write), var114 (write), p71 (ref)
		if var111 and p72 ~= nil and (p72.key == var112 and var114 == nil) then
			var114 = p71()
		end
	end
	
	p69.ReactRoblox.act(function()
		-- upvalues: var110 (ref), react (ref), viewRecycler_1 (ref), t (ref), var106 (ref), var108 (ref), var105 (ref), assignmentChanged (ref), presentationChanged (ref), var107 (ref), var109 (ref)
		var110:render(react.createElement(viewRecycler_1.RecyclingViewport, {
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
					data = var106,
					layout = var108,
					axis = viewRecycler_1.Axis.Y,
					itemType = var105,
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
					data = var107,
					layout = var109,
					axis = viewRecycler_1.Axis.Y,
					itemType = var105,
					_instrumentation = {
						assignmentChanged = assignmentChanged,
						presentationChanged = presentationChanged
					},
					scrollingFrameProps = { Name = "SecondList" }
				})
			})
		}))
	end)
	local var117 = assert(findMeasuredObjects(frame, "First:state-preserved"))
	local listItemViewFrame1 = var117:FindFirstAncestor("ListItemViewFrame1")
	local var118 = assert(frame:FindFirstChild("FirstRoot", true))
	local var119 = assert(frame:FindFirstChild("SecondRoot", true))
	local var120 = true
	local t_1 = {}
	local var121 = 0
	local t_2 = {}
	
	return {
		run = function()
			-- upvalues: var120 (write), var118 (ref), var119 (ref), var112 (write), var113 (write), var114 (write), var111 (write), hasItemText (copy), frame (ref), findMeasuredObjects (copy), p71 (ref), var117 (ref), listItemViewFrame1 (ref), p69 (ref), t (ref), captureCompletionPhase (copy), t_1 (ref), observeCompletionPhases (copy), var121 (write), t_2 (write)
			var120 = not var120
			local var122 = if var120 then "First:state-preserved" else "Second:state-preserved"
			local var123 = if var120 then var118 else var119
			local var124 = if var120 then 0 else 40
			local var125 = if var120 then 400 else 200
			var112 = if var120 then "first" else "second"
			var113 = nil
			var114 = nil
			var111 = true
			local var126 = nil
			local var127 = nil
			local t_3 = {
				assignmentDelivered = function()
					-- upvalues: var113 (copy)
					return var113 ~= nil
				end,
				commitCompleted = function()
					-- upvalues: var114 (copy), hasItemText (copy), frame (copy), var122 (ref)
					return var114 ~= nil and hasItemText(frame, var122)
				end,
				layoutSettled = function()
					-- upvalues: findMeasuredObjects (copy), frame (copy), var122 (ref), var125 (ref), var126 (write), p71 (copy)
					local var128 = findMeasuredObjects(frame, var122)
					local var129 = var128 ~= nil and math.abs(var128.AbsoluteSize.X - var125) <= 0.01
					
					if var129 and var126 == nil then
						var126 = p71()
					end
					return var129
				end,
				hostObserved = function()
					-- upvalues: findMeasuredObjects (copy), frame (copy), var122 (ref), var117 (copy), var123 (ref), listItemViewFrame1 (copy), var127 (write), p71 (copy)
					local var128 = findMeasuredObjects(frame, var122)
					local var129 = var128 ~= nil and (var128 == var117 and (var128:IsDescendantOf(var123) and var128:FindFirstAncestor("ListItemViewFrame1") == listItemViewFrame1))
					
					if var129 and var127 == nil then
						var127 = p71()
					end
					return var129
				end,
				destinationPresented = function()
					-- upvalues: findMeasuredObjects (copy), frame (copy), var122 (ref), var117 (copy), var123 (ref), listItemViewFrame1 (copy), var125 (ref)
					local var128 = findMeasuredObjects(frame, var122)
					
					return var128 ~= nil and (var128 == var117 and (var128:IsDescendantOf(var123) and (var128:FindFirstAncestor("ListItemViewFrame1") == listItemViewFrame1 and math.abs(var128.AbsoluteSize.X - var125) <= 0.01)))
				end
			}
			local t_4 = {}
			local var128 = p71()
			p69.ReactRoblox.act(function()
				-- upvalues: t (copy), var124 (ref), captureCompletionPhase (copy), t_3 (ref), t_4 (ref), t_1 (copy)
				t.current.CanvasPosition = Vector2.new(0, var124)
				captureCompletionPhase(t_3, t_4, t_1, "afterMutation")
			end)
			observeCompletionPhases(p69, t_3, `recycling transfer to {var122}`, t_1, t_4)
			var121 += 1
			t_2 = {
				assignmentMs = (assert(var113, "fixed-size transfer assignment was not delivered") - var128) * 1000,
				commitMs = (assert(var114, "fixed-size transfer presentation was not committed") - var128) * 1000,
				layoutMs = (assert(var126, "fixed-size transfer layout did not settle") - var128) * 1000,
				hostMs = (assert(var127, "fixed-size transfer host was not observed") - var128) * 1000
			}
			
			return (p71() - var128) * 1000
		end,
		getEvidence = function()
			-- upvalues: var103 (write), var104 (write), var121 (write), findMeasuredObjects (copy), frame (ref), var120 (write), var117 (ref), var115 (write), var116 (write), t_2 (write), t_1 (ref)
			return {
				firstListWidth = 400,
				secondListWidth = 200,
				mounts = var103,
				unmounts = var104,
				transfers = var121,
				sameContentInstance = findMeasuredObjects(frame, if var120 then "First:state-preserved" else "Second:state-preserved") == var117,
				activations = var115,
				deactivations = var116,
				milestones = t_2,
				completionPhaseCounts = t_1
			}
		end,
		destroy = function()
			-- upvalues: p69 (ref), var110 (ref), var108 (ref), var109 (ref), frame (ref)
			p69.ReactRoblox.act(function()
				-- upvalues: var110 (copy)
				var110:unmount()
			end)
			var108.destroy()
			var109.destroy()
			frame:Destroy()
		end
	}
end

local function createWrappedRecyclingTransferArm(p69, p70, p71)
	-- upvalues: waitForHeartbeatToSettle (ref), findMeasuredObjects (ref), hasItemText (ref), captureCompletionPhase (ref), observeCompletionPhases (ref)
	local react = p69.React
	local viewRecycler = p69.ViewRecycler
	local var103 = 0
	local var104 = 0
	local var105 = 0
	local var106 = nil
	local var107 = nil
	local var108 = nil
	local var109 = nil
	local var110 = nil
	local var111 = viewRecycler.createRecyclableView(function(p72)
		-- upvalues: p69 (ref), react (ref), var103 (write), var104 (write)
		local var112 = p69.SignalsReact.useSignalState(p72.valueSignal)
		local var113 = react.useState("state-preserved")
		react.useEffect(function()
			-- upvalues: var103 (copy), var104 (copy)
			var103 += 1
			
			return function()
				-- upvalues: var104 (copy)
				var104 += 1
			end
		end, {})
		
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -20, 0, 0),
			Text = `{var112.text}:{var113}`
		})
	end, {
		readiness = p70,
		hideWhilePending = p70 == "ReadyOnCommit"
	})
	local repeated = string.rep("First wrapped transfer content ", 8)
	local repeated_1 = string.rep("Second wrapped transfer content ", 8)
	local var112 = viewRecycler.DataSource.sequence({ { id = "first-wrapped", height = 40, text = repeated } }, function(p72)
		return p72.id
	end)
	local var113 = viewRecycler.DataSource.sequence({
		{ id = "second-wrapped", height = 40, text = repeated_1 }
	}, function(p72)
		return p72.id
	end)
	local var114 = viewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local var115 = viewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local t = { current = nil }
	local screenGui = Instance.new("ScreenGui")
	screenGui.ResetOnSpawn = false
	screenGui.Parent = game:GetService("CoreGui")
	local var116 = p69.ReactRoblox.createRoot(screenGui)
	local var117 = false
	local var118 = ""
	
	local function assignmentChanged(_, p72)
		-- upvalues: var117 (write), var118 (write), var106 (write), p71 (ref)
		if var117 and p72 ~= nil and (p72.key == var118 and var106 == nil) then
			var106 = p71()
		end
	end
	
	local function presentationChanged(_, p72)
		-- upvalues: var117 (write), var118 (write), var107 (write), p71 (ref)
		if var117 and p72 ~= nil and (p72.key == var118 and var107 == nil) then
			var107 = p71()
		end
	end
	
	local function diagnostics(p72)
		-- upvalues: var117 (write), var109 (write), var105 (write), p71 (ref)
		if var117 and p72.kind == "measurementsProcessed" and (p72.accepted > 0 and var109 == nil) then
			var105 += p72.accepted
			var109 = p71()
		end
	end
	
	p69.ReactRoblox.act(function()
		-- upvalues: var116 (ref), react (ref), viewRecycler (ref), t (ref), var112 (ref), var114 (ref), var111 (ref), diagnostics (ref), assignmentChanged (ref), presentationChanged (ref), var113 (ref), var115 (ref)
		var116:render(react.createElement("Frame", { Name = "TransferHost", Size = UDim2.fromOffset(400, 40) }, {
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
						data = var112,
						layout = var114,
						axis = viewRecycler.Axis.Y,
						itemType = var111,
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
						data = var113,
						layout = var115,
						axis = viewRecycler.Axis.Y,
						itemType = var111,
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
	waitForHeartbeatToSettle(p69)
	waitForHeartbeatToSettle(p69)
	local var119 = assert(findMeasuredObjects(screenGui, `{repeated}:state-preserved`))
	local listItemViewFrame1 = var119:FindFirstAncestor("ListItemViewFrame1")
	local var120 = assert(screenGui:FindFirstChild("FirstRoot", true))
	local var121 = assert(screenGui:FindFirstChild("SecondRoot", true))
	local var122 = true
	local t_1 = {}
	local var123 = 0
	local t_2 = {}
	
	return {
		run = function()
			-- upvalues: var122 (write), repeated (ref), repeated_1 (ref), var118 (write), var120 (ref), var121 (ref), var114 (ref), var115 (ref), var106 (write), var107 (write), var108 (write), var109 (write), var110 (write), p71 (ref), var117 (write), hasItemText (copy), screenGui (ref), findMeasuredObjects (copy), var119 (ref), listItemViewFrame1 (ref), p69 (ref), t (ref), captureCompletionPhase (copy), t_1 (ref), observeCompletionPhases (copy), t_2 (write), var123 (write)
			var122 = not var122
			local var124 = `{if var122 then repeated else repeated_1}:state-preserved`
			var118 = if var122 then "first-wrapped" else "second-wrapped"
			local var125 = if var122 then var120 else var121
			local var126 = if var122 then 0 else 40
			local var127 = if var122 then 400 else 200
			local var128 = if var122 then var114 else var115
			var106 = nil
			var107 = nil
			var108 = nil
			var109 = nil
			var110 = nil
			local var129 = p71()
			var117 = true
			local t_3 = {
				assignmentDelivered = function()
					-- upvalues: var106 (copy)
					return var106 ~= nil
				end,
				commitCompleted = function()
					-- upvalues: var107 (copy), hasItemText (copy), screenGui (copy), var124 (ref)
					return var107 ~= nil and hasItemText(screenGui, var124)
				end,
				layoutSettled = function()
					-- upvalues: findMeasuredObjects (copy), screenGui (copy), var124 (ref), var127 (ref), var108 (copy), p71 (copy)
					local var130, var131 = findMeasuredObjects(screenGui, var124)
					local var132 = var130 ~= nil and (var131 ~= nil and (var130.AbsoluteSize.X == var127 - 20 and (var130.AbsoluteSize.Y > 0 and var131.AbsoluteSize.Y > 0)))
					
					if var132 and var108 == nil then
						var108 = p71()
					end
					return var132
				end,
				measurementSettled = function()
					-- upvalues: findMeasuredObjects (copy), screenGui (copy), var124 (ref), var128 (ref), var109 (copy), p71 (copy)
					local var130, var131 = findMeasuredObjects(screenGui, var124)
					local var132 = var130 ~= nil and (var131 ~= nil and math.abs(var128.getItemLayout(1).length - var131.AbsoluteSize.Y) <= 0.01)
					
					if var132 and var109 == nil then
						var109 = p71()
					end
					return var132
				end,
				hostObserved = function()
					-- upvalues: findMeasuredObjects (copy), screenGui (copy), var124 (ref), var119 (copy), var125 (ref), listItemViewFrame1 (copy), var110 (copy), p71 (copy)
					local var130 = findMeasuredObjects(screenGui, var124)
					local var131 = var130 ~= nil and (var130 == var119 and (var130:IsDescendantOf(var125) and var130:FindFirstAncestor("ListItemViewFrame1") == listItemViewFrame1))
					
					if var131 and var110 == nil then
						var110 = p71()
					end
					return var131
				end
			}
			local t_4 = {}
			p69.ReactRoblox.act(function()
				-- upvalues: t (copy), var126 (ref), captureCompletionPhase (copy), t_3 (ref), t_4 (ref), t_1 (copy)
				t.current.CanvasPosition = Vector2.new(0, var126)
				captureCompletionPhase(t_3, t_4, t_1, "afterMutation")
			end)
			observeCompletionPhases(p69, t_3, function()
				-- upvalues: findMeasuredObjects (copy), screenGui (copy), var124 (ref), var118 (copy), var106 (copy), var107 (copy), var108 (copy), var109 (copy), var110 (copy), var127 (ref)
				local var130, var131 = findMeasuredObjects(screenGui, var124)
				
				return `wrapped recycling transfer to {var118}; assignment={var106 ~= nil}, commit={var107 ~= nil}, content={var130 ~= nil}, layout={var108 ~= nil}, measurement={var109 ~= nil}, host={var110 ~= nil}, contentWidth={if var130 == nil then "nil" else var130.AbsoluteSize.X}, expectedWidth={var127 - 20}, hostHeight={if var131 == nil then "nil" else var131.AbsoluteSize.Y}`
			end, t_1, t_4)
			t_2 = {
				assignmentMs = (assert(var106, "wrapped transfer assignment was not delivered") - var129) * 1000,
				commitMs = (assert(var107, "wrapped transfer presentation was not committed") - var129) * 1000,
				layoutMs = (assert(var108, "wrapped transfer layout did not settle") - var129) * 1000,
				measurementMs = (assert(var109, "wrapped transfer measurement was not settled") - var129) * 1000,
				hostMs = (assert(var110, "wrapped transfer host was not observed") - var129) * 1000
			}
			var123 += 1
			
			return (p71() - var129) * 1000
		end,
		getEvidence = function()
			-- upvalues: var103 (write), var104 (write), var123 (write), findMeasuredObjects (copy), screenGui (ref), var122 (write), repeated (ref), repeated_1 (ref), var119 (ref), var105 (write), t_2 (write), t_1 (ref)
			return {
				mounts = var103,
				unmounts = var104,
				transfers = var123,
				sameContentInstance = findMeasuredObjects(screenGui, `{if var122 then repeated else repeated_1}:state-preserved`) == var119,
				acceptedMeasurements = var105,
				milestones = t_2,
				completionPhaseCounts = t_1
			}
		end,
		destroy = function()
			-- upvalues: p69 (ref), var116 (ref), var114 (ref), var115 (ref), screenGui (ref)
			p69.ReactRoblox.act(function()
				-- upvalues: var116 (copy)
				var116:unmount()
			end)
			var114.destroy()
			var115.destroy()
			screenGui:Destroy()
		end
	}
end

var61 = function(p72, p73, p74, p75)
	-- upvalues: createRecyclingTransferArm (ref), createWrappedRecyclingTransferArm (ref), responsibilityCatalogModule (ref)
	local clock = p75.clock or os.clock
	local var132 = createRecyclingTransferArm(p72, "ReadyOnCommit", clock)
	local var133 = createRecyclingTransferArm(p72, "ReadyOnAssignment", clock)
	local var134 = createWrappedRecyclingTransferArm(p72, "ReadyOnCommit", clock)
	local var135 = createWrappedRecyclingTransferArm(p72, "ReadyOnAssignment", clock)
	local var136 = p73.run(var132.run, p75)
	local var137 = p73.run(var133.run, p75)
	local var138 = p73.run(var134.run, p75)
	local var139 = p73.run(var135.run, p75)
	local t = {
		fixedSizeMeasurementMilestone = "notRequiredUniformLayout",
		untilCommit = var132.getEvidence(),
		immediate = var133.getEvidence()
	}
	local t_1 = {
		wrappedUntilCommit = var134.getEvidence(),
		wrappedImmediate = var135.getEvidence()
	}
	var132.destroy()
	var133.destroy()
	var134.destroy()
	var135.destroy()
	
	return p74.create({
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
		arms = { untilCommit = var136, immediate = var137 },
		evidence = t
	}), p74.create({
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
		arms = { wrappedUntilCommit = var138, wrappedImmediate = var139 },
		evidence = t_1
	}), p74.create({
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
		arms = { untilCommit = var136, immediate = var137 },
		evidence = t
	})
end

local function measureRecyclingScopeHighWater(p72, p73, p74, p75, p76)
	-- upvalues: responsibilityCatalogModule (ref)
	local clock = p76.clock or os.clock
	local t = {}
	
	return p74.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "isolated",
		workload = "recycling-scope-high-water-lifecycle",
		description = "Creates one React RecyclingScope high-water batch and publishes only surviving hosts.",
		responsibility = responsibilityCatalogModule.React.ScopeOwnership,
		scale = { items = p75 },
		timing = {
			unit = "ms",
			basis = "recyclingScopeHighWaterBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p75
		},
		arms = {
			viewRecycler = p73.run(function()
				-- upvalues: p72 (ref), p75 (ref), clock (ref), t (write)
				local var132, var133 = p72.LifecycleWorkloads.recyclingScopeHighWater(p75, clock)
				t = var133
				
				return var132
			end, p76)
		},
		evidence = t
	})
end

local function measureCompositionChurn(p72, p73, p74, p75, p76)
	-- upvalues: responsibilityCatalogModule (ref)
	local clock = p76.clock or os.clock
	local var132 = p72.LifecycleWorkloads.compositionChurn(p75)
	local var133 = 0
	local var134 = 0
	local var135 = p73.run(function()
		-- upvalues: var132 (ref), clock (ref), var133 (write), var134 (write)
		local assignmentUpdates = var132.getAssignmentUpdates()
		local flushes = var132.getFlushes()
		local var136 = clock()
		var132.run()
		local var137 = (clock() - var136) * 1000
		var133 = var132.getAssignmentUpdates() - assignmentUpdates
		var134 = var132.getFlushes() - flushes
		
		return var137
	end, p76)
	var132.destroy()
	
	return p74.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "isolated",
		workload = "composed-recyclable-churn",
		description = "Coalesces one prop update per composed destination into a single placement flush.",
		responsibility = responsibilityCatalogModule.React.Composition,
		scale = { items = p75, updates = p75 },
		timing = {
			unit = "ms",
			basis = "compositionPlacementFlushBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p75
		},
		arms = { viewRecycler = var135 },
		evidence = {
			assignmentUpdates = var133,
			coalescedUpdates = p75,
			placementFlushes = var134,
			completionPhaseCounts = { compositionPublication = { synchronousFlush = 1 } }
		}
	})
end

return {
	run = function(p72, p73, p74, p75)
		-- upvalues: list (ref), createItems (ref), createItemTypes (ref), measureCompletedMount (ref), measureCompletedTraversal (ref), measureHostSizeSettlePhases (ref), measureAssignmentPropagation (ref), createPropagationScenario (ref), var61 (write), measureRecyclingScopeHighWater (ref), measureCompositionChurn (ref), measureDeclarativeReconciliation (ref), measurePropSynchronization (ref), measureAssignmentBinding (ref), measurePresentationCommit (ref), measureVirtualListTeardown (ref)
		p75 = p75 or {}
		local itemCount = p75.itemCount or 1000
		local scrollStepCount = p75.scrollStepCount or 10
		local mountVisibleRows = p75.mountVisibleRows or list
		local lifecycleItemCount = p75.lifecycleItemCount or 40
		local propagationItemCount = p75.propagationItemCount or 1000
		assert(itemCount >= 10 and itemCount % 1 == 0, "itemCount must be an integer of at least 10")
		assert(scrollStepCount >= 1 and scrollStepCount % 1 == 0, "scrollStepCount must be a positive integer")
		assert(propagationItemCount >= 20 and propagationItemCount % 1 == 0, "propagationItemCount must be an integer of at least 20")
		local var132 = createItems(itemCount)
		local var133, var134 = createItemTypes(p72)
		local t = {}
		
		for i, v in ipairs(mountVisibleRows) do
			assert(v >= 1 and v <= itemCount, "mount visible-row scale is out of range")
			table.insert(t, measureCompletedMount(p72, p73, p74, var132, var133, v, p75))
		end
		table.insert(t, measureCompletedTraversal(p72, p73, p74, var132, var133, itemCount, scrollStepCount, false, p75))
		table.insert(t, measureCompletedTraversal(p72, p73, p74, var132, var134, itemCount, scrollStepCount, true, p75))
		table.insert(t, measureHostSizeSettlePhases(p72, p73, p74, p75))
		local _, var135 = createItemTypes(p72)
		
		for i_1, v_1 in ipairs({
			"at-start",
			"in-middle",
			"before-visible-anchor",
			"at-end"
		}) do
			table.insert(t, measureAssignmentPropagation(p72, p73, p74, var135, createPropagationScenario(p72, v_1, propagationItemCount), propagationItemCount, p75))
		end
		local var136, var137, var138 = var61(p72, p73, p74, p75)
		table.insert(t, var136)
		table.insert(t, var137)
		table.insert(t, var138)
		table.insert(t, measureRecyclingScopeHighWater(p72, p73, p74, lifecycleItemCount, p75))
		table.insert(t, measureCompositionChurn(p72, p73, p74, lifecycleItemCount, p75))
		table.insert(t, measureDeclarativeReconciliation(p72, p73, p74, var133, p75))
		table.insert(t, measurePropSynchronization(p72, p73, p74, var133, p75))
		local var139, var140 = measureAssignmentBinding(p72, p73, p74, p75)
		table.insert(t, var139)
		table.insert(t, var140)
		table.insert(t, measurePresentationCommit(p72, p73, p74, p75))
		table.insert(t, measureVirtualListTeardown(p72, p73, p74, p75))
		
		return t
	end,
	runDeclarativeDataReconciliation = runDeclarativeDataReconciliation
}