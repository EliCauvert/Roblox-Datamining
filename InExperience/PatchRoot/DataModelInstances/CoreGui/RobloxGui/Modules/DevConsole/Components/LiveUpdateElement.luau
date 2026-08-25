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
local var8 = textService:GetTextSize("Client Mem:", topBar, topBar_1, Vector2.new(0, 0))
local var9 = textService:GetTextSize("Client Memory Usage:", topBar, topBar_1, Vector2.new(0, 0))
local var10 = textService:GetTextSize("Avg. Data Ping:", topBar, topBar_1, Vector2.new(0, 0))
local liveUpdateElement = roactModule.PureComponent:extend("LiveUpdateElement")

function liveUpdateElement.didMount(p0)
	p0.totalMemConnector = p0.props.ClientMemoryData:totalMemSignal():Connect(function(p1)
		-- upvalues: p0 (ref)
		p0:setState({ totalClientMemory = p1 })
	end)
	p0.avgPingConnector = p0.props.ServerStatsData:avgPing():Connect(function(p2)
		-- upvalues: p0 (ref)
		p0:setState({ averagePing = p2 })
	end)
	p0.logWarningErrorConnector = p0.props.ClientLogData:errorWarningSignal():Connect(function(p3, p4)
		-- upvalues: p0 (ref)
		p0:setState({ numErrors = p3, numWarnings = p4 })
	end)
	p0:doSizeCheck()
end

function liveUpdateElement.didUpdate(p5)
	p5:doSizeCheck()
end

function liveUpdateElement.doSizeCheck(p6)
	if p6.ref.current then
		local var12 = p6.ref.current.AbsoluteSize.X < p6.state.formFactorThreshold
		
		if var12 ~= p6.state.isSmallerThanFormFactorThreshold then
			p6:setState({ isSmallerThanFormFactorThreshold = var12 })
		end
	end
end

function liveUpdateElement.willUnmount(p7)
	p7.totalMemConnector:Disconnect()
	p7.totalMemConnector = nil
	p7.avgPingConnector:Disconnect()
	p7.avgPingConnector = nil
	p7.logWarningErrorConnector:Disconnect()
	p7.logWarningErrorConnector = nil
end

function liveUpdateElement.init(p8)
	-- upvalues: msgTypeNamesOrdered (ref), roactModule (ref)
	local errorWarningCount, errorWarningCount_1 = p8.props.ClientLogData:getErrorWarningCount()
	
	function p8.onLogWarningButton()
		-- upvalues: msgTypeNamesOrdered (copy), p8 (ref)
		local t = {}
		
		for i, v in pairs(msgTypeNamesOrdered) do
			t[v] = false
		end
		t.Warning = true
		p8.props.ClientLogData:setFilters(t)
		p8.props.dispatchChangeTabClientLog()
	end
	
	function p8.onLogErrorButton()
		-- upvalues: msgTypeNamesOrdered (copy), p8 (ref)
		local t = {}
		
		for i, v in pairs(msgTypeNamesOrdered) do
			t[v] = false
		end
		t.Error = true
		p8.props.ClientLogData:setFilters(t)
		p8.props.dispatchChangeTabClientLog()
	end
	
	p8.ref = roactModule.createRef()
	p8.state = {
		totalClientMemory = 0,
		averagePing = 0,
		formFactorThreshold = 380,
		isSmallerThanFormFactorThreshold = false,
		numErrors = errorWarningCount,
		numWarnings = errorWarningCount_1
	}
end

