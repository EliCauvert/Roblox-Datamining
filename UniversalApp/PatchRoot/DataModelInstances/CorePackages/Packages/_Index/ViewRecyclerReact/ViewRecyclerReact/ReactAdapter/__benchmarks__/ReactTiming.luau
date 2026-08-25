local responsibilityCatalogModule = require(game:GetService("ReplicatedStorage").Packages._Workspace.ViewRecycler.ViewRecycler.Core.Diagnostics.__benchmarks__.ResponsibilityCatalog)
local list = { 10, 40 }

local function createItems(p0)
	local list = table.create(p0)
	
	for i = 1, p0 do
		list[i] = {
			id = `item{i}`,
			text = `Item {i}`,
			height = i % 5 * 2 + 36
		}
	end
	return list
end

local function hasItemText(p1, p2)
	for i, v in p1:GetDescendants() do
		if v:IsA("TextLabel") and v.Name == "Content" and v.Text == p2 then
			return true
		end
	end
	return false
end

local function mountedItemCount(p3)
	local var32 = 0
	
	for i, v in p3:GetDescendants() do
		if v:IsA("TextLabel") and v.Name == "Content" and v.Text ~= "" then
			var32 += 1
		end
	end
	return var32
end

local function findMeasuredObjects(p4, p5)
	for i, v in p4:GetDescendants() do
		if v:IsA("TextLabel") and v.Name == "Content" and v.Text == p5 then
			local parent = v.Parent
			while parent ~= nil and parent ~= p4 do
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

local function recordSizeComparison(p6, p7, p8, p9)
	local var33 = p6[p7]
	
	if var33 == nil then
		var33 = {
			observed = 0,
			matchedSettled = 0,
			differedFromSettled = 0
		}
		p6[p7] = var33
	end
	if p8 == nil then return end
	var33.observed += 1
	
	if p8 == p9 then
		var33.matchedSettled += 1
		
		return
	end
	var33.differedFromSettled += 1
end

local function _(p10)
	local scrollingFrame = p10:FindFirstChildWhichIsA("ScrollingFrame", true)
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

local _ = function(p11, p12, p13)
	local var37 = p11[p12]
	
	if var37 == nil then
		var37 = {}
		p11[p12] = var37
	end
	var37[p13] = (var37[p13] or 0) + 1
end

local function captureCompletionPhase(p14, p15, p16, p17)
	local var38 = true
	
	for i, v in p14 do
		if p15[i] == nil and v() then
			p15[i] = p17
			local var39 = p16[i]
			
			if var39 == nil then
				var39 = {}
				p16[i] = var39
			end
			var39[p17] = (var39[p17] or 0) + 1
		end
		if p15[i] == nil then
			var38 = false
		end
	end
	return var38
end

local function observeCompletionPhases(p18, p19, p20, p21, p22)
	-- upvalues: captureCompletionPhase (ref), flushDeferredWork (ref), waitForHeartbeatToSettle (ref)
	p22 = p22 or {}
	
	local function _(p23)
		-- upvalues: captureCompletionPhase (copy), p19 (ref), p22 (ref), p21 (ref)
		return captureCompletionPhase(p19, p22, p21, p23)
	end
	
	if captureCompletionPhase(p19, p22, p21, "afterAct") then
		return p22
	end
	p18.ReactRoblox.act(flushDeferredWork)
	
	if captureCompletionPhase(p19, p22, p21, "deferred") then
		return p22
	end
	waitForHeartbeatToSettle(p18)
	
	if captureCompletionPhase(p19, p22, p21, "heartbeatSettled") then
		return p22
	end
	for _ = 1, 20 do
		waitForHeartbeatToSettle(p18)
		
		if not captureCompletionPhase(p19, p22, p21, "laterHeartbeat") then
			continue
		end
		return p22
	end
	error(`React benchmark did not complete: {if type(p20) == "function" then p20() else p20}`)
end

local function createOffsets(value, p24)
	local maxValue = math.max(0, value * 40 - 400)
	local list = table.create(p24)
	
	for i = 1, p24 do
		list[i] = math.min(maxValue, (math.max(1, math.floor(value * i / (p24 + 1))) - 1) * 40)
	end
	return list
end

local function createItemTypes(p25)
	local react = p25.React
	local signalsReact = p25.SignalsReact
	local viewRecycler = p25.ViewRecycler
	
	return viewRecycler.createRecyclableView(function(p26)
		-- upvalues: signalsReact (ref), react (ref)
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = signalsReact.useSignalState(p26.valueSignal).text
		})
	end, { readiness = "ReadyOnAssignment" }), viewRecycler.createRecyclableView(function(p27)
		-- upvalues: signalsReact (ref), react (ref)
		local var43 = signalsReact.useSignalState(p27.valueSignal)
		
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.None,
			Size = UDim2.new(1, 0, 0, var43.height),
			Text = var43.text
		})
	end, { readiness = "ReadyOnAssignment" })
end

local _ = function(p28, p29, p30, p31, p32, p33, p34, p35)
	p28.ReactRoblox.act(function()
		-- upvalues: p30 (ref), p31 (ref), p28 (ref), p32 (ref), p34 (ref), p35 (ref), p29 (ref), p33 (ref)
		local t = {
			overscan = 0,
			data = p30,
			layout = p31,
			axis = p28.ViewRecycler.Axis.Y,
			itemType = p32,
			diagnostics = p34
		}
		
		if p35 ~= nil then
			for i, v in p35 do
				t[i] = v
			end
		end
		p29:render(p28.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, p33 * 40)
		}, {
			List = p28.React.createElement(p28.ViewRecycler.VirtualList, t)
		}))
	end)
end

local _ = function(p36, p37, p38, p39)
	p36.ReactRoblox.act(function()
		-- upvalues: p37 (ref)
		p37:unmount()
	end)
	p38.destroy()
	p39:Destroy()
end

local _ = function(p40, p41)
	return math.abs(p40 - p41) <= 0.01
end

local _ = function(value, p42)
	-- upvalues: findMeasuredObjects (ref)
	local _, var45 = findMeasuredObjects(value, p42)
	
	return if var45 == nil then nil else var45.Position.Y.Offset
end

local function createPropagationScenario(p43, p44, p45)
	local var46 = p45 * 40
	local var47 = var46 + 80
	local var48 = math.floor(p45 / 2) + 1
	local var49 = var48 - 5
	local var50 = (var49 - 1) * 40
	
	if p44 == "at-start" then
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
			name = p44,
			finalContentLength = var47
		}
	elseif p44 == "in-middle" then
		return {
			overscan = 0,
			name = p44,
			insertIndex = var48,
			initialOffset = var50,
			initialDestinationText = `Item {var49 + 9}`,
			insertedStartOffset = (var48 - 1) * 40,
			neighborKey = `item{var48}`,
			neighborStartOffset = (var48 - 1) * 40 + 80,
			finalContentLength = var47,
			finalScrollOffset = var50
		}
	elseif p44 == "before-visible-anchor" then
		local var51 = (var48 - 1) * 40
		local var52 = var48 - 1
		
		return {
			overscan = 2,
			name = p44,
			insertIndex = var52,
			initialOffset = var51,
			initialDestinationText = `Item {var48 + 9}`,
			insertedStartOffset = (var52 - 1) * 40,
			neighborKey = `item{var48}`,
			neighborStartOffset = var51 + 80,
			finalContentLength = var47,
			finalScrollOffset = var51 + 80
		}
	end
	return {
		overscan = 0,
		name = p44,
		insertIndex = p45 + 1,
		initialOffset = var46 - 400,
		initialDestinationText = `Item {p45}`,
		insertedStartOffset = var46,
		neighborKey = `item{p45}`,
		neighborStartOffset = var46 - 40,
		finalContentLength = var47,
		finalScrollOffset = var47 - 400,
		initialScrollAlignment = p43.ViewRecycler.ScrollAlignment.End,
		autoScrollOnChange = p43.ViewRecycler.AutoScrollPolicy.WhenAtEnd
	}
end

local function measureCompletedMount(p46, p47, p48, p49, p50, p51, p52)
	-- upvalues: observeCompletionPhases (ref), hasItemText (ref), mountedItemCount (ref), responsibilityCatalogModule (ref)
	local clock = p52.clock or os.clock
	local var54 = 0
	local t = {}
	
	return p48.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		workload = "completed-mount",
		description = "Mounts a uniform VirtualList and waits for the final expected visible row to commit.",
		responsibility = responsibilityCatalogModule.React.MountScroll,
		scale = { layout = "uniform", items = #p49, visibleRows = p51 },
		timing = {
			unit = "ms",
			basis = "completedMount",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = {
			viewRecycler = p47.run(function()
				-- upvalues: p46 (ref), p49 (ref), clock (ref), p50 (ref), p51 (ref), observeCompletionPhases (copy), hasItemText (copy), t (ref), var54 (write), mountedItemCount (copy)
				local folder = Instance.new("Folder")
				local var57 = p46.ReactRoblox.createRoot(folder)
				local var58 = p46.ViewRecycler.Layout.uniform({ itemLength = 40 })
				local var59 = p46.ViewRecycler.DataSource.snapshot(p49, function(p53)
					return p53.id
				end)
				local var60 = clock()
				local act = p46.ReactRoblox.act
				local var61 = nil
				local var62 = nil
				act(function()
					-- upvalues: var59 (ref), var58 (ref), p46 (ref), p50 (ref), var61 (ref), var62 (ref), var57 (ref), p51 (ref)
					local t = {
						overscan = 0,
						data = var59,
						layout = var58,
						axis = p46.ViewRecycler.Axis.Y,
						itemType = p50,
						diagnostics = var61
					}
					
					if var62 ~= nil then
						for i, v in var62 do
							t[i] = v
						end
					end
					var57:render(p46.React.createElement("Frame", {
						Name = "BenchmarkHost",
						Size = UDim2.fromOffset(400, p51 * 40)
					}, {
						List = p46.React.createElement(p46.ViewRecycler.VirtualList, t)
					}))
				end)
				observeCompletionPhases(p46, {
					destinationRowCommitted = function()
						-- upvalues: hasItemText (copy), folder (ref), p51 (copy)
						return hasItemText(folder, `Item {p51}`)
					end
				}, `mount Item {p51}`, t)
				local var63 = (clock() - var60) * 1000
				var54 = mountedItemCount(folder)
				p46.ReactRoblox.act(function()
					-- upvalues: var57 (ref)
					var57:unmount()
				end)
				var58.destroy()
				folder:Destroy()
				
				return var63
			end, p52)
		},
		evidence = {
			completionBarrier = "destinationRowCommitted",
			reactWorkFlush = "ReactRoblox.actWithMockScheduler",
			mountedItemViews = var54,
			completionPhaseCounts = t
		}
	})
