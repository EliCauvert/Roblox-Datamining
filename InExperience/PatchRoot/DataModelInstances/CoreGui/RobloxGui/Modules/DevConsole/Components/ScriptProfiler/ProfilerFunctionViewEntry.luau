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

local function BorderedCellLabel(p1)
	-- upvalues: roactModule (ref), cellLabelModule (ref), lineWidth (ref), valuePadding (ref), lineColor (ref)
	return roactModule.createFragment({
		Label = roactModule.createElement(cellLabelModule, { text = p1.text, size = p1.size, pos = p1.pos }),
		LeftBorder = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(UDim.new(0, lineWidth), p1.size.Y),
			Position = UDim2.fromOffset(-valuePadding, 0) + p1.pos,
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = lineColor
		})
	})
end

function profilerFunctionViewEntry.init(p1)
	p1.state = {
		showTooltip = false,
		expanded = p1.props.depth == 0,
		tooltipPos = UDim2.fromOffset(0, 0)
	}
	
	function p1.onButtonPress()
		-- upvalues: p1 (ref)
		p1:setState(function(_)
			-- upvalues: p1 (copy)
			return { expanded = not p1.state.expanded }
		end)
	end
	
	function p1.onMouseEnter(_, p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(p2, p3)
		})
	end
	
	function p1.onMouseMove(_, p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({
			showTooltip = true,
			tooltipPos = UDim2.fromOffset(p2, p3)
		})
	end
	
	function p1.onMouseLeave()
		-- upvalues: p1 (ref)
		p1:setState({ showTooltip = false })
	end
end

function profilerFunctionViewEntry.renderValues(_, p1)
	-- upvalues: valueCellWidth (ref), valuePadding (ref), entryFrameHeight (ref), roactModule (ref), BorderedCellLabel (ref)
	local t = {}
	local uDim2 = UDim2.new(valueCellWidth, -valuePadding, 0, entryFrameHeight)
	local uDim2_1 = UDim2.new(1 - valueCellWidth * #p1, valuePadding, 0, 0)
	
	for i, v in ipairs(p1) do
		t[tostring(i)] = roactModule.createElement(BorderedCellLabel, {
			text = tostring(v),
			size = uDim2,
			pos = uDim2_1 + UDim2.fromScale(valueCellWidth * (i - 1), 0)
		})
	end
	return t
end

function profilerFunctionViewEntry.render(p2)
	-- upvalues: entryFrameHeight (ref), getNativeFlag (ref), getPluginFlag (ref), profilerUtilModule (ref), valueCellWidth (ref), roactModule (ref), tooltipModule (ref), bannerButtonModule (ref), cellLabelModule (ref), cellPadding (ref)
	local props = p2.props
	local size = props.size or UDim2.new(1, 0, 0, entryFrameHeight)
	local layoutOrder = props.layoutOrder or 0
	local percentageRatio = props.percentageRatio
	local data = props.data
	local functionId = data.Functions[props.functionId]
	local var1 = functionId.TotalDuration / p2.props.average - (p2.props.gcOffset or 0)
	local var2 = getNativeFlag(data, functionId)
	local var3 = getPluginFlag(data, functionId)
	local list = {
		if percentageRatio then if percentageRatio == 0 then "N/A" else string.format("%.3f%%", var1 / percentageRatio) else string.format("%.3f", var1 * 1000)
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
	if var3 then
		nodeName ..= " <plugin>"
	end
	if var2 then
		nodeName ..= " <native>"
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		tooltip = if p2.state.showTooltip then roactModule.createElement(tooltipModule, { text = sourceLocationString, pos = p2.state.tooltipPos }) else nil,
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
			isExpanded = p2.state.expanded,
			onButtonPress = p2.onButtonPress,
			onMouseEnter = p2.onMouseEnter,
			onMouseLeave = p2.onMouseLeave,
			onMouseMove = p2.onMouseMove
		}, {
			name = roactModule.createElement(cellLabelModule, {
				text = nodeName,
				size = UDim2.new(UDim.new(1 - valueCellWidth * #list, 0), UDim.new(1, 0)),
				pos = UDim2.new(0, cellPadding + 0, 0, 0)
			}),
			values = roactModule.createFragment(p2:renderValues(list))
		})
	})
end

return profilerFunctionViewEntry