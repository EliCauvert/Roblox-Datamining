local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local profilerUtilModule = require(script.Parent.ProfilerUtil)
local getDurations = profilerUtilModule.getDurations
local formatSessionLength = profilerUtilModule.formatSessionLength
local _ = require(script.Parent.ProfilerDataFormatV2)
local headerButtonModule = require(script.Parent.Parent.Parent.Components.HeaderButton)
local profilerViewEntryModule = require(script.Parent.ProfilerViewEntry)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local headerFrameHeight = constantsModule.GeneralFormatting.HeaderFrameHeight
local _ = constantsModule.GeneralFormatting.EntryFrameHeight
local _ = constantsModule.GeneralFormatting.NoResultSearchStr
local headerNames = constantsModule.ScriptProfilerFormatting.HeaderNames
local valueCellWidth = constantsModule.ScriptProfilerFormatting.ValueCellWidth
local cellPadding = constantsModule.ScriptProfilerFormatting.CellPadding
local valuePadding = constantsModule.ScriptProfilerFormatting.ValuePadding
local profilerView = roactModule.PureComponent:extend("ProfilerView")

function profilerView.renderChildren(p1)
	-- upvalues: getDurations (ref), roactModule (ref), profilerViewEntryModule (ref)
	local data = p1.props.data
	assert(data.Version == 2)
	
	return roactModule.createElement(profilerViewEntryModule, {
		layoutOrder = 0,
		depth = 0,
		data = data,
		nodeId = p1.props.rootNode,
		functionId = p1.props.rootFunc,
		nodeName = p1.props.rootNodeName,
		average = if p1.props.average > 0 and p1.props.sessionLength then p1.props.sessionLength / 1000 / p1.props.average else 1,
		searchTerm = p1.props.searchTerm,
		searchFilter = p1.props.searchFilter,
		showPlugins = p1.props.showPlugins,
		pluginOffsets = p1.props.pluginOffsets,
		showGC = p1.props.showGC,
		gcNodeOffsets = p1.props.gcNodeOffsets,
		pluginGCOffsets = p1.props.pluginGCOffsets,
		expandedNodes = p1.props.expandedNodes,
		percentageRatio = if p1.props.showAsPercentages then getDurations(data, 0) / 100 else nil
	})
end

function profilerView.render(p1)
	-- upvalues: roactModule (ref), constantsModule (ref), formatSessionLength (ref), headerFrameHeight (ref), headerButtonModule (ref), valueCellWidth (ref), valuePadding (ref), cellPadding (ref), lineColor (ref), headerNames (ref), lineWidth (ref)
	local layoutOrder = p1.props.layoutOrder
	local size = p1.props.size
	local textLabel = nil
	
	if p1.props.profiling and not p1.props.data then
		textLabel = roactModule.createElement("TextLabel", {
			Text = "Press Stop to Finish Profiling",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			TextColor3 = constantsModule.Color.Text,
			LayoutOrder = layoutOrder
		})
	elseif not p1.props.data then
		textLabel = roactModule.createElement("TextLabel", {
			Text = "Start Profiling to View Data",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			TextColor3 = constantsModule.Color.Text,
			LayoutOrder = layoutOrder
		})
	end
	local var1 = formatSessionLength(p1.props.sessionLength)
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder
	}, {
		SessionInfo = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, headerFrameHeight)
		}, {
			Name = roactModule.createElement(headerButtonModule, {
				text = var1 and "Session Duration: " .. var7 or "Session Info",
				size = UDim2.new(1 - valueCellWidth * 2, (-valuePadding) - cellPadding, 0, headerFrameHeight),
				pos = UDim2.new(0, cellPadding, 0, 0)
			}),
			TopHorizontal = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundColor3 = lineColor
			})
		}),
		Header = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, headerFrameHeight),
			Position = UDim2.new(0, 0, 0, headerFrameHeight)
		}, {
			Name = roactModule.createElement(headerButtonModule, {
				text = headerNames[1],
				size = UDim2.new(1 - valueCellWidth * 2, (-valuePadding) - cellPadding, 0, headerFrameHeight),
				pos = UDim2.new(0, cellPadding, 0, 0),
				sortfunction = p1.onSortChanged
			}),
			Inclusive = roactModule.createElement(headerButtonModule, {
				text = headerNames[2],
				size = UDim2.new(valueCellWidth, -cellPadding, 0, headerFrameHeight),
				pos = UDim2.new(1 - valueCellWidth * 2, valuePadding, 0, 0),
				sortfunction = p1.onSortChanged
			}),
			Self = roactModule.createElement(headerButtonModule, {
				text = headerNames[3],
				size = UDim2.new(valueCellWidth, -cellPadding, 0, headerFrameHeight),
				pos = UDim2.new(1 - valueCellWidth, valuePadding, 0, 0),
				sortfunction = p1.onSortChanged
			}),
			TopHorizontal = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundColor3 = lineColor
			}),
			LowerHorizontal = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, lineWidth),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = lineColor
			}),
			Vertical1 = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, lineWidth, 1, 0),
				Position = UDim2.new(1 - valueCellWidth, 0, 0, 0),
				BackgroundColor3 = lineColor
			}),
			Vertical2 = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, lineWidth, 1, 0),
				Position = UDim2.new(1 - valueCellWidth * 2, 0, 0, 0),
				BackgroundColor3 = lineColor
			})
		}),
		Entries = roactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			ScrollBarThickness = 5,
			Size = UDim2.new(1, 0, 1, -headerFrameHeight * 2),
			Position = UDim2.new(0, 0, 0, headerFrameHeight * 2),
			VerticalScrollBarInset = Enum.ScrollBarInset.None,
			CanvasSize = UDim2.fromScale(0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y
		}, {
			Layout = roactModule.createElement("UIListLayout", { FillDirection = Enum.FillDirection.Vertical }),
			Children = textLabel or roactModule.createFragment(p1:renderChildren())
		})
	})
end

return profilerView