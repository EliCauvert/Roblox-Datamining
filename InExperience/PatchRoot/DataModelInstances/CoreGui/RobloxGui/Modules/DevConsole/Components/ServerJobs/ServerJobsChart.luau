local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local dataConsumerModule = require(components.DataConsumer)
local headerButtonModule = require(components.HeaderButton)
local cellLabelModule = require(components.CellLabel)
local bannerButtonModule = require(components.BannerButton)
local lineGraphModule = require(components.LineGraph)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local chartHeaderNames = constantsModule.ServerJobsFormatting.ChartHeaderNames
local valueCellWidth = constantsModule.ServerJobsFormatting.ValueCellWidth
local entryFrameHeight = constantsModule.ServerJobsFormatting.EntryFrameHeight
local headerFrameHeight = constantsModule.ServerJobsFormatting.HeaderFrameHeight
local cellPadding = constantsModule.ServerJobsFormatting.CellPadding
local minFrameWidth = constantsModule.ServerJobsFormatting.MinFrameWidth
local lineGraphHeight = constantsModule.GeneralFormatting.LineGraphHeight
local convertTimeStampModule = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
local list = {
	function(p0)
		return p0 and string.format("%.4f%%", p0) or ""
	end,
	function(p1)
		return p1 and string.format("%.4f/s", p1) or ""
	end,
	function(p2)
		return p2 and string.format("%.4fms", p2) or ""
	end
}
local noResultSearchStr = constantsModule.GeneralFormatting.NoResultSearchStr
local var9 = 0
local t = {}
local t_1 = {}
local t_2 = {}
local var13 = entryFrameHeight - lineWidth

for i, v in ipairs(valueCellWidth) do
	table.insert(t, UDim2.new(var9, cellPadding, 0, 0))
	table.insert(t_1, UDim2.new(v, -cellPadding, 0, headerFrameHeight))
	table.insert(t_2, UDim2.new(v, -cellPadding, 0, var13))
	var9 += v
end
local t_3 = {}

for i_1, v_1 in ipairs(t) do
	t_3[i_1] = UDim2.new(v_1.X.Scale, v_1.X.Offset - cellPadding, v_1.Y.Scale, v_1.Y.Offset)
end
local serverJobsChart = roactModule.Component:extend("ServerJobsChart")

local function getX(p3)
	return p3.time
end

local function getDutyCycle(p4)
	return p4.data[1]
end

local function getStepsPerSec(p5)
	return p5.data[2]
end

local function getStepTime(p6)
	return p6.data[3]
end

function serverJobsChart.init(p7, p8)
	-- upvalues: roactModule (ref)
	local currentData = p8.ServerJobsData:getCurrentData()
	
	function p7.getOnButtonPress(p9)
		-- upvalues: p7 (ref)
		return function(_, _)
			-- upvalues: p7 (copy), p9 (ref)
			p7:setState({ expandIndex = p7.state.expandIndex ~= p9 and p9 })
		end
	end
	
	function p7.onSortChanged(p10)
		-- upvalues: p8 (ref), p7 (ref)
		if p10 == p8.ServerJobsData:getSortType() then
			p7:setState({ reverseSort = not p7.state.reverseSort })
			
			return
		end
		p8.ServerJobsData:setSortType(p10)
		p7:setState({ reverseSort = false })
	end
	
	function p7.onCanvasPosChanged()
		-- upvalues: p7 (ref)
		local canvasPosition = p7.scrollingRef.current.CanvasPosition
		
		if p7.state.canvasPos ~= canvasPosition then
			p7:setState({ canvasPos = canvasPosition })
		end
	end
	
	p7.scrollingRef = roactModule.createRef()
	p7.state = {
		reverseSort = false,
		expandIndex = nil,
		serverJobsList = currentData
	}
end

function serverJobsChart.willUpdate(p11)
	if p11.canvasPosConnector then
		p11.canvasPosConnector:Disconnect()
	end
end

function serverJobsChart.didUpdate(p12)
	if p12.scrollingRef.current then
		p12.canvasPosConnector = p12.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p12.onCanvasPosChanged)
		local absoluteSize = p12.scrollingRef.current.AbsoluteSize
		local absScrollSize = p12.state.absScrollSize
		
		if absoluteSize.X ~= absScrollSize.X or absoluteSize.Y ~= absScrollSize.Y then
			p12:setState({ absScrollSize = absoluteSize })
		end
	end
