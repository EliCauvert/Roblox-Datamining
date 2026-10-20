local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Parent.Components
local CellLabelModule = require(Components.CellLabel)
local BannerButtonModule = require(Components.BannerButton)
local LineGraphModule = require(Components.LineGraph)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local ValueCellWidth = ConstantsModule.MemoryFormatting.ValueCellWidth
local CellPadding = ConstantsModule.MemoryFormatting.CellPadding
local ValuePadding = ConstantsModule.MemoryFormatting.ValuePadding
local EntryFrameHeight = ConstantsModule.GeneralFormatting.EntryFrameHeight
local DepthIndent = ConstantsModule.MemoryFormatting.DepthIndent
local ConvertTimeStampModule = require(script.Parent.Parent.Parent.Util.convertTimeStamp)

return function(p1)
	-- upvalues: DepthIndent (copy), ValueCellWidth (copy), RoactModule (copy), BannerButtonModule (copy), EntryFrameHeight (copy), CellLabelModule (copy), CellPadding (copy), LineWidth (copy), LineColor (copy), ValuePadding (copy), LineGraphModule (copy), ConvertTimeStampModule (copy)
	local ShowGraph = p1.showGraph
	local DataStats = p1.dataStats
	local FormatValueStrFunction = p1.formatValueStr
	local GetX = p1.getX
	local GetY = p1.getY
	local ScaledDepth = p1.depth * DepthIndent
	local Name = p1.name
	local Data = if DataStats then DataStats.dataSet:back().data else p1.value
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.size,
		LayoutOrder = p1.layoutOrder
	}, {
		button = RoactModule.createElement(BannerButtonModule, {
			size = UDim2.new(1, -ScaledDepth, 0, EntryFrameHeight),
			pos = UDim2.new(0, ScaledDepth, 0, 0),
			isExpanded = ShowGraph,
			onButtonPress = p1.onButtonPress
		}, {
			name = RoactModule.createElement(CellLabelModule, {
				text = Name,
				size = UDim2.new(UDim.new(1 - ValueCellWidth, -ScaledDepth), UDim.new(1, 0)),
				pos = UDim2.new(0, CellPadding, 0, 0)
			}),
			horizonal1 = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, -ScaledDepth, 0, LineWidth),
				Position = UDim2.new(0, ScaledDepth, 0, 0),
				BackgroundColor3 = LineColor
			}),
			horizonal2 = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, -ScaledDepth, 0, LineWidth),
				Position = UDim2.new(0, ScaledDepth, 1, 0),
				BackgroundColor3 = LineColor
			})
		}),
		value = Data and RoactModule.createElement(CellLabelModule, {
			text = FormatValueStrFunction(Data),
			size = UDim2.new(ValueCellWidth, -ValuePadding, 0, EntryFrameHeight),
			pos = UDim2.new(1 - ValueCellWidth, ValuePadding, 0, 0)
		}),
		vertical = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, 1, 0, EntryFrameHeight),
			Position = UDim2.new(1 - ValueCellWidth, 0, 0, 0),
			BackgroundColor3 = LineColor
		}),
		Graph = ShowGraph and RoactModule.createElement(LineGraphModule, {
			axisLabelX = "Timestamp",
			pos = UDim2.new(0, 0, 0, EntryFrameHeight),
			size = UDim2.new(1, 0, 1, -EntryFrameHeight),
			graphData = DataStats.dataSet,
			maxY = DataStats.max,
			minY = DataStats.min,
			getX = GetX,
			getY = GetY,
			stringFormatX = ConvertTimeStampModule,
			stringFormatY = FormatValueStrFunction,
			axisLabelY = Name
		})
	})
end