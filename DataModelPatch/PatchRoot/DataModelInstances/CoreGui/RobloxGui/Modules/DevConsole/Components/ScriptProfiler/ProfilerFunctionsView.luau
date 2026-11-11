local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local _ = require(script.Parent.ProfilerDataFormatV2)
local ProfilerUtilModule = require(script.Parent.ProfilerUtil)
local GetDurationsFunction = ProfilerUtilModule.getDurations
local FormatSessionLengthFunction = ProfilerUtilModule.formatSessionLength
local GetPluginFlagFunction = ProfilerUtilModule.getPluginFlag
local HeaderButtonModule = require(script.Parent.Parent.Parent.Components.HeaderButton)
local ProfilerFunctionViewEntryModule = require(script.Parent.ProfilerFunctionViewEntry)
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
	-- upvalues: GetDurationsFunction (copy), GetPluginFlagFunction (copy), RoactModule (copy), ProfilerFunctionViewEntryModule (copy)
	local Data = p1.props.data
	assert(Data.Version == 2)
	local Durations: number = GetDurationsFunction(Data, 0)
	local Elements = {}
	local SearchFilter = p1.props.searchFilter
	local ShowPlugins = p1.props.showPlugins
	local ShowGC = p1.props.showGC
	local GcFunctionOffsets = p1.props.gcFunctionOffsets
	local SessionLengthRatio = if p1.props.average > 0 and p1.props.sessionLength then p1.props.sessionLength / 1000 / p1.props.average else 1
	for FunctionId, _function in ipairs(Data.Functions) do
		if (#SearchFilter <= 0 or SearchFilter[FunctionId]) and (ShowPlugins or not GetPluginFlagFunction(Data, _function)) then
			Elements[FunctionId] = RoactModule.createElement(ProfilerFunctionViewEntryModule, {
				layoutOrder = (Durations - _function.TotalDuration) * 1000000,
				data = Data,
				functionId = FunctionId,
				nodeName = _function.Name,
				average = SessionLengthRatio,
				gcOffset = if ShowGC then nil else GcFunctionOffsets[FunctionId],
				percentageRatio = if p1.props.showAsPercentages then Durations / 100 else nil
			})
		end
	end
	return Elements
end

function ProfilerView.render(p2)
	-- upvalues: RoactModule (copy), ConstantsModule (copy), FormatSessionLengthFunction (copy), HeaderFrameHeight (copy), HeaderButtonModule (copy), ValueCellWidth (copy), ValuePadding (copy), CellPadding (copy), LineColor (copy), HeaderNames (copy), LineWidth (copy)
	local LayoutOrder = p2.props.layoutOrder
	local Size = p2.props.size
	local TextLabel = if p2.props.profiling and not p2.props.data then RoactModule.createElement("TextLabel", {
		Text = "Press Stop to Finish Profiling",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		TextColor3 = ConstantsModule.Color.Text,
		LayoutOrder = LayoutOrder
	}) elseif p2.props.data then nil else RoactModule.createElement("TextLabel", {
		Text = "Start Profiling to View Data",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		TextColor3 = ConstantsModule.Color.Text,
		LayoutOrder = LayoutOrder
	})
	local FormatSessionLengthResult = FormatSessionLengthFunction(p2.props.sessionLength)
	
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
				sortfunction = p2.onSortChanged
			}),
			Inclusive = RoactModule.createElement(HeaderButtonModule, {
				text = HeaderNames[2],
				size = UDim2.new(ValueCellWidth, -CellPadding, 0, HeaderFrameHeight),
				pos = UDim2.new(1 - ValueCellWidth * 1, ValuePadding, 0, 0),
				sortfunction = p2.onSortChanged
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
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Children = if TextLabel then TextLabel else RoactModule.createFragment(p2:renderChildren())
		})
	})
end

return ProfilerView