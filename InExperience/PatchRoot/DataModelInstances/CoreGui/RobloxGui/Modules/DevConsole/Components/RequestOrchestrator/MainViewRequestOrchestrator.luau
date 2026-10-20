local RunService = game:GetService("RunService")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Parent = script.Parent.Parent
local UtilAndTabModule = require(Parent.UtilAndTab)
local DropDownModule = require(Parent.DropDown)
local OrchestratorRowModule = require(script.Parent.OrchestratorRow)
local RequestOrchestratorDataModule = require(script.Parent.RequestOrchestratorData)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local Mono = ConstantsModule.Font.Mono
local _Color3 = Color3.fromRGB(220, 220, 220)
local config = {
	BatchCreated = {
		RequestOrchestratorDataModule.registerBatch,
		RequestOrchestratorDataModule.trackQueueOnCreated
	},
	BatchSent = {
		RequestOrchestratorDataModule.openSendAttempt,
		RequestOrchestratorDataModule.drainQueueOnSent
	},
	BatchResponseReceived = { RequestOrchestratorDataModule.settleBatch },
	BatchRetrying = {
		RequestOrchestratorDataModule.reclassifyOnRetry,
		RequestOrchestratorDataModule.requeueRetryOps
	},
	BatchExhausted = {
		RequestOrchestratorDataModule.markExhausted,
		RequestOrchestratorDataModule.clearQueueOnExhausted
	},
	OperationEnqueued = { RequestOrchestratorDataModule.enqueueOperation },
	CacheItemAdded = { RequestOrchestratorDataModule.recordCacheItemAdded },
	CacheHit = { RequestOrchestratorDataModule.recordCacheHit }
}

local function makeLabel(Text, LayoutOrder)
	-- upvalues: RoactModule (copy), _Color3 (copy), Mono (copy)
	return RoactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextSize = 11,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 22),
		Text = Text,
		TextColor3 = _Color3,
		Font = Mono,
		TextXAlignment = Enum.TextXAlignment.Left,
		LayoutOrder = LayoutOrder
	})
end

local function _(List)
	local t = {}
	
	for i, value in pairs(List) do
		t[i] = value
	end
	return t
end

local MainViewRequestOrchestrator = RoactModule.Component:extend("MainViewRequestOrchestrator")

function MainViewRequestOrchestrator.init(p1)
	-- upvalues: RequestOrchestratorDataModule (copy), RoactModule (copy)
	p1.model = RequestOrchestratorDataModule.new()
	p1.connections = {}
	p1.utilRef = RoactModule.createRef()
	
	function p1.onUtilTabHeightChanged(UtilTabHeight)
		-- upvalues: p1 (copy)
		p1:setState({ utilTabHeight = UtilTabHeight })
	end
	
	function p1.onTypeToggle(Key)
		-- upvalues: p1 (copy)
		local SelectedTypes = {}
		
		for i, selectedType in pairs(p1.state.selectedTypes) do
			SelectedTypes[i] = selectedType
		end
		SelectedTypes[Key] = not SelectedTypes[Key] or nil
		p1:setState({ selectedTypes = SelectedTypes })
	end
	
	p1.state = { utilTabHeight = 0, selectedTypes = {} }
end

function MainViewRequestOrchestrator.observeType(Model, OrchestratorType)
	-- upvalues: RequestOrchestratorDataModule (copy)
	local ObserveTypeResult = RequestOrchestratorDataModule.observeType(Model.model, OrchestratorType)
	
	if ObserveTypeResult then
		local SelectedTypes = {}
		
		for i, selectedType in pairs(Model.state.selectedTypes) do
			SelectedTypes[i] = selectedType
		end
		SelectedTypes[ObserveTypeResult] = true
		Model:setState({ selectedTypes = SelectedTypes })
	end
end