end

local function measureCompletedTraversal(p54, p55, p56, p57, p58, p59, p60, p61, p62)
	-- upvalues: hasItemText (ref), observeCompletionPhases (ref), createOffsets (ref), captureCompletionPhase (ref), mountedItemCount (ref), responsibilityCatalogModule (ref)
	local clock = p62.clock or os.clock
	local folder = Instance.new("Folder")
	local var66 = p54.ReactRoblox.createRoot(folder)
	local var67 = if p61 then p54.ViewRecycler.Layout.measured({ estimatedItemLength = 40 }) else p54.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var68 = p54.ViewRecycler.DataSource.sequence(p57, function(p63)
		return p63.id
	end)
	local var69 = 0
	
	local var70 = function(p64)
		-- upvalues: var69 (write)
		if p64.kind == "measurementsProcessed" then
			var69 += p64.accepted
		end
	end
	
	local act = p54.ReactRoblox.act
	local var71 = nil
	local var72 = 10
	act(function()
		-- upvalues: var68 (ref), var67 (ref), p54 (ref), p58 (ref), var70 (ref), var71 (ref), var66 (ref), var72 (ref)
		local t = {
			overscan = 0,
			data = var68,
			layout = var67,
			axis = p54.ViewRecycler.Axis.Y,
			itemType = p58,
			diagnostics = var70
		}
		
		if var71 ~= nil then
			for i, v in var71 do
				t[i] = v
			end
		end
		var66:render(p54.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var72 * 40)
		}, {
			List = p54.React.createElement(p54.ViewRecycler.VirtualList, t)
		}))
	end)
	local t = {
		destinationRowCommitted = function()
			-- upvalues: hasItemText (copy), folder (ref)
			return hasItemText(folder, "Item 10")
		end
	}
	
	if p61 then
		function t.measurementAccepted()
			-- upvalues: var69 (write)
			return var69 > 0
		end
	end
	observeCompletionPhases(p54, t, "initial visible rows", {})
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local var75 = createOffsets(p59, p60)
	local var76 = 0
	local var77 = 0
	local t_1 = {}
	local var79 = p55.run(function()
		-- upvalues: var76 (write), p61 (ref), var75 (ref), var68 (ref), var69 (write), clock (ref), hasItemText (copy), folder (ref), p54 (ref), scrollingFrame (ref), captureCompletionPhase (copy), t_1 (ref), observeCompletionPhases (copy), var77 (write)
		var76 = (var76 + 1) % 2
		
		if p61 then
			for i, v in var75 do
				local var81 = math.floor(v / 40) + 1
				local cloned = table.clone(var68.getItem(var81))
				cloned.height = if var76 == 0 then 36 else 44
				var68.setItem(var81, cloned)
			end
		end
		local var83 = clock()
		
		for i, v in var75 do
			local var85 = math.floor(v / 40) + 1
			local var86 = var69
			local t = {
				destinationRowCommitted = function()
					-- upvalues: hasItemText (copy), folder (copy), var85 (ref)
					return hasItemText(folder, `Item {var85}`)
				end
			}
			
			if p61 then
				function t.measurementAccepted()
					-- upvalues: var69 (copy), var86 (ref)
					return var86 < var69
				end
			end
			local t_2 = {}
			p54.ReactRoblox.act(function()
				-- upvalues: scrollingFrame (copy), v (ref), captureCompletionPhase (copy), t (ref), t_2 (ref), t_1 (copy)
				scrollingFrame.CanvasPosition = Vector2.new(0, v)
				captureCompletionPhase(t, t_2, t_1, "afterMutation")
			end)
			observeCompletionPhases(p54, t, `scroll Item {var85}`, t_1, t_2)
		end
		local var84 = (clock() - var83) * 1000
		var77 = var69 - var69
		p54.ReactRoblox.act(function()
			-- upvalues: scrollingFrame (copy)
			scrollingFrame.CanvasPosition = Vector2.zero
		end)
		observeCompletionPhases(p54, {
			destinationRowCommitted = function()
				-- upvalues: hasItemText (copy), folder (copy)
				return hasItemText(folder, "Item 1")
			end
		}, "reset scroll position", {})
		
		return var84
	end, p62)
	local var80 = mountedItemCount(folder)
	p54.ReactRoblox.act(function()
		-- upvalues: var66 (ref)
		var66:unmount()
	end)
	var67.destroy()
	folder:Destroy()
	
	return p56.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "hostBoundary",
		responsibility = responsibilityCatalogModule.React.MountScroll,
		workload = if p61 then "completed-measured-traversal" else "completed-uniform-traversal",
		description = if p61 then "Scrolls a measured VirtualList and waits for both destination-row commits and accepted size updates." else "Scrolls a uniform VirtualList and waits for each destination row to commit.",
		scale = {
			visibleRows = 10,
			items = p59,
			scrollSteps = p60,
			layout = if p61 then "measured" else "uniform"
		},
		timing = {
			unit = "ms",
			basis = "completedScrollTraversal",
			includesSchedulerWaits = true,
			operationsPerSample = p60
		},
		arms = { viewRecycler = var79 },
		evidence = {
			reactWorkFlush = "ReactRoblox.actWithMockScheduler",
			mountedItemViews = var80,
			acceptedMeasurementsPerTraversal = var77,
			completionBarrier = if p61 then "destinationRowCommittedAndMeasurementAccepted" else "destinationRowCommitted",
			completionPhaseCounts = t_1
		}
	})
end

