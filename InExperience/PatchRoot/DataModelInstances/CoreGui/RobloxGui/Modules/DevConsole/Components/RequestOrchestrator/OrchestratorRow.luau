local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local Mono = ConstantsModule.Font.Mono
local config = {
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
	cacheEmpty = ConstantsModule.Color.BaseGray,
	idleText = Color3.fromRGB(70, 70, 70),
	timelineTick = Color3.fromRGB(50, 50, 50),
	timelineBackground = Color3.fromRGB(20, 20, 20),
	rowBackground = Color3.fromRGB(28, 28, 28)
}

local function _(p1, p2, p3) --[[ Line: 66 | Named "lerp" ]]
	return p1 + (p2 - p1) * p3
end

local _ = function(p1: number): number --[[ Line: 71 | Named "smooth" ]]
	return p1 * p1 * (3 - 2 * p1)
end

local function renderTypeLabel(Text) --[[ Line: 75 ]]
	-- upvalues: RoactModule (copy), config (copy), Mono (copy)
	return RoactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextSize = 12,
		Size = UDim2.new(0, 130, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Text = Text,
		TextColor3 = config.labelText,
		Font = Mono,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top
	})
end

local _ = function(p1) --[[ Line: 90 | Named "resolveMaxSize" ]]
	local ObservedMaxBatchSize: number = p1.observedMaxBatchSize
	
	return if ObservedMaxBatchSize and ObservedMaxBatchSize > 0 then ObservedMaxBatchSize else nil
end

local function renderBatchOutline(Props, p1: number) --[[ Line: 99 ]]
	-- upvalues: RoactModule (copy), config (copy), Mono (copy)
	local Smallest = math.min(p1, 30)
	local PanelWidth: number = Props.panelWidth
	
	if PanelWidth and PanelWidth > 0 then
		Smallest = math.min(Smallest, (math.floor((PanelWidth - 374 - 8 - 8 + 3) / 19)))
	end
	local Largest = math.max(1, Smallest)
	local IsLargestBelow = Largest < p1
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(0, Largest * 16 + math.max(0, Largest - 1) * 3 + 8, 0, 21),
		Position = UDim2.new(0, 374, 0, 1.5)
	}, {
		Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
		Stroke = RoactModule.createElement("UIStroke", {
			Thickness = 1.5,
			Transparency = 0.15,
			Color = config.batchOutline
		}),
		Overflow = if IsLargestBelow then RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = "»",
			TextSize = 12,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -2, 0.5, 0),
			Size = UDim2.new(0, 10, 1, 0),
			TextColor3 = config.batchOutline,
			Font = Mono,
			TextXAlignment = Enum.TextXAlignment.Right,
			TextYAlignment = Enum.TextYAlignment.Center
		}) else nil
	})
end

local function renderIdleQueue() --[[ Line: 143 ]]
	-- upvalues: RoactModule (copy), config (copy), Mono (copy)
	return RoactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Text = "idle",
		TextSize = 10,
		Size = UDim2.new(1, 0, 1, 0),
		TextColor3 = config.idleText,
		Font = Mono,
		TextXAlignment = Enum.TextXAlignment.Left
	})
end

local function renderCacheChildren(Cache, Now) --[[ Line: 155 ]]
	-- upvalues: RoactModule (copy), config (copy), Mono (copy)
	local Items = if Cache then Cache.items else {}
	local CountItems = #Items
	local Frames = {
		Count = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextSize = 10,
			Size = UDim2.new(1, 0, 0, 12),
			Position = UDim2.new(0, 0, 0, 0),
			Text = string.format("cache %d", CountItems),
			TextColor3 = config.queueText,
			Font = Mono,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	}
	
	for i, item in ipairs(Items) do
		if i > 48 then break end
		Frames["c" .. i] = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = UDim2.new(0, (i - 1) % 12 * 10, 0, math.floor((i - 1) / 12) * 10 + 12),
			Size = UDim2.new(0, 8, 0, 8),
			BackgroundColor3 = config.cacheCold:Lerp(config.cacheHot, if item.lastHitTime then math.clamp(1 - (Now - item.lastHitTime) / 0.6, 0, 1) else 0)
		}, {
			Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 2) })
		})
	end
	for i1 = CountItems + 1, 48 do
		Frames["e" .. i1] = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = UDim2.new(0, (i1 - 1) % 12 * 10, 0, math.floor((i1 - 1) / 12) * 10 + 12),
			Size = UDim2.new(0, 8, 0, 8),
			BackgroundColor3 = config.cacheEmpty
		}, {
			Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 2) })
		})
	end
	return Frames
end

local function renderTimelineChildren(Batches, Now: number) --[[ Line: 207 ]]
	-- upvalues: config (copy), RoactModule (copy)
	local NowDelta = Now - 30
	local Frames = {}
	
	for i, batch in pairs(Batches) do
		local Attempts = batch.attempts or {}
		local CountAttempts = #Attempts
		
		for i1, attempt in ipairs(Attempts) do
			local Finish = attempt.finish or Now
			
			if NowDelta <= Finish then
				local Largest = math.max(0, (attempt.start - NowDelta) / 30)
				local Smallest = math.min(1, (Finish - NowDelta) / 30)
				
				if Largest < Smallest then
					Frames["batch_" .. i .. "_" .. i1] = RoactModule.createElement("Frame", {
						BorderSizePixel = 0,
						Position = UDim2.new(Largest, 0, 0, 2),
						Size = UDim2.new(Smallest - Largest, 0, 1, -4),
						BackgroundColor3 = if i1 == CountAttempts then config[batch.state] or config.inflight else config.retrying
					}, {
						Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) })
					})
				end
			end
		end
	end
	for i2 = 0, 2 do
		Frames["tick_" .. i2] = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = UDim2.new(1 - i2 * 10 / 30, 0, 0, 0),
			Size = UDim2.new(0, 1, 1, 0),
			BackgroundColor3 = config.timelineTick
		})
	end
	return Frames
