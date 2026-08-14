local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mono = constantsModule.Font.Mono
local t = {
	inflight = Color3.fromRGB(255, 165, 0),
	retrying = Color3.fromRGB(255, 165, 0),
	success = Color3.fromRGB(66, 135, 245),
	failure = Color3.fromRGB(220, 50, 50),
	exhausted = Color3.fromRGB(220, 50, 50),
	queueOp = Color3.fromRGB(0, 149, 235),
	queueRetry = Color3.fromRGB(239, 68, 68),
	batchOutline = Color3.fromRGB(255, 171, 37),
	labelText = Color3.fromRGB(200, 200, 200),
	queueText = Color3.fromRGB(160, 160, 160),
	cacheHot = Color3.fromRGB(100, 255, 180),
	cacheCold = Color3.fromRGB(60, 120, 95),
	cacheEmpty = constantsModule.Color.BaseGray,
	idleText = Color3.fromRGB(70, 70, 70),
	timelineTick = Color3.fromRGB(50, 50, 50),
	timelineBackground = Color3.fromRGB(20, 20, 20),
	rowBackground = Color3.fromRGB(28, 28, 28)
}

local function _(startValue, endValue, alpha) --[[ line: 66 | named "lerp" ]]
	return startValue + (endValue - startValue) * alpha
end

local _ = function(p0) --[[ line: 71 | named "smooth" ]]
	return p0 * p0 * (3 - 2 * p0)
end

local function renderTypeLabel(p1) --[[ line: 75 ]]
	-- upvalues: roactModule (ref), t (ref), mono (ref)
	return roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextSize = 12,
		Size = UDim2.new(0, 130, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Text = p1,
		TextColor3 = t.labelText,
		Font = mono,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top
	})
end

local _ = function(a) --[[ line: 90 | named "resolveMaxSize" ]]
	local observedMaxBatchSize = a.observedMaxBatchSize
	
	return if observedMaxBatchSize and observedMaxBatchSize > 0 then observedMaxBatchSize else nil
end

local function renderBatchOutline(p2, p3) --[[ line: 99 ]]
	-- upvalues: roactModule (ref), t (ref), mono (ref)
	local minValue = math.min(p3, 30)
	local panelWidth = p2.panelWidth
	
	if panelWidth and panelWidth > 0 then
		minValue = math.min(minValue, math.floor((panelWidth - 374 - 8 - 8 + 3) / 19))
	end
	local maxValue = math.max(1, minValue)
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(0, maxValue * 16 + math.max(0, maxValue - 1) * 3 + 8, 0, 21),
		Position = UDim2.new(0, 374, 0, 1.5)
	}, {
		Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
		Stroke = roactModule.createElement("UIStroke", {
			Thickness = 1.5,
			Transparency = 0.15,
			Color = t.batchOutline
		}),
		Overflow = if maxValue < p3 then roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = "\194\187",
			TextSize = 12,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -2, 0.5, 0),
			Size = UDim2.new(0, 10, 1, 0),
			TextColor3 = t.batchOutline,
			Font = mono,
			TextXAlignment = Enum.TextXAlignment.Right,
			TextYAlignment = Enum.TextYAlignment.Center
		}) else nil
	})
end

local function renderIdleQueue() --[[ line: 143 ]]
	-- upvalues: roactModule (ref), t (ref), mono (ref)
	return roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Text = "idle",
		TextSize = 10,
		Size = UDim2.new(1, 0, 1, 0),
		TextColor3 = t.idleText,
		Font = mono,
		TextXAlignment = Enum.TextXAlignment.Left
	})
end

local function renderCacheChildren(p4, p5) --[[ line: 155 ]]
	-- upvalues: roactModule (ref), t (ref), mono (ref)
	local t_1 = {}
	local var12 = if p4 then p4.items else {}
	local var12Count = #var12
	t_1.Count = roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextSize = 10,
		Size = UDim2.new(1, 0, 0, 12),
		Position = UDim2.new(0, 0, 0, 0),
		Text = string.format("cache %d", var12Count),
		TextColor3 = t.queueText,
		Font = mono,
		TextXAlignment = Enum.TextXAlignment.Left
	})
	
	for i, v in ipairs(var12) do
		if i > 48 then break end
		t_1["c" .. i] = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = UDim2.new(0, (i - 1) % 12 * 10, 0, math.floor((i - 1) / 12) * 10 + 12),
			Size = UDim2.new(0, 8, 0, 8),
			BackgroundColor3 = t.cacheCold:Lerp(t.cacheHot, if v.lastHitTime then math.clamp(1 - (p5 - v.lastHitTime) / 0.6, 0, 1) else 0)
		}, {
			Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 2) })
		})
	end
	for i_1 = var12Count + 1, 48 do
		t_1["e" .. i_1] = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = UDim2.new(0, (i_1 - 1) % 12 * 10, 0, math.floor((i_1 - 1) / 12) * 10 + 12),
			Size = UDim2.new(0, 8, 0, 8),
			BackgroundColor3 = t.cacheEmpty
		}, {
			Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 2) })
		})
	end
	return t_1
end

