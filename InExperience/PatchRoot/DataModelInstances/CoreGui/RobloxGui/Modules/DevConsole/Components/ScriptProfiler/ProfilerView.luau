local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ProfilerUtilModule = require(script.Parent.ProfilerUtil)
local GetDurationsFunction = ProfilerUtilModule.getDurations
local FormatSessionLengthFunction = ProfilerUtilModule.formatSessionLength
local _ = require(script.Parent.ProfilerDataFormatV2)
local HeaderButtonModule = require(script.Parent.Parent.Parent.Components.HeaderButton)
local ProfilerViewEntryModule = require(script.Parent.ProfilerViewEntry)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local HeaderFrameHeight = ConstantsModule.GeneralFormatting.HeaderFrameHeight
local _ = ConstantsModule.GeneralFormatting.EntryFrameHeight
local _ = ConstantsModule.GeneralFormatting.NoResultSearchStr
local HeaderNames = ConstantsModule.ScriptProfilerFormatting.HeaderNames
local ValueCellWidth = ConstantsModule.ScriptProfilerFormatting.ValueCellWidth
local CellPadding = ConstantsModule.ScriptProfilerFormatting.CellPadding
local ValuePadding = ConstantsModule.ScriptProfilerFormatting.ValuePadding
local ProfilerView = RoactModule.PureComponent:extend("ProfilerView")

function ProfilerView.renderChildren(p1)
	-- upvalues: GetDurationsFunction (copy), RoactModule (copy), ProfilerViewEntryModule (copy)
	local Data = p1.props.data
	assert(Data.Version == 2)
	local Durations: number = GetDurationsFunction(Data, 0)
	
	return RoactModule.createElement(ProfilerViewEntryModule, {
		layoutOrder = 0,
		depth = 0,
		data = Data,
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
		percentageRatio = if p1.props.showAsPercentages then Durations / 100 else nil
	})
end

function ProfilerView.render(p1)
	-- upvalues: RoactModule (copy), ConstantsModule (copy), FormatSessionLengthFunction (copy), HeaderFrameHeight (copy), HeaderButtonModule (copy), ValueCellWidth (copy), ValuePadding (copy), CellPadding (copy), LineColor (copy), HeaderNames (copy), LineWidth (copy)
	local LayoutOrder = p1.props.layoutOrder
	local Size = p1.props.size
	local TextLabel = if p1.props.profiling and not p1.props.data then RoactModule.createElement("TextLabel", {
		Text = "Press Stop to Finish Profiling",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		TextColor3 = ConstantsModule.Color.Text,
		LayoutOrder = LayoutOrder
	}) elseif p1.props.data then nil else RoactModule.createElement("TextLabel", {
		Text = "Start Profiling to View Data",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		TextColor3 = ConstantsModule.Color.Text,
		LayoutOrder = LayoutOrder
	})
	local FormatSessionLengthResult = FormatSessionLengthFunction(p1.props.sessionLength)
	
	if FormatSessionLengthResult then
		FormatSessionLengthResult = "Session Duration: " .. FormatSessionLengthResult
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		LayoutOrder = LayoutOrder
	}, {
		SessionInfo = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, HeaderFrameHeight)
		}, {
			Name = RoactModule.createElement(HeaderButtonModule, {
				text = FormatSessionLengthResult or "Session Info",
				size = UDim2.new(1 - ValueCellWidth * 2, -ValuePadding - CellPadding, 0, HeaderFrameHeight),
				pos = UDim2.new(0, CellPadding, 0, 0)
			}),
			TopHorizontal = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundColor3 = LineColor
			})
		}),
		Header = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, HeaderFrameHeight),
			Position = UDim2.new(0, 0, 0, HeaderFrameHeight)
		}, {
			Name = RoactModule.createElement(HeaderButtonModule, {
				text = HeaderNames[1],
				size = UDim2.new(1 - ValueCellWidth * 2, -ValuePadding - CellPadding, 0, HeaderFrameHeight),
				pos = UDim2.new(0, CellPadding, 0, 0),
				sortfunction = p1.onSortChanged
			}),
			Inclusive = RoactModule.createElement(HeaderButtonModule, {
				text = HeaderNames[2],
				size = UDim2.new(ValueCellWidth, -CellPadding, 0, HeaderFrameHeight),
				pos = UDim2.new(1 - ValueCellWidth * 2, ValuePadding, 0, 0),
				sortfunction = p1.onSortChanged
			}),
			Self = RoactModule.createElement(HeaderButtonModule, {
				text = HeaderNames[3],
				size = UDim2.new(ValueCellWidth, -CellPadding, 0, HeaderFrameHeight),
				pos = UDim2.new(1 - ValueCellWidth, ValuePadding, 0, 0),
				sortfunction = p1.onSortChanged
			}),
			TopHorizontal = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundColor3 = LineColor
			}),
			LowerHorizontal = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, LineWidth),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = LineColor
			}),
			Vertical1 = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, LineWidth, 1, 0),
				Position = UDim2.new(1 - ValueCellWidth, 0, 0, 0),
				BackgroundColor3 = LineColor
			}),
			Vertical2 = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, LineWidth, 1, 0),
				Position = UDim2.new(1 - ValueCellWidth * 2, 0, 0, 0),
				BackgroundColor3 = LineColor
			})
		}),
		Entries = RoactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			ScrollBarThickness = 5,
			Size = UDim2.new(1, 0, 1, -HeaderFrameHeight * 2),
			Position = UDim2.new(0, 0, 0, HeaderFrameHeight * 2),
			VerticalScrollBarInset = Enum.ScrollBarInset.None,
			CanvasSize = UDim2.fromScale(0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y
		}, {
			Layout = RoactModule.createElement("UIListLayout", { FillDirection = Enum.FillDirection.Vertical }),
			Children = if TextLabel then TextLabel else RoactModule.createFragment(p1:renderChildren())
		})
	})
end

return ProfilerView