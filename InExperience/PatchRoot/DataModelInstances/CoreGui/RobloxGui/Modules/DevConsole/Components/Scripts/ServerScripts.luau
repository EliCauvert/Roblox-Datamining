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
local var1 = 0

for i, v in ipairs(chartCellWidths) do
	table.insert(t, UDim2.new(var1, cellPadding, 0, 0))
	table.insert(t_1, UDim2.new(v, -cellPadding, 0, headerFrameHeight))
	table.insert(t_2, UDim2.new(v, -cellPadding, 0, entryFrameHeight))
	var1 += v
end
local t_3 = {}

for i_1, v_1 in ipairs(t) do
	t_3[i_1] = UDim2.new(v_1.X.Scale, v_1.X.Offset - cellPadding, v_1.Y.Scale, v_1.Y.Offset)
end
local serverScripts = roactModule.Component:extend("ServerScripts")

local function constructHeader(p1)
	-- upvalues: chartHeaderNames (ref), roactModule (ref), headerButtonModule (ref), t_1 (ref), t (ref), lineWidth (ref), lineColor (ref), t_3 (ref), headerFrameHeight (ref)
	local t_2 = {}
	
	for i = 1, #chartHeaderNames do
		t_2[chartHeaderNames[i]] = roactModule.createElement(headerButtonModule, {
			text = chartHeaderNames[i],
			size = t_1[i],
			pos = t[i],
			sortfunction = p1
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

local function getX(p2)
	return p2.time
end

local function getActivity(p2)
	return p2.data[1]
end

local function getRate(p2)
	return p2.data[2]
end

local function formatScriptsData(p2)
	return string.format("%.3f", p2)
end

function serverScripts.init(p2, p3)
	-- upvalues: roactModule (ref)
	local currentData = p3.ServerScriptsData:getCurrentData()
	
	function p5.onSortChanged(p4)
		-- upvalues: p3 (ref), p2 (ref)
		if p4 == p3.ServerScriptsData:getSortType() then
			p2:setState({ reverseSort = not p2.state.reverseSort })
			
			return
		end
		p3.ServerScriptsData:setSortType(p4)
		p2:setState({ reverseSort = false })
	end
	
	function p5.getOnButtonPress(p4)
		-- upvalues: p2 (ref)
		return function(_, _)
			-- upvalues: p2 (copy), p4 (ref)
			p2:setState({ expandIndex = p2.state.expandIndex ~= p4 and p4 })
		end
	end
	
	function p5.onCanvasPosChanged()
		-- upvalues: p2 (ref)
		local canvasPosition = p2.scrollingRef.current.CanvasPosition
		
		if p2.state.canvasPos ~= canvasPosition then
			p2:setState({
				absScrollSize = p2.scrollingRef.current.AbsoluteSize,
				canvasPos = canvasPosition
			})
		end
	end
	
	p2.scrollingRef = roactModule.createRef()
	p2.state = { expandIndex = nil, serverScriptsData = currentData }
end

function serverScripts.willUpdate(p2)
	if p2.canvasPosConnector then
		p2.canvasPosConnector:Disconnect()
	end
end

function serverScripts.didUpdate(p2)
	if p2.scrollingRef.current then
		p2.canvasPosConnector = p2.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p2.onCanvasPosChanged)
	end
end

function serverScripts.didMount(p2)
	p2.statsConnector = p2.props.ServerScriptsData:Signal():Connect(function(p3)
		-- upvalues: p2 (ref)
		p2:setState({ serverScriptsData = p3 })
	end)
	
	if p2.scrollingRef.current then
		p2.canvasPosConnector = p2.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p2.onCanvasPosChanged)
		p2:setState({
			absScrollSize = p2.scrollingRef.current.AbsoluteSize,
			canvasPos = p2.scrollingRef.current.CanvasPosition
		})
	end
end

function serverScripts.willUnmount(p2)
	p2.statsConnector:Disconnect()
	p2.statsConnector = nil
end

function serverScripts.render(p2)
	-- upvalues: roactModule (ref), constantsModule (ref), entryFrameHeight (ref), lineGraphHeight (ref), serverScriptsEntryModule (ref), t_2 (ref), t (ref), t_3 (ref), formatScriptsData (ref), getX (ref), getActivity (ref), getRate (ref), noResultSearchStr (ref), constructHeader (ref), headerFrameHeight (ref)
	local searchTerm = p2.props.searchTerm
	local scriptFilters = p2.props.scriptFilters
	local layoutOrder = p2.props.layoutOrder
	local size = p2.props.size
	local serverScriptsData = p2.state.serverScriptsData
	local reverseSort = p2.state.reverseSort
	local absScrollSize = p2.state.absScrollSize
	local canvasPos = p2.state.canvasPos
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
	local var2 = 0
	local var3 = -1
	local var4 = 0
	local var5 = 0
	
	if canvasPos and absScrollSize then
		for i, v in pairs(serverScriptsData) do
			if not searchTerm or string.find(v.name:lower(), searchTerm:lower()) ~= nil then
				var5 += 1
				local var6 = true
				local active = scriptFilters.Active
				local inactive = scriptFilters.Inactive
				local var7 = v.dataStats.dataSet:back()
				
				if active ~= inactive then
					if var7.data[1] > 0 and inactive then
						var6 = false
					elseif var7.data[1] == 0 and active then
						var6 = false
					end
				end
				if var6 then
					local var8 = p2.state.expandIndex == v.name
					local var9 = if var8 then entryFrameHeight + 2 * lineGraphHeight else entryFrameHeight
					
					if canvasPos.Y <= var2 + var9 then
						if var4 < absScrollSize.Y then
							t_1[i] = roactModule.createElement(serverScriptsEntryModule, {
								scriptData = v,
								frameHeight = var9,
								showGraph = var8,
								layoutOrder = if reverseSort then serverScriptsDataCount - i else i,
								activityBoxColor = if var7.data[1] > 0 then constantsModule.Color.ActiveBox else constantsModule.Color.InactiveBox,
								entryCellSize = t_2,
								cellOffset = t,
								verticalOffsets = t_3,
								onButtonPress = p2.getOnButtonPress(v.name),
								formatScriptsData = formatScriptsData,
								getX = getX,
								getActivity = getActivity,
								getRate = getRate,
								stringFormatY = formatScriptsData
							})
						end
						if var3 < 0 then
							var3 = var2
						else
							var4 += var9
						end
					end
					var2 += var9
				end
			end
		end
		if var5 > 0 then
			t_1.WindowingPadding = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, var3)
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
		Header = constructHeader(p2.onSortChanged),
		Entries = roactModule.createElement("ScrollingFrame", {
			Position = UDim2.new(0, 0, 0, headerFrameHeight),
			Size = UDim2.new(1, 0, 1, -headerFrameHeight),
			BackgroundTransparency = 1,
			VerticalScrollBarInset = 1,
			ScrollBarThickness = 5,
			CanvasSize = UDim2.new(1, 0, 0, var2),
			[roactModule.Ref] = p2.scrollingRef
		}, t_1)
	})
end

return dataConsumerModule(serverScripts, "ServerScriptsData")