local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Parent.Components
local CellLabelModule = require(Components.CellLabel)
local BannerButtonModule = require(Components.BannerButton)
local LineGraphModule = require(Components.LineGraph)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local ChartHeaderNames = ConstantsModule.ServerScriptsFormatting.ChartHeaderNames
local EntryFrameHeight = ConstantsModule.ServerScriptsFormatting.EntryFrameHeight
local ActivityBoxWidth = ConstantsModule.ServerScriptsFormatting.ActivityBoxWidth
local ActivityBoxPadding = ConstantsModule.ServerScriptsFormatting.ActivityBoxPadding
local _UDim2 = UDim2.new(0, ActivityBoxPadding, 0, 0)
local LineGraphHeight = ConstantsModule.GeneralFormatting.LineGraphHeight
local ConvertTimeStampModule = require(script.Parent.Parent.Parent.Util.convertTimeStamp)

return function(p1)
	-- upvalues: RoactModule (copy), BannerButtonModule (copy), EntryFrameHeight (copy), ActivityBoxWidth (copy), ActivityBoxPadding (copy), CellLabelModule (copy), _UDim2 (copy), LineWidth (copy), LineColor (copy), LineGraphModule (copy), LineGraphHeight (copy), ConvertTimeStampModule (copy), ChartHeaderNames (copy)
	local ScriptData = p1.scriptData
	local ShowGraph = p1.showGraph
	local EntryCellSize = p1.entryCellSize
	local CellOffset = p1.cellOffset
	local VerticalOffsets = p1.verticalOffsets
	local GetX = p1.getX
	local GetActivity = p1.getActivity
	local GetRate = p1.getRate
	local FormatScriptsDataFunction = p1.formatScriptsData
	local DataStats = ScriptData.dataStats
	local BackResult = DataStats.dataSet:back()
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, p1.frameHeight),
		LayoutOrder = p1.layoutOrder
	}, {
		button = RoactModule.createElement(BannerButtonModule, {
			size = UDim2.new(1, 0, 0, EntryFrameHeight),
			pos = UDim2.new(),
			isExpanded = ShowGraph,
			onButtonPress = p1.onButtonPress
		}, {
			ActivityBox = RoactModule.createElement("Frame", {
				Size = UDim2.new(0, ActivityBoxWidth, 0, ActivityBoxWidth),
				Position = UDim2.new(0, ActivityBoxPadding, 0, (EntryFrameHeight - ActivityBoxWidth) / 2),
				BackgroundColor3 = p1.activityBoxColor
			}),
			ScriptName = RoactModule.createElement(CellLabelModule, {
				text = ScriptData.name,
				size = EntryCellSize[1] - _UDim2,
				pos = CellOffset[1] + _UDim2
			}),
			ScriptAcitivity = RoactModule.createElement(CellLabelModule, {
				text = FormatScriptsDataFunction(BackResult.data[1]),
				size = EntryCellSize[2],
				pos = CellOffset[2]
			}),
			scriptFreqStr = RoactModule.createElement(CellLabelModule, {
				text = FormatScriptsDataFunction(BackResult.data[2]),
				size = EntryCellSize[3],
				pos = CellOffset[3]
			}),
			upperHorizontalLine = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, LineWidth),
				BackgroundColor3 = LineColor
			}),
			verticalLine1 = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, LineWidth, 1, 0),
				Position = VerticalOffsets[2],
				BackgroundColor3 = LineColor
			}),
			verticalLine2 = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, LineWidth, 1, 0),
				Position = VerticalOffsets[3],
				BackgroundColor3 = LineColor
			}),
			lowerHorizontalLine = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, LineWidth),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = LineColor
			})
		}),
		ActivityGraph = ShowGraph and RoactModule.createElement(LineGraphModule, {
			axisLabelX = "Timestamp",
			pos = UDim2.new(0, 0, 0, EntryFrameHeight),
			size = UDim2.new(1, 0, 0, LineGraphHeight),
			graphData = DataStats.dataSet,
			maxY = DataStats.max[1],
			minY = DataStats.min[1],
			getX = GetX,
			getY = GetActivity,
			stringFormatX = ConvertTimeStampModule,
			stringFormatY = FormatScriptsDataFunction,
			axisLabelY = ChartHeaderNames[2]
		}),
		RateGraph = ShowGraph and RoactModule.createElement(LineGraphModule, {
			axisLabelX = "Timestamp",
			pos = UDim2.new(0, 0, 0, EntryFrameHeight + LineGraphHeight),
			size = UDim2.new(1, 0, 0, LineGraphHeight),
			graphData = DataStats.dataSet,
			maxY = DataStats.max[2],
			minY = DataStats.min[2],
			getX = GetX,
			getY = GetRate,
			stringFormatX = ConvertTimeStampModule,
			stringFormatY = FormatScriptsDataFunction,
			axisLabelY = ChartHeaderNames[3]
		})
	})
end