local textService = game:GetService("TextService")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local chartHeaderNames = constantsModule.NetworkFormatting.ChartHeaderNames
local chartCellWidths = constantsModule.NetworkFormatting.ChartCellWidths
local cellPadding = constantsModule.NetworkFormatting.CellPadding
local headerFrameHeight = constantsModule.NetworkFormatting.HeaderFrameHeight
local entryFrameHeight = constantsModule.NetworkFormatting.EntryFrameHeight
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local mainWindow = constantsModule.DefaultFontSize.MainWindow
local mainWindow_1 = constantsModule.Font.MainWindow
local responseStrHeight = constantsModule.NetworkFormatting.ResponseStrHeight
local responseWidthRatio = constantsModule.NetworkFormatting.ResponseWidthRatio
local headerButtonModule = require(script.Parent.Parent.Parent.Components.HeaderButton)
local networkChartEntryModule = require(script.Parent.NetworkChartEntry)
local var1 = 0

for i, v in pairs(chartCellWidths) do
	var1 += v
end
local var2 = 0
local t = {}
local t_1 = {}
local t_2 = {}

for i_1, v_1 in ipairs(chartCellWidths) do
	table.insert(t, UDim2.new(0, var2 + cellPadding, 0, 0))
	table.insert(t_1, UDim2.new(0, v_1 - cellPadding, 0, headerFrameHeight))
	table.insert(t_2, UDim2.new(0, v_1 - cellPadding, 0, entryFrameHeight))
	var2 += v_1
end
table.insert(t, UDim2.new(0, var2 + cellPadding, 0, 0))
table.insert(t_1, UDim2.new(1, (-var1) - cellPadding, 0, headerFrameHeight))
table.insert(t_2, UDim2.new(1, (-var1) - cellPadding, 0, entryFrameHeight))
local t_3 = {}

for i_2, v_2 in ipairs(t) do
	t_3[i_2] = UDim2.new(v_2.X.Scale, v_2.X.Offset - cellPadding, v_2.Y.Scale, v_2.Y.Offset)
end
local networkChart = roactModule.Component:extend("NetworkChart")

function networkChart.init(p1)
	-- upvalues: roactModule (ref)
	function p0.getOnExpandEntry(p2)
		-- upvalues: p1 (ref)
		return function(_, _)
			-- upvalues: p1 (copy), p2 (ref)
			p1:setState({ expandIndex = p1.state.expandIndex ~= p2 and p2 })
		end
	end
	
	function p0.onCanvasPosChanged()
		-- upvalues: p1 (ref)
		local canvasPosition = p1.scrollingRef.current.CanvasPosition
		
		if p1.state.canvasPos ~= canvasPosition then
			p1:setState({
				absScrollSize = p1.scrollingRef.current.AbsoluteSize,
				canvasPos = canvasPosition
			})
		end
	end
	
	p1.ref = roactModule.createRef()
	p1.scrollingRef = roactModule.createRef()
	p1.state = { expandIndex = false }
end

function networkChart.willUpdate(p1)
	if p1.canvasPosConnector then
		p1.canvasPosConnector:Disconnect()
	end
end

function networkChart.didUpdate(p1)
	if p1.scrollingRef.current then
		p1.canvasPosConnector = p1.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p1.onCanvasPosChanged)
		local absoluteSize = p1.scrollingRef.current.AbsoluteSize
		
		if p1.state.absScrollSize ~= absoluteSize then
			p1:setState({ absScrollSize = absoluteSize })
		end
	end
end

function networkChart.didMount(p1)
	if p1.scrollingRef.current then
		p1.canvasPosConnector = p1.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p1.onCanvasPosChanged)
		p1:setState({
			absScrollSize = p1.scrollingRef.current.AbsoluteSize,
			canvasPos = p1.scrollingRef.current.CanvasPosition
		})
	end
end

