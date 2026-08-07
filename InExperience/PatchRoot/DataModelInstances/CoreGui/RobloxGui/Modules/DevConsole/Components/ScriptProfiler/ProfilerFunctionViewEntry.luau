local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local profilerUtilModule = require(script.Parent.ProfilerUtil)
local _ = profilerUtilModule.getDurations
local _ = profilerUtilModule.getSourceName
local _ = profilerUtilModule.getLine
local getNativeFlag = profilerUtilModule.getNativeFlag
local getPluginFlag = profilerUtilModule.getPluginFlag
local _ = profilerUtilModule.standardizeChildren
local components = script.Parent.Parent.Parent.Components
local cellLabelModule = require(components.CellLabel)
local bannerButtonModule = require(components.BannerButton)
local tooltipModule = require(components.Tooltip)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local entryFrameHeight = constantsModule.GeneralFormatting.EntryFrameHeight
local _ = constantsModule.ScriptProfilerFormatting.DepthIndent
local valueCellWidth = constantsModule.ScriptProfilerFormatting.ValueCellWidth
local cellPadding = constantsModule.ScriptProfilerFormatting.CellPadding
local valuePadding = constantsModule.ScriptProfilerFormatting.ValuePadding
local profilerFunctionViewEntry = roactModule.PureComponent:extend("ProfilerFunctionViewEntry")

local function BorderedCellLabel(p0) --[[ line: 42 ]]
	-- upvalues: roactModule (ref), cellLabelModule (ref), lineWidth (ref), valuePadding (ref), lineColor (ref)
	return roactModule.createFragment({
		Label = roactModule.createElement(cellLabelModule, { text = p0.text, size = p0.size, pos = p0.pos }),
		LeftBorder = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(UDim.new(0, lineWidth), p0.size.Y),
			Position = UDim2.fromOffset(-valuePadding, 0) + p0.pos,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = lineColor
		})
	})
end

function profilerFunctionViewEntry.init(p1) --[[ line: 59 ]]
	p1.state = {
		showTooltip = false,
		expanded = p1.props.depth == 0,
		tooltipPos = UDim2.fromOffset(0, 0)
	}
	
	function p1.onButtonPress() --[[ line: 66 ]]
		-- upvalues: p1 (ref)
		p1:setState(function(_) --[[ line: 67 ]]
			-- upvalues: p1 (copy)
			return { expanded = not p1.state.expanded }
		end)
	end
	
	function p1.onMouseEnter(_, p2, p3) --[[ line: 74 ]]
		-- upvalues: p1 (ref)
		p1:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(p2, p3)
		})
	end
	
	function p1.onMouseMove(_, p4, p5) --[[ line: 81 ]]
		-- upvalues: p1 (ref)
		p1:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(p4, p5)
		})
	end
	
	function p1.onMouseLeave() --[[ line: 88 ]]
		-- upvalues: p1 (ref)
		p1:setState({ showTooltip = false })
	end
end

function profilerFunctionViewEntry.renderValues(_, p6) --[[ line: 95 ]]
	-- upvalues: valueCellWidth (ref), valuePadding (ref), entryFrameHeight (ref), roactModule (ref), BorderedCellLabel (ref)
	local t = {}
	local uDim2 = UDim2.new(valueCellWidth, -valuePadding, 0, entryFrameHeight)
	local uDim2_1 = UDim2.new(1 - valueCellWidth * #p6, valuePadding, 0, 0)
	
	for i, v in ipairs(p6) do
		t[tostring(i)] = roactModule.createElement(BorderedCellLabel, {
			text = tostring(v),
			size = uDim2,
			pos = uDim2_1 + UDim2.fromScale(valueCellWidth * (i - 1), 0)
		})
	end
	return t
end

function profilerFunctionViewEntry.render(p7) --[[ line: 110 ]]
	-- upvalues: entryFrameHeight (ref), getNativeFlag (ref), getPluginFlag (ref), profilerUtilModule (ref), valueCellWidth (ref), roactModule (ref), tooltipModule (ref), bannerButtonModule (ref), cellLabelModule (ref), cellPadding (ref)
	local props = p7.props
	local size = props.size or UDim2.new(1, 0, 0, entryFrameHeight)
	local layoutOrder = props.layoutOrder or 0
	local percentageRatio = props.percentageRatio
	local data = props.data
	local functionId = data.Functions[props.functionId]
	local var13 = functionId.TotalDuration / p7.props.average - (p7.props.gcOffset or 0)
	local var14 = getNativeFlag(data, functionId)
	local var15 = getPluginFlag(data, functionId)
	local list = {
		if percentageRatio then if percentageRatio == 0 then "N/A" else string.format("%.3f%%", var13 / percentageRatio) else string.format("%.3f", var13 * 1000)
	}
	local nodeName = props.nodeName
	
	if not nodeName or #nodeName == 0 then
		nodeName = "<anonymous>"
	end
	local sourceLocationString = profilerUtilModule.getSourceLocationString(data, functionId, nodeName)
	
	if nodeName == "<anonymous>" then
		nodeName = sourceLocationString
		sourceLocationString = ""
	end
	if var15 then
		nodeName ..= " <plugin>"
	end
	if var14 then
		nodeName ..= " <native>"
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		tooltip = if p7.state.showTooltip then roactModule.createElement(tooltipModule, { text = sourceLocationString, pos = p7.state.tooltipPos }) else nil,
		layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		button = roactModule.createElement(bannerButtonModule, {
			inset = 0,
			isExpandable = false,
			layoutOrder = -1,
			size = UDim2.new(1, 0, 0, entryFrameHeight),
			isExpanded = p7.state.expanded,
			onButtonPress = p7.onButtonPress,
			onMouseEnter = p7.onMouseEnter,
			onMouseLeave = p7.onMouseLeave,
			onMouseMove = p7.onMouseMove
		}, {
			name = roactModule.createElement(cellLabelModule, {
				text = nodeName,
				size = UDim2.new(UDim.new(1 - valueCellWidth * #list, 0), UDim.new(1, 0)),
				pos = UDim2.new(0, cellPadding + 0, 0, 0)
			}),
			values = roactModule.createFragment(p7:renderValues(list))
		})
	})
end

return profilerFunctionViewEntry