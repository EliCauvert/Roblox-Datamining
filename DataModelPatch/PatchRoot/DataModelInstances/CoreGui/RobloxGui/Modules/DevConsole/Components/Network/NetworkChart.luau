local TextService = game:GetService("TextService")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local ChartHeaderNames = ConstantsModule.NetworkFormatting.ChartHeaderNames
local ChartCellWidths = ConstantsModule.NetworkFormatting.ChartCellWidths
local CellPadding: number = ConstantsModule.NetworkFormatting.CellPadding
local HeaderFrameHeight = ConstantsModule.NetworkFormatting.HeaderFrameHeight
local EntryFrameHeight = ConstantsModule.NetworkFormatting.EntryFrameHeight
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local MainWindow = ConstantsModule.DefaultFontSize.MainWindow
local MainWindow1 = ConstantsModule.Font.MainWindow
local ResponseStrHeight = ConstantsModule.NetworkFormatting.ResponseStrHeight
local ResponseWidthRatio = ConstantsModule.NetworkFormatting.ResponseWidthRatio
local HeaderButtonModule = require(script.Parent.Parent.Parent.Components.HeaderButton)
local NetworkChartEntryModule = require(script.Parent.NetworkChartEntry)
local Total = 0

for _, chartCellWidth in pairs(ChartCellWidths) do
	Total += chartCellWidth
end
local Total1 = 0
local List = {}
local List1 = {}
local List2 = {}

for _, chartCellWidth1 in ipairs(ChartCellWidths) do
	table.insert(List, UDim2.new(0, Total1 + CellPadding, 0, 0))
	table.insert(List1, UDim2.new(0, chartCellWidth1 - CellPadding, 0, HeaderFrameHeight))
	table.insert(List2, UDim2.new(0, chartCellWidth1 - CellPadding, 0, EntryFrameHeight))
	Total1 += chartCellWidth1
end
table.insert(List, UDim2.new(0, Total1 + CellPadding, 0, 0))
table.insert(List1, UDim2.new(1, -Total - CellPadding, 0, HeaderFrameHeight))
table.insert(List2, UDim2.new(1, -Total - CellPadding, 0, EntryFrameHeight))
local VerticalOffsets = {}

for i, Vector in ipairs(List) do
	VerticalOffsets[i] = UDim2.new(Vector.X.Scale, Vector.X.Offset - CellPadding, Vector.Y.Scale, Vector.Y.Offset)
end
local NetworkChart = RoactModule.Component:extend("NetworkChart")

function NetworkChart.init(p1)
	-- upvalues: RoactModule (copy)
	function p1.getOnExpandEntry(Num)
		-- upvalues: p1 (copy)
		return function(_, _)
			-- upvalues: p1 (upval), Num (copy)
			p1:setState({ expandIndex = p1.state.expandIndex ~= Num and Num })
		end
	end
	
	function p1.onCanvasPosChanged()
		-- upvalues: p1 (copy)
		local CanvasPosition = p1.scrollingRef.current.CanvasPosition
		
		if p1.state.canvasPos ~= CanvasPosition then
			p1:setState({
				absScrollSize = p1.scrollingRef.current.AbsoluteSize,
				canvasPos = CanvasPosition
			})
		end
	end
	
	p1.ref = RoactModule.createRef()
	p1.scrollingRef = RoactModule.createRef()
	p1.state = { expandIndex = false }
end

function NetworkChart.willUpdate(p1)
	if p1.canvasPosConnector then
		p1.canvasPosConnector:Disconnect()
	end
end

function NetworkChart.didUpdate(p1)
	if p1.scrollingRef.current then
		p1.canvasPosConnector = p1.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p1.onCanvasPosChanged)
		local AbsoluteSize = p1.scrollingRef.current.AbsoluteSize
		
		if p1.state.absScrollSize ~= AbsoluteSize then
			p1:setState({ absScrollSize = AbsoluteSize })
		end
	end
end

function NetworkChart.didMount(p1)
	if p1.scrollingRef.current then
		p1.canvasPosConnector = p1.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p1.onCanvasPosChanged)
		p1:setState({
			absScrollSize = p1.scrollingRef.current.AbsoluteSize,
			canvasPos = p1.scrollingRef.current.CanvasPosition
		})
	end
end

