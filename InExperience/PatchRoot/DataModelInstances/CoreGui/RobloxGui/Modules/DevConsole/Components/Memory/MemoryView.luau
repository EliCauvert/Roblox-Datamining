local tweenService = game:GetService("TweenService")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local headerButtonModule = require(script.Parent.Parent.Parent.Components.HeaderButton)
local memoryViewEntryModule = require(script.Parent.MemoryViewEntry)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local chartHeaderNames = constantsModule.MemoryFormatting.ChartHeaderNames
local headerFrameHeight = constantsModule.GeneralFormatting.HeaderFrameHeight
local valueCellWidth = constantsModule.MemoryFormatting.ValueCellWidth
local cellPadding = constantsModule.MemoryFormatting.CellPadding
local valuePadding = constantsModule.MemoryFormatting.ValuePadding
local entryFrameHeight = constantsModule.GeneralFormatting.EntryFrameHeight
local lineGraphHeight = constantsModule.GeneralFormatting.LineGraphHeight
local noResultSearchStr = constantsModule.GeneralFormatting.NoResultSearchStr
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0)
local memoryView = roactModule.Component:extend("MemoryView")

local function getX(p0)
	return p0.time
end

local function getY(p1)
	return p1.data
end

local function formatValueStr(p2)
	return string.format("%.3f", p2)
end

function memoryView.init(p3, p4)
	-- upvalues: entryFrameHeight (ref), tweenService (ref), tweenInfo (ref), roactModule (ref)
	function p3.getOnButtonPress(p5, p6)
		-- upvalues: p3 (ref), entryFrameHeight (copy), tweenService (copy), tweenInfo (copy)
		return function(_, _)
			-- upvalues: p3 (copy), p5 (ref), p6 (ref), entryFrameHeight (copy), tweenService (copy), tweenInfo (copy)
			if p3.state.expandIndex ~= p5 and p5 then
				local current = p3.scrollingRef.current
				
				if current then
					tweenService:Create(current, tweenInfo, {
						CanvasPosition = Vector2.new(0, (p6 - 2.4) * entryFrameHeight)
					}):Play()
				end
			end
			p3:setState({ expandIndex = p3.state.expandIndex ~= p5 and p5 })
		end
	end
	
	function p3.onSortChanged(p7)
		-- upvalues: p4 (ref), p3 (ref)
		if p7 == p4.targetMemoryData:getSortType() then
			p4.targetMemoryData:setSortType(p7)
			p3:setState({ reverseSort = not p3.state.reverseSort })
			
			return
		end
		p4.targetMemoryData:setSortType(p7)
		p3:setState({ reverseSort = false })
	end
	
	function p3.onCanvasPosChanged()
		-- upvalues: p3 (ref)
		local canvasPosition = p3.scrollingRef.current.CanvasPosition
		
		if p3.state.canvasPos ~= canvasPosition then
			p3:setState({
				absScrollSize = p3.scrollingRef.current.AbsoluteSize,
				canvasPos = canvasPosition
			})
		end
	end
	
	p3.scrollingRef = roactModule.createRef()
	p3.state = {
		reverseSort = false,
		expandIndex = false,
		memoryData = p4.targetMemoryData:getMemoryData()
	}
end

function memoryView.willUpdate(p8)
	if p8.canvasPosConnector then
		p8.canvasPosConnector:Disconnect()
	end
end

function memoryView.didUpdate(p9)
	if p9.scrollingRef.current then
		p9.canvasPosConnector = p9.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p9.onCanvasPosChanged)
	end
end

function memoryView.didMount(p10)
	p10.treeViewItemConnector = p10.props.targetMemoryData:treeUpdatedSignal():Connect(function(p11)
		-- upvalues: p10 (ref)
		p10:setState({ memoryData = p11 })
	end)
	
	if p10.scrollingRef.current then
		p10.canvasPosConnector = p10.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p10.onCanvasPosChanged)
		p10:setState({
			absScrollSize = p10.scrollingRef.current.AbsoluteSize,
			canvasPos = p10.scrollingRef.current.CanvasPosition
		})
	end
end

function memoryView.willUnmount(p12)
	p12.treeViewItemConnector:Disconnect()
end

function memoryView.appendAdditionTabInformation(p13, p14, p15, p16, p17, p18)
	-- upvalues: entryFrameHeight (ref), roactModule (ref), memoryViewEntryModule (ref), formatValueStr (ref)
	local canvasPosition = p13.scrollingRef.current.CanvasPosition
	local absoluteSize = p13.scrollingRef.current.AbsoluteSize
	
	for i, v in ipairs(p15) do
		local name = v.name
		local value = v.value
		local text = p16 .. name
		p18.layoutOrder += 1
		
		if canvasPosition.Y <= p18.scrollingFrameHeight + entryFrameHeight and p18.usedFrameSpace < absoluteSize.Y then
			p14[p16 .. name] = roactModule.createElement(memoryViewEntryModule, {
				showGraph = false,
				size = UDim2.new(1, 0, 0, entryFrameHeight),
				depth = p17,
				name = name,
				value = value,
				formatValueStr = formatValueStr,
				layoutOrder = p18.layoutOrder
			})
			
			if p18.paddingHeight < 0 then
				p18.paddingHeight = p18.scrollingFrameHeight
			else
				p18.usedFrameSpace += entryFrameHeight
			end
		end
		p18.scrollingFrameHeight += entryFrameHeight
		
		if v.moreInfo and type(v.moreInfo) == "table" then
			p13:appendAdditionTabInformation(p14, v.moreInfo, text, p17 + 1, p18)
		end
	end
