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
local var5 = 0

for i, v in pairs(chartCellWidths) do
	var5 += v
end
local var6 = 0
local t = {}
local t_1 = {}
local t_2 = {}

for i_1, v_1 in ipairs(chartCellWidths) do
	table.insert(t, UDim2.new(0, var6 + cellPadding, 0, 0))
	table.insert(t_1, UDim2.new(0, v_1 - cellPadding, 0, headerFrameHeight))
	table.insert(t_2, UDim2.new(0, v_1 - cellPadding, 0, entryFrameHeight))
	var6 += v_1
end
table.insert(t, UDim2.new(0, var6 + cellPadding, 0, 0))
table.insert(t_1, UDim2.new(1, (-var5) - cellPadding, 0, headerFrameHeight))
table.insert(t_2, UDim2.new(1, (-var5) - cellPadding, 0, entryFrameHeight))
local t_3 = {}

for i_2, v_2 in ipairs(t) do
	t_3[i_2] = UDim2.new(v_2.X.Scale, v_2.X.Offset - cellPadding, v_2.Y.Scale, v_2.Y.Offset)
end
local networkChart = roactModule.Component:extend("NetworkChart")

function networkChart.init(p0) --[[ line: 57 ]]
	-- upvalues: roactModule (ref)
	function p0.getOnExpandEntry(p1) --[[ line: 58 ]]
		-- upvalues: p0 (ref)
		return function(_, _) --[[ line: 59 ]]
			-- upvalues: p0 (copy), p1 (ref)
			p0:setState({ expandIndex = p0.state.expandIndex ~= p1 and p1 })
		end
	end
	
	function p0.onCanvasPosChanged() --[[ line: 66 ]]
		-- upvalues: p0 (ref)
		local canvasPosition = p0.scrollingRef.current.CanvasPosition
		
		if p0.state.canvasPos ~= canvasPosition then
			p0:setState({
				absScrollSize = p0.scrollingRef.current.AbsoluteSize,
				canvasPos = canvasPosition
			})
		end
	end
	
	p0.ref = roactModule.createRef()
	p0.scrollingRef = roactModule.createRef()
	p0.state = { expandIndex = false }
end

function networkChart.willUpdate(p2) --[[ line: 84 ]]
	if p2.canvasPosConnector then
		p2.canvasPosConnector:Disconnect()
	end
end

function networkChart.didUpdate(p3) --[[ line: 90 ]]
	if p3.scrollingRef.current then
		p3.canvasPosConnector = p3.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p3.onCanvasPosChanged)
		local absoluteSize = p3.scrollingRef.current.AbsoluteSize
		
		if p3.state.absScrollSize ~= absoluteSize then
			p3:setState({ absScrollSize = absoluteSize })
		end
	end
end

function networkChart.didMount(p4) --[[ line: 104 ]]
	if p4.scrollingRef.current then
		p4.canvasPosConnector = p4.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p4.onCanvasPosChanged)
		p4:setState({
			absScrollSize = p4.scrollingRef.current.AbsoluteSize,
			canvasPos = p4.scrollingRef.current.CanvasPosition
		})
	end
end

function networkChart.render(p5) --[[ line: 116 ]]
	-- upvalues: chartHeaderNames (ref), roactModule (ref), headerButtonModule (ref), t_1 (ref), t (ref), t_3 (ref), lineWidth (ref), headerFrameHeight (ref), lineColor (ref), entryFrameHeight (ref), responseStrHeight (ref), responseWidthRatio (ref), textService (ref), mainWindow (ref), mainWindow_1 (ref), networkChartEntryModule (ref), t_2 (ref), constantsModule (ref)
	local httpEntryList = p5.props.httpEntryList or {}
	local chartHeight = p5.props.chartHeight
	local width = p5.props.width
	local searchTerm = p5.props.searchTerm
	local layoutOrder = p5.props.layoutOrder
	local reverseSort = p5.props.reverseSort
	local onSortChanged = p5.props.onSortChanged
	local expandIndex = p5.state.expandIndex
	local absScrollSize = p5.state.absScrollSize
	local canvasPos = p5.state.canvasPos
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
	local var15 = 0
	local var16 = -1
	local var17 = 0
	local httpEntryListCount = #httpEntryList
	local var19 = 0
	
	if canvasPos and absScrollSize then
		for i_2, v_1 in ipairs(httpEntryList) do
			if v_1.RequestType ~= "Default" and (if searchTerm ~= "" then if string.find(v_1.RequestType:lower(), searchTerm:lower()) == nil then string.find(v_1.Url:lower(), searchTerm:lower()) ~= nil else true else true) then
				var19 += 1
				local var20 = expandIndex == v_1.Num
				local var21 = entryFrameHeight
				local var22 = 0
				
				if var20 then
					var21 += responseStrHeight
					
					if p5.ref.current then
						var22 = responseStrHeight + textService:GetTextSize(v_1.Response, mainWindow, mainWindow_1, Vector2.new(p5.ref.current.AbsoluteSize.X * responseWidthRatio, 100000000)).Y
						var21 += var22
					end
				end
				if canvasPos.Y <= var15 + var21 then
					if var17 < absScrollSize.Y then
						t_5[i_2] = roactModule.createElement(networkChartEntryModule, {
							size = UDim2.new(1, 0, 0, var21),
							entry = v_1,
							entryCellSize = t_2,
							cellOffset = t,
							verticalOffsets = t_3,
							showResponse = var20,
							responseBodyHeight = var22,
							layoutOrder = (if reverseSort then httpEntryListCount - i_2 else i_2) + 1,
							onButtonPress = p5.getOnExpandEntry(v_1.Num)
						})
					end
					if var16 < 0 then
						var16 = var15
					else
						var17 += var21
					end
				end
				var15 += var21
			end
		end
		if var19 > 0 then
			t_5.WindowingPadding = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, var16)
			})
		end
	end
	if httpEntryListCount == 0 or var19 == 0 then
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
		[roactModule.Ref] = p5.ref
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
			CanvasSize = UDim2.new(0, width, 0, var15),
			ScrollBarThickness = 6,
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			[roactModule.Ref] = p5.scrollingRef
		}, t_5)
	})
end

return networkChart