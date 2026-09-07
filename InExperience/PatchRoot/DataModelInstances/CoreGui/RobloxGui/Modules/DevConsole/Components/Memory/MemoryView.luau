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

local function getX(p1)
	return p1.time
end

local function getY(p1)
	return p1.data
end

local function formatValueStr(p1)
	return string.format("%.3f", p1)
end

function memoryView.init(p1, p2)
	-- upvalues: entryFrameHeight (ref), tweenService (ref), tweenInfo (ref), roactModule (ref)
	function p3.getOnButtonPress(p3, p4)
		-- upvalues: p1 (ref), entryFrameHeight (copy), tweenService (copy), tweenInfo (copy)
		return function(_, _)
			-- upvalues: p1 (copy), p3 (ref), p4 (ref), entryFrameHeight (copy), tweenService (copy), tweenInfo (copy)
			if p1.state.expandIndex ~= p3 and p3 then
				local current = p1.scrollingRef.current
				
				if current then
					tweenService:Create(current, tweenInfo, {
						CanvasPosition = Vector2.new(0, (p4 - 2.4) * entryFrameHeight)
					}):Play()
				end
			end
			p1:setState({ expandIndex = p1.state.expandIndex ~= p3 and p3 })
		end
	end
	
	function p3.onSortChanged(p3)
		-- upvalues: p2 (ref), p1 (ref)
		if p3 == p2.targetMemoryData:getSortType() then
			p2.targetMemoryData:setSortType(p3)
			p1:setState({ reverseSort = not p1.state.reverseSort })
			
			return
		end
		p2.targetMemoryData:setSortType(p3)
		p1:setState({ reverseSort = false })
	end
	
	function p3.onCanvasPosChanged()
		-- upvalues: p1 (ref)
		local canvasPosition = p1.scrollingRef.current.CanvasPosition
		
		if p1.state.canvasPos ~= canvasPosition then
			p1:setState({
				absScrollSize = p1.scrollingRef.current.AbsoluteSize,
				canvasPos = canvasPosition
			})
		end
	end
	
	p1.scrollingRef = roactModule.createRef()
	p1.state = {
		reverseSort = false,
		expandIndex = false,
		memoryData = p2.targetMemoryData:getMemoryData()
	}
end

function memoryView.willUpdate(p1)
	if p1.canvasPosConnector then
		p1.canvasPosConnector:Disconnect()
	end
end

function memoryView.didUpdate(p1)
	if p1.scrollingRef.current then
		p1.canvasPosConnector = p1.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p1.onCanvasPosChanged)
	end
end

function memoryView.didMount(p1)
	p1.treeViewItemConnector = p1.props.targetMemoryData:treeUpdatedSignal():Connect(function(p2)
		-- upvalues: p1 (ref)
		p1:setState({ memoryData = p2 })
	end)
	
	if p1.scrollingRef.current then
		p1.canvasPosConnector = p1.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p1.onCanvasPosChanged)
		p1:setState({
			absScrollSize = p1.scrollingRef.current.AbsoluteSize,
			canvasPos = p1.scrollingRef.current.CanvasPosition
		})
	end
end

function memoryView.willUnmount(p1)
	p1.treeViewItemConnector:Disconnect()
end

function memoryView.appendAdditionTabInformation(p1, p2, p3, p4, p5, p6)
	-- upvalues: entryFrameHeight (ref), roactModule (ref), memoryViewEntryModule (ref), formatValueStr (ref)
	local canvasPosition = p1.scrollingRef.current.CanvasPosition
	local absoluteSize = p1.scrollingRef.current.AbsoluteSize
	
	for i, v in ipairs(p3) do
		local name = v.name
		local value = v.value
		local text = p4 .. name
		p6.layoutOrder += 1
		
		if canvasPosition.Y <= p6.scrollingFrameHeight + entryFrameHeight and p6.usedFrameSpace < absoluteSize.Y then
			p2[p4 .. name] = roactModule.createElement(memoryViewEntryModule, {
				showGraph = false,
				size = UDim2.new(1, 0, 0, entryFrameHeight),
				depth = p5,
				name = name,
				value = value,
				formatValueStr = formatValueStr,
				layoutOrder = p6.layoutOrder
			})
			
			if p6.paddingHeight < 0 then
				p6.paddingHeight = p6.scrollingFrameHeight
			else
				p6.usedFrameSpace += entryFrameHeight
			end
		end
		p6.scrollingFrameHeight += entryFrameHeight
		
		if v.moreInfo and type(v.moreInfo) == "table" then
			p1:appendAdditionTabInformation(p2, v.moreInfo, text, p5 + 1, p6)
		end
	end
