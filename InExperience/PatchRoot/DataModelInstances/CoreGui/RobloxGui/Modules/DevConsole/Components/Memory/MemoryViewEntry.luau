local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local cellLabelModule = require(components.CellLabel)
local bannerButtonModule = require(components.BannerButton)
local lineGraphModule = require(components.LineGraph)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local valueCellWidth = constantsModule.MemoryFormatting.ValueCellWidth
local cellPadding = constantsModule.MemoryFormatting.CellPadding
local valuePadding = constantsModule.MemoryFormatting.ValuePadding
local entryFrameHeight = constantsModule.GeneralFormatting.EntryFrameHeight
local depthIndent = constantsModule.MemoryFormatting.DepthIndent
local convertTimeStampModule = require(script.Parent.Parent.Parent.Util.convertTimeStamp)

return function(p0) --[[ line: 22 ]]
	-- upvalues: depthIndent (ref), valueCellWidth (ref), roactModule (ref), bannerButtonModule (ref), entryFrameHeight (ref), cellLabelModule (ref), cellPadding (ref), lineWidth (ref), lineColor (ref), valuePadding (ref), lineGraphModule (ref), convertTimeStampModule (ref)
	local size = p0.size
	local depth = p0.depth
	local showGraph = p0.showGraph
	local dataStats = p0.dataStats
	local layoutOrder = p0.layoutOrder
	local onButtonPress = p0.onButtonPress
	local formatValueStr = p0.formatValueStr
	local getX = p0.getX
	local getY = p0.getY
	local var6 = depth * depthIndent
	local name = p0.name
	local var7 = if dataStats then dataStats.dataSet:back().data else p0.value
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder
	}, {
		button = roactModule.createElement(bannerButtonModule, {
			size = UDim2.new(1, -var6, 0, entryFrameHeight),
			pos = UDim2.new(0, var6, 0, 0),
			isExpanded = showGraph,
			onButtonPress = onButtonPress
		}, {
			name = roactModule.createElement(cellLabelModule, {
				text = name,
				size = UDim2.new(UDim.new(1 - valueCellWidth, -var6), UDim.new(1, 0)),
				pos = UDim2.new(0, cellPadding, 0, 0)
			}),
			horizonal1 = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, -var6, 0, lineWidth),
				Position = UDim2.new(0, var6, 0, 0),
				BackgroundColor3 = lineColor
			}),
			horizonal2 = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, -var6, 0, lineWidth),
				Position = UDim2.new(0, var6, 1, 0),
				BackgroundColor3 = lineColor
			})
		}),
		value = var7 and roactModule.createElement(cellLabelModule, {
			text = formatValueStr(var7),
			size = UDim2.new(valueCellWidth, -valuePadding, 0, entryFrameHeight),
			pos = UDim2.new(1 - valueCellWidth, valuePadding, 0, 0)
		}),
		vertical = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, 1, 0, entryFrameHeight),
			Position = UDim2.new(1 - valueCellWidth, 0, 0, 0),
			BackgroundColor3 = lineColor
		}),
		Graph = showGraph and roactModule.createElement(lineGraphModule, {
			axisLabelX = "Timestamp",
			pos = UDim2.new(0, 0, 0, entryFrameHeight),
			size = UDim2.new(1, 0, 1, -entryFrameHeight),
			graphData = dataStats.dataSet,
			maxY = dataStats.max,
			minY = dataStats.min,
			getX = getX,
			getY = getY,
			stringFormatX = convertTimeStampModule,
			stringFormatY = formatValueStr,
			axisLabelY = name
		})
	})
end