local function measureHostSizeSettlePhases(value, p65, p66, p67)
	-- upvalues: observeCompletionPhases (ref), hasItemText (ref), waitForHeartbeatToSettle (ref), findMeasuredObjects (ref), flushDeferredWork (ref), recordSizeComparison (ref), responsibilityCatalogModule (ref)
	local clock = p67.clock or os.clock
	local screenGui = Instance.new("ScreenGui")
	screenGui.ResetOnSpawn = false
	screenGui.Parent = game:GetService("CoreGui")
	local var91 = value.ReactRoblox.createRoot(screenGui)
	local var92 = value.ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local repeated = string.rep("This response grows enough to wrap across the measured row. ", 8)
	local var94 = value.ViewRecycler.createRecyclableView(function(p68)
		-- upvalues: value (ref)
		return value.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.fromOffset(10, 0),
			Size = UDim2.new(1, -20, 0, 0),
			Text = value.SignalsReact.useSignalState(p68.valueSignal).text
		})
	end, { readiness = "ReadyOnCommit", hideWhilePending = true })
	local t = {
		id = "measurement-probe",
		text = "Short response",
		height = 40
	}
	local var96 = value.ViewRecycler.DataSource.sequence({ t }, function(p69)
		return p69.id
	end)
	local var97 = 0
	
	local var98 = function(p70)
		-- upvalues: var97 (write)
		if p70.kind == "measurementsProcessed" then
			var97 += p70.accepted
		end
	end
	
	local act = value.ReactRoblox.act
	local var99 = nil
	local var100 = 3
	act(function()
		-- upvalues: var96 (ref), var92 (ref), value (ref), var94 (ref), var98 (ref), var99 (ref), var91 (ref), var100 (ref)
		local t = {
			overscan = 0,
			data = var96,
			layout = var92,
			axis = value.ViewRecycler.Axis.Y,
			itemType = var94,
			diagnostics = var98
		}
		
		if var99 ~= nil then
			for i, v in var99 do
				t[i] = v
			end
		end
		var91:render(value.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var100 * 40)
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
			-- upvalues: var97 (write)
			return var97 > 0
		end
	}, "initial wrapped measured row", {})
	waitForHeartbeatToSettle(value)
	waitForHeartbeatToSettle(value)
	local var101 = 0
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local t_6 = { host = {}, content = {} }
	local var108 = 0
	local var109 = p65.run(function()
		-- upvalues: var108 (write), var101 (write), repeated (ref), var97 (write), findMeasuredObjects (copy), screenGui (ref), t_1 (ref), clock (ref), value (ref), var96 (ref), t (ref), flushDeferredWork (copy), waitForHeartbeatToSettle (copy), t_4 (ref), t_5 (ref), recordSizeComparison (copy), t_2 (ref), t_6 (ref), t_3 (ref)
		var108 += 1
		var101 = (var101 + 1) % 2
		local var110 = if var101 == 0 then "Short response" else repeated
		local var111 = if var101 == 0 then "short" else "long"
		local t_7 = {}
		local t_8 = {}
		local var114 = nil
		
		local function _(p71)
			-- upvalues: findMeasuredObjects (copy), screenGui (copy), var110 (ref), t_8 (ref), t_7 (ref), var114 (write), var97 (copy), var97 (ref), t_1 (copy)
			local var128, var129 = findMeasuredObjects(screenGui, var110)
			
			if var128 ~= nil then
				t_8[p71] = var128.AbsoluteSize.Y
			end
			if var129 ~= nil then
				t_7[p71] = var129.AbsoluteSize.Y
			end
			if var114 == nil and var97 < var97 then
				var114 = p71
				local var130 = t_1
				local measurementAccepted = var130.measurementAccepted
				
				if measurementAccepted == nil then
					measurementAccepted = {}
					var130.measurementAccepted = measurementAccepted
				end
				measurementAccepted[p71] = (measurementAccepted[p71] or 0) + 1
			end
		end
		
		local var115 = clock()
		value.ReactRoblox.act(function()
			-- upvalues: var96 (copy), t (copy), var110 (ref), findMeasuredObjects (copy), screenGui (copy), t_8 (ref), t_7 (ref), var114 (write), var97 (copy), var97 (ref), t_1 (copy)
			var96.setItem(1, { id = t.id, text = var110, height = t.height })
			local var131, var132 = findMeasuredObjects(screenGui, var110)
			
			if var131 ~= nil then
				t_8.afterMutation = var131.AbsoluteSize.Y
			end
			if var132 ~= nil then
				t_7.afterMutation = var132.AbsoluteSize.Y
			end
			if var114 == nil and var97 < var97 then
				var114 = "afterMutation"
				local var133 = t_1
				local measurementAccepted = var133.measurementAccepted
				
				if measurementAccepted == nil then
					measurementAccepted = {}
					var133.measurementAccepted = measurementAccepted
				end
				measurementAccepted.afterMutation = (measurementAccepted.afterMutation or 0) + 1
			end
		end)
		local var116, var117 = findMeasuredObjects(screenGui, var110)
		
		if var116 ~= nil then
			t_8.afterAct = var116.AbsoluteSize.Y
		end
		if var117 ~= nil then
			t_7.afterAct = var117.AbsoluteSize.Y
		end
		if var114 == nil and var97 < var97 then
			var114 = "afterAct"
			local var118 = t_1
			local measurementAccepted = var118.measurementAccepted
			
			if measurementAccepted == nil then
				measurementAccepted = {}
				var118.measurementAccepted = measurementAccepted
			end
			measurementAccepted.afterAct = (measurementAccepted.afterAct or 0) + 1
		end
		value.ReactRoblox.act(flushDeferredWork)
		local var119, var120 = findMeasuredObjects(screenGui, var110)
		
		if var119 ~= nil then
			t_8.deferred = var119.AbsoluteSize.Y
		end
		if var120 ~= nil then
			t_7.deferred = var120.AbsoluteSize.Y
		end
		if var114 == nil and var97 < var97 then
			var114 = "deferred"
			local var121 = t_1
			local measurementAccepted = var121.measurementAccepted
			
			if measurementAccepted == nil then
				measurementAccepted = {}
				var121.measurementAccepted = measurementAccepted
			end
			measurementAccepted.deferred = (measurementAccepted.deferred or 0) + 1
		end
		for i = 1, 3 do
			waitForHeartbeatToSettle(value)
			local var122 = `heartbeat{i}Settled`
			local var123, var124 = findMeasuredObjects(screenGui, var110)
			
			if var123 ~= nil then
				t_8[var122] = var123.AbsoluteSize.Y
			end
			if var124 ~= nil then
				t_7[var122] = var124.AbsoluteSize.Y
			end
			if var114 == nil and var97 < var97 then
				var114 = var122
				local var125 = t_1
				local measurementAccepted = var125.measurementAccepted
				
				if measurementAccepted == nil then
					measurementAccepted = {}
					var125.measurementAccepted = measurementAccepted
				end
				measurementAccepted[var122] = (measurementAccepted[var122] or 0) + 1
			end
		end
		local var126 = (clock() - var115) * 1000
		
		if var114 == nil then
			local var127 = t_1
			local measurementAccepted = var127.measurementAccepted
			
			if measurementAccepted == nil then
				measurementAccepted = {}
				var127.measurementAccepted = measurementAccepted
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
					update = var108,
					text = var111,
					observed = v,
					settled = heartbeat3Settled
				}
			end
		end
		for i_2, v_1 in t_8 do
			recordSizeComparison(t_3, i_2, v_1, heartbeat3Settled_1)
			
			if v_1 ~= heartbeat3Settled_1 and t_6.content[i_2] == nil then
				t_6.content[i_2] = {
					update = var108,
					text = var111,
					observed = v_1,
					settled = heartbeat3Settled_1
				}
			end
		end
		return var126
	end, p67)
	value.ReactRoblox.act(function()
		-- upvalues: var91 (ref)
		var91:unmount()
	end)
	var92.destroy()
	screenGui:Destroy()
	
	return p66.create({
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
		arms = { viewRecycler = var109 },
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

local function runAssignmentPropagationSample(value, p72, p73, p74, p75)
	-- upvalues: observeCompletionPhases (ref), hasItemText (ref), waitForHeartbeatToSettle (ref), findMeasuredObjects (ref)
	local clock = p75.clock or os.clock
	local list = table.create(p74)
	
	for i = 1, p74 do
		list[i] = { height = 40, id = `item{i}`, text = `Item {i}` }
	end
	local t = {
		height = 80,
		id = `inserted-{p73.name}`,
		text = `Inserted {p73.name}`
	}
	local folder = Instance.new("Folder")
	local var138 = value.ReactRoblox.createRoot(folder)
	local var139 = value.ViewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local var140 = value.ViewRecycler.DataSource.sequence(list, function(p76)
		return p76.id
	end)
	local var141 = nil
	local var142 = nil
	local var143 = nil
	local var144 = nil
	local var145 = nil
	local var146 = false
	local var147 = nil
	local t_1 = { data = 0, measurement = 0, programmaticScroll = 0 }
	local t_2 = {}
	
	local var150 = function(p77)
		-- upvalues: var146 (write), var141 (write), var142 (write), clock (ref), var143 (write), t_1 (ref)
		if not var146 then return end
		if p77.kind == "measurementsProcessingStarted" and var141 ~= nil then
			var142 = var142 or clock()
			
			return
		elseif p77.kind == "measurementsProcessed" and p77.accepted > 0 and var141 ~= nil then
			var143 = var143 or clock()
			
			return
		elseif p77.kind == "scrollCorrection" then
			t_1[p77.source] += p77.delta
		end
	end
	
	local t_3 = {
		overscan = p73.overscan,
		preserveScrollPositionOnChange = p73.preserveScrollPositionOnChange,
		initialScrollAlignment = p73.initialScrollAlignment,
		autoScrollOnChange = p73.autoScrollOnChange,
		_instrumentation = {
			assignmentChanged = function(_, p78)
				-- upvalues: var146 (write), t (ref), var141 (write), clock (ref)
				if var146 and p78 ~= nil and (p78.key == t.id and var141 == nil) then
					var141 = clock()
				end
			end
		},
		onContentLengthChanged = function(p79)
			-- upvalues: var146 (write), p73 (ref), var147 (write)
			if var146 and math.abs(p79 - p73.finalContentLength) <= 0.01 then
				var147 = p79
			end
		end
	}
	local var152 = 10
	value.ReactRoblox.act(function()
		-- upvalues: var140 (ref), var139 (ref), value (ref), p72 (ref), var150 (ref), t_3 (ref), var138 (ref), var152 (ref)
		local t = {
			overscan = 0,
			data = var140,
			layout = var139,
			axis = value.ViewRecycler.Axis.Y,
			itemType = p72,
			diagnostics = var150
		}
		
		if t_3 ~= nil then
			for i, v in t_3 do
				t[i] = v
			end
		end
		var138:render(value.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var152 * 40)
		}, {
			List = value.React.createElement(value.ViewRecycler.VirtualList, t)
		}))
	end)
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	value.ReactRoblox.act(function()
		-- upvalues: scrollingFrame (ref), p73 (ref)
		scrollingFrame.CanvasPosition = Vector2.new(0, p73.initialOffset)
	end)
	observeCompletionPhases(value, {
		destinationRowCommitted = function()
			-- upvalues: hasItemText (copy), folder (ref), p73 (ref)
			return hasItemText(folder, p73.initialDestinationText)
		end,
		initialCanvasSettled = function()
			-- upvalues: scrollingFrame (ref), p74 (ref)
			return math.abs(scrollingFrame.CanvasSize.Y.Offset - p74 * 40) <= 0.01
		end
	}, `prepare {p73.name} insertion`, {})
	waitForHeartbeatToSettle(value)
	assert(math.abs(scrollingFrame.CanvasSize.Y.Offset - p74 * 40) <= 0.01, `{p73.name}: initial canvas size did not settle (expected {p74 * 40}, got {scrollingFrame.CanvasSize.Y.Offset})`)
	assert(math.abs(scrollingFrame.CanvasPosition.Y - p73.initialOffset) <= 0.01, `{p73.name}: initial scroll position did not settle`)
	var146 = true
	value.ReactRoblox.act(function()
		-- upvalues: var140 (ref), p73 (ref), t (ref)
		var140.insert(p73.insertIndex, t)
	end)
	local var154 = if p73.name == "before-visible-anchor" then 40 else 0
	local var155 = if p73.name == "before-visible-anchor" then 40 else 0
	local t_4 = {}
	
	local function captureLibraryPublication()
		-- upvalues: folder (ref), t (ref), findMeasuredObjects (copy), p73 (ref), var141 (write), var142 (write), var143 (write), var147 (write), t_1 (ref), var154 (ref), var155 (ref), var144 (write), clock (ref)
		local _, var167 = findMeasuredObjects(folder, t.text)
		local var168 = if var167 == nil then nil else var167.Position.Y.Offset
		local _, var169 = findMeasuredObjects(folder, `Item {string.sub(p73.neighborKey, 5)}`)
		local var170 = if var169 == nil then nil else var169.Position.Y.Offset
		local var171 = var141 ~= nil and (var142 ~= nil and (var143 ~= nil and (var147 ~= nil and (var168 ~= nil and (math.abs(var168 - p73.insertedStartOffset) <= 0.01 and (var170 ~= nil and (math.abs(var170 - p73.neighborStartOffset) <= 0.01 and (math.abs(t_1.data - var154) <= 0.01 and math.abs(t_1.measurement - var155) <= 0.01))))))))
		
		if var171 and var144 == nil then
			var144 = clock()
		end
		return var171
	end
	
	observeCompletionPhases(value, {
		libraryOutputsPublished = captureLibraryPublication,
		hostValuesObserved = function()
			-- upvalues: captureLibraryPublication (ref), folder (ref), t (ref), findMeasuredObjects (copy), p73 (ref), t_4 (write), var141 (write), var142 (write), var143 (write), var144 (write), var147 (write), scrollingFrame (ref), var145 (write), clock (ref)
			captureLibraryPublication()
			local _, var172 = findMeasuredObjects(folder, t.text)
			local var173 = if var172 == nil then nil else var172.Position.Y.Offset
			local _, var174 = findMeasuredObjects(folder, `Item {string.sub(p73.neighborKey, 5)}`)
			t_4 = {
				assigned = var141 ~= nil,
				measurementStarted = var142 ~= nil,
				measurementProcessed = var143 ~= nil,
				libraryPublished = var144 ~= nil,
				observedContentLength = var147,
				canvasLength = scrollingFrame.CanvasSize.Y.Offset,
				scrollOffset = scrollingFrame.CanvasPosition.Y,
				insertedOffset = var173,
				neighborOffset = if var174 == nil then nil else var174.Position.Y.Offset
			}
			local var175 = var141 ~= nil and (var144 ~= nil and (math.abs(scrollingFrame.CanvasSize.Y.Offset - p73.finalContentLength) <= 0.01 and math.abs(scrollingFrame.CanvasPosition.Y - p73.finalScrollOffset) <= 0.01))
			
			if var175 and var145 == nil then
				var145 = clock()
			end
			return var175
		end
	}, function()
		-- upvalues: p73 (ref), t_4 (write)
		return `{p73.name} assignment, measurement, and propagation; assigned={t_4.assigned}, measurementStarted={t_4.measurementStarted}, measurementProcessed={t_4.measurementProcessed}, libraryPublished={t_4.libraryPublished}, content={t_4.observedContentLength}, canvas={t_4.canvasLength}, scroll={t_4.scrollOffset}, inserted={t_4.insertedOffset}, neighbor={t_4.neighborOffset}`
	end, t_2)
	local var158 = assert(var141, `{p73.name}: inserted item was not assigned`)
	local var159 = assert(var142, `{p73.name}: inserted item measurement did not reach Core`)
	local var160 = assert(var143, `{p73.name}: inserted item measurement was not accepted`)
	local var161 = assert(var144, `{p73.name}: library outputs were not fully published`)
	local var162 = assert(var145, `{p73.name}: host values did not fully propagate`)
	assert(var158 <= var159, `{p73.name}: measurement preceded assignment`)
	assert(var159 <= var160, `{p73.name}: measurement completed before it started`)
	assert(var160 <= var161, `{p73.name}: library outputs preceded measurement`)
	assert(var161 <= var162, `{p73.name}: host values preceded library outputs`)
	assert(math.abs(t_1.data - var154) <= 0.01, `{p73.name}: unexpected insertion anchor correction`)
	assert(math.abs(t_1.measurement - var155) <= 0.01, `{p73.name}: unexpected measurement anchor correction`)
	local t_5 = { insertIndex = p73.insertIndex }
	local var164, var165 = findMeasuredObjects(folder, t.text)
	t_5.insertedStartOffset = if var165 == nil then nil else var165.Position.Y.Offset
	t_5.neighborKey = p73.neighborKey
	var164, var166 = findMeasuredObjects(folder, `Item {string.sub(p73.neighborKey, 5)}`)
	t_5.neighborStartOffset = if var166 == nil then nil else var166.Position.Y.Offset
	t_5.contentLength = scrollingFrame.CanvasSize.Y.Offset
	t_5.scrollOffset = scrollingFrame.CanvasPosition.Y
	t_5.dataAnchorCorrection = t_1.data
	t_5.measurementAnchorCorrection = t_1.measurement
	t_5.completionPhaseCounts = t_2
	t_5.assignmentToMeasurementStartMs = (var159 - var158) * 1000
	t_5.measurementProcessingMs = (var160 - var159) * 1000
	t_5.measurementProcessedToLibraryPublicationMs = (var161 - var160) * 1000
	t_5.libraryPublicationToHostObservationMs = (var162 - var161) * 1000
	t_5.assignmentToHostObservationMs = (var162 - var158) * 1000
	value.ReactRoblox.act(function()
		-- upvalues: var138 (ref)
		var138:unmount()
	end)
	var139.destroy()
	folder:Destroy()
	
	return t_5
