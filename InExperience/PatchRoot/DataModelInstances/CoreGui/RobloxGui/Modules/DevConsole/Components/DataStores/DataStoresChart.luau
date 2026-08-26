local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local dataConsumerModule = require(components.DataConsumer)
local cellLabelModule = require(components.CellLabel)
local bannerButtonModule = require(components.BannerButton)
local lineGraphModule = require(components.LineGraph)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local chartHeaderNames = constantsModule.DataStoresFormatting.ChartHeaderNames
local valueCellWidth = constantsModule.DataStoresFormatting.ValueCellWidth
local cellPadding = constantsModule.DataStoresFormatting.CellPadding
local expandArrowPadding = constantsModule.DataStoresFormatting.ExpandArrowPadding
local headerFrameHeight = constantsModule.DataStoresFormatting.HeaderFrameHeight
local entryFrameHeight = constantsModule.DataStoresFormatting.EntryFrameHeight
local lineGraphHeight = constantsModule.GeneralFormatting.LineGraphHeight
local noResultSearchStr = constantsModule.GeneralFormatting.NoResultSearchStr
local convertTimeStampModule = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
local dataStoresChart = roactModule.Component:extend("DataStoresChart")

local function getX(p1)
	return p1.time
end

local function getY(p1)
	return p1.value
end

local function stringFormatY(p1)
	return math.ceil(p1)
end

function dataStoresChart.init(p1, p2)
	local currentData, currentData_1 = p2.DataStoresData:getCurrentData()
	
	function p3.getOnButtonPress(p3)
		-- upvalues: p1 (ref)
		return function(_, _)
			-- upvalues: p1 (copy), p3 (ref)
			p1:setState({ expandedEntry = p1.state.expandedEntry ~= p3 and p3 })
		end
	end
	
	p1.state = {
		expandedEntry = nil,
		dataStoresData = currentData,
		dataStoresDataCount = currentData_1
	}
end

function dataStoresChart.didMount(p1)
	p1.statsConnector = p1.props.DataStoresData:Signal():Connect(function(p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({ dataStoresData = p2, dataStoresDataCount = p3 })
	end)
end

function dataStoresChart.willUnmount(p1)
	p1.statsConnector:Disconnect()
	p1.statsConnector = nil
end

function dataStoresChart.render(p1)
	-- upvalues: roactModule (ref), headerFrameHeight (ref), entryFrameHeight (ref), lineGraphHeight (ref), bannerButtonModule (ref), cellLabelModule (ref), valueCellWidth (ref), cellPadding (ref), expandArrowPadding (ref), lineWidth (ref), lineColor (ref), lineGraphModule (ref), getX (ref), getY (ref), convertTimeStampModule (ref), stringFormatY (ref), constantsModule (ref), noResultSearchStr (ref), chartHeaderNames (ref)
	local t = {
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local searchTerm = p1.props.searchTerm
	local size = p1.props.size
	local layoutOrder = p1.props.layoutOrder
	local expandedEntry = p1.state.expandedEntry
	local var1 = headerFrameHeight
	local dataStoresData = p1.state.dataStoresData
	local var2 = 0
	local var3 = 1
	
	if dataStoresData then
		for i, v in pairs(dataStoresData) do
			var2 += 1
			
			if not searchTerm or string.find(i:lower(), searchTerm:lower()) ~= nil then
				var3 += 1
				local var4 = expandedEntry == i
				t[i] = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, if var4 then entryFrameHeight + lineGraphHeight else entryFrameHeight),
					LayoutOrder = var3
				}, {
					DataButton = roactModule.createElement(bannerButtonModule, {
						size = UDim2.new(1, 0, 0, entryFrameHeight),
						pos = UDim2.new(),
						isExpanded = var4,
						onButtonPress = p1.getOnButtonPress(i)
					}, {
						[i] = roactModule.createElement(cellLabelModule, {
							text = i,
							size = UDim2.new(1 - valueCellWidth, (-cellPadding) - expandArrowPadding, 1, 0),
							pos = UDim2.new(0, cellPadding + expandArrowPadding, 0, 0)
						}),
						Data = roactModule.createElement(cellLabelModule, {
							text = v.dataSet:back().value,
							size = UDim2.new(valueCellWidth, -cellPadding, 1, 0),
							pos = UDim2.new(1 - valueCellWidth, cellPadding, 0, 0)
						}),
						VerticalLine = roactModule.createElement("Frame", {
							BorderSizePixel = 0,
							Size = UDim2.new(0, lineWidth, 0, entryFrameHeight),
							Position = UDim2.new(1 - valueCellWidth, 0, 0, 0),
							BackgroundColor3 = lineColor
						}),
						lowerHorizontalLine = roactModule.createElement("Frame", {
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, lineWidth),
							Position = UDim2.new(0, 0, 1, 0),
							BackgroundColor3 = lineColor
						})
					}),
					Graph = var4 and roactModule.createElement(lineGraphModule, {
						axisLabelX = "Timestamp",
						pos = UDim2.new(0, 0, 0, entryFrameHeight),
						size = UDim2.new(1, 0, 1, -entryFrameHeight),
						graphData = v.dataSet,
						maxY = v.max,
						minY = v.min,
						getX = getX,
						getY = getY,
						axisLabelY = i,
						stringFormatX = convertTimeStampModule,
						stringFormatY = stringFormatY
					})
				})
				var1 += entryFrameHeight
			end
		end
	end
	if var3 == 1 then
		if var2 == 0 then
			return roactModule.createElement("TextLabel", {
				Text = "Initialize DataStoresService to view DataStore Budget.",
				BackgroundTransparency = 1,
				Size = size,
				TextColor3 = constantsModule.Color.Text,
				LayoutOrder = layoutOrder
			})
		end
		t.emptyResult = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = size,
			Text = string.format(noResultSearchStr, searchTerm),
			TextColor3 = constantsModule.Color.Text
		})
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder
	}, {
		Header = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, headerFrameHeight)
		}, {
			[chartHeaderNames[1]] = roactModule.createElement(cellLabelModule, {
				text = chartHeaderNames[1],
				size = UDim2.new(1 - valueCellWidth, (-cellPadding) - expandArrowPadding, 1, 0),
				pos = UDim2.new(0, cellPadding + expandArrowPadding, 0, 0)
			}),
			[chartHeaderNames[2]] = roactModule.createElement(cellLabelModule, {
				text = chartHeaderNames[2],
				size = UDim2.new(valueCellWidth, -cellPadding, 1, 0),
				pos = UDim2.new(1 - valueCellWidth, cellPadding, 0, 0)
			}),
			upperHorizontalLine = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, lineWidth),
				BackgroundColor3 = lineColor
			}),
			vertical = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, lineWidth, 1, 0),
				Position = UDim2.new(1 - valueCellWidth, 0, 0, 0),
				BackgroundColor3 = lineColor
			}),
			lowerHorizontalLine = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, lineWidth),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = lineColor
			})
		}),
		mainFrame = roactModule.createElement("ScrollingFrame", {
			ScrollBarThickness = 5,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, headerFrameHeight),
			Size = UDim2.new(1, 0, 1, -headerFrameHeight),
			CanvasSize = UDim2.new(1, 0, 0, var1)
		}, t)
	})
end

return dataConsumerModule(dataStoresChart, "DataStoresData")