local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ProfilerUtilModule = require(script.Parent.ProfilerUtil)
local _ = ProfilerUtilModule.getDurations
local _ = ProfilerUtilModule.getSourceName
local _ = ProfilerUtilModule.getLine
local GetNativeFlagFunction = ProfilerUtilModule.getNativeFlag
local GetPluginFlagFunction = ProfilerUtilModule.getPluginFlag
local _ = ProfilerUtilModule.standardizeChildren
local Components = script.Parent.Parent.Parent.Components
local CellLabelModule = require(Components.CellLabel)
local BannerButtonModule = require(Components.BannerButton)
local TooltipModule = require(Components.Tooltip)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local EntryFrameHeight = ConstantsModule.GeneralFormatting.EntryFrameHeight
local _ = ConstantsModule.ScriptProfilerFormatting.DepthIndent
local ValueCellWidth = ConstantsModule.ScriptProfilerFormatting.ValueCellWidth
local CellPadding = ConstantsModule.ScriptProfilerFormatting.CellPadding
local ValuePadding = ConstantsModule.ScriptProfilerFormatting.ValuePadding
local ProfilerFunctionViewEntry = RoactModule.PureComponent:extend("ProfilerFunctionViewEntry")

local function BorderedCellLabel(p1)
	-- upvalues: RoactModule (copy), CellLabelModule (copy), LineWidth (copy), ValuePadding (copy), LineColor (copy)
	return RoactModule.createFragment({
		Label = RoactModule.createElement(CellLabelModule, { text = p1.text, size = p1.size, pos = p1.pos }),
		LeftBorder = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(UDim.new(0, LineWidth), p1.size.Y),
			Position = UDim2.fromOffset(-ValuePadding, 0) + p1.pos,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = LineColor
		})
	})
end

function ProfilerFunctionViewEntry.init(p1)
	p1.state = {
		showTooltip = false,
		expanded = p1.props.depth == 0,
		tooltipPos = UDim2.fromOffset(0, 0)
	}
	
	function p1.onButtonPress()
		-- upvalues: p1 (copy)
		p1:setState(function(_)
			-- upvalues: p1 (upval)
			return { expanded = not p1.state.expanded }
		end)
	end
	
	function p1:onMouseEnter(XOffset, YOffset)
		-- upvalues: p1 (copy)
		p1:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(XOffset, YOffset)
		})
	end
	
	function p1:onMouseMove(XOffset, YOffset)
		-- upvalues: p1 (copy)
		p1:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(XOffset, YOffset)
		})
	end
	
	function p1.onMouseLeave()
		-- upvalues: p1 (copy)
		p1:setState({ showTooltip = false })
	end
end

function ProfilerFunctionViewEntry:renderValues(List)
	-- upvalues: ValueCellWidth (copy), ValuePadding (copy), EntryFrameHeight (copy), RoactModule (copy), BorderedCellLabel (copy)
	local Elements = {}
	local _UDim2 = UDim2.new(ValueCellWidth, -ValuePadding, 0, EntryFrameHeight)
	local _UDim2_1 = UDim2.new(1 - ValueCellWidth * #List, ValuePadding, 0, 0)
	
	for i, value in ipairs(List) do
		Elements[tostring(i)] = RoactModule.createElement(BorderedCellLabel, {
			text = tostring(value),
			size = _UDim2,
			pos = _UDim2_1 + UDim2.fromScale(ValueCellWidth * (i - 1), 0)
		})
	end
	return Elements
end

function ProfilerFunctionViewEntry.render(p1)
	-- upvalues: EntryFrameHeight (copy), GetNativeFlagFunction (copy), GetPluginFlagFunction (copy), ProfilerUtilModule (copy), ValueCellWidth (copy), RoactModule (copy), TooltipModule (copy), BannerButtonModule (copy), CellLabelModule (copy), CellPadding (copy)
	local Props = p1.props
	local Size = Props.size or UDim2.new(1, 0, 0, EntryFrameHeight)
	local LayoutOrder = Props.layoutOrder or 0
	local PercentageRatio = Props.percentageRatio
	local Data = Props.data
	local Function = Data.Functions[Props.functionId]
	local TotalDurationDelta = Function.TotalDuration / p1.props.average - (p1.props.gcOffset or 0)
	local NativeFlag = GetNativeFlagFunction(Data, Function)
	local PluginFlag = GetPluginFlagFunction(Data, Function)
	local list = {
		if PercentageRatio then if PercentageRatio == 0 then "N/A" else string.format("%.3f%%", TotalDurationDelta / PercentageRatio) else string.format("%.3f", TotalDurationDelta * 1000)
	}
	local NodeName = Props.nodeName
	
	if not NodeName or #NodeName == 0 then
		NodeName = "<anonymous>"
	end
	local SourceLocationString = ProfilerUtilModule.getSourceLocationString(Data, Function, NodeName)
	
	if NodeName == "<anonymous>" then
		NodeName = SourceLocationString
		SourceLocationString = ""
	end
	if PluginFlag then
		NodeName ..= " <plugin>"
	end
	if NativeFlag then
		NodeName ..= " <native>"
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		LayoutOrder = LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		tooltip = if p1.state.showTooltip then RoactModule.createElement(TooltipModule, { text = SourceLocationString, pos = p1.state.tooltipPos }) else nil,
		layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		button = RoactModule.createElement(BannerButtonModule, {
			inset = 0,
			isExpandable = false,
			layoutOrder = -1,
			size = UDim2.new(1, 0, 0, EntryFrameHeight),
			isExpanded = p1.state.expanded,
			onButtonPress = p1.onButtonPress,
			onMouseEnter = p1.onMouseEnter,
			onMouseLeave = p1.onMouseLeave,
			onMouseMove = p1.onMouseMove
		}, {
			name = RoactModule.createElement(CellLabelModule, {
				text = NodeName,
				size = UDim2.new(UDim.new(1 - ValueCellWidth * #list, -0), UDim.new(1, 0)),
				pos = UDim2.new(0, CellPadding + 0, 0, 0)
			}),
			values = RoactModule.createFragment(p1:renderValues(list))
		})
	})
end

return ProfilerFunctionViewEntry