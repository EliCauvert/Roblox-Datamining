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

return function(p1)
	-- upvalues: depthIndent (ref), valueCellWidth (ref), roactModule (ref), bannerButtonModule (ref), entryFrameHeight (ref), cellLabelModule (ref), cellPadding (ref), lineWidth (ref), lineColor (ref), valuePadding (ref), lineGraphModule (ref), convertTimeStampModule (ref)
	local size = p1.size
	local depth = p1.depth
	local showGraph = p1.showGraph
	local dataStats = p1.dataStats
	local layoutOrder = p1.layoutOrder
	local onButtonPress = p1.onButtonPress
	local formatValueStr = p1.formatValueStr
	local getX = p1.getX
	local getY = p1.getY
	local var1 = depth * depthIndent
	local name = p1.name
	local var2 = if dataStats then dataStats.dataSet:back().data else p1.value
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder
	}, {
		button = roactModule.createElement(bannerButtonModule, {
			size = UDim2.new(1, -var1, 0, entryFrameHeight),
			pos = UDim2.new(0, var1, 0, 0),
			isExpanded = showGraph,
			onButtonPress = onButtonPress
		}, {
			name = roactModule.createElement(cellLabelModule, {
				text = name,
				size = UDim2.new(UDim.new(1 - valueCellWidth, -var1), UDim.new(1, 0)),
				pos = UDim2.new(0, cellPadding, 0, 0)
			}),
			horizonal1 = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, -var1, 0, lineWidth),
				Position = UDim2.new(0, var1, 0, 0),
				BackgroundColor3 = lineColor
			}),
			horizonal2 = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, -var1, 0, lineWidth),
				Position = UDim2.new(0, var1, 1, 0),
				BackgroundColor3 = lineColor
			})
		}),
		value = var2 and roactModule.createElement(cellLabelModule, {
			text = formatValueStr(var2),
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