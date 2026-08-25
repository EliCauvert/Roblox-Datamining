local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local dataConsumerModule = require(script.Parent.Parent.Parent.Components.DataConsumer)
local headerButtonModule = require(script.Parent.Parent.Parent.Components.HeaderButton)
local serverScriptsEntryModule = require(script.Parent.ServerScriptsEntry)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local chartCellWidths = constantsModule.ServerScriptsFormatting.ChartCellWidths
local chartHeaderNames = constantsModule.ServerScriptsFormatting.ChartHeaderNames
local headerFrameHeight = constantsModule.ServerScriptsFormatting.HeaderFrameHeight
local entryFrameHeight = constantsModule.ServerScriptsFormatting.EntryFrameHeight
local cellPadding = constantsModule.ServerScriptsFormatting.CellPadding
local lineGraphHeight = constantsModule.GeneralFormatting.LineGraphHeight
local noResultSearchStr = constantsModule.GeneralFormatting.NoResultSearchStr
local t = {}
local t_1 = {}
local t_2 = {}
local var8 = 0

for i, v in ipairs(chartCellWidths) do
	table.insert(t, UDim2.new(var8, cellPadding, 0, 0))
	table.insert(t_1, UDim2.new(v, -cellPadding, 0, headerFrameHeight))
	table.insert(t_2, UDim2.new(v, -cellPadding, 0, entryFrameHeight))
	var8 += v
end
local t_3 = {}

for i_1, v_1 in ipairs(t) do
	t_3[i_1] = UDim2.new(v_1.X.Scale, v_1.X.Offset - cellPadding, v_1.Y.Scale, v_1.Y.Offset)
end
local serverScripts = roactModule.Component:extend("ServerScripts")

local function constructHeader(p0)
	-- upvalues: chartHeaderNames (ref), roactModule (ref), headerButtonModule (ref), t_1 (ref), t (ref), lineWidth (ref), lineColor (ref), t_3 (ref), headerFrameHeight (ref)
	local t_2 = {}
	
	for i = 1, #chartHeaderNames do
		t_2[chartHeaderNames[i]] = roactModule.createElement(headerButtonModule, {
			text = chartHeaderNames[i],
			size = t_1[i],
			pos = t[i],
			sortfunction = p0
		})
	end
	t_2.upperHorizontalLine = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, lineWidth),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = lineColor
	})
	t_2.verticalLine1 = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0, lineWidth, 1, 0),
		Position = t_3[2],
		BackgroundColor3 = lineColor
	})
	t_2.verticalLine2 = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0, lineWidth, 1, 0),
		Position = t_3[3],
		BackgroundColor3 = lineColor
	})
	t_2.lowerHorizontalLine = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, lineWidth),
		Position = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = lineColor
	})
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, headerFrameHeight)
	}, t_2)
end

local function getX(p1)
	return p1.time
end

local function getActivity(p2)
	return p2.data[1]
end

local function getRate(p3)
	return p3.data[2]
end

local function formatScriptsData(p4)
	return string.format("%.3f", p4)
end

function serverScripts.init(p5, p6)
	-- upvalues: roactModule (ref)
	local currentData = p6.ServerScriptsData:getCurrentData()
	
	function p5.onSortChanged(p7)
		-- upvalues: p6 (ref), p5 (ref)
		if p7 == p6.ServerScriptsData:getSortType() then
			p5:setState({ reverseSort = not p5.state.reverseSort })
			
			return
		end
		p6.ServerScriptsData:setSortType(p7)
		p5:setState({ reverseSort = false })
	end
	
	function p5.getOnButtonPress(p8)
		-- upvalues: p5 (ref)
		return function(_, _)
			-- upvalues: p5 (copy), p8 (ref)
			p5:setState({ expandIndex = p5.state.expandIndex ~= p8 and p8 })
		end
	end
	
	function p5.onCanvasPosChanged()
		-- upvalues: p5 (ref)
		local canvasPosition = p5.scrollingRef.current.CanvasPosition
		
		if p5.state.canvasPos ~= canvasPosition then
			p5:setState({
				absScrollSize = p5.scrollingRef.current.AbsoluteSize,
				canvasPos = canvasPosition
			})
		end
	end
	
	p5.scrollingRef = roactModule.createRef()
	p5.state = { expandIndex = nil, serverScriptsData = currentData }
end

function serverScripts.willUpdate(p9)
	if p9.canvasPosConnector then
		p9.canvasPosConnector:Disconnect()
	end
end

function serverScripts.didUpdate(p10)
	if p10.scrollingRef.current then
		p10.canvasPosConnector = p10.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p10.onCanvasPosChanged)
	end