end

local function measureAssignmentPropagation(value, p80, p81, p82, p83, p84, p85)
	-- upvalues: runAssignmentPropagationSample (ref), responsibilityCatalogModule (ref)
	local t = {}
	
	return p81.create({
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
			items = p84,
			scenario = p83.name
		},
		timing = {
			unit = "ms",
			basis = "assignmentToMilestone",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = {
			assignmentToMeasurementStart = p80.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p82 (ref), p83 (ref), p84 (ref), p85 (ref), t (write)
				local var177 = runAssignmentPropagationSample(value, p82, p83, p84, p85)
				t = var177
				
				return var177.assignmentToMeasurementStartMs
			end, p85),
			measurementProcessing = p80.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p82 (ref), p83 (ref), p84 (ref), p85 (ref), t (write)
				local var178 = runAssignmentPropagationSample(value, p82, p83, p84, p85)
				t = var178
				
				return var178.measurementProcessingMs
			end, p85),
			measurementProcessedToLibraryPublication = p80.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p82 (ref), p83 (ref), p84 (ref), p85 (ref), t (write)
				local var179 = runAssignmentPropagationSample(value, p82, p83, p84, p85)
				t = var179
				
				return var179.measurementProcessedToLibraryPublicationMs
			end, p85),
			libraryPublicationToHostObservation = p80.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p82 (ref), p83 (ref), p84 (ref), p85 (ref), t (write)
				local var180 = runAssignmentPropagationSample(value, p82, p83, p84, p85)
				t = var180
				
				return var180.libraryPublicationToHostObservationMs
			end, p85),
			assignmentToHostObservation = p80.run(function()
				-- upvalues: runAssignmentPropagationSample (copy), value (ref), p82 (ref), p83 (ref), p84 (ref), p85 (ref), t (write)
				local var181 = runAssignmentPropagationSample(value, p82, p83, p84, p85)
				t = var181
				
				return var181.assignmentToHostObservationMs
			end, p85)
		},
		evidence = t
	})
end

local var19 = nil

local function measureDeclarativeReconciliation(p86, p87, p88, p89, p90)
	-- upvalues: createItems (ref), observeCompletionPhases (ref), hasItemText (ref), responsibilityCatalogModule (ref)
	local clock = p90.clock or os.clock
	local folder = Instance.new("Folder")
	local var184 = p86.ReactRoblox.createRoot(folder)
	local var185 = p86.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var186 = createItems(20)
	local var187 = createItems(20)
	
	for i, v in var187 do
		v.text = `Reconciled {i}`
	end
	local function _(p91)
		return {
			items = p91,
			getItemKey = function(p92)
				return p92.id
			end
		}
	end
	
	local t = {
		items = var186,
		getItemKey = function(p93)
			return p93.id
		end
	}
	local act = p86.ReactRoblox.act
	local var189 = nil
	local var190 = nil
	local var191 = 10
	act(function()
		-- upvalues: t (ref), var185 (ref), p86 (ref), p89 (ref), var189 (ref), var190 (ref), var184 (ref), var191 (ref)
		local t = {
			overscan = 0,
			data = t,
			layout = var185,
			axis = p86.ViewRecycler.Axis.Y,
			itemType = p89,
			diagnostics = var189
		}
		
		if var190 ~= nil then
			for i, v in var190 do
				t[i] = v
			end
		end
		var184:render(p86.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var191 * 40)
		}, {
			List = p86.React.createElement(p86.ViewRecycler.VirtualList, t)
		}))
	end)
	local var192 = false
	local var193 = 0
	local t_1 = {}
	local var195 = ""
	local var196 = p87.run(function()
		-- upvalues: var192 (write), var187 (ref), var186 (ref), var195 (write), clock (ref), p86 (ref), var184 (ref), var185 (ref), p89 (ref), observeCompletionPhases (copy), hasItemText (copy), folder (ref), t_1 (ref), var193 (write)
		var192 = not var192
		local var198 = if var192 then var187 else var186
		var195 = if var192 then "Reconciled 10" else "Item 10"
		local var199 = clock()
		local t = {
			items = var198,
			getItemKey = function(p94)
				return p94.id
			end
		}
		local act = p86.ReactRoblox.act
		local var201 = nil
		local var202 = nil
		local var203 = 10
		act(function()
			-- upvalues: t (ref), var185 (ref), p86 (ref), p89 (ref), var201 (ref), var202 (ref), var184 (ref), var203 (ref)
			local t = {
				overscan = 0,
				data = t,
				layout = var185,
				axis = p86.ViewRecycler.Axis.Y,
				itemType = p89,
				diagnostics = var201
			}
			
			if var202 ~= nil then
				for i, v in var202 do
					t[i] = v
				end
			end
			var184:render(p86.React.createElement("Frame", {
				Name = "BenchmarkHost",
				Size = UDim2.fromOffset(400, var203 * 40)
			}, {
				List = p86.React.createElement(p86.ViewRecycler.VirtualList, t)
			}))
		end)
		observeCompletionPhases(p86, {
			reconciledContentCommitted = function()
				-- upvalues: hasItemText (copy), folder (copy), var195 (copy)
				return hasItemText(folder, var195)
			end
		}, "declarative data reconciliation", t_1)
		var193 += 1
		
		return (clock() - var199) * 1000
	end, p90)
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	scrollingFrame = scrollingFrame.CanvasSize.Y.Offset
	p86.ReactRoblox.act(function()
		-- upvalues: var184 (ref)
		var184:unmount()
	end)
	var185.destroy()
	folder:Destroy()
	
	return p88.create({
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
		arms = { viewRecycler = var196 },
		evidence = {
			completionBarrier = "reconciledContentCommitted",
			reconciliations = var193,
			finalCommittedText = var195,
			finalContentLength = scrollingFrame,
			completionPhaseCounts = t_1
		}
	})
end

local function runDeclarativeDataReconciliation(p95, p96, p97, p98, p99)
	-- upvalues: createItemTypes (ref), var19 (write), measureDeclarativeReconciliation (ref)
	p98 = p98 or {}
	local var205, var206 = createItemTypes(p95)
	assert(var205 ~= var206, "React benchmark Recyclable view types must have distinct identities")
	
	if p99 then
		var19(p95, p96, p97, { sampleCount = 1, warmupCount = 0, bootstrapResamples = 0 })
	end
	return measureDeclarativeReconciliation(p95, p96, p97, var205, p98)
end