end

function serverJobsChart.didMount(p13)
	p13.statsConnector = p13.props.ServerJobsData:Signal():Connect(function(p14)
		-- upvalues: p13 (ref)
		p13:setState({ serverJobsList = p14 })
	end)
	
	if p13.scrollingRef.current then
		p13.canvasPosConnector = p13.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p13.onCanvasPosChanged)
		p13:setState({
			absScrollSize = p13.scrollingRef.current.AbsoluteSize,
			canvasPos = p13.scrollingRef.current.CanvasPosition
		})
	end
end

function serverJobsChart.willUnmount(p15)
	p15.statsConnector:Disconnect()
	p15.statsConnector = nil
	
	if p15.canvasPosConnector then
		p15.canvasPosConnector:Disconnect()
		p15.canvasPosConnector = nil
	end
end

function serverJobsChart.render(p16)
	-- upvalues: minFrameWidth (ref), roactModule (ref), constantsModule (ref), entryFrameHeight (ref), lineGraphHeight (ref), cellPadding (ref), cellLabelModule (ref), t_1 (ref), t (ref), chartHeaderNames (ref), list (ref), t_3 (ref), lineWidth (ref), lineColor (ref), bannerButtonModule (ref), lineGraphModule (ref), getX (ref), getDutyCycle (ref), convertTimeStampModule (ref), getStepsPerSec (ref), getStepTime (ref), noResultSearchStr (ref), headerButtonModule (ref), headerFrameHeight (ref)
	local t_2 = {}
	local searchTerm = p16.props.searchTerm
	local size = p16.props.size
	local layoutOrder = p16.props.layoutOrder
	local serverJobsList = p16.state.serverJobsList
	local reverseSort = p16.state.reverseSort
	local expandIndex = p16.state.expandIndex
	local canvasPos = p16.state.canvasPos
	local absScrollSize = p16.state.absScrollSize
	local x = absScrollSize and math.max(absScrollSize.X, minFrameWidth) or minFrameWidth
	local serverJobsListCount = #serverJobsList
	
	if serverJobsListCount == 0 then
		return roactModule.createElement("TextLabel", {
			Text = "Awaiting Server Jobs Information",
			BackgroundTransparency = 1,
			Size = size,
			Position = UDim2.new(0, 0, 0, 0),
			TextColor3 = constantsModule.Color.Text,
			LayoutOrder = layoutOrder
		})
	end
	local var24 = 0
	
	if absScrollSize then
		local var25 = -1
		local var26 = 0
		
		for i, v in pairs(serverJobsList) do
			local name = v.name
			
			if not searchTerm or string.find(name:lower(), searchTerm:lower()) ~= nil then
				local dataStats = v.dataStats
				local var27 = dataStats.dataSet:back()
				local var28 = expandIndex == name
				local var29 = if var28 then entryFrameHeight + 3 * lineGraphHeight / 2 + cellPadding * 4 else entryFrameHeight
				
				if canvasPos.Y <= var24 + var29 then
					if var26 < absScrollSize.Y then
						local var30 = if reverseSort then serverJobsListCount - i else i
						local t_4 = {
							[name] = roactModule.createElement(cellLabelModule, { text = name, size = t_1[1], pos = t[1] })
						}
						
						for i_1, v_1 in pairs(var27.data) do
							t_4[chartHeaderNames[i_1]] = roactModule.createElement(cellLabelModule, {
								text = list[i_1](v_1),
								size = t_1[i_1 + 1],
								pos = t[i_1 + 1]
							})
						end
						for i_2 = 2, #t_3 do
							t_4[string.format("VerticalLine_%d", i_2)] = roactModule.createElement("Frame", {
								BorderSizePixel = 0,
								Size = UDim2.new(0, lineWidth, 1, 0),
								Position = t_3[i_2],
								BackgroundColor3 = lineColor
							})
						end
						t_4.lowerHorizontalLine = roactModule.createElement("Frame", {
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, lineWidth),
							Position = UDim2.new(0, 0, 1, 0),
							BackgroundColor3 = lineColor
						})
						t_2[name] = roactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Size = UDim2.new(0, x, 0, var29),
							LayoutOrder = var30 + 1
						}, {
							Button = roactModule.createElement(bannerButtonModule, {
								size = UDim2.new(1, 0, 0, entryFrameHeight),
								pos = UDim2.new(),
								isExpanded = var28,
								onButtonPress = p16.getOnButtonPress(name)
							}, t_4),
							DutyCycleGraph = var28 and roactModule.createElement(lineGraphModule, {
								axisLabelX = "Timestamp",
								pos = UDim2.new(0, 0, 0, entryFrameHeight + cellPadding),
								size = UDim2.new(0, x, 0, lineGraphHeight / 2),
								graphData = dataStats.dataSet,
								maxY = dataStats.max[1],
								minY = dataStats.min[1],
								getX = getX,
								getY = getDutyCycle,
								stringFormatX = convertTimeStampModule,
								stringFormatY = list[1],
								axisLabelY = name .. " " .. chartHeaderNames[2]
							}),
							StepsPerSecGraph = var28 and roactModule.createElement(lineGraphModule, {
								axisLabelX = "Timestamp",
								pos = UDim2.new(0, 0, 0, entryFrameHeight + lineGraphHeight / 2 + cellPadding * 2),
								size = UDim2.new(0, x, 0, lineGraphHeight / 2),
								graphData = dataStats.dataSet,
								maxY = dataStats.max[2],
								minY = dataStats.min[2],
								getX = getX,
								getY = getStepsPerSec,
								stringFormatX = convertTimeStampModule,
								stringFormatY = list[2],
								axisLabelY = name .. " " .. chartHeaderNames[3]
							}),
							StepTimeGraph = var28 and roactModule.createElement(lineGraphModule, {
								axisLabelX = "Timestamp",
								pos = UDim2.new(0, 0, 0, entryFrameHeight + lineGraphHeight + cellPadding * 3),
								size = UDim2.new(0, x, 0, lineGraphHeight / 2),
								graphData = dataStats.dataSet,
								maxY = dataStats.max[3],
								minY = dataStats.min[3],
								getX = getX,
								getY = getStepTime,
								stringFormatX = convertTimeStampModule,
								stringFormatY = list[3],
								axisLabelY = name .. " " .. chartHeaderNames[4]
							})
						})
					end
					if var25 < 0 then
						var25 = var24
					else
						var26 += var29
					end
				end
				var24 += var29
			end
		end
		if var25 == -1 then
			t_2.emptyResult = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = size,
				Text = string.format(noResultSearchStr, searchTerm),
				TextColor3 = constantsModule.Color.Text
			})
		else
			t_2.WindowingPadding = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, var25)
			})
		end
	end
	local t_4 = {}
	
	for i = 1, #chartHeaderNames do
		t_4[chartHeaderNames[i]] = roactModule.createElement(headerButtonModule, {
			text = chartHeaderNames[i],
			size = t_1[i],
			pos = t[i],
			sortfunction = p16.onSortChanged
		})
	end
	t_4.upperHorizontalLine = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, lineWidth),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = lineColor
	})
	t_4.lowerHorizontalLine = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, lineWidth),
		Position = UDim2.new(0, 0, 1, -lineWidth),
		BackgroundColor3 = lineColor
	})
	
	for i_1 = 2, #t_3 do
		t_4[string.format("VerticalLine_%d", i_1)] = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, lineWidth, 1, 0),
			Position = t_3[i_1],
			BackgroundColor3 = lineColor
		})
	end
	t_2.UIListLayout = roactModule.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = size,
		LayoutOrder = layoutOrder
	}, {
		Header = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, x, 0, headerFrameHeight)
		}, t_4),
		MainChart = roactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, -headerFrameHeight),
			Position = UDim2.new(0, 0, 0, headerFrameHeight),
			BackgroundTransparency = 1,
			VerticalScrollBarInset = 1,
			ScrollBarThickness = 5,
			CanvasSize = UDim2.new(0, x, 0, var24),
			[roactModule.Ref] = p16.scrollingRef
		}, t_2)
	})
end

return dataConsumerModule(serverJobsChart, "ServerJobsData")