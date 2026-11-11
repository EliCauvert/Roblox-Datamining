local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local DataConsumerModule = require(script.Parent.Parent.Components.DataConsumer)
local SetActiveTabModule = require(script.Parent.Parent.Actions.SetActiveTab)
local ConstantsModule = require(script.Parent.Parent.Constants)
local MsgTypeNamesOrdered = ConstantsModule.MsgTypeNamesOrdered
local TopBar = ConstantsModule.DefaultFontSize.TopBar
local Text = ConstantsModule.Color.Text
local TopBar1 = ConstantsModule.Font.TopBar
local _UDim2 = UDim2.new(0, TopBar, 0, TopBar)
local ClientMemTextSize = TextService:GetTextSize("Client Mem:", TopBar, TopBar1, Vector2.new(0, 0))
local ClientMemoryUsageTextSize = TextService:GetTextSize("Client Memory Usage:", TopBar, TopBar1, Vector2.new(0, 0))
local AvgDataPingTextSize = TextService:GetTextSize("Avg. Data Ping:", TopBar, TopBar1, Vector2.new(0, 0))
local LiveUpdateElement = RoactModule.PureComponent:extend("LiveUpdateElement")

function LiveUpdateElement.didMount(p1)
	p1.totalMemConnector = p1.props.ClientMemoryData:totalMemSignal():Connect(function(TotalClientMemory)
		-- upvalues: p1 (copy)
		p1:setState({ totalClientMemory = TotalClientMemory })
	end)
	p1.avgPingConnector = p1.props.ServerStatsData:avgPing():Connect(function(AveragePing)
		-- upvalues: p1 (copy)
		p1:setState({ averagePing = AveragePing })
	end)
	p1.logWarningErrorConnector = p1.props.ClientLogData:errorWarningSignal():Connect(function(NumErrors, NumWarnings)
		-- upvalues: p1 (copy)
		p1:setState({ numErrors = NumErrors, numWarnings = NumWarnings })
	end)
	p1:doSizeCheck()
end

function LiveUpdateElement.didUpdate(p1)
	p1:doSizeCheck()
end

function LiveUpdateElement.doSizeCheck(p1)
	if p1.ref.current then
		local IsFormFactorThresholdAbove = p1.state.formFactorThreshold > p1.ref.current.AbsoluteSize.X
		
		if IsFormFactorThresholdAbove ~= p1.state.isSmallerThanFormFactorThreshold then
			p1:setState({
				isSmallerThanFormFactorThreshold = IsFormFactorThresholdAbove
			})
		end
	end
end

function LiveUpdateElement.willUnmount(p1)
	p1.totalMemConnector:Disconnect()
	p1.totalMemConnector = nil
	p1.avgPingConnector:Disconnect()
	p1.avgPingConnector = nil
	p1.logWarningErrorConnector:Disconnect()
	p1.logWarningErrorConnector = nil
end

function LiveUpdateElement.init(p1)
	-- upvalues: MsgTypeNamesOrdered (copy), RoactModule (copy)
	local ErrorWarningCount, ErrorWarningCount2 = p1.props.ClientLogData:getErrorWarningCount()
	
	function p1.onLogWarningButton()
		-- upvalues: MsgTypeNamesOrdered (upval), p1 (copy)
		local t = {}
		
		for _, value in pairs(MsgTypeNamesOrdered) do
			t[value] = false
		end
		t.Warning = true
		p1.props.ClientLogData:setFilters(t)
		p1.props.dispatchChangeTabClientLog()
	end
	
	function p1.onLogErrorButton()
		-- upvalues: MsgTypeNamesOrdered (upval), p1 (copy)
		local t = {}
		
		for _, value in pairs(MsgTypeNamesOrdered) do
			t[value] = false
		end
		t.Error = true
		p1.props.ClientLogData:setFilters(t)
		p1.props.dispatchChangeTabClientLog()
	end
	
	p1.ref = RoactModule.createRef()
	p1.state = {
		totalClientMemory = 0,
		averagePing = 0,
		formFactorThreshold = 380,
		isSmallerThanFormFactorThreshold = false,
		numErrors = ErrorWarningCount,
		numWarnings = ErrorWarningCount2
	}
end

