local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local _ = script.Parent.Parent.Parent.Actions
local Components = script.Parent.Parent.Parent.Components
local DataConsumerModule = require(Components.DataConsumer)
local LineGraphModule = require(Components.LineGraph)
local SparklineModule = require(Components.Sparkline)
local MainViewConnectivityPanelModule = require(script.Parent.MainViewConnectivityPanel)
local MainViewSubscriptionsPanelModule = require(script.Parent.MainViewSubscriptionsPanel)
local MainViewRemoteOperationsPanelModule = require(script.Parent.MainViewRemoteOperationsPanel)
local MainViewClientOperationQueuePanelModule = require(script.Parent.MainViewClientOperationQueuePanel)
local CollapsibleSectionModule = require(script.Parent.CollapsibleSection)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local LineGraphHeight = ConstantsModule.GeneralFormatting.LineGraphHeight
local UtilAndTabModule = require(Components.UtilAndTab)
local config = {
	rttMs = true,
	incomingBitrateKbps = true,
	outgoingBitrateKbps = true,
	incomingJitterMs = true,
	outgoingJitterMs = true,
	jitterBufferDelayMs = true,
	incomingLossPercent = true
}
local list = { "Connection", "Incoming", "Outgoing" }
local ConvertTimeStampModule = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
local VoiceDebugFieldMetaModule = require(script.Parent.VoiceDebugFieldMeta)
local VoiceDebugFieldDisplayOrderModule = require(script.Parent.VoiceDebugFieldDisplayOrder)
local GetFFlagVoiceDebugConsoleV2Module = require(script.Parent.GetFFlagVoiceDebugConsoleV2)
local FreezeToggleModule = require(script.Parent.FreezeToggle)
local config1 = {
	totalConcealmentEvents = true,
	lastPublisherAudioLevelDbov = true,
	lastSubscriberAudioLevelDbov = true
}
local Copy = table.clone(VoiceDebugFieldDisplayOrderModule)

for _, value in {
	"incomingBitrateKbps", "outgoingBitrateKbps", "outgoingCodec",
	"incomingLossPercent", "totalConcealmentEvents", "lastPublisherAudioLevelDbov",
	"lastSubscriberAudioLevelDbov"
} do
	table.insert(Copy, value)
end
local function getX(p1) --[[ Line: 105 ]]
	return p1.time
end

local function getY(p1) --[[ Line: 109 ]]
	return p1.value
end

local function _(p1) --[[ Line: 113 | Named "makeStringFormatY" ]]
	-- upvalues: VoiceDebugFieldMetaModule (copy)
	local Unit = VoiceDebugFieldMetaModule[p1] and VoiceDebugFieldMetaModule[p1].unit
	
	return function(p2): string --[[ Line: 115 ]]
		-- upvalues: Unit (copy)
		return if Unit then string.format("%.1f %s", p2, Unit) else string.format("%.1f", p2)
	end
end

local _ = function(p1, p2) --[[ Line: 123 | Named "getFieldSeverity" ]]
	-- upvalues: VoiceDebugFieldMetaModule (copy)
	return VoiceDebugFieldMetaModule.getFieldSeverity(p1, p2)
end

local _ = function(p1, p2) --[[ Line: 127 | Named "severityColor" ]]
	-- upvalues: ConstantsModule (copy)
	return if p1 == "error" then ConstantsModule.Color.ErrorRed elseif p1 == "warn" then ConstantsModule.Color.WarningYellow elseif p1 == "ok" then ConstantsModule.Color.HoverGreen else p2
end

local _ = function(p1, p2): string --[[ Line: 138 | Named "formatNumber" ]]
	-- upvalues: config (copy)
	return if config[p1] then string.format("%.2f", p2) else tostring(p2)
end

local function formatValue(p1, p2): string --[[ Line: 145 ]]
	-- upvalues: VoiceDebugFieldMetaModule (copy), config (copy)
	if p2 == nil then
		return "—"
	else
		local VoiceDebugFieldMetaModuleEntry = VoiceDebugFieldMetaModule[p1]
		local Unit = VoiceDebugFieldMetaModuleEntry and VoiceDebugFieldMetaModuleEntry.unit
		local Formatted: string = if config[p1] then string.format("%.2f", p2) else tostring(p2)
		
		return if Unit then string.format("%s %s", Formatted, Unit) else Formatted
	end