local function measurePropSynchronization(p100, p101, p102, p103, p104)
	-- upvalues: createItems (ref), observeCompletionPhases (ref), hasItemText (ref), responsibilityCatalogModule (ref)
	local clock = p104.clock or os.clock
	local folder = Instance.new("Folder")
	local var209 = p100.ReactRoblox.createRoot(folder)
	local var210 = p100.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var211 = p100.ViewRecycler.Layout.uniform({ itemLength = 44 })
	local var212 = createItems(20)
	local var213 = createItems(21)
	var213[1].text = "Replacement first"
	local var214 = p100.ViewRecycler.DataSource.snapshot(var212, function(p105)
		return p105.id
	end)
	local var215 = p100.ViewRecycler.DataSource.snapshot(var213, function(p106)
		return p106.id
	end)
	local act = p100.ReactRoblox.act
	local var216 = nil
	local var217 = nil
	local var218 = 10
	act(function()
		-- upvalues: var214 (ref), var210 (ref), p100 (ref), p103 (ref), var216 (ref), var217 (ref), var209 (ref), var218 (ref)
		local t = {
			overscan = 0,
			data = var214,
			layout = var210,
			axis = p100.ViewRecycler.Axis.Y,
			itemType = p103,
			diagnostics = var216
		}
		
		if var217 ~= nil then
			for i, v in var217 do
				t[i] = v
			end
		end
		var209:render(p100.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var218 * 40)
		}, {
			List = p100.React.createElement(p100.ViewRecycler.VirtualList, t)
		}))
	end)
	local var219 = false
	local var220 = 0
	local t = {}
	local var222 = 0
	local var223 = ""
	local var224 = p101.run(function()
		-- upvalues: var219 (write), var215 (ref), var214 (ref), var211 (ref), var210 (ref), var222 (write), var213 (ref), var212 (ref), var223 (write), clock (ref), p100 (ref), var209 (ref), p103 (ref), observeCompletionPhases (copy), hasItemText (copy), folder (ref), t (ref), var220 (write)
		var219 = not var219
		local var225 = if var219 then var215 else var214
		local var226 = if var219 then var211 else var210
		var222 = if var219 then #var213 * 44 else #var212 * 40
		var223 = if var219 then "Replacement first" else "Item 1"
		local var227 = clock()
		local act = p100.ReactRoblox.act
		local var228 = nil
		local var229 = nil
		local var230 = 10
		act(function()
			-- upvalues: var225 (ref), var226 (ref), p100 (ref), p103 (ref), var228 (ref), var229 (ref), var209 (ref), var230 (ref)
			local t = {
				overscan = 0,
				data = var225,
				layout = var226,
				axis = p100.ViewRecycler.Axis.Y,
				itemType = p103,
				diagnostics = var228
			}
			
			if var229 ~= nil then
				for i, v in var229 do
					t[i] = v
				end
			end
			var209:render(p100.React.createElement("Frame", {
				Name = "BenchmarkHost",
				Size = UDim2.fromOffset(400, var230 * 40)
			}, {
				List = p100.React.createElement(p100.ViewRecycler.VirtualList, t)
			}))
		end)
		observeCompletionPhases(p100, {
			dataAndLayoutPropsCommitted = function()
				-- upvalues: hasItemText (copy), folder (copy), var223 (copy), var222 (copy)
				local var231 = hasItemText(folder, var223)
				
				if var231 then
					local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
					assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
					var231 = math.abs(scrollingFrame.CanvasSize.Y.Offset - var222) <= 0.01
				end
				return var231
			end
		}, "data and layout prop replacement", t)
		var220 += 1
		
		return (clock() - var227) * 1000
	end, p104)
	p100.ReactRoblox.act(function()
		-- upvalues: var209 (ref)
		var209:unmount()
	end)
	var210.destroy()
	folder:Destroy()
	var211.destroy()
	
	return p102.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "integrated",
		workload = "data-layout-prop-replacement",
		description = "Atomically replaces VirtualList data and layout props and waits for matching host geometry.",
		responsibility = responsibilityCatalogModule.React.PropSynchronization,
		scale = {
			replacementsPerSample = 1,
			firstItems = #var212,
			secondItems = #var213
		},
		timing = {
			unit = "ms",
			basis = "dataLayoutPropCommit",
			operationsPerSample = 1,
			includesSchedulerWaits = true
		},
		arms = { viewRecycler = var224 },
		evidence = {
			completionBarrier = "dataAndLayoutPropsCommitted",
			replacements = var220,
			finalCommittedText = var223,
			finalContentLength = var222,
			completionPhaseCounts = t
		}
	})
end

local function measureAssignmentBinding(value, p107, p108, p109)
	-- upvalues: createItems (ref), hasItemText (ref), captureCompletionPhase (ref), observeCompletionPhases (ref), responsibilityCatalogModule (ref)
	local clock = p109.clock or os.clock
	local var234 = 0
	local var235 = 0
	local var236 = value.ViewRecycler.createRecyclableView(function(p110)
		-- upvalues: var234 (write), value (ref)
		var234 += 1
		
		return value.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = value.ViewRecycler.useItemBinding(p110.valueSignal, function(p111)
				return p111.text
			end)
		})
	end, { readiness = "ReadyOnAssignment" })
	local folder = Instance.new("Folder")
	local var238 = value.ReactRoblox.createRoot(folder)
	local var239 = value.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var240 = value.ViewRecycler.DataSource.sequence(createItems(20), function(p112)
		return p112.id
	end)
	local t = {
		_instrumentation = {
			assignmentChanged = function(_, p113)
				-- upvalues: var235 (write)
				if p113 ~= nil then
					var235 += 1
				end
			end
		}
	}
	local act = value.ReactRoblox.act
	local var242 = nil
	local var243 = 10
	act(function()
		-- upvalues: var240 (ref), var239 (ref), value (ref), var236 (ref), var242 (ref), t (ref), var238 (ref), var243 (ref)
		local t = {
			overscan = 0,
			data = var240,
			layout = var239,
			axis = value.ViewRecycler.Axis.Y,
			itemType = var236,
			diagnostics = var242
		}
		
		if t ~= nil then
			for i, v in t do
				t[i] = v
			end
		end
		var238:render(value.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var243 * 40)
		}, {
			List = value.React.createElement(value.ViewRecycler.VirtualList, t)
		}))
	end)
	local var244 = var234
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local var246 = scrollingFrame
	local var247 = true
	local var248 = 0
	local t_1 = {}
	local var250 = p107.run(function()
		-- upvalues: var247 (write), var235 (write), hasItemText (copy), folder (ref), clock (ref), value (ref), var246 (ref), captureCompletionPhase (copy), t_1 (ref), observeCompletionPhases (copy), var248 (write)
		var247 = not var247
		local var252 = if var247 then 0 else 400
		local var253 = if var247 then "Item 1" else "Item 11"
		local t = {
			bindingDelivered = function()
				-- upvalues: hasItemText (copy), folder (copy), var253 (ref)
				return hasItemText(folder, var253)
			end
		}
		local t_2 = {}
		local var256 = clock()
		value.ReactRoblox.act(function()
			-- upvalues: var246 (copy), var252 (ref), captureCompletionPhase (copy), t (ref), t_2 (ref), t_1 (copy)
			var246.CanvasPosition = Vector2.new(0, var252)
			captureCompletionPhase(t, t_2, t_1, "afterMutation")
		end)
		observeCompletionPhases(value, t, `binding delivery to {var253}`, t_1, t_2)
		var248 = var235 - var235
		
		return (clock() - var256) * 1000
	end, p109)
	local var251 = var234
	value.ReactRoblox.act(function()
		-- upvalues: var238 (ref)
		var238:unmount()
	end)
	var239.destroy()
	folder:Destroy()
	
	return p108.create({
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
		arms = { immediate = var250 },
		evidence = {
			completionBarrier = "bindingDelivered",
			initialRenders = var244,
			finalRenders = var251,
			rerendersDuringDelivery = var251 - var244,
			deliveredAssignments = var248,
			completionPhaseCounts = t_1
		}
	}), p108.create({
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
		arms = { immediate = var250 },
		evidence = {
			completionBarrier = "bindingDelivered",
			publishedAssignments = var248,
			rerendersDuringPublication = var251 - var244,
			completionPhaseCounts = t_1
		}
	})
end

local function createPresentationArm(p114, p115, p116, p117)
	-- upvalues: createItems (ref), hasItemText (ref), captureCompletionPhase (ref), observeCompletionPhases (ref)
	local var257 = p114.ViewRecycler.createRecyclableView(if p115 == "ReadyOnAssignment" then function(p119)
		-- upvalues: p114 (ref)
		return p114.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p114.ViewRecycler.useItemBinding(p119.valueSignal, function(p120)
				return p120.text
			end)
		})
	end else function(p118)
		-- upvalues: p114 (ref)
		return p114.React.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = p114.SignalsReact.useSignalState(p118.valueSignal).text
		})
	end, { readiness = p115, hideWhilePending = p116 })
	local folder = Instance.new("Folder")
	local var259 = p114.ReactRoblox.createRoot(folder)
	local var260 = p114.ViewRecycler.Layout.uniform({ itemLength = 40 })
	local var261 = p114.ViewRecycler.DataSource.sequence(createItems(20), function(p121)
		return p121.id
	end)
	local act = p114.ReactRoblox.act
	local var262 = nil
	local var263 = nil
	local var264 = 10
	act(function()
		-- upvalues: var261 (ref), var260 (ref), p114 (ref), var257 (ref), var262 (ref), var263 (ref), var259 (ref), var264 (ref)
		local t = {
			overscan = 0,
			data = var261,
			layout = var260,
			axis = p114.ViewRecycler.Axis.Y,
			itemType = var257,
			diagnostics = var262
		}
		
		if var263 ~= nil then
			for i, v in var263 do
				t[i] = v
			end
		end
		var259:render(p114.React.createElement("Frame", {
			Name = "BenchmarkHost",
			Size = UDim2.fromOffset(400, var264 * 40)
		}, {
			List = p114.React.createElement(p114.ViewRecycler.VirtualList, t)
		}))
	end)
	local scrollingFrame = folder:FindFirstChildWhichIsA("ScrollingFrame", true)
	assert(scrollingFrame ~= nil, "React benchmark did not mount a ScrollingFrame")
	local var266 = scrollingFrame
	local var267 = true
	local t = {}
	
	return {
		run = function()
			-- upvalues: var267 (write), hasItemText (copy), folder (ref), p117 (ref), p114 (ref), var266 (ref), captureCompletionPhase (copy), t (ref), observeCompletionPhases (copy)
			var267 = not var267
			local var269 = if var267 then 0 else 400
			local var270 = if var267 then "Item 1" else "Item 11"
			local t_1 = {
				presentationCommitted = function()
					-- upvalues: hasItemText (copy), folder (copy), var270 (ref)
					return hasItemText(folder, var270)
				end
			}
			local t_2 = {}
			local var273 = p117()
			p114.ReactRoblox.act(function()
				-- upvalues: var266 (copy), var269 (ref), captureCompletionPhase (copy), t_1 (ref), t_2 (ref), t (copy)
				var266.CanvasPosition = Vector2.new(0, var269)
				captureCompletionPhase(t_1, t_2, t, "afterMutation")
			end)
			observeCompletionPhases(p114, t_1, `presentation commit to {var270}`, t, t_2)
			
			return (p117() - var273) * 1000
		end,
		getEvidence = function()
			-- upvalues: p115 (ref), p116 (ref), t (ref)
			return {
				presentations = 1,
				readiness = p115,
				hideWhilePending = p116,
				completionPhaseCounts = t
			}
		end,
		destroy = function()
			-- upvalues: p114 (ref), var259 (ref), var260 (ref), folder (ref)
			p114.ReactRoblox.act(function()
				-- upvalues: var259 (ref)
				var259:unmount()
			end)
			var260.destroy()
			folder:Destroy()
		end
	}