function LiveUpdateElement.render(p2)
	-- upvalues: ClientMemoryUsageTextSize (copy), ConstantsModule (copy), ClientMemTextSize (copy), TextService (copy), TopBar (copy), TopBar1 (copy), AvgDataPingTextSize (copy), RoactModule (copy), _UDim2 (copy), Text (copy)
	local Size = p2.props.size
	local Position = p2.props.position
	local FormFactor = p2.props.formFactor
	local NumErrors = p2.state.numErrors
	local NumWarnings = p2.state.numWarnings
	local TotalClientMemory = p2.state.totalClientMemory
	local AveragePing: number = p2.state.averagePing
	local IsSmallerThanFormFactorThreshold = p2.state.isSmallerThanFormFactorThreshold
	local Flag = false
	local X = ClientMemoryUsageTextSize.X
	local Center = Enum.HorizontalAlignment.Center
	
	if FormFactor == ConstantsModule.FormFactor.Small or IsSmallerThanFormFactorThreshold then
		Position += UDim2.new(0, 12, 0, 0)
		X = ClientMemTextSize.X
		Flag = true
		Center = Enum.HorizontalAlignment.Left
	end
	local Formatted = string.format("%d", NumErrors)
	local TextSize = TextService:GetTextSize(Formatted, TopBar, TopBar1, Vector2.new(0, 0))
	local Formatted1 = string.format("%d", NumWarnings)
	local TextSize1 = TextService:GetTextSize(Formatted1, TopBar, TopBar1, Vector2.new(0, 0))
	local Formatted2 = string.format("%d MB", TotalClientMemory)
	local TextSize2 = TextService:GetTextSize(Formatted2, TopBar, TopBar1, Vector2.new(0, 0))
	local Formatted3 = string.format("%d ms", AveragePing)
	local TextSize3 = TextService:GetTextSize(Formatted3, TopBar, TopBar1, Vector2.new(0, 0))
	
	if FormFactor == ConstantsModule.FormFactor.Small or IsSmallerThanFormFactorThreshold then
		Position += UDim2.new(0, 12, 0, 0)
		X = ClientMemTextSize.X
		Flag = true
		Center = Enum.HorizontalAlignment.Left
	end
	local IsAveragePingAbove = AveragePing > 0
	
	return RoactModule.createElement("Frame", {
		Position = Position,
		Size = Size,
		BackgroundTransparency = 1,
		[RoactModule.Ref] = p2.ref
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 6),
			HorizontalAlignment = Center,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		LogErrorIcon = RoactModule.createElement("ImageButton", {
			Image = ConstantsModule.Image.Error,
			Size = _UDim2,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			[RoactModule.Event.Activated] = p2.onLogErrorButton
		}),
		LogErrorCount = RoactModule.createElement("TextButton", {
			Text = Formatted,
			TextSize = TopBar,
			TextColor3 = Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = TopBar1,
			Size = UDim2.new(0, TextSize.X, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			[RoactModule.Event.Activated] = p2.onLogErrorButton
		}),
		ErrorWarningPad = RoactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = 3 }),
		LogWarningIcon = RoactModule.createElement("ImageButton", {
			Image = ConstantsModule.Image.Warning,
			Size = _UDim2,
			BackgroundTransparency = 1,
			LayoutOrder = 4,
			[RoactModule.Event.Activated] = p2.onLogWarningButton
		}),
		LogWarningCount = RoactModule.createElement("TextButton", {
			Text = Formatted1,
			TextSize = TopBar,
			TextColor3 = Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = TopBar1,
			Size = UDim2.new(0, TextSize1.X, 1, 0),
			BackgroundTransparency = 9,
			LayoutOrder = 5,
			[RoactModule.Event.Activated] = p2.onLogWarningButton
		}),
		WarningMemoryPad = RoactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = 6 }),
		MemoryUsage = RoactModule.createElement("TextButton", {
			Text = if Flag then "Client Mem:" else "Client Memory Usage:",
			TextSize = TopBar,
			TextColor3 = ConstantsModule.Color.WarningYellow,
			TextXAlignment = Enum.TextXAlignment.Right,
			Font = TopBar1,
			Size = UDim2.new(0, X, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 7,
			[RoactModule.Event.Activated] = p2.props.dispatchChangeTabClientMemory
		}),
		MemoryUsage_MB = RoactModule.createElement("TextButton", {
			Text = Formatted2,
			TextSize = TopBar,
			TextColor3 = Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = TopBar1,
			Size = UDim2.new(0, TextSize2.X, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 8,
			[RoactModule.Event.Activated] = p2.props.dispatchChangeTabClientMemory
		}),
		MemoryPingPad = RoactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = 9 }),
		AvgPing = not Flag and (IsAveragePingAbove and RoactModule.createElement("TextButton", {
			Text = "Avg. Data Ping:",
			TextSize = TopBar,
			TextColor3 = ConstantsModule.Color.WarningYellow,
			TextXAlignment = Enum.TextXAlignment.Right,
			Font = TopBar1,
			Size = UDim2.new(0, AvgDataPingTextSize.X, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 10,
			[RoactModule.Event.Activated] = p2.props.dispatchChangeTabNetworkPing
		})),
		AvgPing_ms = not Flag and (IsAveragePingAbove and RoactModule.createElement("TextButton", {
			Text = Formatted3,
			TextSize = TopBar,
			TextColor3 = Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = TopBar1,
			Size = UDim2.new(0, TextSize3.X, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 11,
			[RoactModule.Event.Activated] = p2.props.dispatchChangeTabNetworkPing
		}))
	})
end

return RoactRoduxModule.UNSTABLE_connect2(nil, function(Callback)
	-- upvalues: SetActiveTabModule (copy)
	return {
		dispatchChangeTabClientLog = function()
			-- upvalues: Callback (copy), SetActiveTabModule (upval)
			Callback(SetActiveTabModule("Log", true))
		end,
		dispatchChangeTabClientMemory = function()
			-- upvalues: Callback (copy), SetActiveTabModule (upval)
			Callback(SetActiveTabModule("Memory", true))
		end,
		dispatchChangeTabNetworkPing = function()
			-- upvalues: Callback (copy), SetActiveTabModule (upval)
			Callback(SetActiveTabModule("ServerStats", true))
		end
	}
end)(DataConsumerModule(LiveUpdateElement, "ServerStatsData", "ClientMemoryData", "ClientLogData"))