local function renderTimelineChildren(p6, p7) --[[ line: 207 ]]
	-- upvalues: t (ref), roactModule (ref)
	local var14 = p7 - 30
	local t_1 = {}
	
	for i, v in pairs(p6) do
		local attempts = v.attempts or {}
		local attemptsCount = #attempts
		
		for i_2, v_1 in ipairs(attempts) do
			local finish = v_1.finish or p7
			
			if var14 <= finish then
				local maxValue = math.max(0, (v_1.start - var14) / 30)
				local minValue = math.min(1, (finish - var14) / 30)
				
				if maxValue < minValue then
					t_1["batch_" .. i .. "_" .. i_2] = roactModule.createElement("Frame", {
						BorderSizePixel = 0,
						Position = UDim2.new(maxValue, 0, 0, 2),
						Size = UDim2.new(minValue - maxValue, 0, 1, -4),
						BackgroundColor3 = if i_2 == attemptsCount then t[v.state] or t.inflight else t.retrying
					}, {
						Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) })
					})
				end
			end
		end
	end
	for i_1 = 0, 2 do
		t_1["tick_" .. i_1] = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = UDim2.new(1 - i_1 * 10 / 30, 0, 0, 0),
			Size = UDim2.new(0, 1, 1, 0),
			BackgroundColor3 = t.timelineTick
		})
	end
	return t_1
end

local orchestratorRow = roactModule.Component:extend("OrchestratorRow")

function orchestratorRow.init(p8) --[[ line: 255 ]]
	p8.opAnim = {}
end

function orchestratorRow.renderQueueChildren(p9, p10, p11, p12) --[[ line: 260 ]]
	-- upvalues: roactModule (ref), t (ref), mono (ref)
	local t_1 = {}
	local t_2 = {}
	
	for i, v in ipairs(p10.retryOps or {}) do
		table.insert(t_2, { isRetry = true, id = v })
	end
	for i, v_1 in ipairs(p10.ops or {}) do
		table.insert(t_2, { isRetry = false, id = v_1 })
	end
	local var23 = p12 - p10.createdTime
	local t_2Count = #t_2
	t_1.Info = roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextSize = 10,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(0, 120, 1, 0),
		Text = if p11 then string.format("%d/%d ops  %.1fs", t_2Count, p11, var23) else string.format("%d ops  %.1fs", t_2Count, var23),
		TextColor3 = t.queueText,
		Font = mono,
		TextXAlignment = Enum.TextXAlignment.Left
	})
	local t_3 = {}
	
	for i_2, v_2 in ipairs(t_2) do
		if i_2 > 30 then break end
		local id = v_2.id
		
		if t_3[id] then
			id ..= "#" .. i_2
		end
		t_3[id] = true
		local var26 = 120 + (i_2 - 1) * 19
		local var27 = p9.opAnim[id]
		
		if not var27 then
			var27 = {
				fromX = if v_2.isRetry then var26 - 19 else var26,
				toX = var26,
				start = p12
			}
			p9.opAnim[id] = var27
		elseif var27.toX ~= var26 then
			local fromX = var27.fromX
			local clampedValue = math.clamp((p12 - var27.start) / 0.25, 0, 1)
			var27.fromX = fromX + (var27.toX - fromX) * (clampedValue * clampedValue * (3 - 2 * clampedValue))
			var27.toX = var26
			var27.start = p12
		end
		local fromX = var27.fromX
		local clampedValue = math.clamp((p12 - var27.start) / 0.25, 0, 1)
		local var30 = fromX + (var27.toX - fromX) * (clampedValue * clampedValue * (3 - 2 * clampedValue))
		local queueOp = t.queueOp
		local var31 = 0
		
		if v_2.isRetry then
			queueOp = t.queueRetry
			var31 = (math.sin(p12 * 7) * 0.5 + 0.5) * 0.75
		end
		t_1["op_" .. id] = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = UDim2.new(0, var30, 0.5, -8),
			Size = UDim2.new(0, 16, 0, 16),
			BackgroundColor3 = queueOp,
			BackgroundTransparency = var31
		}, {
			Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 3) })
		})
	end
	for i_3 in pairs(p9.opAnim) do
		if not t_3[i_3] then
			p9.opAnim[i_3] = nil
		end
	end
	return t_1
end

function orchestratorRow.render(p13) --[[ line: 346 ]]
	-- upvalues: renderTypeLabel (ref), roactModule (ref), renderCacheChildren (ref), renderBatchOutline (ref), renderIdleQueue (ref), t (ref), renderTimelineChildren (ref)
	local orchestratorType = p13.props.orchestratorType
	local batches = p13.props.batches
	local queue = p13.props.queue
	local now = p13.props.now
	local size = p13.props.size
	local layoutOrder = p13.props.layoutOrder
	local t_1 = {
		Label = renderTypeLabel(orchestratorType),
		CacheGrid = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(0, 120, 1, 0),
			Position = UDim2.new(0, 134, 0, 0)
		}, renderCacheChildren(p13.props.cache, now))
	}
	local observedMaxBatchSize = p13.props.observedMaxBatchSize
	local var33 = if observedMaxBatchSize and observedMaxBatchSize > 0 then observedMaxBatchSize else nil
	
	if var33 then
		t_1.BatchOutline = renderBatchOutline(p13.props, var33)
	end
	local var34
	local _ = nil
	
	if queue then
		var34 = p13:renderQueueChildren(queue, var33, now)
	else
		p13.opAnim = {}
		var34 = { Idle = renderIdleQueue() }
	end
	t_1.Queue = roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = UDim2.new(1, -258, 0, 24),
		Position = UDim2.new(0, 258, 0, 0)
	}, var34)
	t_1.Timeline = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.new(1, -258, 0, 28),
		Position = UDim2.new(0, 258, 0, 24),
		BackgroundColor3 = t.timelineBackground
	}, renderTimelineChildren(batches, now))
	
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = size,
		BackgroundColor3 = t.rowBackground,
		LayoutOrder = layoutOrder
	}, t_1)
end

return orchestratorRow