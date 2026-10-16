local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Parent.Components
local DataConsumerModule = require(Components.DataConsumer)
local HeaderButtonModule = require(Components.HeaderButton)
local CellLabelModule = require(Components.CellLabel)
local BannerButtonModule = require(Components.BannerButton)
local LineGraphModule = require(Components.LineGraph)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local ChartHeaderNames = ConstantsModule.ServerJobsFormatting.ChartHeaderNames
local EntryFrameHeight = ConstantsModule.ServerJobsFormatting.EntryFrameHeight
local HeaderFrameHeight = ConstantsModule.ServerJobsFormatting.HeaderFrameHeight
local CellPadding = ConstantsModule.ServerJobsFormatting.CellPadding
local MinFrameWidth = ConstantsModule.ServerJobsFormatting.MinFrameWidth
local LineGraphHeight = ConstantsModule.GeneralFormatting.LineGraphHeight
local ConvertTimeStampModule = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
local list = {
	function(p1): string --[[ Line: 27 ]]
		return p1 and string.format("%.4f%%", p1) or ""
	end,
	function(p1): string --[[ Line: 30 ]]
		return p1 and string.format("%.4f/s", p1) or ""
	end,
	function(p1): string --[[ Line: 33 ]]
		return p1 and string.format("%.4fms", p1) or ""
	end
}
local NoResultSearchStr = ConstantsModule.GeneralFormatting.NoResultSearchStr
local XScale = 0
local List = {}
local List1 = {}
local List2 = {}
local YOffset = EntryFrameHeight - LineWidth

for _, XScale1 in ipairs(ConstantsModule.ServerJobsFormatting.ValueCellWidth) do
	table.insert(List, UDim2.new(XScale, CellPadding, 0, 0))
	table.insert(List1, UDim2.new(XScale1, -CellPadding, 0, HeaderFrameHeight))
	table.insert(List2, UDim2.new(XScale1, -CellPadding, 0, YOffset))
	XScale += XScale1
end
local t = {}

for i, Vector in ipairs(List) do
	t[i] = UDim2.new(Vector.X.Scale, Vector.X.Offset - CellPadding, Vector.Y.Scale, Vector.Y.Offset)
end
local ServerJobsChart = RoactModule.Component:extend("ServerJobsChart")

local function getX(p1) --[[ Line: 63 ]]
	return p1.time
end

local function getDutyCycle(p1) --[[ Line: 67 ]]
	return p1.data[1]
end

local function getStepsPerSec(p1) --[[ Line: 71 ]]
	return p1.data[2]
end

local function getStepTime(p1) --[[ Line: 75 ]]
	return p1.data[3]
end

function ServerJobsChart.init(p1, p2) --[[ Line: 79 ]]
	-- upvalues: RoactModule (copy)
	local CurrentData = p2.ServerJobsData:getCurrentData()
	
	function p1.getOnButtonPress(Name) --[[ Line: 82 ]]
		-- upvalues: p1 (copy)
		return function(_, _) --[[ Line: 83 ]]
			-- upvalues: p1 (upval), Name (copy)
			p1:setState({ expandIndex = p1.state.expandIndex ~= Name and Name })
		end
	end
	
	function p1.onSortChanged(SortType) --[[ Line: 90 ]]
		-- upvalues: p2 (copy), p1 (copy)
		if SortType == p2.ServerJobsData:getSortType() then
			p1:setState({ reverseSort = not p1.state.reverseSort })
			
			return
		else
			p2.ServerJobsData:setSortType(SortType)
			p1:setState({ reverseSort = false })
		end
	end
	
	function p1.onCanvasPosChanged() --[[ Line: 104 ]]
		-- upvalues: p1 (copy)
		local CanvasPosition = p1.scrollingRef.current.CanvasPosition
		
		if p1.state.canvasPos ~= CanvasPosition then
			p1:setState({ canvasPos = CanvasPosition })
		end
	end
	
	p1.scrollingRef = RoactModule.createRef()
	p1.state = {
		reverseSort = false,
		expandIndex = nil,
		serverJobsList = CurrentData
	}
end

function ServerJobsChart.willUpdate(p1) --[[ Line: 122 ]]
	if p1.canvasPosConnector then
		p1.canvasPosConnector:Disconnect()
	end
end

function ServerJobsChart.didUpdate(p1) --[[ Line: 128 ]]
	if p1.scrollingRef.current then
		p1.canvasPosConnector = p1.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p1.onCanvasPosChanged)
		local AbsoluteSize = p1.scrollingRef.current.AbsoluteSize
		local AbsScrollSize = p1.state.absScrollSize
		
		if AbsoluteSize.X ~= AbsScrollSize.X or AbsoluteSize.Y ~= AbsScrollSize.Y then
			p1:setState({ absScrollSize = AbsoluteSize })
		end
	end
