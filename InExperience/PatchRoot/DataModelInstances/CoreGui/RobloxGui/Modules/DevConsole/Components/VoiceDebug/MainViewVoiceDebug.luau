local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local _ = script.Parent.Parent.Parent.Actions
local components = script.Parent.Parent.Parent.Components
local dataConsumerModule = require(components.DataConsumer)
local lineGraphModule = require(components.LineGraph)
local sparklineModule = require(components.Sparkline)
local mainViewConnectivityPanelModule = require(script.Parent.MainViewConnectivityPanel)
local mainViewSubscriptionsPanelModule = require(script.Parent.MainViewSubscriptionsPanel)
local mainViewRemoteOperationsPanelModule = require(script.Parent.MainViewRemoteOperationsPanel)
local mainViewClientOperationQueuePanelModule = require(script.Parent.MainViewClientOperationQueuePanel)
local collapsibleSectionModule = require(script.Parent.CollapsibleSection)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local lineGraphHeight = constantsModule.GeneralFormatting.LineGraphHeight
local utilAndTabModule = require(components.UtilAndTab)
local t = {
	rttMs = true,
	incomingBitrateKbps = true,
	outgoingBitrateKbps = true,
	incomingJitterMs = true,
	outgoingJitterMs = true,
	jitterBufferDelayMs = true,
	incomingLossPercent = true
}
local list = { "Connection", "Incoming", "Outgoing" }
local convertTimeStampModule = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
local voiceDebugFieldMetaModule = require(script.Parent.VoiceDebugFieldMeta)
local voiceDebugFieldDisplayOrderModule = require(script.Parent.VoiceDebugFieldDisplayOrder)
local getFFlagVoiceDebugConsoleV2Module = require(script.Parent.GetFFlagVoiceDebugConsoleV2)
local freezeToggleModule = require(script.Parent.FreezeToggle)
local list_1 = {
	"incomingBitrateKbps", "outgoingBitrateKbps", "outgoingCodec",
	"incomingLossPercent", "totalConcealmentEvents", "lastPublisherAudioLevelDbov",
	"lastSubscriberAudioLevelDbov"
}
local t_1 = {
	totalConcealmentEvents = true,
	lastPublisherAudioLevelDbov = true,
	lastSubscriberAudioLevelDbov = true
}
local cloned = table.clone(voiceDebugFieldDisplayOrderModule)

for i, v in list_1 do
	table.insert(cloned, v)
end
local function getX(p1)
	return p1.time
end

local function getY(p1)
	return p1.value
end

local function _(p1)
	-- upvalues: voiceDebugFieldMetaModule (ref)
	local unit = voiceDebugFieldMetaModule[p1] and voiceDebugFieldMetaModule[p1].unit
	
	return function(p2)
		-- upvalues: unit (ref)
		return if unit then string.format("%.1f %s", p2, unit) else string.format("%.1f", p2)
	end
end

i = function(p1, p2)
	-- upvalues: voiceDebugFieldMetaModule (ref)
	return voiceDebugFieldMetaModule.getFieldSeverity(p1, p2)
end

local _ = function(p1, p2)
	-- upvalues: constantsModule (ref)
	return if p1 == "error" then constantsModule.Color.ErrorRed elseif p1 == "warn" then constantsModule.Color.WarningYellow elseif p1 == "ok" then constantsModule.Color.HoverGreen else p2
end

local _ = function(p1, p2)
	-- upvalues: t (ref)
	return if t[p1] then string.format("%.2f", p2) else tostring(p2)
end

local function formatValue(p1, p2)
	-- upvalues: voiceDebugFieldMetaModule (ref), t (ref)
	if p2 == nil then
		return "\226\128\148"
	end
	local var1 = voiceDebugFieldMetaModule[p1]
	local unit = var1 and var1.unit
	local var2 = if t[p1] then string.format("%.2f", p2) else tostring(p2)
	
	return if unit then string.format("%s %s", var2, unit) else var2
end

local _ = function(p1, p2)
	local var1 = p1 and string.format("%.1f", p1.max) or "\226\128\148"
	
	return if p2 then string.format("%s \194\183 peak %s%s", p2, var1, p2) else string.format("peak %s", var1)
end

local _ = function(p1, p2)
	return if type(p1) == "number" then string.format("%." .. tostring(p2 or 0) .. "f", p1) else "\226\128\148"
end

