local corePackagesService = game:GetService("CorePackages")
local textService = game:GetService("TextService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local dataConsumerModule = require(script.Parent.Parent.Components.DataConsumer)
local setActiveTabModule = require(script.Parent.Parent.Actions.SetActiveTab)
local constantsModule = require(script.Parent.Parent.Constants)
local msgTypeNamesOrdered = constantsModule.MsgTypeNamesOrdered
local topBar = constantsModule.DefaultFontSize.TopBar
local text = constantsModule.Color.Text
local topBar_1 = constantsModule.Font.TopBar
local uDim2 = UDim2.new(0, topBar, 0, topBar)
local var1 = textService:GetTextSize("Client Mem:", topBar, topBar_1, Vector2.new(0, 0))
local var2 = textService:GetTextSize("Client Memory Usage:", topBar, topBar_1, Vector2.new(0, 0))
local var3 = textService:GetTextSize("Avg. Data Ping:", topBar, topBar_1, Vector2.new(0, 0))
local liveUpdateElement = roactModule.PureComponent:extend("LiveUpdateElement")

function liveUpdateElement.didMount(p1)
	p1.totalMemConnector = p1.props.ClientMemoryData:totalMemSignal():Connect(function(p2)
		-- upvalues: p1 (ref)
		p1:setState({ totalClientMemory = p2 })
	end)
	p1.avgPingConnector = p1.props.ServerStatsData:avgPing():Connect(function(p2)
		-- upvalues: p1 (ref)
		p1:setState({ averagePing = p2 })
	end)
	p1.logWarningErrorConnector = p1.props.ClientLogData:errorWarningSignal():Connect(function(p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({ numErrors = p2, numWarnings = p3 })
	end)
	p1:doSizeCheck()
end

function liveUpdateElement.didUpdate(p1)
	p1:doSizeCheck()
end

function liveUpdateElement.doSizeCheck(p1)
	if p1.ref.current then
		local var4 = p1.ref.current.AbsoluteSize.X < p1.state.formFactorThreshold
		
		if var4 ~= p1.state.isSmallerThanFormFactorThreshold then
			p1:setState({ isSmallerThanFormFactorThreshold = var4 })
		end
	end
end

function liveUpdateElement.willUnmount(p1)
	p1.totalMemConnector:Disconnect()
	p1.totalMemConnector = nil
	p1.avgPingConnector:Disconnect()
	p1.avgPingConnector = nil
	p1.logWarningErrorConnector:Disconnect()
	p1.logWarningErrorConnector = nil
end

function liveUpdateElement.init(p1)
	-- upvalues: msgTypeNamesOrdered (ref), roactModule (ref)
	local errorWarningCount, errorWarningCount_1 = p1.props.ClientLogData:getErrorWarningCount()
	
	function p8.onLogWarningButton()
		-- upvalues: msgTypeNamesOrdered (copy), p1 (ref)
		local t = {}
		
		for i, v in pairs(msgTypeNamesOrdered) do
			t[v] = false
		end
		t.Warning = true
		p1.props.ClientLogData:setFilters(t)
		p1.props.dispatchChangeTabClientLog()
	end
	
	function p8.onLogErrorButton()
		-- upvalues: msgTypeNamesOrdered (copy), p1 (ref)
		local t = {}
		
		for i, v in pairs(msgTypeNamesOrdered) do
			t[v] = false
		end
		t.Error = true
		p1.props.ClientLogData:setFilters(t)
		p1.props.dispatchChangeTabClientLog()
	end
	
	p1.ref = roactModule.createRef()
	p1.state = {
		totalClientMemory = 0,
		averagePing = 0,
		formFactorThreshold = 380,
		isSmallerThanFormFactorThreshold = false,
		numErrors = errorWarningCount,
		numWarnings = errorWarningCount_1
	}
end

function liveUpdateElement.render(p2)
	-- upvalues: var2 (ref), constantsModule (ref), var1 (ref), textService (ref), topBar (ref), topBar_1 (ref), var3 (ref), roactModule (ref), uDim2 (ref), text (ref)
	local size = p2.props.size
	local position = p2.props.position
	local formFactor = p2.props.formFactor
	local numErrors = p2.state.numErrors
	local numWarnings = p2.state.numWarnings
	local totalClientMemory = p2.state.totalClientMemory
	local averagePing = p2.state.averagePing
	local isSmallerThanFormFactorThreshold = p2.state.isSmallerThanFormFactorThreshold
	local var4 = false
	local x = var2.X
	local center = Enum.HorizontalAlignment.Center
	
	if formFactor == constantsModule.FormFactor.Small or isSmallerThanFormFactorThreshold then
		position += UDim2.new(0, 12, 0, 0)
		x = var1.X
		var4 = true
		center = Enum.HorizontalAlignment.Left
	end
	local formattedText = string.format("%d", numErrors)
	local var5 = textService:GetTextSize(formattedText, topBar, topBar_1, Vector2.new(0, 0))
	local formattedText_1 = string.format("%d", numWarnings)
	local var6 = textService:GetTextSize(formattedText_1, topBar, topBar_1, Vector2.new(0, 0))
	local formattedText_2 = string.format("%d MB", totalClientMemory)
	local var7 = textService:GetTextSize(formattedText_2, topBar, topBar_1, Vector2.new(0, 0))
	local formattedText_3 = string.format("%d ms", averagePing)
	local var8 = textService:GetTextSize(formattedText_3, topBar, topBar_1, Vector2.new(0, 0))
	
	if formFactor == constantsModule.FormFactor.Small or isSmallerThanFormFactorThreshold then
		position += UDim2.new(0, 12, 0, 0)
		x = var1.X
		var4 = true
		center = Enum.HorizontalAlignment.Left
	end
	local var9 = averagePing > 0
	
	return roactModule.createElement("Frame", {
		Position = position,
		Size = size,
		BackgroundTransparency = 1,
		[roactModule.Ref] = p2.ref
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 6),
			HorizontalAlignment = center,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		LogErrorIcon = roactModule.createElement("ImageButton", {
			Image = constantsModule.Image.Error,
			Size = uDim2,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			[roactModule.Event.Activated] = p2.onLogErrorButton
		}),
		LogErrorCount = roactModule.createElement("TextButton", {
			Text = formattedText,
			TextSize = topBar,
			TextColor3 = text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = topBar_1,
			Size = UDim2.new(0, var5.X, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			[roactModule.Event.Activated] = p2.onLogErrorButton
		}),
		ErrorWarningPad = roactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = 3 }),
		LogWarningIcon = roactModule.createElement("ImageButton", {
			Image = constantsModule.Image.Warning,
			Size = uDim2,
			BackgroundTransparency = 1,
			LayoutOrder = 4,
			[roactModule.Event.Activated] = p2.onLogWarningButton
		}),
		LogWarningCount = roactModule.createElement("TextButton", {
			Text = formattedText_1,
			TextSize = topBar,
			TextColor3 = text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = topBar_1,
			Size = UDim2.new(0, var6.X, 1, 0),
			BackgroundTransparency = 9,
			LayoutOrder = 5,
			[roactModule.Event.Activated] = p2.onLogWarningButton
		}),
		WarningMemoryPad = roactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = 6 }),
		MemoryUsage = roactModule.createElement("TextButton", {
			Text = if var4 then "Client Mem:" else "Client Memory Usage:",
			TextSize = topBar,
			TextColor3 = constantsModule.Color.WarningYellow,
			TextXAlignment = Enum.TextXAlignment.Right,
			Font = topBar_1,
			Size = UDim2.new(0, x, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 7,
			[roactModule.Event.Activated] = p2.props.dispatchChangeTabClientMemory
		}),
		MemoryUsage_MB = roactModule.createElement("TextButton", {
			Text = formattedText_2,
			TextSize = topBar,
			TextColor3 = text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = topBar_1,
			Size = UDim2.new(0, var7.X, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 8,
			[roactModule.Event.Activated] = p2.props.dispatchChangeTabClientMemory
		}),
		MemoryPingPad = roactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = 9 }),
		AvgPing = not var4 and (var9 and roactModule.createElement("TextButton", {
			Text = "Avg. Data Ping:",
			TextSize = topBar,
			TextColor3 = constantsModule.Color.WarningYellow,
			TextXAlignment = Enum.TextXAlignment.Right,
			Font = topBar_1,
			Size = UDim2.new(0, var3.X, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 10,
			[roactModule.Event.Activated] = p2.props.dispatchChangeTabNetworkPing
		})),
		AvgPing_ms = not var4 and (var9 and roactModule.createElement("TextButton", {
			Text = formattedText_3,
			TextSize = topBar,
			TextColor3 = text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = topBar_1,
			Size = UDim2.new(0, var8.X, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 11,
			[roactModule.Event.Activated] = p2.props.dispatchChangeTabNetworkPing
		}))
	})
end

return roactRoduxModule.UNSTABLE_connect2(nil, function(p2)
	-- upvalues: setActiveTabModule (ref)
	return {
		dispatchChangeTabClientLog = function()
			-- upvalues: p2 (ref), setActiveTabModule (copy)
			p2(setActiveTabModule("Log", true))
		end,
		dispatchChangeTabClientMemory = function()
			-- upvalues: p2 (ref), setActiveTabModule (copy)
			p2(setActiveTabModule("Memory", true))
		end,
		dispatchChangeTabNetworkPing = function()
			-- upvalues: p2 (ref), setActiveTabModule (copy)
			p2(setActiveTabModule("ServerStats", true))
		end
	}
end)(dataConsumerModule(liveUpdateElement, "ServerStatsData", "ClientMemoryData", "ClientLogData"))