function networkChart.render(p1)
	-- upvalues: chartHeaderNames (ref), roactModule (ref), headerButtonModule (ref), t_1 (ref), t (ref), t_3 (ref), lineWidth (ref), headerFrameHeight (ref), lineColor (ref), entryFrameHeight (ref), responseStrHeight (ref), responseWidthRatio (ref), textService (ref), mainWindow (ref), mainWindow_1 (ref), networkChartEntryModule (ref), t_2 (ref), constantsModule (ref)
	local httpEntryList = p1.props.httpEntryList or {}
	local chartHeight = p1.props.chartHeight
	local width = p1.props.width
	local searchTerm = p1.props.searchTerm
	local layoutOrder = p1.props.layoutOrder
	local reverseSort = p1.props.reverseSort
	local onSortChanged = p1.props.onSortChanged
	local expandIndex = p1.state.expandIndex
	local absScrollSize = p1.state.absScrollSize
	local canvasPos = p1.state.canvasPos
	local t_4 = {}
	
	for i, v in ipairs(chartHeaderNames) do
		t_4[v] = roactModule.createElement(headerButtonModule, {
			text = v,
			size = t_1[i],
			pos = t[i],
			sortfunction = onSortChanged
		})
	end
	for i_1 = 2, #t_3 do
		t_4[string.format("VerticalLine_%d", i_1)] = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, lineWidth, 0, headerFrameHeight),
			Position = t_3[i_1],
			BackgroundColor3 = lineColor
		})
	end
	local t_5 = {
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local var3 = 0
	local var4 = -1
	local var5 = 0
	local httpEntryListCount = #httpEntryList
	local var6 = 0
	
	if canvasPos and absScrollSize then
		for i_2, v_1 in ipairs(httpEntryList) do
			if v_1.RequestType ~= "Default" and (if searchTerm ~= "" then if string.find(v_1.RequestType:lower(), searchTerm:lower()) == nil then string.find(v_1.Url:lower(), searchTerm:lower()) ~= nil else true else true) then
				var6 += 1
				local var7 = expandIndex == v_1.Num
				local var8 = entryFrameHeight
				local var9 = 0
				
				if var7 then
					var8 += responseStrHeight
					
					if p1.ref.current then
						var9 = responseStrHeight + textService:GetTextSize(v_1.Response, mainWindow, mainWindow_1, Vector2.new(p1.ref.current.AbsoluteSize.X * responseWidthRatio, 100000000)).Y
						var8 += var9
					end
				end
				if canvasPos.Y <= var3 + var8 then
					if var5 < absScrollSize.Y then
						t_5[i_2] = roactModule.createElement(networkChartEntryModule, {
							size = UDim2.new(1, 0, 0, var8),
							entry = v_1,
							entryCellSize = t_2,
							cellOffset = t,
							verticalOffsets = t_3,
							showResponse = var7,
							responseBodyHeight = var9,
							layoutOrder = (if reverseSort then httpEntryListCount - i_2 else i_2) + 1,
							onButtonPress = p1.getOnExpandEntry(v_1.Num)
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
		if var6 > 0 then
			t_5.WindowingPadding = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, var4)
			})
		end
	end
	if httpEntryListCount == 0 or var6 == 0 then
		t_5["NONE FOUND"] = roactModule.createElement("TextLabel", {
			Text = "No Network Entries Found",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, chartHeight),
			TextColor3 = constantsModule.Color.Text
		})
	end
	return roactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, chartHeight),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		LayoutOrder = layoutOrder,
		[roactModule.Ref] = p1.ref
	}, {
		Layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Header = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, headerFrameHeight)
		}, t_4),
		HorizontalLine_1 = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, lineWidth),
			BackgroundColor3 = lineColor
		}),
		scrollingFrameEntries = roactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, -headerFrameHeight),
			CanvasSize = UDim2.new(0, width, 0, var3),
			ScrollBarThickness = 6,
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			[roactModule.Ref] = p1.scrollingRef
		}, t_5)
	})
end

return networkChart