end

local _ = function(p1, p2): string --[[ Line: 158 | Named "formatCardSubCaption" ]]
	local Formatted: string = p1 and string.format("%.1f", p1.max) or "—"
	
	return if p2 then string.format("%s · peak %s%s", p2, Formatted, p2) else string.format("peak %s", Formatted)
end

local _ = function(p1, p2): string --[[ Line: 166 | Named "formatCardValue" ]]
	return if type(p1) == "number" then string.format("%." .. tostring(p2 or 0) .. "f", p1) else "—"
end

local function HealthCard(p1) --[[ Line: 173 ]]
	-- upvalues: ConstantsModule (copy), RoactModule (copy)
	local Severity = p1.severity
	local Text = ConstantsModule.Color.Text
	
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(0, 110, 0, 56),
		BackgroundColor3 = ConstantsModule.Color.TextBoxGray
	}, {
		Stroke = RoactModule.createElement("UIStroke", {
			Thickness = 1,
			Transparency = 0.5,
			Color = ConstantsModule.Color.BorderGray
		}),
		Padding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8),
			PaddingTop = UDim.new(0, 6),
			PaddingBottom = UDim.new(0, 6)
		}),
		Layout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		Caption = RoactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 14),
			Text = p1.caption,
			Font = ConstantsModule.Font.MainWindowHeader,
			TextSize = ConstantsModule.DefaultFontSize.MainWindowHeader,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Value = RoactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			TextSize = 18,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20),
			Text = p1.value,
			Font = ConstantsModule.Font.MainWindowBold,
			TextColor3 = if Severity == "error" then ConstantsModule.Color.ErrorRed elseif Severity == "warn" then ConstantsModule.Color.WarningYellow elseif Severity == "ok" then ConstantsModule.Color.HoverGreen else Text,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		SubCaption = RoactModule.createElement("TextLabel", {
			LayoutOrder = 3,
			TextSize = 11,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 12),
			Text = p1.subCaption or "",
			Font = ConstantsModule.Font.MainWindow,
			TextColor3 = ConstantsModule.Color.BorderGray,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	})
end

local MainViewVoiceDebug = RoactModule.PureComponent:extend("MainViewVoiceDebug")

function MainViewVoiceDebug.init(p1) --[[ Line: 236 ]]
	-- upvalues: RoactModule (copy)
	function p1.onUtilTabHeightChanged(UtilTabHeight) --[[ Line: 237 ]]
		-- upvalues: p1 (copy)
		p1:setState({ utilTabHeight = UtilTabHeight })
	end
	
	function p1.onStatsUpdated(Stats) --[[ Line: 243 ]]
		-- upvalues: p1 (copy)
		if not p1.state.frozen then
			p1:setState({
				stats = Stats,
				series = p1.props.VoiceDebugData:getSeries(),
				connectivity = p1.props.VoiceDebugData:getConnectivity(),
				subscriptions = p1.props.VoiceDebugData:getSubscriptions(),
				remoteOperations = p1.props.VoiceDebugData:getRemoteOperations()
			})
			
			return
		end
	end
	
	function p1.onFreezeToggled() --[[ Line: 256 ]]
		-- upvalues: p1 (copy)
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
		else
			p1:setState({
				frozen = true,
				series = p1.props.VoiceDebugData:getSeriesSnapshot()
			})
		end
	end
	
	p1._statsUpdatedConnection = p1.props.VoiceDebugData:Signal():Connect(p1.onStatsUpdated)
	p1.utilRef = RoactModule.createRef()
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

function MainViewVoiceDebug.didMount(p1) --[[ Line: 291 ]]
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function MainViewVoiceDebug.didUpdate(p1) --[[ Line: 298 ]]
	local Size = p1.utilRef.current.Size
	
	if Size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = Size.Y.Offset })
	end
end

function MainViewVoiceDebug.willUnmount(p1) --[[ Line: 307 ]]
	if p1._statsUpdatedConnection then
		p1._statsUpdatedConnection:Disconnect()
		p1._statsUpdatedConnection = nil
	end
