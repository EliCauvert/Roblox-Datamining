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

local function getX(p0)
	return p0.time
end

local function getY(p1)
	return p1.value
end

local function stringFormatY(p2)
	return math.ceil(p2)
end

function dataStoresChart.init(p3, p4)
	local currentData, currentData_1 = p4.DataStoresData:getCurrentData()
	
	function p3.getOnButtonPress(p5)
		-- upvalues: p3 (ref)
		return function(_, _)
			-- upvalues: p3 (copy), p5 (ref)
			p3:setState({ expandedEntry = p3.state.expandedEntry ~= p5 and p5 })
		end
	end
	
	p3.state = {
		expandedEntry = nil,
		dataStoresData = currentData,
		dataStoresDataCount = currentData_1
	}
end

function dataStoresChart.didMount(p6)
	p6.statsConnector = p6.props.DataStoresData:Signal():Connect(function(p7, p8)
		-- upvalues: p6 (ref)
		p6:setState({ dataStoresData = p7, dataStoresDataCount = p8 })
	end)
end

function dataStoresChart.willUnmount(p9)
	p9.statsConnector:Disconnect()
	p9.statsConnector = nil
end

function dataStoresChart.render(p10)
	-- upvalues: roactModule (ref), headerFrameHeight (ref), entryFrameHeight (ref), lineGraphHeight (ref), bannerButtonModule (ref), cellLabelModule (ref), valueCellWidth (ref), cellPadding (ref), expandArrowPadding (ref), lineWidth (ref), lineColor (ref), lineGraphModule (ref), getX (ref), getY (ref), convertTimeStampModule (ref), stringFormatY (ref), constantsModule (ref), noResultSearchStr (ref), chartHeaderNames (ref)
	local t = {
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local searchTerm = p10.props.searchTerm
	local size = p10.props.size
	local layoutOrder = p10.props.layoutOrder
	local expandedEntry = p10.state.expandedEntry
	local var14 = headerFrameHeight
	local dataStoresData = p10.state.dataStoresData
	local var15 = 0
	local var16 = 1
	
	if dataStoresData then
		for i, v in pairs(dataStoresData) do
			var15 += 1
			
			if not searchTerm or string.find(i:lower(), searchTerm:lower()) ~= nil then
				var16 += 1
				local var17 = expandedEntry == i
				t[i] = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, if var17 then entryFrameHeight + lineGraphHeight else entryFrameHeight),
					LayoutOrder = var16
				}, {
					DataButton = roactModule.createElement(bannerButtonModule, {
						size = UDim2.new(1, 0, 0, entryFrameHeight),
						pos = UDim2.new(),
						isExpanded = var17,
						onButtonPress = p10.getOnButtonPress(i)
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
					Graph = var17 and roactModule.createElement(lineGraphModule, {
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
				var14 += entryFrameHeight
			end
		end
	end
	if var16 == 1 then
		if var15 == 0 then
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
			CanvasSize = UDim2.new(1, 0, 0, var14)
		}, t)
	})
end

return dataConsumerModule(dataStoresChart, "DataStoresData")