end

local OrchestratorRow = RoactModule.Component:extend("OrchestratorRow")

function OrchestratorRow.init(p1) --[[ Line: 255 ]]
	p1.opAnim = {}
end

function OrchestratorRow.renderQueueChildren(p1, Queue, p2, Start: number) --[[ Line: 260 ]]
	-- upvalues: RoactModule (copy), config (copy), Mono (copy)
	local Frames = {}
	local List = {}
	local Iterator = ipairs
	local RetryOps = Queue.retryOps or {}
	for _, Id in Iterator(RetryOps) do
		table.insert(List, { isRetry = true, id = Id })
	end
	local Iterator1 = ipairs
	local Ops = Queue.ops or {}
	for _, Id1 in Iterator1(Ops) do
		table.insert(List, { isRetry = false, id = Id1 })
	end
	local StartDelta = Start - Queue.createdTime
	local CountList = #List
	Frames.Info = RoactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextSize = 10,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(0, 120, 1, 0),
		Text = if p2 then string.format("%d/%d ops  %.1fs", CountList, p2, StartDelta) else string.format("%d ops  %.1fs", CountList, StartDelta),
		TextColor3 = config.queueText,
		Font = Mono,
		TextXAlignment = Enum.TextXAlignment.Left
	})
	local t = {}
	
	for i, value in ipairs(List) do
		if i > 30 then break end
		local Id2 = value.id
		
		if t[Id2] then
			Id2 ..= "#" .. i
		end
		t[Id2] = true
		local NewI = 120 + (i - 1) * 19
		local OpAnimEntry = p1.opAnim[Id2]
		
		if OpAnimEntry then
			if OpAnimEntry.toX ~= NewI then
				local FromX = OpAnimEntry.fromX
				local ClampedValue = math.clamp((Start - OpAnimEntry.start) / 0.25, 0, 1)
				OpAnimEntry.fromX = FromX + (OpAnimEntry.toX - FromX) * (ClampedValue * ClampedValue * (3 - 2 * ClampedValue))
				OpAnimEntry.toX = NewI
				OpAnimEntry.start = Start
			end
		else
			OpAnimEntry = {
				fromX = if value.isRetry then NewI - 19 else NewI,
				toX = NewI,
				start = Start
			}
			p1.opAnim[Id2] = OpAnimEntry
		end
		local FromX = OpAnimEntry.fromX
		local ClampedValue = math.clamp((Start - OpAnimEntry.start) / 0.25, 0, 1)
		local NewFromX = FromX + (OpAnimEntry.toX - FromX) * (ClampedValue * ClampedValue * (3 - 2 * ClampedValue))
		local QueueOp = config.queueOp
		local ScaledSine = 0
		
		if value.isRetry then
			QueueOp = config.queueRetry
			ScaledSine = (math.sin(Start * 7) * 0.5 + 0.5) * 0.75
		end
		Frames["op_" .. Id2] = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = UDim2.new(0, NewFromX, 0.5, -8),
			Size = UDim2.new(0, 16, 0, 16),
			BackgroundColor3 = QueueOp,
			BackgroundTransparency = ScaledSine
		}, {
			Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 3) })
		})
	end
	for i1 in pairs(p1.opAnim) do
		if not t[i1] then
			p1.opAnim[i1] = nil
		end
	end
	return Frames
end

function OrchestratorRow.render(p3) --[[ Line: 346 ]]
	-- upvalues: renderTypeLabel (copy), RoactModule (copy), renderCacheChildren (copy), renderBatchOutline (copy), renderIdleQueue (copy), config (copy), renderTimelineChildren (copy)
	local Batches = p3.props.batches
	local Queue = p3.props.queue
	local Now = p3.props.now
	local Size = p3.props.size
	local LayoutOrder = p3.props.layoutOrder
	local config1 = {
		Label = renderTypeLabel(p3.props.orchestratorType),
		CacheGrid = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(0, 120, 1, 0),
			Position = UDim2.new(0, 134, 0, 0)
		}, (renderCacheChildren(p3.props.cache, Now)))
	}
	local ObservedMaxBatchSize: number = p3.props.observedMaxBatchSize
	local ObservedMaxBatchSize1 = if ObservedMaxBatchSize and ObservedMaxBatchSize > 0 then ObservedMaxBatchSize else nil
	
	if ObservedMaxBatchSize1 then
		config1.BatchOutline = renderBatchOutline(p3.props, ObservedMaxBatchSize1)
	end
	local RenderQueueChildrenResult = nil
	if Queue then
		RenderQueueChildrenResult = p3:renderQueueChildren(Queue, ObservedMaxBatchSize1, Now)
	else
		p3.opAnim = {}
		RenderQueueChildrenResult = { Idle = renderIdleQueue() }
	end
	config1.Queue = RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = UDim2.new(1, -258, 0, 24),
		Position = UDim2.new(0, 258, 0, 0)
	}, RenderQueueChildrenResult)
	config1.Timeline = RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.new(1, -258, 0, 28),
		Position = UDim2.new(0, 258, 0, 24),
		BackgroundColor3 = config.timelineBackground
	}, (renderTimelineChildren(Batches, Now)))
	
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = Size,
		BackgroundColor3 = config.rowBackground,
		LayoutOrder = LayoutOrder
	}, config1)
end

return OrchestratorRow