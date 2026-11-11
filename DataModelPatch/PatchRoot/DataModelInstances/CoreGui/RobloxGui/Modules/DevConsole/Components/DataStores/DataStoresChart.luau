local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Parent.Components
local DataConsumerModule = require(Components.DataConsumer)
local CellLabelModule = require(Components.CellLabel)
local BannerButtonModule = require(Components.BannerButton)
local LineGraphModule = require(Components.LineGraph)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local ChartHeaderNames = ConstantsModule.DataStoresFormatting.ChartHeaderNames
local ValueCellWidth = ConstantsModule.DataStoresFormatting.ValueCellWidth
local CellPadding = ConstantsModule.DataStoresFormatting.CellPadding
local ExpandArrowPadding = ConstantsModule.DataStoresFormatting.ExpandArrowPadding
local HeaderFrameHeight = ConstantsModule.DataStoresFormatting.HeaderFrameHeight
local EntryFrameHeight = ConstantsModule.DataStoresFormatting.EntryFrameHeight
local LineGraphHeight = ConstantsModule.GeneralFormatting.LineGraphHeight
local NoResultSearchStr = ConstantsModule.GeneralFormatting.NoResultSearchStr
local ConvertTimeStampModule = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
local DataStoresChart = RoactModule.Component:extend("DataStoresChart")

local function getX(p1)
	return p1.time
end

local function getY(p1)
	return p1.value
end

local function stringFormatY(Value: number): number
	return (math.ceil(Value))
end

function DataStoresChart.init(p1, p2)
	local CurrentData, CurrentData2 = p2.DataStoresData:getCurrentData()
	
	function p1.getOnButtonPress(ExpandedEntry)
		-- upvalues: p1 (copy)
		return function(_, _)
			-- upvalues: p1 (upval), ExpandedEntry (copy)
			p1:setState({
				expandedEntry = p1.state.expandedEntry ~= ExpandedEntry and ExpandedEntry
			})
		end
	end
	
	p1.state = {
		expandedEntry = nil,
		dataStoresData = CurrentData,
		dataStoresDataCount = CurrentData2
	}
end

function DataStoresChart.didMount(p1)
	p1.statsConnector = p1.props.DataStoresData:Signal():Connect(function(DataStoresData, DataStoresDataCount)
		-- upvalues: p1 (copy)
		p1:setState({
			dataStoresData = DataStoresData,
			dataStoresDataCount = DataStoresDataCount
		})
	end)
end

function DataStoresChart.willUnmount(p1)
	p1.statsConnector:Disconnect()
	p1.statsConnector = nil
end