end

function MainViewVoiceDebug.onGraphRowClicked(p1, p2) --[[ Line: 314 ]]
	-- upvalues: VoiceDebugFieldMetaModule (copy)
	local VoiceDebugFieldMetaModuleEntry = VoiceDebugFieldMetaModule[p2]
	local Group = VoiceDebugFieldMetaModuleEntry and VoiceDebugFieldMetaModuleEntry.group or p2
	local Copy = table.clone(p1.state.selectedGraphKeyByGroup)
	
	if Copy[Group] == p2 then
		Copy[Group] = nil
	else
		Copy[Group] = p2
	end
	p1:setState({ selectedGraphKeyByGroup = Copy })
end

function MainViewVoiceDebug.renderHealthStrip(p1) --[[ Line: 327 ]]
	-- upvalues: RoactModule (copy), MainRowPadding (copy), HealthCard (copy), VoiceDebugFieldMetaModule (copy)
	local Stats = p1.state.stats
	local Series = p1.state.series
	local RttMs = Stats.rttMs
	local RttMs1 = Series.rttMs
	local config = {
		layoutOrder = 1,
		caption = "Round-trip",
		value = if type(RttMs) == "number" then string.format("%." .. tostring(2) .. "f", RttMs) else "—",
		severity = VoiceDebugFieldMetaModule.getFieldSeverity("rttMs", Stats.rttMs),
		subCaption = string.format("%s · peak %s%s", "ms", RttMs1 and string.format("%.1f", RttMs1.max) or "—", "ms")
	}
	local IncomingLossPercent = Stats.incomingLossPercent
	local IncomingLossPercent1 = Series.incomingLossPercent
	local config1 = {
		layoutOrder = 2,
		caption = "Loss in",
		value = if type(IncomingLossPercent) == "number" then string.format("%." .. tostring(1) .. "f", IncomingLossPercent) else "—",
		severity = VoiceDebugFieldMetaModule.getFieldSeverity("incomingLossPercent", Stats.incomingLossPercent),
		subCaption = string.format("%s · peak %s%s", "%", IncomingLossPercent1 and string.format("%.1f", IncomingLossPercent1.max) or "—", "%")
	}
	local IncomingJitterMs = Stats.incomingJitterMs
	local IncomingJitterMs1 = Series.incomingJitterMs
	
	return RoactModule.createElement("Frame", {
		LayoutOrder = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 56)
	}, {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, MainRowPadding)
		}),
		RoundTrip = RoactModule.createElement(HealthCard, config),
		LossIn = RoactModule.createElement(HealthCard, config1),
		JitterIn = RoactModule.createElement(HealthCard, {
			layoutOrder = 3,
			caption = "Jitter in",
			value = if type(IncomingJitterMs) == "number" then string.format("%." .. tostring(2) .. "f", IncomingJitterMs) else "—",
			severity = VoiceDebugFieldMetaModule.getFieldSeverity("incomingJitterMs", Stats.incomingJitterMs),
			subCaption = string.format("%s · peak %s%s", "ms", IncomingJitterMs1 and string.format("%.1f", IncomingJitterMs1.max) or "—", "ms")
		}),
		Streams = RoactModule.createElement(HealthCard, {
			layoutOrder = 4,
			caption = "Streams",
			severity = nil,
			subCaption = "in / out",
			value = string.format("%s / %s", tostring(Stats.incomingStreams or "—"), (tostring(Stats.outgoingStreams or "—")))
		})
	})
end