end

function ServerJobsChart.didMount(p1) --[[ Line: 143 ]]
	p1.statsConnector = p1.props.ServerJobsData:Signal():Connect(function(ServerJobsList) --[[ Line: 144 ]]
		-- upvalues: p1 (copy)
		p1:setState({ serverJobsList = ServerJobsList })
	end)
	
	if p1.scrollingRef.current then
		p1.canvasPosConnector = p1.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p1.onCanvasPosChanged)
		p1:setState({
			absScrollSize = p1.scrollingRef.current.AbsoluteSize,
			canvasPos = p1.scrollingRef.current.CanvasPosition
		})
	end
end

function ServerJobsChart.willUnmount(p1) --[[ Line: 161 ]]
	p1.statsConnector:Disconnect()
	p1.statsConnector = nil
	
	if p1.canvasPosConnector then
		p1.canvasPosConnector:Disconnect()
		p1.canvasPosConnector = nil
	end
end

function ServerJobsChart.render(p1) --[[ Line: 170 ]]
	-- upvalues: MinFrameWidth (copy), RoactModule (copy), ConstantsModule (copy), EntryFrameHeight (copy), LineGraphHeight (copy), CellPadding (copy), CellLabelModule (copy), List1 (copy), List (copy), ChartHeaderNames (copy), list (copy), t (copy), LineWidth (copy), LineColor (copy), BannerButtonModule (copy), LineGraphModule (copy), getX (copy), getDutyCycle (copy), ConvertTimeStampModule (copy), getStepsPerSec (copy), getStepTime (copy), NoResultSearchStr (copy), HeaderButtonModule (copy), HeaderFrameHeight (copy)
	local Frames = {}
	local SearchTerm: string = p1.props.searchTerm
	local Size = p1.props.size
	local LayoutOrder = p1.props.layoutOrder
	local ServerJobsList = p1.state.serverJobsList
	local ReverseSort = p1.state.reverseSort
	local ExpandIndex = p1.state.expandIndex
	local CanvasPos = p1.state.canvasPos
	local AbsScrollSize = p1.state.absScrollSize
	local Largest = AbsScrollSize and math.max(AbsScrollSize.X, MinFrameWidth) or MinFrameWidth
	local CountServerJobsList = #ServerJobsList
	
	if CountServerJobsList == 0 then
		return RoactModule.createElement("TextLabel", {
			Text = "Awaiting Server Jobs Information",
			BackgroundTransparency = 1,
			Size = Size,
			Position = UDim2.new(0, 0, 0, 0),
			TextColor3 = ConstantsModule.Color.Text,
			LayoutOrder = LayoutOrder
		})
	end
	local YOffset = 0
	
	if AbsScrollSize then
		local YOffset1 = -1
		local Total = 0
		
		for i1, value in pairs(ServerJobsList) do
			local Name: string = value.name
			
			if not SearchTerm or string.find(Name:lower(), SearchTerm:lower()) ~= nil then
				local DataStats = value.dataStats
				local BackResult = DataStats.dataSet:back()
				local IsExpandIndexMatch = ExpandIndex == Name
				local NewEntryFrameHeight = IsExpandIndexMatch and EntryFrameHeight + 3 * LineGraphHeight / 2 + CellPadding * 4 or EntryFrameHeight
				
				if CanvasPos.Y <= YOffset + NewEntryFrameHeight then
					if Total < AbsScrollSize.Y then
						local CountServerJobsListDelta = ReverseSort and CountServerJobsList - i1 or i1
						local config = {
							[Name] = RoactModule.createElement(CellLabelModule, { text = Name, size = List1[1], pos = List[1] })
						}
						
						for i2, entry in pairs(BackResult.data) do
							config[ChartHeaderNames[i2]] = RoactModule.createElement(CellLabelModule, {
								text = list[i2](entry),
								size = List1[i2 + 1],
								pos = List[i2 + 1]
							})
						end
						for i3 = 2, #t do
							config[string.format("VerticalLine_%d", i3)] = RoactModule.createElement("Frame", {
								BorderSizePixel = 0,
								Size = UDim2.new(0, LineWidth, 1, 0),
								Position = t[i3],
								BackgroundColor3 = LineColor
							})
						end
						config.lowerHorizontalLine = RoactModule.createElement("Frame", {
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, LineWidth),
							Position = UDim2.new(0, 0, 1, 0),
							BackgroundColor3 = LineColor
						})
						Frames[Name] = RoactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Size = UDim2.new(0, Largest, 0, NewEntryFrameHeight),
							LayoutOrder = CountServerJobsListDelta + 1
						}, {
							Button = RoactModule.createElement(BannerButtonModule, {
								size = UDim2.new(1, 0, 0, EntryFrameHeight),
								pos = UDim2.new(),
								isExpanded = IsExpandIndexMatch,
								onButtonPress = p1.getOnButtonPress(Name)
							}, config),
							DutyCycleGraph = IsExpandIndexMatch and RoactModule.createElement(LineGraphModule, {
								axisLabelX = "Timestamp",
								pos = UDim2.new(0, 0, 0, EntryFrameHeight + CellPadding),
								size = UDim2.new(0, Largest, 0, LineGraphHeight / 2),
								graphData = DataStats.dataSet,
								maxY = DataStats.max[1],
								minY = DataStats.min[1],
								getX = getX,
								getY = getDutyCycle,
								stringFormatX = ConvertTimeStampModule,
								stringFormatY = list[1],
								axisLabelY = Name .. " " .. ChartHeaderNames[2]
							}),
							StepsPerSecGraph = IsExpandIndexMatch and RoactModule.createElement(LineGraphModule, {
								axisLabelX = "Timestamp",
								pos = UDim2.new(0, 0, 0, EntryFrameHeight + LineGraphHeight / 2 + CellPadding * 2),
								size = UDim2.new(0, Largest, 0, LineGraphHeight / 2),
								graphData = DataStats.dataSet,
								maxY = DataStats.max[2],
								minY = DataStats.min[2],
								getX = getX,
								getY = getStepsPerSec,
								stringFormatX = ConvertTimeStampModule,
								stringFormatY = list[2],
								axisLabelY = Name .. " " .. ChartHeaderNames[3]
							}),
							StepTimeGraph = IsExpandIndexMatch and RoactModule.createElement(LineGraphModule, {
								axisLabelX = "Timestamp",
								pos = UDim2.new(0, 0, 0, EntryFrameHeight + LineGraphHeight + CellPadding * 3),
								size = UDim2.new(0, Largest, 0, LineGraphHeight / 2),
								graphData = DataStats.dataSet,
								maxY = DataStats.max[3],
								minY = DataStats.min[3],
								getX = getX,
								getY = getStepTime,
								stringFormatX = ConvertTimeStampModule,
								stringFormatY = list[3],
								axisLabelY = Name .. " " .. ChartHeaderNames[4]
							})
						})
					end
					if YOffset1 < 0 then
						YOffset1 = YOffset
					else
						Total += NewEntryFrameHeight
					end
				end
				YOffset += NewEntryFrameHeight
			end
		end
		if YOffset1 == -1 then
			Frames.emptyResult = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = Size,
				Text = string.format(NoResultSearchStr, SearchTerm),
				TextColor3 = ConstantsModule.Color.Text
			})
		else
			Frames.WindowingPadding = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, YOffset1)
			})
		end
	end
	local Elements = {}
	
	for i = 1, #ChartHeaderNames do
		Elements[ChartHeaderNames[i]] = RoactModule.createElement(HeaderButtonModule, {
			text = ChartHeaderNames[i],
			size = List1[i],
			pos = List[i],
			sortfunction = p1.onSortChanged
		})
	end
	Elements.upperHorizontalLine = RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, LineWidth),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = LineColor
	})
	Elements.lowerHorizontalLine = RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, LineWidth),
		Position = UDim2.new(0, 0, 1, -LineWidth),
		BackgroundColor3 = LineColor
	})
	
	for i4 = 2, #t do
		Elements[string.format("VerticalLine_%d", i4)] = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, LineWidth, 1, 0),
			Position = t[i4],
			BackgroundColor3 = LineColor
		})
	end
	Frames.UIListLayout = RoactModule.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = Size,
		LayoutOrder = LayoutOrder
	}, {
		Header = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, Largest, 0, HeaderFrameHeight)
		}, Elements),
		MainChart = RoactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, -HeaderFrameHeight),
			Position = UDim2.new(0, 0, 0, HeaderFrameHeight),
			BackgroundTransparency = 1,
			VerticalScrollBarInset = 1,
			ScrollBarThickness = 5,
			CanvasSize = UDim2.new(0, Largest, 0, YOffset),
			[RoactModule.Ref] = p1.scrollingRef
		}, Frames)
	})
end

return DataConsumerModule(ServerJobsChart, "ServerJobsData")