end

function memoryView.recursiveConstructEntries(p19, p20, p21, p22, p23)
	-- upvalues: entryFrameHeight (ref), lineGraphHeight (ref), roactModule (ref), memoryViewEntryModule (ref), formatValueStr (ref), getX (ref), getY (ref)
	assert(p19.scrollingRef.current, "ScrollingFrame not initialized yet")
	local expandIndex = p19.state.expandIndex
	local searchTerm = p19.props.searchTerm or ""
	local reverseSort = p19.state.reverseSort
	local canvasPosition = p19.scrollingRef.current.CanvasPosition
	local absoluteSize = p19.scrollingRef.current.AbsoluteSize
	local name = p21.name
	
	if string.find(name:lower(), searchTerm:lower()) then
		local var12 = expandIndex == name
		local var13 = if var12 then entryFrameHeight + lineGraphHeight else entryFrameHeight
		p23.layoutOrder += 1
		
		if canvasPosition.Y <= p23.scrollingFrameHeight + var13 and p23.usedFrameSpace < absoluteSize.Y then
			p20[name] = roactModule.createElement(memoryViewEntryModule, {
				size = UDim2.new(1, 0, 0, var13),
				depth = p22,
				name = p21.name,
				showGraph = var12,
				dataStats = p21.dataStats,
				onButtonPress = p19.getOnButtonPress(name, p23.layoutOrder),
				formatValueStr = formatValueStr,
				getX = getX,
				getY = getY,
				layoutOrder = p23.layoutOrder
			})
			
			if p23.paddingHeight < 0 then
				p23.paddingHeight = p23.scrollingFrameHeight
			else
				p23.usedFrameSpace += var13
			end
		end
		p23.scrollingFrameHeight += var13
		
		if var12 and p21.dataStats.additionalInfoFunc then
			p19:appendAdditionTabInformation(p20, p21.dataStats.additionalInfoFunc(), p21.name, p22 + 1, p23)
		end
	end
	local sortedChildren = p21.dataStats.sortedChildren
	
	if sortedChildren then
		if reverseSort then
			local sortedChildrenCount = #sortedChildren
			
			for i = 1, sortedChildrenCount do
				p19:recursiveConstructEntries(p20, sortedChildren[sortedChildrenCount - i + 1], p22 + 1, p23)
			end
			return
		else
			for i_1, v in ipairs(sortedChildren) do
				p19:recursiveConstructEntries(p20, v, p22 + 1, p23)
			end
		end
	end
end

function memoryView.render(p24)
	-- upvalues: roactModule (ref), constantsModule (ref), noResultSearchStr (ref), headerFrameHeight (ref), headerButtonModule (ref), chartHeaderNames (ref), valueCellWidth (ref), valuePadding (ref), cellPadding (ref), lineColor (ref), lineWidth (ref)
	local t = {}
	local layoutOrder = p24.props.layoutOrder
	local size = p24.props.size
	local searchTerm = p24.props.searchTerm or ""
	local t_1 = {
		scrollingFrameHeight = 0,
		paddingHeight = -1,
		usedFrameSpace = 0,
		layoutOrder = 1
	}
	
	if p24.scrollingRef.current then
		for i, v in ipairs(p24.state.memoryData) do
			p24:recursiveConstructEntries(t, v, 0, t_1)
		end
		t.UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
		t.WindowingPadding = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, t_1.paddingHeight)
		})
	end
	if t_1.layoutOrder == 1 then
		if searchTerm == "" then
			t.noDataMessage = roactModule.createElement("TextLabel", {
				Text = "Awaiting Memory Stats",
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				TextColor3 = constantsModule.Color.Text,
				LayoutOrder = layoutOrder
			})
		else
			t.noDataMessage = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				Text = string.format(noResultSearchStr, searchTerm),
				TextColor3 = constantsModule.Color.Text,
				LayoutOrder = layoutOrder
			})
		end
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder
	}, {
		Header = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, headerFrameHeight)
		}, {
			Name = roactModule.createElement(headerButtonModule, {
				text = chartHeaderNames[1],
				size = UDim2.new(1 - valueCellWidth, (-valuePadding) - cellPadding, 0, headerFrameHeight),
				pos = UDim2.new(0, cellPadding, 0, 0),
				sortfunction = p24.onSortChanged
			}),
			ValueMB = roactModule.createElement(headerButtonModule, {
				text = chartHeaderNames[2],
				size = UDim2.new(valueCellWidth, -cellPadding, 0, headerFrameHeight),
				pos = UDim2.new(1 - valueCellWidth, valuePadding, 0, 0),
				sortfunction = p24.onSortChanged
			}),
			TopHorizontal = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundColor3 = lineColor
			}),
			LowerHorizontal = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, lineWidth),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = lineColor
			}),
			vertical = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, lineWidth, 1, 0),
				Position = UDim2.new(1 - valueCellWidth, 0, 0, 0),
				BackgroundColor3 = lineColor
			})
		}),
		Entries = roactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, -headerFrameHeight),
			Position = UDim2.new(0, 0, 0, headerFrameHeight),
			BackgroundTransparency = 1,
			VerticalScrollBarInset = 1,
			ScrollBarThickness = 5,
			CanvasSize = UDim2.new(1, 0, 0, t_1.scrollingFrameHeight),
			[roactModule.Ref] = p24.scrollingRef
		}, t)
	})
end

return memoryView