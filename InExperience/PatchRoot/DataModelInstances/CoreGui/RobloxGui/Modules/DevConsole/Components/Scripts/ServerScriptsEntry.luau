local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local cellLabelModule = require(components.CellLabel)
local bannerButtonModule = require(components.BannerButton)
local lineGraphModule = require(components.LineGraph)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local chartHeaderNames = constantsModule.ServerScriptsFormatting.ChartHeaderNames
local entryFrameHeight = constantsModule.ServerScriptsFormatting.EntryFrameHeight
local activityBoxWidth = constantsModule.ServerScriptsFormatting.ActivityBoxWidth
local activityBoxPadding = constantsModule.ServerScriptsFormatting.ActivityBoxPadding
local uDim2 = UDim2.new(0, activityBoxPadding, 0, 0)
local lineGraphHeight = constantsModule.GeneralFormatting.LineGraphHeight
local convertTimeStampModule = require(script.Parent.Parent.Parent.Util.convertTimeStamp)

return function(p1)
	-- upvalues: roactModule (ref), bannerButtonModule (ref), entryFrameHeight (ref), activityBoxWidth (ref), activityBoxPadding (ref), cellLabelModule (ref), uDim2 (ref), lineWidth (ref), lineColor (ref), lineGraphModule (ref), lineGraphHeight (ref), convertTimeStampModule (ref), chartHeaderNames (ref)
	local scriptData = p1.scriptData
	local frameHeight = p1.frameHeight
	local showGraph = p1.showGraph
	local layoutOrder = p1.layoutOrder
	local activityBoxColor = p1.activityBoxColor
	local entryCellSize = p1.entryCellSize
	local cellOffset = p1.cellOffset
	local verticalOffsets = p1.verticalOffsets
	local onButtonPress = p1.onButtonPress
	local getX = p1.getX
	local getActivity = p1.getActivity
	local getRate = p1.getRate
	local formatScriptsData = p1.formatScriptsData
	local dataStats = scriptData.dataStats
	local var1 = dataStats.dataSet:back()
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, frameHeight),
		LayoutOrder = layoutOrder
	}, {
		button = roactModule.createElement(bannerButtonModule, {
			size = UDim2.new(1, 0, 0, entryFrameHeight),
			pos = UDim2.new(),
			isExpanded = showGraph,
			onButtonPress = onButtonPress
		}, {
			ActivityBox = roactModule.createElement("Frame", {
				Size = UDim2.new(0, activityBoxWidth, 0, activityBoxWidth),
				Position = UDim2.new(0, activityBoxPadding, 0, (entryFrameHeight - activityBoxWidth) / 2),
				BackgroundColor3 = activityBoxColor
			}),
			ScriptName = roactModule.createElement(cellLabelModule, {
				text = scriptData.name,
				size = entryCellSize[1] - uDim2,
				pos = cellOffset[1] + uDim2
			}),
			ScriptAcitivity = roactModule.createElement(cellLabelModule, {
				text = formatScriptsData(var1.data[1]),
				size = entryCellSize[2],
				pos = cellOffset[2]
			}),
			scriptFreqStr = roactModule.createElement(cellLabelModule, {
				text = formatScriptsData(var1.data[2]),
				size = entryCellSize[3],
				pos = cellOffset[3]
			}),
			upperHorizontalLine = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, lineWidth),
				BackgroundColor3 = lineColor
			}),
			verticalLine1 = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, lineWidth, 1, 0),
				Position = verticalOffsets[2],
				BackgroundColor3 = lineColor
			}),
			verticalLine2 = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, lineWidth, 1, 0),
				Position = verticalOffsets[3],
				BackgroundColor3 = lineColor
			}),
			lowerHorizontalLine = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, lineWidth),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = lineColor
			})
		}),
		ActivityGraph = showGraph and roactModule.createElement(lineGraphModule, {
			axisLabelX = "Timestamp",
			pos = UDim2.new(0, 0, 0, entryFrameHeight),
			size = UDim2.new(1, 0, 0, lineGraphHeight),
			graphData = dataStats.dataSet,
			maxY = dataStats.max[1],
			minY = dataStats.min[1],
			getX = getX,
			getY = getActivity,
			stringFormatX = convertTimeStampModule,
			stringFormatY = formatScriptsData,
			axisLabelY = chartHeaderNames[2]
		}),
		RateGraph = showGraph and roactModule.createElement(lineGraphModule, {
			axisLabelX = "Timestamp",
			pos = UDim2.new(0, 0, 0, entryFrameHeight + lineGraphHeight),
			size = UDim2.new(1, 0, 0, lineGraphHeight),
			graphData = dataStats.dataSet,
			maxY = dataStats.max[2],
			minY = dataStats.min[2],
			getX = getX,
			getY = getRate,
			stringFormatX = convertTimeStampModule,
			stringFormatY = formatScriptsData,
			axisLabelY = chartHeaderNames[3]
		})
	})
end