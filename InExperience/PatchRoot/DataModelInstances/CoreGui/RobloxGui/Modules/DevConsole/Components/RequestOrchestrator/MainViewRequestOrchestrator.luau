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

local function makeLabel(p0, p1) --[[ line: 37 ]]
	-- upvalues: roactModule (ref), color (ref), mono (ref)
	return roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextSize = 11,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 22),
		Text = p0,
		TextColor3 = color,
		Font = mono,
		TextXAlignment = Enum.TextXAlignment.Left,
		LayoutOrder = p1
	})
end

local function _(value) --[[ line: 51 | named "cloneSet" ]]
	local t = {}
	
	for i, v in pairs(value) do
		t[i] = v
	end
	return t
end

local mainViewRequestOrchestrator = roactModule.Component:extend("MainViewRequestOrchestrator")

function mainViewRequestOrchestrator.init(p2) --[[ line: 61 ]]
	-- upvalues: requestOrchestratorDataModule (ref), roactModule (ref)
	p2.model = requestOrchestratorDataModule.new()
	p2.connections = {}
	p2.utilRef = roactModule.createRef()
	
	function p2.onUtilTabHeightChanged(p3) --[[ line: 66 ]]
		-- upvalues: p2 (ref)
		p2:setState({ utilTabHeight = p3 })
	end
	
	function p2.onTypeToggle(p4) --[[ line: 70 ]]
		-- upvalues: p2 (ref)
		local t = {}
		
		for i, v in pairs(p2.state.selectedTypes) do
			t[i] = v
		end
		t[p4] = not t[p4] or nil
		p2:setState({ selectedTypes = t })
	end
	
	p2.state = { utilTabHeight = 0, selectedTypes = {} }
end

function mainViewRequestOrchestrator.observeType(p5, p6) --[[ line: 83 ]]
	-- upvalues: requestOrchestratorDataModule (ref)
	local var13 = requestOrchestratorDataModule.observeType(p5.model, p6)
	
	if var13 then
		local t = {}
		
		for i, v in pairs(p5.state.selectedTypes) do
			t[i] = v
		end
		local var15 = t
		var15[var13] = true
		p5:setState({ selectedTypes = var15 })
	end
end

function mainViewRequestOrchestrator.didMount(p7) --[[ line: 92 ]]
	-- upvalues: requestOrchestratorDataModule (ref), t (ref), runService (ref)
	p7:setState({ utilTabHeight = p7.utilRef.current.Size.Y.Offset })
	local requestOrchestratorService = game:GetService("RequestOrchestratorService")
	local ok, status = pcall(function() --[[ line: 101 ]]
		-- upvalues: requestOrchestratorService (ref)
		return requestOrchestratorService:GetRegisteredOrchestrators()
	end)
	
	if ok and status then
		local var17 = requestOrchestratorDataModule.observeTypes(p7.model, status)
		
		if #var17 > 0 then
			local t_1 = {}
			
			for i, v in pairs(p7.state.selectedTypes) do
				t_1[i] = v
			end
			local var19 = t_1
			
			for i_1, v_1 in ipairs(var17) do
				var19[v_1] = true
			end
			p7:setState({ selectedTypes = var19 })
		end
	end
	for i, v in pairs(t) do
		p7.connections[i] = requestOrchestratorService[i]:Connect(function(p8) --[[ line: 116 ]]
			-- upvalues: p7 (ref), v (ref)
			local orchestratorType = p8.orchestratorType or "Unknown"
			p7:observeType(orchestratorType)
			
			for i, v_1 in ipairs(v) do
				v_1(p7.model, orchestratorType, p8)
			end
			p7:setState({})
		end)
	end
	p7.connections.heartbeat = runService.Heartbeat:Connect(function() --[[ line: 127 ]]
		-- upvalues: requestOrchestratorDataModule (copy), p7 (ref)
		requestOrchestratorDataModule.advanceTime(p7.model)
		p7:setState({})
	end)
end

function mainViewRequestOrchestrator.willUnmount(p9) --[[ line: 133 ]]
	for i, v in pairs(p9.connections) do
		v:Disconnect()
	end
	p9.connections = {}
end

function mainViewRequestOrchestrator.didUpdate(p10) --[[ line: 140 ]]
	local offset = p10.utilRef.current.Size.Y.Offset
	
	if offset ~= p10.state.utilTabHeight then
		p10:setState({ utilTabHeight = offset })
	end
end

function mainViewRequestOrchestrator.render(p11) --[[ line: 147 ]]
	-- upvalues: roactModule (ref), mainRowPadding (ref), utilAndTabModule (ref), makeLabel (ref), dropDownModule (ref), orchestratorRowModule (ref), constantsModule (ref)
	local size = p11.props.size
	local formFactor = p11.props.formFactor
	local tabList = p11.props.tabList
	local utilTabHeight = p11.state.utilTabHeight
	local selectedTypes = p11.state.selectedTypes
	local allTypes = p11.model.allTypes
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
			refForParent = p11.utilRef,
			onHeightChanged = p11.onUtilTabHeightChanged
		})
	}
	
	if utilTabHeight > 0 then
		local var22 = 0
		local var23 = nil
		
		for i, v in ipairs(allTypes) do
			if selectedTypes[i] then
				var22 += 1
				var23 = v
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
				onToggle = p11.onTypeToggle,
				summaryText = if #allTypes == 0 then "(waiting for traffic)" elseif var22 == 0 then "(none)" elseif var22 == 1 then var23 elseif var22 == #allTypes then string.format("All (%d)", var22) else string.format("%d selected", var22)
			})
		})
		
		for i_1, v_1 in ipairs(allTypes) do
			if selectedTypes[i_1] then
				t["Row_" .. v_1] = roactModule.createElement(orchestratorRowModule, {
					orchestratorType = v_1,
					batches = p11.model.batchesByType[v_1] or {},
					queue = p11.model.queues[v_1],
					cache = p11.model.cacheByType[v_1],
					observedMaxBatchSize = p11.model.observedMaxByType[v_1],
					panelWidth = size.X.Offset,
					now = p11.model.now,
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