local function buildStatRow(p1, Key, Stat, Count) --[[ Line: 380 ]]
	-- upvalues: VoiceDebugFieldMetaModule (copy), GetFFlagVoiceDebugConsoleV2Module (copy), ConstantsModule (copy), RoactModule (copy), config (copy), SparklineModule (copy), getY (copy), formatValue (copy)
	local VoiceDebugFieldMetaModuleEntry = VoiceDebugFieldMetaModule[Key]
	local Label = VoiceDebugFieldMetaModuleEntry and VoiceDebugFieldMetaModuleEntry.label or Key
	
	if not GetFFlagVoiceDebugConsoleV2Module() then
		return RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = Count,
			Size = UDim2.new(1, 0, 0, 20),
			Text = string.format("%s: %s", Label, formatValue(Key, Stat)),
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	end
	local Sery = p1.state.series[Key]
	local HasSery: boolean = VoiceDebugFieldMetaModuleEntry ~= nil and (VoiceDebugFieldMetaModuleEntry.plottable == true and Sery ~= nil)
	local FieldSeverity = VoiceDebugFieldMetaModule.getFieldSeverity(Key, Stat)
	local Text = ConstantsModule.Color.Text
	local ErrorRed = if FieldSeverity == "error" then ConstantsModule.Color.ErrorRed elseif FieldSeverity == "warn" then ConstantsModule.Color.WarningYellow elseif FieldSeverity == "ok" then ConstantsModule.Color.HoverGreen else Text
	local IsWarn: boolean = FieldSeverity == "warn" or FieldSeverity == "error"
	local WarningYellow = ConstantsModule.Color.WarningYellow
	local config1 = {
		Accent = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(0, 3, 1, 0),
			BackgroundColor3 = if FieldSeverity == "error" then ConstantsModule.Color.ErrorRed elseif FieldSeverity == "warn" then ConstantsModule.Color.WarningYellow elseif FieldSeverity == "ok" then ConstantsModule.Color.HoverGreen else WarningYellow,
			BackgroundTransparency = if IsWarn then 0 else 1
		}),
		Label = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 11, 0, 0),
			Size = UDim2.new(1, -251, 1, 0),
			Text = Label,
			Font = ConstantsModule.Font.MainWindow,
			TextSize = ConstantsModule.DefaultFontSize.MainWindow,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd
		}),
		Value = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -180, 0, 0),
			Size = UDim2.new(0, 56, 1, 0),
			Text = if Stat == nil then "—" else (if config[Key] then string.format("%.2f", Stat) else tostring(Stat)) or "—",
			Font = ConstantsModule.Font.MainWindowBold,
			TextSize = ConstantsModule.DefaultFontSize.MainWindow,
			TextColor3 = ErrorRed,
			TextXAlignment = Enum.TextXAlignment.Right
		}),
		Unit = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -116, 0, 0),
			Size = UDim2.new(0, 36, 1, 0),
			Text = VoiceDebugFieldMetaModuleEntry and VoiceDebugFieldMetaModuleEntry.unit or "",
			Font = ConstantsModule.Font.MainWindow,
			TextSize = ConstantsModule.DefaultFontSize.MainWindow,
			TextColor3 = ConstantsModule.Color.BorderGray,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Delta = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -72, 0, 0),
			Size = UDim2.new(0, 72, 1, 0),
			Text = HasSery and string.format("peak %.1f", Sery.max) or "—",
			Font = ConstantsModule.Font.MainWindow,
			TextSize = ConstantsModule.DefaultFontSize.MainWindow,
			TextColor3 = ConstantsModule.Color.BorderGray,
			TextXAlignment = Enum.TextXAlignment.Right
		})
	}
	
	if HasSery then
		config1.SparklineButton = RoactModule.createElement("TextButton", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(1, -240, 0.5, 0),
			Size = UDim2.new(0, 52, 0, 13),
			Text = "",
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			[RoactModule.Event.Activated] = function() --[[ Line: 463 ]]
				-- upvalues: p1 (copy), Key (copy)
				p1:onGraphRowClicked(Key)
			end
		}, {
			Sparkline = RoactModule.createElement(SparklineModule, {
				dataSet = Sery.dataSet,
				getY = getY,
				minY = Sery.min,
				maxY = Sery.max,
				color = IsWarn and ConstantsModule.Color.WarningYellow or ConstantsModule.Color.HighlightBlue,
				size = UDim2.new(1, 0, 1, 0)
			})
		})
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = Count,
		Size = UDim2.new(1, 0, 0, 20)
	}, config1)
end