function NetworkChart.render(p1)
	-- upvalues: ChartHeaderNames (copy), RoactModule (copy), HeaderButtonModule (copy), List1 (copy), List (copy), VerticalOffsets (copy), LineWidth (copy), HeaderFrameHeight (copy), LineColor (copy), EntryFrameHeight (copy), ResponseStrHeight (copy), ResponseWidthRatio (copy), TextService (copy), MainWindow (copy), MainWindow1 (copy), NetworkChartEntryModule (copy), List2 (copy), ConstantsModule (copy)
	local HttpEntryList = p1.props.httpEntryList or {}
	local ChartHeight = p1.props.chartHeight
	local Width = p1.props.width
	local SearchTerm: string = p1.props.searchTerm
	local LayoutOrder = p1.props.layoutOrder
	local ReverseSort = p1.props.reverseSort
	local OnSortChanged = p1.props.onSortChanged
	local ExpandIndex = p1.state.expandIndex
	local AbsScrollSize = p1.state.absScrollSize
	local CanvasPos = p1.state.canvasPos
	local Elements = {}
	
	for i, chartHeaderName in ipairs(ChartHeaderNames) do
		Elements[chartHeaderName] = RoactModule.createElement(HeaderButtonModule, {
			text = chartHeaderName,
			size = List1[i],
			pos = List[i],
			sortfunction = OnSortChanged
		})
	end
	for i1 = 2, #VerticalOffsets do
		Elements[string.format("VerticalLine_%d", i1)] = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, LineWidth, 0, HeaderFrameHeight),
			Position = VerticalOffsets[i1],
			BackgroundColor3 = LineColor
		})
	end
	local YOffset2 = 0
	local YOffset = -1
	local Total = 0
	local CountHttpEntryList = #HttpEntryList
	local Count = 0
	local config = {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	if CanvasPos and AbsScrollSize then
		for i2, Entry in ipairs(HttpEntryList) do
			local IsSearchTermMatch: boolean = SearchTerm == "" or (string.find(Entry.RequestType:lower(), SearchTerm:lower()) ~= nil or string.find(Entry.Url:lower(), SearchTerm:lower()) ~= nil)
			
			if Entry.RequestType ~= "Default" and IsSearchTermMatch then
				Count += 1
				local IsExpandIndexMatch = ExpandIndex == Entry.Num
				local YOffset1: number = EntryFrameHeight
				local NewY = 0
				
				if IsExpandIndexMatch then
					YOffset1 += ResponseStrHeight
					
					if p1.ref.current then
						NewY = ResponseStrHeight + TextService:GetTextSize(Entry.Response, MainWindow, MainWindow1, (Vector2.new(p1.ref.current.AbsoluteSize.X * ResponseWidthRatio, 100000000))).Y
						YOffset1 += NewY
					end
				end
				if CanvasPos.Y <= YOffset2 + YOffset1 then
					if Total < AbsScrollSize.Y then
						config[i2] = RoactModule.createElement(NetworkChartEntryModule, {
							size = UDim2.new(1, 0, 0, YOffset1),
							entry = Entry,
							entryCellSize = List2,
							cellOffset = List,
							verticalOffsets = VerticalOffsets,
							showResponse = IsExpandIndexMatch,
							responseBodyHeight = NewY,
							layoutOrder = (ReverseSort and CountHttpEntryList - i2 or i2) + 1,
							onButtonPress = p1.getOnExpandEntry(Entry.Num)
						})
					end
					if YOffset < 0 then
						YOffset = YOffset2
					else
						Total += YOffset1
					end
				end
				YOffset2 += YOffset1
			end
		end
		if Count > 0 then
			config.WindowingPadding = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, YOffset)
			})
		end
	end
	if CountHttpEntryList == 0 or Count == 0 then
		config["NONE FOUND"] = RoactModule.createElement("TextLabel", {
			Text = "No Network Entries Found",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, ChartHeight),
			TextColor3 = ConstantsModule.Color.Text
		})
	end
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, ChartHeight),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		LayoutOrder = LayoutOrder,
		[RoactModule.Ref] = p1.ref
	}, {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Header = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, HeaderFrameHeight)
		}, Elements),
		HorizontalLine_1 = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, LineWidth),
			BackgroundColor3 = LineColor
		}),
		scrollingFrameEntries = RoactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, -HeaderFrameHeight),
			CanvasSize = UDim2.new(0, Width, 0, YOffset2),
			ScrollBarThickness = 6,
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			[RoactModule.Ref] = p1.scrollingRef
		}, config)
	})
end

return NetworkChart