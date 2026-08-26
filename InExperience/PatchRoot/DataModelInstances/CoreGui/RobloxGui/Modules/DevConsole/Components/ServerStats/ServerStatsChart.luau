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

local function formatData(p1)
	return string.format("%.3f", p1)
end

local function getX(p1)
	return p1.time
end

local function getY(p1)
	return p1.value
end

function serverStats.init(p1)
	local currentData = p1.props.ServerStatsData:getCurrentData()
	
	function p3.getOnButtonPress(p2)
		-- upvalues: p1 (ref)
		return function(_, _)
			-- upvalues: p1 (copy), p2 (ref)
			p1:setState({ expandedEntry = p1.state.expandedEntry ~= p2 and p2 })
		end
	end
	
	p1.state = { serverStatsData = currentData }
end

function serverStats.didMount(p1)
	p1.statsConnector = p1.props.ServerStatsData:Signal():Connect(function(p2)
		-- upvalues: p1 (ref)
		p1:setState({ serverStatsData = p2 })
	end)
end

function serverStats.willUnmount(p1)
	p1.statsConnector:Disconnect()
	p1.statsConnector = nil
end

function serverStats.render(p1)
	-- upvalues: entryFrameHeight (ref), lineGraphHeight (ref), roactModule (ref), bannerButtonModule (ref), cellLabelModule (ref), valueCellWidth (ref), cellPadding (ref), expandArrowPadding (ref), lineWidth (ref), lineColor (ref), lineGraphModule (ref), getX (ref), getY (ref), convertTimeStampModule (ref), formatData (ref), constantsModule (ref), noResultSearchStr (ref), headerFrameHeight (ref), chartHeaderNames (ref)
	local t = {}
	local searchTerm = p1.props.searchTerm
	local layoutOrder = p1.props.layoutOrder
	local size = p1.props.size
	local expandedEntry = p1.state.expandedEntry
	local serverStatsData = p1.state.serverStatsData
	local var1 = 1
	local var2 = 0
	local var3 = 0
	
	if serverStatsData then
		for i, v in pairs(serverStatsData) do
			var2 += 1
			
			if not searchTerm or string.find(i:lower(), searchTerm:lower()) ~= nil then
				var1 += 1
				local var4 = expandedEntry == i
				var3 = if var4 then var3 + 1 else var3
				t[i] = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, if var4 then entryFrameHeight + lineGraphHeight else entryFrameHeight),
					LayoutOrder = var1
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
					Graph = var4 and roactModule.createElement(lineGraphModule, {
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
	if var1 == 1 then
		if var2 == 0 then
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
			CanvasSize = UDim2.new(1, 0, 0, var2 * entryFrameHeight + var3 * lineGraphHeight)
		}, t)
	})
end

return dataConsumerModule(serverStats, "ServerStatsData")