local function buildGraphElement(Sery, p1, SelectedGraphKeyByGroupEntry, LayoutOrder) --[[ Line: 496 ]]
	-- upvalues: RoactModule (copy), LineGraphModule (copy), MainRowPadding (copy), LineGraphHeight (copy), getX (copy), getY (copy), ConvertTimeStampModule (copy), VoiceDebugFieldMetaModule (copy)
	local Unit = VoiceDebugFieldMetaModule[SelectedGraphKeyByGroupEntry] and VoiceDebugFieldMetaModule[SelectedGraphKeyByGroupEntry].unit
	
	return RoactModule.createElement(LineGraphModule, {
		axisLabelX = "Time",
		pos = UDim2.new(0, 0, 0, MainRowPadding),
		size = UDim2.new(1, -32, 0, LineGraphHeight),
		layoutOrder = LayoutOrder,
		graphData = Sery.dataSet,
		minY = Sery.min,
		maxY = Sery.max,
		getX = getX,
		getY = getY,
		axisLabelY = p1.label,
		stringFormatX = ConvertTimeStampModule,
		stringFormatY = function(p2): string --[[ Line: 115 ]]
			-- upvalues: Unit (copy)
			return if Unit then string.format("%.1f %s", p2, Unit) else string.format("%.1f", p2)
		end
	})
end

function MainViewVoiceDebug.renderStatLabels(p1, List) --[[ Line: 517 ]]
	-- upvalues: buildStatRow (copy), LineGraphHeight (copy), MainRowPadding (copy), buildGraphElement (copy), GetFFlagVoiceDebugConsoleV2Module (copy), list (copy), VoiceDebugFieldMetaModule (copy), RoactModule (copy), ConstantsModule (copy), config1 (copy)
	local TextLabels = {}
	local LayoutOrder = 0
	local Count = 0
	
	local function _(Key) --[[ Line: 522 | Named "addRow" ]]
		-- upvalues: LayoutOrder (ref), Count (ref), TextLabels (copy), buildStatRow (upval), p1 (copy)
		LayoutOrder += 1
		Count += 20
		TextLabels[Key] = buildStatRow(p1, Key, p1.state.stats[Key], LayoutOrder)
	end
	
	local _ = function(Text, p2) --[[ Line: 528 | Named "insertGraph" ]]
		-- upvalues: p1 (copy), LayoutOrder (ref), Count (ref), LineGraphHeight (upval), MainRowPadding (upval), TextLabels (copy), buildGraphElement (upval)
		local Sery = p1.state.series[Text]
		
		if Sery then
			LayoutOrder += 1
			Count += LineGraphHeight + MainRowPadding
			TextLabels["__graph_" .. Text] = buildGraphElement(Sery, p2, Text, LayoutOrder)
			
			return
		end
	end
	
	if GetFFlagVoiceDebugConsoleV2Module() then
		local t = {}
		
		for _, value in list do
			t[value] = {}
		end
		local List1 = {}
		
		for _, value1 in List do
			local VoiceDebugFieldMetaModuleEntry = VoiceDebugFieldMetaModule[value1]
			local Group = VoiceDebugFieldMetaModuleEntry and VoiceDebugFieldMetaModuleEntry.group
			
			if Group and t[Group] then
				table.insert(t[Group], value1)
			else
				table.insert(List1, value1)
			end
		end
		for _, Text in list do
			local Entry = t[Text]
			
			if #Entry > 0 then
				LayoutOrder += 1
				Count += 18
				TextLabels["__group_header_" .. Text] = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = LayoutOrder,
					Size = UDim2.new(1, 0, 0, 18),
					Text = Text,
					Font = ConstantsModule.Font.MainWindowHeader,
					TextSize = ConstantsModule.DefaultFontSize.MainWindowHeader,
					TextColor3 = ConstantsModule.Color.BorderGray,
					TextXAlignment = Enum.TextXAlignment.Left
				})
				
				for _, value2 in Entry do
					LayoutOrder += 1
					Count += 20
					TextLabels[value2] = buildStatRow(p1, value2, p1.state.stats[value2], LayoutOrder)
				end
				local SelectedGraphKeyByGroupEntry = p1.state.selectedGraphKeyByGroup[Text]
				local VoiceDebugFieldMetaModuleEntry = SelectedGraphKeyByGroupEntry and VoiceDebugFieldMetaModule[SelectedGraphKeyByGroupEntry]
				
				if VoiceDebugFieldMetaModuleEntry and VoiceDebugFieldMetaModuleEntry.plottable then
					local Sery = p1.state.series[SelectedGraphKeyByGroupEntry]
					
					if Sery then
						LayoutOrder += 1
						Count += LineGraphHeight + MainRowPadding
						TextLabels["__graph_" .. SelectedGraphKeyByGroupEntry] = buildGraphElement(Sery, VoiceDebugFieldMetaModuleEntry, SelectedGraphKeyByGroupEntry, LayoutOrder)
					end
				end
			end
		end
		for _, value3 in List1 do
			LayoutOrder += 1
			Count += 20
			TextLabels[value3] = buildStatRow(p1, value3, p1.state.stats[value3], LayoutOrder)
			local VoiceDebugFieldMetaModuleEntry = VoiceDebugFieldMetaModule[value3]
			
			if VoiceDebugFieldMetaModuleEntry and VoiceDebugFieldMetaModuleEntry.plottable and p1.state.selectedGraphKeyByGroup[value3] == value3 then
				local Sery = p1.state.series[value3]
				
				if Sery then
					LayoutOrder += 1
					Count += LineGraphHeight + MainRowPadding
					TextLabels["__graph_" .. value3] = buildGraphElement(Sery, VoiceDebugFieldMetaModuleEntry, value3, LayoutOrder)
				end
			end
		end
	else
		for _, value4 in List do
			LayoutOrder += 1
			Count += 20
			TextLabels[value4] = buildStatRow(p1, value4, p1.state.stats[value4], LayoutOrder)
		end
	end
	local FFlagVoiceDebugConsoleV2Module = GetFFlagVoiceDebugConsoleV2Module()
	
	for stat in p1.state.stats do
		if not TextLabels[stat] and (FFlagVoiceDebugConsoleV2Module or not config1[stat]) then
			LayoutOrder += 1
			Count += 20
			TextLabels[stat] = buildStatRow(p1, stat, p1.state.stats[stat], LayoutOrder)
		end
	end
	return TextLabels, Count