end

function memoryView.recursiveConstructEntries(p7, p8, p9, p10, p11)
	-- upvalues: entryFrameHeight (ref), lineGraphHeight (ref), roactModule (ref), memoryViewEntryModule (ref), formatValueStr (ref), getX (ref), getY (ref)
	assert(p7.scrollingRef.current, "ScrollingFrame not initialized yet")
	local expandIndex = p7.state.expandIndex
	local searchTerm = p7.props.searchTerm or ""
	local reverseSort = p7.state.reverseSort
	local canvasPosition = p7.scrollingRef.current.CanvasPosition
	local absoluteSize = p7.scrollingRef.current.AbsoluteSize
	local name = p9.name
	
	if string.find(name:lower(), searchTerm:lower()) then
		local var1 = expandIndex == name
		local var2 = if var1 then entryFrameHeight + lineGraphHeight else entryFrameHeight
		p11.layoutOrder += 1
		
		if canvasPosition.Y <= p11.scrollingFrameHeight + var2 and p11.usedFrameSpace < absoluteSize.Y then
			p8[name] = roactModule.createElement(memoryViewEntryModule, {
				size = UDim2.new(1, 0, 0, var2),
				depth = p10,
				name = p9.name,
				showGraph = var1,
				dataStats = p9.dataStats,
				onButtonPress = p7.getOnButtonPress(name, p11.layoutOrder),
				formatValueStr = formatValueStr,
				getX = getX,
				getY = getY,
				layoutOrder = p11.layoutOrder
			})
			
			if p11.paddingHeight < 0 then
				p11.paddingHeight = p11.scrollingFrameHeight
			else
				p11.usedFrameSpace += var2
			end
		end
		p11.scrollingFrameHeight += var2
		
		if var1 and p9.dataStats.additionalInfoFunc then
			p7:appendAdditionTabInformation(p8, p9.dataStats.additionalInfoFunc(), p9.name, p10 + 1, p11)
		end
	end
	local sortedChildren = p9.dataStats.sortedChildren
	
	if sortedChildren then
		if reverseSort then
			local sortedChildrenCount = #sortedChildren
			
			for i = 1, sortedChildrenCount do
				p7:recursiveConstructEntries(p8, sortedChildren[sortedChildrenCount - i + 1], p10 + 1, p11)
			end
			return
		else
			for i_1, v in ipairs(sortedChildren) do
				p7:recursiveConstructEntries(p8, v, p10 + 1, p11)
			end
		end
	end
end

function memoryView.render(p12)
	-- upvalues: roactModule (ref), constantsModule (ref), noResultSearchStr (ref), headerFrameHeight (ref), headerButtonModule (ref), chartHeaderNames (ref), valueCellWidth (ref), valuePadding (ref), cellPadding (ref), lineColor (ref), lineWidth (ref)
	local t = {}
	local layoutOrder = p12.props.layoutOrder
	local size = p12.props.size
	local searchTerm = p12.props.searchTerm or ""
	local t_1 = {
		scrollingFrameHeight = 0,
		paddingHeight = -1,
		usedFrameSpace = 0,
		layoutOrder = 1
	}
	
	if p12.scrollingRef.current then
		for i, v in ipairs(p12.state.memoryData) do
			p12:recursiveConstructEntries(t, v, 0, t_1)
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
				sortfunction = p12.onSortChanged
			}),
			ValueMB = roactModule.createElement(headerButtonModule, {
				text = chartHeaderNames[2],
				size = UDim2.new(valueCellWidth, -cellPadding, 0, headerFrameHeight),
				pos = UDim2.new(1 - valueCellWidth, valuePadding, 0, 0),
				sortfunction = p12.onSortChanged
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
			[roactModule.Ref] = p12.scrollingRef
		}, t)
	})
end

return memoryView