end

local function measurePresentationCommit(p122, p123, p124, p125)
	-- upvalues: createPresentationArm (ref), responsibilityCatalogModule (ref)
	local clock = p125.clock or os.clock
	local var275 = createPresentationArm(p122, "ReadyOnCommit", false, clock)
	local var276 = createPresentationArm(p122, "ReadyOnCommit", true, clock)
	local var277 = createPresentationArm(p122, "ReadyOnAssignment", false, clock)
	local var278 = p123.run(var275.run, p125)
	local var279 = p123.run(var276.run, p125)
	local var280 = p123.run(var277.run, p125)
	local t = {
		completionBarrier = "presentationCommitted",
		readyOnCommitVisible = var275.getEvidence(),
		readyOnCommitHidden = var276.getEvidence(),
		readyOnAssignment = var277.getEvidence()
	}
	var275.destroy()
	var276.destroy()
	var277.destroy()
	
	return p124.create({
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
			readyOnCommitVisible = var278,
			readyOnCommitHidden = var279,
			readyOnAssignment = var280
		},
		evidence = t
	})
end

local function measureVirtualListTeardown(p126, p127, p128, p129)
	-- upvalues: createItems (ref), observeCompletionPhases (ref), hasItemText (ref), responsibilityCatalogModule (ref)
	local clock = p129.clock or os.clock
	local t = {}
	
	return p128.create({
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
			viewRecycler = p127.run(function()
				-- upvalues: p126 (ref), createItems (copy), observeCompletionPhases (copy), hasItemText (copy), clock (ref), t (write)
				local var284 = 0
				local var285 = 0
				local var286 = p126.ViewRecycler.createRecyclableView(function(p130)
					-- upvalues: p126 (copy), var284 (write), var285 (write)
					local var297 = p126.SignalsReact.useSignalState(p130.valueSignal)
					p126.React.useEffect(function()
						-- upvalues: var284 (copy), var285 (copy)
						var284 += 1
						
						return function()
							-- upvalues: var285 (copy)
							var285 += 1
						end
					end, {})
					
					return p126.React.createElement("TextLabel", {
						Name = "Content",
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						Text = var297.text
					})
				end, { readiness = "ReadyOnCommit", hideWhilePending = true })
				local folder = Instance.new("Folder")
				local var288 = p126.ReactRoblox.createRoot(folder)
				local var289 = p126.ViewRecycler.Layout.uniform({ itemLength = 40 })
				local var290 = p126.ViewRecycler.DataSource.snapshot(createItems(20), function(p131)
					return p131.id
				end)
				local act = p126.ReactRoblox.act
				local var291 = nil
				local var292 = nil
				local var293 = 10
				act(function()
					-- upvalues: var290 (ref), var289 (ref), p126 (ref), var286 (ref), var291 (ref), var292 (ref), var288 (ref), var293 (ref)
					local t = {
						overscan = 0,
						data = var290,
						layout = var289,
						axis = p126.ViewRecycler.Axis.Y,
						itemType = var286,
						diagnostics = var291
					}
					
					if var292 ~= nil then
						for i, v in var292 do
							t[i] = v
						end
					end
					var288:render(p126.React.createElement("Frame", {
						Name = "BenchmarkHost",
						Size = UDim2.fromOffset(400, var293 * 40)
					}, {
						List = p126.React.createElement(p126.ViewRecycler.VirtualList, t)
					}))
				end)
				observeCompletionPhases(p126, {
					mounted = function()
						-- upvalues: var284 (write), hasItemText (copy), folder (ref)
						return var284 > 0 and hasItemText(folder, "Item 10")
					end
				}, "VirtualList teardown setup", {})
				local var294 = clock()
				p126.ReactRoblox.act(function()
					-- upvalues: var288 (ref)
					var288:unmount()
				end)
				var289.destroy()
				local count = #folder:GetDescendants()
				folder:Destroy()
				local var296 = (clock() - var294) * 1000
				assert(var285 == var284, "VirtualList teardown did not unmount every physical row")
				assert(count == 0, "VirtualList teardown retained host descendants")
				t = {
					completionBarrier = "allRowsUnmountedAndHostsRemoved",
					mountedRows = var284,
					unmountedRows = var285,
					descendantsAfterUnmount = count,
					completionPhaseCounts = { allRowsUnmountedAndHostsRemoved = { afterAct = 1 } }
				}
				
				return var296
			end, p129)
		},
		evidence = t
	})
end

local function createRecyclingTransferArm(p132, p133, p134)
	-- upvalues: findMeasuredObjects (ref), hasItemText (ref), captureCompletionPhase (ref), observeCompletionPhases (ref)
	local react = p132.React
	local viewRecycler = p132.ViewRecycler
	local var298 = 0
	local var299 = 0
	local var300 = viewRecycler.createRecyclableView(if p133 == "ReadyOnAssignment" then function(p136)
		-- upvalues: react (ref), var298 (write), var299 (write), viewRecycler (ref)
		local var326 = react.useState("state-preserved")
		react.useEffect(function()
			-- upvalues: var298 (copy), var299 (copy)
			var298 += 1
			
			return function()
				-- upvalues: var299 (copy)
				var299 += 1
			end
		end, {})
		
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = viewRecycler.useItemBinding(p136.valueSignal, function(p137)
				-- upvalues: var326 (ref)
				return `{p137.text}:{var326}`
			end)
		})
	end else function(p135)
		-- upvalues: p132 (ref), react (ref), var298 (write), var299 (write)
		local var324 = p132.SignalsReact.useSignalState(p135.valueSignal)
		local var325 = react.useState("state-preserved")
		react.useEffect(function()
			-- upvalues: var298 (copy), var299 (copy)
			var298 += 1
			
			return function()
				-- upvalues: var299 (copy)
				var299 += 1
			end
		end, {})
		
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Text = `{var324.text}:{var325}`
		})
	end, {
		readiness = p133,
		hideWhilePending = p133 == "ReadyOnCommit"
	})
	local var301 = viewRecycler.DataSource.sequence({ { id = "first", text = "First", height = 40 } }, function(p138)
		return p138.id
	end)
	local var302 = viewRecycler.DataSource.sequence({ { id = "second", text = "Second", height = 40 } }, function(p139)
		return p139.id
	end)
	local var303 = viewRecycler.Layout.uniform({ itemLength = 40 })
	local var304 = viewRecycler.Layout.uniform({ itemLength = 40 })
	local t = { current = nil }
	local frame = Instance.new("Frame")
	frame.Size = UDim2.fromOffset(400, 40)
	local var307 = p132.ReactRoblox.createRoot(frame)
	local viewRecycler_1 = p132.ViewRecycler
	local var308 = false
	local var309 = ""
	local var310 = nil
	local var311 = nil
	local var312 = 0
	local var313 = 0
	
	local function assignmentChanged(_, p140)
		-- upvalues: var308 (write), var313 (write), var312 (write), var309 (write), var310 (write), p134 (ref)
		if var308 then
			if p140 == nil then
				var313 += 1
				
				return
			end
			var312 += 1
			
			if p140.key == var309 and var310 == nil then
				var310 = p134()
			end
		end
	end
	
	local function presentationChanged(_, p141)
		-- upvalues: var308 (write), var309 (write), var311 (write), p134 (ref)
		if var308 and p141 ~= nil and (p141.key == var309 and var311 == nil) then
			var311 = p134()
		end
	end
	
	p132.ReactRoblox.act(function()
		-- upvalues: var307 (ref), react (ref), viewRecycler_1 (ref), t (ref), var301 (ref), var303 (ref), var300 (ref), assignmentChanged (ref), presentationChanged (ref), var302 (ref), var304 (ref)
		var307:render(react.createElement(viewRecycler_1.RecyclingViewport, {
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
					data = var301,
					layout = var303,
					axis = viewRecycler_1.Axis.Y,
					itemType = var300,
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
					data = var302,
					layout = var304,
					axis = viewRecycler_1.Axis.Y,
					itemType = var300,
					_instrumentation = {
						assignmentChanged = assignmentChanged,
						presentationChanged = presentationChanged
					},
					scrollingFrameProps = { Name = "SecondList" }
				})
			})
		}))
	end)
	local var316 = assert(findMeasuredObjects(frame, "First:state-preserved"))
	local listItemViewFrame1 = var316:FindFirstAncestor("ListItemViewFrame1")
	local var318 = assert(frame:FindFirstChild("FirstRoot", true))
	local var319 = assert(frame:FindFirstChild("SecondRoot", true))
	local var320 = true
	local t_1 = {}
	local var322 = 0
	local t_2 = {}
	
	return {
		run = function()
			-- upvalues: var320 (write), var318 (ref), var319 (ref), var309 (write), var310 (write), var311 (write), var308 (write), hasItemText (copy), frame (ref), findMeasuredObjects (copy), p134 (ref), var316 (ref), listItemViewFrame1 (ref), p132 (ref), t (ref), captureCompletionPhase (copy), t_1 (ref), observeCompletionPhases (copy), var322 (write), t_2 (write)
			var320 = not var320
			local var327 = if var320 then "First:state-preserved" else "Second:state-preserved"
			local var328 = if var320 then var318 else var319
			local var329 = if var320 then 0 else 40
			local var330 = if var320 then 400 else 200
			var309 = if var320 then "first" else "second"
			var310 = nil
			var311 = nil
			var308 = true
			local var331 = nil
			local var332 = nil
			local t_3 = {
				assignmentDelivered = function()
					-- upvalues: var310 (copy)
					return var310 ~= nil
				end,
				commitCompleted = function()
					-- upvalues: var311 (copy), hasItemText (copy), frame (copy), var327 (ref)
					return var311 ~= nil and hasItemText(frame, var327)
				end,
				layoutSettled = function()
					-- upvalues: findMeasuredObjects (copy), frame (copy), var327 (ref), var330 (ref), var331 (write), p134 (copy)
					local var336 = findMeasuredObjects(frame, var327)
					local var337 = var336 ~= nil and math.abs(var336.AbsoluteSize.X - var330) <= 0.01
					
					if var337 and var331 == nil then
						var331 = p134()
					end
					return var337
				end,
				hostObserved = function()
					-- upvalues: findMeasuredObjects (copy), frame (copy), var327 (ref), var316 (copy), var328 (ref), listItemViewFrame1 (copy), var332 (write), p134 (copy)
					local var338 = findMeasuredObjects(frame, var327)
					local var339 = var338 ~= nil and (var338 == var316 and (var338:IsDescendantOf(var328) and var338:FindFirstAncestor("ListItemViewFrame1") == listItemViewFrame1))
					
					if var339 and var332 == nil then
						var332 = p134()
					end
					return var339
				end,
				destinationPresented = function()
					-- upvalues: findMeasuredObjects (copy), frame (copy), var327 (ref), var316 (copy), var328 (ref), listItemViewFrame1 (copy), var330 (ref)
					local var340 = findMeasuredObjects(frame, var327)
					
					return var340 ~= nil and (var340 == var316 and (var340:IsDescendantOf(var328) and (var340:FindFirstAncestor("ListItemViewFrame1") == listItemViewFrame1 and math.abs(var340.AbsoluteSize.X - var330) <= 0.01)))
				end
			}
			local t_4 = {}
			local var335 = p134()
			p132.ReactRoblox.act(function()
				-- upvalues: t (copy), var329 (ref), captureCompletionPhase (copy), t_3 (ref), t_4 (ref), t_1 (copy)
				t.current.CanvasPosition = Vector2.new(0, var329)
				captureCompletionPhase(t_3, t_4, t_1, "afterMutation")
			end)
			observeCompletionPhases(p132, t_3, `recycling transfer to {var327}`, t_1, t_4)
			var322 += 1
			t_2 = {
				assignmentMs = (assert(var310, "fixed-size transfer assignment was not delivered") - var335) * 1000,
				commitMs = (assert(var311, "fixed-size transfer presentation was not committed") - var335) * 1000,
				layoutMs = (assert(var331, "fixed-size transfer layout did not settle") - var335) * 1000,
				hostMs = (assert(var332, "fixed-size transfer host was not observed") - var335) * 1000
			}
			
			return (p134() - var335) * 1000
		end,
		getEvidence = function()
			-- upvalues: var298 (write), var299 (write), var322 (write), findMeasuredObjects (copy), frame (ref), var320 (write), var316 (ref), var312 (write), var313 (write), t_2 (write), t_1 (ref)
			return {
				firstListWidth = 400,
				secondListWidth = 200,
				mounts = var298,
				unmounts = var299,
				transfers = var322,
				sameContentInstance = findMeasuredObjects(frame, if var320 then "First:state-preserved" else "Second:state-preserved") == var316,
				activations = var312,
				deactivations = var313,
				milestones = t_2,
				completionPhaseCounts = t_1
			}
		end,
		destroy = function()
			-- upvalues: p132 (ref), var307 (ref), var303 (ref), var304 (ref), frame (ref)
			p132.ReactRoblox.act(function()
				-- upvalues: var307 (copy)
				var307:unmount()
			end)
			var303.destroy()
			var304.destroy()
			frame:Destroy()
		end
	}