local function HealthCard(p1)
	-- upvalues: constantsModule (ref), roactModule (ref)
	local severity = p1.severity
	
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(0, 110, 0, 56),
		BackgroundColor3 = constantsModule.Color.TextBoxGray
	}, {
		Stroke = roactModule.createElement("UIStroke", {
			Thickness = 1,
			Transparency = 0.5,
			Color = constantsModule.Color.BorderGray
		}),
		Padding = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8),
			PaddingTop = UDim.new(0, 6),
			PaddingBottom = UDim.new(0, 6)
		}),
		Layout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		Caption = roactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 14),
			Text = p1.caption,
			Font = constantsModule.Font.MainWindowHeader,
			TextSize = constantsModule.DefaultFontSize.MainWindowHeader,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Value = roactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			TextSize = 18,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20),
			Text = p1.value,
			Font = constantsModule.Font.MainWindowBold,
			TextColor3 = if severity == "error" then constantsModule.Color.ErrorRed elseif severity == "warn" then constantsModule.Color.WarningYellow elseif severity == "ok" then constantsModule.Color.HoverGreen else constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		SubCaption = roactModule.createElement("TextLabel", {
			LayoutOrder = 3,
			TextSize = 11,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 12),
			Text = p1.subCaption or "",
			Font = constantsModule.Font.MainWindow,
			TextColor3 = constantsModule.Color.BorderGray,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	})
end

local mainViewVoiceDebug = roactModule.PureComponent:extend("MainViewVoiceDebug")

function mainViewVoiceDebug.init(p1)
	-- upvalues: roactModule (ref)
	function p17.onUtilTabHeightChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ utilTabHeight = p2 })
	end
	
	function p17.onStatsUpdated(p2)
		-- upvalues: p1 (ref)
		if p1.state.frozen then
			return
		end
		p1:setState({
			stats = p2,
			series = p1.props.VoiceDebugData:getSeries(),
			connectivity = p1.props.VoiceDebugData:getConnectivity(),
			subscriptions = p1.props.VoiceDebugData:getSubscriptions(),
			remoteOperations = p1.props.VoiceDebugData:getRemoteOperations()
		})
	end
	
	function p17.onFreezeToggled()
		-- upvalues: p1 (ref)
		if p1.state.frozen then
			p1:setState({
				frozen = false,
				stats = p1.props.VoiceDebugData:getCurrentData(),
				series = p1.props.VoiceDebugData:getSeries(),
				connectivity = p1.props.VoiceDebugData:getConnectivity(),
				subscriptions = p1.props.VoiceDebugData:getSubscriptions(),
				remoteOperations = p1.props.VoiceDebugData:getRemoteOperations()
			})
			
			return
		end
		p1:setState({
			frozen = true,
			series = p1.props.VoiceDebugData:getSeriesSnapshot()
		})
	end
	
	p1._statsUpdatedConnection = p1.props.VoiceDebugData:Signal():Connect(p1.onStatsUpdated)
	p1.utilRef = roactModule.createRef()
	p1.state = {
		utilTabHeight = 0,
		frozen = false,
		stats = {},
		series = {},
		connectivity = {},
		subscriptions = {},
		remoteOperations = {},
		selectedGraphKeyByGroup = {}
	}
end

function mainViewVoiceDebug.didMount(p1)
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function mainViewVoiceDebug.didUpdate(p1)
	local size = p1.utilRef.current.Size
	
	if size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewVoiceDebug.willUnmount(p1)
	if p1._statsUpdatedConnection then
		p1._statsUpdatedConnection:Disconnect()
		p1._statsUpdatedConnection = nil
	end
end

function mainViewVoiceDebug.onGraphRowClicked(p1, p2)
	-- upvalues: voiceDebugFieldMetaModule (ref)
	local var1 = voiceDebugFieldMetaModule[p2]
	local var2 = if var1 then var1.group else p2
	local cloned = table.clone(p1.state.selectedGraphKeyByGroup)
	
	if cloned[var2] == p2 then
		cloned[var2] = nil
	else
		cloned[var2] = p2
	end
	p1:setState({ selectedGraphKeyByGroup = cloned })
end

