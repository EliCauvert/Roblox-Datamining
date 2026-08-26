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
	function(p1)
		return p1 and string.format("%.4f%%", p1) or ""
	end,
	function(p1)
		return p1 and string.format("%.4f/s", p1) or ""
	end,
	function(p1)
		return p1 and string.format("%.4fms", p1) or ""
	end
}
local noResultSearchStr = constantsModule.GeneralFormatting.NoResultSearchStr
local var1 = 0
local t = {}
local t_1 = {}
local t_2 = {}
local var2 = entryFrameHeight - lineWidth

for i, v in ipairs(valueCellWidth) do
	table.insert(t, UDim2.new(var1, cellPadding, 0, 0))
	table.insert(t_1, UDim2.new(v, -cellPadding, 0, headerFrameHeight))
	table.insert(t_2, UDim2.new(v, -cellPadding, 0, var2))
	var1 += v
end
local t_3 = {}

for i_1, v_1 in ipairs(t) do
	t_3[i_1] = UDim2.new(v_1.X.Scale, v_1.X.Offset - cellPadding, v_1.Y.Scale, v_1.Y.Offset)
end
local serverJobsChart = roactModule.Component:extend("ServerJobsChart")

local function getX(p1)
	return p1.time
end

local function getDutyCycle(p1)
	return p1.data[1]
end

local function getStepsPerSec(p1)
	return p1.data[2]
end

local function getStepTime(p1)
	return p1.data[3]
end

function serverJobsChart.init(p1, p2)
	-- upvalues: roactModule (ref)
	local currentData = p2.ServerJobsData:getCurrentData()
	
	function p7.getOnButtonPress(p3)
		-- upvalues: p1 (ref)
		return function(_, _)
			-- upvalues: p1 (copy), p3 (ref)
			p1:setState({ expandIndex = p1.state.expandIndex ~= p3 and p3 })
		end
	end
	
	function p7.onSortChanged(p3)
		-- upvalues: p2 (ref), p1 (ref)
		if p3 == p2.ServerJobsData:getSortType() then
			p1:setState({ reverseSort = not p1.state.reverseSort })
			
			return
		end
		p2.ServerJobsData:setSortType(p3)
		p1:setState({ reverseSort = false })
	end
	
	function p7.onCanvasPosChanged()
		-- upvalues: p1 (ref)
		local canvasPosition = p1.scrollingRef.current.CanvasPosition
		
		if p1.state.canvasPos ~= canvasPosition then
			p1:setState({ canvasPos = canvasPosition })
		end
	end
	
	p1.scrollingRef = roactModule.createRef()
	p1.state = {
		reverseSort = false,
		expandIndex = nil,
		serverJobsList = currentData
	}
end

function serverJobsChart.willUpdate(p1)
	if p1.canvasPosConnector then
		p1.canvasPosConnector:Disconnect()
	end
end

function serverJobsChart.didUpdate(p1)
	if p1.scrollingRef.current then
		p1.canvasPosConnector = p1.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p1.onCanvasPosChanged)
		local absoluteSize = p1.scrollingRef.current.AbsoluteSize
		local absScrollSize = p1.state.absScrollSize
		
		if absoluteSize.X ~= absScrollSize.X or absoluteSize.Y ~= absScrollSize.Y then
			p1:setState({ absScrollSize = absoluteSize })
		end
	end
end

function serverJobsChart.didMount(p1)
	p1.statsConnector = p1.props.ServerJobsData:Signal():Connect(function(p2)
		-- upvalues: p1 (ref)
		p1:setState({ serverJobsList = p2 })
	end)
	
	if p1.scrollingRef.current then
		p1.canvasPosConnector = p1.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p1.onCanvasPosChanged)
		p1:setState({
			absScrollSize = p1.scrollingRef.current.AbsoluteSize,
			canvasPos = p1.scrollingRef.current.CanvasPosition
		})
	end
end

function serverJobsChart.willUnmount(p1)
	p1.statsConnector:Disconnect()
	p1.statsConnector = nil
	
	if p1.canvasPosConnector then
		p1.canvasPosConnector:Disconnect()
		p1.canvasPosConnector = nil
	end
end

function serverJobsChart.render(p1)
	-- upvalues: minFrameWidth (ref), roactModule (ref), constantsModule (ref), entryFrameHeight (ref), lineGraphHeight (ref), cellPadding (ref), cellLabelModule (ref), t_1 (ref), t (ref), chartHeaderNames (ref), list (ref), t_3 (ref), lineWidth (ref), lineColor (ref), bannerButtonModule (ref), lineGraphModule (ref), getX (ref), getDutyCycle (ref), convertTimeStampModule (ref), getStepsPerSec (ref), getStepTime (ref), noResultSearchStr (ref), headerButtonModule (ref), headerFrameHeight (ref)
	local t_2 = {}
	local searchTerm = p1.props.searchTerm
	local size = p1.props.size
	local layoutOrder = p1.props.layoutOrder
	local serverJobsList = p1.state.serverJobsList
	local reverseSort = p1.state.reverseSort
	local expandIndex = p1.state.expandIndex
	local canvasPos = p1.state.canvasPos
	local absScrollSize = p1.state.absScrollSize
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
	local var3 = 0
	
	if absScrollSize then
		local var4 = -1
		local var5 = 0
		
		for i, v in pairs(serverJobsList) do
			local name = v.name
			
			if not searchTerm or string.find(name:lower(), searchTerm:lower()) ~= nil then
				local dataStats = v.dataStats
				local var6 = dataStats.dataSet:back()
				local var7 = expandIndex == name
				local var8 = if var7 then entryFrameHeight + 3 * lineGraphHeight / 2 + cellPadding * 4 else entryFrameHeight
				
				if canvasPos.Y <= var3 + var8 then
					if var5 < absScrollSize.Y then
						local var9 = if reverseSort then serverJobsListCount - i else i
						local t_4 = {
							[name] = roactModule.createElement(cellLabelModule, { text = name, size = t_1[1], pos = t[1] })
						}
						
						for i_1, v_1 in pairs(var6.data) do
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
							Size = UDim2.new(0, x, 0, var8),
							LayoutOrder = var9 + 1
						}, {
							Button = roactModule.createElement(bannerButtonModule, {
								size = UDim2.new(1, 0, 0, entryFrameHeight),
								pos = UDim2.new(),
								isExpanded = var7,
								onButtonPress = p1.getOnButtonPress(name)
							}, t_4),
							DutyCycleGraph = var7 and roactModule.createElement(lineGraphModule, {
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
							StepsPerSecGraph = var7 and roactModule.createElement(lineGraphModule, {
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
							StepTimeGraph = var7 and roactModule.createElement(lineGraphModule, {
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
					if var4 < 0 then
						var4 = var3
					else
						var5 += var8
					end
				end
				var3 += var8
			end
		end
		if var4 == -1 then
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
				Size = UDim2.new(1, 0, 0, var4)
			})
		end
	end
	local t_4 = {}
	
	for i = 1, #chartHeaderNames do
		t_4[chartHeaderNames[i]] = roactModule.createElement(headerButtonModule, {
			text = chartHeaderNames[i],
			size = t_1[i],
			pos = t[i],
			sortfunction = p1.onSortChanged
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
			CanvasSize = UDim2.new(0, x, 0, var3),
			[roactModule.Ref] = p1.scrollingRef
		}, t_2)
	})
end

return dataConsumerModule(serverJobsChart, "ServerJobsData")