function MainViewRequestOrchestrator.didMount(p2)
	-- upvalues: RequestOrchestratorDataModule (copy), config (copy), RunService (copy)
	p2:setState({ utilTabHeight = p2.utilRef.current.Size.Y.Offset })
	local RequestOrchestratorService = game:GetService("RequestOrchestratorService")
	local Success, Result = pcall(function()
		-- upvalues: RequestOrchestratorService (copy)
		return RequestOrchestratorService:GetRegisteredOrchestrators()
	end)
	
	if Success and Result then
		local ObserveTypesResult = RequestOrchestratorDataModule.observeTypes(p2.model, Result)
		
		if #ObserveTypesResult > 0 then
			local SelectedTypes = {}
			
			for i, selectedType in pairs(p2.state.selectedTypes) do
				SelectedTypes[i] = selectedType
			end
			for _, value in ipairs(ObserveTypesResult) do
				SelectedTypes[value] = true
			end
			p2:setState({ selectedTypes = SelectedTypes })
		end
	end
	for i1, value1 in pairs(config) do
		p2.connections[i1] = RequestOrchestratorService[i1]:Connect(function(p3)
			-- upvalues: p2 (copy), value1 (copy)
			local OrchestratorType = p3.orchestratorType or "Unknown"
			p2:observeType(OrchestratorType)
			
			for _, value in ipairs(value1) do
				value(p2.model, OrchestratorType, p3)
			end
			p2:setState({})
		end)
	end
	p2.connections.heartbeat = RunService.Heartbeat:Connect(function()
		-- upvalues: RequestOrchestratorDataModule (upval), p2 (copy)
		RequestOrchestratorDataModule.advanceTime(p2.model)
		p2:setState({})
	end)
end

function MainViewRequestOrchestrator.willUnmount(p3)
	for _, connection in pairs(p3.connections) do
		connection:Disconnect()
	end
	p3.connections = {}
end

function MainViewRequestOrchestrator.didUpdate(p4)
	local Offset = p4.utilRef.current.Size.Y.Offset
	
	if Offset ~= p4.state.utilTabHeight then
		p4:setState({ utilTabHeight = Offset })
	end
end

function MainViewRequestOrchestrator.render(p4)
	-- upvalues: RoactModule (copy), MainRowPadding (copy), UtilAndTabModule (copy), makeLabel (copy), DropDownModule (copy), OrchestratorRowModule (copy), ConstantsModule (copy)
	local Size = p4.props.size
	local SelectedTypes = p4.state.selectedTypes
	local AllTypes = p4.model.allTypes
	local config = {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, MainRowPadding)
		}),
		UtilAndTab = RoactModule.createElement(UtilAndTabModule, {
			layoutOrder = 1,
			windowWidth = Size.X.Offset,
			formFactor = p4.props.formFactor,
			tabList = p4.props.tabList,
			refForParent = p4.utilRef,
			onHeightChanged = p4.onUtilTabHeightChanged
		})
	}
	
	if p4.state.utilTabHeight > 0 then
		local Count = 0
		local v1 = nil
		
		for i, allType in ipairs(AllTypes) do
			if SelectedTypes[i] then
				Count += 1
				v1 = allType
			end
		end
		config.Controls = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 24)
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4),
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			ShowLabel = makeLabel("Show", 1),
			TypeDropDown = RoactModule.createElement(DropDownModule, {
				layoutOrder = 2,
				buttonSize = UDim2.new(0, 220, 0, 22),
				dropDownList = AllTypes,
				selectedSet = SelectedTypes,
				onToggle = p4.onTypeToggle,
				summaryText = if #AllTypes == 0 then "(waiting for traffic)" elseif Count == 0 then "(none)" elseif Count == 1 then v1 elseif Count == #AllTypes then string.format("All (%d)", Count) else string.format("%d selected", Count)
			})
		})
		
		for i1, allType1 in ipairs(AllTypes) do
			if SelectedTypes[i1] then
				config["Row_" .. allType1] = RoactModule.createElement(OrchestratorRowModule, {
					orchestratorType = allType1,
					batches = p4.model.batchesByType[allType1] or {},
					queue = p4.model.queues[allType1],
					cache = p4.model.cacheByType[allType1],
					observedMaxBatchSize = p4.model.observedMaxByType[allType1],
					panelWidth = Size.X.Offset,
					now = p4.model.now,
					size = UDim2.new(1, 0, 0, 52),
					layoutOrder = 2 + i1
				})
			end
		end
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 4,
		Size = Size,
		BackgroundColor3 = ConstantsModule.Color.BaseGray
	}, config)
end

return MainViewRequestOrchestrator