function mainViewVoiceDebug.renderHealthStrip(p1)
	-- upvalues: roactModule (ref), mainRowPadding (ref), HealthCard (ref), voiceDebugFieldMetaModule (ref)
	local stats = p1.state.stats
	local series = p1.state.series
	local createElement = roactModule.createElement
	local var1 = "Frame"
	local t = {
		LayoutOrder = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 56)
	}
	local t_1 = {
		Layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, mainRowPadding)
		})
	}
	local createElement_1 = roactModule.createElement
	local t_2 = { layoutOrder = 1, caption = "Round-trip" }
	local rttMs = stats.rttMs
	t_2.value = if type(rttMs) ~= "number" then string.format("%." .. tostring(2) .. "f", rttMs) else "\226\128\148"
	t_2.severity = voiceDebugFieldMetaModule.getFieldSeverity("rttMs", stats.rttMs)
	local rttMs_1 = series.rttMs
	t_2.subCaption = string.format("%s \194\183 peak %s%s", "ms", rttMs_1 and string.format("%.1f", rttMs_1.max) or "\226\128\148", "ms")
	t_1.RoundTrip = createElement_1(HealthCard, t_2)
	local createElement_2 = roactModule.createElement
	local t_3 = { layoutOrder = 2, caption = "Loss in" }
	local incomingLossPercent = stats.incomingLossPercent
	t_3.value = if type(incomingLossPercent) ~= "number" then string.format("%." .. tostring(1) .. "f", incomingLossPercent) else "\226\128\148"
	t_3.severity = voiceDebugFieldMetaModule.getFieldSeverity("incomingLossPercent", stats.incomingLossPercent)
	local incomingLossPercent_1 = series.incomingLossPercent
	t_3.subCaption = string.format("%s \194\183 peak %s%s", "%", incomingLossPercent_1 and string.format("%.1f", incomingLossPercent_1.max) or "\226\128\148", "%")
	t_1.LossIn = createElement_2(HealthCard, t_3)
	local createElement_3 = roactModule.createElement
	local t_4 = { layoutOrder = 3, caption = "Jitter in" }
	local incomingJitterMs = stats.incomingJitterMs
	t_4.value = if type(incomingJitterMs) ~= "number" then string.format("%." .. tostring(2) .. "f", incomingJitterMs) else "\226\128\148"
	t_4.severity = voiceDebugFieldMetaModule.getFieldSeverity("incomingJitterMs", stats.incomingJitterMs)
	local incomingJitterMs_1 = series.incomingJitterMs
	t_4.subCaption = string.format("%s \194\183 peak %s%s", "ms", incomingJitterMs_1 and string.format("%.1f", incomingJitterMs_1.max) or "\226\128\148", "ms")
	t_1.JitterIn = createElement_3(HealthCard, t_4)
	t_1.Streams = roactModule.createElement(HealthCard, {
		layoutOrder = 4,
		caption = "Streams",
		severity = nil,
		subCaption = "in / out",
		value = string.format("%s / %s", tostring(stats.incomingStreams or "\226\128\148"), tostring(stats.outgoingStreams or "\226\128\148"))
	})
	
	return createElement(var1, t, t_1)
end

