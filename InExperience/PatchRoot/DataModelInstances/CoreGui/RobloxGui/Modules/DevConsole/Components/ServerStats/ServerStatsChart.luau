local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local dataConsumerModule = require(components.DataConsumer)
local cellLabelModule = require(components.CellLabel)
local bannerButtonModule = require(components.BannerButton)
local lineGraphModule = require(components.LineGraph)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local chartHeaderNames = constantsModule.ServerStatsFormatting.ChartHeaderNames
local valueCellWidth = constantsModule.ServerStatsFormatting.ValueCellWidth
local cellPadding = constantsModule.ServerStatsFormatting.CellPadding
local expandArrowPadding = constantsModule.ServerStatsFormatting.ExpandArrowPadding
local headerFrameHeight = constantsModule.ServerStatsFormatting.HeaderFrameHeight
local entryFrameHeight = constantsModule.ServerStatsFormatting.EntryFrameHeight
local lineGraphHeight = constantsModule.GeneralFormatting.LineGraphHeight
local noResultSearchStr = constantsModule.GeneralFormatting.NoResultSearchStr
local convertTimeStampModule = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
local serverStats = roactModule.Component:extend("ServerStats")

local function formatData(p0)
	return string.format("%.3f", p0)
end

local function getX(p1)
	return p1.time
end

local function getY(p2)
	return p2.value
end

function serverStats.init(p3)
	local currentData = p3.props.ServerStatsData:getCurrentData()
	
	function p3.getOnButtonPress(p4)
		-- upvalues: p3 (ref)
		return function(_, _)
			-- upvalues: p3 (copy), p4 (ref)
			p3:setState({ expandedEntry = p3.state.expandedEntry ~= p4 and p4 })
		end
	end
	
	p3.state = { serverStatsData = currentData }
end

function serverStats.didMount(p5)
	p5.statsConnector = p5.props.ServerStatsData:Signal():Connect(function(p6)
		-- upvalues: p5 (ref)
		p5:setState({ serverStatsData = p6 })
	end)
end

function serverStats.willUnmount(p7)
	p7.statsConnector:Disconnect()
	p7.statsConnector = nil
end

function serverStats.render(p8)
	-- upvalues: entryFrameHeight (ref), lineGraphHeight (ref), roactModule (ref), bannerButtonModule (ref), cellLabelModule (ref), valueCellWidth (ref), cellPadding (ref), expandArrowPadding (ref), lineWidth (ref), lineColor (ref), lineGraphModule (ref), getX (ref), getY (ref), convertTimeStampModule (ref), formatData (ref), constantsModule (ref), noResultSearchStr (ref), headerFrameHeight (ref), chartHeaderNames (ref)
	local t = {}
	local searchTerm = p8.props.searchTerm
	local layoutOrder = p8.props.layoutOrder
	local size = p8.props.size
	local expandedEntry = p8.state.expandedEntry
	local serverStatsData = p8.state.serverStatsData
	local var13 = 1
	local var14 = 0
	local var15 = 0
	
	if serverStatsData then
		for i, v in pairs(serverStatsData) do
			var14 += 1
			
			if not searchTerm or string.find(i:lower(), searchTerm:lower()) ~= nil then
				var13 += 1
				local var16 = expandedEntry == i
				var15 = if var16 then var15 + 1 else var15
				t[i] = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, if var16 then entryFrameHeight + lineGraphHeight else entryFrameHeight),
					LayoutOrder = var13
				}, {
					DataButton = roactModule.createElement(bannerButtonModule, {
						size = UDim2.new(1, 0, 0, entryFrameHeight),
						pos = UDim2.new(),
						isExpanded = var16,
						onButtonPress = p8.getOnButtonPress(i)
					}, {
						[i] = roactModule.createElement(cellLabelModule, {
							text = i,
							size = UDim2.new(1 - valueCellWidth, (-cellPadding) - expandArrowPadding, 1, 0),
							pos = UDim2.new(0, cellPadding + expandArrowPadding, 0, 0)
						}),
						Data = roactModule.createElement(cellLabelModule, {
							text = string.format("%.3f", v.dataSet:back().value),
							size = UDim2.new(valueCellWidth, -cellPadding, 1, 0),
							pos = UDim2.new(1 - valueCellWidth, cellPadding, 0, 0)
						}),
						VerticalLine = roactModule.createElement("Frame", {
							BorderSizePixel = 0,
							Size = UDim2.new(0, lineWidth, 1, 0),
							Position = UDim2.new(1 - valueCellWidth, 0, 0, 0),
							BackgroundColor3 = lineColor
						}),
						HorizontalAlignment = roactModule.createElement("Frame", {
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, lineWidth),
							Position = UDim2.new(0, 0, 1, 0),
							BackgroundColor3 = lineColor
						})
					}),
					Graph = var16 and roactModule.createElement(lineGraphModule, {
						axisLabelX = "Timestamp",
						pos = UDim2.new(0, 0, 0, entryFrameHeight),
						size = UDim2.new(1, 0, 1, -entryFrameHeight),
						graphData = v.dataSet,
						minY = v.min,
						maxY = v.max,
						getX = getX,
						getY = getY,
						axisLabelY = i,
						stringFormatX = convertTimeStampModule,
						stringFormatY = formatData
					})
				})
			end
		end
	end
	if var13 == 1 then
		if var14 == 0 then
			return roactModule.createElement("TextLabel", {
				Text = "Awaiting Server Stats",
				BackgroundTransparency = 1,
				Size = size,
				Position = UDim2.new(0, 0, 0, 0),
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
	t.UIListLayout = roactModule.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder
	}, {
		Header = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
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
			VerticalLine = roactModule.createElement("Frame", {
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
			CanvasSize = UDim2.new(1, 0, 0, var14 * entryFrameHeight + var15 * lineGraphHeight)
		}, t)
	})
end

return dataConsumerModule(serverStats, "ServerStatsData")