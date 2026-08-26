local runService = game:GetService("RunService")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local parent = script.Parent.Parent
local utilAndTabModule = require(parent.UtilAndTab)
local dropDownModule = require(parent.DropDown)
local orchestratorRowModule = require(script.Parent.OrchestratorRow)
local requestOrchestratorDataModule = require(script.Parent.RequestOrchestratorData)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local mono = constantsModule.Font.Mono
local color = Color3.fromRGB(220, 220, 220)
local t = {
	BatchCreated = {
		requestOrchestratorDataModule.registerBatch,
		requestOrchestratorDataModule.trackQueueOnCreated
	},
	BatchSent = {
		requestOrchestratorDataModule.openSendAttempt,
		requestOrchestratorDataModule.drainQueueOnSent
	},
	BatchResponseReceived = { requestOrchestratorDataModule.settleBatch },
	BatchRetrying = {
		requestOrchestratorDataModule.reclassifyOnRetry,
		requestOrchestratorDataModule.requeueRetryOps
	},
	BatchExhausted = {
		requestOrchestratorDataModule.markExhausted,
		requestOrchestratorDataModule.clearQueueOnExhausted
	},
	OperationEnqueued = { requestOrchestratorDataModule.enqueueOperation },
	CacheItemAdded = { requestOrchestratorDataModule.recordCacheItemAdded },
	CacheHit = { requestOrchestratorDataModule.recordCacheHit }
}

local function makeLabel(p1, p2)
	-- upvalues: roactModule (ref), color (ref), mono (ref)
	return roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextSize = 11,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 22),
		Text = p1,
		TextColor3 = color,
		Font = mono,
		TextXAlignment = Enum.TextXAlignment.Left,
		LayoutOrder = p2
	})
end

local function _(value)
	local t = {}
	
	for i, v in pairs(value) do
		t[i] = v
	end
	return t
end

local mainViewRequestOrchestrator = roactModule.Component:extend("MainViewRequestOrchestrator")

function mainViewRequestOrchestrator.init(p1)
	-- upvalues: requestOrchestratorDataModule (ref), roactModule (ref)
	p1.model = requestOrchestratorDataModule.new()
	p1.connections = {}
	p1.utilRef = roactModule.createRef()
	
	function p2.onUtilTabHeightChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ utilTabHeight = p2 })
	end
	
	function p2.onTypeToggle(p2)
		-- upvalues: p1 (ref)
		local t = {}
		
		for i, v in pairs(p1.state.selectedTypes) do
			t[i] = v
		end
		t[p2] = not t[p2] or nil
		p1:setState({ selectedTypes = t })
	end
	
	p1.state = { utilTabHeight = 0, selectedTypes = {} }
end

function mainViewRequestOrchestrator.observeType(p2, p3)
	-- upvalues: requestOrchestratorDataModule (ref)
	local var1 = requestOrchestratorDataModule.observeType(p2.model, p3)
	
	if var1 then
		local t = {}
		
		for i, v in pairs(p2.state.selectedTypes) do
			t[i] = v
		end
		local var2 = t
		var2[var1] = true
		p2:setState({ selectedTypes = var2 })
	end
end