end

local function createWrappedRecyclingTransferArm(p142, p143, p144)
	-- upvalues: waitForHeartbeatToSettle (ref), findMeasuredObjects (ref), hasItemText (ref), captureCompletionPhase (ref), observeCompletionPhases (ref)
	local react = p142.React
	local viewRecycler = p142.ViewRecycler
	local var341 = 0
	local var342 = 0
	local var343 = 0
	local var344 = nil
	local var345 = nil
	local var346 = nil
	local var347 = nil
	local var348 = nil
	local var349 = viewRecycler.createRecyclableView(function(p145)
		-- upvalues: p142 (ref), react (ref), var341 (write), var342 (write)
		local var372 = p142.SignalsReact.useSignalState(p145.valueSignal)
		local var373 = react.useState("state-preserved")
		react.useEffect(function()
			-- upvalues: var341 (copy), var342 (copy)
			var341 += 1
			
			return function()
				-- upvalues: var342 (copy)
				var342 += 1
			end
		end, {})
		
		return react.createElement("TextLabel", {
			Name = "Content",
			BackgroundTransparency = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -20, 0, 0),
			Text = `{var372.text}:{var373}`
		})
	end, {
		readiness = p143,
		hideWhilePending = p143 == "ReadyOnCommit"
	})
	local repeated = string.rep("First wrapped transfer content ", 8)
	local repeated_1 = string.rep("Second wrapped transfer content ", 8)
	local var352 = viewRecycler.DataSource.sequence({ { id = "first-wrapped", height = 40, text = repeated } }, function(p146)
		return p146.id
	end)
	local var353 = viewRecycler.DataSource.sequence({
		{ id = "second-wrapped", height = 40, text = repeated_1 }
	}, function(p147)
		return p147.id
	end)
	local var354 = viewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local var355 = viewRecycler.Layout.measured({ estimatedItemLength = 40 })
	local t = { current = nil }
	local screenGui = Instance.new("ScreenGui")
	screenGui.ResetOnSpawn = false
	screenGui.Parent = game:GetService("CoreGui")
	local var358 = p142.ReactRoblox.createRoot(screenGui)
	local var359 = false
	local var360 = ""
	
	local function assignmentChanged(_, p148)
		-- upvalues: var359 (write), var360 (write), var344 (write), p144 (ref)
		if var359 and p148 ~= nil and (p148.key == var360 and var344 == nil) then
			var344 = p144()
		end
	end
	
	local function presentationChanged(_, p149)
		-- upvalues: var359 (write), var360 (write), var345 (write), p144 (ref)
		if var359 and p149 ~= nil and (p149.key == var360 and var345 == nil) then
			var345 = p144()
		end
	end
	
	local function diagnostics(p150)
		-- upvalues: var359 (write), var347 (write), var343 (write), p144 (ref)
		if var359 and p150.kind == "measurementsProcessed" and (p150.accepted > 0 and var347 == nil) then
			var343 += p150.accepted
			var347 = p144()
		end
	end
	
	p142.ReactRoblox.act(function()
		-- upvalues: var358 (ref), react (ref), viewRecycler (ref), t (ref), var352 (ref), var354 (ref), var349 (ref), diagnostics (ref), assignmentChanged (ref), presentationChanged (ref), var353 (ref), var355 (ref)
		var358:render(react.createElement("Frame", { Name = "TransferHost", Size = UDim2.fromOffset(400, 40) }, {
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
						data = var352,
						layout = var354,
						axis = viewRecycler.Axis.Y,
						itemType = var349,
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
						data = var353,
						layout = var355,
						axis = viewRecycler.Axis.Y,
						itemType = var349,
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
	waitForHeartbeatToSettle(p142)
	waitForHeartbeatToSettle(p142)
	local var364 = assert(findMeasuredObjects(screenGui, `{repeated}:state-preserved`))
	local listItemViewFrame1 = var364:FindFirstAncestor("ListItemViewFrame1")
	local var366 = assert(screenGui:FindFirstChild("FirstRoot", true))
	local var367 = assert(screenGui:FindFirstChild("SecondRoot", true))
	local var368 = true
	local t_1 = {}
	local var370 = 0
	local t_2 = {}
	
	return {
		run = function()
			-- upvalues: var368 (write), repeated (ref), repeated_1 (ref), var360 (write), var366 (ref), var367 (ref), var354 (ref), var355 (ref), var344 (write), var345 (write), var346 (write), var347 (write), var348 (write), p144 (ref), var359 (write), hasItemText (copy), screenGui (ref), findMeasuredObjects (copy), var364 (ref), listItemViewFrame1 (ref), p142 (ref), t (ref), captureCompletionPhase (copy), t_1 (ref), observeCompletionPhases (copy), t_2 (write), var370 (write)
			var368 = not var368
			local _ = "%*:state-preserved"
			local _ = if var368 then repeated else repeated_1
			var360 = if var368 then "first-wrapped" else "second-wrapped"
			local var374 = if var368 then var366 else var367
			local var375 = if var368 then 0 else 40
			local var376 = if var368 then 400 else 200
			local var377 = if var368 then var354 else var355
			var344 = nil
			var345 = nil
			var346 = nil
			var347 = nil
			var348 = nil
			local var378 = p144()
			var359 = true
			local t_3 = {
				assignmentDelivered = function()
					-- upvalues: var344 (copy)
					return var344 ~= nil
				end,
				commitCompleted = function()
					-- upvalues: var345 (copy), hasItemText (copy), screenGui (copy), ? (ref)
					return var345 ~= nil and hasItemText(screenGui, u1510)
				end,
				layoutSettled = function()
					-- upvalues: findMeasuredObjects (copy), screenGui (copy), ? (ref), var376 (ref), var346 (copy), p144 (copy)
					local var381, var382 = findMeasuredObjects(screenGui, u1516)
					local var383 = var381 ~= nil and (var382 ~= nil and (var381.AbsoluteSize.X == var376 - 20 and (var381.AbsoluteSize.Y > 0 and var382.AbsoluteSize.Y > 0)))
					
					if var383 and var346 == nil then
						var346 = p144()
					end
					return var383
				end,
				measurementSettled = function()
					-- upvalues: findMeasuredObjects (copy), screenGui (copy), ? (ref), var377 (ref), var347 (copy), p144 (copy)
					local var384, var385 = findMeasuredObjects(screenGui, u1528)
					local var386 = var384 ~= nil and (var385 ~= nil and math.abs(var377.getItemLayout(1).length - var385.AbsoluteSize.Y) <= 0.01)
					
					if var386 and var347 == nil then
						var347 = p144()
					end
					return var386
				end,
				hostObserved = function()
					-- upvalues: findMeasuredObjects (copy), screenGui (copy), ? (ref), var364 (copy), var374 (ref), listItemViewFrame1 (copy), var348 (copy), p144 (copy)
					local var387 = findMeasuredObjects(screenGui, u1541)
					local var388 = var387 ~= nil and (var387 == var364 and (var387:IsDescendantOf(var374) and var387:FindFirstAncestor("ListItemViewFrame1") == listItemViewFrame1))
					
					if var388 and var348 == nil then
						var348 = p144()
					end
					return var388
				end
			}
			local t_4 = {}
			p142.ReactRoblox.act(function()
				-- upvalues: t (copy), var375 (ref), captureCompletionPhase (copy), t_3 (ref), t_4 (ref), t_1 (copy)
				t.current.CanvasPosition = Vector2.new(0, var375)
				captureCompletionPhase(t_3, t_4, t_1, "afterMutation")
			end)
			observeCompletionPhases(p142, t_3, function()
				-- upvalues: findMeasuredObjects (copy), screenGui (copy), ? (ref), var360 (copy), var344 (copy), var345 (copy), var346 (copy), var347 (copy), var348 (copy), var376 (ref)
				local var389, var390 = findMeasuredObjects(screenGui, u1565)
				
				return `wrapped recycling transfer to {var360}; assignment={var344 ~= nil}, commit={var345 ~= nil}, content={var389 ~= nil}, layout={var346 ~= nil}, measurement={var347 ~= nil}, host={var348 ~= nil}, contentWidth={if var389 == nil then "nil" else var389.AbsoluteSize.X}, expectedWidth={var376 - 20}, hostHeight={if var390 == nil then "nil" else var390.AbsoluteSize.Y}`
			end, t_1, t_4)
			t_2 = {
				assignmentMs = (assert(var344, "wrapped transfer assignment was not delivered") - var378) * 1000,
				commitMs = (assert(var345, "wrapped transfer presentation was not committed") - var378) * 1000,
				layoutMs = (assert(var346, "wrapped transfer layout did not settle") - var378) * 1000,
				measurementMs = (assert(var347, "wrapped transfer measurement was not settled") - var378) * 1000,
				hostMs = (assert(var348, "wrapped transfer host was not observed") - var378) * 1000
			}
			var370 += 1
			
			return (p144() - var378) * 1000
		end,
		getEvidence = function()
			-- upvalues: var341 (write), var342 (write), var370 (write), findMeasuredObjects (copy), screenGui (ref), var368 (write), repeated (ref), repeated_1 (ref), var364 (ref), var343 (write), t_2 (write), t_1 (ref)
			return {
				mounts = var341,
				unmounts = var342,
				transfers = var370,
				sameContentInstance = findMeasuredObjects(screenGui, `{if var368 then repeated else repeated_1}:state-preserved`) == var364,
				acceptedMeasurements = var343,
				milestones = t_2,
				completionPhaseCounts = t_1
			}
		end,
		destroy = function()
			-- upvalues: p142 (ref), var358 (ref), var354 (ref), var355 (ref), screenGui (ref)
			p142.ReactRoblox.act(function()
				-- upvalues: var358 (copy)
				var358:unmount()
			end)
			var354.destroy()
			var355.destroy()
			screenGui:Destroy()
		end
	}
end

var19 = function(p151, p152, p153, p154)
	-- upvalues: createRecyclingTransferArm (ref), createWrappedRecyclingTransferArm (ref), responsibilityCatalogModule (ref)
	local clock = p154.clock or os.clock
	local var392 = createRecyclingTransferArm(p151, "ReadyOnCommit", clock)
	local var393 = createRecyclingTransferArm(p151, "ReadyOnAssignment", clock)
	local var394 = createWrappedRecyclingTransferArm(p151, "ReadyOnCommit", clock)
	local var395 = createWrappedRecyclingTransferArm(p151, "ReadyOnAssignment", clock)
	local var396 = p152.run(var392.run, p154)
	local var397 = p152.run(var393.run, p154)
	local var398 = p152.run(var394.run, p154)
	local var399 = p152.run(var395.run, p154)
	local t = {
		fixedSizeMeasurementMilestone = "notRequiredUniformLayout",
		untilCommit = var392.getEvidence(),
		immediate = var393.getEvidence()
	}
	local t_1 = {
		wrappedUntilCommit = var394.getEvidence(),
		wrappedImmediate = var395.getEvidence()
	}
	var392.destroy()
	var393.destroy()
	var394.destroy()
	var395.destroy()
	
	return p153.create({
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
		arms = { untilCommit = var396, immediate = var397 },
		evidence = t
	}), p153.create({
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
		arms = { wrappedUntilCommit = var398, wrappedImmediate = var399 },
		evidence = t_1
	}), p153.create({
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
		arms = { untilCommit = var396, immediate = var397 },
		evidence = t
	})
end

local function measureRecyclingScopeHighWater(p155, p156, p157, p158, p159)
	-- upvalues: responsibilityCatalogModule (ref)
	local clock = p159.clock or os.clock
	local t = {}
	
	return p157.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "isolated",
		workload = "recycling-scope-high-water-lifecycle",
		description = "Creates one React RecyclingScope high-water batch and publishes only surviving hosts.",
		responsibility = responsibilityCatalogModule.React.ScopeOwnership,
		scale = { items = p158 },
		timing = {
			unit = "ms",
			basis = "recyclingScopeHighWaterBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p158
		},
		arms = {
			viewRecycler = p156.run(function()
				-- upvalues: p155 (ref), p158 (ref), clock (ref), t (write)
				local var404, var405 = p155.LifecycleWorkloads.recyclingScopeHighWater(p158, clock)
				t = var405
				
				return var404
			end, p159)
		},
		evidence = t
	})
end

local function measureCompositionChurn(p160, p161, p162, p163, p164)
	-- upvalues: responsibilityCatalogModule (ref)
	local clock = p164.clock or os.clock
	local var407 = p160.LifecycleWorkloads.compositionChurn(p163)
	local var408 = 0
	local var409 = 0
	local var410 = p161.run(function()
		-- upvalues: var407 (ref), clock (ref), var408 (write), var409 (write)
		local assignmentUpdates = var407.getAssignmentUpdates()
		local flushes = var407.getFlushes()
		local var413 = clock()
		var407.run()
		local var414 = (clock() - var413) * 1000
		var408 = var407.getAssignmentUpdates() - assignmentUpdates
		var409 = var407.getFlushes() - flushes
		
		return var414
	end, p164)
	var407.destroy()
	
	return p162.create({
		suite = "view-recycler-react",
		layer = "reactHost",
		owner = "react",
		timingClass = "isolated",
		workload = "composed-recyclable-churn",
		description = "Coalesces one prop update per composed destination into a single placement flush.",
		responsibility = responsibilityCatalogModule.React.Composition,
		scale = { items = p163, updates = p163 },
		timing = {
			unit = "ms",
			basis = "compositionPlacementFlushBatch",
			includesSchedulerWaits = false,
			operationsPerSample = p163
		},
		arms = { viewRecycler = var410 },
		evidence = {
			assignmentUpdates = var408,
			coalescedUpdates = p163,
			placementFlushes = var409,
			completionPhaseCounts = { compositionPublication = { synchronousFlush = 1 } }
		}
	})
end

return {
	run = function(p165, p166, p167, p168)
		-- upvalues: list (ref), createItems (ref), createItemTypes (ref), measureCompletedMount (ref), measureCompletedTraversal (ref), measureHostSizeSettlePhases (ref), measureAssignmentPropagation (ref), createPropagationScenario (ref), var19 (write), measureRecyclingScopeHighWater (ref), measureCompositionChurn (ref), measureDeclarativeReconciliation (ref), measurePropSynchronization (ref), measureAssignmentBinding (ref), measurePresentationCommit (ref), measureVirtualListTeardown (ref)
		p168 = p168 or {}
		local itemCount = p168.itemCount or 1000
		local scrollStepCount = p168.scrollStepCount or 10
		local mountVisibleRows = p168.mountVisibleRows or list
		local lifecycleItemCount = p168.lifecycleItemCount or 40
		local propagationItemCount = p168.propagationItemCount or 1000
		assert(itemCount >= 10 and itemCount % 1 == 0, "itemCount must be an integer of at least 10")
		assert(scrollStepCount >= 1 and scrollStepCount % 1 == 0, "scrollStepCount must be a positive integer")
		assert(propagationItemCount >= 20 and propagationItemCount % 1 == 0, "propagationItemCount must be an integer of at least 20")
		local var421 = createItems(itemCount)
		local var422, var423 = createItemTypes(p165)
		local t = {}
		
		for i, v in ipairs(mountVisibleRows) do
			assert(v >= 1 and v <= itemCount, "mount visible-row scale is out of range")
			table.insert(t, measureCompletedMount(p165, p166, p167, var421, var422, v, p168))
		end
		table.insert(t, measureCompletedTraversal(p165, p166, p167, var421, var422, itemCount, scrollStepCount, false, p168))
		table.insert(t, measureCompletedTraversal(p165, p166, p167, var421, var423, itemCount, scrollStepCount, true, p168))
		table.insert(t, measureHostSizeSettlePhases(p165, p166, p167, p168))
		local _, var425 = createItemTypes(p165)
		
		for i_1, v_1 in ipairs({
			"at-start",
			"in-middle",
			"before-visible-anchor",
			"at-end"
		}) do
			table.insert(t, measureAssignmentPropagation(p165, p166, p167, var425, createPropagationScenario(p165, v_1, propagationItemCount), propagationItemCount, p168))
		end
		local var426, var427, var428 = var19(p165, p166, p167, p168)
		table.insert(t, var426)
		table.insert(t, var427)
		table.insert(t, var428)
		table.insert(t, measureRecyclingScopeHighWater(p165, p166, p167, lifecycleItemCount, p168))
		table.insert(t, measureCompositionChurn(p165, p166, p167, lifecycleItemCount, p168))
		table.insert(t, measureDeclarativeReconciliation(p165, p166, p167, var422, p168))
		table.insert(t, measurePropSynchronization(p165, p166, p167, var422, p168))
		local var429, var430 = measureAssignmentBinding(p165, p166, p167, p168)
		table.insert(t, var429)
		table.insert(t, var430)
		table.insert(t, measurePresentationCommit(p165, p166, p167, p168))
		table.insert(t, measureVirtualListTeardown(p165, p166, p167, p168))
		
		return t
	end,
	runDeclarativeDataReconciliation = runDeclarativeDataReconciliation
}