end

function MainViewVoiceDebug.renderGraphs(p2, List) --[[ Line: 604 ]]
	-- upvalues: GetFFlagVoiceDebugConsoleV2Module (copy), VoiceDebugFieldMetaModule (copy), RoactModule (copy), LineGraphModule (copy), LineGraphHeight (copy), getX (copy), getY (copy), ConvertTimeStampModule (copy)
	local Elements = {}
	local LayoutOrder = 0
	
	if GetFFlagVoiceDebugConsoleV2Module() then
		return Elements, LayoutOrder
	end
	for _, value in List do
		local VoiceDebugFieldMetaModuleEntry = VoiceDebugFieldMetaModule[value]
		local Sery = p2.state.series[value]
		
		if VoiceDebugFieldMetaModuleEntry and VoiceDebugFieldMetaModuleEntry.plottable and Sery then
			LayoutOrder += 1
			local Unit = VoiceDebugFieldMetaModule[value] and VoiceDebugFieldMetaModule[value].unit
			Elements[value] = RoactModule.createElement(LineGraphModule, {
				axisLabelX = "Time",
				pos = UDim2.new(),
				size = UDim2.new(1, -32, 0, LineGraphHeight),
				layoutOrder = LayoutOrder,
				graphData = Sery.dataSet,
				minY = Sery.min,
				maxY = Sery.max,
				getX = getX,
				getY = getY,
				axisLabelY = VoiceDebugFieldMetaModuleEntry.label,
				stringFormatX = ConvertTimeStampModule,
				stringFormatY = function(p3): string --[[ Line: 115 ]]
					-- upvalues: Unit (copy)
					return if Unit then string.format("%.1f %s", p3, Unit) else string.format("%.1f", p3)
				end
			})
		end
	end
	return Elements, LayoutOrder
end