end

function serverScripts.didMount(p11)
	p11.statsConnector = p11.props.ServerScriptsData:Signal():Connect(function(p12)
		-- upvalues: p11 (ref)
		p11:setState({ serverScriptsData = p12 })
	end)
	
	if p11.scrollingRef.current then
		p11.canvasPosConnector = p11.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p11.onCanvasPosChanged)
		p11:setState({
			absScrollSize = p11.scrollingRef.current.AbsoluteSize,
			canvasPos = p11.scrollingRef.current.CanvasPosition
		})
	end
end

function serverScripts.willUnmount(p13)
	p13.statsConnector:Disconnect()
	p13.statsConnector = nil
end

function serverScripts.render(p14)
	-- upvalues: roactModule (ref), constantsModule (ref), entryFrameHeight (ref), lineGraphHeight (ref), serverScriptsEntryModule (ref), t_2 (ref), t (ref), t_3 (ref), formatScriptsData (ref), getX (ref), getActivity (ref), getRate (ref), noResultSearchStr (ref), constructHeader (ref), headerFrameHeight (ref)
	local searchTerm = p14.props.searchTerm
	local scriptFilters = p14.props.scriptFilters
	local layoutOrder = p14.props.layoutOrder
	local size = p14.props.size
	local serverScriptsData = p14.state.serverScriptsData
	local reverseSort = p14.state.reverseSort
	local absScrollSize = p14.state.absScrollSize
	local canvasPos = p14.state.canvasPos
	local t_1 = {}
	local serverScriptsDataCount = #serverScriptsData
	
	if serverScriptsDataCount == 0 then
		return roactModule.createElement("TextLabel", {
			Text = "Awaiting Server Scripts Information.",
			BackgroundTransparency = 1,
			Size = size,
			Position = UDim2.new(0, 0, 0, 0),
			TextColor3 = constantsModule.Color.Text,
			LayoutOrder = layoutOrder
		})
	end
	local var20 = 0
	local var21 = -1
	local var22 = 0
	local var23 = 0
	
	if canvasPos and absScrollSize then
		for i, v in pairs(serverScriptsData) do
			if not searchTerm or string.find(v.name:lower(), searchTerm:lower()) ~= nil then
				var23 += 1
				local var24 = true
				local active = scriptFilters.Active
				local inactive = scriptFilters.Inactive
				local var25 = v.dataStats.dataSet:back()
				
				if active ~= inactive then
					if var25.data[1] > 0 and inactive then
						var24 = false
					elseif var25.data[1] == 0 and active then
						var24 = false
					end
				end
				if var24 then
					local var26 = p14.state.expandIndex == v.name
					local var27 = if var26 then entryFrameHeight + 2 * lineGraphHeight else entryFrameHeight
					
					if canvasPos.Y <= var20 + var27 then
						if var22 < absScrollSize.Y then
							t_1[i] = roactModule.createElement(serverScriptsEntryModule, {
								scriptData = v,
								frameHeight = var27,
								showGraph = var26,
								layoutOrder = if reverseSort then serverScriptsDataCount - i else i,
								activityBoxColor = if var25.data[1] > 0 then constantsModule.Color.ActiveBox else constantsModule.Color.InactiveBox,
								entryCellSize = t_2,
								cellOffset = t,
								verticalOffsets = t_3,
								onButtonPress = p14.getOnButtonPress(v.name),
								formatScriptsData = formatScriptsData,
								getX = getX,
								getActivity = getActivity,
								getRate = getRate,
								stringFormatY = formatScriptsData
							})
						end
						if var21 < 0 then
							var21 = var20
						else
							var22 += var27
						end
					end
					var20 += var27
				end
			end
		end
		if var23 > 0 then
			t_1.WindowingPadding = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, var21)
			})
		else
			t_1.emptySearch = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = size,
				Text = string.format(noResultSearchStr, searchTerm),
				TextColor3 = constantsModule.Color.Text
			})
		end
	end
	t_1.UIListLayout = roactModule.createElement("UIListLayout", {
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder
	}, {
		Header = constructHeader(p14.onSortChanged),
		Entries = roactModule.createElement("ScrollingFrame", {
			Position = UDim2.new(0, 0, 0, headerFrameHeight),
			Size = UDim2.new(1, 0, 1, -headerFrameHeight),
			BackgroundTransparency = 1,
			VerticalScrollBarInset = 1,
			ScrollBarThickness = 5,
			CanvasSize = UDim2.new(1, 0, 0, var20),
			[roactModule.Ref] = p14.scrollingRef
		}, t_1)
	})
end

return dataConsumerModule(serverScripts, "ServerScriptsData")