local function buildStatRow(p1, p2, p3, p4)
	-- upvalues: voiceDebugFieldMetaModule (ref), getFFlagVoiceDebugConsoleV2Module (ref), constantsModule (ref), roactModule (ref), t (ref), sparklineModule (ref), getY (ref), formatValue (ref)
	local var1 = voiceDebugFieldMetaModule[p2]
	local var2 = if var1 then var1.label else p2
	
	if not getFFlagVoiceDebugConsoleV2Module() then
		return roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = p4,
			Size = UDim2.new(1, 0, 0, 20),
			Text = string.format("%s: %s", var2, formatValue(p2, p3)),
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	end
	local var3
	local var4 = if var1 then var1.unit else ""
	local var5 = p1.state.series[p2]
	local var6 = var1 ~= nil and (var1.plottable == true and var5 ~= nil)
	local fieldSeverity = voiceDebugFieldMetaModule.getFieldSeverity(p2, p3)
	local var7 = if fieldSeverity == "error" then constantsModule.Color.ErrorRed elseif fieldSeverity == "warn" then constantsModule.Color.WarningYellow elseif fieldSeverity == "ok" then constantsModule.Color.HoverGreen else constantsModule.Color.Text
	local var8 = if fieldSeverity ~= "warn" then fieldSeverity == "error" else true
	local t_1 = {
		Accent = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(0, 3, 1, 0),
			BackgroundColor3 = if fieldSeverity == "error" then constantsModule.Color.ErrorRed elseif fieldSeverity == "warn" then constantsModule.Color.WarningYellow elseif fieldSeverity == "ok" then constantsModule.Color.HoverGreen else constantsModule.Color.WarningYellow,
			BackgroundTransparency = if var8 then 0 else 1
		}),
		Label = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 11, 0, 0),
			Size = UDim2.new(1, -251, 1, 0),
			Text = var2,
			Font = constantsModule.Font.MainWindow,
			TextSize = constantsModule.DefaultFontSize.MainWindow,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	}
	local createElement = roactModule.createElement
	local var9 = "TextLabel"
	local t_2 = {
		BackgroundTransparency = 1,
		Position = UDim2.new(1, -180, 0, 0),
		Size = UDim2.new(0, 56, 1, 0)
	}
	
	if p3 ~= nil then
		var3 = (if t[p2] then string.format("%.2f", p3) else tostring(p3)) or "\226\128\148"
	end
	t_2.Text = var3
	t_2.Font = constantsModule.Font.MainWindowBold
	t_2.TextSize = constantsModule.DefaultFontSize.MainWindow
	t_2.TextColor3 = var7
	t_2.TextXAlignment = Enum.TextXAlignment.Right
	t_1.Value = createElement(var9, t_2)
	t_1.Unit = roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.new(1, -116, 0, 0),
		Size = UDim2.new(0, 36, 1, 0),
		Text = var4,
		Font = constantsModule.Font.MainWindow,
		TextSize = constantsModule.DefaultFontSize.MainWindow,
		TextColor3 = constantsModule.Color.BorderGray,
		TextXAlignment = Enum.TextXAlignment.Left
	})
	t_1.Delta = roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.new(1, -72, 0, 0),
		Size = UDim2.new(0, 72, 1, 0),
		Text = var6 and string.format("peak %.1f", var5.max) or "\226\128\148",
		Font = constantsModule.Font.MainWindow,
		TextSize = constantsModule.DefaultFontSize.MainWindow,
		TextColor3 = constantsModule.Color.BorderGray,
		TextXAlignment = Enum.TextXAlignment.Right
	})
	
	if var6 then
		t_1.SparklineButton = roactModule.createElement("TextButton", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(1, -240, 0.5, 0),
			Size = UDim2.new(0, 52, 0, 13),
			Text = "",
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			[roactModule.Event.Activated] = function()
				-- upvalues: p1 (ref), p2 (ref)
				p1:onGraphRowClicked(p2)
			end
		}, {
			Sparkline = roactModule.createElement(sparklineModule, {
				dataSet = var5.dataSet,
				getY = getY,
				minY = var5.min,
				maxY = var5.max,
				color = if var8 then constantsModule.Color.WarningYellow else constantsModule.Color.HighlightBlue,
				size = UDim2.new(1, 0, 1, 0)
			})
		})
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p4,
		Size = UDim2.new(1, 0, 0, 20)
	}, t_1)
end

local function buildGraphElement(p1, p2, p3, p4)
	-- upvalues: roactModule (ref), lineGraphModule (ref), mainRowPadding (ref), lineGraphHeight (ref), getX (ref), getY (ref), convertTimeStampModule (ref), voiceDebugFieldMetaModule (ref)
	local createElement = roactModule.createElement
	local t = {
		axisLabelX = "Time",
		pos = UDim2.new(0, 0, 0, mainRowPadding),
		size = UDim2.new(1, -32, 0, lineGraphHeight),
		layoutOrder = p4,
		graphData = p1.dataSet,
		minY = p1.min,
		maxY = p1.max,
		getX = getX,
		getY = getY,
		axisLabelY = p2.label,
		stringFormatX = convertTimeStampModule
	}
	local unit = voiceDebugFieldMetaModule[p3] and voiceDebugFieldMetaModule[p3].unit
	
	function t.stringFormatY(p5)
		-- upvalues: unit (ref)
		return if unit then string.format("%.1f %s", p5, unit) else string.format("%.1f", p5)
	end
	
	return createElement(lineGraphModule, t)
end