function liveUpdateElement.render(p9)
	-- upvalues: var9 (ref), constantsModule (ref), var8 (ref), textService (ref), topBar (ref), topBar_1 (ref), var10 (ref), roactModule (ref), uDim2 (ref), text (ref)
	local size = p9.props.size
	local position = p9.props.position
	local formFactor = p9.props.formFactor
	local numErrors = p9.state.numErrors
	local numWarnings = p9.state.numWarnings
	local totalClientMemory = p9.state.totalClientMemory
	local averagePing = p9.state.averagePing
	local isSmallerThanFormFactorThreshold = p9.state.isSmallerThanFormFactorThreshold
	local var17 = false
	local x = var9.X
	local center = Enum.HorizontalAlignment.Center
	
	if formFactor == constantsModule.FormFactor.Small or isSmallerThanFormFactorThreshold then
		position += UDim2.new(0, 12, 0, 0)
		x = var8.X
		var17 = true
		center = Enum.HorizontalAlignment.Left
	end
	local formattedText = string.format("%d", numErrors)
	local var19 = textService:GetTextSize(formattedText, topBar, topBar_1, Vector2.new(0, 0))
	local formattedText_1 = string.format("%d", numWarnings)
	local var21 = textService:GetTextSize(formattedText_1, topBar, topBar_1, Vector2.new(0, 0))
	local formattedText_2 = string.format("%d MB", totalClientMemory)
	local var23 = textService:GetTextSize(formattedText_2, topBar, topBar_1, Vector2.new(0, 0))
	local formattedText_3 = string.format("%d ms", averagePing)
	local var25 = textService:GetTextSize(formattedText_3, topBar, topBar_1, Vector2.new(0, 0))
	
	if formFactor == constantsModule.FormFactor.Small or isSmallerThanFormFactorThreshold then
		position += UDim2.new(0, 12, 0, 0)
		x = var8.X
		var17 = true
		center = Enum.HorizontalAlignment.Left
	end
	local var26 = averagePing > 0
	
	return roactModule.createElement("Frame", {
		Position = position,
		Size = size,
		BackgroundTransparency = 1,
		[roactModule.Ref] = p9.ref
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
			[roactModule.Event.Activated] = p9.onLogErrorButton
		}),
		LogErrorCount = roactModule.createElement("TextButton", {
			Text = formattedText,
			TextSize = topBar,
			TextColor3 = text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = topBar_1,
			Size = UDim2.new(0, var19.X, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			[roactModule.Event.Activated] = p9.onLogErrorButton
		}),
		ErrorWarningPad = roactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = 3 }),
		LogWarningIcon = roactModule.createElement("ImageButton", {
			Image = constantsModule.Image.Warning,
			Size = uDim2,
			BackgroundTransparency = 1,
			LayoutOrder = 4,
			[roactModule.Event.Activated] = p9.onLogWarningButton
		}),
		LogWarningCount = roactModule.createElement("TextButton", {
			Text = formattedText_1,
			TextSize = topBar,
			TextColor3 = text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = topBar_1,
			Size = UDim2.new(0, var21.X, 1, 0),
			BackgroundTransparency = 9,
			LayoutOrder = 5,
			[roactModule.Event.Activated] = p9.onLogWarningButton
		}),
		WarningMemoryPad = roactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = 6 }),
		MemoryUsage = roactModule.createElement("TextButton", {
			Text = if var17 then "Client Mem:" else "Client Memory Usage:",
			TextSize = topBar,
			TextColor3 = constantsModule.Color.WarningYellow,
			TextXAlignment = Enum.TextXAlignment.Right,
			Font = topBar_1,
			Size = UDim2.new(0, x, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 7,
			[roactModule.Event.Activated] = p9.props.dispatchChangeTabClientMemory
		}),
		MemoryUsage_MB = roactModule.createElement("TextButton", {
			Text = formattedText_2,
			TextSize = topBar,
			TextColor3 = text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = topBar_1,
			Size = UDim2.new(0, var23.X, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 8,
			[roactModule.Event.Activated] = p9.props.dispatchChangeTabClientMemory
		}),
		MemoryPingPad = roactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = 9 }),
		AvgPing = not var17 and (var26 and roactModule.createElement("TextButton", {
			Text = "Avg. Data Ping:",
			TextSize = topBar,
			TextColor3 = constantsModule.Color.WarningYellow,
			TextXAlignment = Enum.TextXAlignment.Right,
			Font = topBar_1,
			Size = UDim2.new(0, var10.X, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 10,
			[roactModule.Event.Activated] = p9.props.dispatchChangeTabNetworkPing
		})),
		AvgPing_ms = not var17 and (var26 and roactModule.createElement("TextButton", {
			Text = formattedText_3,
			TextSize = topBar,
			TextColor3 = text,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = topBar_1,
			Size = UDim2.new(0, var25.X, 1, 0),
			BackgroundTransparency = 1,
			LayoutOrder = 11,
			[roactModule.Event.Activated] = p9.props.dispatchChangeTabNetworkPing
		}))
	})
end

return roactRoduxModule.UNSTABLE_connect2(nil, function(p10)
	-- upvalues: setActiveTabModule (ref)
	return {
		dispatchChangeTabClientLog = function()
			-- upvalues: p10 (ref), setActiveTabModule (copy)
			p10(setActiveTabModule("Log", true))
		end,
		dispatchChangeTabClientMemory = function()
			-- upvalues: p10 (ref), setActiveTabModule (copy)
			p10(setActiveTabModule("Memory", true))
		end,
		dispatchChangeTabNetworkPing = function()
			-- upvalues: p10 (ref), setActiveTabModule (copy)
			p10(setActiveTabModule("ServerStats", true))
		end
	}
end)(dataConsumerModule(liveUpdateElement, "ServerStatsData", "ClientMemoryData", "ClientLogData"))