function mainViewRequestOrchestrator.didMount(p4)
	-- upvalues: requestOrchestratorDataModule (ref), t (ref), runService (ref)
	p4:setState({ utilTabHeight = p4.utilRef.current.Size.Y.Offset })
	local requestOrchestratorService = game:GetService("RequestOrchestratorService")
	local ok, status = pcall(function()
		-- upvalues: requestOrchestratorService (ref)
		return requestOrchestratorService:GetRegisteredOrchestrators()
	end)
	
	if ok and status then
		local var3 = requestOrchestratorDataModule.observeTypes(p4.model, status)
		
		if #var3 > 0 then
			local t_1 = {}
			
			for i, v in pairs(p4.state.selectedTypes) do
				t_1[i] = v
			end
			local var4 = t_1
			
			for i_1, v_1 in ipairs(var3) do
				var4[v_1] = true
			end
			p4:setState({ selectedTypes = var4 })
		end
	end
	for i, v in pairs(t) do
		p4.connections[i] = requestOrchestratorService[i]:Connect(function(p5)
			-- upvalues: p4 (ref), v (ref)
			local orchestratorType = p5.orchestratorType or "Unknown"
			p4:observeType(orchestratorType)
			
			for i, v_1 in ipairs(v) do
				v_1(p4.model, orchestratorType, p5)
			end
			p4:setState({})
		end)
	end
	p4.connections.heartbeat = runService.Heartbeat:Connect(function()
		-- upvalues: requestOrchestratorDataModule (copy), p4 (ref)
		requestOrchestratorDataModule.advanceTime(p4.model)
		p4:setState({})
	end)
end

function mainViewRequestOrchestrator.willUnmount(p5)
	for i, v in pairs(p5.connections) do
		v:Disconnect()
	end
	p5.connections = {}
end

function mainViewRequestOrchestrator.didUpdate(p6)
	local offset = p6.utilRef.current.Size.Y.Offset
	
	if offset ~= p6.state.utilTabHeight then
		p6:setState({ utilTabHeight = offset })
	end
end

function mainViewRequestOrchestrator.render(p6)
	-- upvalues: roactModule (ref), mainRowPadding (ref), utilAndTabModule (ref), makeLabel (ref), dropDownModule (ref), orchestratorRowModule (ref), constantsModule (ref)
	local size = p6.props.size
	local formFactor = p6.props.formFactor
	local tabList = p6.props.tabList
	local utilTabHeight = p6.state.utilTabHeight
	local selectedTypes = p6.state.selectedTypes
	local allTypes = p6.model.allTypes
	local t = {
		UIListLayout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, mainRowPadding)
		}),
		UtilAndTab = roactModule.createElement(utilAndTabModule, {
			layoutOrder = 1,
			windowWidth = size.X.Offset,
			formFactor = formFactor,
			tabList = tabList,
			refForParent = p6.utilRef,
			onHeightChanged = p6.onUtilTabHeightChanged
		})
	}
	
	if utilTabHeight > 0 then
		local var5 = 0
		local var6 = nil
		
		for i, v in ipairs(allTypes) do
			if selectedTypes[i] then
				var5 += 1
				var6 = v
			end
		end
		t.Controls = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 24)
		}, {
			Layout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4),
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			ShowLabel = makeLabel("Show", 1),
			TypeDropDown = roactModule.createElement(dropDownModule, {
				layoutOrder = 2,
				buttonSize = UDim2.new(0, 220, 0, 22),
				dropDownList = allTypes,
				selectedSet = selectedTypes,
				onToggle = p6.onTypeToggle,
				summaryText = if #allTypes == 0 then "(waiting for traffic)" elseif var5 == 0 then "(none)" elseif var5 == 1 then var6 elseif var5 == #allTypes then string.format("All (%d)", var5) else string.format("%d selected", var5)
			})
		})
		
		for i_1, v_1 in ipairs(allTypes) do
			if selectedTypes[i_1] then
				t["Row_" .. v_1] = roactModule.createElement(orchestratorRowModule, {
					orchestratorType = v_1,
					batches = p6.model.batchesByType[v_1] or {},
					queue = p6.model.queues[v_1],
					cache = p6.model.cacheByType[v_1],
					observedMaxBatchSize = p6.model.observedMaxByType[v_1],
					panelWidth = size.X.Offset,
					now = p6.model.now,
					size = UDim2.new(1, 0, 0, 52),
					layoutOrder = 2 + i_1
				})
			end
		end
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 4,
		Size = size,
		BackgroundColor3 = constantsModule.Color.BaseGray
	}, t)
end

return mainViewRequestOrchestrator