function mainViewVoiceDebug.renderStatLabels(p1, p2)
	-- upvalues: buildStatRow (ref), lineGraphHeight (ref), mainRowPadding (ref), buildGraphElement (ref), getFFlagVoiceDebugConsoleV2Module (ref), list (ref), voiceDebugFieldMetaModule (ref), roactModule (ref), constantsModule (ref), t_1 (ref)
	local t = {}
	local var1 = 0
	local var2 = 0
	
	local function _(p3)
		-- upvalues: var1 (write), var2 (write), t (ref), buildStatRow (copy), p1 (ref)
		var1 += 1
		var2 += 20
		t[p3] = buildStatRow(p1, p3, p1.state.stats[p3], var1)
	end
	
	local _ = function(p3, p4)
		-- upvalues: p1 (ref), var1 (write), var2 (write), lineGraphHeight (copy), mainRowPadding (copy), t (ref), buildGraphElement (copy)
		local var3 = p1.state.series[p3]
		
		if var3 then
			var1 += 1
			var2 += lineGraphHeight + mainRowPadding
			t["__graph_" .. p38] = buildGraphElement(var3, p4, p3, var1)
			
			return
		end
	end
	
	if getFFlagVoiceDebugConsoleV2Module() then
		local t_2 = {}
		
		for i, v in list do
			t_2[v] = {}
		end
		local var3
		local t_3 = {}
		
		for i_1, v_1 in p2 do
			local var4 = voiceDebugFieldMetaModule[v_1]
			var3 = var4 and var4.group
			
			if var3 and t_2[var3] then
				table.insert(t_2[var3], v_1)
			else
				table.insert(t_3, v_1)
			end
		end
		local var5
		for i_2, v_2 in list do
			var5 = t_2[v_2]
			
			if #var5 > 0 then
				var1 += 1
				var2 += 18
				t["__group_header_" .. v_2] = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = var1,
					Size = UDim2.new(1, 0, 0, 18),
					Text = v_2,
					Font = constantsModule.Font.MainWindowHeader,
					TextSize = constantsModule.DefaultFontSize.MainWindowHeader,
					TextColor3 = constantsModule.Color.BorderGray,
					TextXAlignment = Enum.TextXAlignment.Left
				})
				
				for i_3, v_3 in var5 do
					var1 += 1
					var2 += 20
					t[v_3] = buildStatRow(p1, v_3, p1.state.stats[v_3], var1)
				end
				var3 = p1.state.selectedGraphKeyByGroup[v_2]
				local var6 = var3 and voiceDebugFieldMetaModule[var3]
				
				if var6 and var6.plottable then
					local var7 = p1.state.series[var3]
					
					if var7 then
						var1 += 1
						var2 += lineGraphHeight + mainRowPadding
						t["__graph_" .. var62] = buildGraphElement(var7, var6, var3, var1)
					end
				end
			end
		end
		for i_3, v_3 in t_3 do
			var1 += 1
			var2 += 20
			t[v_3] = buildStatRow(p1, v_3, p1.state.stats[v_3], var1)
			var5 = voiceDebugFieldMetaModule[v_3]
			
			if var5 and var5.plottable and p1.state.selectedGraphKeyByGroup[v_3] == v_3 then
				var3 = p1.state.series[v_3]
				
				if var3 then
					var1 += 1
					var2 += lineGraphHeight + mainRowPadding
					t["__graph_" .. v_3] = buildGraphElement(var3, var5, v_3, var1)
				end
			end
		end
	else
		for i, v in p2 do
			var1 += 1
			var2 += 20
			t[v] = buildStatRow(p1, v, p1.state.stats[v], var1)
		end
	end
	local var8 = getFFlagVoiceDebugConsoleV2Module()
	
	for i in p1.state.stats do
		if not t[i] and (var8 or not t_1[i]) then
			var1 += 1
			var2 += 20
			t[i] = buildStatRow(p1, i, p1.state.stats[i], var1)
		end
	end
	return t, var2
end

function mainViewVoiceDebug.renderGraphs(p3, p4)
	-- upvalues: getFFlagVoiceDebugConsoleV2Module (ref), voiceDebugFieldMetaModule (ref), roactModule (ref), lineGraphModule (ref), lineGraphHeight (ref), getX (ref), getY (ref), convertTimeStampModule (ref)
	local t = {}
	local var9 = 0
	
	if getFFlagVoiceDebugConsoleV2Module() then
		return t, var9
	end
	for i, v in p4 do
		local var10 = voiceDebugFieldMetaModule[v]
		local var11 = p3.state.series[v]
		
		if var10 and var10.plottable and var11 then
			var9 += 1
			local createElement = roactModule.createElement
			local var12 = lineGraphModule
			local t_1 = {
				axisLabelX = "Time",
				pos = UDim2.new(),
				size = UDim2.new(1, -32, 0, lineGraphHeight),
				layoutOrder = var9,
				graphData = var11.dataSet,
				minY = var11.min,
				maxY = var11.max,
				getX = getX,
				getY = getY,
				axisLabelY = var10.label,
				stringFormatX = convertTimeStampModule
			}
			local unit = voiceDebugFieldMetaModule[v] and voiceDebugFieldMetaModule[v].unit
			
			function t_1.stringFormatY(p5)
				-- upvalues: unit (ref)
				return if unit then string.format("%.1f %s", p5, unit) else string.format("%.1f", p5)
			end
			
			t[v] = createElement(var12, t_1)
		end
	end
	return t, var9