function DataStoresChart.render(p1)
	-- upvalues: RoactModule (copy), HeaderFrameHeight (copy), EntryFrameHeight (copy), LineGraphHeight (copy), BannerButtonModule (copy), CellLabelModule (copy), ValueCellWidth (copy), CellPadding (copy), ExpandArrowPadding (copy), LineWidth (copy), LineColor (copy), LineGraphModule (copy), getX (copy), getY (copy), ConvertTimeStampModule (copy), stringFormatY (copy), ConstantsModule (copy), NoResultSearchStr (copy), ChartHeaderNames (copy)
	local SearchTerm: string = p1.props.searchTerm
	local Size = p1.props.size
	local LayoutOrder = p1.props.layoutOrder
	local ExpandedEntry = p1.state.expandedEntry
	local config = {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local YOffset = HeaderFrameHeight
	local DataStoresData = p1.state.dataStoresData
	local Count = 0
	local LayoutOrder1 = 1
	
	if DataStoresData then
		for Text, value in pairs(DataStoresData) do
			Count += 1
			
			if not SearchTerm or string.find(Text:lower(), SearchTerm:lower()) ~= nil then
				LayoutOrder1 += 1
				local IsExpandedEntryMatch = ExpandedEntry == Text
				config[Text] = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, IsExpandedEntryMatch and EntryFrameHeight + LineGraphHeight or EntryFrameHeight),
					LayoutOrder = LayoutOrder1
				}, {
					DataButton = RoactModule.createElement(BannerButtonModule, {
						size = UDim2.new(1, 0, 0, EntryFrameHeight),
						pos = UDim2.new(),
						isExpanded = IsExpandedEntryMatch,
						onButtonPress = p1.getOnButtonPress(Text)
					}, {
						[Text] = RoactModule.createElement(CellLabelModule, {
							text = Text,
							size = UDim2.new(1 - ValueCellWidth, -CellPadding - ExpandArrowPadding, 1, 0),
							pos = UDim2.new(0, CellPadding + ExpandArrowPadding, 0, 0)
						}),
						Data = RoactModule.createElement(CellLabelModule, {
							text = value.dataSet:back().value,
							size = UDim2.new(ValueCellWidth, -CellPadding, 1, 0),
							pos = UDim2.new(1 - ValueCellWidth, CellPadding, 0, 0)
						}),
						VerticalLine = RoactModule.createElement("Frame", {
							BorderSizePixel = 0,
							Size = UDim2.new(0, LineWidth, 0, EntryFrameHeight),
							Position = UDim2.new(1 - ValueCellWidth, 0, 0, 0),
							BackgroundColor3 = LineColor
						}),
						lowerHorizontalLine = RoactModule.createElement("Frame", {
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, LineWidth),
							Position = UDim2.new(0, 0, 1, 0),
							BackgroundColor3 = LineColor
						})
					}),
					Graph = IsExpandedEntryMatch and RoactModule.createElement(LineGraphModule, {
						axisLabelX = "Timestamp",
						pos = UDim2.new(0, 0, 0, EntryFrameHeight),
						size = UDim2.new(1, 0, 1, -EntryFrameHeight),
						graphData = value.dataSet,
						maxY = value.max,
						minY = value.min,
						getX = getX,
						getY = getY,
						axisLabelY = Text,
						stringFormatX = ConvertTimeStampModule,
						stringFormatY = stringFormatY
					})
				})
				YOffset += EntryFrameHeight
			end
		end
	end
	if LayoutOrder1 == 1 then
		if Count == 0 then
			return RoactModule.createElement("TextLabel", {
				Text = "Initialize DataStoresService to view DataStore Budget.",
				BackgroundTransparency = 1,
				Size = Size,
				TextColor3 = ConstantsModule.Color.Text,
				LayoutOrder = LayoutOrder
			})
		end
		config.emptyResult = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = Size,
			Text = string.format(NoResultSearchStr, SearchTerm),
			TextColor3 = ConstantsModule.Color.Text
		})
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		LayoutOrder = LayoutOrder
	}, {
		Header = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, HeaderFrameHeight)
		}, {
			[ChartHeaderNames[1]] = RoactModule.createElement(CellLabelModule, {
				text = ChartHeaderNames[1],
				size = UDim2.new(1 - ValueCellWidth, -CellPadding - ExpandArrowPadding, 1, 0),
				pos = UDim2.new(0, CellPadding + ExpandArrowPadding, 0, 0)
			}),
			[ChartHeaderNames[2]] = RoactModule.createElement(CellLabelModule, {
				text = ChartHeaderNames[2],
				size = UDim2.new(ValueCellWidth, -CellPadding, 1, 0),
				pos = UDim2.new(1 - ValueCellWidth, CellPadding, 0, 0)
			}),
			upperHorizontalLine = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, LineWidth),
				BackgroundColor3 = LineColor
			}),
			vertical = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, LineWidth, 1, 0),
				Position = UDim2.new(1 - ValueCellWidth, 0, 0, 0),
				BackgroundColor3 = LineColor
			}),
			lowerHorizontalLine = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, LineWidth),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = LineColor
			})
		}),
		mainFrame = RoactModule.createElement("ScrollingFrame", {
			ScrollBarThickness = 5,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, HeaderFrameHeight),
			Size = UDim2.new(1, 0, 1, -HeaderFrameHeight),
			CanvasSize = UDim2.new(1, 0, 0, YOffset)
		}, config)
	})
end

return DataConsumerModule(DataStoresChart, "DataStoresData")