function MainViewVoiceDebug.render(p3) --[[ Line: 641 ]]
	-- upvalues: GetFFlagVoiceDebugConsoleV2Module (copy), Copy (copy), VoiceDebugFieldDisplayOrderModule (copy), LineGraphHeight (copy), MainRowPadding (copy), RoactModule (copy), UtilAndTabModule (copy), ConstantsModule (copy), FreezeToggleModule (copy), CollapsibleSectionModule (copy), MainViewConnectivityPanelModule (copy), MainViewSubscriptionsPanelModule (copy), MainViewRemoteOperationsPanelModule (copy), MainViewClientOperationQueuePanelModule (copy)
	local Size = p3.props.size
	local FormFactor = p3.props.formFactor
	local TabList = p3.props.tabList
	local Copy1 = GetFFlagVoiceDebugConsoleV2Module() and Copy or VoiceDebugFieldDisplayOrderModule
	local RenderStatLabelsResult, RenderStatLabelsResult2 = p3:renderStatLabels(Copy1)
	local RenderGraphsResult, RenderGraphsResult2 = p3:renderGraphs(Copy1)
	local NewRenderGraphsResult = RenderGraphsResult2 * LineGraphHeight + math.max(0, RenderGraphsResult2 - 1) * MainRowPadding
	
	return RoactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = 3, Size = Size }, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, MainRowPadding)
		}),
		FramePadding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 16) }),
		UtilAndTab = RoactModule.createElement(UtilAndTabModule, {
			layoutOrder = 1,
			windowWidth = Size.X.Offset,
			formFactor = FormFactor,
			tabList = TabList,
			refForParent = p3.utilRef,
			onHeightChanged = p3.onUtilTabHeightChanged,
			extraContent = GetFFlagVoiceDebugConsoleV2Module() and RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.X,
				Size = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, if FormFactor == ConstantsModule.FormFactor.Small then -24 else -20, 0.5, 0)
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 8)
				}),
				FreezeToggle = RoactModule.createElement(FreezeToggleModule, {
					layoutOrder = 1,
					frozen = p3.state.frozen,
					onToggle = p3.onFreezeToggled
				})
			}) or nil
		}),
		Content = RoactModule.createElement("ScrollingFrame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 5,
			Size = UDim2.new(1, 0, 1, -p3.state.utilTabHeight),
			AutomaticCanvasSize = Enum.AutomaticSize.Y
		}, GetFFlagVoiceDebugConsoleV2Module() and {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, MainRowPadding)
			}),
			ContentPadding = RoactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 24) }),
			MetricsSection = RoactModule.createElement(CollapsibleSectionModule, { title = "Metrics", layoutOrder = 1 }, {
				HealthStrip = p3:renderHealthStrip(),
				StatsContainer = RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, RenderStatLabelsResult2)
				}, {
					UIListLayout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
					Labels = RoactModule.createFragment(RenderStatLabelsResult)
				})
			}),
			ConnectivityContainer = RoactModule.createElement(MainViewConnectivityPanelModule, { layoutOrder = 2, connectivity = p3.state.connectivity }),
			SubscriptionsContainer = RoactModule.createElement(MainViewSubscriptionsPanelModule, { layoutOrder = 3, subscriptions = p3.state.subscriptions }),
			RemoteOperationsContainer = RoactModule.createElement(MainViewRemoteOperationsPanelModule, {
				layoutOrder = 4,
				remoteOperations = p3.state.remoteOperations
			}),
			ClientOperationQueueContainer = RoactModule.createElement(MainViewClientOperationQueuePanelModule, {
				layoutOrder = 5,
				remoteOperations = p3.state.remoteOperations
			}),
			BottomSpacer = RoactModule.createElement("Frame", {
				LayoutOrder = 6,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 16)
			})
		} or {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, MainRowPadding)
			}),
			ContentPadding = RoactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 24) }),
			StatsContainer = RoactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, RenderStatLabelsResult2)
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
				Labels = RoactModule.createFragment(RenderStatLabelsResult)
			}),
			GraphsContainer = RoactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, NewRenderGraphsResult)
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, MainRowPadding)
				}),
				Graphs = RoactModule.createFragment(RenderGraphsResult)
			}),
			ConnectivityContainer = RoactModule.createElement(MainViewConnectivityPanelModule, { layoutOrder = 3, connectivity = p3.state.connectivity })
		})
	})
end

return DataConsumerModule(MainViewVoiceDebug, "VoiceDebugData")