end

function mainViewVoiceDebug.render(p5)
	-- upvalues: getFFlagVoiceDebugConsoleV2Module (ref), cloned (ref), voiceDebugFieldDisplayOrderModule (ref), lineGraphHeight (ref), mainRowPadding (ref), roactModule (ref), utilAndTabModule (ref), constantsModule (ref), freezeToggleModule (ref), collapsibleSectionModule (ref), mainViewConnectivityPanelModule (ref), mainViewSubscriptionsPanelModule (ref), mainViewRemoteOperationsPanelModule (ref), mainViewClientOperationQueuePanelModule (ref)
	local size = p5.props.size
	local formFactor = p5.props.formFactor
	local tabList = p5.props.tabList
	local var13 = if getFFlagVoiceDebugConsoleV2Module() then cloned else voiceDebugFieldDisplayOrderModule
	local var14, var15 = p5:renderStatLabels(var13)
	local var16, var17 = p5:renderGraphs(var13)
	
	return roactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = 3, Size = size }, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, mainRowPadding)
		}),
		FramePadding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 16) }),
		UtilAndTab = roactModule.createElement(utilAndTabModule, {
			layoutOrder = 1,
			windowWidth = size.X.Offset,
			formFactor = formFactor,
			tabList = tabList,
			refForParent = p5.utilRef,
			onHeightChanged = p5.onUtilTabHeightChanged,
			extraContent = getFFlagVoiceDebugConsoleV2Module() and (roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.X,
				Size = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, if formFactor == constantsModule.FormFactor.Small then -24 else -20, 0.5, 0)
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 8)
				}),
				FreezeToggle = roactModule.createElement(freezeToggleModule, {
					layoutOrder = 1,
					frozen = p5.state.frozen,
					onToggle = p5.onFreezeToggled
				})
			}) or nil)
		}),
		Content = roactModule.createElement("ScrollingFrame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 5,
			Size = UDim2.new(1, 0, 1, -p5.state.utilTabHeight),
			AutomaticCanvasSize = Enum.AutomaticSize.Y
		}, if getFFlagVoiceDebugConsoleV2Module() then {
			UIListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, mainRowPadding)
			}),
			ContentPadding = roactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 24) }),
			MetricsSection = roactModule.createElement(collapsibleSectionModule, { title = "Metrics", layoutOrder = 1 }, {
				HealthStrip = p5:renderHealthStrip(),
				StatsContainer = roactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, var15)
				}, {
					UIListLayout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
					Labels = roactModule.createFragment(var14)
				})
			}),
			ConnectivityContainer = roactModule.createElement(mainViewConnectivityPanelModule, { layoutOrder = 2, connectivity = p5.state.connectivity }),
			SubscriptionsContainer = roactModule.createElement(mainViewSubscriptionsPanelModule, { layoutOrder = 3, subscriptions = p5.state.subscriptions }),
			RemoteOperationsContainer = roactModule.createElement(mainViewRemoteOperationsPanelModule, {
				layoutOrder = 4,
				remoteOperations = p5.state.remoteOperations
			}),
			ClientOperationQueueContainer = roactModule.createElement(mainViewClientOperationQueuePanelModule, {
				layoutOrder = 5,
				remoteOperations = p5.state.remoteOperations
			}),
			BottomSpacer = roactModule.createElement("Frame", {
				LayoutOrder = 6,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 16)
			})
		} else {
			UIListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, mainRowPadding)
			}),
			ContentPadding = roactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 24) }),
			StatsContainer = roactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, var15)
			}, {
				UIListLayout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
				Labels = roactModule.createFragment(var14)
			}),
			GraphsContainer = roactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, var17 * lineGraphHeight + math.max(0, var17 - 1) * mainRowPadding)
			}, {
				UIListLayout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, mainRowPadding)
				}),
				Graphs = roactModule.createFragment(var16)
			}),
			ConnectivityContainer = roactModule.createElement(mainViewConnectivityPanelModule, { layoutOrder = 3, connectivity = p5.state.connectivity })
		})
	})
end

return dataConsumerModule(mainViewVoiceDebug, "VoiceDebugData")